----------------------------------------------------
-- Export file for user JRTSCH                    --
-- Created by Administrator on 2011-3-2, 18:34:31 --
----------------------------------------------------
create table jrtsch.IPTABLES
(
  ipid       VARCHAR2(8 CHAR) not null,
  ipaddr     VARCHAR2(20 CHAR) not null,
  expiretime TIMESTAMP(6) default SYSDATE not null,
  state      NUMBER(1) default 0 not null,
  agencyno   VARCHAR2(8 CHAR) default ' ' not null
)
;
comment on column jrtsch.IPTABLES.ipid
  is 'ip编号';
comment on column jrtsch.IPTABLES.ipaddr
  is 'ip地址';
comment on column jrtsch.IPTABLES.expiretime
  is '失效时间';
comment on column jrtsch.IPTABLES.state
  is 'IP状态0：关闭，1：开启';
comment on column jrtsch.IPTABLES.agencyno
  is '渠道编号';
alter table jrtsch.IPTABLES
  add constraint PK_IPTABLES primary key (IPID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.NM_MOBILE_TMERPLATPAYREP
(
  mid     VARCHAR2(14) default ' ' not null,
  mcode   VARCHAR2(12) default '101472' not null,
  paydate VARCHAR2(8) default ' ' not null,
  paytime VARCHAR2(6) default ' ' not null,
  payday  VARCHAR2(8) default ' ' not null,
  rcode   VARCHAR2(10) default ' ' not null,
  paydesc VARCHAR2(100) default ' ' not null,
  omid    VARCHAR2(14) default ' ' not null,
  orderid VARCHAR2(20) default ' ' not null,
  sign    VARCHAR2(172) default ' ' not null
)
;

comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.mid
  is '系统跟踪号(同原交易)【主键+外键】';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.mcode
  is '功能码';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.paydate
  is '交易日期YYYYMMDD  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.paytime
  is '交易时间HHMMSS  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.payday
  is '账务日期YYYYMMDD  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.rcode
  is '省平台返回码(000000标示成功,其他失败)  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.paydesc
  is '省平台返回信息  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.omid
  is '平台交易流水号  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.orderid
  is '订单号  ';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREP.sign
  is '签名  ';
alter table jrtsch.NM_MOBILE_TMERPLATPAYREP
  add constraint PK_TMERPLATPAYREP_MID primary key (MID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.NM_MOBILE_TMERPLATPAYREQ
(
  mid         VARCHAR2(14) default ' ' not null,
  mcode       VARCHAR2(12) default '101460' not null,
  paydate     VARCHAR2(8) default ' ' not null,
  paytime     VARCHAR2(6) default ' ' not null,
  bustyp      VARCHAR2(5) default 'LOT01' not null,
  payuid      VARCHAR2(20) default ' ' not null,
  mobileid    VARCHAR2(11) default ' ' not null,
  alias       VARCHAR2(60) default ' ',
  merid       VARCHAR2(15) default ' ' not null,
  orderid     VARCHAR2(20) default ' ' not null,
  amout       NUMBER(15) not null,
  currency    VARCHAR2(3) default 'CNY' not null,
  orderdate   VARCHAR2(8) default ' ' not null,
  noticemob   VARCHAR2(11) default ' ',
  noticeemail VARCHAR2(30) default ' ',
  txntyp      VARCHAR2(1) default 'S' not null,
  productdesc VARCHAR2(250) default ' ',
  productid   VARCHAR2(50) default ' ',
  productname VARCHAR2(60) default ' ',
  sign        VARCHAR2(172) default ' ' not null
)
;

comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.mid
  is '系统跟踪号【主键】';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.mcode
  is '功能码';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.paydate
  is '交易日期YYYYMMDD';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.paytime
  is '交易时间HHMMSS';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.bustyp
  is '业务类型(水费:WAT01;电费:EFE01;彩票:LOT01;煤气:GAS01)';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.payuid
  is '协议编号';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.mobileid
  is '手机号';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.alias
  is '别名';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.merid
  is '商户编号';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.orderid
  is '商户订单号';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.amout
  is '交易金额(单位分)';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.currency
  is '币种(CNY:可提现金额进行支付,用户只能选择可体现账户里的钱和银行账户里的钱进行支付。CMY:用不可提现金额支付,用户可以选择不可体现账户里面的钱+充值卡+银行卡进行支付)';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.orderdate
  is '订单日期(YYYYMMDD)';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.noticemob
  is '通知手机号';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.noticeemail
  is '通知Email';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.txntyp
  is '交易类型(L:传统,B:B2C,C:C2C,S:直接支付)';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.productdesc
  is '产品描述';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.productid
  is '产品编号';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.productname
  is '产品名称';
comment on column jrtsch.NM_MOBILE_TMERPLATPAYREQ.sign
  is '签名';
alter table jrtsch.NM_MOBILE_TMERPLATPAYREQ
  add constraint PK_TMERPLATPAYREQ_MID primary key (MID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.NM_MOBILE_TUSERAGREEMENT
(
  mid        VARCHAR2(14) not null,
  mcode      VARCHAR2(12) default '101472' not null,
  paydate    VARCHAR2(8) default '' not null,
  paytime    VARCHAR2(6) default '' not null,
  bustyp     VARCHAR2(5) default 'LOT01' not null,
  merid      VARCHAR2(15) default '' not null,
  mobileid   VARCHAR2(11) default '' not null,
  alias      VARCHAR2(60),
  remark     VARCHAR2(100) default '' not null,
  musrid     VARCHAR2(50) default '' not null,
  confirmflg VARCHAR2(1),
  effdate    VARCHAR2(8) default '' not null,
  expdate    VARCHAR2(8) default '' not null,
  rcode      VARCHAR2(10) default ' ',
  paydesc    VARCHAR2(100) default ' ',
  payuid     VARCHAR2(20) default ' ',
  status     VARCHAR2(10) default ' '
)
;

comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.mid
  is '系统跟踪号【主键】';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.mcode
  is '功能码 ';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.paydate
  is '交易日期YYYYMMDD';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.paytime
  is '交易时间HHMMSS';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.bustyp
  is '业务类型(水费:WAT01;电费:EFE01;彩票:LOT01;煤气:GAS01)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.merid
  is '商户编号';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.mobileid
  is '手机号';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.alias
  is '别名';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.remark
  is '备注';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.musrid
  is '扣款编号(用户在商户系统的会员号即用户编号)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.confirmflg
  is '用户确认标志(Y:已确认N:未确认)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.effdate
  is '生效时间(8位YYYYMMDD)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.expdate
  is '失效时间(8位YYYYMMDD)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.rcode
  is '省平台返回码(000000标示成功,其他失败)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.paydesc
  is '省平台返回信息';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.payuid
  is '协议编号(无密支付时的要素)';
comment on column jrtsch.NM_MOBILE_TUSERAGREEMENT.status
  is '0:未生效1:生效2:删除';
alter table jrtsch.NM_MOBILE_TUSERAGREEMENT
  add constraint PK_MID primary key (MID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.PRESENTERMONEY
(
  id            NUMBER not null,
  channelid     NUMBER(20) not null,
  type          NUMBER(1) not null,
  moneycount    NUMBER(10) default 0,
  state         NUMBER(1) default 0 not null,
  channelname   VARCHAR2(20) default ' ',
  rechargecount NUMBER(10) default 0
)
;

comment on column jrtsch.PRESENTERMONEY.id
  is '主键';
comment on column jrtsch.PRESENTERMONEY.channelid
  is '渠道号';
comment on column jrtsch.PRESENTERMONEY.type
  is '类型,0注册赠送，1充值赠送';
comment on column jrtsch.PRESENTERMONEY.moneycount
  is '赠送金额(单位：分)';
comment on column jrtsch.PRESENTERMONEY.state
  is '0关闭，1开通';
comment on column jrtsch.PRESENTERMONEY.channelname
  is '渠道名称';
comment on column jrtsch.PRESENTERMONEY.rechargecount
  is '充值金额(单位：分)';
alter table jrtsch.PRESENTERMONEY
  add constraint PK_ID primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.PVCOUNTER
(
  id        VARCHAR2(20) default ' ' not null,
  tsj       TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'),
  type      VARCHAR2(3) default ' ',
  num       NUMBER(6) default 0,
  channelid VARCHAR2(11) default ' '
)
;

comment on column jrtsch.PVCOUNTER.id
  is '唯一标识';
comment on column jrtsch.PVCOUNTER.tsj
  is '时间';
comment on column jrtsch.PVCOUNTER.type
  is '访问的类型';
comment on column jrtsch.PVCOUNTER.num
  is '访问次数';
comment on column jrtsch.PVCOUNTER.channelid
  is '注册用的渠道号';

create table jrtsch.TACCOUNT
(
  userno          VARCHAR2(8 CHAR) default ' ' not null,
  balance         NUMBER(12) default 0 not null,
  drawbalance     NUMBER(12) default 0 not null,
  lastbetamt      NUMBER(12) default 0 not null,
  lastbettime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  totalbetamt     NUMBER(12) default 0 not null,
  lastprizeamt    NUMBER(12) default 0 not null,
  lastprizetime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  totalprizeamt   NUMBER(12) default 0 not null,
  lastdepositamt  NUMBER(12) default 0 not null,
  lastdeposittime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  totaldepositamt NUMBER(12) default 0 not null,
  lastdrawamt     NUMBER(12) default 0 not null,
  lastdrawtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  totaldrawamt    NUMBER(12) default 0 not null,
  mac             VARCHAR2(64 CHAR) default ' ' not null,
  freezebalance   NUMBER(12) default 0 not null
);


comment on table jrtsch.TACCOUNT
  is '用户账户信息表';
comment on column jrtsch.TACCOUNT.userno
  is '客户编号';
comment on column jrtsch.TACCOUNT.balance
  is '账户余额';
comment on column jrtsch.TACCOUNT.drawbalance
  is '可提现余额';
comment on column jrtsch.TACCOUNT.lastbetamt
  is '上次投注金额';
comment on column jrtsch.TACCOUNT.lastbettime
  is '上次投注日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TACCOUNT.totalbetamt
  is '累计投注金额';
comment on column jrtsch.TACCOUNT.lastprizeamt
  is '上次中奖金额，不计大奖';
comment on column jrtsch.TACCOUNT.lastprizetime
  is '上次中奖日期，不计大奖';
comment on column jrtsch.TACCOUNT.totalprizeamt
  is '累计中奖金额，不计大奖';
comment on column jrtsch.TACCOUNT.lastdepositamt
  is '上次充值金额';
comment on column jrtsch.TACCOUNT.lastdeposittime
  is '上次充值日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TACCOUNT.totaldepositamt
  is '累计充值金额';
comment on column jrtsch.TACCOUNT.lastdrawamt
  is '上次转账金额';
comment on column jrtsch.TACCOUNT.lastdrawtime
  is '上次转账日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TACCOUNT.totaldrawamt
  is '累计转账金额';
comment on column jrtsch.TACCOUNT.mac
  is '敏感数据控制块  采用HASH/MD5算法加密全表字段作为认证用';
comment on column jrtsch.TACCOUNT.freezebalance
  is '用户冻结金额，默认为0';
alter table jrtsch.TACCOUNT
  add constraint PK_TACCOUNT primary key (USERNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TACCOUNTDETAIL
(
  id               VARCHAR2(16 CHAR) default ' ' not null,
  plattime         TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  amt              NUMBER(12) default 0 not null,
  drawamt          NUMBER(12) default 0 not null,
  blsign           NUMBER(5) default 0 not null,
  memo             VARCHAR2(64 CHAR) default ' ' not null,
  balance          NUMBER(12) default 0 not null,
  taccounttype     NUMBER(5) default 0 not null,
  ttransactionid   VARCHAR2(32 CHAR) default ' ' not null,
  ttransactiontype NUMBER(5) default 0 not null,
  mobileid         VARCHAR2(11 CHAR) default ' ' not null,
  userno           VARCHAR2(8 CHAR) default ' ' not null,
  drawbalance      NUMBER(12) default 0 not null,
  mac              VARCHAR2(64 CHAR) default ' ' not null,
  state            NUMBER(5) default 0,
  freezeamt        NUMBER(12) default 0 not null,
  freezebalance    NUMBER(12) default 0 not null
)
;

comment on table jrtsch.TACCOUNTDETAIL
  is '账户变动表';
comment on column jrtsch.TACCOUNTDETAIL.id
  is '账户明细标识';
comment on column jrtsch.TACCOUNTDETAIL.plattime
  is '账户明细记录时间';
comment on column jrtsch.TACCOUNTDETAIL.amt
  is '变动金额，单位：分';
comment on column jrtsch.TACCOUNTDETAIL.drawamt
  is '可提现变动金额，单位：分';
comment on column jrtsch.TACCOUNTDETAIL.blsign
  is '-1：出帐，1：进账';
comment on column jrtsch.TACCOUNTDETAIL.memo
  is '账户科目明细描述';
comment on column jrtsch.TACCOUNTDETAIL.balance
  is '余额，变动后余额，单位：分';
comment on column jrtsch.TACCOUNTDETAIL.taccounttype
  is '账户类型';
comment on column jrtsch.TACCOUNTDETAIL.ttransactionid
  is '交易标识';
comment on column jrtsch.TACCOUNTDETAIL.ttransactiontype
  is '交易类型';
comment on column jrtsch.TACCOUNTDETAIL.mobileid
  is '用户标识';
comment on column jrtsch.TACCOUNTDETAIL.userno
  is '账户标识';
comment on column jrtsch.TACCOUNTDETAIL.drawbalance
  is '余额，变动后可提现余额，单位：分';
comment on column jrtsch.TACCOUNTDETAIL.mac
  is '校验串';
comment on column jrtsch.TACCOUNTDETAIL.state
  is '交易状态：0失败 1成功';
comment on column jrtsch.TACCOUNTDETAIL.freezeamt
  is '冻结变动金额,单位：分，默认为0';
comment on column jrtsch.TACCOUNTDETAIL.freezebalance
  is '余额，变动后的冻结金额,单位：分，默认为0';
alter table jrtsch.TACCOUNTDETAIL
  add constraint PK_TACCOUNTDETAIL primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TACCOUNTLOG
(
  id       VARCHAR2(16 CHAR) default ' ' not null,
  userno   VARCHAR2(8 CHAR) default ' ' not null,
  agencyno VARCHAR2(6 CHAR) default ' ' not null,
  code     VARCHAR2(4 CHAR) default ' ' not null,
  amount   NUMBER(12) default 0 not null,
  plattime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  flowno   VARCHAR2(16 CHAR) default ' ' not null,
  retcode  VARCHAR2(4 CHAR) default ' ' not null,
  info     VARCHAR2(100 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null,
  mac      VARCHAR2(64 CHAR) default ' ' not null
)
;

comment on table jrtsch.TACCOUNTLOG
  is '账务日志记录表';
comment on column jrtsch.TACCOUNTLOG.id
  is '账户明细标识';
comment on column jrtsch.TACCOUNTLOG.userno
  is '客户编号，被赠人';
comment on column jrtsch.TACCOUNTLOG.agencyno
  is '机构编号';
comment on column jrtsch.TACCOUNTLOG.code
  is '交易码，TZ00：投注，ZZ00：转账，CZ00：充值，CZ01：为卡充值，JS00：为结算，TX00：为提现，DZ00：为兑奖，TK00：为退款，ZH00：为追号套餐';
comment on column jrtsch.TACCOUNTLOG.amount
  is '交易金额，是否设限';
comment on column jrtsch.TACCOUNTLOG.plattime
  is '交易日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TACCOUNTLOG.flowno
  is '交易流水号，系统自动生成';
comment on column jrtsch.TACCOUNTLOG.retcode
  is '交易返回码';
comment on column jrtsch.TACCOUNTLOG.info
  is '交易数据段，如充值交易，此字段为空；如转账交易，则在此字段填入转账信息；如购彩交易，此字段为彩票流水号；如结算交易，此字段为结算详细数据信息';
comment on column jrtsch.TACCOUNTLOG.state
  is '处理状态，0：默认未处理，1：已处理，提现结算时使用';
comment on column jrtsch.TACCOUNTLOG.mac
  is '敏感数据控制块  采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TACCOUNTLOG
  add constraint PK_TACCOUNTLOG primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TADVISORYKEYWORD
(
  id             NUMBER not null,
  content        VARCHAR2(100),
  replacecontent VARCHAR2(100)
)
;
create table jrtsch.TBELONGINFO
(
  provcode  VARCHAR2(3 CHAR) default '000' not null,
  provname  VARCHAR2(64 CHAR) default ' ' not null,
  bprovcode VARCHAR2(3 CHAR) default ' ' not null,
  bprovname VARCHAR2(64 CHAR) default ' ' not null
)
;

comment on table jrtsch.TBELONGINFO
  is '用户提现明细表';
comment on column jrtsch.TBELONGINFO.provcode
  is '省代码，未知省填000';
comment on column jrtsch.TBELONGINFO.provname
  is '省名称';
comment on column jrtsch.TBELONGINFO.bprovcode
  is '归属地省代码';
comment on column jrtsch.TBELONGINFO.bprovname
  is '归属地省名称';
alter table jrtsch.TBELONGINFO
  add constraint PK_TBELONGINFO primary key (PROVCODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TBUYLOT
(
  casebuyid  VARCHAR2(16 CHAR) not null,
  userno     VARCHAR2(8 CHAR) default ' ' not null,
  accesstype CHAR(1 CHAR) default ' ' not null,
  agencyno   VARCHAR2(6 CHAR) default ' ' not null,
  caseid     VARCHAR2(16 CHAR) default ' ' not null,
  buyamt     NUMBER(12) default 0 not null,
  buynum     NUMBER(12) default 0 not null,
  buytime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  flag       NUMBER(5) default 0 not null,
  mac        VARCHAR2(64 CHAR) default ' ' not null
)
;

comment on table jrtsch.TBUYLOT
  is '参与彩票合买记录表';
comment on column jrtsch.TBUYLOT.casebuyid
  is '流水号，本系统自动产生的流水号，用来记录唯一标记';
comment on column jrtsch.TBUYLOT.userno
  is '方案发起人编号';
comment on column jrtsch.TBUYLOT.accesstype
  is '接入方式，B表示web，W表示wap，C表示客户端';
comment on column jrtsch.TBUYLOT.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TBUYLOT.caseid
  is '方案编号';
comment on column jrtsch.TBUYLOT.buyamt
  is '认购金额';
comment on column jrtsch.TBUYLOT.buynum
  is '认购份数';
comment on column jrtsch.TBUYLOT.buytime
  is '认购时间';
comment on column jrtsch.TBUYLOT.flag
  is '金额冻结状态，0未处理，1冻结，2，解冻';
comment on column jrtsch.TBUYLOT.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TBUYLOT
  add constraint PK_TBUYLOT primary key (CASEBUYID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCARD
(
  id        VARCHAR2(16 CHAR) default ' ' not null,
  amt       NUMBER(12) default 0 not null,
  type      NUMBER(5) default 0 not null,
  cardfrom  NUMBER(5) default 0 not null,
  cardsn    VARCHAR2(8 CHAR) default ' ' not null,
  state     NUMBER(5) default 0 not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  password  VARCHAR2(8 CHAR) default ' ' not null,
  manager   VARCHAR2(16 CHAR) default ' ' not null,
  batchno   VARCHAR2(16 CHAR) default ' ' not null,
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  selltime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  decrptkey VARCHAR2(64 CHAR) default ' ' not null
)
;

comment on table jrtsch.TCARD
  is '充值卡资源库表';
comment on column jrtsch.TCARD.id
  is '卡片ID，主键、唯一标识(1,1)';
comment on column jrtsch.TCARD.amt
  is '充值卡金额，5位数字表示，00000-99999';
comment on column jrtsch.TCARD.type
  is '卡片种类，外键';
comment on column jrtsch.TCARD.cardfrom
  is '卡片来源，外键';
comment on column jrtsch.TCARD.cardsn
  is '卡序列号码，8位数字：00000000-99999999';
comment on column jrtsch.TCARD.state
  is '卡片状态，外键';
comment on column jrtsch.TCARD.starttime
  is '卡片生成时间，年月日时分秒(系统当前时间)';
comment on column jrtsch.TCARD.endtime
  is '卡片失效日期，年-月-日';
comment on column jrtsch.TCARD.password
  is '卡片密码，生成时时分秒8位数字DES加密';
comment on column jrtsch.TCARD.manager
  is '卡片管理员，生成卡、管理卡片的人员';
comment on column jrtsch.TCARD.batchno
  is '销售批次';
comment on column jrtsch.TCARD.agencyno
  is '渠道编号，外键';
comment on column jrtsch.TCARD.selltime
  is '销售日期，卡管理员向经销商发卡日期';
comment on column jrtsch.TCARD.decrptkey
  is '充值卡密码的解密密钥';
alter table jrtsch.TCARD
  add constraint PK_TCARD primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCARDBAT
(
  id          VARCHAR2(16 CHAR) not null,
  cardmanager VARCHAR2(16 CHAR) default ' ' not null,
  batchno     VARCHAR2(16 CHAR) default ' ' not null,
  beginnumber NUMBER(12) default 0 not null,
  endnumber   NUMBER(12) default 0 not null,
  starttime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null
)
;

comment on table jrtsch.TCARDBAT
  is '充值卡生成批次日志表()';
comment on column jrtsch.TCARDBAT.id
  is '日志id，主键、唯一标识(1,1)';
comment on column jrtsch.TCARDBAT.cardmanager
  is '卡片管理员，卡片操作人员';
comment on column jrtsch.TCARDBAT.batchno
  is '批次，记录卡片生成批次';
comment on column jrtsch.TCARDBAT.beginnumber
  is '开始卡序列号，记录当批次卡开始序列号';
comment on column jrtsch.TCARDBAT.endnumber
  is '结束卡序列号，记录当批次卡结束序列号';
comment on column jrtsch.TCARDBAT.starttime
  is '开始时间，记录当批次卡第一张卡生成时间';
comment on column jrtsch.TCARDBAT.endtime
  is '结束时间，记录当批次卡最后一张卡生成时间';
alter table jrtsch.TCARDBAT
  add constraint PK_TCARDBAT primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCARDFROM
(
  id   NUMBER(5) default 0 not null,
  name VARCHAR2(20 CHAR) default ' ' not null,
  memo VARCHAR2(256 CHAR) default ' ' not null
)
;

comment on table jrtsch.TCARDFROM
  is '充值卡来源数据字典表';
comment on column jrtsch.TCARDFROM.id
  is '来源标识：00-99银行积分，渠道经销商积分，其他运营商积分';
comment on column jrtsch.TCARDFROM.name
  is '来源名称';
comment on column jrtsch.TCARDFROM.memo
  is '备注';
alter table jrtsch.TCARDFROM
  add constraint PK_TCARDFROM primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
-- prompt
-- prompt Creating table TCARDSNSTATE
-- prompt ===========================
-- prompt
create table jrtsch.TCARDSNSTATE
(
  id      VARCHAR2(16 CHAR) default 0 not null,
  beginno NUMBER(12) default 0 not null,
  endno   NUMBER(12) default 0 not null,
  state   NUMBER(5) default 0 not null
)
;

comment on table jrtsch.TCARDSNSTATE
  is '充值卡序列号状态表';
comment on column jrtsch.TCARDSNSTATE.id
  is '日志id，主键、唯一标识(1,1)';
comment on column jrtsch.TCARDSNSTATE.beginno
  is '开始卡序列号，记录卡开始序列号';
comment on column jrtsch.TCARDSNSTATE.endno
  is '结束卡序列号，记录卡结束序列号';
comment on column jrtsch.TCARDSNSTATE.state
  is '状态，外键(激活/未激活/失效/尚未启用)';
alter table jrtsch.TCARDSNSTATE
  add constraint PK_TCARDSNSTATE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCASESTAT
(
  userno        VARCHAR2(8 CHAR) not null,
  makecasenum   NUMBER(12) default 0 not null,
  followcasenum NUMBER(12) default 0 not null
)
;

comment on table jrtsch.TCASESTAT
  is '合买用户统计信息';
comment on column jrtsch.TCASESTAT.userno
  is '用户编号';
comment on column jrtsch.TCASESTAT.makecasenum
  is '用户发单次数';
comment on column jrtsch.TCASESTAT.followcasenum
  is '所有发起方案跟单的总人数之和';
alter table jrtsch.TCASESTAT
  add constraint PK_TCASESTAT primary key (USERNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCASHDETAIL
(
  id             VARCHAR2(32 CHAR) default ' ' not null,
  userno         VARCHAR2(8 CHAR) default ' ' not null,
  ttransactionid VARCHAR2(32 CHAR) default ' ' not null,
  name           VARCHAR2(20 CHAR) default ' ' not null,
  provcode       VARCHAR2(3 CHAR) default '000' not null,
  areacode       VARCHAR2(3 CHAR) default '000' not null,
  provname       VARCHAR2(64 CHAR) default ' ' not null,
  areaname       VARCHAR2(64 CHAR) default ' ' not null,
  amt            NUMBER(12) default 0 not null,
  fee            NUMBER(12) default 0 not null,
  plattime       TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  bankname       VARCHAR2(100 CHAR) default ' ' not null,
  bankaccount    VARCHAR2(32 CHAR) default ' ' not null,
  state          NUMBER(5) default 0 not null,
  subbankname    VARCHAR2(50)
)
;

comment on table jrtsch.TCASHDETAIL
  is '用户提现明细表';
comment on column jrtsch.TCASHDETAIL.id
  is '提现明细标识';
comment on column jrtsch.TCASHDETAIL.userno
  is '账户标识';
comment on column jrtsch.TCASHDETAIL.ttransactionid
  is '交易标识';
comment on column jrtsch.TCASHDETAIL.name
  is '姓名，用户真实姓名';
comment on column jrtsch.TCASHDETAIL.provcode
  is '省代码，未知省填000';
comment on column jrtsch.TCASHDETAIL.areacode
  is '地区代码，未知地区填000';
comment on column jrtsch.TCASHDETAIL.provname
  is '省名称';
comment on column jrtsch.TCASHDETAIL.areaname
  is '地市名称';
comment on column jrtsch.TCASHDETAIL.amt
  is '提现金额，以分为单位';
comment on column jrtsch.TCASHDETAIL.fee
  is '提现手续费，用户提现扣除的手续费总额，以分为单位';
comment on column jrtsch.TCASHDETAIL.plattime
  is '提现时间，默认为系统当前时间，YYYYMMDDhhmmss';
comment on column jrtsch.TCASHDETAIL.bankname
  is '开户行名称';
comment on column jrtsch.TCASHDETAIL.bankaccount
  is '银行账号，用户输入的银行卡卡号';
comment on column jrtsch.TCASHDETAIL.state
  is '支付状态：1成功，2失败';
alter table jrtsch.TCASHDETAIL
  add constraint PK_TCASHDETAIL primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCHANNEL
(
  agencyno   VARCHAR2(6 CHAR) default ' ' not null,
  state      NUMBER(5) default 0 not null,
  type       NUMBER(5) default 0 not null,
  password   VARCHAR2(64 CHAR) default ' ' not null,
  devidemode NUMBER(5) default 0 not null,
  rate       VARCHAR2(30 CHAR) default ' ' not null,
  name       VARCHAR2(20 CHAR) default ' ' not null,
  accname    VARCHAR2(30 CHAR) default ' ' not null,
  bankacc    VARCHAR2(30 CHAR) default ' ' not null,
  bankname   VARCHAR2(30 CHAR) default ' ' not null,
  retailid   VARCHAR2(18 CHAR) default ' ' not null,
  phone      VARCHAR2(50 CHAR) default ' ' not null,
  email      VARCHAR2(32 CHAR) default ' ' not null,
  address    VARCHAR2(40 CHAR) default ' ' not null,
  qq         VARCHAR2(15 CHAR) default ' ' not null,
  msn        VARCHAR2(32 CHAR) default ' ' not null,
  regtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  modtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  awardbound NUMBER(12) default 0 not null,
  info       VARCHAR2(50 CHAR) default ' ' not null,
  mac        VARCHAR2(64 CHAR) default ' ' not null
)
;

comment on table jrtsch.TCHANNEL
  is '分销渠道表';
comment on column jrtsch.TCHANNEL.agencyno
  is '渠道编号，UNIQUE 000001-799999';
comment on column jrtsch.TCHANNEL.state
  is '渠道状态，设定不同的状态以控制交易';
comment on column jrtsch.TCHANNEL.type
  is '渠道种类，区别不同种类的渠道（单位、个人、其他） ';
comment on column jrtsch.TCHANNEL.password
  is '渠道密码摘要  采用MD5加密的摘要';
comment on column jrtsch.TCHANNEL.devidemode
  is '分成模式，1：固定，2：阶梯';
comment on column jrtsch.TCHANNEL.rate
  is '分成比例0-100%，固定：一个百分数字，阶梯：阶梯值1|百分数1#阶梯值2|百分数2#……阶梯值N|百分数N';
comment on column jrtsch.TCHANNEL.name
  is '渠道名称';
comment on column jrtsch.TCHANNEL.accname
  is '结算账户名';
comment on column jrtsch.TCHANNEL.bankacc
  is '结算账户号';
comment on column jrtsch.TCHANNEL.bankname
  is '结算银行名';
comment on column jrtsch.TCHANNEL.retailid
  is '证件号（工商注册号或身份证号）';
comment on column jrtsch.TCHANNEL.phone
  is '联系电话，多个电话可以连在一起';
comment on column jrtsch.TCHANNEL.email
  is '联系人邮件地址';
comment on column jrtsch.TCHANNEL.address
  is '住址';
comment on column jrtsch.TCHANNEL.qq
  is '联系人QQ号';
comment on column jrtsch.TCHANNEL.msn
  is '联系人MSN帐号';
comment on column jrtsch.TCHANNEL.regtime
  is '渠道开户日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TCHANNEL.modtime
  is '上次访问日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TCHANNEL.awardbound
  is '大小奖区分界线，单位：分';
comment on column jrtsch.TCHANNEL.info
  is '备注';
comment on column jrtsch.TCHANNEL.mac
  is '敏感数据控制块，采用HASH/MD5算法加密敏感数据：RETAIL_NO+RETAIL_STATUS+RETAIL_TYPE+RETAIL_RATE+OPEN_DATE+LAST_DATE，作为认证用';
alter table jrtsch.TCHANNEL
  add constraint PK_TCHANNEL primary key (AGENCYNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCHANNELCARD
(
  id        VARCHAR2(16 CHAR) default ' ' not null,
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  cardcode  VARCHAR2(20 CHAR) default ' ' not null,
  cardamt   NUMBER(12) default 0 not null,
  cardcount NUMBER(12) default 0 not null,
  gettime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  decrptkey VARCHAR2(64 CHAR) default ' ' not null
)
;

comment on table jrtsch.TCHANNELCARD
  is '渠道经销商购卡记录表';
comment on column jrtsch.TCHANNELCARD.id
  is '流水号';
comment on column jrtsch.TCHANNELCARD.agencyno
  is '渠道编号，UNIQUE 000001-799999';
comment on column jrtsch.TCHANNELCARD.cardcode
  is '卡号码';
comment on column jrtsch.TCHANNELCARD.cardamt
  is '面值';
comment on column jrtsch.TCHANNELCARD.cardcount
  is '购买个数';
comment on column jrtsch.TCHANNELCARD.gettime
  is '购买日期';
comment on column jrtsch.TCHANNELCARD.decrptkey
  is '卡号密码文件的解密密钥';
alter table jrtsch.TCHANNELCARD
  add constraint PK_TCHANNELCARD primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCHANNELCTRL
(
  agencyno VARCHAR2(6 CHAR) default ' ' not null,
  code     VARCHAR2(2) default ' ' not null
)
;

comment on table jrtsch.TCHANNELCTRL
  is '渠道控制表';
comment on column jrtsch.TCHANNELCTRL.agencyno
  is '渠道号';
comment on column jrtsch.TCHANNELCTRL.code
  is '如意彩充值卡2位卡号段';
alter table jrtsch.TCHANNELCTRL
  add constraint PK_TCHANNELCTRL primary key (AGENCYNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCHECKINNER
(
  checkdate TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  difftype  NUMBER(5) default 0 not null
)
;

comment on table jrtsch.TCHECKINNER
  is '内部对帐结果表';
comment on column jrtsch.TCHECKINNER.checkdate
  is '账务日期';
comment on column jrtsch.TCHECKINNER.starttime
  is '账目时间，YYYYMMDDhhmmss';
comment on column jrtsch.TCHECKINNER.endtime
  is '账目时间，YYYYMMDDhhmmss';
comment on column jrtsch.TCHECKINNER.difftype
  is '差异类型，以平台为中心，平台多1，平台少的记-1，平的记0，2：金额不平';
alter table jrtsch.TCHECKINNER
  add constraint PK_TCHECKINNER primary key (CHECKDATE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCHECKRESULT
(
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  seqno         VARCHAR2(32 CHAR) default ' ' not null,
  type          NUMBER(5) default 0 not null,
  plattime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  amt           NUMBER(12) default 0 not null,
  difftype      NUMBER(5) default 0 not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  termcode      VARCHAR2(7 CHAR) default ' ' not null,
  tfileresultid VARCHAR2(32 CHAR) not null
)
;

comment on table jrtsch.TCHECKRESULT
  is '对帐结果表';
comment on column jrtsch.TCHECKRESULT.agencyno
  is '渠道编号，UNIQUE 000001-799999，平台账目为000001';
comment on column jrtsch.TCHECKRESULT.seqno
  is '交易流水';
comment on column jrtsch.TCHECKRESULT.type
  is '0：交易对账，1：中奖对账';
comment on column jrtsch.TCHECKRESULT.plattime
  is '账目时间，YYYYMMDDhhmmss';
comment on column jrtsch.TCHECKRESULT.amt
  is '金额，以分为单位';
comment on column jrtsch.TCHECKRESULT.difftype
  is '差异类型，以平台为中心，平台多1，平台少的记-1，平的记0，2：金额不平';
comment on column jrtsch.TCHECKRESULT.lotno
  is '彩种编号';
comment on column jrtsch.TCHECKRESULT.termcode
  is '期号';
comment on column jrtsch.TCHECKRESULT.tfileresultid
  is '文件处理结果流水号';
alter table jrtsch.TCHECKRESULT
  add constraint PK_TCHECKRESULT primary key (AGENCYNO, SEQNO, TYPE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
create table jrtsch.TCHECKSTAT
(
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  platdate      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  num           NUMBER(12) default 0 not null,
  amt           NUMBER(12) default 0 not null,
  nnum          NUMBER(12) default 0 not null,
  namt          NUMBER(12) default 0 not null,
  type          NUMBER(5) default 0 not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  termcode      VARCHAR2(7 CHAR) default ' ' not null,
  tfileresultid VARCHAR2(32 CHAR) not null
)
;

comment on table jrtsch.TCHECKSTAT
  is '对帐统计表';
comment on column jrtsch.TCHECKSTAT.agencyno
  is '渠道编号，UNIQUE 000001-799999，平台账目为000001';
comment on column jrtsch.TCHECKSTAT.platdate
  is '账目日期，YYYYMMDD';
comment on column jrtsch.TCHECKSTAT.num
  is '平帐笔数';
comment on column jrtsch.TCHECKSTAT.amt
  is '平帐金额，以分为单位';
comment on column jrtsch.TCHECKSTAT.nnum
  is '不平帐笔数，以分为单位';
comment on column jrtsch.TCHECKSTAT.namt
  is '不平帐金额，以分为单位';
comment on column jrtsch.TCHECKSTAT.type
  is '对账统计类型 （0 交易对账，1 中将对账）';
comment on column jrtsch.TCHECKSTAT.lotno
  is '彩种编号';
comment on column jrtsch.TCHECKSTAT.termcode
  is '期号';
comment on column jrtsch.TCHECKSTAT.tfileresultid
  is '文件处理结果流水号';
alter table jrtsch.TCHECKSTAT
  add constraint PK_TCHECKSTAT primary key (AGENCYNO, PLATDATE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
;
-- prompt
-- prompt Creating table TCHECKTEMP
-- prompt =========================
-- prompt
create table jrtsch.TCHECKTEMP
(
  agentcyno     VARCHAR2(6 CHAR) default ' ' not null,
  seqno         VARCHAR2(32 CHAR) default ' ' not null,
  plattime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  amt           NUMBER(12) default 0 not null,
  retcode       VARCHAR2(8 CHAR) default ' ' not null,
  tfileresultid VARCHAR2(32 CHAR) not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TCHECKTEMP
  is '合作方对帐源表';
comment on column jrtsch.TCHECKTEMP.agentcyno
  is '渠道编号，UNIQUE 000001-799999，平台账目为000001';
comment on column jrtsch.TCHECKTEMP.seqno
  is '交易流水';
comment on column jrtsch.TCHECKTEMP.plattime
  is '交易时间，YYYYMMDDhhmmss';
comment on column jrtsch.TCHECKTEMP.amt
  is '金额，以分为单位';
comment on column jrtsch.TCHECKTEMP.retcode
  is '交易状态';
comment on column jrtsch.TCHECKTEMP.tfileresultid
  is '文件处理结果流水号';
alter table jrtsch.TCHECKTEMP
  add constraint PK_TCHECKTEMP primary key (AGENTCYNO, SEQNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TCHECKTICKETTEMP
-- prompt ===============================
-- prompt
create table jrtsch.TCHECKTICKETTEMP
(
  agentno       VARCHAR2(6 CHAR) not null,
  ticketcode    VARCHAR2(32 CHAR) not null,
  type          NUMBER(5) not null,
  ename         VARCHAR2(12 CHAR) default ' ' not null,
  selltermcode  VARCHAR2(10 CHAR) default ' ' not null,
  validtermcode VARCHAR2(10 CHAR) default ' ' not null,
  runcode       VARCHAR2(20 CHAR) default ' ' not null,
  amt           NUMBER(12) default 0 not null,
  plattime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  retcode       VARCHAR2(8 CHAR) default ' ' not null,
  tfileresultid VARCHAR2(32 CHAR) not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TCHECKTICKETTEMP
  is '福彩对账源表';
comment on column jrtsch.TCHECKTICKETTEMP.agentno
  is '渠道编号，UNIQUE 000001-799999，平台账目为000001';
comment on column jrtsch.TCHECKTICKETTEMP.ticketcode
  is '票面密码';
comment on column jrtsch.TCHECKTICKETTEMP.type
  is '对账类型(0 彩票销售对账，1兑奖对账)';
comment on column jrtsch.TCHECKTICKETTEMP.ename
  is '玩法英文名称';
comment on column jrtsch.TCHECKTICKETTEMP.selltermcode
  is '销售期号';
comment on column jrtsch.TCHECKTICKETTEMP.validtermcode
  is '有效期号';
comment on column jrtsch.TCHECKTICKETTEMP.runcode
  is '流水号';
comment on column jrtsch.TCHECKTICKETTEMP.amt
  is '中奖总金额，彩票销售金额';
comment on column jrtsch.TCHECKTICKETTEMP.plattime
  is '交易时间';
comment on column jrtsch.TCHECKTICKETTEMP.retcode
  is '交易状态 ';
comment on column jrtsch.TCHECKTICKETTEMP.tfileresultid
  is '文件处理结果流水号';
alter table jrtsch.TCHECKTICKETTEMP
  add constraint PK_TCHECKTICKETTEMP primary key (AGENTNO, TICKETCODE, TYPE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TCLIENTVER
-- prompt =========================
-- prompt
create table jrtsch.TCLIENTVER
(
  id           VARCHAR2(4 CHAR) default ' ' not null,
  info         VARCHAR2(100 CHAR) default ' ' not null,
  state        NUMBER(5) default 0 not null,
  downloadtype NUMBER(5) default 0 not null,
  downloadadd  VARCHAR2(128 CHAR) default ' ' not null,
  releasetime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TCLIENTVER
  is '客户端版本信息';
comment on column jrtsch.TCLIENTVER.id
  is '版本号';
comment on column jrtsch.TCLIENTVER.info
  is '版本信息';
comment on column jrtsch.TCLIENTVER.state
  is '版本状态，0：开通可用，1：过期可用，2：过期不可用';
comment on column jrtsch.TCLIENTVER.downloadtype
  is '下载方式';
comment on column jrtsch.TCLIENTVER.downloadadd
  is '下载地址';
comment on column jrtsch.TCLIENTVER.releasetime
  is '发布日期，YYYYMMDD';
alter table jrtsch.TCLIENTVER
  add constraint PK_TCLIENTVER primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TCOLLABORARIONWIN
-- prompt ================================
-- prompt
create table jrtsch.TCOLLABORARIONWIN
(
  id           VARCHAR2(16 CHAR) not null,
  caseid       VARCHAR2(16 CHAR) default ' ' not null,
  userno       VARCHAR2(8 CHAR) default ' ' not null,
  userwinmoeny NUMBER(12) default 0 not null,
  pushmonry    NUMBER(12) default 0 not null,
  mac          VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TCOLLABORARIONWIN
  is '合买用户中奖金额';
comment on column jrtsch.TCOLLABORARIONWIN.id
  is '方案编号';
comment on column jrtsch.TCOLLABORARIONWIN.caseid
  is '方案编号';
comment on column jrtsch.TCOLLABORARIONWIN.userno
  is '用户编号';
comment on column jrtsch.TCOLLABORARIONWIN.userwinmoeny
  is '用户合买分奖金额, 默认为0';
comment on column jrtsch.TCOLLABORARIONWIN.pushmonry
  is '发起人实际获得佣金数, 默认为0';
comment on column jrtsch.TCOLLABORARIONWIN.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TCOLLABORARIONWIN
  add constraint PK_TCOLLABORARIONWIN primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TCOUNTXJFC
-- prompt =========================
-- prompt
create table jrtsch.TCOUNTXJFC
(
  countid    NUMBER(5) not null,
  mobileid   VARCHAR2(11) default ' ' not null,
  settletype NUMBER(5) default 0 not null,
  amt        NUMBER(12) default 0 not null,
  transid    VARCHAR2(32) default ' ' not null,
  platdate   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TCOUNTXJFC
  is '新疆账目科目明细表';
comment on column jrtsch.TCOUNTXJFC.countid
  is '科目id，见前面科目描述';
comment on column jrtsch.TCOUNTXJFC.settletype
  is '科目类别，1：投注，2：充值，3：中奖，4：手续费…';
comment on column jrtsch.TCOUNTXJFC.amt
  is '发生金额';
comment on column jrtsch.TCOUNTXJFC.transid
  is '交易表交易标识';
comment on column jrtsch.TCOUNTXJFC.platdate
  is '发生时间';
alter table jrtsch.TCOUNTXJFC
  add constraint 科目ID primary key (COUNTID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TDNABIND
-- prompt =======================
-- prompt
create table jrtsch.TDNABIND
(
  id            VARCHAR2(32 CHAR) not null,
  mobileid      VARCHAR2(11 CHAR) default ' ' not null,
  name          VARCHAR2(30 CHAR) default ' ' not null,
  bankcardno    VARCHAR2(30 CHAR) default ' ' not null,
  certid        VARCHAR2(18 CHAR) default ' ' not null,
  bankaddress   VARCHAR2(100 CHAR) default ' ' not null,
  certidaddress VARCHAR2(100 CHAR) default ' ' not null,
  bindtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TDNABIND
  is 'DNA账户绑定表';
comment on column jrtsch.TDNABIND.id
  is '主键';
comment on column jrtsch.TDNABIND.mobileid
  is '手机号，用户在平台的注册手机号';
comment on column jrtsch.TDNABIND.name
  is '开户姓名，开户时的真实姓名(如果用户本来就是DNA的白名单用户则不需要该参数)';
comment on column jrtsch.TDNABIND.bankcardno
  is '银行卡号，用户要在DNA绑定的银行卡号';
comment on column jrtsch.TDNABIND.certid
  is '开户身份证号，开户时使用的身份证号码(如果用户本来就是DNA的白名单用户则不需要该参数)';
comment on column jrtsch.TDNABIND.bankaddress
  is '开户行所在地，开户时的所在城市(如果用户本来就是DNA的白名单用户则不需要该参数)';
comment on column jrtsch.TDNABIND.certidaddress
  is '开户证件所在地，身份证所在地(如果用户本来就是DNA的白名单用户则不需要该参数)';
comment on column jrtsch.TDNABIND.bindtime
  is '首次绑定时间，默认为系统当前时间';
comment on column jrtsch.TDNABIND.state
  is '生效状态，在用户首次使用DNA银行卡充值时会在该表插入一条绑定记录，初始生效状态为0是无效，在后台Servlet接收到DNA充值成功的响应后，将该状态修改为1即有效。状态为1的绑定记录是不能删除和修改的。';
alter table jrtsch.TDNABIND
  add constraint PK_TDNABIND primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TDRAWFEE
-- prompt =======================
-- prompt
create table jrtsch.TDRAWFEE
(
  bankid   NUMBER(12) default 0 not null,
  bankname VARCHAR2(100 CHAR) default ' ' not null,
  bankrate NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TDRAWFEE
  is '提现手续费管理表';
comment on column jrtsch.TDRAWFEE.bankid
  is '银行id  主键、唯一标识(1,1)';
comment on column jrtsch.TDRAWFEE.bankname
  is '银行名称  如：建设银行/工商银行';
comment on column jrtsch.TDRAWFEE.bankrate
  is '费率，单位：万分之';
alter table jrtsch.TDRAWFEE
  add constraint PK_TDRAWFEE primary key (BANKID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TDSKDETAILLOGS
-- prompt =============================
-- prompt
create table jrtsch.TDSKDETAILLOGS
(
  tdsklogid   VARCHAR2(32 CHAR) not null,
  dskname     VARCHAR2(32 CHAR) default ' ' not null,
  plattime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  total       NUMBER(12) default 0 not null,
  free        NUMBER(12) default 0 not null,
  utilization NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TDSKDETAILLOGS
  is '磁盘详细检测日志';
comment on column jrtsch.TDSKDETAILLOGS.tdsklogid
  is '检测流水 MyyyyMMddHHmmss+序列号(6位) ';
comment on column jrtsch.TDSKDETAILLOGS.dskname
  is '磁盘标示';
comment on column jrtsch.TDSKDETAILLOGS.plattime
  is '检测时间';
comment on column jrtsch.TDSKDETAILLOGS.total
  is '总磁盘空间量';
comment on column jrtsch.TDSKDETAILLOGS.free
  is '空闲磁盘空间量';
comment on column jrtsch.TDSKDETAILLOGS.utilization
  is '利用率';
alter table jrtsch.TDSKDETAILLOGS
  add constraint PK_TDSKDETAILLOGS primary key (TDSKLOGID, DSKNAME)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.INDEX_3 on jrtsch.TDSKDETAILLOGS (PLATTIME)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TDSKLOGS
-- prompt =======================
-- prompt
create table jrtsch.TDSKLOGS
(
  id          VARCHAR2(32 CHAR) not null,
  plattime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tnodeid     VARCHAR2(16 CHAR) not null,
  tserviceid  NUMBER(8) default 0 not null,
  type        VARCHAR2(16 CHAR) default ' ' not null,
  state       NUMBER(5) default 0 not null,
  total       NUMBER(12) default 0 not null,
  free        NUMBER(12) default 0 not null,
  utilization NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TDSKLOGS
  is '磁盘检测日志表';
comment on column jrtsch.TDSKLOGS.id
  is '检测流水 MyyyyMMddHHmmss+序列号(6位) ';
comment on column jrtsch.TDSKLOGS.plattime
  is '检测时间';
comment on column jrtsch.TDSKLOGS.tnodeid
  is '节点标示';
comment on column jrtsch.TDSKLOGS.tserviceid
  is '服务标示（端口），外键';
comment on column jrtsch.TDSKLOGS.type
  is '服务类型 RESIN，外键';
comment on column jrtsch.TDSKLOGS.state
  is '状态，0：false，1：ok';
comment on column jrtsch.TDSKLOGS.total
  is '总磁盘空间量';
comment on column jrtsch.TDSKLOGS.free
  is '空闲磁盘空间量';
comment on column jrtsch.TDSKLOGS.utilization
  is '利用率';
alter table jrtsch.TDSKLOGS
  add constraint PK_TDSKLOGS primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.INDEX_4 on jrtsch.TDSKLOGS (PLATTIME)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TEST1
-- prompt ====================
-- prompt
create table jrtsch.TEST1
(
  a CHAR(10),
  b NUMBER
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TFEEFORMULA
-- prompt ==========================
-- prompt
create table jrtsch.TFEEFORMULA
(
  id                 VARCHAR2(32 CHAR) not null,
  ttransactiontypeid NUMBER(5) default 0 not null,
  name               VARCHAR2(16 CHAR) default ' ' not null,
  memo               VARCHAR2(64 CHAR) default ' ' not null,
  feerate            NUMBER(5) default 0 not null,
  lowerlimit         NUMBER(12) default 0 not null,
  upperlimit         NUMBER(12) default -1 not null,
  regtime            TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tloguserid         VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TFEEFORMULA
  is '费率公式表';
comment on column jrtsch.TFEEFORMULA.id
  is '费率公式标识，FFnnnn';
comment on column jrtsch.TFEEFORMULA.ttransactiontypeid
  is '交易类型';
comment on column jrtsch.TFEEFORMULA.name
  is '名称';
comment on column jrtsch.TFEEFORMULA.memo
  is '描述';
comment on column jrtsch.TFEEFORMULA.feerate
  is '单位：万分之n';
comment on column jrtsch.TFEEFORMULA.lowerlimit
  is '手续费下限，单位：分';
comment on column jrtsch.TFEEFORMULA.upperlimit
  is '手续费上限，单位：分，-1表示不设上限';
comment on column jrtsch.TFEEFORMULA.regtime
  is '录入时间';
comment on column jrtsch.TFEEFORMULA.tloguserid
  is '用户标识';
alter table jrtsch.TFEEFORMULA
  add constraint PK_TFEEFORMULA primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TFEEPROFORMULA
-- prompt =============================
-- prompt
create table jrtsch.TFEEPROFORMULA
(
  tfeeprogramid      VARCHAR2(32 CHAR) not null,
  tfeeformulaid      VARCHAR2(32 CHAR) not null,
  ttransactiontypeid NUMBER(5) default 0 not null,
  regtime            TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tloguserid         VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TFEEPROFORMULA
  is '费率方案公式关联表';
comment on column jrtsch.TFEEPROFORMULA.tfeeprogramid
  is '费率方案标识';
comment on column jrtsch.TFEEPROFORMULA.tfeeformulaid
  is '费率公式标识';
comment on column jrtsch.TFEEPROFORMULA.ttransactiontypeid
  is '交易类型';
comment on column jrtsch.TFEEPROFORMULA.regtime
  is '录入时间';
comment on column jrtsch.TFEEPROFORMULA.tloguserid
  is '用户标识';
alter table jrtsch.TFEEPROFORMULA
  add constraint PK_TFEEPROFORMULA primary key (TFEEPROGRAMID, TFEEFORMULAID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.UKEY1 on jrtsch.TFEEPROFORMULA (TFEEPROGRAMID, TTRANSACTIONTYPEID)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TFEEPROGRAM
-- prompt ==========================
-- prompt
create table jrtsch.TFEEPROGRAM
(
  id         VARCHAR2(32 CHAR) not null,
  name       VARCHAR2(16 CHAR) default ' ' not null,
  memo       VARCHAR2(64 CHAR) default ' ' not null,
  regtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tloguserid VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TFEEPROGRAM
  is '费率方案表';
comment on column jrtsch.TFEEPROGRAM.id
  is '费率方案标识，FPnnnn';
comment on column jrtsch.TFEEPROGRAM.name
  is '名称';
comment on column jrtsch.TFEEPROGRAM.memo
  is '描述';
comment on column jrtsch.TFEEPROGRAM.regtime
  is '录入时间';
comment on column jrtsch.TFEEPROGRAM.tloguserid
  is '用户标识';
alter table jrtsch.TFEEPROGRAM
  add constraint PK_TFEEPROGRAM primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TFEERATE
-- prompt =======================
-- prompt
create table jrtsch.TFEERATE
(
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  productno VARCHAR2(4 CHAR) default ' ' not null,
  name      VARCHAR2(20 CHAR) default ' ' not null,
  state     NUMBER(5) default 0 not null,
  feemode   NUMBER(5) default 0 not null,
  rate      VARCHAR2(30 CHAR) default ' ' not null,
  info      VARCHAR2(50 CHAR) default ' ' not null,
  mac       VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TFEERATE
  is '费率表';
comment on column jrtsch.TFEERATE.agencyno
  is '渠道编号，支付机构';
comment on column jrtsch.TFEERATE.productno
  is '产品编号';
comment on column jrtsch.TFEERATE.name
  is '产品名称';
comment on column jrtsch.TFEERATE.state
  is '产品状态，0：可用，1：不可用';
comment on column jrtsch.TFEERATE.feemode
  is '费率模式：0：固定，1：阶梯';
comment on column jrtsch.TFEERATE.rate
  is '手续费比例，固定：一个百分数字，阶梯：阶梯值1|百分数1#阶梯值2|百分数2#……阶梯值N|百分数N';
comment on column jrtsch.TFEERATE.info
  is '保留';
comment on column jrtsch.TFEERATE.mac
  is '敏感数据控制块，采用HASH/MD5算法加密敏感数据：作为认证用';
alter table jrtsch.TFEERATE
  add constraint PK_TFEERATE primary key (AGENCYNO, PRODUCTNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TFILERESULT
-- prompt ==========================
-- prompt
create table jrtsch.TFILERESULT
(
  id       VARCHAR2(32 CHAR) not null,
  plattime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  filepath VARCHAR2(256 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null,
  type     NUMBER(5) default 0 not null,
  agencyno VARCHAR2(8 CHAR) default ' '
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TFILERESULT
  is '福彩中心下传文件处理结果表';
comment on column jrtsch.TFILERESULT.id
  is '流水号';
comment on column jrtsch.TFILERESULT.plattime
  is '处理日期';
comment on column jrtsch.TFILERESULT.filepath
  is '文件名';
comment on column jrtsch.TFILERESULT.state
  is '处理状态，0：未处理，1：处理成功，2：处理失败';
comment on column jrtsch.TFILERESULT.type
  is '0：非福彩对账文件，1：福彩销售对账文件，2：福彩兑奖对账文件，3：易宝充值对账文件';
comment on column jrtsch.TFILERESULT.agencyno
  is '福彩中心渠道号';
alter table jrtsch.TFILERESULT
  add constraint PK_TFILERESULT primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TGIFT
-- prompt ====================
-- prompt
create table jrtsch.TGIFT
(
  id           VARCHAR2(16 CHAR) not null,
  biguserno    VARCHAR2(8 CHAR) default ' ' not null,
  smalluserno  VARCHAR2(11 CHAR) default ' ' not null,
  flag         NUMBER(5) default 0 not null,
  flowno       VARCHAR2(16 CHAR) default ' ' not null,
  tgiftauditid VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TGIFT
  is '大客户赠送关系表';
comment on column jrtsch.TGIFT.id
  is '流水号';
comment on column jrtsch.TGIFT.biguserno
  is '大客户的编号';
comment on column jrtsch.TGIFT.smalluserno
  is '小客户的手机号';
comment on column jrtsch.TGIFT.flag
  is '状态标志：0为赠送失败，1给赠送成功';
comment on column jrtsch.TGIFT.flowno
  is '投注表的流水号';
comment on column jrtsch.TGIFT.tgiftauditid
  is '审核表的id';
alter table jrtsch.TGIFT
  add constraint PK_TGIFT primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TGIFTAUDIT
-- prompt =========================
-- prompt
create table jrtsch.TGIFTAUDIT
(
  id         VARCHAR2(16 CHAR) not null,
  biguserno  VARCHAR2(8 CHAR) default ' ' not null,
  bigname    VARCHAR2(64 CHAR) default ' ' not null,
  allamt     NUMBER(12) default 0 not null,
  flowno     VARCHAR2(16 CHAR) default ' ' not null,
  flag       NUMBER(5) default 0 not null,
  lotno      VARCHAR2(6 CHAR) default ' ' not null,
  betnum     NUMBER(12) default 0 not null,
  success    NUMBER(12) default 0 not null,
  failure    NUMBER(12) default 0 not null,
  agetime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  aftertime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  smscontent VARCHAR2(510 CHAR) default ' ' not null,
  agencycode VARCHAR2(10) default ''
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TGIFTAUDIT
  is '大客户赠送审核表';
comment on column jrtsch.TGIFTAUDIT.id
  is '流水号';
comment on column jrtsch.TGIFTAUDIT.biguserno
  is '大客户的编号';
comment on column jrtsch.TGIFTAUDIT.bigname
  is '大客户名字';
comment on column jrtsch.TGIFTAUDIT.allamt
  is '审核总金额';
comment on column jrtsch.TGIFTAUDIT.flowno
  is '“审核类型：0000为运营系统批量赠送，1111为客户端HTTP请求小批量赠送，其它”';
comment on column jrtsch.TGIFTAUDIT.flag
  is '审核状态标志，0 ：待审，1：通过，2：未通过';
comment on column jrtsch.TGIFTAUDIT.lotno
  is '彩票种类';
comment on column jrtsch.TGIFTAUDIT.betnum
  is '注数';
comment on column jrtsch.TGIFTAUDIT.success
  is '成功记录';
comment on column jrtsch.TGIFTAUDIT.failure
  is '批量任务完成标志，0 ：未完全完成，1 ：已完全完成';
comment on column jrtsch.TGIFTAUDIT.agetime
  is '受审前时间';
comment on column jrtsch.TGIFTAUDIT.aftertime
  is '审批后时间';
comment on column jrtsch.TGIFTAUDIT.smscontent
  is '短信内容';
alter table jrtsch.TGIFTAUDIT
  add constraint PK_TGIFTAUDIT primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TKEYWORD
-- prompt =======================
-- prompt
create table jrtsch.TKEYWORD
(
  id       NUMBER(10) not null,
  content  VARCHAR2(30) not null,
  datetime TIMESTAMP(6)
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TKEYWORD
  is '关键字表';
comment on column jrtsch.TKEYWORD.id
  is '主键';
comment on column jrtsch.TKEYWORD.content
  is '关键字';
comment on column jrtsch.TKEYWORD.datetime
  is '添加关键字时间';
alter table jrtsch.TKEYWORD
  add primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOGUSER
-- prompt =======================
-- prompt
create table jrtsch.TLOGUSER
(
  userid   VARCHAR2(16 CHAR) default ' ' not null,
  pwd      VARCHAR2(64 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null,
  nickname VARCHAR2(32 CHAR) default ' ' not null,
  prestr   VARCHAR2(100 CHAR) default ' ' not null,
  agencyno VARCHAR2(8) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOGUSER
  is '运营系统用户表';
comment on column jrtsch.TLOGUSER.userid
  is '用户编号';
comment on column jrtsch.TLOGUSER.pwd
  is '加密密码';
comment on column jrtsch.TLOGUSER.state
  is '状态';
comment on column jrtsch.TLOGUSER.nickname
  is '显示名';
comment on column jrtsch.TLOGUSER.prestr
  is '权限控制串，36位数字串';
comment on column jrtsch.TLOGUSER.agencyno
  is '表示用户属于哪个渠道。';
alter table jrtsch.TLOGUSER
  add constraint PK_TLOGUSER primary key (USERID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOT
-- prompt ===================
-- prompt
create table jrtsch.TLOT
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  lotpwd        VARCHAR2(32 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  batchcode     VARCHAR2(7 CHAR) default ' ' not null,
  validcode     VARCHAR2(7 CHAR) default ' ' not null,
  runcode       VARCHAR2(8 CHAR) default ' ' not null,
  betnum        NUMBER(9) default 0 not null,
  drawway       NUMBER(5) default 0 not null,
  sellway       NUMBER(5) default 0 not null,
  betcode       VARCHAR2(120 CHAR) default ' ' not null,
  checkcode     VARCHAR2(64 CHAR) default ' ' not null,
  amt           NUMBER(12) default 0 not null,
  ordertime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  settleflag    NUMBER(5) default 0 not null,
  prizeamt      NUMBER(12) default 0 not null,
  prizelittle   NUMBER(12) default 0 not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  prizetime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  machineno     VARCHAR2(20 CHAR) default ' ' not null,
  giveuptime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null,
  transferstate NUMBER(5) default 0 not null,
  bettype       NUMBER(5) default 0 not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null,
  subscribeno   VARCHAR2(16 CHAR) default ' ',
  pbatchcode    VARCHAR2(7 CHAR) default ' ' not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOT
  is '彩票记录表';
comment on column jrtsch.TLOT.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TLOT.userno
  is '客户编号';
comment on column jrtsch.TLOT.lotno
  is '彩种编号';
comment on column jrtsch.TLOT.lotpwd
  is '票面密码';
comment on column jrtsch.TLOT.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TLOT.batchcode
  is '彩票销售期号';
comment on column jrtsch.TLOT.validcode
  is '彩票有效期号';
comment on column jrtsch.TLOT.runcode
  is '彩票流水号，这是福彩、体彩中心系统下传的流水号，不是本系统产生的';
comment on column jrtsch.TLOT.betnum
  is '彩票注数';
comment on column jrtsch.TLOT.drawway
  is '投注方式，（0-单式，1-复式，2-胆拖）';
comment on column jrtsch.TLOT.sellway
  is '销售方式，（0-自选，1-手选，2-机选）';
comment on column jrtsch.TLOT.betcode
  is '彩票注码';
comment on column jrtsch.TLOT.checkcode
  is '彩票校验码';
comment on column jrtsch.TLOT.amt
  is '投注金额';
comment on column jrtsch.TLOT.ordertime
  is '投注时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOT.settleflag
  is '兑奖标记，0：未兑奖，1：已兑奖，9：部分兑奖，指该张彩票有大奖的情况。兑奖后系统将该记录移入历史表';
comment on column jrtsch.TLOT.prizeamt
  is '中奖总金额';
comment on column jrtsch.TLOT.prizelittle
  is '中奖小奖总金额';
comment on column jrtsch.TLOT.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TLOT.prizetime
  is '兑奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOT.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TLOT.giveuptime
  is '弃奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOT.state
  is '投注状态，0：失败，1：成功，2：处理中';
comment on column jrtsch.TLOT.transferstate
  is '划款状态，0：未划款，1：已划款，2：划款失败';
comment on column jrtsch.TLOT.bettype
  is '投注类型，0：追号，1：套餐，2：购彩';
comment on column jrtsch.TLOT.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
comment on column jrtsch.TLOT.subscribeno
  is '追号、套餐彩票的交易流水号，记录在账务日志记录表里的交易流水号，用来检索查询';
comment on column jrtsch.TLOT.pbatchcode
  is '兑奖期号';
comment on column jrtsch.TLOT.caseid
  is '方案编号';
alter table jrtsch.TLOT
  add constraint PK_TLOT primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTCASE
-- prompt =======================
-- prompt
create table jrtsch.TLOTCASE
(
  id                VARCHAR2(16 CHAR) not null,
  userno            VARCHAR2(8 CHAR) default ' ' not null,
  accesstype        CHAR(1 CHAR) default ' ' not null,
  batchcode         VARCHAR2(7 CHAR) default ' ' not null,
  caseallamt        NUMBER(12) default 0 not null,
  caseallamtcostone NUMBER(12) default 0 not null,
  caseallamtcostsec NUMBER(12) default 0 not null,
  casenum           NUMBER(12) default 0 not null,
  caseoneamt        NUMBER(12) default 0 not null,
  caseallnum        NUMBER(12) default 0 not null,
  casebaodiamt      NUMBER(12) default 0 not null,
  casebaodiamtttrue NUMBER(12) default 0 not null,
  casebuyamtbyuser  NUMBER(12) default 0 not null,
  casebuyafteramt   NUMBER(12) default 0 not null,
  casebuyafternum   NUMBER(12) default 0 not null,
  pushmoney         VARCHAR2(6 CHAR) default ' ' not null,
  agencyno          VARCHAR2(6 CHAR) default ' ' not null,
  casestarttime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  caseendtime       TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  flag              NUMBER(5) default 0 not null,
  describe          VARCHAR2(100 CHAR) default ' ' not null,
  casetitle         VARCHAR2(220 CHAR) default ' ' not null,
  openflag          NUMBER(5) default 0 not null,
  casefilename      VARCHAR2(50 CHAR) default ' ' not null,
  casecontent       VARCHAR2(4000 CHAR) default ' ' not null,
  lotno             VARCHAR2(6 CHAR) default ' ' not null,
  drawway           NUMBER(5) default 0 not null,
  winflag           NUMBER(5) default 1 not null,
  baodibyruyicai    NUMBER(12) default 0 not null,
  winallamt         NUMBER(12) default 0 not null,
  winlittleamt      NUMBER(12) default 0 not null,
  winbigamt         NUMBER(12) default 0 not null,
  winstarttime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  winendtime        TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  winparticular     VARCHAR2(240 CHAR) default ' ' not null,
  caselostinfo      VARCHAR2(150 CHAR) default ' ' not null,
  mac               VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTCASE
  is '合买方案记录表';
comment on column jrtsch.TLOTCASE.id
  is '流水号，本系统自动产生的合买方案流水号，用来记录一个方案的唯一标记';
comment on column jrtsch.TLOTCASE.userno
  is '方案发起人编号';
comment on column jrtsch.TLOTCASE.accesstype
  is '接入方式，B表示web，W表示wap，C表示客户端';
comment on column jrtsch.TLOTCASE.batchcode
  is '期号';
comment on column jrtsch.TLOTCASE.caseallamt
  is '方案总金额';
comment on column jrtsch.TLOTCASE.caseallamtcostone
  is '一次扣款金额，默认为0';
comment on column jrtsch.TLOTCASE.caseallamtcostsec
  is '二次扣款金额，默认为0';
comment on column jrtsch.TLOTCASE.casenum
  is '倍数';
comment on column jrtsch.TLOTCASE.caseoneamt
  is '方案单份金额';
comment on column jrtsch.TLOTCASE.caseallnum
  is '方案总份数';
comment on column jrtsch.TLOTCASE.casebaodiamt
  is '方案保底份数';
comment on column jrtsch.TLOTCASE.casebaodiamtttrue
  is '实际保底份数，默认为0';
comment on column jrtsch.TLOTCASE.casebuyamtbyuser
  is '发起人认购份数';
comment on column jrtsch.TLOTCASE.casebuyafteramt
  is '参与用户已认购进度比例（发起人认购+参与用户认购），默认为0';
comment on column jrtsch.TLOTCASE.casebuyafternum
  is '参与用户认购份数 ';
comment on column jrtsch.TLOTCASE.pushmoney
  is '发起人提成比例';
comment on column jrtsch.TLOTCASE.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TLOTCASE.casestarttime
  is '方案发起时间YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTCASE.caseendtime
  is '方案认购结束时间YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTCASE.flag
  is '方案状态, 0：进行中，1：成功（已出票），2：失败，3：部分成功（有投注失败记录），4已撤销（发起人撤销）5：合买失败（程序撤销），6：满员，派奖后系统将该记录移入历史表';
comment on column jrtsch.TLOTCASE.describe
  is '方案推荐描述，默认为’ ’';
comment on column jrtsch.TLOTCASE.casetitle
  is '方案标题,默认为’ ’';
comment on column jrtsch.TLOTCASE.openflag
  is '方案对如意彩开放状态，0为公开，1为方案结束后公开，2为认购后公开（0：只要是如意彩登录用户就可看到方案内容；1：用户只能在方案认购时间截止后看到；2：只有认购此方案，认购用户可被看到方案内容）,默认为0';
comment on column jrtsch.TLOTCASE.casefilename
  is '方案文件名称，复式合买时该字段为空，默认为’ ’';
comment on column jrtsch.TLOTCASE.casecontent
  is '合买方案内容，单式合买时该字段为空';
comment on column jrtsch.TLOTCASE.lotno
  is '彩种编号, 默认为’ ’';
comment on column jrtsch.TLOTCASE.drawway
  is '方案玩法，1为单式，2为复式，3为胆拖';
comment on column jrtsch.TLOTCASE.winflag
  is '方案派奖状态，1未派奖，0已派奖，2部分派奖（派奖进行中），默认为1';
comment on column jrtsch.TLOTCASE.baodibyruyicai
  is '如意彩保底份数，默认为0';
comment on column jrtsch.TLOTCASE.winallamt
  is '方案中奖总金额，默认为0';
comment on column jrtsch.TLOTCASE.winlittleamt
  is '中奖小奖总金额，默认为0';
comment on column jrtsch.TLOTCASE.winbigamt
  is '中奖大奖总金额，默认为0';
comment on column jrtsch.TLOTCASE.winstarttime
  is '方案派奖开始时间YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTCASE.winendtime
  is '方案派奖结束时间YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTCASE.winparticular
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……, 默认为’ ’';
comment on column jrtsch.TLOTCASE.caselostinfo
  is '方案投注失败信息, 默认为’ ’';
comment on column jrtsch.TLOTCASE.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TLOTCASE
  add constraint PK_TLOTCASE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTCTRL
-- prompt =======================
-- prompt
create table jrtsch.TLOTCTRL
(
  lotno     VARCHAR2(6 CHAR) default ' ' not null,
  batchcode VARCHAR2(7 CHAR) default ' ' not null,
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state     NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTCTRL
  is '彩票控制表';
comment on column jrtsch.TLOTCTRL.lotno
  is '彩种编号  TPPNNN，T：体彩或福彩，PP：省市编号，NNN：彩种编号';
comment on column jrtsch.TLOTCTRL.batchcode
  is '当前销售期号';
comment on column jrtsch.TLOTCTRL.agencyno
  is '彩票管理机构编号';
comment on column jrtsch.TLOTCTRL.starttime
  is '开期日期时间';
comment on column jrtsch.TLOTCTRL.endtime
  is '封机日期时间';
comment on column jrtsch.TLOTCTRL.state
  is '彩种开关，0：开通，其他关闭';
alter table jrtsch.TLOTCTRL
  add constraint PK_TLOTCTRL primary key (LOTNO, BATCHCODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTCTRLNOTICE
-- prompt =============================
-- prompt
create table jrtsch.TLOTCTRLNOTICE
(
  agencyno     VARCHAR2(8),
  lotno        VARCHAR2(6),
  failtimes    NUMBER(2) default 0,
  lastfailtime TIMESTAMP(6),
  suctime      TIMESTAMP(6),
  stateflag    NUMBER(2),
  noticetype   NUMBER(2),
  batchcode    VARCHAR2(7)
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTCTRLNOTICE
  is '新期通知表';
comment on column jrtsch.TLOTCTRLNOTICE.agencyno
  is '机构用户编号';
comment on column jrtsch.TLOTCTRLNOTICE.lotno
  is '彩种编号  TPPNNN，T：体彩或福彩，PP：省市编号，NNN：彩种编号';
comment on column jrtsch.TLOTCTRLNOTICE.failtimes
  is '失败次数';
comment on column jrtsch.TLOTCTRLNOTICE.lastfailtime
  is '最后一次失败时间';
comment on column jrtsch.TLOTCTRLNOTICE.suctime
  is '成功通知时间';
comment on column jrtsch.TLOTCTRLNOTICE.stateflag
  is '1--通知成功';
comment on column jrtsch.TLOTCTRLNOTICE.noticetype
  is '通知类型(1--新期，2--开奖信息)';
comment on column jrtsch.TLOTCTRLNOTICE.batchcode
  is '期号';

-- prompt
-- prompt Creating table TLOTCTRLSSC
-- prompt ==========================
-- prompt
create table jrtsch.TLOTCTRLSSC
(
  lotno     VARCHAR2(6 CHAR) default ' ' not null,
  batchcode VARCHAR2(7 CHAR) default ' ' not null,
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state     NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTCTRLSSC
  is '彩票控制表时时彩';
comment on column jrtsch.TLOTCTRLSSC.lotno
  is '彩种编号  TPPNNN，T：体彩或福彩，PP：省市编号，NNN：彩种编号';
comment on column jrtsch.TLOTCTRLSSC.batchcode
  is '当前销售期号';
comment on column jrtsch.TLOTCTRLSSC.agencyno
  is '彩票管理机构编号';
comment on column jrtsch.TLOTCTRLSSC.starttime
  is '开期日期时间';
comment on column jrtsch.TLOTCTRLSSC.endtime
  is '封机日期时间';
comment on column jrtsch.TLOTCTRLSSC.state
  is '彩种开关，0：开通，其他关闭';
alter table jrtsch.TLOTCTRLSSC
  add constraint PK_TLOTCTRLSSC primary key (LOTNO, BATCHCODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTCTRLSXFC
-- prompt ===========================
-- prompt
create table jrtsch.TLOTCTRLSXFC
(
  lotno     VARCHAR2(6 CHAR) default ' ' not null,
  batchcode VARCHAR2(7 CHAR) default ' ' not null,
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state     NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTCTRLSXFC
  is '彩票控制表';
comment on column jrtsch.TLOTCTRLSXFC.lotno
  is '彩种编号  TPPNNN，T：体彩或福彩，PP：省市编号，NNN：彩种编号';
comment on column jrtsch.TLOTCTRLSXFC.batchcode
  is '当前销售期号';
comment on column jrtsch.TLOTCTRLSXFC.agencyno
  is '彩票管理机构编号';
comment on column jrtsch.TLOTCTRLSXFC.starttime
  is '开期日期时间';
comment on column jrtsch.TLOTCTRLSXFC.endtime
  is '封机日期时间';
comment on column jrtsch.TLOTCTRLSXFC.state
  is '彩种开关，0：开通，其他关闭';
alter table jrtsch.TLOTCTRLSXFC
  add constraint PK_TLOTCTRLSXFC primary key (LOTNO, BATCHCODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTCTRLXJFC
-- prompt ===========================
-- prompt
create table jrtsch.TLOTCTRLXJFC
(
  lotno     VARCHAR2(6 CHAR) default ' ' not null,
  batchcode VARCHAR2(11 CHAR) default ' ' not null,
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY

-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY

-MM-DD HH24:MI:SS') not null,
  state     NUMBER(5) default 0 not null,
  vilidcode VARCHAR2(11 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTCTRLXJFC
  is '彩票控制表';
comment on column jrtsch.TLOTCTRLXJFC.lotno
  is '彩种编号  TPPNNN，T：体彩或福彩，PP：省市编号，NNN：彩种编号';
comment on column jrtsch.TLOTCTRLXJFC.batchcode
  is '当前销售期号';
comment on column jrtsch.TLOTCTRLXJFC.agencyno
  is '彩票管理机构编号';
comment on column jrtsch.TLOTCTRLXJFC.starttime
  is '开期日期时间';
comment on column jrtsch.TLOTCTRLXJFC.endtime
  is '封机日期时间';
comment on column jrtsch.TLOTCTRLXJFC.state
  is '彩种开关，0：开通，其他关闭';
comment on column jrtsch.TLOTCTRLXJFC.vilidcode
  is '内部期号';
alter table jrtsch.TLOTCTRLXJFC
  add constraint PK_TLOTCTRLXJFC primary key (LOTNO, BATCHCODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTHIS
-- prompt ======================
-- prompt
create table jrtsch.TLOTHIS
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  lotpwd        VARCHAR2(32 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  batchcode     VARCHAR2(7 CHAR) default ' ' not null,
  validcode     VARCHAR2(7 CHAR) default ' ' not null,
  runcode       VARCHAR2(8 CHAR) default ' ' not null,
  betnum        NUMBER(9) default 0 not null,
  drawway       NUMBER(5) default 0 not null,
  sellway       NUMBER(5) default 0 not null,
  betcode       VARCHAR2(120 CHAR) default ' ' not null,
  checkcode     VARCHAR2(64 CHAR) default ' ' not null,
  amt           NUMBER(12) default 0 not null,
  ordertime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  settleflag    NUMBER(5) default 0 not null,
  prizeamt      NUMBER(12) default 0 not null,
  prizelittle   NUMBER(12) default 0 not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  prizetime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  machineno     VARCHAR2(20 CHAR) default ' ' not null,
  giveuptime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null,
  transferstate NUMBER(5) default 0 not null,
  bettype       NUMBER(5) default 0 not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTHIS
  is '彩票记录历史表';
comment on column jrtsch.TLOTHIS.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TLOTHIS.userno
  is '客户编号';
comment on column jrtsch.TLOTHIS.lotno
  is '彩种编号';
comment on column jrtsch.TLOTHIS.lotpwd
  is '票面密码';
comment on column jrtsch.TLOTHIS.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TLOTHIS.batchcode
  is '彩票销售期号';
comment on column jrtsch.TLOTHIS.validcode
  is '彩票有效期号';
comment on column jrtsch.TLOTHIS.runcode
  is '彩票流水号，这是福彩、体彩中心系统下传的流水号，不是本系统产生的';
comment on column jrtsch.TLOTHIS.betnum
  is '彩票注数';
comment on column jrtsch.TLOTHIS.drawway
  is '投注方式，（0-单式，1-复式，2-胆拖）';
comment on column jrtsch.TLOTHIS.sellway
  is '销售方式，（0-自选，1-手选，2-机选）';
comment on column jrtsch.TLOTHIS.betcode
  is '彩票注码';
comment on column jrtsch.TLOTHIS.checkcode
  is '彩票校验码';
comment on column jrtsch.TLOTHIS.amt
  is '投注金额';
comment on column jrtsch.TLOTHIS.ordertime
  is '投注时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTHIS.settleflag
  is '兑奖标记，0：未兑奖，1：已兑奖，9：部分兑奖，指该张彩票有大奖的情况。兑奖后系统将该记录移入历史表';
comment on column jrtsch.TLOTHIS.prizeamt
  is '中奖总金额';
comment on column jrtsch.TLOTHIS.prizelittle
  is '中奖小奖总金额';
comment on column jrtsch.TLOTHIS.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TLOTHIS.prizetime
  is '兑奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTHIS.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TLOTHIS.giveuptime
  is '弃奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTHIS.state
  is '投注状态，0：失败，1：成功，2：处理中';
comment on column jrtsch.TLOTHIS.transferstate
  is '划款状态，0：未划款，1：已划款，2：划款失败';
comment on column jrtsch.TLOTHIS.bettype
  is '投注类型，0：追号，1：套餐，2：购彩';
comment on column jrtsch.TLOTHIS.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TLOTHIS
  add constraint PK_TLOTHIS primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTMAP
-- prompt ======================
-- prompt
create table jrtsch.TLOTMAP
(
  realflowno   VARCHAR2(16 CHAR) not null,
  agencyflowno VARCHAR2(24 CHAR) not null,
  agencyno     VARCHAR2(8 CHAR) not null,
  betflag      NUMBER(2) default 2,
  betnoticenum NUMBER(2) default 0,
  winflag      NUMBER(2) default 2,
  winnoticenum NUMBER(2) default 0,
  ticketseq    VARCHAR2(32) default 0
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.TLOTMAP.realflowno
  is '内部彩票流水号';
comment on column jrtsch.TLOTMAP.agencyflowno
  is '机构彩票流水号';
comment on column jrtsch.TLOTMAP.agencyno
  is '机构编号';
comment on column jrtsch.TLOTMAP.betflag
  is '投注通知标识 通知成功 1，失败0， 未通知2';
comment on column jrtsch.TLOTMAP.betnoticenum
  is '投注通知次数';
comment on column jrtsch.TLOTMAP.winflag
  is '中奖通知成功 1，失败0， 未通知2';
comment on column jrtsch.TLOTMAP.winnoticenum
  is '中奖通知次数';
alter table jrtsch.TLOTMAP
  add constraint PK_TLOTMAP primary key (REALFLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTNOTICE
-- prompt =========================
-- prompt
create table jrtsch.TLOTNOTICE
(
  agencyno    VARCHAR2(10) not null,
  lotno       VARCHAR2(6) not null,
  batchcode   VARCHAR2(8) not null,
  wincount    NUMBER(9) default 0 not null,
  isnotice    NUMBER(1) default 0 not null,
  noticecount NUMBER(2) default 0 not null,
  addtime     DATE default sysdate not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.TLOTNOTICE.agencyno
  is '代理商编号';
comment on column jrtsch.TLOTNOTICE.lotno
  is '彩种';
comment on column jrtsch.TLOTNOTICE.batchcode
  is '期号';
comment on column jrtsch.TLOTNOTICE.wincount
  is '中奖个数，默认0';
comment on column jrtsch.TLOTNOTICE.isnotice
  is '是否通知，0表示未通知，1表示通知';
comment on column jrtsch.TLOTNOTICE.noticecount
  is '已通知的次数';
comment on column jrtsch.TLOTNOTICE.addtime
  is '插入时间';

-- prompt
-- prompt Creating table TLOTNO_MAP
-- prompt =========================
-- prompt
create table jrtsch.TLOTNO_MAP
(
  agencyno      VARCHAR2(8),
  lotno         VARCHAR2(6),
  sublotno      VARCHAR2(10),
  state         NUMBER(2),
  convertmethod VARCHAR2(150)
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTNO_MAP
  is '彩种ID衍射表';
comment on column jrtsch.TLOTNO_MAP.agencyno
  is '机构用户编号';
comment on column jrtsch.TLOTNO_MAP.lotno
  is '彩种编号  TPPNNN，T：体彩或福彩，PP：省市编号，NNN：彩种编号';
comment on column jrtsch.TLOTNO_MAP.sublotno
  is '机构用户彩种';
comment on column jrtsch.TLOTNO_MAP.state
  is '状态1--可用';
comment on column jrtsch.TLOTNO_MAP.convertmethod
  is '转换方法';
alter table jrtsch.TLOTNO_MAP
  add constraint UK_TLOTNO_MAP unique (AGENCYNO, SUBLOTNO, LOTNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTPOOL
-- prompt =======================
-- prompt
create table jrtsch.TLOTPOOL
(
  branchid VARCHAR2(8 CHAR) not null,
  code     VARCHAR2(50 CHAR) default ' ' not null,
  lotno    VARCHAR2(6 CHAR) default ' ' not null,
  playtype VARCHAR2(10 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTPOOL
  is '彩票池表';
comment on column jrtsch.TLOTPOOL.branchid
  is '分店ID，如：90000000050';
comment on column jrtsch.TLOTPOOL.code
  is '注码，如：直选注码格式0001010101^ ，组三注码格式0101010202^
';
comment on column jrtsch.TLOTPOOL.lotno
  is '彩种编号';
comment on column jrtsch.TLOTPOOL.playtype
  is '玩法，如：01为组三、02为组六、00为直选';
comment on column jrtsch.TLOTPOOL.state
  is '状态，如：1为可用  0为不可用';
alter table jrtsch.TLOTPOOL
  add constraint PK_TLOTPOOL primary key (BRANCHID, CODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTRELATINGXJFC
-- prompt ===============================
-- prompt
create table jrtsch.TLOTRELATINGXJFC
(
  flowno         VARCHAR2(16 CHAR) not null,
  usdatachecksum VARCHAR2(120 CHAR) default ' ' not null,
  ucnumbers      NUMBER(5) default 0 not null,
  ucmultidraw    VARCHAR2(5 CHAR) default ' ' not null,
  ucmulti        NUMBER(9) default 0 not null,
  ucbox          NUMBER(5) default 0 not null,
  ucbluenums     NUMBER(5) default 0 not null,
  unused         VARCHAR2(6 CHAR) default ' ' not null,
  ucdata         VARCHAR2(44 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTRELATINGXJFC
  is '新疆福彩投注细节表';
comment on column jrtsch.TLOTRELATINGXJFC.flowno
  is '彩票流水号';
comment on column jrtsch.TLOTRELATINGXJFC.usdatachecksum
  is '数据区校验码，所有号码的号码和，再按256取模，用于校验号码区数

据是否正常';
comment on column jrtsch.TLOTRELATINGXJFC.ucnumbers
  is '数据区实际号码个数';
comment on column jrtsch.TLOTRELATINGXJFC.ucmultidraw
  is '多期时的期数，暂时未开通, 填0';
comment on column jrtsch.TLOTRELATINGXJFC.ucmulti
  is '倍数投注时的倍数，普通填1，n倍则填n';
comment on column jrtsch.TLOTRELATINGXJFC.ucbox
  is '组合游戏胆拖时胆的个数，非胆托投注则为0, 双色球游戏时则表示复

式票中蓝区号码个数, 好运彩复式时表示是好运几。';
comment on column jrtsch.TLOTRELATINGXJFC.ucbluenums
  is '双色球胆托时蓝区号码个数';
comment on column jrtsch.TLOTRELATINGXJFC.unused
  is 'unused[6]：预留,全0';
comment on column jrtsch.TLOTRELATINGXJFC.ucdata
  is 'ucData[44]：数据区';
alter table jrtsch.TLOTRELATINGXJFC
  add constraint PK_TLOTRELATINGXJFC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTSXFC
-- prompt =======================
-- prompt
create table jrtsch.TLOTSXFC
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  lotpwd        VARCHAR2(32 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  batchcode     VARCHAR2(7 CHAR) default ' ' not null,
  validcode     VARCHAR2(7 CHAR) default ' ' not null,
  runcode       VARCHAR2(8 CHAR) default ' ' not null,
  betnum        NUMBER(9) default 0 not null,
  drawway       NUMBER(5) default 0 not null,
  sellway       NUMBER(5) default 0 not null,
  betcode       VARCHAR2(120 CHAR) default ' ' not null,
  checkcode     VARCHAR2(64 CHAR) default ' ' not null,
  amt           NUMBER(12) default 0 not null,
  ordertime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  settleflag    NUMBER(5) default 0 not null,
  prizeamt      NUMBER(12) default 0 not null,
  prizelittle   NUMBER(12) default 0 not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  prizetime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  machineno     VARCHAR2(20 CHAR) default ' ' not null,
  giveuptime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null,
  transferstate NUMBER(5) default 0 not null,
  bettype       NUMBER(5) default 0 not null,
  subscribeno   VARCHAR2(16 CHAR) default ' ' not null,
  pbatchcode    VARCHAR2(7 CHAR) default ' ' not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTSXFC
  is '彩票投注表';
comment on column jrtsch.TLOTSXFC.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TLOTSXFC.userno
  is '客户编号';
comment on column jrtsch.TLOTSXFC.lotno
  is '彩种编号';
comment on column jrtsch.TLOTSXFC.lotpwd
  is '票面密码';
comment on column jrtsch.TLOTSXFC.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TLOTSXFC.batchcode
  is '彩票销售期号';
comment on column jrtsch.TLOTSXFC.validcode
  is '彩票有效期号';
comment on column jrtsch.TLOTSXFC.runcode
  is '彩票流水号，这是福彩、体彩中心系统下传的流水号，不是本系统产生的';
comment on column jrtsch.TLOTSXFC.betnum
  is '彩票注数';
comment on column jrtsch.TLOTSXFC.drawway
  is '投注方式，（0-单式，1-复式，2-胆拖）';
comment on column jrtsch.TLOTSXFC.sellway
  is '销售方式，（0-自选，1-手选，2-机选）';
comment on column jrtsch.TLOTSXFC.betcode
  is '彩票注码';
comment on column jrtsch.TLOTSXFC.checkcode
  is '彩票校验码';
comment on column jrtsch.TLOTSXFC.amt
  is '投注金额';
comment on column jrtsch.TLOTSXFC.ordertime
  is '投注时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTSXFC.settleflag
  is '兑奖标记，0：未兑奖，1：已兑奖，9：部分兑奖，指该张彩票有大奖的情况。兑奖后系统将该记录移入历史表';
comment on column jrtsch.TLOTSXFC.prizeamt
  is '中奖总金额';
comment on column jrtsch.TLOTSXFC.prizelittle
  is '中奖小奖总金额';
comment on column jrtsch.TLOTSXFC.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TLOTSXFC.prizetime
  is '兑奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTSXFC.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TLOTSXFC.giveuptime
  is '弃奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTSXFC.state
  is '投注状态，0：失败，1：成功，2：处理中';
comment on column jrtsch.TLOTSXFC.transferstate
  is '划款状态，0：未划款，1：已划款，2：划款失败';
comment on column jrtsch.TLOTSXFC.bettype
  is '投注类型，0：追号，1：套餐，2：购彩';
comment on column jrtsch.TLOTSXFC.subscribeno
  is '追号套餐定制流水号';
comment on column jrtsch.TLOTSXFC.pbatchcode
  is '兑奖期号';
comment on column jrtsch.TLOTSXFC.caseid
  is '方案编号';
comment on column jrtsch.TLOTSXFC.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TLOTSXFC
  add constraint PK_TLOTSXFC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTTC
-- prompt =====================
-- prompt
create table jrtsch.TLOTTC
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  lotpwd        VARCHAR2(32 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  batchcode     VARCHAR2(7 CHAR) default ' ' not null,
  validcode     VARCHAR2(7 CHAR) default ' ' not null,
  runcode       VARCHAR2(8 CHAR) default ' ' not null,
  betnum        NUMBER(9) default 0 not null,
  drawway       NUMBER(5) default 0 not null,
  sellway       NUMBER(5) default 0 not null,
  betcode       VARCHAR2(120 CHAR) default ' ' not null,
  checkcode     VARCHAR2(64 CHAR) default ' ' not null,
  amt           NUMBER(12) default 0 not null,
  ordertime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD

HH24:MI:SS') not null,
  settleflag    NUMBER(5) default 0 not null,
  prizeamt      NUMBER(12) default 0 not null,
  prizelittle   NUMBER(12) default 0 not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  prizetime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD

HH24:MI:SS') not null,
  machineno     VARCHAR2(20 CHAR) default ' ' not null,
  giveuptime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD

HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null,
  transferstate NUMBER(5) default 0 not null,
  bettype       NUMBER(5) default 0 not null,
  subscribeno   VARCHAR2(16 CHAR) default ' ' not null,
  pbatchcode    VARCHAR2(7 CHAR) default ' ' not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTTC
  is '彩票记录表';
comment on column jrtsch.TLOTTC.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TLOTTC.userno
  is '客户编号';
comment on column jrtsch.TLOTTC.lotno
  is '彩种编号';
comment on column jrtsch.TLOTTC.lotpwd
  is '票面密码';
comment on column jrtsch.TLOTTC.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TLOTTC.batchcode
  is '彩票销售期号';
comment on column jrtsch.TLOTTC.validcode
  is '彩票有效期号';
comment on column jrtsch.TLOTTC.runcode
  is '彩票流水号，这是福彩、体彩中心系统下传的流水号，不是本系统产生的';
comment on column jrtsch.TLOTTC.betnum
  is '彩票注数';
comment on column jrtsch.TLOTTC.drawway
  is '投注方式，（0-单式，1-复式，2-胆拖）';
comment on column jrtsch.TLOTTC.sellway
  is '销售方式，（0-自选，1-手选，2-机选）';
comment on column jrtsch.TLOTTC.betcode
  is '彩票注码';
comment on column jrtsch.TLOTTC.checkcode
  is '彩票校验码';
comment on column jrtsch.TLOTTC.amt
  is '投注金额';
comment on column jrtsch.TLOTTC.ordertime
  is '投注时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTTC.settleflag
  is '兑奖标记，0：未兑奖，1：已兑奖，9：部分兑奖，指该张彩票有大奖的情况。兑奖后系统将该记录

移入历史表';
comment on column jrtsch.TLOTTC.prizeamt
  is '中奖总金额';
comment on column jrtsch.TLOTTC.prizelittle
  is '中奖小奖总金额';
comment on column jrtsch.TLOTTC.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额…

…';
comment on column jrtsch.TLOTTC.prizetime
  is '兑奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTTC.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TLOTTC.giveuptime
  is '弃奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTTC.state
  is '投注状态，0：失败，1：成功，2：处理中';
comment on column jrtsch.TLOTTC.transferstate
  is '划款状态，0：未划款，1：已划款，2：划款失败';
comment on column jrtsch.TLOTTC.bettype
  is '投注类型，0：追号，1：套餐，2：购彩';
comment on column jrtsch.TLOTTC.subscribeno
  is '追号套餐定制流水号';
comment on column jrtsch.TLOTTC.pbatchcode
  is '兑奖期号';
comment on column jrtsch.TLOTTC.caseid
  is '方案编号';
comment on column jrtsch.TLOTTC.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TLOTTC
  add constraint PK_TLOTTC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTTYPE
-- prompt =======================
-- prompt
create table jrtsch.TLOTTYPE
(
  id       VARCHAR2(6 CHAR) default ' ' not null,
  agencyno VARCHAR2(6 CHAR) default ' ' not null,
  name     VARCHAR2(10 CHAR) default ' ' not null,
  citycode VARCHAR2(4 CHAR) default ' ' not null,
  cname    VARCHAR2(20 CHAR) default ' ',
  state    NUMBER(5) default 0 not null,
  lvl      NUMBER(5) default 0 not null,
  provcode VARCHAR2(3 CHAR) default '000' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTTYPE
  is '彩票字典表';
comment on column jrtsch.TLOTTYPE.id
  is '字典码，系统分配';
comment on column jrtsch.TLOTTYPE.agencyno
  is '彩票管理机构编号';
comment on column jrtsch.TLOTTYPE.name
  is '玩法英文名称';
comment on column jrtsch.TLOTTYPE.citycode
  is '城市代号';
comment on column jrtsch.TLOTTYPE.cname
  is '玩法中文名称';
comment on column jrtsch.TLOTTYPE.state
  is '彩种开通状态，0：关闭，1：开通';
comment on column jrtsch.TLOTTYPE.lvl
  is '数字越大 级别越高';
comment on column jrtsch.TLOTTYPE.provcode
  is '省代码，未知省填000';
alter table jrtsch.TLOTTYPE
  add constraint PK_TLOTTYPE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TLOTXJFC
-- prompt =======================
-- prompt
create table jrtsch.TLOTXJFC
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  lotpwd        VARCHAR2(32 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  batchcode     VARCHAR2(15 CHAR) default ' ' not null,
  validcode     VARCHAR2(15 CHAR) default ' ' not null,
  runcode       VARCHAR2(8 CHAR) default ' ' not null,
  betnum        NUMBER(9) default 0 not null,
  drawway       NUMBER(5) default 0 not null,
  sellway       NUMBER(5) default 0 not null,
  betcode       VARCHAR2(120 CHAR) default ' ' not null,
  checkcode     VARCHAR2(64 CHAR) default ' ' not null,
  amt           NUMBER(12) default 0 not null,
  ordertime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  settleflag    NUMBER(5) default 0 not null,
  prizeamt      NUMBER(12) default 0 not null,
  prizelittle   NUMBER(12) default 0 not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  prizetime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  machineno     VARCHAR2(20 CHAR) default ' ' not null,
  giveuptime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null,
  transferstate NUMBER(5) default 0 not null,
  bettype       NUMBER(5) default 0 not null,
  subscribeno   VARCHAR2(16 CHAR) default ' ' not null,
  pbatchcode    VARCHAR2(7 CHAR) default ' ' not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null,
  type          NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TLOTXJFC
  is '彩票记录表';
comment on column jrtsch.TLOTXJFC.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TLOTXJFC.userno
  is '客户编号';
comment on column jrtsch.TLOTXJFC.lotno
  is '彩种编号';
comment on column jrtsch.TLOTXJFC.lotpwd
  is '票面密码';
comment on column jrtsch.TLOTXJFC.agencyno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TLOTXJFC.batchcode
  is '彩票销售期号';
comment on column jrtsch.TLOTXJFC.validcode
  is '彩票有效期号';
comment on column jrtsch.TLOTXJFC.runcode
  is '彩票流水号，这是福彩、体彩中心系统下传的流水号，不是本系统产生的';
comment on column jrtsch.TLOTXJFC.betnum
  is '彩票注数';
comment on column jrtsch.TLOTXJFC.drawway
  is '投注方式，（0-单式，1-复式，2-胆拖）';
comment on column jrtsch.TLOTXJFC.sellway
  is '销售方式，（0-自选，1-手选，2-机选）';
comment on column jrtsch.TLOTXJFC.betcode
  is '彩票注码';
comment on column jrtsch.TLOTXJFC.checkcode
  is '彩票校验码';
comment on column jrtsch.TLOTXJFC.amt
  is '投注金额';
comment on column jrtsch.TLOTXJFC.ordertime
  is '投注时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTXJFC.settleflag
  is '兑奖标记，0：未兑奖，1：已兑奖，9：部分兑奖，指该张彩票有大奖的情况。兑奖后系统将该记录移入历史表';
comment on column jrtsch.TLOTXJFC.prizeamt
  is '中奖总金额';
comment on column jrtsch.TLOTXJFC.prizelittle
  is '中奖小奖总金额';
comment on column jrtsch.TLOTXJFC.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TLOTXJFC.prizetime
  is '兑奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTXJFC.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TLOTXJFC.giveuptime
  is '弃奖时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TLOTXJFC.state
  is '投注状态，0：失败，1：成功，2：处理中';
comment on column jrtsch.TLOTXJFC.transferstate
  is '划款状态，0：未划款，1：已划款，2：划款失败';
comment on column jrtsch.TLOTXJFC.bettype
  is '投注类型，0：追号，1：套餐，2：购彩';
comment on column jrtsch.TLOTXJFC.subscribeno
  is '追号套餐定制流水号';
comment on column jrtsch.TLOTXJFC.pbatchcode
  is '兑奖期号';
comment on column jrtsch.TLOTXJFC.caseid
  is '方案编号';
comment on column jrtsch.TLOTXJFC.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
comment on column jrtsch.TLOTXJFC.type
  is '投注类型，0：投注，1：被赠送，2：大客户赠送';
alter table jrtsch.TLOTXJFC
  add constraint PK_TLOTXJFC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMEMLOGS
-- prompt =======================
-- prompt
create table jrtsch.TMEMLOGS
(
  id          VARCHAR2(32 CHAR) not null,
  plattime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tnodeid     VARCHAR2(16 CHAR) not null,
  tserviceid  NUMBER(8) default 0 not null,
  type        VARCHAR2(16 CHAR) default ' ' not null,
  state       NUMBER(5) default 0 not null,
  memtotal    NUMBER(12) default 0 not null,
  memfree     NUMBER(12) default 0 not null,
  utilization NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TMEMLOGS
  is '内存检测';
comment on column jrtsch.TMEMLOGS.id
  is '检测流水 MyyyyMMddHHmmss+序列号(6位)';
comment on column jrtsch.TMEMLOGS.plattime
  is '检测时间';
comment on column jrtsch.TMEMLOGS.tnodeid
  is '节点标示';
comment on column jrtsch.TMEMLOGS.tserviceid
  is '服务标示（端口），外键';
comment on column jrtsch.TMEMLOGS.type
  is '服务类型 RESIN，外键';
comment on column jrtsch.TMEMLOGS.state
  is '状态，0：false，1：ok';
comment on column jrtsch.TMEMLOGS.memtotal
  is '总磁盘空间量';
comment on column jrtsch.TMEMLOGS.memfree
  is '空闲磁盘空间量';
comment on column jrtsch.TMEMLOGS.utilization
  is '利用率';
alter table jrtsch.TMEMLOGS
  add constraint PK_TMEMLOGS primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.INDEX_5 on jrtsch.TMEMLOGS (PLATTIME)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMENU
-- prompt ====================
-- prompt
create table jrtsch.TMENU
(
  preno      NUMBER(5) not null,
  firstpreno NUMBER(5) default 0 not null,
  url        VARCHAR2(128 CHAR) default ' ' not null,
  prename    VARCHAR2(100 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TMENU
  is '运营系统权限描述';
comment on column jrtsch.TMENU.preno
  is '权限编号，从1开始，最多36';
comment on column jrtsch.TMENU.firstpreno
  is '一级菜单编号';
comment on column jrtsch.TMENU.url
  is '路径';
comment on column jrtsch.TMENU.prename
  is '权限名目';
alter table jrtsch.TMENU
  add constraint PK_TMENU primary key (PRENO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMOBILESEG
-- prompt =========================
-- prompt
create table jrtsch.TMOBILESEG
(
  id       VARCHAR2(8) not null,
  provcode VARCHAR2(3) default 000 not null,
  areacode VARCHAR2(3) default 000 not null,
  simtype  NUMBER(11) default 0 not null,
  provname VARCHAR2(64) not null,
  areaname VARCHAR2(64) not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.TMOBILESEG.id
  is '手机号前7(8)位';
comment on column jrtsch.TMOBILESEG.provcode
  is '省代码 未知省填000';
comment on column jrtsch.TMOBILESEG.areacode
  is '地区代码 未知地区填000';
comment on column jrtsch.TMOBILESEG.simtype
  is 'SIM卡类型 0:boss用户 1:智能网用户';
comment on column jrtsch.TMOBILESEG.provname
  is '省名称';
comment on column jrtsch.TMOBILESEG.areaname
  is '地市名称';
alter table jrtsch.TMOBILESEG
  add constraint PK_CMOBILESEG primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMONITOR
-- prompt =======================
-- prompt
create table jrtsch.TMONITOR
(
  flowno    VARCHAR2(16 CHAR) not null,
  retcode   VARCHAR2(8 CHAR) default ' ' not null,
  msgtype   NUMBER(5) default 0 not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  src       NUMBER(5) default 0 not null,
  memo      VARCHAR2(128 CHAR) default ' ' not null,
  errormsg  VARCHAR2(300 CHAR) default ' '
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TMONITOR
  is '监控表';
comment on column jrtsch.TMONITOR.flowno
  is '流水号';
comment on column jrtsch.TMONITOR.retcode
  is '错误码';
comment on column jrtsch.TMONITOR.msgtype
  is '消息类型：1：日志（监控，业务处理结果），2：告警(系统错误)';
comment on column jrtsch.TMONITOR.starttime
  is '发生的时间';
comment on column jrtsch.TMONITOR.endtime
  is '结束的时间';
comment on column jrtsch.TMONITOR.src
  is '来源，1：彩票系统，2：帐务系统';
comment on column jrtsch.TMONITOR.memo
  is '消息描述';
comment on column jrtsch.TMONITOR.errormsg
  is '错误描述';
alter table jrtsch.TMONITOR
  add constraint PK_TMONITOR primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMONITORSXFC
-- prompt ===========================
-- prompt
create table jrtsch.TMONITORSXFC
(
  flowno    VARCHAR2(16 CHAR) not null,
  retcode   VARCHAR2(8 CHAR) default ' ' not null,
  msgtype   NUMBER(5) default 0 not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  src       NUMBER(5) default 0 not null,
  memo      VARCHAR2(128 CHAR) default ' ' not null,
  errormsg  VARCHAR2(300 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TMONITORSXFC
  is '陕西福彩监控日表表';
comment on column jrtsch.TMONITORSXFC.flowno
  is '流水号';
comment on column jrtsch.TMONITORSXFC.retcode
  is '错误码';
comment on column jrtsch.TMONITORSXFC.msgtype
  is '消息类型：1：日志（监控，业务处理结果），2：告警(系统错误)';
comment on column jrtsch.TMONITORSXFC.starttime
  is '发生的时间';
comment on column jrtsch.TMONITORSXFC.endtime
  is '结束的时间';
comment on column jrtsch.TMONITORSXFC.src
  is '来源，1：彩票系统，2：帐务系统';
comment on column jrtsch.TMONITORSXFC.memo
  is '消息描述';
comment on column jrtsch.TMONITORSXFC.errormsg
  is '错误信息描述';
alter table jrtsch.TMONITORSXFC
  add constraint PK_TMONITORSXF primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMONITORTC
-- prompt =========================
-- prompt
create table jrtsch.TMONITORTC
(
  flowno    VARCHAR2(16 CHAR) not null,
  retcode   VARCHAR2(8 CHAR) default ' ' not null,
  msgtype   NUMBER(5) default 0 not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  src       NUMBER(5) default 0 not null,
  memo      VARCHAR2(128 CHAR) default ' ' not null,
  errormsg  VARCHAR2(300 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TMONITORTC
  is '监控表';
comment on column jrtsch.TMONITORTC.flowno
  is '流水号';
comment on column jrtsch.TMONITORTC.retcode
  is '错误码';
comment on column jrtsch.TMONITORTC.msgtype
  is '消息类型：1：日志（监控，业务处理结果），2：告警(系统错误)';
comment on column jrtsch.TMONITORTC.starttime
  is '发生的时间';
comment on column jrtsch.TMONITORTC.endtime
  is '结束的时间';
comment on column jrtsch.TMONITORTC.src
  is '来源，1：彩票系统，2：帐务系统';
comment on column jrtsch.TMONITORTC.memo
  is '消息描述';
comment on column jrtsch.TMONITORTC.errormsg
  is '错误信息描述';
alter table jrtsch.TMONITORTC
  add constraint PK_TMONITORTC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TMONITORXJFC
-- prompt ===========================
-- prompt
create table jrtsch.TMONITORXJFC
(
  flowno    VARCHAR2(16 CHAR) not null,
  retcode   VARCHAR2(8 CHAR) default ' ' not null,
  msgtype   NUMBER(5) default 0 not null,
  starttime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  src       NUMBER(5) default 0 not null,
  memo      VARCHAR2(128 CHAR) default ' ' not null,
  errormsg  VARCHAR2(300 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TMONITORXJFC
  is '新疆福彩监控日表表';
comment on column jrtsch.TMONITORXJFC.flowno
  is '流水号';
comment on column jrtsch.TMONITORXJFC.retcode
  is '错误码';
comment on column jrtsch.TMONITORXJFC.msgtype
  is '消息类型：1：日志（监控，业务处理结果），2：告警(系统错误)';
comment on column jrtsch.TMONITORXJFC.starttime
  is '发生的时间';
comment on column jrtsch.TMONITORXJFC.endtime
  is '结束的时间';
comment on column jrtsch.TMONITORXJFC.src
  is '来源，1：彩票系统，2：帐务系统';
comment on column jrtsch.TMONITORXJFC.memo
  is '消息描述';
comment on column jrtsch.TMONITORXJFC.errormsg
  is '错误信息描述';
alter table jrtsch.TMONITORXJFC
  add constraint PK_TMONITORXJFC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TNGINXLOG
-- prompt ========================
-- prompt
create table jrtsch.TNGINXLOG
(
  id                VARCHAR2(32 CHAR) not null,
  plattime          TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tnodeid           VARCHAR2(16 CHAR) default ' ' not null,
  tserviceid        NUMBER(8) default 0 not null,
  type              VARCHAR2(16 CHAR) default ' ' not null,
  state             NUMBER(5) default 0 not null,
  activeconnection  NUMBER(5) default 0 not null,
  acceptconnection  NUMBER(5) default 0 not null,
  handledconnection NUMBER(5) default 0 not null,
  handledrequest    NUMBER(5) default 0 not null,
  reading           NUMBER(5) default 0 not null,
  writing           NUMBER(5) default 0 not null,
  waiting           NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TNGINXLOG
  is '检测流水 NyyyyMMddHHmmss+序列号(6位)';
comment on column jrtsch.TNGINXLOG.id
  is '检测流水 NyyyyMMddHHmmss+序列号(6位)';
comment on column jrtsch.TNGINXLOG.plattime
  is '检测时间';
comment on column jrtsch.TNGINXLOG.tnodeid
  is '节点标示，外键';
comment on column jrtsch.TNGINXLOG.tserviceid
  is '服务标示（端口），外键';
comment on column jrtsch.TNGINXLOG.type
  is '服务类型 RESIN，外键';
comment on column jrtsch.TNGINXLOG.state
  is '状态，0：false，1：ok';
comment on column jrtsch.TNGINXLOG.activeconnection
  is '活动的连接数';
comment on column jrtsch.TNGINXLOG.acceptconnection
  is '接收的连接数';
comment on column jrtsch.TNGINXLOG.handledconnection
  is '已经处理的连接数';
comment on column jrtsch.TNGINXLOG.handledrequest
  is '已经处理的请求数';
comment on column jrtsch.TNGINXLOG.reading
  is '正在读取的请求数';
comment on column jrtsch.TNGINXLOG.writing
  is '正在处理的请求数';
comment on column jrtsch.TNGINXLOG.waiting
  is '等待的请求数=reading+writing';
alter table jrtsch.TNGINXLOG
  add constraint PK_TNGINXLOG primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.INDEX_2 on jrtsch.TNGINXLOG (PLATTIME)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TNODE
-- prompt ====================
-- prompt
create table jrtsch.TNODE
(
  id       VARCHAR2(16 CHAR) not null,
  ip       VARCHAR2(15 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null,
  memtotal NUMBER(12) default 0 not null,
  memfree  NUMBER(12) default 0 not null,
  cpu      NUMBER(5) default 0 not null,
  modtime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  os       VARCHAR2(32 CHAR) default ' ' not null,
  osver    VARCHAR2(32 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TNODE
  is '节点管理:添加新的监控节点，IP地址';
comment on column jrtsch.TNODE.id
  is '节点标示';
comment on column jrtsch.TNODE.ip
  is 'IP地址';
comment on column jrtsch.TNODE.state
  is '状态，0：false，1：ok';
comment on column jrtsch.TNODE.memtotal
  is '总物理内存量';
comment on column jrtsch.TNODE.memfree
  is '空闲内存量';
comment on column jrtsch.TNODE.cpu
  is 'CPU利用率';
comment on column jrtsch.TNODE.modtime
  is '最后检测时间';
comment on column jrtsch.TNODE.os
  is '操作系统类型 Linux, Window, Solaries, AIX';
comment on column jrtsch.TNODE.osver
  is '操作系统版本号';
alter table jrtsch.TNODE
  add constraint PK_TNODE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TNOTECONTENT
-- prompt ===========================
-- prompt
create table jrtsch.TNOTECONTENT
(
  name       VARCHAR2(20 CHAR) not null,
  content    VARCHAR2(200 CHAR) default ' ' not null,
  state      NUMBER(5) default 0 not null,
  createtime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  info       VARCHAR2(50 CHAR) default ' ' not null,
  jrtcontent VARCHAR2(200 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TNOTECONTENT
  is '短信内容表';
comment on column jrtsch.TNOTECONTENT.name
  is '大客户用户名，对应tuserinfo表中的name字段';
comment on column jrtsch.TNOTECONTENT.content
  is '大客户赠送短信内容';
comment on column jrtsch.TNOTECONTENT.state
  is '短信状态 0：不可用，1：可用';
comment on column jrtsch.TNOTECONTENT.createtime
  is '新建或者修改时间';
comment on column jrtsch.TNOTECONTENT.info
  is '备注信息';
comment on column jrtsch.TNOTECONTENT.jrtcontent
  is '金软通短信内容';
alter table jrtsch.TNOTECONTENT
  add constraint PK_TNOTECONTENT primary key (NAME)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TNOTESMS
-- prompt =======================
-- prompt
create table jrtsch.TNOTESMS
(
  id           VARCHAR2(16 CHAR) not null,
  mobileid     VARCHAR2(11 CHAR) default ' ' not null,
  smscontent   VARCHAR2(510 CHAR) default ' ' not null,
  state        NUMBER(5) default 0 not null,
  sendcount    NUMBER(5) default 0 not null,
  sendtime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tgiftauditid VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TNOTESMS
  is '短信通知中奖服务表';
comment on column jrtsch.TNOTESMS.id
  is '标识';
comment on column jrtsch.TNOTESMS.mobileid
  is '中奖手机号';
comment on column jrtsch.TNOTESMS.smscontent
  is '短信内容';
comment on column jrtsch.TNOTESMS.state
  is '状态标志，0：发送失败，1：发送成功';
comment on column jrtsch.TNOTESMS.sendcount
  is '发送次数(次数取值范围为[0,3],超过3次无论成功与否都不在发送)';
comment on column jrtsch.TNOTESMS.sendtime
  is '发送时间';
comment on column jrtsch.TNOTESMS.tgiftauditid
  is '审核表的流水号';
alter table jrtsch.TNOTESMS
  add constraint PK_TNOTESMS primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TNOTICE
-- prompt ======================
-- prompt
create table jrtsch.TNOTICE
(
  id         VARCHAR2(4 CHAR) default ' ' not null,
  message    VARCHAR2(100 CHAR) default ' ' not null,
  state      NUMBER(5) default 0 not null,
  expiretime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  priority   NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TNOTICE
  is '滚动信息控制表';
comment on column jrtsch.TNOTICE.id
  is '信息编号，0001开始，自动+1';
comment on column jrtsch.TNOTICE.message
  is '信息详情';
comment on column jrtsch.TNOTICE.state
  is '信息状态，0：可用，1：过期，2：失效';
comment on column jrtsch.TNOTICE.expiretime
  is '有效期，YYYYMMDD';
comment on column jrtsch.TNOTICE.priority
  is '优先级，0：最高级，显示用红色，1-3：优先，显示用黄色或橙色，4-9：普通，显示用蓝色
';
alter table jrtsch.TNOTICE
  add constraint PK_TNOTICE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TOPRLOG
-- prompt ======================
-- prompt
create table jrtsch.TOPRLOG
(
  id       VARCHAR2(16 CHAR) default ' ' not null,
  oprno    VARCHAR2(16 CHAR) default ' ' not null,
  code     VARCHAR2(4 CHAR) default ' ' not null,
  plattime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  retcode  VARCHAR2(4 CHAR) default ' ' not null,
  info     VARCHAR2(100 CHAR) default ' ' not null,
  mac      VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TOPRLOG
  is '运营系统操作日志记录表';
comment on column jrtsch.TOPRLOG.id
  is '操作交易流水号，采用数据库自动+1的整数';
comment on column jrtsch.TOPRLOG.oprno
  is '操作员编号';
comment on column jrtsch.TOPRLOG.code
  is '操作交易码';
comment on column jrtsch.TOPRLOG.plattime
  is '操作时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TOPRLOG.retcode
  is '操作结果';
comment on column jrtsch.TOPRLOG.info
  is '交易数据段';
comment on column jrtsch.TOPRLOG.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TOPRLOG
  add constraint PK_TOPRLOG primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TORGSTL
-- prompt ======================
-- prompt
create table jrtsch.TORGSTL
(
  agencyno   VARCHAR2(6 CHAR) default ' ' not null,
  platdate   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  settletype NUMBER(5) default 0 not null,
  settlename VARCHAR2(16 CHAR) default ' ' not null,
  blsign     NUMBER(5) default 0 not null,
  snum       NUMBER(12) default 0 not null,
  samt       NUMBER(12) default 0 not null,
  state      NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TORGSTL
  is '机构结算表';
comment on column jrtsch.TORGSTL.agencyno
  is '渠道编号，支付机构';
comment on column jrtsch.TORGSTL.platdate
  is '账目日期，YYYYMMDD';
comment on column jrtsch.TORGSTL.settletype
  is '结算类别，1：投注，2：充值，3：中奖，4：手续费';
comment on column jrtsch.TORGSTL.settlename
  is '结算名目';
comment on column jrtsch.TORGSTL.blsign
  is '借贷标识，1平台进，-1平台出';
comment on column jrtsch.TORGSTL.snum
  is '结算笔数，以分为单位';
comment on column jrtsch.TORGSTL.samt
  is '结算金额，以分为单位';
comment on column jrtsch.TORGSTL.state
  is '处理状态，0：未处理，1：已划款';
alter table jrtsch.TORGSTL
  add constraint PK_TORGSTL primary key (AGENCYNO, PLATDATE, SETTLETYPE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TORG_ACCOUNT
-- prompt ===========================
-- prompt
create table jrtsch.TORG_ACCOUNT
(
  id        VARCHAR2(20 CHAR) not null,
  username  VARCHAR2(20 CHAR) default ' ' not null,
  password  VARCHAR2(64 CHAR) not null,
  accountid VARCHAR2(11 CHAR) not null,
  branchid  VARCHAR2(8 CHAR) default ' ' not null,
  prestr    VARCHAR2(30 CHAR) not null,
  status    NUMBER(1) default 0 not null,
  info      VARCHAR2(64 CHAR) default ' ' not null,
  regtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  logtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  realname  VARCHAR2(20 CHAR) default ' ' not null,
  email     VARCHAR2(50 CHAR) default ' ' not null,
  mobile    VARCHAR2(11 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TORG_ACCOUNT
  is '机构用户表';
comment on column jrtsch.TORG_ACCOUNT.id
  is '用户ID';
comment on column jrtsch.TORG_ACCOUNT.username
  is '用户名 unique';
comment on column jrtsch.TORG_ACCOUNT.password
  is '密码md5加密';
comment on column jrtsch.TORG_ACCOUNT.accountid
  is '账户ID 关联taccount userno';
comment on column jrtsch.TORG_ACCOUNT.branchid
  is '分店ID';
comment on column jrtsch.TORG_ACCOUNT.prestr
  is '权限串';
comment on column jrtsch.TORG_ACCOUNT.status
  is '用户状态0为关闭状态，1为开启状态';
comment on column jrtsch.TORG_ACCOUNT.realname
  is '真实姓名';
comment on column jrtsch.TORG_ACCOUNT.email
  is '邮箱地址';
comment on column jrtsch.TORG_ACCOUNT.mobile
  is '手机号码';
alter table jrtsch.TORG_ACCOUNT
  add constraint PK_TORG_ACCOUNT primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
alter table jrtsch.TORG_ACCOUNT
  add constraint AK_KEY_2_TORG_ACC unique (USERNAME)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TORG_BRANCH
-- prompt ==========================
-- prompt
create table jrtsch.TORG_BRANCH
(
  id         VARCHAR2(8 CHAR) not null,
  branchname VARCHAR2(20 CHAR) default ' ' not null,
  rootid     VARCHAR2(8 CHAR) default ' ' not null,
  branchflag NUMBER(1) default 0 not null,
  info       VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TORG_BRANCH
  is '分店表';
comment on column jrtsch.TORG_BRANCH.branchname
  is '分店名';
comment on column jrtsch.TORG_BRANCH.rootid
  is '总店ID 默认本店ID';
comment on column jrtsch.TORG_BRANCH.branchflag
  is '分店标示 是否含有分店 0否 1是';
alter table jrtsch.TORG_BRANCH
  add constraint PK_TORG_BRANCH primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TORG_LOTT
-- prompt ========================
-- prompt
create table jrtsch.TORG_LOTT
(
  id           VARCHAR2(16 CHAR) not null,
  templatename VARCHAR2(5 CHAR) not null,
  userid       VARCHAR2(8 CHAR) not null,
  customer_mob VARCHAR2(16 CHAR) not null,
  flowno       VARCHAR2(16 CHAR) default ' ' not null,
  excutetime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  lottid       VARCHAR2(10 CHAR) default ' ' not null,
  lottterm     VARCHAR2(12 CHAR) default ' ' not null,
  betcode      VARCHAR2(120 CHAR) default ' ' not null,
  message      VARCHAR2(510 CHAR),
  orgid        VARCHAR2(8 CHAR) default ' ' not null,
  betamt       NUMBER(10) default 0 not null,
  betnum       NUMBER(3) default 0 not null,
  branchid     VARCHAR2(8 CHAR) default ' ' not null,
  status       NUMBER(1) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TORG_LOTT
  is '赠送彩票记录表';
comment on column jrtsch.TORG_LOTT.templatename
  is '方案ID';
comment on column jrtsch.TORG_LOTT.userid
  is '赠送者ID';
comment on column jrtsch.TORG_LOTT.customer_mob
  is '客户手机号';
comment on column jrtsch.TORG_LOTT.flowno
  is '彩票流水号';
comment on column jrtsch.TORG_LOTT.excutetime
  is '赠送时间';
comment on column jrtsch.TORG_LOTT.lottid
  is '彩种';
comment on column jrtsch.TORG_LOTT.lottterm
  is '期号';
comment on column jrtsch.TORG_LOTT.betcode
  is '注码';
comment on column jrtsch.TORG_LOTT.message
  is '短信内容';
comment on column jrtsch.TORG_LOTT.orgid
  is '福彩机构ID';
comment on column jrtsch.TORG_LOTT.betamt
  is '购彩金额
（分）';
comment on column jrtsch.TORG_LOTT.betnum
  is '投注数';
comment on column jrtsch.TORG_LOTT.branchid
  is '分店ID';
comment on column jrtsch.TORG_LOTT.status
  is '彩票赠送状态0失败1成功 默认值为0';
alter table jrtsch.TORG_LOTT
  add constraint PK_TORG_LOTT primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TORG_PRIVILEGE
-- prompt =============================
-- prompt
create table jrtsch.TORG_PRIVILEGE
(
  id         NUMBER(3) not null,
  priname    VARCHAR2(10 CHAR) not null,
  url        VARCHAR2(120 CHAR) default ' ' not null,
  rootpri    NUMBER(3) default 0 not null,
  subprefalg NUMBER(1) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TORG_PRIVILEGE
  is '权限表';
comment on column jrtsch.TORG_PRIVILEGE.priname
  is '权限名称';
comment on column jrtsch.TORG_PRIVILEGE.url
  is '权限ID';
comment on column jrtsch.TORG_PRIVILEGE.rootpri
  is '上级权限ID';
comment on column jrtsch.TORG_PRIVILEGE.subprefalg
  is '子权限标示 0为无子权限 1为有';
alter table jrtsch.TORG_PRIVILEGE
  add constraint PK_TORG_PRIVILEGE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TORG_TEMPLATE
-- prompt ============================
-- prompt
create table jrtsch.TORG_TEMPLATE
(
  id         VARCHAR2(5 CHAR) not null,
  tempname   VARCHAR2(10 CHAR) not null,
  lottid     VARCHAR2(10 CHAR) not null,
  betnum     NUMBER(3) not null,
  betamt     NUMBER(8) not null,
  bettype    NUMBER(3) not null,
  seltype    NUMBER(1) default 1 not null,
  message    VARCHAR2(120 CHAR),
  info       VARCHAR2(64 CHAR),
  branchid   VARCHAR2(8 CHAR) not null,
  userid     VARCHAR2(10 CHAR) not null,
  excfalg    NUMBER(1) not null,
  premessage VARCHAR2(120 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TORG_TEMPLATE
  is '彩票方案表';
comment on column jrtsch.TORG_TEMPLATE.tempname
  is '方案名';
comment on column jrtsch.TORG_TEMPLATE.lottid
  is '彩种';
comment on column jrtsch.TORG_TEMPLATE.betnum
  is '赠送倍数';
comment on column jrtsch.TORG_TEMPLATE.bettype
  is '投注方式 1：单式 ，2：复式,3:胆拖';
comment on column jrtsch.TORG_TEMPLATE.seltype
  is '选球方式 0：手选1：机选';
comment on column jrtsch.TORG_TEMPLATE.message
  is '短信内容';
comment on column jrtsch.TORG_TEMPLATE.userid
  is '创建人ID
';
comment on column jrtsch.TORG_TEMPLATE.excfalg
  is '执行标识0未执行1执行';
comment on column jrtsch.TORG_TEMPLATE.premessage
  is '前置短信内容';
alter table jrtsch.TORG_TEMPLATE
  add constraint PK_TORG_TEMPLATE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TPAYMODE
-- prompt =======================
-- prompt
create table jrtsch.TPAYMODE
(
  id          VARCHAR2(32 CHAR) not null,
  payplatcode VARCHAR2(10 CHAR) default ' ' not null,
  payplatname VARCHAR2(30 CHAR) default ' ' not null,
  paywaycode  VARCHAR2(10 CHAR) default ' ' not null,
  paywayname  VARCHAR2(30 CHAR) default ' ' not null,
  paytypecode VARCHAR2(10 CHAR) default ' ' not null,
  paytypename VARCHAR2(30 CHAR) default ' ' not null,
  state       NUMBER(5) default 0 not null,
  accesstype  CHAR(1) default ' ' not null,
  accessdesc  VARCHAR2(20 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TPAYMODE
  is '可选充值方式表';
comment on column jrtsch.TPAYMODE.id
  is '主键';
comment on column jrtsch.TPAYMODE.payplatcode
  is '支付平台代号，如：000001/000002/000003/...';
comment on column jrtsch.TPAYMODE.payplatname
  is '支付平台名称，如：支付宝/易宝/DNA/...';
comment on column jrtsch.TPAYMODE.paywaycode
  is '支付方式卡类别id，01（银行卡）、02（非银行卡）、03（自有账户或自有卡）';
comment on column jrtsch.TPAYMODE.paywayname
  is '支付方式卡类别名称，如:银行卡/非银行卡/平台卡/...';
comment on column jrtsch.TPAYMODE.paytypecode
  is '卡标识序号，如:01/02/03/04/05/06/...';
comment on column jrtsch.TPAYMODE.paytypename
  is '卡标识名称，如:移动卡/联通卡/盛大卡/...';
comment on column jrtsch.TPAYMODE.state
  is '点卡状态';
comment on column jrtsch.TPAYMODE.accesstype
  is '接入方式';
comment on column jrtsch.TPAYMODE.accessdesc
  is '接入方式描述，B表示web，W表示wap，C表示客户端';
alter table jrtsch.TPAYMODE
  add constraint PK_TPAYMODE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TPAYORG
-- prompt ======================
-- prompt
create table jrtsch.TPAYORG
(
  agencyno  VARCHAR2(6 CHAR) default ' ' not null,
  state     NUMBER(5) default 0 not null,
  type      NUMBER(5) default 0 not null,
  password  VARCHAR2(64 CHAR) default ' ' not null,
  feemode   NUMBER(5) default 0 not null,
  rate      VARCHAR2(30 CHAR) default ' ' not null,
  name      VARCHAR2(20 CHAR) default ' ' not null,
  accname   VARCHAR2(30 CHAR) default ' ' not null,
  bankacc   VARCHAR2(30 CHAR) default ' ' not null,
  bankname  VARCHAR2(30 CHAR) default ' ' not null,
  phone     VARCHAR2(50 CHAR) default ' ' not null,
  merid     VARCHAR2(32 CHAR) default ' ' not null,
  orderurl  VARCHAR2(256 CHAR) default ' ' not null,
  pageurl   VARCHAR2(256 CHAR) default ' ' not null,
  bgurl     VARCHAR2(256 CHAR) default ' ' not null,
  mercert   VARCHAR2(4000 CHAR) default ' ' not null,
  merkey    VARCHAR2(4000 CHAR) default ' ' not null,
  merkeypwd VARCHAR2(64 CHAR) default ' ' not null,
  bankcert  VARCHAR2(4000 CHAR) default ' ' not null,
  web       VARCHAR2(128 CHAR) default ' ' not null,
  webacc    VARCHAR2(20 CHAR) default ' ' not null,
  webpass   VARCHAR2(8 CHAR) default ' ' not null,
  address   VARCHAR2(40 CHAR) default ' ' not null,
  regtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  modtime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  info      VARCHAR2(50 CHAR) default ' ' not null,
  mac       VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TPAYORG
  is '支付机构表';
comment on column jrtsch.TPAYORG.agencyno
  is '支付机构编号，UNIQUE 800001-899999';
comment on column jrtsch.TPAYORG.state
  is '支付机构状态，设定不同的状态以控制交易';
comment on column jrtsch.TPAYORG.type
  is '支付机构种类，0：银行，1：第三方代理，2：其他 ';
comment on column jrtsch.TPAYORG.password
  is '支付机构密码摘要，采用MD5加密的摘要';
comment on column jrtsch.TPAYORG.feemode
  is '手续费模式，0：固定，1：阶梯';
comment on column jrtsch.TPAYORG.rate
  is '手续费比例，固定：一个百分数字，阶梯：阶梯值1|百分数1#阶梯值2|百分数2#……阶梯值N|百分数N
';
comment on column jrtsch.TPAYORG.name
  is '支付机构名称';
comment on column jrtsch.TPAYORG.accname
  is '结算账户名';
comment on column jrtsch.TPAYORG.bankacc
  is '结算账户号';
comment on column jrtsch.TPAYORG.bankname
  is '结算银行名';
comment on column jrtsch.TPAYORG.phone
  is '联系电话  多个电话可以连在一起';
comment on column jrtsch.TPAYORG.merid
  is '银行商户标识';
comment on column jrtsch.TPAYORG.orderurl
  is '银行订单地址';
comment on column jrtsch.TPAYORG.pageurl
  is '页面通知地址';
comment on column jrtsch.TPAYORG.bgurl
  is '后台通知地址';
comment on column jrtsch.TPAYORG.mercert
  is '银行商户证书';
comment on column jrtsch.TPAYORG.merkey
  is '银行商户私钥';
comment on column jrtsch.TPAYORG.merkeypwd
  is '银行商户私钥密码';
comment on column jrtsch.TPAYORG.bankcert
  is '银行证书';
comment on column jrtsch.TPAYORG.web
  is '支付机构网址';
comment on column jrtsch.TPAYORG.webacc
  is '支付机构网上管理帐号，是否保存？';
comment on column jrtsch.TPAYORG.webpass
  is '支付机构网上管理密码，是否保存？';
comment on column jrtsch.TPAYORG.address
  is '地址';
comment on column jrtsch.TPAYORG.regtime
  is '开户日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TPAYORG.modtime
  is '上次访问日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TPAYORG.info
  is '保留';
comment on column jrtsch.TPAYORG.mac
  is '敏感数据控制块，采用HASH/MD5算法加密敏感数据：作为认证用';
alter table jrtsch.TPAYORG
  add constraint PK_TPAYORG primary key (AGENCYNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TPICTURERING
-- prompt ===========================
-- prompt
create table jrtsch.TPICTURERING
(
  id       NUMBER(10) not null,
  content  VARCHAR2(100) not null,
  path     VARCHAR2(200) not null,
  type     VARCHAR2(10) not null,
  datetime TIMESTAMP(6)
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
alter table jrtsch.TPICTURERING
  add primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TPLATACCOUNT
-- prompt ===========================
-- prompt
create table jrtsch.TPLATACCOUNT
(
  agencyno     VARCHAR2(6 CHAR) default ' ' not null,
  payamt       NUMBER(20) default 0 not null,
  regtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  modtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  earnamt      NUMBER(20) default 0 not null,
  lastpayamt   NUMBER(20) default 0 not null,
  totalpayamt  NUMBER(20) default 0 not null,
  lastearnamt  NUMBER(20) default 0 not null,
  totalearnamt NUMBER(20) default 0 not null,
  laststltime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  mac          VARCHAR2(64 CHAR) default ' ' not null,
  type         NUMBER(5) default 0,
  agentno      VARCHAR2(6 CHAR) default ' '
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TPLATACCOUNT
  is '机构账目表';
comment on column jrtsch.TPLATACCOUNT.agencyno
  is '机构编号，UNIQUE 包括彩票管理机构、分销渠道以及银行和其他第三方支付代理机构';
comment on column jrtsch.TPLATACCOUNT.payamt
  is '本次结算贷记余额，对该机构来说需支付的金额';
comment on column jrtsch.TPLATACCOUNT.regtime
  is '账户开户日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TPLATACCOUNT.modtime
  is '上次访问日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TPLATACCOUNT.earnamt
  is '本次结算借记余额，对该机构来说需收取的金额';
comment on column jrtsch.TPLATACCOUNT.lastpayamt
  is '上次结算贷记金额';
comment on column jrtsch.TPLATACCOUNT.totalpayamt
  is '累计结算贷记金额';
comment on column jrtsch.TPLATACCOUNT.lastearnamt
  is '上次结算借记金额';
comment on column jrtsch.TPLATACCOUNT.totalearnamt
  is '累计结算借记金额';
comment on column jrtsch.TPLATACCOUNT.laststltime
  is '上次结算日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TPLATACCOUNT.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
comment on column jrtsch.TPLATACCOUNT.type
  is '用于表示数据的用途，0表示查账，1表示余额监控';
comment on column jrtsch.TPLATACCOUNT.agentno
  is '机构编号，表示彩票中心';
alter table jrtsch.TPLATACCOUNT
  add constraint PK_TPLATACCOUNT primary key (AGENCYNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TPLATCARDMAP
-- prompt ===========================
-- prompt
create table jrtsch.TPLATCARDMAP
(
  cardtypeid    VARCHAR2(10) not null,
  platformid    VARCHAR2(10) not null,
  accesstype    VARCHAR2(10) not null,
  implclassname VARCHAR2(100) not null,
  feerate       NUMBER,
  targetcardid  VARCHAR2(20),
  carddesc      VARCHAR2(100),
  cardname      VARCHAR2(30) not null,
  state         NUMBER not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TPLATCARDMAP
  is '支付平台卡类型映射表';
comment on column jrtsch.TPLATCARDMAP.cardtypeid
  is '卡类型ID';
comment on column jrtsch.TPLATCARDMAP.platformid
  is '支付平台ID';
comment on column jrtsch.TPLATCARDMAP.accesstype
  is '接入方式:B-web W-wap C-手机';
comment on column jrtsch.TPLATCARDMAP.implclassname
  is '实现类';
comment on column jrtsch.TPLATCARDMAP.feerate
  is '费率';
comment on column jrtsch.TPLATCARDMAP.targetcardid
  is '卡目标类型';
comment on column jrtsch.TPLATCARDMAP.carddesc
  is '描述';
comment on column jrtsch.TPLATCARDMAP.cardname
  is '卡名称';
comment on column jrtsch.TPLATCARDMAP.state
  is '状态:1可用 0不可用';
alter table jrtsch.TPLATCARDMAP
  add constraint 映射主键 primary key (CARDTYPEID, PLATFORMID, ACCESSTYPE)
  disable;

-- prompt
-- prompt Creating table TPLATFORM
-- prompt ========================
-- prompt
create table jrtsch.TPLATFORM
(
  platformid   VARCHAR2(10) not null,
  platformname VARCHAR2(30) not null,
  state        NUMBER not null,
  priorityno   NUMBER not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TPLATFORM
  is '支付平台表';
comment on column jrtsch.TPLATFORM.platformid
  is '支付平台ID';
comment on column jrtsch.TPLATFORM.platformname
  is '支付平台名称';
comment on column jrtsch.TPLATFORM.state
  is '状态:1可用 0不可用';
comment on column jrtsch.TPLATFORM.priorityno
  is '优先级:1 2 3..数字越大级别越高';
alter table jrtsch.TPLATFORM
  add constraint 主键 primary key (PLATFORMID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TPRESENTERPHONEMONEY
-- prompt ===================================
-- prompt
create table jrtsch.TPRESENTERPHONEMONEY
(
  id             NUMBER not null,
  rechargeamt    NUMBER(10) not null,
  giftamt        NUMBER(10) not null,
  starttime      TIMESTAMP(6) not null,
  endtime        TIMESTAMP(6) not null,
  state          NUMBER(1) not null,
  totalchargeamt NUMBER(10) default 0,
  totalgiftamt   NUMBER(10) default 0
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.TPRESENTERPHONEMONEY.id
  is '主键';
comment on column jrtsch.TPRESENTERPHONEMONEY.rechargeamt
  is '充值金额(单位：分)';
comment on column jrtsch.TPRESENTERPHONEMONEY.giftamt
  is '赠送金额(单位：分)';
comment on column jrtsch.TPRESENTERPHONEMONEY.starttime
  is '开始时间';
comment on column jrtsch.TPRESENTERPHONEMONEY.endtime
  is '结束时间';
comment on column jrtsch.TPRESENTERPHONEMONEY.state
  is '0：关闭 1：开通';
comment on column jrtsch.TPRESENTERPHONEMONEY.totalchargeamt
  is '充值总金额';
comment on column jrtsch.TPRESENTERPHONEMONEY.totalgiftamt
  is '赠送总金额';

-- prompt
-- prompt Creating table TPUSHMONEYTYPE
-- prompt =============================
-- prompt
create table jrtsch.TPUSHMONEYTYPE
(
  leave        VARCHAR2(20 CHAR) default ' ' not null,
  pushmoenypre NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TPUSHMONEYTYPE
  is '用户等级-佣金对照表';
comment on column jrtsch.TPUSHMONEYTYPE.leave
  is '用户等级';
comment on column jrtsch.TPUSHMONEYTYPE.pushmoenypre
  is '佣金比例';

-- prompt
-- prompt Creating table TRETTYPE
-- prompt =======================
-- prompt
create table jrtsch.TRETTYPE
(
  retcode          VARCHAR2(12 CHAR) default ' ' not null,
  codename         VARCHAR2(60 CHAR) default ' ' not null,
  ttransactiontype NUMBER(5) default 0 not null,
  outretcode       VARCHAR2(12 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TRETTYPE
  is '系统返回码信息表';
comment on column jrtsch.TRETTYPE.retcode
  is '返回码';
comment on column jrtsch.TRETTYPE.codename
  is '返回码名称（内容）';
comment on column jrtsch.TRETTYPE.ttransactiontype
  is '在哪个交易中使用';
comment on column jrtsch.TRETTYPE.outretcode
  is '外部返回码，表示银行或福彩中心的返回码';
alter table jrtsch.TRETTYPE
  add constraint PK_TRETTYPE primary key (RETCODE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSALEREPORTXJFC
-- prompt ==============================
-- prompt
create table jrtsch.TSALEREPORTXJFC
(
  ucinfotype        NUMBER(5) not null,
  ucgameid          VARCHAR2(6 CHAR) default ' ' not null,
  ucfinal           NUMBER(5) default 0 not null,
  ucunused          VARCHAR2(50 CHAR) default ' ' not null,
  ulsaleticket      NUMBER(5) default 0 not null,
  ulsalemoney       NUMBER(12) default 0 not null,
  ulcancelticket    NUMBER(5) default 0 not null,
  ulcancelmoney     NUMBER(12) default 0 not null,
  ulcencancelticket NUMBER(5) default 0 not null,
  ulcencancelmoney  NUMBER(12) default 0 not null,
  ulcashticket      NUMBER(5) default 0 not null,
  ulcashmoney       NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSALEREPORTXJFC
  is '新疆时时彩报表';
comment on column jrtsch.TSALEREPORTXJFC.ucinfotype
  is '报表类型: 1期报表和2日报表';
comment on column jrtsch.TSALEREPORTXJFC.ucgameid
  is '游戏代码，99为全部游戏';
comment on column jrtsch.TSALEREPORTXJFC.ucfinal
  is '汇总标志, 0未汇总, 1已汇总';
comment on column jrtsch.TSALEREPORTXJFC.ucunused
  is '预留';
comment on column jrtsch.TSALEREPORTXJFC.ulsaleticket
  is '总销售票数';
comment on column jrtsch.TSALEREPORTXJFC.ulsalemoney
  is '总销售金额';
comment on column jrtsch.TSALEREPORTXJFC.ulcancelticket
  is '注销票数';
comment on column jrtsch.TSALEREPORTXJFC.ulcancelmoney
  is '注销金额';
comment on column jrtsch.TSALEREPORTXJFC.ulcencancelticket
  is '中心注销票数';
comment on column jrtsch.TSALEREPORTXJFC.ulcencancelmoney
  is '中心注销金额';
comment on column jrtsch.TSALEREPORTXJFC.ulcashticket
  is '兑奖票数';
comment on column jrtsch.TSALEREPORTXJFC.ulcashmoney
  is '兑奖金额';

-- prompt
-- prompt Creating table TSEQ
-- prompt ===================
-- prompt
create table jrtsch.TSEQ
(
  id   VARCHAR2(16 CHAR) not null,
  seq  NUMBER(9) default 0 not null,
  memo VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSEQ
  is '序列号表';
comment on column jrtsch.TSEQ.id
  is '序列标识，userAccount：用户帐号，tranRpid：交易流水号，chargeRpid：充值流水号';
comment on column jrtsch.TSEQ.seq
  is '序列号';
comment on column jrtsch.TSEQ.memo
  is '描述';
alter table jrtsch.TSEQ
  add constraint PK_TSEQ primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSERVICE
-- prompt =======================
-- prompt
create table jrtsch.TSERVICE
(
  id       NUMBER(8) not null,
  tnodeid  VARCHAR2(16 CHAR) not null,
  type     VARCHAR2(16 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null,
  modtime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  tlogid   VARCHAR2(16 CHAR) default ' ' not null,
  interval NUMBER(5) default 0 not null,
  param    VARCHAR2(15 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSERVICE
  is '服务管理:为已添加的节点设置端口，检测时间';
comment on column jrtsch.TSERVICE.id
  is '服务标示（端口）';
comment on column jrtsch.TSERVICE.tnodeid
  is '节点标示';
comment on column jrtsch.TSERVICE.type
  is '服务类型 PING、TELNET、RESIN、NGINX、AG.CPU、AG.MEM、AG.DSK';
comment on column jrtsch.TSERVICE.state
  is '状态，0：false，1：ok';
comment on column jrtsch.TSERVICE.modtime
  is '最后检测时间';
comment on column jrtsch.TSERVICE.tlogid
  is '节点标示';
comment on column jrtsch.TSERVICE.param
  is '采样参数:用户名+密码';
alter table jrtsch.TSERVICE
  add constraint PK_TSERVICE primary key (ID, TNODEID, TYPE)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSUBCHANNEL
-- prompt ==========================
-- prompt
create table jrtsch.TSUBCHANNEL
(
  agencyno       VARCHAR2(8 CHAR) not null,
  agencyname     VARCHAR2(20 CHAR) not null,
  telephone      VARCHAR2(20 CHAR) default ' ',
  address        VARCHAR2(255 CHAR) default ' ',
  regtime        TIMESTAMP(6) default SYSDATE not null,
  state          NUMBER(2) default 0 not null,
  mac            VARCHAR2(32 CHAR) default ' ' not null,
  notifyurl      VARCHAR2(100 CHAR) default ' ',
  privatekey     VARCHAR2(4000 CHAR) default ' ',
  pubvatekey     VARCHAR2(4000 CHAR) default '',
  noticeprotocol VARCHAR2(100 CHAR) default '',
  protocol       VARCHAR2(100 CHAR) default '',
  pwd            VARCHAR2(10),
  userid         VARCHAR2(16)
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSUBCHANNEL
  is '下游机构用户表';
comment on column jrtsch.TSUBCHANNEL.agencyno
  is '机构用户编号';
comment on column jrtsch.TSUBCHANNEL.agencyname
  is '机构名';
comment on column jrtsch.TSUBCHANNEL.telephone
  is '联系电话';
comment on column jrtsch.TSUBCHANNEL.address
  is '公司地址';
comment on column jrtsch.TSUBCHANNEL.regtime
  is '登陆时间';
comment on column jrtsch.TSUBCHANNEL.state
  is '用户状态(0 停用 1--启用)';
comment on column jrtsch.TSUBCHANNEL.mac
  is '校验码';
comment on column jrtsch.TSUBCHANNEL.notifyurl
  is '异步通知地址';
comment on column jrtsch.TSUBCHANNEL.privatekey
  is '密钥';
comment on column jrtsch.TSUBCHANNEL.pubvatekey
  is '公钥';
comment on column jrtsch.TSUBCHANNEL.noticeprotocol
  is '协议';
comment on column jrtsch.TSUBCHANNEL.protocol
  is '协议';
comment on column jrtsch.TSUBCHANNEL.pwd
  is '登录密码';
alter table jrtsch.TSUBCHANNEL
  add constraint PK_TSUBCHANNEL primary key (AGENCYNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSUBMENU
-- prompt =======================
-- prompt
create table jrtsch.TSUBMENU
(
  id    VARCHAR2(32 CHAR) not null,
  preno NUMBER(5) not null,
  url   VARCHAR2(128 CHAR) default ' ' not null,
  memo  VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSUBMENU
  is '子菜单表';
comment on column jrtsch.TSUBMENU.id
  is '子菜单标识';
comment on column jrtsch.TSUBMENU.preno
  is '菜单标识';
comment on column jrtsch.TSUBMENU.url
  is '子菜单Url';
comment on column jrtsch.TSUBMENU.memo
  is '描述';
alter table jrtsch.TSUBMENU
  add constraint PK_TSUBMENU primary key (ID, PRENO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSUBSCRIBE
-- prompt =========================
-- prompt
create table jrtsch.TSUBSCRIBE
(
  flowno     VARCHAR2(16 CHAR) not null,
  userno     VARCHAR2(8 CHAR) not null,
  lotno      VARCHAR2(6 CHAR) default ' ' not null,
  agentno    VARCHAR2(6 CHAR) default ' ' not null,
  batchnum   NUMBER(5) default 0 not null,
  lastnum    NUMBER(5) default 0 not null,
  beginbatch VARCHAR2(15 CHAR) default ' ' not null,
  lastbatch  VARCHAR2(15 CHAR) default ' ' not null,
  betnum     NUMBER(9) default 0 not null,
  drawway    NUMBER(5) default 0 not null,
  sellway    NUMBER(5) default 0 not null,
  betcode    VARCHAR2(120 CHAR) default ' ' not null,
  amount     NUMBER(12) default 0 not null,
  totalamt   NUMBER(12) default 0 not null,
  ordertime  TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  mac        VARCHAR2(64 CHAR) default ' ' not null,
  type       NUMBER(5) default 0 not null,
  state      NUMBER(5) default 0 not null,
  endtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS')
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSUBSCRIBE
  is '追号、套餐彩票信息记录表';
comment on column jrtsch.TSUBSCRIBE.flowno
  is '追号、套餐彩票的交易流水号，记录在账务日志记录表里的交易流水号，用来检索查询';
comment on column jrtsch.TSUBSCRIBE.userno
  is '客户编号';
comment on column jrtsch.TSUBSCRIBE.lotno
  is '彩种编号';
comment on column jrtsch.TSUBSCRIBE.agentno
  is '分销渠道编号，分销渠道，如没有则为金软通本部，即000001';
comment on column jrtsch.TSUBSCRIBE.batchnum
  is '彩票购买期数';
comment on column jrtsch.TSUBSCRIBE.lastnum
  is '剩余购买期数，彩票购买期数-已经购买的期数';
comment on column jrtsch.TSUBSCRIBE.beginbatch
  is '开始投注的彩票期号';
comment on column jrtsch.TSUBSCRIBE.lastbatch
  is '上次投注的彩票期号，如果开始投注的彩票期号晚于当前的彩票期号，则记录当前的彩票期号';
comment on column jrtsch.TSUBSCRIBE.betnum
  is '彩票注数';
comment on column jrtsch.TSUBSCRIBE.drawway
  is '投注方式，（0-单式，1-复式，2-胆拖）';
comment on column jrtsch.TSUBSCRIBE.sellway
  is '销售方式，（0-自选，1-手选，2-机选）';
comment on column jrtsch.TSUBSCRIBE.betcode
  is '彩票注码';
comment on column jrtsch.TSUBSCRIBE.amount
  is '单次投注金额';
comment on column jrtsch.TSUBSCRIBE.totalamt
  is '剩余投注总金额，总金额=剩余投注总金额+单次投注金额×彩票购买期数
剩余投注总金额=单次投注金额×剩余购买期数
';
comment on column jrtsch.TSUBSCRIBE.ordertime
  is '上次系统投注时间，YYYYMMDDHHMMSS';
comment on column jrtsch.TSUBSCRIBE.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
comment on column jrtsch.TSUBSCRIBE.type
  is '追号套餐类型，0：追号，1：套餐';
comment on column jrtsch.TSUBSCRIBE.state
  is '套餐状态，0：正常，1：暂停，2：注销';
comment on column jrtsch.TSUBSCRIBE.endtime
  is '追号注销时间，YYYYMMDDHHMMSS';
alter table jrtsch.TSUBSCRIBE
  add constraint PK_TSUBSCRIBE primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSUBSCRIBEXJFC
-- prompt =============================
-- prompt
create table jrtsch.TSUBSCRIBEXJFC
(
  flowno    VARCHAR2(16 CHAR) default ' ' not null,
  playtype  NUMBER(5) default 0 not null,
  playnum   VARCHAR2(200 CHAR) default ' ' not null,
  playstate NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSUBSCRIBEXJFC
  is '新疆追号扩展表';
comment on column jrtsch.TSUBSCRIBEXJFC.flowno
  is '流水号（对应追号表中流水号）';
comment on column jrtsch.TSUBSCRIBEXJFC.playtype
  is '追号类型0：自选，1：任一星，2：大小双';
comment on column jrtsch.TSUBSCRIBEXJFC.playnum
  is '每期追号倍数';
comment on column jrtsch.TSUBSCRIBEXJFC.playstate
  is '中奖状态0 ：未中奖，1：中奖，3中奖已停止追号，4追号失败停止
如果playtype为1或者2时中奖则停止追号
';
alter table jrtsch.TSUBSCRIBEXJFC
  add constraint FLOWNO primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TSYSCTRL
-- prompt =======================
-- prompt
create table jrtsch.TSYSCTRL
(
  serverid    VARCHAR2(4 CHAR) default ' ' not null,
  systemstate NUMBER(5) default 0 not null,
  starttime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  server0     NUMBER(12) default 0 not null,
  server      NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TSYSCTRL
  is '系统控制表';
comment on column jrtsch.TSYSCTRL.serverid
  is '服务器编号';
comment on column jrtsch.TSYSCTRL.systemstate
  is '系统状态，0：正常运行，1：批量处理，2：日终轧账处理，9：关闭';
comment on column jrtsch.TSYSCTRL.starttime
  is '数据库轧账开始时间';
comment on column jrtsch.TSYSCTRL.endtime
  is '数据库轧账结束时间';
comment on column jrtsch.TSYSCTRL.server0
  is '服务器0与本系统时差，与福彩或体彩系统的时差，以秒为单位';
comment on column jrtsch.TSYSCTRL.server
  is '服务器时差，与本地标准服务器的时差';
alter table jrtsch.TSYSCTRL
  add constraint PK_TSYSCTRL primary key (SERVERID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTERM
-- prompt ====================
-- prompt
create table jrtsch.TTERM
(
  id            VARCHAR2(16 CHAR) not null,
  playname      VARCHAR2(16 CHAR) default ' ' not null,
  termcode      VARCHAR2(16 CHAR) default ' ' not null,
  begintime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime       TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  stationbegin  VARCHAR2(16 CHAR) default ' ' not null,
  stationend    VARCHAR2(16 CHAR) default ' ' not null,
  maxruncode    VARCHAR2(16 CHAR) default ' ' not null,
  maxtermnum    NUMBER(5) default 0 not null,
  multermcode   VARCHAR2(16 CHAR) default ' ' not null,
  multermcode2  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode3  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode4  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode5  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode6  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode7  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode8  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode9  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode10 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode11 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode12 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode13 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode14 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode15 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode16 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode17 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode18 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode19 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode20 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode21 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode22 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode23 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode24 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode25 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode26 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode27 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode28 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode29 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode30 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode31 VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTERM
  is '新期参数表';
comment on column jrtsch.TTERM.id
  is '流水号';
comment on column jrtsch.TTERM.playname
  is '玩法英文名称';
comment on column jrtsch.TTERM.termcode
  is '期号';
comment on column jrtsch.TTERM.begintime
  is '开期日期时间';
comment on column jrtsch.TTERM.endtime
  is '封机日期时间';
comment on column jrtsch.TTERM.stationbegin
  is '开始机号';
comment on column jrtsch.TTERM.stationend
  is '结束机号';
comment on column jrtsch.TTERM.maxruncode
  is '站点销售最大流水号（流水号范围定义为00001到16000，定义长度10为主要为了以后扩充）';
comment on column jrtsch.TTERM.maxtermnum
  is '最大多期期数，最大值为31';
comment on column jrtsch.TTERM.multermcode
  is '多期期号1';
comment on column jrtsch.TTERM.multermcode2
  is '多期期号2';
comment on column jrtsch.TTERM.multermcode3
  is '多期期号3';
comment on column jrtsch.TTERM.multermcode4
  is '多期期号4';
comment on column jrtsch.TTERM.multermcode5
  is '多期期号5';
comment on column jrtsch.TTERM.multermcode6
  is '多期期号6';
comment on column jrtsch.TTERM.multermcode7
  is '多期期号7';
comment on column jrtsch.TTERM.multermcode8
  is '多期期号8';
comment on column jrtsch.TTERM.multermcode9
  is '多期期号9';
comment on column jrtsch.TTERM.multermcode10
  is '多期期号10';
comment on column jrtsch.TTERM.multermcode11
  is '多期期号11';
comment on column jrtsch.TTERM.multermcode12
  is '多期期号12';
comment on column jrtsch.TTERM.multermcode13
  is '多期期号13';
comment on column jrtsch.TTERM.multermcode14
  is '多期期号14';
comment on column jrtsch.TTERM.multermcode15
  is '多期期号15';
comment on column jrtsch.TTERM.multermcode16
  is '多期期号16';
comment on column jrtsch.TTERM.multermcode17
  is '多期期号17';
comment on column jrtsch.TTERM.multermcode18
  is '多期期号18';
comment on column jrtsch.TTERM.multermcode19
  is '多期期号19';
comment on column jrtsch.TTERM.multermcode20
  is '多期期号20';
comment on column jrtsch.TTERM.multermcode21
  is '多期期号21';
comment on column jrtsch.TTERM.multermcode22
  is '多期期号22';
comment on column jrtsch.TTERM.multermcode23
  is '多期期号23';
comment on column jrtsch.TTERM.multermcode24
  is '多期期号24';
comment on column jrtsch.TTERM.multermcode25
  is '多期期号25';
comment on column jrtsch.TTERM.multermcode26
  is '多期期号26';
comment on column jrtsch.TTERM.multermcode27
  is '多期期号27';
comment on column jrtsch.TTERM.multermcode28
  is '多期期号28';
comment on column jrtsch.TTERM.multermcode29
  is '多期期号29';
comment on column jrtsch.TTERM.multermcode30
  is '多期期号30';
comment on column jrtsch.TTERM.multermcode31
  is '多期期号31';
alter table jrtsch.TTERM
  add constraint PK_TTERM primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTERMSXFC
-- prompt ========================
-- prompt
create table jrtsch.TTERMSXFC
(
  id            VARCHAR2(16 CHAR) not null,
  playname      VARCHAR2(16 CHAR) default ' ' not null,
  termcode      VARCHAR2(16 CHAR) default ' ' not null,
  begintime     TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  endtime       TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  stationbegin  VARCHAR2(16 CHAR) default ' ' not null,
  stationend    VARCHAR2(16 CHAR) default ' ' not null,
  maxruncode    VARCHAR2(16 CHAR) default ' ' not null,
  maxtermnum    NUMBER(5) default 0 not null,
  multermcode   VARCHAR2(16 CHAR) default ' ' not null,
  multermcode2  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode3  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode4  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode5  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode6  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode7  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode8  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode9  VARCHAR2(16 CHAR) default ' ' not null,
  multermcode10 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode11 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode12 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode13 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode14 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode15 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode16 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode17 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode18 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode19 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode20 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode21 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode22 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode23 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode24 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode25 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode26 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode27 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode28 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode29 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode30 VARCHAR2(16 CHAR) default ' ' not null,
  multermcode31 VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTERMSXFC
  is '新期参数表';
comment on column jrtsch.TTERMSXFC.id
  is '流水号';
comment on column jrtsch.TTERMSXFC.playname
  is '玩法英文名称';
comment on column jrtsch.TTERMSXFC.termcode
  is '期号';
comment on column jrtsch.TTERMSXFC.begintime
  is '开期日期时间';
comment on column jrtsch.TTERMSXFC.endtime
  is '封机日期时间';
comment on column jrtsch.TTERMSXFC.stationbegin
  is '开始机号';
comment on column jrtsch.TTERMSXFC.stationend
  is '结束机号';
comment on column jrtsch.TTERMSXFC.maxruncode
  is '站点销售最大流水号（流水号范围定义为00001到16000，定义长度10为主要为了以后扩充）';
comment on column jrtsch.TTERMSXFC.maxtermnum
  is '最大多期期数，最大值为31';
comment on column jrtsch.TTERMSXFC.multermcode
  is '多期期号1';
comment on column jrtsch.TTERMSXFC.multermcode2
  is '多期期号2';
comment on column jrtsch.TTERMSXFC.multermcode3
  is '多期期号3';
comment on column jrtsch.TTERMSXFC.multermcode4
  is '多期期号4';
comment on column jrtsch.TTERMSXFC.multermcode5
  is '多期期号5';
comment on column jrtsch.TTERMSXFC.multermcode6
  is '多期期号6';
comment on column jrtsch.TTERMSXFC.multermcode7
  is '多期期号7';
comment on column jrtsch.TTERMSXFC.multermcode8
  is '多期期号8';
comment on column jrtsch.TTERMSXFC.multermcode9
  is '多期期号9';
comment on column jrtsch.TTERMSXFC.multermcode10
  is '多期期号10';
comment on column jrtsch.TTERMSXFC.multermcode11
  is '多期期号11';
comment on column jrtsch.TTERMSXFC.multermcode12
  is '多期期号12';
comment on column jrtsch.TTERMSXFC.multermcode13
  is '多期期号13';
comment on column jrtsch.TTERMSXFC.multermcode14
  is '多期期号14';
comment on column jrtsch.TTERMSXFC.multermcode15
  is '多期期号15';
comment on column jrtsch.TTERMSXFC.multermcode16
  is '多期期号16';
comment on column jrtsch.TTERMSXFC.multermcode17
  is '多期期号17';
comment on column jrtsch.TTERMSXFC.multermcode18
  is '多期期号18';
comment on column jrtsch.TTERMSXFC.multermcode19
  is '多期期号19';
comment on column jrtsch.TTERMSXFC.multermcode20
  is '多期期号20';
comment on column jrtsch.TTERMSXFC.multermcode21
  is '多期期号21';
comment on column jrtsch.TTERMSXFC.multermcode22
  is '多期期号22';
comment on column jrtsch.TTERMSXFC.multermcode23
  is '多期期号23';
comment on column jrtsch.TTERMSXFC.multermcode24
  is '多期期号24';
comment on column jrtsch.TTERMSXFC.multermcode25
  is '多期期号25';
comment on column jrtsch.TTERMSXFC.multermcode26
  is '多期期号26';
comment on column jrtsch.TTERMSXFC.multermcode27
  is '多期期号27';
comment on column jrtsch.TTERMSXFC.multermcode28
  is '多期期号28';
comment on column jrtsch.TTERMSXFC.multermcode29
  is '多期期号29';
comment on column jrtsch.TTERMSXFC.multermcode30
  is '多期期号30';
comment on column jrtsch.TTERMSXFC.multermcode31
  is '多期期号31';
alter table jrtsch.TTERMSXFC
  add constraint PK_TTERMSXFC primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTMCTRL
-- prompt ======================
-- prompt
create table jrtsch.TTMCTRL
(
  id           VARCHAR2(16 CHAR) default ' ' not null,
  agencyno     VARCHAR2(6 CHAR) default ' ' not null,
  lotno        VARCHAR2(6 CHAR) default ' ' not null,
  machineno    VARCHAR2(20 CHAR) default ' ' not null,
  machinestate NUMBER(5) default 0 not null,
  totalcount   NUMBER(12) default 0 not null,
  totalamt     NUMBER(12) default 0 not null,
  maxcount     NUMBER(12) default 0 not null,
  maxamt       NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTMCTRL
  is '逻辑机号控制表';
comment on column jrtsch.TTMCTRL.id
  is 'Id  主键,自动标识(1,1)';
comment on column jrtsch.TTMCTRL.agencyno
  is '彩票机构编号，渠道编号，外键';
comment on column jrtsch.TTMCTRL.lotno
  is '彩种编号，外键';
comment on column jrtsch.TTMCTRL.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TTMCTRL.machinestate
  is '逻辑机号状态，0：空闲  1：忙碌';
comment on column jrtsch.TTMCTRL.totalcount
  is '当前累计交易比数';
comment on column jrtsch.TTMCTRL.totalamt
  is '当前累计交易金额';
comment on column jrtsch.TTMCTRL.maxcount
  is '逻辑机交易比数限额(彩票张数)';
comment on column jrtsch.TTMCTRL.maxamt
  is '逻辑机交易金额限额';
alter table jrtsch.TTMCTRL
  add constraint PK_TTMCTRL primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTMCTRLSXFC
-- prompt ==========================
-- prompt
create table jrtsch.TTMCTRLSXFC
(
  id           VARCHAR2(16 CHAR) default ' ' not null,
  agencyno     VARCHAR2(6 CHAR) default ' ' not null,
  lotno        VARCHAR2(6 CHAR) default ' ' not null,
  machineno    VARCHAR2(20 CHAR) default ' ' not null,
  machinestate NUMBER(5) default 0 not null,
  totalcount   NUMBER(12) default 0 not null,
  totalamt     NUMBER(12) default 0 not null,
  maxcount     NUMBER(12) default 0 not null,
  maxamt       NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTMCTRLSXFC
  is '逻辑机控制表';
comment on column jrtsch.TTMCTRLSXFC.id
  is 'Id  主键,自动标识(1,1)';
comment on column jrtsch.TTMCTRLSXFC.agencyno
  is '彩票机构编号，渠道编号，外键';
comment on column jrtsch.TTMCTRLSXFC.lotno
  is '彩种编号，外键';
comment on column jrtsch.TTMCTRLSXFC.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TTMCTRLSXFC.machinestate
  is '逻辑机号状态，0：空闲  1：忙碌';
comment on column jrtsch.TTMCTRLSXFC.totalcount
  is '当前累计交易比数';
comment on column jrtsch.TTMCTRLSXFC.totalamt
  is '当前累计交易金额';
comment on column jrtsch.TTMCTRLSXFC.maxcount
  is '逻辑机交易比数限额(彩票张数)';
comment on column jrtsch.TTMCTRLSXFC.maxamt
  is '逻辑机交易金额限额';
alter table jrtsch.TTMCTRLSXFC
  add constraint PK_TTMCTRLSXF primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTMCTRLXJFC
-- prompt ==========================
-- prompt
create table jrtsch.TTMCTRLXJFC
(
  id           VARCHAR2(16 CHAR) default ' ' not null,
  agencyno     VARCHAR2(6 CHAR) default ' ' not null,
  lotno        VARCHAR2(6 CHAR) default ' ' not null,
  machineno    VARCHAR2(20 CHAR) default ' ' not null,
  machinestate NUMBER(5) default 0 not null,
  totalcount   NUMBER(12) default 0 not null,
  totalamt     NUMBER(12) default 0 not null,
  maxcount     NUMBER(12) default 0 not null,
  maxamt       NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTMCTRLXJFC
  is '逻辑机控制表';
comment on column jrtsch.TTMCTRLXJFC.id
  is 'Id  主键,自动标识(1,1)';
comment on column jrtsch.TTMCTRLXJFC.agencyno
  is '彩票机构编号，渠道编号，外键';
comment on column jrtsch.TTMCTRLXJFC.lotno
  is '彩种编号，外键';
comment on column jrtsch.TTMCTRLXJFC.machineno
  is '逻辑机号，20-50个逻辑机号';
comment on column jrtsch.TTMCTRLXJFC.machinestate
  is '逻辑机号状态，0：空闲  1：忙碌';
comment on column jrtsch.TTMCTRLXJFC.totalcount
  is '当前累计交易比数';
comment on column jrtsch.TTMCTRLXJFC.totalamt
  is '当前累计交易金额';
comment on column jrtsch.TTMCTRLXJFC.maxcount
  is '逻辑机交易比数限额(彩票张数)';
comment on column jrtsch.TTMCTRLXJFC.maxamt
  is '逻辑机交易金额限额';
alter table jrtsch.TTMCTRLXJFC
  add constraint PK_TTMCTRLXJFC primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTRANSACTION
-- prompt ===========================
-- prompt
create table jrtsch.TTRANSACTION
(
  id            VARCHAR2(32 CHAR) default ' ' not null,
  type          NUMBER(5) default 0 not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  acceptno      VARCHAR2(8 CHAR) default ' ' not null,
  flowno        VARCHAR2(16 CHAR) default ' ' not null,
  plattime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  amt           NUMBER(12) default 0 not null,
  fee           NUMBER(12) default 0 not null,
  bankid        VARCHAR2(8 CHAR) default ' ' not null,
  bankaccount   VARCHAR2(32 CHAR) default ' ' not null,
  bankorderid   VARCHAR2(32 CHAR) default ' ' not null,
  bankordertime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  banktrace     VARCHAR2(32 CHAR) default ' ' not null,
  bankrettime   TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  state         NUMBER(5) default 0 not null,
  retcode       VARCHAR2(8 CHAR) default ' ' not null,
  retmemo       VARCHAR2(64 CHAR) default ' ' not null,
  memo          VARCHAR2(128 CHAR) default ' ' not null,
  bankcheck     NUMBER(5) default 0 not null,
  paytype       VARCHAR2(4 CHAR) default ' ' not null,
  accesstype    CHAR(1) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTRANSACTION
  is '交易表';
comment on column jrtsch.TTRANSACTION.id
  is '交易标识';
comment on column jrtsch.TTRANSACTION.type
  is '交易类型，见ttransactiontype数据字典';
comment on column jrtsch.TTRANSACTION.userno
  is '客户编号，赠送者';
comment on column jrtsch.TTRANSACTION.acceptno
  is '客户编号，被赠送者，发送赠送行为时填';
comment on column jrtsch.TTRANSACTION.flowno
  is '流水号，投注交易的流水号';
comment on column jrtsch.TTRANSACTION.plattime
  is '交易时间';
comment on column jrtsch.TTRANSACTION.amt
  is '交易金额';
comment on column jrtsch.TTRANSACTION.fee
  is '支付时产生的费用';
comment on column jrtsch.TTRANSACTION.bankid
  is '银行标识，充值时填写银行端得返回信息，其它交易为空';
comment on column jrtsch.TTRANSACTION.bankaccount
  is '银行账号';
comment on column jrtsch.TTRANSACTION.bankorderid
  is '银行订单号，充值时填写银行端得返回信息，其它交易为空';
comment on column jrtsch.TTRANSACTION.bankordertime
  is '银行订单时间，充值时填写银行端得返回信息，其它交易为空';
comment on column jrtsch.TTRANSACTION.banktrace
  is '银行返回流水';
comment on column jrtsch.TTRANSACTION.bankrettime
  is '银行返回时间';
comment on column jrtsch.TTRANSACTION.state
  is '支付状态，0：未完成，1：成功，2：失败'';';
comment on column jrtsch.TTRANSACTION.retcode
  is '银行返回码';
comment on column jrtsch.TTRANSACTION.retmemo
  is '银行返回信息描述';
comment on column jrtsch.TTRANSACTION.memo
  is '备注';
comment on column jrtsch.TTRANSACTION.bankcheck
  is '对账标记，0：未对账，1：已对账';
comment on column jrtsch.TTRANSACTION.paytype
  is '''支付方式，如: 0201, 卡类别id+卡标识序号''';
comment on column jrtsch.TTRANSACTION.accesstype
  is '''接入方式，B表示web，W表示wap，C表示客户端''';
alter table jrtsch.TTRANSACTION
  add constraint PK_TTRANSACTION primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.USERNO_INDEX on jrtsch.TTRANSACTION (USERNO)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TTRANSACTIONTYPE
-- prompt ===============================
-- prompt
create table jrtsch.TTRANSACTIONTYPE
(
  id    NUMBER(5) default 0 not null,
  name  VARCHAR2(20 CHAR) default ' ' not null,
  state NUMBER(5) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TTRANSACTIONTYPE
  is '交易字典表';
comment on column jrtsch.TTRANSACTIONTYPE.id
  is '交易码，1投注：2充值（银行），3：充值（卡），4：结算，5：提现，6：兑奖，7：退款，8：追号套餐';
comment on column jrtsch.TTRANSACTIONTYPE.name
  is '交易名称（内容）';
comment on column jrtsch.TTRANSACTIONTYPE.state
  is '交易状态，0：开通，1：关闭';
alter table jrtsch.TTRANSACTIONTYPE
  add constraint PK_TTRANSACTIONTYPE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TUSERCARD
-- prompt ========================
-- prompt
create table jrtsch.TUSERCARD
(
  ttransactionid VARCHAR2(32 CHAR) default ' ' not null,
  agencyno       VARCHAR2(6 CHAR) default ' ' not null,
  userno         VARCHAR2(8 CHAR) default ' ' not null,
  tcardid        VARCHAR2(20 CHAR) default ' ' not null,
  cardstate      NUMBER(5) default 0 not null,
  gettime        TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TUSERCARD
  is '用户卡充值表';
comment on column jrtsch.TUSERCARD.ttransactionid
  is '交易标识';
comment on column jrtsch.TUSERCARD.agencyno
  is '渠道编号，外键';
comment on column jrtsch.TUSERCARD.userno
  is '用户编号';
comment on column jrtsch.TUSERCARD.tcardid
  is '卡号码';
comment on column jrtsch.TUSERCARD.cardstate
  is '卡状态';
comment on column jrtsch.TUSERCARD.gettime
  is '充值时间';
alter table jrtsch.TUSERCARD
  add constraint PK_TUSERCARD primary key (TTRANSACTIONID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TUSERCHANNEL
-- prompt ===========================
-- prompt
create table jrtsch.TUSERCHANNEL
(
  mobileid VARCHAR2(11 CHAR) default ' ' not null,
  state    NUMBER(5) default 0 not null,
  userfrom NUMBER(5) default 0 not null,
  userno   VARCHAR2(8 CHAR) default ' ' not null,
  agencyno VARCHAR2(6 CHAR) default ' ' not null,
  plattime TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  info     VARCHAR2(100 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TUSERCHANNEL
  is '客户来源对应表';
comment on column jrtsch.TUSERCHANNEL.mobileid
  is '客户（潜在客户）注册号，手机号、或网络生成的11位客户号，生成规则另定';
comment on column jrtsch.TUSERCHANNEL.state
  is '客户状态，0：未注册，1：已注册';
comment on column jrtsch.TUSERCHANNEL.userfrom
  is '客户来源，0：好友推荐，1：渠道 ';
comment on column jrtsch.TUSERCHANNEL.userno
  is '客户编号，推荐者的编号，无值为8个0';
comment on column jrtsch.TUSERCHANNEL.agencyno
  is '对应机构渠道来源，分销渠道来源，无值为6个0';
comment on column jrtsch.TUSERCHANNEL.plattime
  is '对应日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TUSERCHANNEL.info
  is '保留';
alter table jrtsch.TUSERCHANNEL
  add constraint PK_TUSERCHANNEL primary key (MOBILEID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TUSERINFO
-- prompt ========================
-- prompt
create table jrtsch.TUSERINFO
(
  userno     VARCHAR2(8 CHAR) default ' ' not null,
  mobileid   VARCHAR2(11 CHAR) default ' ' not null,
  state      NUMBER(5) default 0 not null,
  agencyno   VARCHAR2(6 CHAR) default ' ' not null,
  type       NUMBER(5) default 0 not null,
  password   VARCHAR2(64 CHAR) default ' ' not null,
  name       VARCHAR2(20 CHAR) default ' ' not null,
  certid     VARCHAR2(18 CHAR) default ' ' not null,
  phone      VARCHAR2(50 CHAR) default ' ' not null,
  email      VARCHAR2(50 CHAR) default ' ' not null,
  address    VARCHAR2(50 CHAR) default ' ' not null,
  qq         VARCHAR2(15 CHAR) default ' ' not null,
  msn        VARCHAR2(32 CHAR) default ' ' not null,
  regtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  modtime    TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  info       VARCHAR2(50 CHAR) default ' ' not null,
  mac        VARCHAR2(64 CHAR) default ' ' not null,
  nickname   VARCHAR2(64 CHAR) default ' ' not null,
  accesstype CHAR(1) default ' ' not null,
  channel    VARCHAR2(11 CHAR) default ' ' not null,
  leave      VARCHAR2(20 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TUSERINFO
  is '客户信息表';
comment on column jrtsch.TUSERINFO.userno
  is '客户编号，系统自动生成，从00000001开始';
comment on column jrtsch.TUSERINFO.mobileid
  is '客户注册号手机号，或网络生成的11位客户号，生成规则另定';
comment on column jrtsch.TUSERINFO.state
  is '客户状态，设定不同的状态以控制客户交易';
comment on column jrtsch.TUSERINFO.agencyno
  is '机构渠道来源  分销渠道来源，缺省为金软通';
comment on column jrtsch.TUSERINFO.type
  is '客户种类，区别不同来源的客户（网络、手机、其他） ';
comment on column jrtsch.TUSERINFO.password
  is '客户密码校摘要，采用MD5加密的密码摘要';
comment on column jrtsch.TUSERINFO.name
  is '姓名';
comment on column jrtsch.TUSERINFO.certid
  is '身份证号（证件号）';
comment on column jrtsch.TUSERINFO.phone
  is '联系电话，多个电话可以连在一起';
comment on column jrtsch.TUSERINFO.email
  is '邮件地址';
comment on column jrtsch.TUSERINFO.address
  is '住址';
comment on column jrtsch.TUSERINFO.qq
  is '客户QQ号';
comment on column jrtsch.TUSERINFO.msn
  is '客户MSN帐号';
comment on column jrtsch.TUSERINFO.regtime
  is '客户开户日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TUSERINFO.modtime
  is '上次访问日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TUSERINFO.info
  is '保留';
comment on column jrtsch.TUSERINFO.mac
  is '敏感数据控制块  采用HASH/MD5算法加密敏感数据：USER_NO+USER_STATUS+USER_TYPE+OPEN_DATE+LAST_DATE，作为认证用';
comment on column jrtsch.TUSERINFO.nickname
  is '昵称';
comment on column jrtsch.TUSERINFO.channel
  is '渠道号';
alter table jrtsch.TUSERINFO
  add constraint PK_TUSERINFO primary key (USERNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
alter table jrtsch.TUSERINFO
  add constraint UN_TUSERINFO unique (MOBILEID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWIN
-- prompt ===================
-- prompt
create table jrtsch.TWIN
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  amount        NUMBER(12) default 0 not null,
  code          VARCHAR2(120 CHAR) default ' ' not null,
  cashterm      VARCHAR2(7 CHAR) default ' ' not null,
  cashtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  class         NUMBER(5) default 0 not null,
  type          NUMBER(5) default 0 not null,
  settleflage   NUMBER(5) default 0 not null,
  ticketcode    VARCHAR2(20 CHAR) default ' ' not null,
  playname      VARCHAR2(10 CHAR) default ' ' not null,
  logiccode     VARCHAR2(20 CHAR) default ' ' not null,
  citycode      VARCHAR2(4 CHAR) default ' ' not null,
  validtermcode VARCHAR2(7 CHAR) default ' ' not null,
  sellruncode   VARCHAR2(8 CHAR) default ' ' not null,
  selltime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  certid        VARCHAR2(18 CHAR) default ' ' not null,
  phone         VARCHAR2(50 CHAR) default ' ' not null,
  winamount     NUMBER(12) default 0 not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWIN
  is '中奖投注记录表';
comment on column jrtsch.TWIN.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TWIN.userno
  is '客户编号';
comment on column jrtsch.TWIN.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWIN.lotno
  is '彩种编号';
comment on column jrtsch.TWIN.amount
  is '奖金金额';
comment on column jrtsch.TWIN.code
  is '中奖注码';
comment on column jrtsch.TWIN.cashterm
  is '兑奖期号';
comment on column jrtsch.TWIN.cashtime
  is '兑奖日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TWIN.class
  is '中奖级别，0表示特等奖，其它按数字';
comment on column jrtsch.TWIN.type
  is '中奖类别，0表示小奖，1表示大奖';
comment on column jrtsch.TWIN.settleflage
  is '兑奖标记，0：未处理，1：已处理';
comment on column jrtsch.TWIN.ticketcode
  is '票面票号密码';
comment on column jrtsch.TWIN.playname
  is '玩法英文名字';
comment on column jrtsch.TWIN.logiccode
  is '逻辑机号';
comment on column jrtsch.TWIN.citycode
  is '城市代号';
comment on column jrtsch.TWIN.validtermcode
  is '有效期号';
comment on column jrtsch.TWIN.sellruncode
  is '销售流水号';
comment on column jrtsch.TWIN.selltime
  is '销售时间';
comment on column jrtsch.TWIN.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TWIN.certid
  is '身份证号（证件号）';
comment on column jrtsch.TWIN.phone
  is '联系电话，多个电话可以连在一起，逗号分隔';
comment on column jrtsch.TWIN.winamount
  is '中奖金额';
comment on column jrtsch.TWIN.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
comment on column jrtsch.TWIN.caseid
  is '方案编号';
alter table jrtsch.TWIN
  add constraint PK_TWIN primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWINCHECKXJFC
-- prompt ============================
-- prompt
create table jrtsch.TWINCHECKXJFC
(
  ucgameid     VARCHAR2(6 CHAR) default ' ' not null,
  ulid         VARCHAR2(16 CHAR) default ' ' not null,
  ulrealdraw   VARCHAR2(16 CHAR) default ' ' not null,
  ultwinticket NUMBER(9) default 0 not null,
  ultwinmoney  NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWINCHECKXJFC
  is '中奖数据校验表';
comment on column jrtsch.TWINCHECKXJFC.ucgameid
  is '游戏代码';
comment on column jrtsch.TWINCHECKXJFC.ulid
  is '站号';
comment on column jrtsch.TWINCHECKXJFC.ulrealdraw
  is '期号';
comment on column jrtsch.TWINCHECKXJFC.ultwinticket
  is '总计中奖票数';
comment on column jrtsch.TWINCHECKXJFC.ultwinmoney
  is '总计奖金';

-- prompt
-- prompt Creating table TWININFO
-- prompt =======================
-- prompt
create table jrtsch.TWININFO
(
  id             VARCHAR2(16 CHAR) default ' ' not null,
  lotno          VARCHAR2(6 CHAR) default ' ' not null,
  termcode       VARCHAR2(7 CHAR) default ' ' not null,
  agencyno       VARCHAR2(6 CHAR) default ' ' not null,
  playname       VARCHAR2(10 CHAR) default ' ' not null,
  winbasecode    VARCHAR2(50 CHAR) default ' ' not null,
  winspecialcode VARCHAR2(10 CHAR) default ' ' not null,
  actsellamt     NUMBER(12) default 0 not null,
  validsellamt   NUMBER(12) default 0 not null,
  wingrade       NUMBER(5) default 0 not null,
  winmoney       NUMBER(12) default 0 not null,
  winnumber      NUMBER(12) default 0 not null,
  forwardamt     NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWININFO
  is '开奖信息表';
comment on column jrtsch.TWININFO.id
  is '流水号';
comment on column jrtsch.TWININFO.lotno
  is '彩种编号';
comment on column jrtsch.TWININFO.termcode
  is '期号';
comment on column jrtsch.TWININFO.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWININFO.playname
  is '玩法英文名字';
comment on column jrtsch.TWININFO.winbasecode
  is '中奖号码';
comment on column jrtsch.TWININFO.winspecialcode
  is '特别号码';
comment on column jrtsch.TWININFO.actsellamt
  is '本期实际销售额';
comment on column jrtsch.TWININFO.validsellamt
  is '本期有效销售额';
comment on column jrtsch.TWININFO.wingrade
  is '奖项等级(如一等奖)';
comment on column jrtsch.TWININFO.winmoney
  is '奖金金额(如一等奖奖金)';
comment on column jrtsch.TWININFO.winnumber
  is '奖项注数(如一等奖注数)';
comment on column jrtsch.TWININFO.forwardamt
  is '滚入下期';
alter table jrtsch.TWININFO
  add constraint PK_TWININFO primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.INDEX_1 on jrtsch.TWININFO (LOTNO, TERMCODE, AGENCYNO)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWININFOSXFC
-- prompt ===========================
-- prompt
create table jrtsch.TWININFOSXFC
(
  id             VARCHAR2(16 CHAR) default ' ' not null,
  lotno          VARCHAR2(6 CHAR) default ' ' not null,
  termcode       VARCHAR2(7 CHAR) default ' ' not null,
  agencyno       VARCHAR2(6 CHAR) default ' ' not null,
  playname       VARCHAR2(10 CHAR) default ' ' not null,
  winbasecode    VARCHAR2(50 CHAR) default ' ' not null,
  winspecialcode VARCHAR2(10 CHAR) default ' ' not null,
  actsellamt     NUMBER(12) default 0 not null,
  validsellamt   NUMBER(12) default 0 not null,
  wingrade       NUMBER(5) default 0 not null,
  winmoney       NUMBER(12) default 0 not null,
  winnumber      NUMBER(12) default 0 not null,
  forwardamt     NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWININFOSXFC
  is '开奖信息表';
comment on column jrtsch.TWININFOSXFC.id
  is '流水号';
comment on column jrtsch.TWININFOSXFC.lotno
  is '彩种编号';
comment on column jrtsch.TWININFOSXFC.termcode
  is '期号';
comment on column jrtsch.TWININFOSXFC.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWININFOSXFC.playname
  is '玩法英文名字';
comment on column jrtsch.TWININFOSXFC.winbasecode
  is '中奖号码';
comment on column jrtsch.TWININFOSXFC.winspecialcode
  is '特别号码';
comment on column jrtsch.TWININFOSXFC.actsellamt
  is '本期实际销售额';
comment on column jrtsch.TWININFOSXFC.validsellamt
  is '本期有效销售额';
comment on column jrtsch.TWININFOSXFC.wingrade
  is '奖项等级(如一等奖)';
comment on column jrtsch.TWININFOSXFC.winmoney
  is '奖金金额(如一等奖奖金)';
comment on column jrtsch.TWININFOSXFC.winnumber
  is '奖项注数(如一等奖注数)';
comment on column jrtsch.TWININFOSXFC.forwardamt
  is '滚入下期';
alter table jrtsch.TWININFOSXFC
  add constraint PK_TWININFOSXFC primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWININFOXJFC
-- prompt ===========================
-- prompt
create table jrtsch.TWININFOXJFC
(
  id             VARCHAR2(16 CHAR) default ' ' not null,
  lotno          VARCHAR2(6 CHAR) default ' ' not null,
  termcode       VARCHAR2(15 CHAR) default ' ' not null,
  agencyno       VARCHAR2(6 CHAR) default ' ' not null,
  playname       VARCHAR2(10 CHAR) default ' ' not null,
  winbasecode    VARCHAR2(50 CHAR) default ' ' not null,
  winspecialcode VARCHAR2(10 CHAR) default ' ' not null,
  actsellamt     NUMBER(12) default 0 not null,
  validsellamt   NUMBER(12) default 0 not null,
  wingrade       NUMBER(5) default 0 not null,
  winmoney       NUMBER(12) default 0 not null,
  winnumber      NUMBER(12) default 0 not null,
  forwardamt     NUMBER(12) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWININFOXJFC
  is '开奖信息表';
comment on column jrtsch.TWININFOXJFC.id
  is '流水号';
comment on column jrtsch.TWININFOXJFC.lotno
  is '彩种编号';
comment on column jrtsch.TWININFOXJFC.termcode
  is '期号';
comment on column jrtsch.TWININFOXJFC.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWININFOXJFC.playname
  is '玩法英文名字';
comment on column jrtsch.TWININFOXJFC.winbasecode
  is '中奖号码';
comment on column jrtsch.TWININFOXJFC.winspecialcode
  is '特别号码';
comment on column jrtsch.TWININFOXJFC.actsellamt
  is '本期实际销售额';
comment on column jrtsch.TWININFOXJFC.validsellamt
  is '本期有效销售额';
comment on column jrtsch.TWININFOXJFC.wingrade
  is '奖项等级(如一等奖)';
comment on column jrtsch.TWININFOXJFC.winmoney
  is '奖金金额(如一等奖奖金)';
comment on column jrtsch.TWININFOXJFC.winnumber
  is '奖项注数(如一等奖注数)';
comment on column jrtsch.TWININFOXJFC.forwardamt
  is '滚入下期';
alter table jrtsch.TWININFOXJFC
  add constraint PK_TWININFOXJFC primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
create index jrtsch.INDEX_8 on jrtsch.TWININFOXJFC (LOTNO, TERMCODE, AGENCYNO)
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWINLEVELREPORTXJFC
-- prompt ==================================
-- prompt
create table jrtsch.TWINLEVELREPORTXJFC
(
  ucgameid    VARCHAR2(6 CHAR) default ' ' not null,
  ulrealdraw  VARCHAR2(16 CHAR) default ' ' not null,
  ucwinlevels NUMBER(5) default 0 not null,
  ulwinbets   VARCHAR2(50 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWINLEVELREPORTXJFC
  is '新疆时时彩中奖统计报表';
comment on column jrtsch.TWINLEVELREPORTXJFC.ucgameid
  is '游戏代码';
comment on column jrtsch.TWINLEVELREPORTXJFC.ulrealdraw
  is '期号';
comment on column jrtsch.TWINLEVELREPORTXJFC.ucwinlevels
  is '每次开奖奖等数';
comment on column jrtsch.TWINLEVELREPORTXJFC.ulwinbets
  is '各奖等统计';

-- prompt
-- prompt Creating table TWINSXFC
-- prompt =======================
-- prompt
create table jrtsch.TWINSXFC
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  amount        NUMBER(12) default 0 not null,
  code          VARCHAR2(120 CHAR) default ' ' not null,
  cashterm      VARCHAR2(7 CHAR) default ' ' not null,
  cashtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  class         NUMBER(5) default 0 not null,
  type          NUMBER(5) default 0 not null,
  settleflage   NUMBER(5) default 0 not null,
  ticketcode    VARCHAR2(20 CHAR) default ' ' not null,
  playname      VARCHAR2(10 CHAR) default ' ' not null,
  logiccode     VARCHAR2(20 CHAR) default ' ' not null,
  citycode      VARCHAR2(4 CHAR) default ' ' not null,
  validtermcode VARCHAR2(7 CHAR) default ' ' not null,
  sellruncode   VARCHAR2(8 CHAR) default ' ' not null,
  selltime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  certid        VARCHAR2(18 CHAR) default ' ' not null,
  phone         VARCHAR2(50 CHAR) default ' ' not null,
  winamount     NUMBER(12) default 0 not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWINSXFC
  is '中奖投注记录表';
comment on column jrtsch.TWINSXFC.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TWINSXFC.userno
  is '客户编号';
comment on column jrtsch.TWINSXFC.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWINSXFC.lotno
  is '彩种编号';
comment on column jrtsch.TWINSXFC.amount
  is '奖金金额';
comment on column jrtsch.TWINSXFC.code
  is '中奖注码';
comment on column jrtsch.TWINSXFC.cashterm
  is '兑奖期号';
comment on column jrtsch.TWINSXFC.cashtime
  is '兑奖日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TWINSXFC.class
  is '中奖级别，0表示特等奖，其它按数字';
comment on column jrtsch.TWINSXFC.type
  is '中奖类别，0表示小奖，1表示大奖';
comment on column jrtsch.TWINSXFC.settleflage
  is '兑奖标记，0：未处理，1：已处理';
comment on column jrtsch.TWINSXFC.ticketcode
  is '票面票号密码';
comment on column jrtsch.TWINSXFC.playname
  is '玩法英文名字';
comment on column jrtsch.TWINSXFC.logiccode
  is '逻辑机号';
comment on column jrtsch.TWINSXFC.citycode
  is '城市代号';
comment on column jrtsch.TWINSXFC.validtermcode
  is '有效期号';
comment on column jrtsch.TWINSXFC.sellruncode
  is '销售流水号';
comment on column jrtsch.TWINSXFC.selltime
  is '销售时间';
comment on column jrtsch.TWINSXFC.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TWINSXFC.certid
  is '身份证号（证件号）';
comment on column jrtsch.TWINSXFC.phone
  is '联系电话，多个电话可以连在一起，逗号分隔';
comment on column jrtsch.TWINSXFC.winamount
  is '中奖金额';
comment on column jrtsch.TWINSXFC.caseid
  is '方案编号';
comment on column jrtsch.TWINSXFC.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TWINSXFC
  add constraint PK_TWINSXFC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWINTC
-- prompt =====================
-- prompt
create table jrtsch.TWINTC
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  amount        NUMBER(12) default 0 not null,
  code          VARCHAR2(120 CHAR) default ' ' not null,
  cashterm      VARCHAR2(7 CHAR) default ' ' not null,
  cashtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  class         NUMBER(5) default 0 not null,
  type          NUMBER(5) default 0 not null,
  settleflage   NUMBER(5) default 0 not null,
  ticketcode    VARCHAR2(20 CHAR) default ' ' not null,
  playname      VARCHAR2(10 CHAR) default ' ' not null,
  logiccode     VARCHAR2(20 CHAR) default ' ' not null,
  citycode      VARCHAR2(4 CHAR) default ' ' not null,
  validtermcode VARCHAR2(7 CHAR) default ' ' not null,
  sellruncode   VARCHAR2(8 CHAR) default ' ' not null,
  selltime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  certid        VARCHAR2(18 CHAR) default ' ' not null,
  phone         VARCHAR2(50 CHAR) default ' ' not null,
  winamount     NUMBER(12) default 0 not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWINTC
  is '中奖投注记录表';
comment on column jrtsch.TWINTC.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记';
comment on column jrtsch.TWINTC.userno
  is '客户编号';
comment on column jrtsch.TWINTC.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWINTC.lotno
  is '彩种编号';
comment on column jrtsch.TWINTC.amount
  is '奖金金额';
comment on column jrtsch.TWINTC.code
  is '中奖注码';
comment on column jrtsch.TWINTC.cashterm
  is '兑奖期号';
comment on column jrtsch.TWINTC.cashtime
  is '兑奖日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TWINTC.class
  is '中奖级别，0表示特等奖，其它按数字';
comment on column jrtsch.TWINTC.type
  is '中奖类别，0表示小奖，1表示大奖';
comment on column jrtsch.TWINTC.settleflage
  is '兑奖标记，0：未处理，1：已处理';
comment on column jrtsch.TWINTC.ticketcode
  is '票面票号密码';
comment on column jrtsch.TWINTC.playname
  is '玩法英文名字';
comment on column jrtsch.TWINTC.logiccode
  is '逻辑机号';
comment on column jrtsch.TWINTC.citycode
  is '城市代号';
comment on column jrtsch.TWINTC.validtermcode
  is '有效期号';
comment on column jrtsch.TWINTC.sellruncode
  is '销售流水号';
comment on column jrtsch.TWINTC.selltime
  is '销售时间';
comment on column jrtsch.TWINTC.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#二等奖注数|单注奖金金额……';
comment on column jrtsch.TWINTC.certid
  is '身份证号（证件号）';
comment on column jrtsch.TWINTC.phone
  is '联系电话，多个电话可以连在一起，逗号分隔';
comment on column jrtsch.TWINTC.winamount
  is '中奖金额';
comment on column jrtsch.TWINTC.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
comment on column jrtsch.TWINTC.caseid
  is '方案编号';
alter table jrtsch.TWINTC
  add constraint PK_TWINTC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWINXJFC
-- prompt =======================
-- prompt
create table jrtsch.TWINXJFC
(
  flowno        VARCHAR2(16 CHAR) not null,
  userno        VARCHAR2(8 CHAR) default ' ' not null,
  agencyno      VARCHAR2(6 CHAR) default ' ' not null,
  lotno         VARCHAR2(6 CHAR) default ' ' not null,
  amount        NUMBER(12) default 0 not null,
  code          VARCHAR2(120 CHAR) default ' ' not null,
  cashterm      VARCHAR2(15 CHAR) default ' ' not null,
  cashtime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  class         NUMBER(5) default 0 not null,
  type          NUMBER(5) default 0 not null,
  settleflage   NUMBER(5) default 0 not null,
  ticketcode    VARCHAR2(20 CHAR) default ' ' not null,
  playname      VARCHAR2(10 CHAR) default ' ' not null,
  logiccode     VARCHAR2(20 CHAR) default ' ' not null,
  citycode      VARCHAR2(4 CHAR) default ' ' not null,
  validtermcode VARCHAR2(15 CHAR) default ' ' not null,
  sellruncode   VARCHAR2(8 CHAR) default ' ' not null,
  selltime      TIMESTAMP(6) default to_timestamp('1000-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS') not null,
  prizeinfo     VARCHAR2(120 CHAR) default ' ' not null,
  certid        VARCHAR2(18 CHAR) default ' ' not null,
  phone         VARCHAR2(50 CHAR) default ' ' not null,
  winamount     NUMBER(12) default 0 not null,
  caseid        VARCHAR2(16 CHAR) default ' ' not null,
  mac           VARCHAR2(64 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.TWINXJFC
  is '中奖投注记录表';
comment on column jrtsch.TWINXJFC.flowno
  is '流水号，本系统自动产生的彩票流水号，用来记录一张彩票的唯一标记

';
comment on column jrtsch.TWINXJFC.userno
  is '客户编号';
comment on column jrtsch.TWINXJFC.agencyno
  is '渠道编号，发行机构编号';
comment on column jrtsch.TWINXJFC.lotno
  is '彩种编号';
comment on column jrtsch.TWINXJFC.amount
  is '奖金金额';
comment on column jrtsch.TWINXJFC.code
  is '中奖注码';
comment on column jrtsch.TWINXJFC.cashterm
  is '兑奖期号';
comment on column jrtsch.TWINXJFC.cashtime
  is '兑奖日期，YYYYMMDDHHMMSS';
comment on column jrtsch.TWINXJFC.class
  is '中奖级别，0表示特等奖，其它按数字';
comment on column jrtsch.TWINXJFC.type
  is '中奖类别，0表示小奖，1表示大奖';
comment on column jrtsch.TWINXJFC.settleflage
  is '兑奖标记，0：未处理，1：已处理';
comment on column jrtsch.TWINXJFC.ticketcode
  is '票面票号密码';
comment on column jrtsch.TWINXJFC.playname
  is '玩法英文名字';
comment on column jrtsch.TWINXJFC.logiccode
  is '逻辑机号';
comment on column jrtsch.TWINXJFC.citycode
  is '城市代号';
comment on column jrtsch.TWINXJFC.validtermcode
  is '有效期号';
comment on column jrtsch.TWINXJFC.sellruncode
  is '销售流水号';
comment on column jrtsch.TWINXJFC.selltime
  is '销售时间';
comment on column jrtsch.TWINXJFC.prizeinfo
  is '中奖详细信息，特等奖注数|单注奖金金额#一等奖注数|单注奖金金额#

二等奖注数|单注奖金金额……';
comment on column jrtsch.TWINXJFC.certid
  is '身份证号（证件号）';
comment on column jrtsch.TWINXJFC.phone
  is '联系电话，多个电话可以连在一起，逗号分隔';
comment on column jrtsch.TWINXJFC.winamount
  is '中奖金额';
comment on column jrtsch.TWINXJFC.caseid
  is '方案编号';
comment on column jrtsch.TWINXJFC.mac
  is '敏感数据控制块，采用HASH/MD5算法加密全表字段，作为认证用';
alter table jrtsch.TWINXJFC
  add constraint PK_TWINXJFC primary key (FLOWNO)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table TWITHDRAWREVIEW
-- prompt ==============================
-- prompt
create table jrtsch.TWITHDRAWREVIEW
(
  id            NUMBER,
  accountname   VARCHAR2(20),
  transactionid VARCHAR2(32 CHAR),
  accountnumber VARCHAR2(32 CHAR),
  bankprovince  VARCHAR2(64 CHAR),
  bankcity      VARCHAR2(64 CHAR),
  bankname      VARCHAR2(100 CHAR),
  amt           NUMBER,
  state         VARCHAR2(20),
  datetime      TIMESTAMP(6),
  subbankname   VARCHAR2(100 CHAR)
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.TWITHDRAWREVIEW.id
  is 'ID';
comment on column jrtsch.TWITHDRAWREVIEW.accountname
  is '账户名称';
comment on column jrtsch.TWITHDRAWREVIEW.transactionid
  is '交易ID';
comment on column jrtsch.TWITHDRAWREVIEW.accountnumber
  is '账号';
comment on column jrtsch.TWITHDRAWREVIEW.bankprovince
  is '开户银行省份';
comment on column jrtsch.TWITHDRAWREVIEW.bankcity
  is '开户银行地市';
comment on column jrtsch.TWITHDRAWREVIEW.bankname
  is '开户银行名称';
comment on column jrtsch.TWITHDRAWREVIEW.amt
  is '金额(以分为单位)';
comment on column jrtsch.TWITHDRAWREVIEW.state
  is '状态（1：待解决，102：审核中，103：已审核，104：驳回，105：执行中，106：提现取消）';
comment on column jrtsch.TWITHDRAWREVIEW.datetime
  is '日期';
comment on column jrtsch.TWITHDRAWREVIEW.subbankname
  is '收款支行名称';

-- prompt
-- prompt Creating table WORLDCUP_QUIZ
-- prompt ============================
-- prompt
create table jrtsch.WORLDCUP_QUIZ
(
  id        VARCHAR2(8) not null,
  title     VARCHAR2(500 CHAR) default ' ' not null,
  selection VARCHAR2(500 CHAR) default ' ' not null,
  answer    VARCHAR2(500 CHAR) default ' ' not null,
  deadline  TIMESTAMP(6) default SYSDATE not null,
  round     NUMBER(3) default 0 not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.WORLDCUP_QUIZ.id
  is '题目ID';
comment on column jrtsch.WORLDCUP_QUIZ.title
  is '题干';
comment on column jrtsch.WORLDCUP_QUIZ.selection
  is '选项';
comment on column jrtsch.WORLDCUP_QUIZ.answer
  is '答案';
comment on column jrtsch.WORLDCUP_QUIZ.deadline
  is '截止时间';
comment on column jrtsch.WORLDCUP_QUIZ.round
  is '轮次';
alter table jrtsch.WORLDCUP_QUIZ
  add constraint PK_WORLDCUP_QUIZ primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table WORLDCUP_ROUND
-- prompt =============================
-- prompt
create table jrtsch.WORLDCUP_ROUND
(
  id       VARCHAR2(5) not null,
  round    NUMBER(3) default 0 not null,
  title    VARCHAR2(25 CHAR) default ' ' not null,
  deadline TIMESTAMP(6) default SYSDATE not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.WORLDCUP_ROUND
  is '轮次表';
comment on column jrtsch.WORLDCUP_ROUND.id
  is '轮次ID';
comment on column jrtsch.WORLDCUP_ROUND.round
  is '轮次号';
comment on column jrtsch.WORLDCUP_ROUND.title
  is '轮次名称';
comment on column jrtsch.WORLDCUP_ROUND.deadline
  is '截止时间';
alter table jrtsch.WORLDCUP_ROUND
  add constraint PK_WORLDCUP_ROUND primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating table WORLDCUP_SCORE
-- prompt =============================
-- prompt
create table jrtsch.WORLDCUP_SCORE
(
  id       VARCHAR2(12) not null,
  round    NUMBER(3) default 0,
  score    NUMBER(3) default 0 not null,
  mobileid VARCHAR2(11 CHAR) default ' ' not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on column jrtsch.WORLDCUP_SCORE.id
  is '用户分数ID';
comment on column jrtsch.WORLDCUP_SCORE.round
  is '轮次';
comment on column jrtsch.WORLDCUP_SCORE.score
  is '每轮得分';
comment on column jrtsch.WORLDCUP_SCORE.mobileid
  is '用户手机号';
alter table jrtsch.WORLDCUP_SCORE
  add constraint PK_WORLDCUP_SCORE primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
alter table jrtsch.WORLDCUP_SCORE
  add constraint ROUND
  check ("ROUND" IS NOT NULL);

-- prompt
-- prompt Creating table WORLDCUP_SCOREDETAIL
-- prompt ===================================
-- prompt
create table jrtsch.WORLDCUP_SCOREDETAIL
(
  id         VARCHAR2(8) not null,
  mobileid   VARCHAR2(11) default ' ' not null,
  round      NUMBER(3) default 0 not null,
  quizid     VARCHAR2(11) default ' ' not null,
  answer     VARCHAR2(500 CHAR) default ' ' not null,
  submittime TIMESTAMP(6) default SYSDATE not null
)
-- tablespace TS_D01
  -- pctfree 10
  -- initrans 1
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;
comment on table jrtsch.WORLDCUP_SCOREDETAIL
  is '答题明细表';
comment on column jrtsch.WORLDCUP_SCOREDETAIL.id
  is '答题ID';
comment on column jrtsch.WORLDCUP_SCOREDETAIL.mobileid
  is '用户手机号';
comment on column jrtsch.WORLDCUP_SCOREDETAIL.round
  is '轮次';
comment on column jrtsch.WORLDCUP_SCOREDETAIL.quizid
  is '答题ID';
comment on column jrtsch.WORLDCUP_SCOREDETAIL.answer
  is '用户答案';
comment on column jrtsch.WORLDCUP_SCOREDETAIL.submittime
  is '提交时间';
alter table jrtsch.WORLDCUP_SCOREDETAIL
  add constraint PK_WORLDCUP_SCOREDETAIL primary key (ID)
  -- using index 
  -- tablespace TS_D01
  -- pctfree 10
  -- initrans 2
  -- maxtrans 255
-- storage
-- (
-- initial 64K
-- minextents 1
-- maxextents unlimited
;

-- prompt
-- prompt Creating sequence ADVISORYKEYWORD_SEQ
-- prompt =====================================
-- prompt
create sequence jrtsch.ADVISORYKEYWORD_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 301
increment by 1
cache 20;

-- prompt
-- prompt Creating sequence TEST
-- prompt ======================
-- prompt
create sequence jrtsch.TEST
minvalue 1
maxvalue 9999999
start with 2001
increment by 1
cache 1000
order;

-- prompt
-- prompt Creating sequence TKEYWORD_SEQ
-- prompt ==============================
-- prompt
create sequence jrtsch.TKEYWORD_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 1301
increment by 1
cache 20;

-- prompt
-- prompt Creating sequence TPICTURERING_SEQ
-- prompt ==================================
-- prompt
create sequence jrtsch.TPICTURERING_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 961
increment by 1
cache 20;

-- prompt
-- prompt Creating sequence TWITHDRAWTEVIEW_SEQ
-- prompt =====================================
-- prompt
create sequence jrtsch.TWITHDRAWTEVIEW_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 301
increment by 1
cache 20;

-- prompt
-- prompt Creating view V_CARDMAP
-- prompt =======================
-- prompt
create or replace view jrtsch.v_cardmap as
select t."CARDTYPEID",t."PLATFORMID",t."ACCESSTYPE",t."IMPLCLASSNAME",t."FEERATE",t."TARGETCARDID",t."CARDDESC",t."CARDNAME",t."STATE" from(
select t.cardtypeid, t.accesstype ,max( f.priorityno ) priorityno
 from tplatcardmap t left join tplatform f on t.platformid=f.platformid where cardtypeid<>'01'
group by t.cardtypeid,t.accesstype
) a ,tplatform f,tplatcardmap t
where a.cardtypeid=t.cardtypeid and t.accesstype=a.accesstype
and t.platformid=f.platformid and a.priorityno=f.priorityno
union
select  t."CARDTYPEID",t."PLATFORMID",t."ACCESSTYPE",t."IMPLCLASSNAME",t."FEERATE",t."TARGETCARDID",t."CARDDESC",t."CARDNAME",t."STATE"
from tplatcardmap t where t.cardtypeid='01';

-- prompt
-- prompt Creating view V_FIRST_IN_MONY_MOBILE
-- prompt ====================================
-- prompt
create or replace view jrtsch.v_first_in_mony_mobile as
select mobileId from Tuserinfo a,(
select  userno from(
select distinct userno from ttransaction where plattime>=sysdate-1 and type in(2,3,10) and state=1
) where userno not in (
  select distinct userno from ttransaction where plattime<sysdate-1 and type in(2,3,10) and state=1
)
 ) b where a.userno=b.userno;

-- prompt
-- prompt Creating view V_ISSUEWININFO
-- prompt ============================
-- prompt
create or replace view jrtsch.v_issuewininfo as
select distinct a.termcode,a.lotno,t.cname,w.winbasecode,w.winspecialcode  from(
select max(termcode) termcode,lotno from twininfo group by lotno
) a left join tlottype t on a.lotno= t.id
, twininfo w where w.lotno=a.lotno and a.termcode=w.termcode;

-- prompt
-- prompt Creating view V_LOT_WIN
-- prompt =======================
-- prompt
create or replace view jrtsch.v_lot_win as
select distinct m.realflowno, m.agencyflowno,0  PRIZEAMT, 0 bonuscls,mp.sublotno,t.batchcode,mp.agencyno from tlotmap m , tlot t,tlotno_map mp
where m.realflowno=t.flowno and m.betflag=1 and t.settleflag=9 and mp.lotno=t.lotno
union
select distinct m.realflowno, m.agencyflowno,t.PRIZEAMT, 1 bonuscls,mp.sublotno,t.batchcode,mp.agencyno from tlotmap m , tlot t,tlotno_map mp
where m.realflowno=t.flowno and m.betflag=1 and t.prizeamt>0 and mp.lotno=t.lotno;

-- prompt
-- prompt Creating view V_LOT_WIN12580
-- prompt ============================
-- prompt
create or replace view jrtsch.v_lot_win12580 as
select distinct m.realflowno, m.agencyflowno,0  PRIZEAMT, 0 bonuscls,mp.sublotno,t.batchcode,mp.agencyno,w.class as prizelevel  from tlotmap m , tlot t,tlotno_map mp,twin w
where m.realflowno=t.flowno and m.betflag=1 and t.settleflag=9 and mp.lotno=t.lotno and w.flowno=t.flowno
union
select distinct m.realflowno, m.agencyflowno,t.PRIZEAMT, 1 bonuscls,mp.sublotno,t.batchcode,mp.agencyno,w.class as prizelevel from tlotmap m , tlot t,tlotno_map mp,twin w
where m.realflowno=t.flowno and m.betflag=1 and t.prizeamt>0 and mp.lotno=t.lotno and t.flowno=w.flowno;

-- prompt
-- prompt Creating view V_LOT_WININFO
-- prompt ===========================
-- prompt
create or replace view jrtsch.v_lot_wininfo as
select  * from(
select
w.lotno ,w.winbasecode,w.winspecialcode,w.termcode,m.sublotno,m.agencyno,m.convertmethod  from
(
select lotno, winbasecode,winspecialcode,termcode from twininfoxjfc   union
select lotno,winbasecode,winspecialcode,termcode from twininfosxfc union
select lotno,winbasecode,winspecialcode,termcode from twininfo) w
 inner join tlotno_map m on  w.lotno=m.lotno


) tw
 left  join

(
select lotno as tlotno,batchcode,starttime,endtime,state from tlotctrl
union select lotno as tlotno,batchcode,starttime,endtime,state from tlotctrlsxfc
union select lotno as tlotno,batchcode,starttime,endtime,state from tlotctrlxjfc
)  tc on tc.tlotno=tw.lotno and tw.termcode=tc.batchcode;

-- prompt
-- prompt Creating view V_NEW_ISSUE
-- prompt =========================
-- prompt
create or replace view jrtsch.v_new_issue as
select "LOTNO","BATCHCODE","AGENCYNO","STARTTIME","ENDTIME","STATE" from tlotctrl where state=0 union
select "LOTNO","BATCHCODE","AGENCYNO","STARTTIME","ENDTIME","STATE" from tlotctrlsxfc where state=0
union
select x.lotno,x.batchcode,x.agencyno,x.starttime,x.endtime,x.state from tlotctrlxjfc x where x.state=0;

-- prompt
-- prompt Creating view V_NEW_WININFO
-- prompt ===========================
-- prompt
create or replace view jrtsch.v_new_wininfo as
select distinct a.lotno,a.termcode,b.winbasecode,c.starttime,c.endtime from
( select lotno , max( termcode) termcode from twininfo t group by lotno ) a
 left join twininfo b on a.lotno=b.lotno and a.termcode=b.termcode
 left join tlotctrl c on c.lotno=a.lotno and c.batchcode=a.termcode;

-- prompt
-- prompt Creating view V_NOTICE_FAILURE
-- prompt ==============================
-- prompt
create or replace view jrtsch.v_notice_failure as
select m.*,s.agencyname
  from   tlotmap m
  left join  tlot t on m.realflowno = t.flowno
                         and t.state = 1
   left join tsubchannel s on s.agencyno=m.agencyno
 where m.betflag = 0
union
select m.*,s.agencyname
  from  tlotmap m
  left join  twin t on m.realflowno = t.flowno
   left join tsubchannel s on s.agencyno=m.agencyno
 where m.winflag = 0;

-- prompt
-- prompt Creating view V_NOTICE_ISSUE
-- prompt ============================
-- prompt
create or replace view jrtsch.v_notice_issue as
select lotno,batchcode,winbasecode,WINSPECIALCODE,starttime,endtime,sublotno,agencyno,privatekey,pubvatekey,notifyurl,protocol ,convertmethod,6 state from(
   select a.lotno,a.termcode batchcode,a.winbasecode,a.WINSPECIALCODE,a.starttime,a.endtime, m.sublotno,m.agencyno,s.privatekey,s.pubvatekey,s.notifyurl,s.protocol
          ,m.convertmethod,a.lotno || ';' || a.termcode || ';' || m.agencyno flag  from (
    select distinct a.lotno,a.termcode,b.winbasecode,b.WINSPECIALCODE,c.starttime,c.endtime from
          ( select lotno , max( termcode) termcode from twininfo t group by lotno) a
           left join twininfo b on a.lotno=b.lotno and a.termcode=b.termcode
           left join tlotctrl c on c.lotno=a.lotno and c.batchcode=a.termcode
  ) a  
  ,tsubchannel s,tlotno_map m where s.agencyno=m.agencyno and a.lotno=m.lotno
    ) where flag not in(select lotno || ';' || batchcode || ';' || agencyno from tlotctrlnotice where noticetype=6 and (stateflag=1 or FAILTIMES>10))
union
  select lotno,batchcode ,'' winbasecode,'' WINSPECIALCODE,starttime,endtime, sublotno,a.agencyno,privatekey,s.pubvatekey,s.notifyurl,s.protocol,convertmethod,1 state from(
       select t.lotno,t.batchcode,t.starttime,t.endtime,m.sublotno,m.agencyno,m.convertmethod,m.agencyno || ';' || t.batchcode  ||  ';'  || t.lotno flag
       from(
         select t.lotno,t.batchcode,t.starttime,t.endtime from (
            select lotno,max(batchcode)batchcode from tlotctrl where state=0 and endtime>sysdate and starttime<sysdate group by lotno
         ) a  left join tlotctrl t on t.lotno=a.lotno and a.batchcode=t.batchcode
       ) t,tlotno_map m where t.lotno=m.lotno and m.state=1
       ) a
 ,tsubchannel s  where  a.agencyno=s.agencyno  and a.flag not in (
  select agencyno || ';' || batchcode ||  ';' || lotno from tlotctrlnotice  where noticetype=1 and ( stateflag=1 or FAILTIMES>10));

-- prompt
-- prompt Creating view V_NOTNOTICE_ISSUE_WIN
-- prompt ===================================
-- prompt
create or replace view jrtsch.v_notnotice_issue_win as
select distinct  LOTNO,SUBLOTNO, termcode,AGENCYNO,winbasecode, starttime, endtime from(
  select t.starttime,t.endtime,t.lotno,m.sublotno,m.agencyno ||  ';'  || t.lotno flag,t.termcode ,m.agencyno,t.winbasecode
  from v_new_wininfo t,tlotno_map m  where m.lotno=t.lotno   and m.state=1
  ) a where flag not in (select agencyno ||  ';'  || lotno from tlotctrlnotice
  where noticetype=2 and stateflag=1 and FAILTIMES<5 and sysdate-15 < suctime);

-- prompt
-- prompt Creating view V_NOT_NOTICE_ISSUE
-- prompt ================================
-- prompt
create or replace view jrtsch.v_not_notice_issue as
select  LOTNO,SUBLOTNO, BATCHCODE,STARTTIME,ENDTIME,AGENCYNO from(
  select t.lotno,m.sublotno,m.agencyno ||  ';'  || t.lotno flag ,t.batchcode,t.starttime,t.endtime,m.agencyno
  from tlotctrl t,tlotno_map m  where m.lotno=t.lotno and t.state=0 and m.state=1
  ) a where flag not in (select agencyno ||  ';'  || lotno from tlotctrlnotice
  where noticetype=1 and stateflag=1 and FAILTIMES<5 and sysdate-15 < suctime);

-- prompt
-- prompt Creating view V_NOT_NOTICE_ISSUE_NEW
-- prompt ====================================
-- prompt
create or replace view jrtsch.v_not_notice_issue_new as
select   lotno,batchcode,starttime,endtime,sublotno,agencyno from(
  select t.lotno,t.batchcode,t.starttime,t.endtime,m.sublotno,m.agencyno,m.agencyno || ';' || t.batchcode  ||  ';'  || t.lotno flag from(
   select t.lotno,t.batchcode,t.starttime,t.endtime from (
   select lotno,max(batchcode)batchcode from tlotctrl where state=0 and endtime>sysdate and starttime<sysdate group by lotno
   ) a   left join tlotctrl t on t.lotno=a.lotno and a.batchcode=t.batchcode
   ) t,tlotno_map m where t.lotno=m.lotno and m.state=1 )
  where flag not in (
  select agencyno || ';' ||  batchcode  ||  ';'  || lotno from tlotctrlnotice  where noticetype=1 and stateflag=1 and FAILTIMES<5
 );

-- prompt
-- prompt Creating view V_NOT_NOTICE_LOT
-- prompt ==============================
-- prompt
create or replace view jrtsch.v_not_notice_lot as
select a.realflowno,a.agencyflowno,a.state,a.lotno,mp.sublotno,mp.agencyno,batchcode,a.ticketseq from(
select m.realflowno,m.agencyno, m.agencyflowno,t.state,t.lotno,t.batchcode,m.ticketseq from tlotmap m left join tlot  t on t.flowno=m.realflowno and m.agencyno=t.userno
where t.state<>2 and m.betflag<>1 and m.betnoticenum<10 ) a,tlotno_map mp
 where mp.state=1 and mp.lotno=a.lotno  and mp.agencyno=a.agencyno
 union
select a.realflowno,a.agencyflowno,a.state,a.lotno,m.sublotno,m.agencyno,batchcode,a.ticketseq from(
select m.realflowno,m.agencyno,m.agencyflowno,t.state,t.lotno,t.batchcode,m.ticketseq from tlotmap m left join tlottc  t on t.flowno=m.realflowno
where t.state<>2 and m.betflag<>1 and m.betnoticenum<10 ) a,tlotno_map m
 where m.state=1 and m.lotno=a.lotno and m.agencyno=a.agencyno;

-- prompt
-- prompt Creating view V_NOT_NOTICE_WIN
-- prompt ==============================
-- prompt
CREATE OR REPLACE VIEW jrtsch.V_NOT_NOTICE_WIN AS
SELECT realflowno,agencyflowno,state,lotno,sublotno,agencyno,batchcode,ticketseq,PRIZEAMT, SETTLEFLAG  FROM (
       SELECT realflowno,agencyflowno,state,lotno,sublotno,agencyno,batchcode,ticketseq,PRIZEAMT, SETTLEFLAG, rownum r FROM (
       select a.realflowno,a.agencyflowno,a.state,a.lotno,m.sublotno,m.agencyno,batchcode,a.ticketseq,PRIZEAMT,SETTLEFLAG from(
       select m.realflowno,m.agencyflowno,t.state,t.lotno,t.batchcode,m.ticketseq,t.PRIZEAMT,t.SETTLEFLAG from tlotmap m
              left join tlot t on t.flowno=m.realflowno
              where t.state<>2 and  m.winflag<>1 and m.betnoticenum<3 and t.PRIZEAMT>0
              ) a  left join tlotno_map m on  m.lotno=a.lotno
              where m.state=1
 union
      select a.realflowno,a.agencyflowno,a.state,a.lotno,m.sublotno,m.agencyno,batchcode,a.ticketseq,PRIZEAMT, SETTLEFLAG from(
      select m.realflowno,m.agencyflowno,t.state,t.lotno,t.batchcode,m.ticketseq,t.PRIZEAMT,t.SETTLEFLAG from tlotmap m
              left join tlottc  t on t.flowno=m.realflowno
              where t.state<>2 and m.winflag<>1 and m.betnoticenum<3 and t.PRIZEAMT>0 ) a,tlotno_map m
              where m.state=1 and m.lotno=a.lotno
 ) WHERE rownum <= 2000 );

-- prompt
-- prompt Creating view V_NOT_NOTICE_WIN12580
-- prompt ===================================
-- prompt
CREATE OR REPLACE VIEW jrtsch.V_NOT_NOTICE_WIN12580 AS
SELECT realflowno,agencyflowno,state,lotno,sublotno,agencyno,batchcode,ticketseq,PRIZEAMT, SETTLEFLAG ,betnum,prizelevel FROM (
       SELECT realflowno,agencyflowno,state,lotno,sublotno,agencyno,batchcode,ticketseq,PRIZEAMT, SETTLEFLAG,betnum,prizelevel, rownum r FROM (
       select a.realflowno,a.agencyflowno,a.state,a.lotno,m.sublotno,m.agencyno,batchcode,a.ticketseq,PRIZEAMT,SETTLEFLAG, a.betnum,a.prizelevel from(
       select m.realflowno,m.agencyflowno,t.state,t.lotno,t.batchcode,m.ticketseq,t.PRIZEAMT,t.SETTLEFLAG,t.betnum,w.class as prizelevel from tlotmap m
              left join tlot t on t.flowno=m.realflowno  join twin w on w.flowno=t.flowno

              where t.state<>2 and  m.winflag<>1 and m.betnoticenum<3 and t.PRIZEAMT>0
              ) a  left join tlotno_map m on  m.lotno=a.lotno
              where m.state=1
 union
      select a.realflowno,a.agencyflowno,a.state,a.lotno,m.sublotno,m.agencyno,batchcode,a.ticketseq,PRIZEAMT, SETTLEFLAG,a.betnum,a.prizelevel from(
      select m.realflowno,m.agencyflowno,t.state,t.lotno,t.batchcode,m.ticketseq,t.PRIZEAMT,t.SETTLEFLAG,t.betnum,w.class as prizelevel from tlotmap m
              left join tlottc  t on t.flowno=m.realflowno  join twintc w on w.flowno=t.flowno
              where t.state<>2 and m.winflag<>1 and m.betnoticenum<3 and t.PRIZEAMT>0 ) a,tlotno_map m
              where m.state=1 and m.lotno=a.lotno
 ) WHERE rownum <= 2000 );

-- prompt
-- prompt Creating view V_USERINFOCOUNT
-- prompt =============================
-- prompt
create or replace view jrtsch.v_userinfocount as
select tu.userno userno, tu.mobileid mobileid, tu.state state, tu.name name, tu.nickname nickname,
  to_char(tu.regtime,'YYYY-MM-DD HH24:Mi:SS') regtime, ta.balance balance, ta.drawbalance drawbalance, tu.agencyno channel
  ,a.times,a.totalAmt   ,b.zstotalAmt,b.zstimes  ,c.hmtimes,c.hmtotalAmt ,d.fczhtimes,d.fczhtotalAmt
  ,e.tczhtimes,e.tczhtotalAmt
  ,f.fctctimes,f.fctctotalAmt
,  g.tctctimes,g.tctctotalAmt
  from tuserinfo tu
  left join taccount ta on tu.userno=ta.userno
  left join (  select count(distinct tt.id) times, sum(tt.amt)/100 totalAmt,tt.userno
       from ttransaction tt where tt.type=1 and tt.state=1  group by tt.userno) a on tu.userno=a.userno
  left join (
    select count(distinct tt.id) zstimes, sum(tt.amt)/100 zstotalAmt,tt.userno from ttransaction tt
    where tt.type=1 and tt.state=1   and  tt.acceptno<>' ' group by  userno
  ) b  on  tu.userno=b.userno  left join(
          select count(distinct tb.casebuyid) hmtimes, sum(tb.buyamt)/100 hmtotalAmt,tb.userno from tbuylot tb, tlotcase tc
            where tb.caseid=tc.id   and  tc.flag=3 or tc.flag=7 group by  tb.userno
  )c on  tu.userno=c.userno  left join(
        select count(distinct ts.flowno) fczhtimes, sum(tl.amt)/100 fczhtotalAmt , ts.userno from tsubscribe ts, tlot tl
          where tl.subscribeno=ts.flowno   and ts.type=0 and tl.state=1  group by  ts.userno
  )d  on  tu.userno=d.userno   left join(
     select count(distinct ts.flowno) tczhtimes, sum(tc.amt)/100 tczhtotalAmt,ts.userno from tsubscribe ts, tlottc tc
    where tc.subscribeno=ts.flowno  and ts.type=0 and tc.state=1     group by  ts.userno
  )e  on  tu.userno=e.userno    left join(
    select count(distinct ts.flowno) fctctimes, sum(tl.amt)/100 fctctotalAmt, ts.userno  from tsubscribe ts, tlot tl
    where tl.subscribeno=ts.flowno  and ts.type=1 and tl.state=1    group by ts.userno
  )f  on  tu.userno=f.userno
   left join(
  select count(distinct ts.flowno) tctctimes, sum(tc.amt)/100 tctctotalAmt, ts.userno from tsubscribe ts, tlottc tc
    where tc.subscribeno=ts.flowno  and ts.type=1 and tc.state=1   group by ts.userno
  )g  on  tu.userno=g.userno;
