
# How to use

1. First, you need to config the query and also the `columns_array`;
2. Then, render it.

```datacorejsx
// Config header and also query string here.
// Support sort and also filter box.
const query = `@page and path("Inputs")`;
const columns_array = [
    { title: "Link", value: "$link" },
    { title: "Name", value: "name" },
    { title: "When", value: "when" },
    { title: "Test", value: "test" },
    { title: "File", value: "file" }
];

function View() {
    const games = dc.useQuery(query);
    const [sortConfig, setSortConfig] = dc.useState({ key: null, direction: 'asc' });
    const [filter, setFilter] = dc.useState("");

    const columns = columns_array.map((c) => {
        return c.value.startsWith('$') ? {
            title: () => <span onClick={() => handleSort(c.value, true)}>{c.title}{getSortIndicator(c.value)}</span>,
            value: (game) => game[c.value]
        } : { title: () => <span onClick={() => handleSort(c.value, false)}>{c.title}{getSortIndicator(c.value)}</span>, value: (game) => game.value(c.value) };
    });

    const filteredAndSortedGames = dc.useMemo(() => {
        let filtered = games;

        if (filter) {
            filtered = games.filter((game) => {
                return Object.keys(game.$frontmatter).some((key) => {
                    return key.includes(filter) || game.$frontmatter[key].raw.toString().includes(filter);
                }) || game.$file.includes(filter);
            });
        }

        if (sortConfig.key) {
            filtered = filtered.sort((a, b) => {
                const aValue = sortConfig.key.startsWith('$') ? a[sortConfig.key] : a[sortConfig.key].toString();
                const bValue = sortConfig.key.startsWith('$') ? b[sortConfig.key] : b[sortConfig.key].toString();
                return sortConfig.direction === 'asc' ? aValue.localeCompare(bValue) : bValue.localeCompare(aValue);
            });
        }
        console.log(filtered);

        return filtered;
    }, [games, filter, sortConfig]);

    const handleSearch = (inputEvent) => {
        setFilter(inputEvent.target.value);
    };

    const handleSort = (key) => {
        let direction = 'asc';
        if (sortConfig.key === key && sortConfig.direction === 'asc') {
            direction = 'desc';
        }
        setSortConfig({ key, direction });
    };

    const getSortIndicator = (key) => {
        if (sortConfig.key === key) {
            return sortConfig.direction === 'asc' ? ' ↑' : ' ↓';
        }
        return '';
    };

    return (
        <>
            <dc.Group justify="end">
                <input onChange={handleSearch} />
            </dc.Group>
            <dc.VanillaTable columns={columns} rows={filteredAndSortedGames} />
        </>
    );
}

return <View />;

```