Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF18EC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 16:34:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A5F82146F
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 16:34:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="H/wWf8Ab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A5F82146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEceb-0001qQ-IZ; Thu, 11 Apr 2019 16:34:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sCjs=SN=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hEcea-0001qL-FX
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 16:34:20 +0000
X-Inumbo-ID: a7315e74-5c77-11e9-92d7-bc764e045a96
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4a::60c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7315e74-5c77-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 16:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/E/4uTUHg7lIfblkY+6ogsGpwOJmvcbvy2oNdwrM7c0=;
 b=H/wWf8AbiH18QmlsEaRbnE0yZ55OdAVRqS50061Oww83lvzH6WYlhDvoX1Eay4KJqdbFj4dnwQyWVlxfZGc+mJ8e3XhBfvw6niXRtFv/ciSCDqnRyy0l8t2Buq960uy4wNgsN4IGNkU/A95uUPqHivJUz0F8GLw3aUH/lUtWK4s=
Received: from MWHPR12MB1597.namprd12.prod.outlook.com (10.172.56.10) by
 MWHPR12MB1261.namprd12.prod.outlook.com (10.169.205.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.21; Thu, 11 Apr 2019 16:34:17 +0000
Received: from MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4]) by MWHPR12MB1597.namprd12.prod.outlook.com
 ([fe80::4534:1959:55cb:fad4%6]) with mapi id 15.20.1771.021; Thu, 11 Apr 2019
 16:34:17 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] AMD/IOMMU: disable previously enabled IOMMUs upon init
 failure
Thread-Index: AQHU7f0FRRBqyOHtPkKvTYtbE71TKaY3LNIA
Date: Thu, 11 Apr 2019 16:34:17 +0000
Message-ID: <a4317995-15d6-1110-089f-0b60a56f8667@amd.com>
References: <5CAB2E5F02000078002254F6@prv1-mh.provo.novell.com>
In-Reply-To: <5CAB2E5F02000078002254F6@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN6PR0102CA0020.prod.exchangelabs.com (2603:10b6:805:1::33)
 To MWHPR12MB1597.namprd12.prod.outlook.com
 (2603:10b6:301:10::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0141da4a-301d-46cb-bd96-08d6be9b8a6a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MWHPR12MB1261; 
x-ms-traffictypediagnostic: MWHPR12MB1261:
x-microsoft-antispam-prvs: <MWHPR12MB12615258303F95E59750119CE52F0@MWHPR12MB1261.namprd12.prod.outlook.com>
x-forefront-prvs: 00046D390F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(376002)(366004)(136003)(396003)(199004)(189003)(71190400001)(26005)(81156014)(105586002)(110136005)(7736002)(6512007)(106356001)(71200400001)(316002)(8676002)(14454004)(81166006)(36756003)(476003)(72206003)(52116002)(305945005)(68736007)(31686004)(6486002)(8936002)(53546011)(102836004)(446003)(3846002)(386003)(25786009)(6506007)(6116002)(76176011)(53936002)(2616005)(97736004)(11346002)(31696002)(478600001)(5660300002)(4326008)(186003)(86362001)(6436002)(6246003)(66066001)(229853002)(486006)(256004)(14444005)(2906002)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1261;
 H:MWHPR12MB1597.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Enk291YlzhM+37rdRFlI/hc6jveqCCLuNZqzPzepAWr70RmQQRsD40StVgnyux3bGV4cojAr2Vwyw+mb3NxVCLxvfoNFRibBgfaDaQ+osksjI37H4vejwDoAlBUzM7cA62hjUzTRF9jx0d2KMrSpYidzCCATbbKfkuzBoIeONZZ3ri/H4MNgIvL5/Jlt9FNDIm9Y+ALxdWuKcrSN3ff7xfLdwraPvtLqsv+FosoTAiyIK3oHirFeboHRT3xIMciohv5v5u9aBaDcCclTNpXSR8ULm3qcY3nifOWAcY81HeM9KHEf4SN63+RPgW0efuKj+vOZJlALEr1l2C8WG6RX7uu9wGJYlsxW2LbSMOzbXXKM/HftynIkO3YTJCZYFJFFtFs7zcJ5Teg9AXeFpWoIgGdKFVVdCCDZF+TUq4A1V3U=
Content-ID: <3D53918D8D229543A35A399F8E259954@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0141da4a-301d-46cb-bd96-08d6be9b8a6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2019 16:34:17.5146 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1261
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: disable previously enabled
 IOMMUs upon init failure
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
Cc: "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411163417.4VjACxBd7jvCccj2DxIbltH0gwuqdQ1nN2E8HzRv-WA@z>

T24gNC84LzE5IDY6MTkgQU0sIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBJZiBhbnkgSU9NTVVzIHdl
cmUgc3VjY2Vzc2Z1bGx5IGluaXRpYWxpemVkIGJlZm9yZSBlbmNvdW50ZXJpbmcgZmFpbHVyZSwN
Cj4gdGhlIHN1Y2Nlc3NmdWxseSBlbmFibGVkIG9uZXMgc2hvdWxkIGJlIGRpc2FibGVkIGFnYWlu
IGJlZm9yZSBjbGVhbmluZw0KPiB1cCB0aGVpciByZXNvdXJjZXMuDQo+IA0KPiBNb3ZlIGRpc2Fi
bGVfaW9tbXUoKSBuZXh0IHRvIGVuYWJsZV9pb21tdSgpIHRvIGF2b2lkIGEgZm9yd2FyZA0KPiBk
ZWNsYXJhdGlvbiwgYW5kIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSBzdHJheSBibGFu
ayBsaW5lcyBhaGVhZA0KPiBvZiBib3RoIGZ1bmN0aW9ucycgZmluYWwgY2xvc2luZyBicmFjZXMu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoN
CkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4NCg0KPiAtLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5pdC5jDQo+ICsrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9pbml0LmMNCj4gQEAgLTkwOSw3ICs5MDksMzUgQEAg
c3RhdGljIHZvaWQgZW5hYmxlX2lvbW11KHN0cnVjdCBhbWRfaW9tbQ0KPiAgIA0KPiAgICAgICBp
b21tdS0+ZW5hYmxlZCA9IDE7DQo+ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11
LT5sb2NrLCBmbGFncyk7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIGRpc2FibGVfaW9tbXUo
c3RydWN0IGFtZF9pb21tdSAqaW9tbXUpDQo+ICt7DQo+ICsgICAgdW5zaWduZWQgbG9uZyBmbGFn
czsNCj4gKw0KPiArICAgIHNwaW5fbG9ja19pcnFzYXZlKCZpb21tdS0+bG9jaywgZmxhZ3MpOw0K
PiArDQo+ICsgICAgaWYgKCAhaW9tbXUtPmVuYWJsZWQgKQ0KPiArICAgIHsNCj4gKyAgICAgICAg
c3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsNCj4gKyAgICAgICAg
cmV0dXJuOw0KPiArICAgIH0NCj4gKw0KPiArICAgIGFtZF9pb21tdV9tc2lfZW5hYmxlKGlvbW11
LCBJT01NVV9DT05UUk9MX0RJU0FCTEVEKTsNCj4gKyAgICBzZXRfaW9tbXVfY29tbWFuZF9idWZm
ZXJfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7DQo+ICsgICAgc2V0X2lv
bW11X2V2ZW50X2xvZ19jb250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FCTEVEKTsNCj4g
Kw0KPiArICAgIGlmICggYW1kX2lvbW11X2hhc19mZWF0dXJlKGlvbW11LCBJT01NVV9FWFRfRkVB
VFVSRV9QUFJTVVBfU0hJRlQpICkNCj4gKyAgICAgICAgc2V0X2lvbW11X3Bwcl9sb2dfY29udHJv
bChpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7DQo+ICsNCj4gKyAgICBpZiAoIGFtZF9p
b21tdV9oYXNfZmVhdHVyZShpb21tdSwgSU9NTVVfRVhUX0ZFQVRVUkVfR1RTVVBfU0hJRlQpICkN
Cj4gKyAgICAgICAgc2V0X2lvbW11X2d1ZXN0X3RyYW5zbGF0aW9uX2NvbnRyb2woaW9tbXUsIElP
TU1VX0NPTlRST0xfRElTQUJMRUQpOw0KPiArDQo+ICsgICAgc2V0X2lvbW11X3RyYW5zbGF0aW9u
X2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRElTQUJMRUQpOw0KPiAgIA0KPiArICAgIGlv
bW11LT5lbmFibGVkID0gMDsNCj4gKw0KPiArICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlv
bW11LT5sb2NrLCBmbGFncyk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIF9faW5pdCBk
ZWFsbG9jYXRlX2J1ZmZlcih2b2lkICpidWYsIHVpbnQzMl90IHN6KQ0KPiBAQCAtMTA0Niw2ICsx
MDc0LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGFtZF9pb21tdV9pbml0X2NsZWFudQ0KPiAgICAg
ICAgICAgbGlzdF9kZWwoJmlvbW11LT5saXN0KTsNCj4gICAgICAgICAgIGlmICggaW9tbXUtPmVu
YWJsZWQgKQ0KPiAgICAgICAgICAgew0KPiArICAgICAgICAgICAgZGlzYWJsZV9pb21tdShpb21t
dSk7DQo+ICAgICAgICAgICAgICAgZGVhbGxvY2F0ZV9yaW5nX2J1ZmZlcigmaW9tbXUtPmNtZF9i
dWZmZXIpOw0KPiAgICAgICAgICAgICAgIGRlYWxsb2NhdGVfcmluZ19idWZmZXIoJmlvbW11LT5l
dmVudF9sb2cpOw0KPiAgICAgICAgICAgICAgIGRlYWxsb2NhdGVfcmluZ19idWZmZXIoJmlvbW11
LT5wcHJfbG9nKTsNCj4gQEAgLTEyOTcsMzYgKzEzMjYsNiBAQCBlcnJvcl9vdXQ6DQo+ICAgICAg
IHJldHVybiByYzsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCBkaXNhYmxlX2lvbW11KHN0
cnVjdCBhbWRfaW9tbXUgKmlvbW11KQ0KPiAtew0KPiAtICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7
DQo+IC0NCj4gLSAgICBzcGluX2xvY2tfaXJxc2F2ZSgmaW9tbXUtPmxvY2ssIGZsYWdzKTsNCj4g
LQ0KPiAtICAgIGlmICggIWlvbW11LT5lbmFibGVkICkNCj4gLSAgICB7DQo+IC0gICAgICAgIHNw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11LT5sb2NrLCBmbGFncyk7DQo+IC0gICAgICAgIHJl
dHVybjsNCj4gLSAgICB9DQo+IC0NCj4gLSAgICBhbWRfaW9tbXVfbXNpX2VuYWJsZShpb21tdSwg
SU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7DQo+IC0gICAgc2V0X2lvbW11X2NvbW1hbmRfYnVmZmVy
X2NvbnRyb2woaW9tbXUsIElPTU1VX0NPTlRST0xfRElTQUJMRUQpOw0KPiAtICAgIHNldF9pb21t
dV9ldmVudF9sb2dfY29udHJvbChpb21tdSwgSU9NTVVfQ09OVFJPTF9ESVNBQkxFRCk7DQo+IC0N
Cj4gLSAgICBpZiAoIGFtZF9pb21tdV9oYXNfZmVhdHVyZShpb21tdSwgSU9NTVVfRVhUX0ZFQVRV
UkVfUFBSU1VQX1NISUZUKSApDQo+IC0gICAgICAgIHNldF9pb21tdV9wcHJfbG9nX2NvbnRyb2wo
aW9tbXUsIElPTU1VX0NPTlRST0xfRElTQUJMRUQpOw0KPiAtDQo+IC0gICAgaWYgKCBhbWRfaW9t
bXVfaGFzX2ZlYXR1cmUoaW9tbXUsIElPTU1VX0VYVF9GRUFUVVJFX0dUU1VQX1NISUZUKSApDQo+
IC0gICAgICAgIHNldF9pb21tdV9ndWVzdF90cmFuc2xhdGlvbl9jb250cm9sKGlvbW11LCBJT01N
VV9DT05UUk9MX0RJU0FCTEVEKTsNCj4gLQ0KPiAtICAgIHNldF9pb21tdV90cmFuc2xhdGlvbl9j
b250cm9sKGlvbW11LCBJT01NVV9DT05UUk9MX0RJU0FCTEVEKTsNCj4gLQ0KPiAtICAgIGlvbW11
LT5lbmFibGVkID0gMDsNCj4gLQ0KPiAtICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmlvbW11
LT5sb2NrLCBmbGFncyk7DQo+IC0NCj4gLX0NCj4gLQ0KPiAgIHN0YXRpYyB2b2lkIGludmFsaWRh
dGVfYWxsX2RvbWFpbl9wYWdlcyh2b2lkKQ0KPiAgIHsNCj4gICAgICAgc3RydWN0IGRvbWFpbiAq
ZDsNCj4gDQo+IA0KPiANCj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
