@Composable
fun Greeting() {
    val itemsIndexedList = listOf("A", "B", "C")

    LazyVerticalGrid(columns = GridCells.Fixed(3)) {
        itemsIndexed(itemsIndexedList) { index, item ->
            Text(
                text = item,
                style = if (index == 0) MaterialTheme.typography.labelSmall else MaterialTheme.typography.bodyMedium
            )
        }
    }
}