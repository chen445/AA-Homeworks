export const fetchSearchGiphys = searchTerm=>(
    $.ajax({
        method: 'GET',
        url:`http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=H67x6uVkbr7XPs5BUTFpZ4INBC0zNHUw&limit=2`
    })
)