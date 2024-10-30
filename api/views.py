from django.http import JsonResponse
from datetime import datetime

def index(request):
    response = {"message":"Hello world"}
    return JsonResponse(response)

def current_datetime(request):
    now = datetime.now()
    response_data = {
        'current_datetime': f"{now.strftime('%Y-%m-%d %H:%M:%S')} UTC Time Zone"
    }
    return JsonResponse(response_data)
