async function week_weather() {
  const url = 'http://dataservice.accuweather.com/forecasts/v1/daily/5day'
  const code = '60449'
  const apikey = 'BJgEJkAuqdcTqqO3QF4enjAq8gtcKDRu'
  const details = 'true'
  const metric = 'true'
  const header = {
    method: 'GET',
    redirect: "follow"
  }
  
  try {
    const api_call = await fetch(`${url}/${code}?apikey=${apikey}&details=${details}&metric=${metric}`, header)
    const data = await api_call.text()
    const days = JSON.parse(data)

    var api_weather = document.querySelector('#api_weather')
    var div = document.createElement('div')
    div.classList.add('border', 'border-secondary', 'rounded', 'py-2')

    var h2 = document.createElement('h2')
    h2.classList.add('h3', 'font-weight-bold', 'text-center')
    h2.innerHTML = 'Api AccuWeather'

    var div_day = document.createElement('div')
    div_day.classList.add('p-2')

    div.appendChild(h2)

    days.DailyForecasts.map(day => {
      const date = day.Date.split('T')[0]
      const sun_rise = day.Sun.Rise.split('T')[1]
      const temp_min = day.Temperature.Minimum
      const temp_max = day.Temperature.Maximum
      
      var ul = document.createElement('ul')
      ul.classList.add('list-group', 'list-unstyled', 'list-group-flush')
      ul.innerHTML = `<li class="list-group-item"><strong>Date: </strong>${date}</li>
                      <li class="list-group-item"><strong>Sun Rice: </strong>${sun_rise}</li>
                      <li class="list-group-item"><strong>Temperature Minimum: </strong>${temp_min.Value} °${temp_min.Unit}</li>
                      <li class="list-group-item"><strong>Temperature Maximum: </strong>${temp_max.Value} °${temp_max.Unit}</li>`

      var hr = document.createElement('hr')
      div_day.appendChild(hr)
      div_day.appendChild(ul)
      div.appendChild(div_day)
    })

    api_weather.appendChild(div)


  } catch(e) {
    console.error(e)
  }
}

export default week_weather












