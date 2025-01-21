#!/usr/bin/env python 3.11.0
# -*-coding:utf-8 -*-
# @Author  : Shuang (Twist) Song
# @Contact   : SongshGeo@gmail.com
# GitHub   : https://github.com/SongshGeo
# Website: https://cv.songshgeo.com/

import re
import sys
from pathlib import Path


def find_markdown_files(root_dir):
    """递归查找所有 markdown 文件，忽略 node_modules 目录"""
    ignore_patterns = {
        'node_modules',
        '.git',
        '.obsidian',
        'dist',
        'build'
    }
    markdown_files = []
    for file in Path(root_dir).rglob("*.md"):
        # 检查文件路径中是否包含需要忽略的目录
        if not any(pattern in file.parts for pattern in ignore_patterns):
            markdown_files.append(file)
    return markdown_files


def remove_code_blocks(content):
    """移除代码块中的内容"""
    # 移除多行代码块
    content = re.sub(r'```.*?```', '', content, flags=re.DOTALL)
    # 移除行内代码
    content = re.sub(r'`.*?`', '', content)
    return content


def is_valid_link(link):
    """检查是否为有效的 Obsidian 链接"""
    invalid_patterns = [
        r'^\s*\[.*\]',  # 数组格式
        r'^\s*\d+\s*,\s*\d+\s*$',  # 坐标对
        r'^\s*[\d\s,\.\[\]]+$',  # 纯数字、空格、逗号、方括号组合
        r'.*[<>∞].*',  # 包含 HTML 标签或无穷符号
        r'.*[⌊⌋⌈⌉].*',  # 包含数学符号
        r'.*\*.*\*.*',  # 包含 markdown 强调语法
        r'.*….*',  # 包含省略号
        r'^\s*\[\[.*\]\].*$',  # 嵌套的双括号
    ]
    return not any(re.match(pattern, link) for pattern in invalid_patterns)


def extract_links(content):
    """提取文档中的所有内部链接"""
    # 首先移除代码块
    content = remove_code_blocks(content)
    # 提取所有 Obsidian 内部链接
    internal_links = re.findall(r'\[\[(.*?)\]\]', content)
    # 过滤无效链接
    return [link for link in internal_links if is_valid_link(link)]


def check_links(files):
    """检查所有文件中的链接是否有效"""
    all_files = {f.stem: f for f in files}  # 文件名到路径的映射
    broken_links = []

    for file in files:
        content = file.read_text(encoding='utf-8')
        links = extract_links(content)

        for link in links:
            # 处理链接中可能包含的管道符号（别名）
            link_target = link.split('|')[0].strip()
            # 处理链接中可能包含的 # 符号（标题链接）
            link_target = link_target.split('#')[0].strip()

            if link_target and link_target not in all_files:
                broken_links.append((file, link_target))

    return broken_links


def main():
    """主函数"""
    files = find_markdown_files('.')
    broken_links = check_links(files)

    if broken_links:
        print("\n发现死链：")
        for file, link in broken_links:
            print(f"❌ 文件 '{file}' 中的链接 '[[{link}]]' 无效")
        print("\n提示：请检查这些链接是否拼写错误或目标文件是否存在。")
        sys.exit(1)

    print("✅ 未发现死链")
    sys.exit(0)


if __name__ == '__main__':
    main()
