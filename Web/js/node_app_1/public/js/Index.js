const result_p = document.getElementById('fetch_result')

const request_result = await fetch('/api/hello?name=Copilot&surname=Parcival')

result_p.innerHTML = await request_result.text()

console.log(request_result)

const json_result = await fetch('/api/json_test')

if(response_json.ok)
{
    const json = await response_json.json()
    console.log(json)
}

else
{
    console.log('Error: ' + response_json.status)
}