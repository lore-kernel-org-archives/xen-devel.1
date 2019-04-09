Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A95C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:49:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54C02064B
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="zDDMr/e2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54C02064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDs3W-0005xW-Qv; Tue, 09 Apr 2019 14:48:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xtw0=SL=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hDs3V-0005xQ-6o
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:48:57 +0000
X-Inumbo-ID: 98a2ec32-5ad6-11e9-92d7-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::724])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 98a2ec32-5ad6-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 14:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4bh26Vk63gzZ9ia3mIHp7C9X0zwSy2H3dxMlQI1WUI=;
 b=zDDMr/e2mijE4EHR4xbcOSx1twGD3jUtISs1CsNm+23mvhVX+4etBY8xUiDbCiGetA+M/SyM98o+X+zYTPzcQkw4lQrekVs5Hk06nK+AZ0qJu9a4WWq6vwWozUmXqAzVdjMMk5iYrey0+US4lQ5MKQSuha51rKyes2qzzkHSAWQ=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB2941.eurprd02.prod.outlook.com (10.171.103.140) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Tue, 9 Apr 2019 14:48:51 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Tue, 9 Apr 2019
 14:48:51 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v3 1/3] x86/mm: Introduce altp2m_get_gfn_type_access
Thread-Index: AQHU7sxOthwR4rIdkUC4dpiYJsWlRqYz2FoAgAA2WgD//9cdgIAAA0MA
Date: Tue, 9 Apr 2019 14:48:51 +0000
Message-ID: <4b433392-0484-5660-d795-365aa95af250@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <CABfawhmyTGNmLP5=c5pWeUiRaSPpwUUw_9SjXoJPr2ZANep41w@mail.gmail.com>
 <d01821fb-f68d-1816-21c4-4d77cb4b7cb6@bitdefender.com>
 <CABfawh=o1nCabm3CSyndoJE6UQKENvOKquhKWPhJEah1BFYJ-Q@mail.gmail.com>
In-Reply-To: <CABfawh=o1nCabm3CSyndoJE6UQKENvOKquhKWPhJEah1BFYJ-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6PR08CA0037.eurprd08.prod.outlook.com
 (2603:10a6:20b:c0::25) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 526770d5-cdc2-4bcd-63b2-08d6bcfa7acc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2941; 
x-ms-traffictypediagnostic: VI1PR0202MB2941:|VI1PR0202MB2941:
x-microsoft-antispam-prvs: <VI1PR0202MB294102F31EC40DFBC77A40F1AB2D0@VI1PR0202MB2941.eurprd02.prod.outlook.com>
x-forefront-prvs: 000227DA0C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(376002)(346002)(396003)(366004)(39860400002)(199004)(189003)(4326008)(36756003)(31686004)(66066001)(8936002)(6916009)(6512007)(6486002)(106356001)(25786009)(31696002)(8676002)(105586002)(68736007)(14454004)(316002)(478600001)(6436002)(71200400001)(71190400001)(81166006)(81156014)(54906003)(476003)(256004)(97736004)(2616005)(6116002)(3846002)(486006)(99286004)(14444005)(5660300002)(6246003)(102836004)(93886005)(186003)(53936002)(53546011)(229853002)(386003)(52116002)(26005)(86362001)(7736002)(6506007)(305945005)(2906002)(76176011)(446003)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2941;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3MfSD6CbWthRI5tv053Yr4rNUmqCdOx0iARKeTmYEjfJYKPF8ZC10OBMGwvmx6R77gB0raWgy6zEtZyBGVevBWdSbsTRdSEzB/bz8zaxQkf/HwLFb0l97HaVxaJdq6O1LbUg/oFvEs+CUxWC09F7JO83EZbpQktbaIN4BGMY9yU9oE4rAu4RmjDqY8kcBpJDk/DaKZkM5+elB+ixUbI/cwXb2VCAvUQcI1ojnhetkQWPTzAfvG7tKYmMwehwSekxjbkKst3E72/PhyDM8wUnMMsCDx1tehA+wbd1wYn7EvzgeGin5q7P1rScxMdb0kd1O/EUVC15fwz7bf0wiKwp7VIsFzxGva+jo+oHZ0ywnU5AXX525canMYmM3dnbVcgb/DcVTK4+RZB3WbzOQMR6CAEYzpMveACyCKGbi+HIFYA=
Content-ID: <5F3643F82CB6D947B345BE127C0F2016@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 526770d5-cdc2-4bcd-63b2-08d6bcfa7acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2019 14:48:51.0467 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2941
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
Message-ID: <20190409144851.I_yP15cviG642ZDJeD64kW7pVl42c6VFi_Y_xD3gc0Y@z>

DQoNCk9uIDA5LjA0LjIwMTkgMTc6MzcsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToNCj4gT24gVHVl
LCBBcHIgOSwgMjAxOSBhdCA4OjAzIEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBDQo+IDxhaXNh
aWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pg0KPj4NCj4+DQo+PiBPbiAwOS4wNC4yMDE5
IDE2OjQ4LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6DQo+Pj4gT24gVHVlLCBBcHIgOSwgMjAxOSBh
dCA2OjA0IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBDQo+Pj4gPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPiB3cm90ZToNCj4+Pj4NCj4+Pj4gVGhpcyBwYXRjaCBtb3ZlcyBjb21tb24gY29kZSBm
cm9tIHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3MoKSBhbmQNCj4+Pj4gcDJtX2NoYW5nZV9hbHRw
Mm1fZ2ZuKCkgaW50byBvbmUgZnVuY3Rpb24NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQo+Pj4+DQo+Pj4+IC0tLQ0K
Pj4+PiBDaGFuZ2VzIHNpbmNlIFYyOg0KPj4+PiAgICAgICAgICAgLSBDaGFuZ2UgdmFyIG5hbWUg
ZnJvbSBmb3VuZF9pbl9ob3N0cDJtIHRvIGNvcGllZF9mcm9tX2hvc3RwMm0NCj4+Pj4gICAgICAg
ICAgIC0gTW92ZSB0aGUgdHlwZSBjaGVjayBmcm9tIGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNz
KCkgdG8gdGhlDQo+Pj4+ICAgICAgICAgICBjYWxsZXJzLg0KPj4+PiAtLS0NCj4+Pj4gICAgeGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8IDMyICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0NCj4+Pj4gICAgeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICB8IDQxICsrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPj4+PiAgICB4ZW4vaW5jbHVkZS9hc20teDg2L3Ay
bS5oICAgIHwgMTkgKysrKysrKysrKysrKysrKysNCj4+Pj4gICAgMyBmaWxlcyBjaGFuZ2VkLCA0
OSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vz
cy5jDQo+Pj4+IGluZGV4IDU2YzA2YTRmYzYuLmJmNjdkZGIxNWEgMTAwNjQ0DQo+Pj4+IC0tLSBh
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21t
L21lbV9hY2Nlc3MuYw0KPj4+PiBAQCAtMjY1LDMxICsyNjUsMjcgQEAgaW50IHAybV9zZXRfYWx0
cDJtX21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHAybV9kb21haW4gKmhwMm0s
DQo+Pj4+ICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsNCj4+Pj4gICAgICAgIHVuc2ln
bmVkIGxvbmcgZ2ZuX2wgPSBnZm5feChnZm4pOw0KPj4+PiAgICAgICAgaW50IHJjOw0KPj4+PiAr
ICAgIGJvb2wgY29waWVkX2Zyb21faG9zdHAybTsNCj4+Pj4NCj4+Pj4gLSAgICBtZm4gPSBhcDJt
LT5nZXRfZW50cnkoYXAybSwgZ2ZuLCAmdCwgJm9sZF9hLCAwLCBOVUxMLCBOVUxMKTsNCj4+Pj4g
KyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcyhhcDJtLCBnZm4sICZ0LCAmb2xk
X2EsICZwYWdlX29yZGVyLCAmY29waWVkX2Zyb21faG9zdHAybSk7DQo+Pj4+DQo+Pj4+IC0gICAg
LyogQ2hlY2sgaG9zdCBwMm0gaWYgbm8gdmFsaWQgZW50cnkgaW4gYWx0ZXJuYXRlICovDQo+Pj4+
ICAgICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApDQo+Pj4+ICsgICAgICAgIHJldHVybiAtRVNS
Q0g7DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKiBJZiB0aGlzIGlzIGEgc3VwZXJwYWdlLCBjb3B5IHRo
YXQgZmlyc3QgKi8NCj4+Pj4gKyAgICBpZiAoIHBhZ2Vfb3JkZXIgIT0gUEFHRV9PUkRFUl80SyAm
JiBjb3BpZWRfZnJvbV9ob3N0cDJtICkNCj4+Pj4gICAgICAgIHsNCj4+Pj4gKyAgICAgICAgdW5z
aWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7DQo+Pj4+ICsgICAg
ICAgIGdmbl90IGdmbjIgPSBfZ2ZuKGdmbl9sICYgbWFzayk7DQo+Pj4+ICsgICAgICAgIG1mbl90
IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsNCj4+Pj4NCj4+Pj4gLSAgICAgICAgbWZu
ID0gX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKGhwMm0sIGdmbl9sLCAmdCwgJm9sZF9hLA0KPj4+PiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FMTE9DIHwgUDJNX1VOU0hB
UkUsICZwYWdlX29yZGVyLCAwKTsNCj4+Pj4gKyAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0
IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRvIGEgc2hhcmVkIGVudHJ5ICovDQo+Pj4+ICsgICAgICAg
IGlmICggdCAhPSBwMm1fcmFtX3J3ICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRVNSQ0g7
DQo+Pj4+DQo+Pj4+IC0gICAgICAgIHJjID0gLUVTUkNIOw0KPj4+PiAtICAgICAgICBpZiAoICFt
Zm5fdmFsaWQobWZuKSB8fCB0ICE9IHAybV9yYW1fcncgKQ0KPj4+PiArICAgICAgICByYyA9IGFw
Mm0tPnNldF9lbnRyeShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRfYSwgMSk7
DQo+Pj4+ICsgICAgICAgIGlmICggcmMgKQ0KPj4+PiAgICAgICAgICAgICAgICByZXR1cm4gcmM7
DQo+Pj4+IC0NCj4+Pj4gLSAgICAgICAgLyogSWYgdGhpcyBpcyBhIHN1cGVycGFnZSwgY29weSB0
aGF0IGZpcnN0ICovDQo+Pj4+IC0gICAgICAgIGlmICggcGFnZV9vcmRlciAhPSBQQUdFX09SREVS
XzRLICkNCj4+Pj4gLSAgICAgICAgew0KPj4+PiAtICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBt
YXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7DQo+Pj4+IC0gICAgICAgICAgICBnZm5f
dCBnZm4yID0gX2dmbihnZm5fbCAmIG1hc2spOw0KPj4+PiAtICAgICAgICAgICAgbWZuX3QgbWZu
MiA9IF9tZm4obWZuX3gobWZuKSAmIG1hc2spOw0KPj4+PiAtDQo+Pj4+IC0gICAgICAgICAgICBy
YyA9IGFwMm0tPnNldF9lbnRyeShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRf
YSwgMSk7DQo+Pj4+IC0gICAgICAgICAgICBpZiAoIHJjICkNCj4+Pj4gLSAgICAgICAgICAgICAg
ICByZXR1cm4gcmM7DQo+Pj4+IC0gICAgICAgIH0NCj4+Pj4gICAgICAgIH0NCj4+Pj4NCj4+Pj4g
ICAgICAgIC8qDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMNCj4+Pj4gaW5kZXggYjliYmI4ZjQ4NS4uZDM4ZDdjMjljYSAxMDA2
NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYw0KPj4+PiBAQCAtMjYyNiw2ICsyNjI2LDcgQEAgaW50IHAybV9jaGFuZ2Vf
YWx0cDJtX2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4LA0KPj4+PiAgICAg
ICAgbWZuX3QgbWZuOw0KPj4+PiAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7DQo+Pj4+
ICAgICAgICBpbnQgcmMgPSAtRUlOVkFMOw0KPj4+PiArICAgIGJvb2wgY29waWVkX2Zyb21faG9z
dHAybTsNCj4+Pj4NCj4+Pj4gICAgICAgIGlmICggaWR4ID49IE1BWF9BTFRQMk0gfHwgZC0+YXJj
aC5hbHRwMm1fZXB0cFtpZHhdID09IG1mbl94KElOVkFMSURfTUZOKSApDQo+Pj4+ICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KPj4+PiBAQCAtMjYzNiw3ICsyNjM3LDcgQEAgaW50IHAybV9jaGFuZ2Vf
YWx0cDJtX2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4LA0KPj4+PiAgICAg
ICAgcDJtX2xvY2soaHAybSk7DQo+Pj4+ICAgICAgICBwMm1fbG9jayhhcDJtKTsNCj4+Pj4NCj4+
Pj4gLSAgICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgb2xkX2dmbiwgJnQsICZhLCAwLCBO
VUxMLCBOVUxMKTsNCj4+Pj4gKyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2Vzcyhh
cDJtLCBvbGRfZ2ZuLCAmdCwgJmEsICZwYWdlX29yZGVyLCAmY29waWVkX2Zyb21faG9zdHAybSk7
DQo+Pj4+DQo+Pj4+ICAgICAgICBpZiAoIGdmbl9lcShuZXdfZ2ZuLCBJTlZBTElEX0dGTikgKQ0K
Pj4+PiAgICAgICAgew0KPj4+PiBAQCAtMjY0NiwzNyArMjY0NywyNyBAQCBpbnQgcDJtX2NoYW5n
ZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgsDQo+Pj4+ICAg
ICAgICAgICAgZ290byBvdXQ7DQo+Pj4+ICAgICAgICB9DQo+Pj4+DQo+Pj4+IC0gICAgLyogQ2hl
Y2sgaG9zdCBwMm0gaWYgbm8gdmFsaWQgZW50cnkgaW4gYWx0ZXJuYXRlICovDQo+Pj4+IC0gICAg
aWYgKCAhbWZuX3ZhbGlkKG1mbikgKQ0KPj4+PiAtICAgIHsNCj4+Pj4gLSAgICAgICAgbWZuID0g
X19nZXRfZ2ZuX3R5cGVfYWNjZXNzKGhwMm0sIGdmbl94KG9sZF9nZm4pLCAmdCwgJmEsDQo+Pj4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQMk1fQUxMT0MsICZwYWdlX29y
ZGVyLCAwKTsNCj4+Pj4gKyAgICBpZiAoICFtZm5fdmFsaWQobWZuKSB8fCAodCAhPSBwMm1fcmFt
X3J3ICYmIGNvcGllZF9mcm9tX2hvc3RwMm0pICkNCj4+Pg0KPj4+IElzIHRoaXMgY2hlY2sgY29y
cmVjdD8gV2h5IGRvIHlvdSB3YW50IHRvIGdldCBvdXQgb25seSB3aGVuIHR5cGUgaXMNCj4+PiBu
b24tcncgKmFuZCogaXQncyBjb3BpZWQgZnJvbSB0aGUgaG9zdHAybT8gWW91IGNvdWxkIGhhdmUg
bm9uLXJ3DQo+Pj4gZW50cmllcyBsaWtlIG1taW8gaW4gdGhlIGFsdHAybSB0aGF0IHdlcmUgbGF6
aWx5IGNvcGllZCBhbmQgSSBkb24ndA0KPj4+IHRoaW5rIHdlIHdhbnQgdG8gYWxsb3cgcmVtYXBw
aW5nIHRvIHRob3NlIGVpdGhlci4NCj4+DQo+PiBJIGp1c3QgY29waWVkIHRoZSBmdW5jdGlvbmFs
aXR5LiBJZiB0aGlzIGlzIG5lZWRlZCBJIHdpbGwgYWRkIGEgfHwgdCAhPQ0KPj4gcDJtX21taW9f
ZG0gYW5kIHAybV9tbWlvX2RpcmVjdC4NCj4gDQo+IE15IHByb2JsZW0gaXMgd2l0aCB0aGUgJiYg
Y29waWVkX2Zvcm1faG9zdHAybSBwYXJ0LiBXaHkgaXMgdGhhdCBhIGNyaXRlcmlhPw0KDQpUaGUg
KHQgIT0gcDJtX3JhbV9ydykgY2hlY2sgd2FzIGRvbmUgb25seSBmb3IgdGhlIGdldCBmcm9tIGhv
c3RwMm0uDQoNCklmIHlvdSB0aGluayB0aGF0IEkgc2hvdWxkIGRvIHRoZSBjaGVjayBmb3IgYWxs
IG1mbnMgKGhvc3RwMiBhbmQgYWx0cDJtKSANCnRoZW4gSSBjYW4gZHJvcCB0aGUgY29waWVkX2Zy
b21faG9zdHAybSBib29sIGFuZCBhZGQgbW1pbyBjaGVjay4NCg0KSSBob3BlIEkgdW5kZXJzdGFu
ZCB0aGUgcHJvYmxlbSBjb3JyZWN0bHkuDQoNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
