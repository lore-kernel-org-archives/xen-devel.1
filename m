Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3396C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:03:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0FD62084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:03:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="ENhjW7wt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0FD62084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDrLd-00025n-5X; Tue, 09 Apr 2019 14:03:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xtw0=SL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hDrLb-00025R-Fr
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:03:35 +0000
X-Inumbo-ID: 42cd132b-5ad0-11e9-92d7-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::705])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 42cd132b-5ad0-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HQFFMovH0dWMfa+aNI4GV6uLLwyvUSmcD0NL+NJpomo=;
 b=ENhjW7wt3cZ5qoTKjxv4VUbZ3fkcxDcGd/Aqo+fSVithVB+3fs9ILpAWWtxZBN1ILsaZntvVgjCEVhgAIAvOcmilkC0Yqz294V0mYL9m0zboNhYzit45pFYoPQj8k7eogRFxzZ83Nt7QIWViUM2VANLRP5V7GVgxT7AepAaKEog=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB2560.eurprd02.prod.outlook.com (10.173.79.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Tue, 9 Apr 2019 14:03:30 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 14:03:30 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v3 1/3] x86/mm: Introduce altp2m_get_gfn_type_access
Thread-Index: AQHU7sxOthwR4rIdkUC4dpiYJsWlRqYz2FoAgAAEEAA=
Date: Tue, 9 Apr 2019 14:03:30 +0000
Message-ID: <d01821fb-f68d-1816-21c4-4d77cb4b7cb6@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <CABfawhmyTGNmLP5=c5pWeUiRaSPpwUUw_9SjXoJPr2ZANep41w@mail.gmail.com>
In-Reply-To: <CABfawhmyTGNmLP5=c5pWeUiRaSPpwUUw_9SjXoJPr2ZANep41w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5PR0701CA0059.eurprd07.prod.outlook.com
 (2603:10a6:203:2::21) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f91206e-ee5f-4aaf-a0b9-08d6bcf4253b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2560; 
x-ms-traffictypediagnostic: VI1PR0202MB2560:|VI1PR0202MB2560:
x-microsoft-antispam-prvs: <VI1PR0202MB2560054FFF5484053874C8BAAB2D0@VI1PR0202MB2560.eurprd02.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(39860400002)(346002)(396003)(376002)(366004)(189003)(199004)(53936002)(86362001)(305945005)(7736002)(6512007)(25786009)(4326008)(478600001)(31696002)(6246003)(14454004)(6116002)(3846002)(68736007)(2906002)(6436002)(6486002)(229853002)(71190400001)(71200400001)(2616005)(54906003)(316002)(486006)(97736004)(5660300002)(6916009)(52116002)(446003)(8676002)(26005)(102836004)(99286004)(386003)(81166006)(53546011)(186003)(76176011)(6506007)(14444005)(256004)(105586002)(36756003)(106356001)(66066001)(476003)(31686004)(11346002)(8936002)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2560;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kdGqXwJOxLpzDl+YcfHtdEs2zx2HEKyFBWm7DK4wRX9J61RZM3drsewReDQAJi7aelrKBBndJv4nY27cIzPrZ3omDF4Nkf4RIf9flRpi0Cq7h2yF7MEYQLy3VbfqLq9ef6yGcz/Trb08YFDyUpoIOo3OOAYvn3/wcNBHcm2d3e3HT6EncXtGYL9Yij49ekqnFMHEoKXhMyRwrQJvCzb9QFK7inu/a+QijnWNmYWSXuMOQglEosZXY/5I1gO2K4csmhAEa2c9xymFOuLBNqpVPIEanrddWiTEW4C+Tyr1NcQWC3IEwUy/FGCjsYPAlMk+/++PhHc/Yvsk8YepBtOPMPyGv/BdZKF2v4XBzq69Mv6YO1P2XM1Pccx0jbEXEwIPnfNRaOQRQeyHjbfvATWcG8vNS/pjgfKEiroRGTqMsvM=
Content-ID: <E2950475C3373F47A1A4492AAE0B5BDD@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f91206e-ee5f-4aaf-a0b9-08d6bcf4253b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 14:03:30.5353 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2560
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409140330.jai6A5URrcSTaM-nKjQeN_MVaqoGVZtffEQoNl8UI80@z>

DQoNCk9uIDA5LjA0LjIwMTkgMTY6NDgsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gVHVl
LCBBcHIgOSwgMjAxOSBhdCA2OjA0IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBDQo+IDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pg0KPj4gVGhpcyBwYXRjaCBtb3ZlcyBjb21t
b24gY29kZSBmcm9tIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3MoKSBhbmQNCj4+IHAybV9jaGFu
Z2VfYWx0cDJtX2dmbigpIGludG8gb25lIGZ1bmN0aW9uDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+Pg0KPj4gLS0tDQo+
PiBDaGFuZ2VzIHNpbmNlIFYyOg0KPj4gICAgICAgICAgLSBDaGFuZ2UgdmFyIG5hbWUgZnJvbSBm
b3VuZF9pbl9ob3N0cDJtIHRvIGNvcGllZF9mcm9tX2hvc3RwMm0NCj4+ICAgICAgICAgIC0gTW92
ZSB0aGUgdHlwZSBjaGVjayBmcm9tIGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKCkgdG8gdGhl
DQo+PiAgICAgICAgICBjYWxsZXJzLg0KPj4gLS0tDQo+PiAgIHhlbi9hcmNoL3g4Ni9tbS9tZW1f
YWNjZXNzLmMgfCAzMiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tDQo+PiAgIHhlbi9hcmNo
L3g4Ni9tbS9wMm0uYyAgICAgICAgfCA0MSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0NCj4+ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaCAgICB8IDE5ICsrKysrKysrKysr
KysrKysrDQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMg
Yi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiBpbmRleCA1NmMwNmE0ZmM2Li5iZjY3
ZGRiMTVhIDEwMDY0NA0KPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPj4g
KysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPj4gQEAgLTI2NSwzMSArMjY1LDI3
IEBAIGludCBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVj
dCBwMm1fZG9tYWluICpocDJtLA0KPj4gICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7DQo+
PiAgICAgICB1bnNpZ25lZCBsb25nIGdmbl9sID0gZ2ZuX3goZ2ZuKTsNCj4+ICAgICAgIGludCBy
YzsNCj4+ICsgICAgYm9vbCBjb3BpZWRfZnJvbV9ob3N0cDJtOw0KPj4NCj4+IC0gICAgbWZuID0g
YXAybS0+Z2V0X2VudHJ5KGFwMm0sIGdmbiwgJnQsICZvbGRfYSwgMCwgTlVMTCwgTlVMTCk7DQo+
PiArICAgIG1mbiA9IGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKGFwMm0sIGdmbiwgJnQsICZv
bGRfYSwgJnBhZ2Vfb3JkZXIsICZjb3BpZWRfZnJvbV9ob3N0cDJtKTsNCj4+DQo+PiAtICAgIC8q
IENoZWNrIGhvc3QgcDJtIGlmIG5vIHZhbGlkIGVudHJ5IGluIGFsdGVybmF0ZSAqLw0KPj4gICAg
ICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FU1JDSDsNCj4+
ICsNCj4+ICsgICAgLyogSWYgdGhpcyBpcyBhIHN1cGVycGFnZSwgY29weSB0aGF0IGZpcnN0ICov
DQo+PiArICAgIGlmICggcGFnZV9vcmRlciAhPSBQQUdFX09SREVSXzRLICYmIGNvcGllZF9mcm9t
X2hvc3RwMm0gKQ0KPj4gICAgICAgew0KPj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0g
figoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7DQo+PiArICAgICAgICBnZm5fdCBnZm4yID0gX2dm
bihnZm5fbCAmIG1hc2spOw0KPj4gKyAgICAgICAgbWZuX3QgbWZuMiA9IF9tZm4obWZuX3gobWZu
KSAmIG1hc2spOw0KPj4NCj4+IC0gICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2Vzcyho
cDJtLCBnZm5fbCwgJnQsICZvbGRfYSwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOw0KPj4gKyAg
ICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRvIGEgc2hh
cmVkIGVudHJ5ICovDQo+PiArICAgICAgICBpZiAoIHQgIT0gcDJtX3JhbV9ydyApDQo+PiArICAg
ICAgICAgICAgcmV0dXJuIC1FU1JDSDsNCj4+DQo+PiAtICAgICAgICByYyA9IC1FU1JDSDsNCj4+
IC0gICAgICAgIGlmICggIW1mbl92YWxpZChtZm4pIHx8IHQgIT0gcDJtX3JhbV9ydyApDQo+PiAr
ICAgICAgICByYyA9IGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVy
LCB0LCBvbGRfYSwgMSk7DQo+PiArICAgICAgICBpZiAoIHJjICkNCj4+ICAgICAgICAgICAgICAg
cmV0dXJuIHJjOw0KPj4gLQ0KPj4gLSAgICAgICAgLyogSWYgdGhpcyBpcyBhIHN1cGVycGFnZSwg
Y29weSB0aGF0IGZpcnN0ICovDQo+PiAtICAgICAgICBpZiAoIHBhZ2Vfb3JkZXIgIT0gUEFHRV9P
UkRFUl80SyApDQo+PiAtICAgICAgICB7DQo+PiAtICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBt
YXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7DQo+PiAtICAgICAgICAgICAgZ2ZuX3Qg
Z2ZuMiA9IF9nZm4oZ2ZuX2wgJiBtYXNrKTsNCj4+IC0gICAgICAgICAgICBtZm5fdCBtZm4yID0g
X21mbihtZm5feChtZm4pICYgbWFzayk7DQo+PiAtDQo+PiAtICAgICAgICAgICAgcmMgPSBhcDJt
LT5zZXRfZW50cnkoYXAybSwgZ2ZuMiwgbWZuMiwgcGFnZV9vcmRlciwgdCwgb2xkX2EsIDEpOw0K
Pj4gLSAgICAgICAgICAgIGlmICggcmMgKQ0KPj4gLSAgICAgICAgICAgICAgICByZXR1cm4gcmM7
DQo+PiAtICAgICAgICB9DQo+PiAgICAgICB9DQo+Pg0KPj4gICAgICAgLyoNCj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+IGlu
ZGV4IGI5YmJiOGY0ODUuLmQzOGQ3YzI5Y2EgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0vcDJtLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPj4gQEAgLTI2MjYsNiAr
MjYyNiw3IEBAIGludCBwMm1fY2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5z
aWduZWQgaW50IGlkeCwNCj4+ICAgICAgIG1mbl90IG1mbjsNCj4+ICAgICAgIHVuc2lnbmVkIGlu
dCBwYWdlX29yZGVyOw0KPj4gICAgICAgaW50IHJjID0gLUVJTlZBTDsNCj4+ICsgICAgYm9vbCBj
b3BpZWRfZnJvbV9ob3N0cDJtOw0KPj4NCj4+ICAgICAgIGlmICggaWR4ID49IE1BWF9BTFRQMk0g
fHwgZC0+YXJjaC5hbHRwMm1fZXB0cFtpZHhdID09IG1mbl94KElOVkFMSURfTUZOKSApDQo+PiAg
ICAgICAgICAgcmV0dXJuIHJjOw0KPj4gQEAgLTI2MzYsNyArMjYzNyw3IEBAIGludCBwMm1fY2hh
bmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwNCj4+ICAg
ICAgIHAybV9sb2NrKGhwMm0pOw0KPj4gICAgICAgcDJtX2xvY2soYXAybSk7DQo+Pg0KPj4gLSAg
ICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgb2xkX2dmbiwgJnQsICZhLCAwLCBOVUxMLCBO
VUxMKTsNCj4+ICsgICAgbWZuID0gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nlc3MoYXAybSwgb2xk
X2dmbiwgJnQsICZhLCAmcGFnZV9vcmRlciwgJmNvcGllZF9mcm9tX2hvc3RwMm0pOw0KPj4NCj4+
ICAgICAgIGlmICggZ2ZuX2VxKG5ld19nZm4sIElOVkFMSURfR0ZOKSApDQo+PiAgICAgICB7DQo+
PiBAQCAtMjY0NiwzNyArMjY0NywyNyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgsDQo+PiAgICAgICAgICAgZ290byBvdXQ7DQo+
PiAgICAgICB9DQo+Pg0KPj4gLSAgICAvKiBDaGVjayBob3N0IHAybSBpZiBubyB2YWxpZCBlbnRy
eSBpbiBhbHRlcm5hdGUgKi8NCj4+IC0gICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQ0KPj4gLSAg
ICB7DQo+PiAtICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoaHAybSwgZ2ZuX3go
b2xkX2dmbiksICZ0LCAmYSwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQMk1fQUxMT0MsICZwYWdlX29yZGVyLCAwKTsNCj4+ICsgICAgaWYgKCAhbWZuX3ZhbGlkKG1m
bikgfHwgKHQgIT0gcDJtX3JhbV9ydyAmJiBjb3BpZWRfZnJvbV9ob3N0cDJtKSApDQo+IA0KPiBJ
cyB0aGlzIGNoZWNrIGNvcnJlY3Q/IFdoeSBkbyB5b3Ugd2FudCB0byBnZXQgb3V0IG9ubHkgd2hl
biB0eXBlIGlzDQo+IG5vbi1ydyAqYW5kKiBpdCdzIGNvcGllZCBmcm9tIHRoZSBob3N0cDJtPyBZ
b3UgY291bGQgaGF2ZSBub24tcncNCj4gZW50cmllcyBsaWtlIG1taW8gaW4gdGhlIGFsdHAybSB0
aGF0IHdlcmUgbGF6aWx5IGNvcGllZCBhbmQgSSBkb24ndA0KPiB0aGluayB3ZSB3YW50IHRvIGFs
bG93IHJlbWFwcGluZyB0byB0aG9zZSBlaXRoZXIuDQoNCkkganVzdCBjb3BpZWQgdGhlIGZ1bmN0
aW9uYWxpdHkuIElmIHRoaXMgaXMgbmVlZGVkIEkgd2lsbCBhZGQgYSB8fCB0ICE9IA0KcDJtX21t
aW9fZG0gYW5kIHAybV9tbWlvX2RpcmVjdC4NCg0KQWxleA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
