import Foundation

struct CabinetsModel: Codable {
    let isSuccess: Bool?
    let returnMessage: String?
    let data: DataClass?
    let count: Int?

    enum CodingKeys: String, CodingKey {
        case isSuccess = "IsSuccess"
        case returnMessage = "ReturnMessage"
        case data = "Data"
        case count = "count"
    }
}

// MARK: - DataClass
struct DataClass : Codable {
    let count: Int?
    let results: [Result]?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case results = "results"
    }
    
}

// MARK: - Result
struct Result : Codable {
    let added: Bool?
    let address: Int?
    let child: Child?
    let controllable: Bool?
    let dashboardDisplay: Bool?
    let resultDescription: String?
    let enabled: Bool?
    let imei: String?
    let model: String?
    let resourceURI: String?
    let sensors: [ResultSensor]?
    let standalone: Bool?
    let subscribed: Bool?
//    let subscribers: [String]?
//    let tags: [String]?
    let timeout: Int?
    let unclearedAlarms: Int?
    let unitID: String?
    let unitOffline: Bool?
    let gateway: Gateway?

    enum CodingKeys: String, CodingKey {
        case added = "added"
        case address = "address"
        case child = "child"
        case controllable = "controllable"
        case dashboardDisplay = "dashboard_display"
        case resultDescription = "description"
        case enabled = "enabled"
        case imei = "imei"
        case model = "model"
        case resourceURI = "resource_uri"
        case sensors = "sensors"
        case standalone = "standalone"
        case subscribed = "subscribed"
//        case subscribers = "subscribers"
//        case tags = "tags"
        case timeout = "timeout"
        case unclearedAlarms = "uncleared_alarms"
        case unitID = "unit_id"
        case unitOffline = "unit_offline"
        case gateway = "gateway"
    }
}

// MARK: - Child
struct Child : Codable {
    let unitID: String?
    let address: Int?
    let child: String?
    let controllable: Bool?
    let dashboardDisplay: Bool?
    let childDescription: String?
    let gateway: Gateway?
    let imei: String?
    let sensors: [ChildSensor]?
    let model: String?
    let standalone: Bool?
    let subscribed: Bool?
    let unitOffline: Bool?
    let unclearedAlarms: Int?
    let resourceURI: String?
    let added: Bool?
    let timeout: Int?
    let plot: String?
//    let tags: [String]?
    let makemodel: String?
//    let subscribers: [String]?
    let enabled: Bool?

    enum CodingKeys: String, CodingKey {
        case unitID = "unit_id"
        case address = "address"
        case child = "child"
        case controllable = "controllable"
        case dashboardDisplay = "dashboard_display"
        case childDescription = "description"
        case gateway = "gateway"
        case imei = "imei"
        case sensors = "sensors"
        case model = "model"
        case standalone = "standalone"
        case subscribed = "subscribed"
        case unitOffline = "unit_offline"
        case unclearedAlarms = "uncleared_alarms"
        case resourceURI = "resource_uri"
        case added = "added"
        case timeout = "timeout"
        case plot = "plot"
//        case tags = "tags"
        case makemodel = "makemodel"
//        case subscribers = "subscribers"
        case enabled = "enabled"
    }
}

// MARK: - Gateway
struct Gateway: Codable {
    let city: String?
    let countryName: String?
    let gatewayID: String?
    let ip: String?
    let premises: Premises?
    let regionName: String?
    let estimate: Bool?
    let interval: String?
    let resourceURI: String?

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case countryName = "country_name"
        case gatewayID = "gateway_id"
        case ip = "ip"
        case premises = "premises"
        case regionName = "region_name"
        case estimate = "estimate"
        case interval = "interval"
        case resourceURI = "resource_uri"
    }
}

// MARK: - Premises
struct Premises: Codable {
    let id: Int?
    let company: Int?
    let extendedAddress: String?
    let locality: String?
    let name: String?
    let postalCode: String?
    let region: Region?
    let streetAddress: String?
    let resourceURI: String?
    let slug: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case company = "company"
        case extendedAddress = "extended_Address"
        case locality = "locality"
        case name = "name"
        case postalCode = "postal_code"
        case region = "region"
        case streetAddress = "street_address"
        case resourceURI = "resource_uri"
        case slug = "slug"
    }
}

// MARK: - Region
struct Region: Codable {
    let country: String?
    let name: String?
    let resourceURI: String?

    enum CodingKeys: String, CodingKey {
        case country = "country"
        case name = "name"
        case resourceURI = "resource_uri"
    }
}

// MARK: - ChildSensor
struct ChildSensor: Codable {
    let key: String?
    let sensorDescription: String?
    let enabled: Bool?
    let offset: Int?
    let unitID: String?
    let category: String?
    let resourceURI: String?
    let unitOfMeasurement: UnitOfMeasurement?
    let visible: Bool?
    let id: Int?
    let stalenessPeriod: Int?
    let reportInterval: Int?
    let minTemp: String?
    let maxTemp: Double?
    let warningDelayMin: Int?
    let warningDelayMax: Int?
    let alarmDelayMin: Int?
    let alarmDelayMax: Int?
    let alarmRecoveryPeriodMin: Int?
    let alarmRecoveryPeriodMax: Int?
    let autoClear: Bool?

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case sensorDescription = "sensor_description"
        case enabled = "enabled"
        case offset = "offset"
        case unitID = "unit_id"
        case category = "category"
        case resourceURI = "resource_uri"
        case unitOfMeasurement = "unit_of_measurement"
        case visible = "visible"
        case id = "id"
        case stalenessPeriod = "staleness_period"
        case reportInterval = "report_interval"
        case minTemp = "min_temp"
        case maxTemp = "max_temp"
        case warningDelayMin = "warning_delay_min"
        case warningDelayMax = "warning_delay_max"
        case alarmDelayMin = "alarm_delay_min"
        case alarmDelayMax = "alarm_delay_max"
        case alarmRecoveryPeriodMin = "alarm_recovery_period_min"
        case alarmRecoveryPeriodMax = "alarm_recovery_period_max"
        case autoClear = "auto_clear"
    }
}

// MARK: - UnitOfMeasurement
struct UnitOfMeasurement: Codable {
    let umFull: String?
    let umAbbreviated: String?
    let umIndex: String?
    let umVariable: String?
    let key: String?
    let id: Int?

    enum CodingKeys: String, CodingKey {
        case umFull = "um_full"
        case umAbbreviated = "um_abbreviated"
        case umIndex = "um_index"
        case umVariable = "um_variable"
        case key = "key"
        case id = "id"
    }
}

// MARK: - ResultSensor
struct ResultSensor: Codable {
    let alarmDelayMax: Int?
    let alarmDelayMin: Int?
    let alarmRecoveryPeriodMax: Int?
    let alarmRecoveryPeriodMin: Int?
    let autoClear: Bool?
    let enabled: Bool?
    let id: Int?
    let key: String?
    let maxTemp: String?
    let minTemp: String?
    let offset: String?
    let reportInterval: Int?
    let resourceURI: String?
    let sensorDescription: String?
    let stalenessPeriod: Int?
    let unitID: String?
    let unitOfMeasurement: UnitOfMeasurement?
    let visible: Bool?
    let warningDelayMax: String?
    let warningDelayMin: String?
    let value: Value?

    enum CodingKeys: String, CodingKey {
        case alarmDelayMax = "alarm_delay_max"
        case alarmDelayMin = "alarm_delay_min"
        case alarmRecoveryPeriodMax = "alarm_recovery_period_max"
        case alarmRecoveryPeriodMin = "alarm_recovery_period_min"
        case autoClear = "auto_clear"
        case enabled = "enabled"
        case id = "id"
        case key = "key"
        case maxTemp = "max_temp"
        case minTemp = "min_temp"
        case offset = "offset"
        case reportInterval = "report_interval"
        case resourceURI = "resource_uri"
        case sensorDescription = "sensor_description"
        case stalenessPeriod = "staleness_period"
        case unitID = "unit_id"
        case unitOfMeasurement = "unit_of_measurement"
        case visible = "visible"
        case warningDelayMax = "warning_delay_max"
        case warningDelayMin = "warning_delay_min"
        case value = "value"
    }
}

// MARK: - Value
struct Value: Codable {
    let value: Double?
    let unit: String?
    let sensor: String?
    
    enum CodingKeys: String, CodingKey {
        case value = "value"
        case unit = "unit"
        case sensor = "sensor"
        
    }
}
