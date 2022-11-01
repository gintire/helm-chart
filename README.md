# CPPM 2.0 Helm chart
## Structure
```
> tree /F
│  Chart.yaml
│  values.yaml
│
└─charts
    ├─agent
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          deployment.yaml
    │          hpa.yaml
    │          jvm-option-configmap.yaml
    │          NOTES.txt
    │          service.yaml
    │          serviceaccount.yaml
    │
    ├─auth
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          deployment.yaml
    │          hpa.yaml
    │          jvm-option-configmap.yaml
    │          NOTES.txt
    │          service.yaml
    │          serviceaccount.yaml
    │
    ├─batch
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          deployment.yaml
    │          hpa.yaml
    │          jvm-option-configmap.yaml
    │          NOTES.txt
    │          serviceaccount.yaml
    │
    ├─common
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          _capabilities.tpl
    │          _configmaps.tpl
    │          _helpers.tpl
    │          _images.tpl
    │          _names.tpl
    │          _resources.tpl
    │
    ├─console
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          deployment.yaml
    │          hpa.yaml
    │          ingress.yaml
    │          jvm-option-configmap.yaml
    │          NOTES.txt
    │          service.yaml
    │          serviceaccount.yaml
    │
    ├─kafka-consumer
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          deployment.yaml
    │          hpa.yaml
    │          jvm-option-configmap.yaml
    │          NOTES.txt
    │          serviceaccount.yaml
    │
    ├─report
    │  │  Chart.yaml
    │  │  values.yaml
    │  │
    │  └─templates
    │          deployment.yaml
    │          hpa.yaml
    │          jvm-option-configmap.yaml
    │          NOTES.txt
    │          serviceaccount.yaml
    │
    └─scheduler
        │  Chart.yaml
        │  values.yaml
        │
        └─templates
                deployment.yaml
                hpa.yaml
                jvm-option-configmap.yaml
                NOTES.txt
                service.yaml
                serviceaccount.yaml
```
## Directories
### root
root 디렉터리에 있는 Chart.yaml, values.yaml은 helm 전체 차트에 대한 정보를 포함한다.
* Chart.yaml : 차트 설정
* values.yaml : 서브 차트 설정 - 통합적으로 서브 차트의 설정값을 변경할 수 있다. (자주 변경되는 값들만 모아둠)
### common
공통적으로 사용되는 템플릿을 저장. 추후 템플릿이 추가되면 현재 디렉터리에 저장하도록 한다.
### sub-charts
sub-chart는 각 서비스를 동작시키기 위한 설정들을 포함한다. 개별 sub-chart에 포함되는 values.yaml 파일은 각 sub-chart에 적용되며, ROOT 디렉토리에 있는 values.yaml 파일은 sub-chart의 values.yaml 파일에 있는 설정 값을 덮어쓴다.

| Chart Name     |
|----------------|
| auth           |
| batch          |
| console        |
| kafka-consumer |
| report         |
| scheduler      |

## How to use?
### Install
> global.nfs.natIp : volume으로 마운트될 NAT IP

`$ helm install <release_name> . --debug --set global.nfs.natIp="<NAT IP>" -n cppm`


**example**
> dry-run : `$ helm install cppm-prod . --dry-run --debug --set global.nfs.natIp="169.123.0.1" -n cppm`  
> real    : `$ helm install cppm-prod . --debug --set global.nfs.natIp="169.123.0.1" -n cppm`

### package
`$ helm package .`