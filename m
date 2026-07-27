Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43F3C531C9
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 23:18:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371973.1619387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woUaK-0000Yf-0Z; Mon, 27 Jul 2026 23:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371973.1619387; Mon, 27 Jul 2026 23:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woUaJ-0000YX-T0; Mon, 27 Jul 2026 23:18:11 +0000
Received: by outflank-mailman (input) for mailman id 1371973;
 Mon, 27 Jul 2026 23:18:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1woUaH-0000YR-VI
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 23:18:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woUaF-00Csau-0t
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 01:18:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a67e710-e002-0a2a0a5209dd-0a2a45019cbc-10
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 01:18:06 +0200
Received: from [52.101.228.142]
 (helo=OS0P286CU011.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a67e72b-5984-0a2a45010019-3465e48e2d81-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 01:18:05 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS7P286MB6971.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 23:17:59 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 23:17:59 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=valinux.co.jp header.i="@valinux.co.jp" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySFg5Wijlbjxsmepnd0525jY3hVsA2k6WrzREFFcBjOIs2Od0CHlx060OsevMMn912HEulxlgsAY7pCONPIUGwXKaKbcla5Phs0U5lOCJy84p4JzKIo9OJc3h4Dg2eQf/eoriV6yXXoY52GrNOqoYvg3tfOLZPq+1Yw1M7AeGp4YWLp4oueZGiy9Dy80g+Vnu0YcHWbv9BqZ1+Y+4u1vLrxqi4Bxo2aJtklOq3wJlXyt3S55Z9VLjhetS/C+Fun2WebUpII8aYWhRnweFHkBob0nencZyOQsCm7/tO4yUNz5ulEMbMwNow+lLmCH8qNcm3G2YeRanEXox0beQq1ONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfJzogbwymaJ9OrHrtkVra8sDWWYllqiXZClkRHUJ4k=;
 b=kBcY4hV9vVoYwK9UTu6gSWxy28WxLqeMKPIe1YMVOpRnjGhpqGkubUqvyKrBouWNe153DORvx2KHUFAxJFd4yXVSA606mo/ruszjmG/igD7WlAbU6gyT+2ExthYsN5aufSy0prD/lCEn+kuhCEs/ycrw+kOVZcavEh/4fe1xDm/Xop2Lj5f5iK03peLq8DvksZcw/6AyBoAAOFv/GcCe0Tx2TZXF4qRE84UKQaNUvBozL/ZJQf5zfY7tfUCRN8B0nFvKAtt2pjTh4yjLdpeFbi6FSEGPnVnEVXTaSn4DOp8Ww3sBdauJa/yqeogGuPRvQhBz3YpDEoWzFczA1bgn4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfJzogbwymaJ9OrHrtkVra8sDWWYllqiXZClkRHUJ4k=;
 b=WnxuVGHWJEdJeZDyDglTHQ+2OBzZezTSg24wHvCBa5b0hVtwMBAEk8YfXHOvqh+uHpxL0eIoycj+m5/7VcVDPwC4Mo6WNFIoDgyPuagsc7hDTU4pOWBb2NOaLDp7eaObbX9Kr5etXlZsMcwzyhAWQLLt6oY1VgbQTK5Wp/AtEvg=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v8 4/4] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Topic: [PATCH v8 4/4] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Index: AQHdHJl7CqbIatZ8bkec5VHVmdD2PraBVbMAgACjEnA=
Date: Mon, 27 Jul 2026 23:17:59 +0000
Message-ID:
 <OS9P286MB72224026B966691F365263AC82CC2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260726005517.379267-1-taka@valinux.co.jp>
 <20260726005517.379267-5-taka@valinux.co.jp>
 <7b7eec76-2d9d-4a08-8f63-4b3da321d5fa@suse.com>
In-Reply-To: <7b7eec76-2d9d-4a08-8f63-4b3da321d5fa@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS7P286MB6971:EE_
x-ms-office365-filtering-correlation-id: 0e3b401b-7ac9-4390-e565-08deec354c8d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|38070700021|4143699003|10067099003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 thsyW620Ib7o7UUTT/dU2GbgXNG3rbTSkA4xnVLNi8wBCPy2P3vg05o7I8jaY+xEC5+JmE4ZQkoapGcCcb3W955v2iB3Qi5ehJDknwgtq5yIQi+5hH5qAPFvDwJP+kPFScBhlvL85sFENUx6v2kNy8iwagP6X2xKARNCHPmDZ1VPGL1jdM7PN2u48RA4+NpdEY/Oy5vqjKSHSxflgEGkCKyO6oU90biIPppIVsf9RTkrAbNxfTkIatVm3CPYjaJq+4ho3IdF3woRouMUDjVeBhw4Q4dkvQB4v9HdWyv2BVRt9/QL6NE5eeIO6ujs24MJ7ooyWGXzh/iNu9iARle8qB32TE7VSgEiIS3j1DZE6vAfxEZ5XHoHO5v7OA3P8OnSj60CZMhUztrKidjQIJxIVC8+sLrZWSleNppprjx0ltR8KhlSxgzL1cMjZXa6zreS+l41wq4DHkrKoH2TWhQIYnZ/jgRlZtisC/Vl+xrhjpYkLKUw0Oqm7LElhPpXVnKGPg8eO/2XPpOW0j4KaxQSDrwxX8nRKR1fbIPCrJzDPcmFQm5ZipFK4Oqo571QpMylVKiNp+fkNRSlAl0keCPb7HoMnhkFTk8r7S8YB/6nC1SwWk8cEwRv7hXLP3cDJUU23LCWtUe/lzgiAeZcjClzhVtWT6851xWWspVt6tcxchnh0myXBO0q1FdCiGb+rjQcma+1RGIEbKXBRcOjtkOfgA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(38070700021)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d21oNXpHZnMrOHRheUc3VEJrZkJFblFOSk9NdlRSTS9CTWhjTVpDRi9tdHpu?=
 =?utf-8?B?OFA3TkNaTXNyY1dkd2hjTHBFa0FRVzVJN2ZIKzR0WGJnem1MOGtIS01KdXNp?=
 =?utf-8?B?THpUdzFKZVFCN2xHMmg0WTFCZ01XU0ViVHYyYXZ5NTVpTkhOWlZzSkIxYTdO?=
 =?utf-8?B?UkQ3alo0OHE1R3RVMmRJVVl4MXdKcG85LzNCbm9tMndnN2k5QU14K3N0bkRK?=
 =?utf-8?B?Qi9OTnV2YTArNFI3dEF5ckp1SFhURHNkVEJMQkRkbzdOWE9Od2ZBVmxkSytV?=
 =?utf-8?B?c2szc3d3NTVNa3BJSjVnQTI2Kzk2SUxLZm4wUWcwVi85WGhMenNMSjY4cklF?=
 =?utf-8?B?aWV1dlVheE9DVlEvbjJVSTd4VlM0NzZ6MXJvb0xXVVRVU2NLd1FDOS9vdGJ1?=
 =?utf-8?B?RnowRVhFbUhJbFZqanlWUDBaV3BqTUFmc2R3MEwreHduaVMrTmJQQ3ZBUGJa?=
 =?utf-8?B?NW9qcjVSZ0ZmaVFiS0Z6THVEeGtBZit6WUk0OGcwcklCdCtMcWpVL3Z4QVZX?=
 =?utf-8?B?cEMzR2J1bXhWWEp5ZDRkaXNJMjlKbnhkM2tKdUY5czNFd1BONjVtTmVsQjhr?=
 =?utf-8?B?UVJOOTRkVFhIL2srK2JIY3RCOUE4VFIvQ0sydU5RNVJISjV2dFU0U0srSEpE?=
 =?utf-8?B?RjlnMS9uVHM5bnc4am1PUEk4d0x0VHhGMnlNR2JxUWUzZm4wNGhLVklPNDRH?=
 =?utf-8?B?SUZCUXc4MlNta2xFbVZNcXF4ZUh3TW4vajdEOENmejNjSEcwbjdoQUtmSGNY?=
 =?utf-8?B?U2pxMnNDV3QrTFRoZzIwY0ttcnUvbnBXWUpMa1VPWVZ6YjE2bXg0N3RZckto?=
 =?utf-8?B?cFZEaVJwaFdkMmxoT2VFRElyQzM2d1VPY1hYdEJpSzdZd2ptTFQ5d1diM25a?=
 =?utf-8?B?K2JJWGUwcDJRTVViQWJ5ZmV3bXdlbi81aWZCSGNJWTRTcFR1TTZCbGVlZDhL?=
 =?utf-8?B?YTVRV0FmdXBMRGFZRmord1lZSnQvNW0xVEhjN214OVh3SUV0V0dRbitYT3F0?=
 =?utf-8?B?dWIwUEJ0anNiNUd6RHB5b3VDT1Bwak1nZUh3RjViNTRGcG1CbjEyRFVtSFoy?=
 =?utf-8?B?UnlyeWUzMVJNVFo3em5MN2FKbFlRS2srbnkwSXhqbnI2VEszSG9VTEJHYnRr?=
 =?utf-8?B?ZG45MjRsMFNlZFhvWWxwbHRLMWZzRWRCbjhNUmNRNWNrL21kWHI4WjVJblV4?=
 =?utf-8?B?RnJKNTJLTGsrTXJUMThvZElUVTB1ZEEycDFLQlU4Q3JjbTV2ellpeE0vM3Iw?=
 =?utf-8?B?UVJDMjhWU2RiMTFFdFQ1cm9jcVV3am1zTFRJOVdOdTJLaC8rTURGckUyUVA1?=
 =?utf-8?B?cmg4YjIzTTJ6bEdURlZsSlYzUmJqSW00OTFObitSVGM1c2FoUkxHSTN1UStK?=
 =?utf-8?B?SHVPM1FlKzVOczdaM3JleWxUU3AvN3lUOU0zZko2NTZTMmlEdGxvZld2Nk9S?=
 =?utf-8?B?K1ZsSGdxSXN2bm9WOFVRVG1kMWJ5Y0lKRXVIelJQa2F3RWdQc1pZTSthSUV4?=
 =?utf-8?B?cElteGVqb2NXT2cvaXQyRTNWdkxFc3NrU3lrUCt3R1crSHg0eWZXcElwQUsz?=
 =?utf-8?B?TUFmZllWMitnY21uNTBFTnZxekV6dWEwWHRXWm0wLzU4NFJpWEh6bklOYVpI?=
 =?utf-8?B?b2lOcXMzR1VKamVsNmt5VGJodlo1V3R0Qkt1NEZjVVBheVYyWXRYS3JrT0h1?=
 =?utf-8?B?emRxYWZVVXZYUms2aWMyN0kzVm5lUEgyV0daT0pDODVocmI5SUNaQWJqL0xo?=
 =?utf-8?B?aitmVjVDVTNja1ZsKyt3M2lLMWcyQWxlYzZ0WjZ6L0o1aS9IQ012aVF5THp1?=
 =?utf-8?B?djRzY0dIWldSYlp2T0E3MVRvbDhHdGhoVndlUlNuMGNwRVZIZ3hpSnRPL2Fi?=
 =?utf-8?B?Y2x5bTNoaTBuSFYzRTZhZDhlKzBQc0VDTzNXR3I2cFN3b1BIR0JINEh0bmRK?=
 =?utf-8?B?K0FHeDJsYnY4dWhCMmx4a2Q5UmJWUTE2MVMyNmVWbXFaUCtqRzVUU2xpeEZM?=
 =?utf-8?B?RVhGOG4wTG1PMTU0d1lZZWVkRCtMdkM5YmZIR2s3VnhUU3BFZCsxRlpzNDZ6?=
 =?utf-8?B?dXJKbnpwVGM2R2licVlYai94bHcybDJkdHFYdW5uUWkyamtZOHJsd241ZWtI?=
 =?utf-8?B?QUlSYXZyTDZMdWJmQ3pvNFFZd3hMdlJIZjJ6VkdnbmtQL2REQ3pVdGRJZjky?=
 =?utf-8?B?Vkk5bHdHS2xQVUhmTzk5c0Z4ellCYU9wTG5rZVdndWlUeTNIZWw2ZU5OTEVP?=
 =?utf-8?B?TnhvTXB6WWhIM29PeVRwVElJZFo5S0l6dlg3R0JGSk56ZG5BeUtlenVjMG1U?=
 =?utf-8?Q?CSOdTWn7Bzjb0Lmsv3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3b401b-7ac9-4390-e565-08deec354c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2026 23:17:59.4920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hWB64Fg62UQdrIDjOVQ9RrFTmv2oIWO2QduPlRCbBuZ9z1a/krHBo9BKLM0dSOQX+mVKBp+ki4iktw02in+ywQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6971
X-purgate-ID: tlsNG-d62444/1785194286-1E465757-E65B9B3E/0/0
X-purgate-type: clean
X-purgate-size: 4530

SGkgSmFuLA0KDQo+ID4gKyAgICB0YWJsZV9zaXplID0gc2l6ZW9mKCpwcm9jKQ0KPiA+ICsgICAg
ICAgICsgKHVuc2lnbmVkIGxvbmcpcHJvYy0+bnVtYmVyX29mX3ByaXZfcmVzb3VyY2VzICogc2l6
ZW9mKHVpbnQzMl90KTsNCj4gDQo+IC4uLiBob2xkcyBmb3IgYWxsIGJpbmFyeSBvcGVyYXRvcnMs
IGkuZS4gYWxzbyB0aGUgKyBoZXJlLiBJbmRlbnRhdGlvbiBvZiB0aGUNCj4gY29udGludWluZyBs
aW5lIHdvdWxkIGFsc28gYmV0dGVyIGJlDQoNCk9rYXksDQoNCj4gICAgIHRhYmxlX3NpemUgPSBz
aXplb2YoKnByb2MpICsNCj4gICAgICAgICAgICAgICAgICAodW5zaWduZWQgbG9uZylwcm9jLT5u
dW1iZXJfb2ZfcHJpdl9yZXNvdXJjZXMgKiBzaXplb2YodWludDMyX3QpOw0KPiANCj4gV2hlcmUg
SSdkIHRoZW4gc3RpbGwgcXVlc3Rpb24gdGhlIG5lZWQgZm9yIHRoZSBjYXN0OiBUaGUgb3BlcmF0
aW9uIGlzLCBhZmFpY3QsDQo+IHRoZSBzYW1lIHdpdGggaXQgZHJvcHBlZCwgYm90aCBpbiBJTFAz
MiBhbmQgTFA2NCBtb2RlbHMuIFdpdGggb25lIGV4Y2VwdGlvbiAtDQo+IHRoZXJlIGlzIGFuIG92
ZXJmbG93IHBvdGVudGlhbGx5IGdldHRpbmcgaW4gdGhlIHdheSwgYnV0IHRoZSBjYXN0IGhlbHBz
IHdpdGgNCj4gdGhhdCBvbmx5IGluIExQNjQuIFF1ZXN0aW9uIGlzIHdoZXRoZXIgdG9vIGxhcmdl
IGEgLT5udW1iZXJfb2ZfcHJpdl9yZXNvdXJjZXMNCj4gd291bGRuJ3QgYmV0dGVyIGJlIHJlamVj
dGVkIHVuaWZvcm1seSBhcyBwcmVzdW1hYmx5IGJvZ3VzLg0KDQpJIHdpbGwgYWRkIGNvZGUgdG8g
Y2hlY2sgaWYgdGhlIG51bWJlciBvZiBwcml2YXRlIHJlc291cmNlcyBmaXRzIHdpdGhpbiB0aGUg
bGltaXQgDQpkZXJpdmVkIGZyb20gdGhlIG1heGltdW0gc3VidGFibGUgc2l6ZSAoMjU1IGJ5dGVz
KS4NCg0KPiA+ICsNCj4gPiArICAgIGlmICggcHJvYy0+aGVhZGVyLmxlbmd0aCA8IHRhYmxlX3Np
emUgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJBQ1BJOiBQ
UFRUIHByb2Nlc3NvciBub2RlIGxlbmd0aCBpbnZhbGlkXG4iKTsNCj4gPiArICAgICAgICByZXR1
cm4gZmFsc2U7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIHRydWU7DQo+ID4g
K30NCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9wcHR0X3Byb2Nlc3NvciAq
X19pbml0IGZpbmRfcHB0dF9ub2RlKA0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGFjcGlfdGFibGVf
cHB0dCAqcHB0dCwgdWludDMyX3QgYWNwaV9pZCkNCj4gPiArew0KPiA+ICsgICAgY29uc3Qgc3Ry
dWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICplbnRyeTsNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcg
dGFibGVfZW5kID0gKHVuc2lnbmVkIGxvbmcpcHB0dCArIHBwdHQtPmhlYWRlci5sZW5ndGg7DQo+
ID4gKyAgICBjb25zdCB2b2lkICpwdHIgPSBwcHR0ICsgMTsNCj4gPiArDQo+ID4gKyAgICB3aGls
ZSAoICh1bnNpZ25lZCBsb25nKXB0ciArIHNpemVvZigqZW50cnkpIDw9IHRhYmxlX2VuZCApDQo+
ID4gKyAgICB7DQo+ID4gKyAgICAgICAgZW50cnkgPSBwdHI7DQo+ID4gKw0KPiA+ICsgICAgICAg
IGlmICggIXZlcmlmeV9zdWJ0YWJsZShlbnRyeSwgcHB0dCkgKQ0KPiA+ICsgICAgICAgICAgICBi
cmVhazsNCj4gPiArDQo+ID4gKyAgICAgICAgaWYgKCBlbnRyeS0+dHlwZSA9PSBBQ1BJX1BQVFRf
VFlQRV9QUk9DRVNTT1IgKQ0KPiA+ICsgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgY29uc3Qg
c3RydWN0IGFjcGlfcHB0dF9wcm9jZXNzb3IgKnByb2M7DQo+ID4gKw0KPiA+ICsgICAgICAgICAg
ICBwcm9jID0gY29udGFpbmVyX29mKGVudHJ5LCBjb25zdCBzdHJ1Y3QgYWNwaV9wcHR0X3Byb2Nl
c3NvciwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZWFkZXIpOw0KPiAN
Cj4gSGF2ZSB0aGlzIGJlIHRoZSBpbml0aWFsaXplciBvZiB0aGUgdmFyaWFibGU6DQo+IA0KPiAg
ICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYWNwaV9wcHR0X3Byb2Nlc3NvciAqcHJvYyA9DQo+ICAg
ICAgICAgICAgICAgICBjb250YWluZXJfb2YoZW50cnksIGNvbnN0IHN0cnVjdCBhY3BpX3BwdHRf
cHJvY2Vzc29yLCBoZWFkZXIpOw0KDQpPay4NCg0KPiA+ICsgICAgZm9yX2VhY2hfcG9zc2libGVf
Y3B1KGNwdSkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICB1aW50MzJfdCBhY3BpX2lkID0gbWFw
X2NwdV9hY3BpaWRbY3B1XTsNCj4gDQo+IFlvdSBtYXkgZW5kIHVwIHJlYWRpbmcgSU5WQUxJRF9B
Q1BJSUQgaGVyZS4gVGhlbiAuLi4NCj4gDQo+ID4gKyAgICAgICAgc3RydWN0IGNwdV90b3BvbG9n
eSAqdG9wbyA9ICZjcHVfdG9wb2xvZ3lbY3B1XTsNCj4gPiArICAgICAgICBjb25zdCBzdHJ1Y3Qg
YWNwaV9wcHR0X3Byb2Nlc3NvciAqcHJvYzsNCj4gPiArICAgICAgICB1bnNpZ25lZCBpbnQgbGV2
ZWw7DQo+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IGNvcmVfZ3JvdXBfa2V5ID0gMDsNCj4gPiAr
ICAgICAgICB1bnNpZ25lZCBpbnQgY2x1c3Rlcl9ncm91cF9rZXkgPSAwOw0KPiA+ICsgICAgICAg
IHVuc2lnbmVkIGludCBzb2NrZXRfZ3JvdXBfa2V5ID0gMDsNCj4gPiArICAgICAgICBib29sIHRo
cmVhZGluZyA9IGZhbHNlOw0KPiA+ICsNCj4gPiArICAgICAgICBwcm9jID0gZmluZF9wcHR0X25v
ZGUocHB0dCwgYWNwaV9pZCk7DQo+IA0KPiAuLi4gYSBib2d1cyB0YWJsZSBlbnRyeSB3aXRoIHRo
YXQgSUQgd291bGQgYmUgZm91bmQgaGVyZSwgcG90ZW50aWFsbHkgZm9yDQo+IG11bHRpcGxlIHZh
bHVlcyBvZiAiY3B1Ii4NCg0KVW5kZXJzdG9vZCwgSSB3aWxsIGFkZCBjb2RlIHRvIGVuc3VyZSAn
YWNwaV9pZCcgaXMgdmFsaWQuDQoNCj4gPiArICAgICAgICAgICAgLyoNCj4gPiArICAgICAgICAg
ICAgICogSWYgdGhpcyBwcm9jIGhhcyBubyBwYXJlbnQgbm9kZSwgaXQgaXMgdGhlIHJvb3Qgbm9k
ZS4gVHJlYXQgaXQNCj4gPiArICAgICAgICAgICAgICogYXMgZXF1aXZhbGVudCB0byBhbiBBQ1BJ
X1BQVFRfUEhZU0lDQUxfUEFDS0FHRSBub2RlLg0KPiA+ICsgICAgICAgICAgICAgKi8NCj4gPiAr
ICAgICAgICAgICAgaWYgKCBwcm9jLT5mbGFncyAmIEFDUElfUFBUVF9QSFlTSUNBTF9QQUNLQUdF
IHx8ICFwcm9jLT5wYXJlbnQgKQ0KPiANCj4gWW91IHNheSBpbiB0aGUgcmV2bG9nIHRoYXQgeW91
IGFkZGVkIHBhcmVudGhlc2VzLCBidXQgYXQgbGVhc3QgaGVyZSB5b3UNCj4gZGlkbid0Lg0KDQpP
b3BzLCBJIHdpbGwgZml4IGl0Lg0KDQpUaGFuayB5b3UsDQpIaXJva2F6dSBUYWthaGFzaGkuDQoN
Cg0K

