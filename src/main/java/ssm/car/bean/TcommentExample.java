package ssm.car.bean;

import java.util.ArrayList;
import java.util.List;

public class TcommentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TcommentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andTidIsNull() {
            addCriterion("tid is null");
            return (Criteria) this;
        }

        public Criteria andTidIsNotNull() {
            addCriterion("tid is not null");
            return (Criteria) this;
        }

        public Criteria andTidEqualTo(Integer value) {
            addCriterion("tid =", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotEqualTo(Integer value) {
            addCriterion("tid <>", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidGreaterThan(Integer value) {
            addCriterion("tid >", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidGreaterThanOrEqualTo(Integer value) {
            addCriterion("tid >=", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLessThan(Integer value) {
            addCriterion("tid <", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidLessThanOrEqualTo(Integer value) {
            addCriterion("tid <=", value, "tid");
            return (Criteria) this;
        }

        public Criteria andTidIn(List<Integer> values) {
            addCriterion("tid in", values, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotIn(List<Integer> values) {
            addCriterion("tid not in", values, "tid");
            return (Criteria) this;
        }

        public Criteria andTidBetween(Integer value1, Integer value2) {
            addCriterion("tid between", value1, value2, "tid");
            return (Criteria) this;
        }

        public Criteria andTidNotBetween(Integer value1, Integer value2) {
            addCriterion("tid not between", value1, value2, "tid");
            return (Criteria) this;
        }

        public Criteria andUidIsNull() {
            addCriterion("uid is null");
            return (Criteria) this;
        }

        public Criteria andUidIsNotNull() {
            addCriterion("uid is not null");
            return (Criteria) this;
        }

        public Criteria andUidEqualTo(Integer value) {
            addCriterion("uid =", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotEqualTo(Integer value) {
            addCriterion("uid <>", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThan(Integer value) {
            addCriterion("uid >", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidGreaterThanOrEqualTo(Integer value) {
            addCriterion("uid >=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThan(Integer value) {
            addCriterion("uid <", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidLessThanOrEqualTo(Integer value) {
            addCriterion("uid <=", value, "uid");
            return (Criteria) this;
        }

        public Criteria andUidIn(List<Integer> values) {
            addCriterion("uid in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotIn(List<Integer> values) {
            addCriterion("uid not in", values, "uid");
            return (Criteria) this;
        }

        public Criteria andUidBetween(Integer value1, Integer value2) {
            addCriterion("uid between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andUidNotBetween(Integer value1, Integer value2) {
            addCriterion("uid not between", value1, value2, "uid");
            return (Criteria) this;
        }

        public Criteria andTcnameIsNull() {
            addCriterion("tcname is null");
            return (Criteria) this;
        }

        public Criteria andTcnameIsNotNull() {
            addCriterion("tcname is not null");
            return (Criteria) this;
        }

        public Criteria andTcnameEqualTo(String value) {
            addCriterion("tcname =", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameNotEqualTo(String value) {
            addCriterion("tcname <>", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameGreaterThan(String value) {
            addCriterion("tcname >", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameGreaterThanOrEqualTo(String value) {
            addCriterion("tcname >=", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameLessThan(String value) {
            addCriterion("tcname <", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameLessThanOrEqualTo(String value) {
            addCriterion("tcname <=", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameLike(String value) {
            addCriterion("tcname like", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameNotLike(String value) {
            addCriterion("tcname not like", value, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameIn(List<String> values) {
            addCriterion("tcname in", values, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameNotIn(List<String> values) {
            addCriterion("tcname not in", values, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameBetween(String value1, String value2) {
            addCriterion("tcname between", value1, value2, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcnameNotBetween(String value1, String value2) {
            addCriterion("tcname not between", value1, value2, "tcname");
            return (Criteria) this;
        }

        public Criteria andTcdateIsNull() {
            addCriterion("tcdate is null");
            return (Criteria) this;
        }

        public Criteria andTcdateIsNotNull() {
            addCriterion("tcdate is not null");
            return (Criteria) this;
        }

        public Criteria andTcdateEqualTo(String value) {
            addCriterion("tcdate =", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateNotEqualTo(String value) {
            addCriterion("tcdate <>", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateGreaterThan(String value) {
            addCriterion("tcdate >", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateGreaterThanOrEqualTo(String value) {
            addCriterion("tcdate >=", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateLessThan(String value) {
            addCriterion("tcdate <", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateLessThanOrEqualTo(String value) {
            addCriterion("tcdate <=", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateLike(String value) {
            addCriterion("tcdate like", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateNotLike(String value) {
            addCriterion("tcdate not like", value, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateIn(List<String> values) {
            addCriterion("tcdate in", values, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateNotIn(List<String> values) {
            addCriterion("tcdate not in", values, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateBetween(String value1, String value2) {
            addCriterion("tcdate between", value1, value2, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTcdateNotBetween(String value1, String value2) {
            addCriterion("tcdate not between", value1, value2, "tcdate");
            return (Criteria) this;
        }

        public Criteria andTccontentIsNull() {
            addCriterion("tccontent is null");
            return (Criteria) this;
        }

        public Criteria andTccontentIsNotNull() {
            addCriterion("tccontent is not null");
            return (Criteria) this;
        }

        public Criteria andTccontentEqualTo(String value) {
            addCriterion("tccontent =", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentNotEqualTo(String value) {
            addCriterion("tccontent <>", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentGreaterThan(String value) {
            addCriterion("tccontent >", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentGreaterThanOrEqualTo(String value) {
            addCriterion("tccontent >=", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentLessThan(String value) {
            addCriterion("tccontent <", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentLessThanOrEqualTo(String value) {
            addCriterion("tccontent <=", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentLike(String value) {
            addCriterion("tccontent like", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentNotLike(String value) {
            addCriterion("tccontent not like", value, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentIn(List<String> values) {
            addCriterion("tccontent in", values, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentNotIn(List<String> values) {
            addCriterion("tccontent not in", values, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentBetween(String value1, String value2) {
            addCriterion("tccontent between", value1, value2, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTccontentNotBetween(String value1, String value2) {
            addCriterion("tccontent not between", value1, value2, "tccontent");
            return (Criteria) this;
        }

        public Criteria andTcimgIsNull() {
            addCriterion("tcimg is null");
            return (Criteria) this;
        }

        public Criteria andTcimgIsNotNull() {
            addCriterion("tcimg is not null");
            return (Criteria) this;
        }

        public Criteria andTcimgEqualTo(String value) {
            addCriterion("tcimg =", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgNotEqualTo(String value) {
            addCriterion("tcimg <>", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgGreaterThan(String value) {
            addCriterion("tcimg >", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgGreaterThanOrEqualTo(String value) {
            addCriterion("tcimg >=", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgLessThan(String value) {
            addCriterion("tcimg <", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgLessThanOrEqualTo(String value) {
            addCriterion("tcimg <=", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgLike(String value) {
            addCriterion("tcimg like", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgNotLike(String value) {
            addCriterion("tcimg not like", value, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgIn(List<String> values) {
            addCriterion("tcimg in", values, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgNotIn(List<String> values) {
            addCriterion("tcimg not in", values, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgBetween(String value1, String value2) {
            addCriterion("tcimg between", value1, value2, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcimgNotBetween(String value1, String value2) {
            addCriterion("tcimg not between", value1, value2, "tcimg");
            return (Criteria) this;
        }

        public Criteria andTcintroIsNull() {
            addCriterion("tcintro is null");
            return (Criteria) this;
        }

        public Criteria andTcintroIsNotNull() {
            addCriterion("tcintro is not null");
            return (Criteria) this;
        }

        public Criteria andTcintroEqualTo(String value) {
            addCriterion("tcintro =", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroNotEqualTo(String value) {
            addCriterion("tcintro <>", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroGreaterThan(String value) {
            addCriterion("tcintro >", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroGreaterThanOrEqualTo(String value) {
            addCriterion("tcintro >=", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroLessThan(String value) {
            addCriterion("tcintro <", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroLessThanOrEqualTo(String value) {
            addCriterion("tcintro <=", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroLike(String value) {
            addCriterion("tcintro like", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroNotLike(String value) {
            addCriterion("tcintro not like", value, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroIn(List<String> values) {
            addCriterion("tcintro in", values, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroNotIn(List<String> values) {
            addCriterion("tcintro not in", values, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroBetween(String value1, String value2) {
            addCriterion("tcintro between", value1, value2, "tcintro");
            return (Criteria) this;
        }

        public Criteria andTcintroNotBetween(String value1, String value2) {
            addCriterion("tcintro not between", value1, value2, "tcintro");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}