Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566FAC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:37:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1308220883
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:37:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="Eq1Vl1Mo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1308220883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDsoQ-0001mk-7W; Tue, 09 Apr 2019 15:37:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xtw0=SL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hDsoO-0001mf-Bi
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:37:24 +0000
X-Inumbo-ID: 5d71aa28-5add-11e9-92d7-bc764e045a96
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::70f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5d71aa28-5add-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjYTwLVMZec9tVipwH7ORuq6sAGSDDCW2oQEvN4aLMI=;
 b=Eq1Vl1Mo6q7zV5Zy6eOu0jDnKNVqwRK/xLDuo5nuJpHjT7KJ80BVe+4l6PqVca/hAv2Rs2DSiGl63QXmJJPnQtS6bPHft+Wu+dTHJCfsm+8sBk5iHb6p7lAvKjoz6v66OnF+Jzarm9cj+ZJ119nQ+7nVCFhR5gE6flkN4J7f5ic=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB2799.eurprd02.prod.outlook.com (10.171.102.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.16; Tue, 9 Apr 2019 15:37:18 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 15:37:18 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v3 1/3] x86/mm: Introduce altp2m_get_gfn_type_access
Thread-Index: AQHU7sxOthwR4rIdkUC4dpiYJsWlRqYz2FoAgAA2WgD//9cdgIAANY4A///YUwCAAALtAA==
Date: Tue, 9 Apr 2019 15:37:18 +0000
Message-ID: <88b07714-462c-14fc-f8e4-6598eefeafac@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <CABfawhmyTGNmLP5=c5pWeUiRaSPpwUUw_9SjXoJPr2ZANep41w@mail.gmail.com>
 <d01821fb-f68d-1816-21c4-4d77cb4b7cb6@bitdefender.com>
 <CABfawh=o1nCabm3CSyndoJE6UQKENvOKquhKWPhJEah1BFYJ-Q@mail.gmail.com>
 <4b433392-0484-5660-d795-365aa95af250@bitdefender.com>
 <CABfawhmg2GCC7uj2sX2NNO2QDHzSSHFRzU60tGJ2dPALRGxHrA@mail.gmail.com>
In-Reply-To: <CABfawhmg2GCC7uj2sX2NNO2QDHzSSHFRzU60tGJ2dPALRGxHrA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P195CA0015.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:81::28) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 53ac50cb-c092-47ff-df5a-08d6bd013fa8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2799; 
x-ms-traffictypediagnostic: VI1PR0202MB2799:|VI1PR0202MB2799:
x-microsoft-antispam-prvs: <VI1PR0202MB2799F86A3570BC03588830EDAB2D0@VI1PR0202MB2799.eurprd02.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(396003)(39860400002)(136003)(366004)(346002)(199004)(189003)(102836004)(53936002)(2906002)(4326008)(2616005)(52116002)(5660300002)(8676002)(81156014)(26005)(6246003)(446003)(305945005)(53546011)(14444005)(6506007)(7736002)(25786009)(66066001)(256004)(6436002)(81166006)(476003)(6486002)(11346002)(8936002)(186003)(76176011)(14454004)(31686004)(36756003)(6916009)(68736007)(97736004)(71190400001)(86362001)(71200400001)(106356001)(6512007)(31696002)(6116002)(3846002)(93886005)(386003)(229853002)(316002)(486006)(99286004)(54906003)(478600001)(105586002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2799;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oHW6dxP5oMnzO1yq5ugKxAk6oIl+O0yS59VZRHg+BcI/lgAaRTHQ2X2DYdl/g/qxfJ6mOMfDGEY3s9oDeg+HXyEaO8A90rlvqp5HvXFGh9Vrtzx6ifzB8xE81sTnEU0rcUNG10Cq6XhDakYvLCY54ILmdQZC/ZipKo/dXlyeAOs6QNeF4D1nW33Qs5sO4+inRuEDdhiKYQlIsAy3rY0rW99P2r5TR0XRzf4NrD9Ta4F32jXt4J/BZLKCdOa6y30FjR/Emo4sStX4ovnzTclY3u/bHCvVpNmATtbs4RmjfRErMczJMbdrovNYSR4hWPeWLaw6fyo2rk2BgeNYyWzUrbfkgICnY55boQSyc1plTbbMKJ8sEaZ/NP1SiW56ttbrULkTbNJwySFEvoi6BYJoFS4AEpWlduTWGdesvoNUXpc=
Content-ID: <4AA4BF693D140049B725DF76062FD15D@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ac50cb-c092-47ff-df5a-08d6bd013fa8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 15:37:18.4276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2799
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
Message-ID: <20190409153718.1aSeR75W4y-AFuS9FTbjDoK7DIolBFriRPEZQxVeFaY@z>

DQpPbiAwOS4wNC4yMDE5IDE4OjI2LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+IE9uIFR1ZSwg
QXByIDksIDIwMTkgYXQgODo0OCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQ0KPiA8YWlzYWls
YUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4NCj4+DQo+Pg0KPj4gT24gMDkuMDQuMjAxOSAx
NzozNywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOg0KPj4+IE9uIFR1ZSwgQXByIDksIDIwMTkgYXQg
ODowMyBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQ0KPj4+IDxhaXNhaWxhQGJpdGRlZmVuZGVy
LmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+DQo+Pj4+DQo+Pj4+IE9uIDA5LjA0LjIwMTkgMTY6NDgs
IFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4+Pj4+IE9uIFR1ZSwgQXByIDksIDIwMTkgYXQgNjow
NCBBTSBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQQ0KPj4+Pj4gPGFpc2FpbGFAYml0ZGVmZW5kZXIu
Y29tPiB3cm90ZToNCj4+Pj4+Pg0KPj4+Pj4+IFRoaXMgcGF0Y2ggbW92ZXMgY29tbW9uIGNvZGUg
ZnJvbSBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKCkgYW5kDQo+Pj4+Pj4gcDJtX2NoYW5nZV9h
bHRwMm1fZ2ZuKCkgaW50byBvbmUgZnVuY3Rpb24NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPj4+Pj4+DQo+
Pj4+Pj4gLS0tDQo+Pj4+Pj4gQ2hhbmdlcyBzaW5jZSBWMjoNCj4+Pj4+PiAgICAgICAgICAgIC0g
Q2hhbmdlIHZhciBuYW1lIGZyb20gZm91bmRfaW5faG9zdHAybSB0byBjb3BpZWRfZnJvbV9ob3N0
cDJtDQo+Pj4+Pj4gICAgICAgICAgICAtIE1vdmUgdGhlIHR5cGUgY2hlY2sgZnJvbSBhbHRwMm1f
Z2V0X2dmbl90eXBlX2FjY2VzcygpIHRvIHRoZQ0KPj4+Pj4+ICAgICAgICAgICAgY2FsbGVycy4N
Cj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICAgeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8IDMy
ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4+PiAgICAgeGVuL2FyY2gveDg2L21t
L3AybS5jICAgICAgICB8IDQxICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
Pj4+Pj4+ICAgICB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oICAgIHwgMTkgKysrKysrKysrKysr
KysrKysNCj4+Pj4+PiAgICAgMyBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA0MyBk
ZWxldGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0v
bWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPj4+Pj4+IGluZGV4
IDU2YzA2YTRmYzYuLmJmNjdkZGIxNWEgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNz
LmMNCj4+Pj4+PiBAQCAtMjY1LDMxICsyNjUsMjcgQEAgaW50IHAybV9zZXRfYWx0cDJtX21lbV9h
Y2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9kb21haW4gKmhwMm0sDQo+Pj4+Pj4g
ICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsNCj4+Pj4+PiAgICAgICAgIHVuc2lnbmVk
IGxvbmcgZ2ZuX2wgPSBnZm5feChnZm4pOw0KPj4+Pj4+ICAgICAgICAgaW50IHJjOw0KPj4+Pj4+
ICsgICAgYm9vbCBjb3BpZWRfZnJvbV9ob3N0cDJtOw0KPj4+Pj4+DQo+Pj4+Pj4gLSAgICBtZm4g
PSBhcDJtLT5nZXRfZW50cnkoYXAybSwgZ2ZuLCAmdCwgJm9sZF9hLCAwLCBOVUxMLCBOVUxMKTsN
Cj4+Pj4+PiArICAgIG1mbiA9IGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKGFwMm0sIGdmbiwg
JnQsICZvbGRfYSwgJnBhZ2Vfb3JkZXIsICZjb3BpZWRfZnJvbV9ob3N0cDJtKTsNCj4+Pj4+Pg0K
Pj4+Pj4+IC0gICAgLyogQ2hlY2sgaG9zdCBwMm0gaWYgbm8gdmFsaWQgZW50cnkgaW4gYWx0ZXJu
YXRlICovDQo+Pj4+Pj4gICAgICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApDQo+Pj4+Pj4gKyAg
ICAgICAgcmV0dXJuIC1FU1JDSDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKiBJZiB0aGlzIGlz
IGEgc3VwZXJwYWdlLCBjb3B5IHRoYXQgZmlyc3QgKi8NCj4+Pj4+PiArICAgIGlmICggcGFnZV9v
cmRlciAhPSBQQUdFX09SREVSXzRLICYmIGNvcGllZF9mcm9tX2hvc3RwMm0gKQ0KDQpSZWdhcmRp
bmcgdGhlIGRyb3Agb2YgY29waWVkX2Zyb21faG9zdHAybSBzaG91bGQgdGhpcyBiZSBkcm9wcGVk
IGhlcmUgYXMgDQp3ZWxsIGFuZCBieSB0aGF0IGRyb3AgaXQgYWxsIHRvZ2V0aGVyPw0KDQo+Pj4+
Pj4gICAgICAgICB7DQo+Pj4+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigoMVVM
IDw8IHBhZ2Vfb3JkZXIpIC0gMSk7DQo+Pj4+Pj4gKyAgICAgICAgZ2ZuX3QgZ2ZuMiA9IF9nZm4o
Z2ZuX2wgJiBtYXNrKTsNCj4+Pj4+PiArICAgICAgICBtZm5fdCBtZm4yID0gX21mbihtZm5feCht
Zm4pICYgbWFzayk7DQo+Pj4+Pj4NCj4+Pj4+PiAtICAgICAgICBtZm4gPSBfX2dldF9nZm5fdHlw
ZV9hY2Nlc3MoaHAybSwgZ2ZuX2wsICZ0LCAmb2xkX2EsDQo+Pj4+Pj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFAyTV9BTExPQyB8IFAyTV9VTlNIQVJFLCAmcGFnZV9vcmRl
ciwgMCk7DQo+Pj4+Pj4gKyAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZl
IHRvIHJlbWFwIHRvIGEgc2hhcmVkIGVudHJ5ICovDQo+Pj4+Pj4gKyAgICAgICAgaWYgKCB0ICE9
IHAybV9yYW1fcncgKQ0KPj4+Pj4+ICsgICAgICAgICAgICByZXR1cm4gLUVTUkNIOw0KDQpBbmQg
aWYgc28gYW5kIHJlZ2FyZGluZyB0aGUgY29tbWVudHMgZnJvbSBwMm1fY2hhbmdlX2FsdHAybV9n
Zm4gc2hvdWxkIEkgDQptb3ZlIHRoZSAoIHQgIT0gcDJtX3JhbV9ydyApIGNoZWNrIHVwIHdpdGgg
dGhlICggIW1mbl92YWxpZChtZm4pICkgY2hlY2s/DQoNCkFsZXgNCg0KPj4+Pj4+DQo+Pj4+Pj4g
LSAgICAgICAgcmMgPSAtRVNSQ0g7DQo+Pj4+Pj4gLSAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1m
bikgfHwgdCAhPSBwMm1fcmFtX3J3ICkNCj4+Pj4+PiArICAgICAgICByYyA9IGFwMm0tPnNldF9l
bnRyeShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRfYSwgMSk7DQo+Pj4+Pj4g
KyAgICAgICAgaWYgKCByYyApDQo+Pj4+Pj4gICAgICAgICAgICAgICAgIHJldHVybiByYzsNCj4+
Pj4+PiAtDQo+Pj4+Pj4gLSAgICAgICAgLyogSWYgdGhpcyBpcyBhIHN1cGVycGFnZSwgY29weSB0
aGF0IGZpcnN0ICovDQo+Pj4+Pj4gLSAgICAgICAgaWYgKCBwYWdlX29yZGVyICE9IFBBR0VfT1JE
RVJfNEsgKQ0KPj4+Pj4+IC0gICAgICAgIHsNCj4+Pj4+PiAtICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7DQo+Pj4+Pj4gLSAgICAgICAg
ICAgIGdmbl90IGdmbjIgPSBfZ2ZuKGdmbl9sICYgbWFzayk7DQo+Pj4+Pj4gLSAgICAgICAgICAg
IG1mbl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsNCj4+Pj4+PiAtDQo+Pj4+Pj4g
LSAgICAgICAgICAgIHJjID0gYXAybS0+c2V0X2VudHJ5KGFwMm0sIGdmbjIsIG1mbjIsIHBhZ2Vf
b3JkZXIsIHQsIG9sZF9hLCAxKTsNCj4+Pj4+PiAtICAgICAgICAgICAgaWYgKCByYyApDQo+Pj4+
Pj4gLSAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQo+Pj4+Pj4gLSAgICAgICAgfQ0KPj4+Pj4+
ICAgICAgICAgfQ0KPj4+Pj4+DQo+Pj4+Pj4gICAgICAgICAvKg0KPj4+Pj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+Pj4+PiBp
bmRleCBiOWJiYjhmNDg1Li5kMzhkN2MyOWNhIDEwMDY0NA0KPj4+Pj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYw0KPj4+Pj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPj4+Pj4+
IEBAIC0yNjI2LDYgKzI2MjYsNyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBk
b21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgsDQo+Pj4+Pj4gICAgICAgICBtZm5fdCBtZm47DQo+
Pj4+Pj4gICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsNCj4+Pj4+PiAgICAgICAgIGlu
dCByYyA9IC1FSU5WQUw7DQo+Pj4+Pj4gKyAgICBib29sIGNvcGllZF9mcm9tX2hvc3RwMm07DQo+
Pj4+Pj4NCj4+Pj4+PiAgICAgICAgIGlmICggaWR4ID49IE1BWF9BTFRQMk0gfHwgZC0+YXJjaC5h
bHRwMm1fZXB0cFtpZHhdID09IG1mbl94KElOVkFMSURfTUZOKSApDQo+Pj4+Pj4gICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KPj4+Pj4+IEBAIC0yNjM2LDcgKzI2MzcsNyBAQCBpbnQgcDJtX2NoYW5n
ZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgsDQo+Pj4+Pj4g
ICAgICAgICBwMm1fbG9jayhocDJtKTsNCj4+Pj4+PiAgICAgICAgIHAybV9sb2NrKGFwMm0pOw0K
Pj4+Pj4+DQo+Pj4+Pj4gLSAgICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgb2xkX2dmbiwg
JnQsICZhLCAwLCBOVUxMLCBOVUxMKTsNCj4+Pj4+PiArICAgIG1mbiA9IGFsdHAybV9nZXRfZ2Zu
X3R5cGVfYWNjZXNzKGFwMm0sIG9sZF9nZm4sICZ0LCAmYSwgJnBhZ2Vfb3JkZXIsICZjb3BpZWRf
ZnJvbV9ob3N0cDJtKTsNCj4+Pj4+Pg0KPj4+Pj4+ICAgICAgICAgaWYgKCBnZm5fZXEobmV3X2dm
biwgSU5WQUxJRF9HRk4pICkNCj4+Pj4+PiAgICAgICAgIHsNCj4+Pj4+PiBAQCAtMjY0NiwzNyAr
MjY0NywyNyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVu
c2lnbmVkIGludCBpZHgsDQo+Pj4+Pj4gICAgICAgICAgICAgZ290byBvdXQ7DQo+Pj4+Pj4gICAg
ICAgICB9DQo+Pj4+Pj4NCj4+Pj4+PiAtICAgIC8qIENoZWNrIGhvc3QgcDJtIGlmIG5vIHZhbGlk
IGVudHJ5IGluIGFsdGVybmF0ZSAqLw0KPj4+Pj4+IC0gICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikg
KQ0KPj4+Pj4+IC0gICAgew0KPj4+Pj4+IC0gICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2Fj
Y2VzcyhocDJtLCBnZm5feChvbGRfZ2ZuKSwgJnQsICZhLA0KPj4+Pj4+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MsICZwYWdlX29yZGVyLCAwKTsNCj4+Pj4+
PiArICAgIGlmICggIW1mbl92YWxpZChtZm4pIHx8ICh0ICE9IHAybV9yYW1fcncgJiYgY29waWVk
X2Zyb21faG9zdHAybSkgKQ0KPj4+Pj4NCj4+Pj4+IElzIHRoaXMgY2hlY2sgY29ycmVjdD8gV2h5
IGRvIHlvdSB3YW50IHRvIGdldCBvdXQgb25seSB3aGVuIHR5cGUgaXMNCj4+Pj4+IG5vbi1ydyAq
YW5kKiBpdCdzIGNvcGllZCBmcm9tIHRoZSBob3N0cDJtPyBZb3UgY291bGQgaGF2ZSBub24tcncN
Cj4+Pj4+IGVudHJpZXMgbGlrZSBtbWlvIGluIHRoZSBhbHRwMm0gdGhhdCB3ZXJlIGxhemlseSBj
b3BpZWQgYW5kIEkgZG9uJ3QNCj4+Pj4+IHRoaW5rIHdlIHdhbnQgdG8gYWxsb3cgcmVtYXBwaW5n
IHRvIHRob3NlIGVpdGhlci4NCj4+Pj4NCj4+Pj4gSSBqdXN0IGNvcGllZCB0aGUgZnVuY3Rpb25h
bGl0eS4gSWYgdGhpcyBpcyBuZWVkZWQgSSB3aWxsIGFkZCBhIHx8IHQgIT0NCj4+Pj4gcDJtX21t
aW9fZG0gYW5kIHAybV9tbWlvX2RpcmVjdC4NCj4+Pg0KPj4+IE15IHByb2JsZW0gaXMgd2l0aCB0
aGUgJiYgY29waWVkX2Zvcm1faG9zdHAybSBwYXJ0LiBXaHkgaXMgdGhhdCBhIGNyaXRlcmlhPw0K
Pj4NCj4+IFRoZSAodCAhPSBwMm1fcmFtX3J3KSBjaGVjayB3YXMgZG9uZSBvbmx5IGZvciB0aGUg
Z2V0IGZyb20gaG9zdHAybS4NCj4+DQo+PiBJZiB5b3UgdGhpbmsgdGhhdCBJIHNob3VsZCBkbyB0
aGUgY2hlY2sgZm9yIGFsbCBtZm5zIChob3N0cDIgYW5kIGFsdHAybSkNCj4+IHRoZW4gSSBjYW4g
ZHJvcCB0aGUgY29waWVkX2Zyb21faG9zdHAybSBib29sIGFuZCBhZGQgbW1pbyBjaGVjay4NCj4g
DQo+IEkgdGhpbmsgeW91IHNob3VsZCBqdXN0IGRyb3AgdGhlICYmIGNvcGllZF9mcm9tX2hvc3Rw
Mm0gcGFydCBvZiBpdC4NCj4gUmVtYXBwaW5ncyBzaG91bGQgb25seSBiZSBhbGxvd2VkIGZvciBw
Mm1fcmFtX3J3IHR5cGUsIG5vIG1hdHRlciB3aGljaA0KPiBwMm0gaXRzIGNvbWluZyBmcm9tLg0K
PiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
