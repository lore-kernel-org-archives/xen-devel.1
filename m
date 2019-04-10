Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07219C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 08:19:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7694206B6
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 08:19:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=bitdefender.onmicrosoft.com header.i=@bitdefender.onmicrosoft.com header.b="UYfAUdIh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7694206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hE8Rn-0005iV-NG; Wed, 10 Apr 2019 08:19:07 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+r/1=SM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hE8Rm-0005iO-14
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 08:19:06 +0000
X-Inumbo-ID: 4d0db795-5b69-11e9-92d7-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::710])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4d0db795-5b69-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI3NGcnpQ3Ef9v1NFsaA9snp5k5plZokqkCYOVyQRo8=;
 b=UYfAUdIhH0QcMDwbCPhQJXU1wquNae9I/scdHNDGJ3pwLsrXJwpoAzHSEgCyIa51/z9+Z7AGMx9Hu7S8/N861nZ9FOpCkN81DMKRqmYBJKtJshhM3hv+60UmZsLoI1tmXFrk8tfEhASJxaAeD60MzideyFQdTDozYTXxFJGnrTo=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB2813.eurprd02.prod.outlook.com (10.171.102.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Wed, 10 Apr 2019 08:19:00 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dcda:38be:3bd6:14f1%9]) with mapi id 15.20.1771.016; Wed, 10 Apr 2019
 08:19:00 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "Paul.Durrant@citrix.com" <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v5] x86/mm: Clean up p2m_finish_type_change return value
Thread-Index: AQHU5i3vDniTb5BnO0Gz8DdTvSv4Q6Y1H7qA
Date: Wed, 10 Apr 2019 08:19:00 +0000
Message-ID: <15301326-a19d-0744-585d-9a1377c4f864@bitdefender.com>
References: <20190329124940.24091-1-aisaila@bitdefender.com>
In-Reply-To: <20190329124940.24091-1-aisaila@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM5P190CA0035.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:206:14::48) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bc50f3f-eba3-44c8-ed2b-08d6bd8d2f25
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB2813; 
x-ms-traffictypediagnostic: VI1PR0202MB2813:|VI1PR0202MB2813:
x-microsoft-antispam-prvs: <VI1PR0202MB28137C7889326463787FE7D0AB2E0@VI1PR0202MB2813.eurprd02.prod.outlook.com>
x-forefront-prvs: 00032065B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(376002)(136003)(346002)(39860400002)(366004)(189003)(199004)(52116002)(486006)(3846002)(31696002)(110136005)(316002)(186003)(102836004)(6116002)(2906002)(97736004)(71200400001)(86362001)(71190400001)(2201001)(25786009)(66066001)(53936002)(68736007)(386003)(76176011)(14444005)(446003)(105586002)(256004)(476003)(106356001)(6512007)(6246003)(54906003)(26005)(229853002)(6506007)(11346002)(2501003)(14454004)(305945005)(81166006)(31686004)(81156014)(36756003)(53546011)(99286004)(2616005)(6486002)(8936002)(8676002)(478600001)(6436002)(7736002)(5660300002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2813;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6bbpFpARE9kQZhExhzDeBkSUv2d6m/iyie5TvKgRIROOaImoCOXQQK1rKdI7lQ4Ma+nr648nh3mhpm0nW9zNoVs6fWP45f2FoT1Gcr1/yG/GtqvZUWZAQABUPosHyi5wUX8LBCRxvFvDMAdpAsuYDi+H/mmJv3PsBMMYNzCbUq9Hi+Z58VQZyvyyIp+5w51nL+U7ZkYQwzfUNXdV0ZtC9xvOZW2E5FvEm8KTldwfORKm8yme13vvwXzNCI77GfChJd/EhSDQZubL5s/oPYlugGQbsnB7r/8XwsIhZggvcSotwv8RTDVjRaSJDwD0OaSLgu4UGZPzF7z4SrO/y0zqyoSpSZ884BU9gPh9M64KU7idMC7mIMh1BBQpQeBsOwL0lTNf2AogWPyWPpWVAYRJXlDcwqIBi1vFamYYomczXEo=
Content-ID: <D0600AEAF9BF964F9D91B45A577FD7E4@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc50f3f-eba3-44c8-ed2b-08d6bd8d2f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2019 08:19:00.3760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2813
Subject: Re: [Xen-devel] [PATCH v5] x86/mm: Clean up p2m_finish_type_change
 return value
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410081900.Uy-VHyR-dMQV8lnW7qpzcIQEA0OI9k8mCrkgldweFFc@z>

Um9nZXIvUGF1bCBhcmUgeW91IG9rIHdpdGggdGhlIGxhdGVzdCBjaGFuZ2VzPyBDYW4gdGhpcyBn
byBpbj8NCg0KUmVnYXJkcywNCkFsZXgNCg0KT24gMjkuMDMuMjAxOSAxNDo1MCwgQWxleGFuZHJ1
IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IEluIHRoZSBjYXNlIG9mIGFueSBlcnJvcnMsIGZpbmlz
aF90eXBlX2NoYW5nZSgpIHBhc3NlcyB2YWx1ZXMgcmV0dXJuZWQNCj4gZnJvbSBwMm0tPnJlY2Fs
YygpIHVwIHRoZSBzdGFjayAod2l0aCBzb21lIGV4Y2VwdGlvbnMgaW4gdGhlIGNhc2Ugd2hlcmUN
Cj4gYW4gZXJyb3IgaXMgZXhwZWN0ZWQpOyB0aGlzIGV2ZW50dWFsbHkgZW5kcyB1cCBiZWluZyBy
ZXR1cm5lZCB0byB0aGUNCj4gWEVOX0RPTU9QX21hcF9tZW1fdHlwZV90b19pb3JlcV9zZXJ2ZXIg
aHlwZXJjYWxsLg0KPiANCj4gSG93ZXZlciwgb24gSW50ZWwgcHJvY2Vzc29ycyAoYnV0IG5vdCBv
biBBTUQgcHJvY2Vzc29yKSwgcDJtLT5yZWNhbGMoKQ0KPiBjYW4gYWxzbyByZXR1cm4gJzEnIGFz
IHdlbGwgYXMgJzAnLiAgVGhpcyBjYXNlIGlzIGhhbmRsZWQgdmVyeQ0KPiBpbmNvbnNpc3RlbnRs
eTogZmluaXNoX3R5cGVfY2hhbmdlKCkgd2lsbCByZXR1cm4gdGhlIHZhbHVlIG9mIHRoZSBmaW5h
bA0KPiBlbnRyeSBpdCBhdHRlbXB0cywgZGlzY2FyZGluZyByZXN1bHRzIGZvciBvdGhlciBlbnRy
aWVzOw0KPiBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkgd2lsbCBhdHRlbXB0IHRvIGFjY3VtdWxh
dGUgJzEncywgc28gdGhhdCBpdA0KPiByZXR1cm5zICcxJyBpZiBhbnkgb2YgdGhlIGNhbGxzIHRv
IGZpbmlzaF90eXBlX2NoYW5nZSgpIHJldHVybnMgJzEnOyBhbmQNCj4gZG1fb3AoKSB3aWxsIGFn
YWluIHJldHVybiAnMScgb25seSBpZiB0aGUgdmVyeSBsYXN0IGNhbGwgdG8NCj4gcDJtX2Zpbmlz
aF90eXBlX2NoYW5nZSgpIHJldHVybnMgJzEnLiAgVGhlIHJlc3VsdCBpcyB0aGF0IHRoZQ0KPiBY
RU5fRE1PUF9tYXBfbWVtX3R5cGVfdG9faW9yZXFfc2VydmVyKCkgaHlwZXJjYWxsIHdpbGwgc29t
ZXRpbWVzIHJldHVybg0KPiAwIGFuZCBzb21ldGltZXMgcmV0dXJuIDEgb24gc3VjY2VzcywgaW4g
YW4gdW5wcmVkaWN0YWJsZSBtYW5uZXIuDQo+IA0KPiBUaGUgaHlwZXJjYWxsIGRvY3VtZW50YXRp
b24gZG9lc24ndCBtZW50aW9uIHJldHVybiB2YWx1ZXM7IGJ1dCBpdCdzIG5vdA0KPiBjbGVhciB3
aGF0IHRoZSBjYWxsZXIgY291bGQgZG8gd2l0aCB0aGUgaW5mb3JtYXRpb24gYWJvdXQgd2hldGhl
cg0KPiBlbnRyaWVzIGhhZCBiZWVuIGNoYW5nZWQgb3Igbm90LiAgQXQgdGhlIG1vbWVudCBpdCdz
IGFsd2F5cyAwIG9uIEFNRA0KPiBib3hlcywgYW5kICp1c3VhbGx5KiAxIG9uIEludGVsIGJveGVz
OyBzbyBub3RoaW5nIGNhbiBiZSByZWx5aW5nIG9uIGENCj4gJzEnIHJldHVybiB2YWx1ZSBmb3Ig
Y29ycmVjdG5lc3MgKG9yIGlmIGl0IGlzLCBpdCdzIGJyb2tlbikuDQo+IA0KPiBNYWtlIHRoZSBy
ZXR1cm4gdmFsdWUgb24gc3VjY2VzcyBjb25zaXN0ZW50bHkgJzAnIGJ5IG9ubHkgcmV0dXJuaW5n
DQo+IDAvLUVSUk9SIGZyb20gZmluaXNoX3R5cGVfY2hhbmdlKCkuICBBbHNvIHJlbW92ZSB0aGUg
YWNjdW11bGF0aW9uIGNvZGUNCj4gZnJvbSBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkuDQo+IA0K
PiBTdWdnZXN0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRl
ci5jb20+DQo+IA0KPiAtLS0NCj4gQ2hhbmdlcyBzaW5jZSBWNDoNCj4gCS0gVW5kbyBjaGFuZ2Vz
IGluIHAybS0+cmVjYWxjKCkgYW5kIGhhdmUgMSB0dXJuIGludG8gMCBpbg0KPiAJZmluaXNoX3R5
cGVfY2hhbmdlKCkuDQo+IC0tLQ0KPiAgIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDE2ICsrKysr
LS0tLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLmMNCj4gaW5kZXggYjliYmI4ZjQ4NS4uNTUwOGNlZGM1NSAxMDA2NDQN
Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYw0KPiBAQCAtMTE1OCw3ICsxMTU4LDcgQEAgdm9pZCBwMm1fY2hhbmdlX3R5cGVfcmFuZ2Uo
c3RydWN0IGRvbWFpbiAqZCwNCj4gICAgKiBGaW5pc2ggcDJtIHR5cGUgY2hhbmdlIGZvciBnZm5z
IHdoaWNoIGFyZSBtYXJrZWQgYXMgbmVlZF9yZWNhbGMgaW4gYSByYW5nZS4NCj4gICAgKiBVc2Vz
IHRoZSBjdXJyZW50IHAybSdzIG1heF9tYXBwZWRfcGZuIHRvIGZ1cnRoZXIgY2xpcCB0aGUgaW52
YWxpZGF0aW9uDQo+ICAgICogcmFuZ2UgZm9yIGFsdGVybmF0ZSBwMm1zLg0KPiAtICogUmV0dXJu
czogMC8xIGZvciBzdWNjZXNzLCBuZWdhdGl2ZSBmb3IgZmFpbHVyZQ0KPiArICogUmV0dXJuczog
MCBmb3Igc3VjY2VzcywgbmVnYXRpdmUgZm9yIGZhaWx1cmUNCj4gICAgKi8NCj4gICBzdGF0aWMg
aW50IGZpbmlzaF90eXBlX2NoYW5nZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGZpcnN0X2dmbiwgdW5zaWduZWQgbG9uZyBt
YXhfbnIpDQo+IEBAIC0xMTc0LDkgKzExNzQsOSBAQCBzdGF0aWMgaW50IGZpbmlzaF90eXBlX2No
YW5nZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLA0KPiAgICAgICAgICAgLyoNCj4gICAgICAgICAg
ICAqIGVwdC0+cmVjYWxjIGNvdWxkIHJldHVybiAwLzEvLUVOT01FTS4gcHQtPnJlY2FsYyBjb3Vs
ZCByZXR1cm4NCj4gICAgICAgICAgICAqIDAvLUVOT01FTS8tRU5PRU5ULCAtRU5PRU5UIGlzbid0
IGFuIGVycm9yIGFzIHdlIGFyZSBsb29waW5nDQo+IC0gICAgICAgICAqIGdmbiBoZXJlLg0KPiAr
ICAgICAgICAgKiBnZm4gaGVyZS4gSWYgcmMgaXMgMSB3ZSBuZWVkIHRvIGhhdmUgaXQgMCBmb3Ig
c3VjY2Vzcy4NCj4gICAgICAgICAgICAqLw0KPiAtICAgICAgICBpZiAoIHJjID09IC1FTk9FTlQg
KQ0KPiArICAgICAgICBpZiAoIHJjID09IC1FTk9FTlQgfHwgcmMgPT0gMSApDQo+ICAgICAgICAg
ICAgICAgcmMgPSAwOw0KPiAgICAgICAgICAgZWxzZSBpZiAoIHJjIDwgMCApDQo+ICAgICAgICAg
ICB7DQo+IEBAIC0xMjEzLDE5ICsxMjEzLDEzIEBAIGludCBwMm1fZmluaXNoX3R5cGVfY2hhbmdl
KHN0cnVjdCBkb21haW4gKmQsDQo+ICAgICAgICAgICAgICAgaWYgKCBkLT5hcmNoLmFsdHAybV9l
cHRwW2ldICE9IG1mbl94KElOVkFMSURfTUZOKSApDQo+ICAgICAgICAgICAgICAgew0KPiAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYWx0cDJtID0gZC0+YXJjaC5hbHRwMm1f
cDJtW2ldOw0KPiAtICAgICAgICAgICAgICAgIGludCByYzE7DQo+ICAgDQo+ICAgICAgICAgICAg
ICAgICAgIHAybV9sb2NrKGFsdHAybSk7DQo+IC0gICAgICAgICAgICAgICAgcmMxID0gZmluaXNo
X3R5cGVfY2hhbmdlKGFsdHAybSwgZmlyc3RfZ2ZuLCBtYXhfbnIpOw0KPiArICAgICAgICAgICAg
ICAgIHJjID0gZmluaXNoX3R5cGVfY2hhbmdlKGFsdHAybSwgZmlyc3RfZ2ZuLCBtYXhfbnIpOw0K
PiAgICAgICAgICAgICAgICAgICBwMm1fdW5sb2NrKGFsdHAybSk7DQo+ICAgDQo+IC0gICAgICAg
ICAgICAgICAgaWYgKCByYzEgPCAwICkNCj4gLSAgICAgICAgICAgICAgICB7DQo+IC0gICAgICAg
ICAgICAgICAgICAgIHJjID0gcmMxOw0KPiArICAgICAgICAgICAgICAgIGlmICggcmMgPCAwICkN
Cj4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiAtICAgICAgICAgICAgICAgIH0N
Cj4gLQ0KPiAtICAgICAgICAgICAgICAgIHJjIHw9IHJjMTsNCj4gICAgICAgICAgICAgICB9DQo+
ICAgICAgIH0NCj4gICAjZW5kaWYNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
