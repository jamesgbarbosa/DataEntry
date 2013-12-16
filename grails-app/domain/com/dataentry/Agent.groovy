package com.dataentry

import java.text.ParseException
import java.text.SimpleDateFormat

class Agent implements Serializable {

    Client clientProfile
//    String agentCode
    String position
    Date appointmentDate
    String agency
    String groupName
    String unit
    String counselorCode

    Agent() {
        clientProfile = new Client()
    }

    def bindParams(Map params) {
        params.appointmentDate = DateUtil.isValidDate(params.appointmentDate)? Date.parse( 'MM/dd/yyyy', params.appointmentDate ) : params.appointmentDate
        this.properties = params
    }

    static constraints = {
//        agentCode blank:  true, nullable:  true
        position blank:  true, nullable:  true
        appointmentDate blank:  true, nullable:  true
        agency blank:  true, nullable:  true
        groupName blank:  false, nullable:  false
        unit blank:  false, nullable:  false
        counselorCode blank:  false, nullable:  false
        clientProfile nullable: false
    }

    boolean equals(o) {
        if (this.is(o)) return true
        if (getClass() != o.class) return false

        Agent agent = (Agent) o

        if (clientProfile.id != agent.clientProfile.id) return false

        if (agency != agent.agency) return false
        if (appointmentDate != agent.appointmentDate) return false
        if (counselorCode != agent.counselorCode) return false
        if (groupName != agent.groupName) return false
        if (position != agent.position) return false
        if (unit != agent.unit) return false

        return true
    }

    int hashCode() {
        int result
        result = clientProfile.hashCode()
        result = 31 * result + (position != null ? position.hashCode() : 0)
        result = 31 * result + (appointmentDate != null ? appointmentDate.hashCode() : 0)
        result = 31 * result + (agency != null ? agency.hashCode() : 0)
        result = 31 * result + groupName.hashCode()
        result = 31 * result + (unit != null ? unit.hashCode() : 0)
        result = 31 * result + counselorCode.hashCode()
        result = 31 * result + (id != null ? id.hashCode() : 0)
        result = 31 * result + (version != null ? version.hashCode() : 0)
        return result
    }

    @Override
    public java.lang.String toString() {
        final java.lang.StringBuilder sb = new java.lang.StringBuilder("Agent{");

        sb.append("id=").append(id);
        sb.append(", client=").append(clientProfile.fullNameBirthdateAndGender());
        sb.append(", position='").append(position).append('\'');
        sb.append(", appointmentDate=").append(appointmentDate);
        sb.append(", agency='").append(agency).append('\'');
        sb.append(", groupName='").append(groupName).append('\'');
        sb.append(", unit='").append(unit).append('\'');
        sb.append(", counselorCode='").append(counselorCode).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
