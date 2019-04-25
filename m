Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D91C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:37:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C4620717
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="jmTqTpEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C4620717
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJl7i-0002gw-LW; Thu, 25 Apr 2019 20:37:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJl7h-0002gr-N5
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:37:37 +0000
X-Inumbo-ID: f55af802-6799-11e9-843c-bc764e045a96
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::61f])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f55af802-6799-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veRS1jYampT8LOLEyHIJ5HDarpThOLPObxGcZiG7+2M=;
 b=jmTqTpExekcc2qAfz9UuOgptRFSoqh6MCi3kXV7WHqNYg2GodtsF2ad4eEWcu4N2L6yA8nsiqYcXQ3OsxntCilLXESVkZiLCIImsqO2MtURpitEjAyPoHApwvdO6h1BrBe6ovOrNN+Xq5OwMkGW+t2rpi7cKG5W4P2a5pRTOono=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB5011.eurprd08.prod.outlook.com (10.255.29.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Thu, 25 Apr 2019 20:37:23 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 20:37:23 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
Thread-Index: AQHU9Ucoly8jRHqRM0CEE6wUBhLDeqZNNxgAgAArtoA=
Date: Thu, 25 Apr 2019 20:37:23 +0000
Message-ID: <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
In-Reply-To: <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0394.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::22) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f079584-8421-4a8e-091a-08d6c9bdd22c
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB5011; 
x-ms-traffictypediagnostic: AM0PR08MB5011:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB5011571712E985C0BC5A0169803D0@AM0PR08MB5011.eurprd08.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(376002)(39860400002)(366004)(396003)(189003)(199004)(8936002)(305945005)(81166006)(81156014)(8676002)(7736002)(476003)(36756003)(97736004)(2501003)(71200400001)(316002)(73956011)(99286004)(486006)(52116002)(44832011)(6306002)(6512007)(64756008)(66946007)(66476007)(66556008)(66446008)(110136005)(2616005)(31696002)(446003)(86362001)(11346002)(71190400001)(54906003)(102836004)(6506007)(26005)(186003)(386003)(256004)(4326008)(229853002)(53546011)(6246003)(66066001)(6436002)(6486002)(508600001)(966005)(14454004)(72206003)(31686004)(25786009)(68736007)(53936002)(5660300002)(76176011)(2906002)(6116002)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB5011;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IFxripktu2etOF17MJKCqvztN9LcwvStnNAsGrBHplnXdhSGuLrjd979359zxW2S3sjwxK1HnSZFj8/d/gY6eW1FJ3hqmi4t3tF8puIaJ5gxjPIdPhzigpjf6LeZWv+JxdnTRCj22LP6PG4OSm0PMXJPSzMrXfWtWfkO41cBeuWsbfyTgaNT34gq7b6zkJpFL9Lda4522C2quA7jrhQXkBFwhOs5hKe+XEMvbBv3tqHvxkvtgdjBkdo6lppke++BLtczUbC9iOtsp+mKrarXKAYcCraAFLQad9WQrEQi0p2s7zSUtR3gKx4ItvtEE6AaSZ4d0+pSQp/yltqCCZvRjEfKVf4Z9tSdYNAzlJf1N9yRXlSPKXna6CidH7hoWbaTQaayLTQ6T6qghDklN5RsNAV9Hv17Q0YDo4DKHuYmqxk=
Content-ID: <69ECB937477153489888F1846BD85137@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f079584-8421-4a8e-091a-08d6c9bdd22c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 20:37:23.3898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5011
Subject: Re: [Xen-devel] [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
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
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425203723.1OhAm8W7eGDyENnNH57n17ywSgGnEvytUVEeWEzgCSI@z>

DQoNCk9uIDI1LzA0LzIwMTkgMTk6MDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IEhlbGxvIEp1
bGllbiwNCg0KSGksDQoNCj4gT24gMTcuMDQuMTkgMjA6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4+IFRoZSBmdW5jdGlvbiBmbHVzaF94ZW5fdGV4dF90bGJfbG9jYWwoKSBoYXMgYmVlbiBtaXN1
c2VkIGFuZCB3aWxsIHJlc3VsdA0KPj4gdG8gaW52YWxpZGF0ZSB0aGUgaW5zdHJ1Y3Rpb24gY2Fj
aGUgbW9yZSB0aGFuIG5lY2Vzc2FyeS4NCj4+DQo+PiBGb3IgaW5zdGFuY2UsIHRoZXJlIGFyZSBu
byBuZWVkIHRvIGludmFsaWRhdGUgdGhlIGluc3RydWN0aW9uIGNhY2hlIGlmDQo+PiB3ZSBhcmUg
c2V0dGluZyBTQ1RMUl9FTDIuV1hOLg0KPj4NCj4+IFRoZXJlIGFyZSBlZmZlY3RpdmVseSBvbmx5
IG9uZSBjYWxsZXIgKGkuZSBmcmVlX2luaXRfbWVtb3J5KCkgd291bGQNCj4+IHdobyBuZWVkIHRv
IGludmFsaWRhdGUgdGhlIGluc3RydWN0aW9uIGNhY2hlLg0KPj4NCj4+IFNvIHJhdGhlciB0aGFu
IGtlZXBpbmcgYXJvdW5kIHRoZSBmdW5jdGlvbiBmbHVzaF94ZW5fdGV4dF90bGJfbG9jYWwoKQ0K
Pj4gYXJvdW5kLCByZXBsYWNlIGl0IHdpdGggY2FsbCB0byBmbHVzaF94ZW5fdGxiX2xvY2FsKCkg
YW5kIGV4cGxpY2l0ZWx5DQo+PiBmbHVzaCB0aGUgY2FjaGUgd2hlbiBuZWNlc3NhcnkuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4NCj4+
IC0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL21tLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAxNyArKysrKysrKysrKysrKy0tLQ0KPj4gwqAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0z
Mi9wYWdlLmggfCAyMyArKysrKysrKystLS0tLS0tLS0tLS0tLQ0KPj4gwqAgeGVuL2luY2x1ZGUv
YXNtLWFybS9hcm02NC9wYWdlLmggfCAyMSArKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+IMKgIDMg
ZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgMzMgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9tbS5jIGIveGVuL2FyY2gvYXJtL21tLmMNCj4+IGlu
ZGV4IDkzYWQxMTgxODMuLmRmYmUzOWM3MGEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
bW0uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL21tLmMNCj4+IEBAIC02MTAsOCArNjEwLDEyIEBA
IHZvaWQgX19pbml0IHJlbW92ZV9lYXJseV9tYXBwaW5ncyh2b2lkKQ0KPj4gwqAgc3RhdGljIHZv
aWQgeGVuX3B0X2VuZm9yY2Vfd254KHZvaWQpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIFdSSVRF
X1NZU1JFRzMyKFJFQURfU1lTUkVHMzIoU0NUTFJfRUwyKSB8IFNDVExSX1dYTiwgU0NUTFJfRUwy
KTsNCj4+IC3CoMKgwqAgLyogRmx1c2ggZXZlcnl0aGluZyBhZnRlciBzZXR0aW5nIFdYTiBiaXQu
ICovDQo+PiAtwqDCoMKgIGZsdXNoX3hlbl90ZXh0X3RsYl9sb2NhbCgpOw0KPj4gK8KgwqDCoCAv
Kg0KPj4gK8KgwqDCoMKgICogVGhlIFRMQnMgbWF5IGNhY2hlIFNDVExSX0VMMi5XWE4uIFNvIGVu
c3VyZSBpdCBpcyBzeW5jaHJvbml6ZWQNCj4+ICvCoMKgwqDCoCAqIGJlZm9yZSBmbHVzaGluZyB0
aGUgVExCcy4NCj4gSSdtIG5vdCBzdXJlIGFib3V0IHRoZSBjb21tZW50IGFib3ZlLCBpdCBsb29r
cyBhIGJpdCBjb25mdXNpbmcgdG8gbWUuDQo+IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nIGZsdXNo
aW5nIFRMQiBpcyBjYWxsZWQgdG8gcmVtb3ZlIGNhY2hlZCBlbnRyaWVzIA0KPiB0b2dldGhlciB3
aXRoIGNhY2hlZCBTQ1RMUl9FTDIuV1hOLg0KPiBBbmQgaXNiIGJlZm9yZSB0byB0bGIgZmx1c2gg
ZW5zdXJlcyB0aGF0IFdYTiBpcyBzZXQgcHJpb3IgdG8gZmx1c2ggc28gDQo+IHRoYXQgYWxsIG5l
dyBUTEIgZW50cmllcyB3aWxsIGJlIGZldGNoZWQNCj4gd2l0aCB0aGlzIGZsYWcgc2V0Lg0KDQpU
aGUgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIGhvdyBJ
IGNhbiBpbXByb3ZlIA0KdGhlIGNvbW1lbnQuDQoNClRvIGJlIGhvbmVzdCwgSSBhbSBub3QgZW50
aXJlbHkgc3VyZSB3aGV0aGVyIHRoZSBpc2IoKSBpcyBuZWNlc3NhcnkgDQpoZXJlLiBBdCB3b3Jz
dCwgYW4gZW50cnkgb2YgYW4gZXhpc3RpbmcgbWFwcGluZ3MgaXMgbm90IGNhY2hlZCB3aXRoIHRo
ZSANClNDVExSX0VMMi5XWE4gc2V0LiBUaGlzIG1heSBvbmx5IGRlZmVyIHRoZSBwcm9ibGVtIGlz
IGFuIGVudHJ5IGlzIA0KaW5jb3JyZWN0bHkgY29uZmlndXJlZCBiZWZvcmUgdGhlIGZsdXNoLiBU
aGlzIGlzIGRvbmUgZWFybHkgYXQgYm9vdCAoYW5kIA0Kd2lsbCBiZSBkb25lIG11Y2ggZWFybGll
ciBpbiBbMV0pLiBTbyBJIGFtIGtpbmQgb2YgdGVtcHRlZCB0byBkcm9wIHRoZSANCmlzYigpIGhl
cmUuDQoNClsuLi5dDQoNCj4gV2l0aCBtaW5vciBub3RlcywNCj4gDQo+IFJldmlld2VkLWJ5OiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPg0KPiANCg0KVGhhbmsgeW91IQ0K
DQpDaGVlcnMsDQoNClsxXSANCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAxOS0wNC9tc2cwMTY2Ny5odG1sDQoNCg0KLS0gDQpKdWxpZW4gR3Jh
bGwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
