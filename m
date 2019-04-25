Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC9AC43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:26:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60260206A3
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 20:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="GncTdtZq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60260206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJkws-0001d7-1p; Thu, 25 Apr 2019 20:26:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nzHz=S3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJkwq-0001ch-8e
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 20:26:24 +0000
X-Inumbo-ID: 635a1c08-6798-11e9-843c-bc764e045a96
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.84]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 635a1c08-6798-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 20:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector1-arm-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZeD+6xRdIyLQ8VHHpKovXJk1FhYUzkvQBZwsAcK8sU=;
 b=GncTdtZqFivoj5X7AgPMleLzt0LrqQ6c4u9Adpy0BM9d7iGc69qJEwxZQHo5k2RWaNeT0dC9497GGWo3lJ8IVW1VmLV8JXp+Lc0dkJqnUT6mZTka0IfMgEB1Av/fRWZbzXsmXUUleZ/VMyYYRb1tUyO2tJpUIA3VsdIJjr+NjrQ=
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com (52.134.93.144) by
 AM0PR08MB3809.eurprd08.prod.outlook.com (20.178.23.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Thu, 25 Apr 2019 20:26:07 +0000
Received: from AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769]) by AM0PR08MB3139.eurprd08.prod.outlook.com
 ([fe80::59ea:42fc:c79f:8769%4]) with mapi id 15.20.1835.010; Thu, 25 Apr 2019
 20:26:07 +0000
From: Julien Grall <Julien.Grall@arm.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
Thread-Index: AQHU9UcnyVubJCtdykOUERdgNrrMCKZNNxSAgAAolIA=
Date: Thu, 25 Apr 2019 20:26:07 +0000
Message-ID: <8bcf25e7-3c7a-b61d-6caf-a11eaf68a232@arm.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-2-julien.grall@arm.com>
 <52b107e1-fa03-54aa-3b64-3bba7104661b@gmail.com>
In-Reply-To: <52b107e1-fa03-54aa-3b64-3bba7104661b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0106.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::22) To AM0PR08MB3139.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Julien.Grall@arm.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b46ac229-5ed5-46d9-e8f1-08d6c9bc3f4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:AM0PR08MB3809; 
x-ms-traffictypediagnostic: AM0PR08MB3809:
x-ms-exchange-purlcount: 1
nodisclaimer: True
x-microsoft-antispam-prvs: <AM0PR08MB380901F7E27506FF0AAC9900803D0@AM0PR08MB3809.eurprd08.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(396003)(39860400002)(366004)(376002)(199004)(189003)(486006)(99286004)(446003)(11346002)(476003)(2616005)(72206003)(966005)(6116002)(44832011)(14454004)(3846002)(508600001)(6246003)(53546011)(6506007)(36756003)(316002)(110136005)(8676002)(386003)(54906003)(76176011)(97736004)(8936002)(81166006)(81156014)(25786009)(14444005)(256004)(4326008)(52116002)(102836004)(186003)(26005)(31696002)(6512007)(5660300002)(229853002)(6306002)(86362001)(305945005)(7736002)(53936002)(2906002)(66066001)(66946007)(66556008)(66476007)(64756008)(66446008)(73956011)(71190400001)(6486002)(71200400001)(68736007)(6436002)(31686004)(2501003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR08MB3809;
 H:AM0PR08MB3139.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YvAGx7StBIMe28yNSMrI7vsaT5GXiXBOoB5HJs8dFSWeJNnth5SmjqaEP3rZpINE4R/Mb8em19LLmDZAcPLZ+4ruViyTB9869XEkWI7vV0USoyb+Hs5n+VkaffPk99ZPNJFNltfriNWwuZHd+ILLkCvCjCyTa1EziWIMJhHDvenR+vN+NA2fYVE2YvndHY+CogCcHR73f5pWWomz/n8q6i2sZzi1DEieT+fi4Xmp2AKTJSW9el8QjOhwKadaHU2/nrV0F51QI1QJ7FMubGsr8g2aKbBRxl5Sl+KAlJX0FNbyavIaCKclfnHd378rEdhgsb7YqnOXNrrjVBShk1WCpMQM6qRwFBHv8178ZBU3HlZz/9+o51eWTugvm06iza6F8Tj9jkQFcFW6EV5iWeukpFWHe1q2cuxnneseAeBFV5s=
Content-ID: <E4699218237DFB47A0CBB72524D84042@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b46ac229-5ed5-46d9-e8f1-08d6c9bc3f4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 20:26:07.6161 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3809
Subject: Re: [Xen-devel] [PATCH 1/7] xen/arm: mm: Consolidate setting
 SCTLR_EL2.WXN in a single place
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
Message-ID: <20190425202607.ys6BDRKULIaUyr1B94O0JxXr0-3XqifExXZjByqeugE@z>

SGksDQoNCk9uIDI1LzA0LzIwMTkgMTk6MDAsIEFuZHJpaSBBbmlzb3Ygd3JvdGU6DQo+IA0KPiAN
Cj4gT24gMTcuMDQuMTkgMjA6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IFRoZSBsb2dpYyB0
byBzZXQgU0NUTFJfRUwyLldYTiBpcyB0aGUgc2FtZSBmb3IgdGhlIGJvb3QgQ1BVIGFuZA0KPj4g
bm9uLWJvb3QgQ1BVLiBTbyBpbnRyb2R1Y2UgYSBmdW5jdGlvbiB0byBzZXQgdGhlIGJpdCBhbmQg
Y2xlYXIgVEJMcy4NCj4gcy9UQkwvVExCLw0KPiANCj4+DQo+PiBUaGlzIG5ldyBmdW5jdGlvbiB3
aWxsIGhlbHAgdXMgdG8gZG9jdW1lbnQgYW5kIHVwZGF0ZSB0aGUgbG9naWMgaW4gYQ0KPj4gc2lu
Z2xlIHBsYWNlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+DQo+IA0KPj4gLS0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0vbW0uYyB8IDIyICsr
KysrKysrKysrKysrKy0tLS0tLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vbW0u
YyBiL3hlbi9hcmNoL2FybS9tbS5jDQo+PiBpbmRleCAwMWFlMmNjY2MwLi45M2FkMTE4MTgzIDEw
MDY0NA0KPj4gLS0tIGEveGVuL2FyY2gvYXJtL21tLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9t
bS5jDQo+PiBAQCAtNjAxLDYgKzYwMSwxOSBAQCB2b2lkIF9faW5pdCByZW1vdmVfZWFybHlfbWFw
cGluZ3Modm9pZCkNCj4+IMKgwqDCoMKgwqAgZmx1c2hfeGVuX2RhdGFfdGxiX3JhbmdlX3ZhKEJP
T1RfRkRUX1ZJUlRfU1RBUlQsIA0KPj4gQk9PVF9GRFRfU0xPVF9TSVpFKTsNCj4+IMKgIH0NCj4+
ICsvKg0KPj4gKyAqIEFmdGVyIGJvb3QsIFhlbiBwYWdlLXRhYmxlcyBzaG91bGQgbm90IGNvbnRh
aW4gbWFwcGluZyB0aGF0IGFyZSBib3RoDQo+PiArICogV3JpdGFibGUgYW5kIGVYZWN1dGFibGVz
Lg0KPj4gKyAqDQo+PiArICogVGhpcyBzaG91bGQgYmUgY2FsbGVkIG9uIGVhY2ggQ1BVIHRvIGVu
Zm9yY2UgdGhlIHBvbGljeS4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgdm9pZCB4ZW5fcHRfZW5mb3Jj
ZV93bngodm9pZCkNCj4gQ291bGQgaXQgYmUgaW5saW5lPw0KDQpXaHkgY2FuJ3Qgd2UgbGV0IHRo
ZSBjb21waWxlciBkZWNpZGluZyBmb3IgdXM/IFRoZSBtb3JlIHRoYXQgaW5saW5lIGlzIA0KcHJl
dHR5IGJyb2tlbi4gU2VlOg0KDQpodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9sb2NhbC9pbmxp
bmUuaHRtbA0KDQo+IA0KPj4gK3sNCj4+ICvCoMKgwqAgV1JJVEVfU1lTUkVHMzIoUkVBRF9TWVNS
RUczMihTQ1RMUl9FTDIpIHwgU0NUTFJfV1hOLCBTQ1RMUl9FTDIpOw0KPj4gK8KgwqDCoCAvKiBG
bHVzaCBldmVyeXRoaW5nIGFmdGVyIHNldHRpbmcgV1hOIGJpdC4gKi8NCj4+ICvCoMKgwqAgZmx1
c2hfeGVuX3RleHRfdGxiX2xvY2FsKCk7DQo+PiArfQ0KPj4gKw0KPj4gwqAgZXh0ZXJuIHZvaWQg
c3dpdGNoX3R0YnIodWludDY0X3QgdHRicik7DQo+PiDCoCAvKiBDbGVhciBhIHRyYW5zbGF0aW9u
IHRhYmxlIGFuZCBjbGVhbiAmIGludmFsaWRhdGUgdGhlIGNhY2hlICovDQo+PiBAQCAtNzAyLDEw
ICs3MTUsNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9wYWdldGFibGVzKHVuc2lnbmVkIGxvbmcgDQo+
PiBib290X3BoeXNfb2Zmc2V0KQ0KPj4gwqDCoMKgwqDCoCBjbGVhcl90YWJsZShib290X3NlY29u
ZCk7DQo+PiDCoMKgwqDCoMKgIGNsZWFyX3RhYmxlKGJvb3RfdGhpcmQpOw0KPj4gLcKgwqDCoCAv
KiBGcm9tIG5vdyBvbiwgbm8gbWFwcGluZyBtYXkgYmUgYm90aCB3cml0YWJsZSBhbmQgZXhlY3V0
YWJsZS4gKi8NCj4+IC3CoMKgwqAgV1JJVEVfU1lTUkVHMzIoUkVBRF9TWVNSRUczMihTQ1RMUl9F
TDIpIHwgU0NUTFJfV1hOLCBTQ1RMUl9FTDIpOw0KPj4gLcKgwqDCoCAvKiBGbHVzaCBldmVyeXRo
aW5nIGFmdGVyIHNldHRpbmcgV1hOIGJpdC4gKi8NCj4+IC3CoMKgwqAgZmx1c2hfeGVuX3RleHRf
dGxiX2xvY2FsKCk7DQo+PiArwqDCoMKgIHhlbl9wdF9lbmZvcmNlX3dueCgpOw0KPj4gwqAgI2lm
ZGVmIENPTkZJR19BUk1fMzINCj4+IMKgwqDCoMKgwqAgcGVyX2NwdSh4ZW5fcGd0YWJsZSwgMCkg
PSBjcHUwX3BndGFibGU7DQo+PiBAQCAtNzc3LDkgKzc4Nyw3IEBAIGludCBpbml0X3NlY29uZGFy
eV9wYWdldGFibGVzKGludCBjcHUpDQo+PiDCoCAvKiBNTVUgc2V0dXAgZm9yIHNlY29uZGFyeSBD
UFVTICh3aGljaCBhbHJlYWR5IGhhdmUgcGFnaW5nIGVuYWJsZWQpICovDQo+PiDCoCB2b2lkIG1t
dV9pbml0X3NlY29uZGFyeV9jcHUodm9pZCkNCj4+IMKgIHsNCj4+IC3CoMKgwqAgLyogRnJvbSBu
b3cgb24sIG5vIG1hcHBpbmcgbWF5IGJlIGJvdGggd3JpdGFibGUgYW5kIGV4ZWN1dGFibGUuICov
DQo+PiAtwqDCoMKgIFdSSVRFX1NZU1JFRzMyKFJFQURfU1lTUkVHMzIoU0NUTFJfRUwyKSB8IFND
VExSX1dYTiwgU0NUTFJfRUwyKTsNCj4+IC3CoMKgwqAgZmx1c2hfeGVuX3RleHRfdGxiX2xvY2Fs
KCk7DQo+PiArwqDCoMKgIHhlbl9wdF9lbmZvcmNlX3dueCgpOw0KPj4gwqAgfQ0KPj4gwqAgI2lm
ZGVmIENPTkZJR19BUk1fMzINCj4+DQo+IA0KPiBXaXRoIG1pbm9yIG5vdGVzLA0KPiANCj4gUmV2
aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+DQoNClRoYW5r
IHlvdSENCg0KQ2hlZXJzLA0KDQotLSANCkp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
