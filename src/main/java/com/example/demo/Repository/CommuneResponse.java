package com.example.demo.Repository;

import java.util.List;

public class CommuneResponse {
    private String requestId;
    private List<Commune> communes;

    // getters & setters
    public String getRequestId() { return requestId; }
    public void setRequestId(String requestId) { this.requestId = requestId; }
    public List<Commune> getCommunes() { return communes; }
    public void setCommunes(List<Commune> communes) { this.communes = communes; }

    public static class Commune {
        private String code;
        private String name;
        private String englishName;
        private String administrativeLevel;
        private String provinceCode;
        private String provinceName;
        private String decree;

        // getters & setters
        public String getCode() { return code; }
        public void setCode(String code) { this.code = code; }
        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getEnglishName() { return englishName; }
        public void setEnglishName(String englishName) { this.englishName = englishName; }
        public String getAdministrativeLevel() { return administrativeLevel; }
        public void setAdministrativeLevel(String administrativeLevel) { this.administrativeLevel = administrativeLevel; }
        public String getProvinceCode() { return provinceCode; }
        public void setProvinceCode(String provinceCode) { this.provinceCode = provinceCode; }
        public String getProvinceName() { return provinceName; }
        public void setProvinceName(String provinceName) { this.provinceName = provinceName; }
        public String getDecree() { return decree; }
        public void setDecree(String decree) { this.decree = decree; }
    }
}
