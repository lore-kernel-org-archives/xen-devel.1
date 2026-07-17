Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC90FC44507
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 06:02:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364643.1615666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkbeF-0003k9-7M; Fri, 17 Jul 2026 06:02:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364643.1615666; Fri, 17 Jul 2026 06:02:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkbeF-0003k2-3i; Fri, 17 Jul 2026 06:02:11 +0000
Received: by outflank-mailman (input) for mailman id 1364643;
 Fri, 17 Jul 2026 06:02:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wkbeC-0003jw-Rw
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 06:02:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkbeC-009vBH-7V
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 08:02:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a59c557-5cb7-0a2a0a5109dd-0a2a4503e41c-32
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 08:02:07 +0200
Received: from [40.107.74.82]
 (helo=OS0P286CU010.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a59c55a-fae8-0a2a45030019-286b4a52c5d4-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 08:02:04 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYRP286MB4688.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1b0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Fri, 17 Jul
 2026 06:01:59 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 06:01:59 +0000
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
 b=TQldbF6VCQy5ipawgVCXWsug0vEJeSYtHgImIoPtUywSxNmodeOXipLtPapqetkgjRL0kelWkSdDGny8JsyXbkDgazCKJbYmyaFWduP+KKK3RNSJK9vv/qX7hmb3KSepsSJbfEVnHKg8z24/+Rg71n60JiKMP+HR+PApJqjAsPmYVip0saAuwaYzsdPpNRNOAnPeqRigXro2fTXkbsOwJGB7VwLh/1ah+ghAdQVlj1mBCxoUtECbfNrIsi8s6wUyVAssUZY8zgfUY78/nHNkwQ4710dzEVI7Y01rrW1vg8yEhz6eWi+L+9lE5Y6SjUz2yYBWEyD/GHV2uO7Y7amUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVeqx5bqHC1m86JR2w9nU597L7rl0iqQ3jF2E/MLGXQ=;
 b=SyKhCB5KR3dJ++tkEXzxsC7qiJio5D8rcW14Z26B40pjrfk4hBLlPcGuuFW3fdixmuVJ/6EdRNRs5eQCm29GPIAH21QlkSvBPZ5xIkNuUl9X7h0LVKJtUewNMj9HxgfouiSNOvDv+AGLKePtS9M3bL2/lJQhD4edFZlx3zbwkwvp4Bxxo0TtS5bJhYHb8ykyF7kSX+4LrP0d+s9Gu7kgZJqv+QSPe2mXJmtHRea3UyKvLZoj+TTw3inh5VhYP6ruCkZPoFWhsgWnvMB7f+JVuq+sIVSBblAiVEfhrRkvlXXKRwIG9ECi59MNzioxIDUqi78iL5QDCDko0E9HApScYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVeqx5bqHC1m86JR2w9nU597L7rl0iqQ3jF2E/MLGXQ=;
 b=oEesq9YUh8L1nrrXCPBBXHH6MVQEIa2SiGSqurLL0OrZBVvHXa8yJ1dL1Y11YkQ1be/LLATDRDOdHktHvECrMtI6Rv86iyGDS5OeHr85YcxP+aMvU/kvmG3ObV5FaeW0lTbFXFQpnT/aJwyXdcDEdgbcVTtpuwsc3Cu42Vuoadc=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Topic: [PATCH v6 5/5] xen/acpi: Parse PPTT to initialize CPU topology
Thread-Index: AQHdE336EabuJxSEHUSo4bExE1f467ZwQwuAgAD1uqA=
Date: Fri, 17 Jul 2026 06:01:59 +0000
Message-ID:
 <OS9P286MB7222DD373E8894ED9E53B53882C62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-6-taka@valinux.co.jp>
 <df837a87-7cab-4da6-94e1-cf017960209e@suse.com>
In-Reply-To: <df837a87-7cab-4da6-94e1-cf017960209e@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYRP286MB4688:EE_
x-ms-office365-filtering-correlation-id: 5a423f97-32d8-4eb8-8fd7-08dee3c8ea2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|7416014|1800799024|38070700021|10067099003|22082099003|56012099006|4143699003|18002099003;
x-microsoft-antispam-message-info:
 3atv1Q/Glp8qNqp8Q5AT6ewDYH7Yy09UrsHUWaRcMiWFchVYhvNVgQYZt+sMfEFugSkLTiMtsPhiGlaW31WkrAXot96h5/fwArjy723fXHi/YuWKgd0vCPFKcI6Ta/SXsPWC0+RL7OMJR6seF41qxJTOmbUOLplJzq+JtewybJKsBYrfOyyrm65w0aSJCMT/qmr0Pb6/YE9oGZktmiN9dSrt8qQNdrQV83DxcnPn1mCiNg+ZORyfrGFEkS8gzZh2rVkRNY9BPHEH4rH6OksFK8tPQpZ4PUVOYnT6b3g/8ZFwfw6Dp2UA706L5r+9xewLOMAtULSTDuO+lQRdRfliPd40n70MkwFQYuWBnQzVBXvEMgPJd6+4mITSKl3OD7w15bEJYL1SoLL15CVp8iA250ObIzoWrL+XK0vsqRCV5Lg3n5tk9ghAjYNpB+eLpHcrA4rGVODMjlgP8uJlW5Mdnh4bpHcnwCTg1HkCKblJ+ut3BscdZUZobJfdxWuahFvkIaO9aeuFn8uAe2ZCH7OV7OOB4WCsYcBvLpeo3JlaibOCeEFQm7PhH8lrQjt5+veyJ0F+x1Xbapg0lvEVbgdziBYGtvHU9EYBi5cPrGuW0YvW/n47VByicyiOQzVk5n7FeBvteAmQ1tnsscEajNVEghdPvT9oo0dYb9F1Wf2lXQ5WpBU7X3w8JAxwMkQ9EbAPo1YpvpbOYbyy7H6WgbZ7mA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(7416014)(1800799024)(38070700021)(10067099003)(22082099003)(56012099006)(4143699003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1hrTVJGRFRIV01LSnJDYTRUR3NqYXdIb2owOVRvYjkrRWpGSGRZYTNGSVJl?=
 =?utf-8?B?NU1pTEJhd0ZhK3VLRUZId3NzY25nMHZIRnZCcEI4ZGRMT0FPeXNOOHYwRVBM?=
 =?utf-8?B?STRQZ2U4U2MrZzRleDR1S3N1R2NTa2RuZlU2SGxnVVlJV2RVOFQwRDJ6c0VE?=
 =?utf-8?B?dVJVSXUxaCtOSUlieHRFVFRuWndOM0FFVDhXaTFxQVVPY0hhTVRwaTcyRE9V?=
 =?utf-8?B?bU1TL2tOWkRob1BZUE1IRmpOOUVaWEpuT1h2N3ZKZExwNzE3Yi9odG5pdFoy?=
 =?utf-8?B?UTlLU1hIWm80RFV3ZlJzaVluTC9vdXVvRGd4SUFSd0pBK21NSDY5R3FWeHZs?=
 =?utf-8?B?YVNLbE9NWjRiMkVqdCtxYXlBSnNkRlVOWFhEWkhoWVdhMGhNUGROOUcxMlYw?=
 =?utf-8?B?UkV5Q1huaE41dVk0SUNOVHo1L282V3RLRDV3cnQrNmVvNHk5U2k4KzNKYk95?=
 =?utf-8?B?bmp5M2xERktLeC9UQnpuVUJqY3pPcXgxOU9HRG1pZnEzMlpPSStZZzdZL0Iy?=
 =?utf-8?B?cjY3UnVzNy9jc1BGMlNsTFZoOWZSUzczeDRHU09uUlNXejE5SU10L0k4L1VD?=
 =?utf-8?B?RG5pT2RycFE4OGJXWGU0K0pFUklOL2EyWDY5ckNyWWFSRDNnWDd4QyszOHIy?=
 =?utf-8?B?cEo3NlA0bExXcWg2U0NLMlpvT09XbjFLSHY3eXMrbk8wVFNsNk9FTm9MaEhE?=
 =?utf-8?B?MHFjSU1pSkxtaTlTb21vMEJhc0dFTlcxYkNkK1ZZc0gvSUd6czdDSjRCOWN2?=
 =?utf-8?B?S3lUaWl2TmQ3cWt5YTI3NzEyNHp0THR5K3NCcU5vTWNzSFVaemVuVUh0STlW?=
 =?utf-8?B?TWhrVjh5QjRoNGZpWGNMSEk5cWdRditKS0pGby9UWUtndVg3eWtDMnZDdFB0?=
 =?utf-8?B?cFdmaWdhT1NqWXk4WU9ZUnhJOGo2YjN6UzNzRjRFYjRUMlRkWG90a2dvV0ll?=
 =?utf-8?B?OXFRNFZLUjZtWXBNVGpKaGJiYlIySWVFbTZPSTJ1REFvZ0J5UVlkUnBCVC9j?=
 =?utf-8?B?akxtVXRENjdUVzZCVDBES2JWd3YvcEdFeWZhdjJNYWFUQ3NYL2ZWSTVnZTNF?=
 =?utf-8?B?Q1hCMEJxMUoxNWlqTnRUR1Y4d1dJenBZQXZGbWtZTXJPa0p0aURZNEJZS2FI?=
 =?utf-8?B?U3Y2VVRJelltVEc2TDltdnl5RTg5cmhYTXZvMjVCVjN5ZEpOZWNFRWh2Z2VY?=
 =?utf-8?B?eCt5cXpTZzJ3cnhXcUJxaGRWbUJ5aFNSRkFTTWZPL1lSVHEwT2lKeDJaY0lD?=
 =?utf-8?B?d29FWlVUcm5TQ2ZXMW42Tm56MWd1Ny9qaE1MTXIyS3NlOUN2SHpROCsxZ3Bl?=
 =?utf-8?B?VHNnK3FFQ0diRUhYYUxaVTZrM1ZwK3JmRVNxRHNVWjljUmI4TkhhdW9RdzRy?=
 =?utf-8?B?djlBNHlHRkZxOS9LYzdiQW14dE9TMnFNYkNQTXAyT25hb2dGdnE2N05lTUYv?=
 =?utf-8?B?MW5nZnhZWWNtK3MxRGJMYlUwbVFQT2FCNU52aERKemozeWxNcmFEU3p1NlNm?=
 =?utf-8?B?Rk1DR1JGZkhWRnZYcmh5cm8rbmQwZVovMFpPMFVGUHd3MTZGUFloS0ErWUo5?=
 =?utf-8?B?VW80LzVQVGhVWTFZWis3OWpSOFQ5b1JQQ3JxMit6NWVMeWZONkhKSnFkNmtR?=
 =?utf-8?B?NEZyZng1UTVXd1I4aDRXeGl1cDhaWENkNG5aNXR2Y3Riemh4Z1lBbHRvalQ5?=
 =?utf-8?B?bnNHQ3VEM1hHV3ZtejB3WlZCQ2c1NUYyazlMNlRGMlJwUW54RWo4SHk5MWd4?=
 =?utf-8?B?dDlFZmNWeW4wT3pOS1B3cmovd2ZSVS9VRWlUZU9sOGJKVDVXcC9iUERjYXdV?=
 =?utf-8?B?TVB1NVpwSjNNVTdFcjBkdSsvRHJoOTVvRk1COUpkNzc5ZHhGNmozdDFETkhP?=
 =?utf-8?B?T2IxREVVbmd1VjBqWkdxYWRjWHVXNVV2anQ4K1VScDIrbmh5L295bDRxZ0pm?=
 =?utf-8?B?OExEZ3laN1V0KzJtZC9MME5EbjBROWNzWG84ZWt0WFJyVGVoVUxGZjJVMTFE?=
 =?utf-8?B?ejlSZlhWM0NvcUZZdjdxUmhuaWJITXJMeEpNTTRGY29qc1hJR01wL2MydkIy?=
 =?utf-8?B?V3Fsbm4wZlVxMmM3UktYRlBKZUdwTHFzanhzRXlLOElKL256QmZnTit5QVAv?=
 =?utf-8?B?MWR1RUcwYjlRVm8vZHZ4VEMrNm82WWJtamN4QmRxdXpnRHJtRmI0b3VOSFFZ?=
 =?utf-8?B?TjZnYzlzYmhJTEJNM3dZZ0pOdlJzbE03Mm03UEhZUFR0Zi93K3RYR2xSR0dj?=
 =?utf-8?B?NjV4ZWJVc2VQUElrY0lXRDYxUytDbUdzZndFWnZHL1Z2VzRmTXlVeTloUWZq?=
 =?utf-8?Q?u2if/Y0hV4uufteyWb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a423f97-32d8-4eb8-8fd7-08dee3c8ea2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 06:01:59.4565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LmJJmCB7EyN0nmuBc7DZ7Jz0QEEKMrHZ85Obox96YEeYMXEp8ZZJnTOW6lcbbCfI9P5iLETIHq+TDlmN37i7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4688
X-purgate-ID: tlsNG-33051d/1784268125-74E874E9-A64FA7B4/0/0
X-purgate-type: clean
X-purgate-size: 3688

SGkgSmFuLA0KDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9wcHR0X3Byb2Nlc3NvciAq
X19pbml0IGZpbmRfcHB0dF9ub2RlKA0KPiA+ICsgICAgY29uc3Qgc3RydWN0IGFjcGlfdGFibGVf
cHB0dCAqcHB0dCwgdWludDMyX3QgYWNwaV9pZCkNCj4gPiArew0KPiA+ICsgICAgY29uc3Qgc3Ry
dWN0IGFjcGlfc3VidGFibGVfaGVhZGVyICplbnRyeTsNCj4gPiArICAgIHVuc2lnbmVkIGxvbmcg
dGFibGVfZW5kOw0KPiA+ICsgICAgY29uc3Qgdm9pZCAqcHRyOw0KPiA+ICsNCj4gPiArICAgIEJV
R19PTighcHB0dCk7DQo+IA0KPiBUaGlzIGJlaW5nIGEgc3RhdGljIGhlbHBlciwgSSBkb24ndCBz
ZWUgYSBuZWVkIGZvciBzdWNoIGEgY2hlY2suDQoNCkkgd2lsbCByZW1vdmUgaXQuDQoNCj4gPiAr
ICAgIHRhYmxlX2VuZCA9ICh1bnNpZ25lZCBsb25nKXBwdHQgKyBwcHR0LT5oZWFkZXIubGVuZ3Ro
Ow0KPiA+ICsNCj4gPiArICAgIHB0ciA9IHBwdHQgKyAxOw0KPiA+ICsNCj4gPiArICAgIHdoaWxl
ICggKHVuc2lnbmVkIGxvbmcpcHRyICsgc2l6ZW9mKHN0cnVjdCBhY3BpX3N1YnRhYmxlX2hlYWRl
cikNCj4gDQo+IFBsZWFzZSBwcmVmZXIgc2l6ZW9mKDxleHByZXNzaW9uPikgb3ZlciBzaXplb2Yo
PHR5cGU+KSB3aGVuZXZlciB0aGVyZSdzIGENCj4gY29ubmVjdGlvbiB0byBhbiBleHByZXNzaW9u
IGluIHVzZSAoZS5nLiBzaXplb2YoKmVudHJ5KSBoZXJlKS4NCg0KT2theSwgSSB3aWxsIGZpeCBp
dC4NCiANCj4gPiArICAgICAgICAgICAgZWxzZSBpZiAoIGxldmVsID09IDAgKQ0KPiA+ICsgICAg
ICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICAg
ICogQUNQSV9QUFRUX1BST0NFU1NPUl9JU19USFJFQUQgaXMgc3VwcG9ydGVkIGluIFBQVFQNCj4g
PiArICAgICAgICAgICAgICAgICAqIHJldmlzaW9uIDIgYW5kIGxhdGVyLiBBc3N1bWUgbm8gdGhy
ZWFkaW5nIHN1cHBvcnQgd2hlbg0KPiA+ICsgICAgICAgICAgICAgICAgICogUFBUVCByZXZpc2lv
biBpcyAxLg0KPiA+ICsgICAgICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgICAgICBp
ZiAoIHByb2MtPmZsYWdzICYgQUNQSV9QUFRUX0FDUElfUFJPQ0VTU09SX0lTX1RIUkVBRCApDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgdGhyZWFkaW5nID0gdHJ1ZTsNCj4gPiArICAgICAgICAg
ICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAgICBjb3JlX2dyb3VwX2tleSA9IG9m
ZnNldDsNCj4gPiArICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICBlbHNlIGlmICggbGV2
ZWwgPT0gMSApDQo+ID4gKyAgICAgICAgICAgIHsNCj4gPiArICAgICAgICAgICAgICAgIGlmICgg
dGhyZWFkaW5nICkNCj4gPiArICAgICAgICAgICAgICAgICAgICBjb3JlX2dyb3VwX2tleSA9IG9m
ZnNldDsNCj4gPiArICAgICAgICAgICAgICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgICAgICAg
ICBjbHVzdGVyX2dyb3VwX2tleSA9IG9mZnNldDsNCj4gDQo+IE1pY2ggbGlrZSB5b3UncmUgb21p
dHRpbmcgYnJhY2VzIGhlcmUsIHlvdSBjYW4gYWxzbyAuLi4NCj4gDQo+ID4gKyAgICAgICAgICAg
IH0NCj4gPiArICAgICAgICAgICAgZWxzZSBpZiAoIGxldmVsID09IDIgJiYgdGhyZWFkaW5nICkN
Cj4gPiArICAgICAgICAgICAgew0KPiA+ICsgICAgICAgICAgICAgICAgY2x1c3Rlcl9ncm91cF9r
ZXkgPSBvZmZzZXQ7DQo+ID4gKyAgICAgICAgICAgIH0NCj4gDQo+IC4uLiBvbWl0IHRoZW0gaGVy
ZS4NCg0KT2theS4NCiANCj4gPiArICAgICAgICAgICAgaWYgKCAhcHJvYy0+cGFyZW50ICkNCj4g
PiArICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+DQo+ID4gLSAgICAgICAgdG9wby0+cGh5c19j
b3JlX2lkID0gY3B1Ow0KPiA+IC0gICAgICAgIHRvcG8tPm51bV9zaWJsaW5ncyA9IDE7DQo+ID4g
KyAgICAgICAgICAgIHByb2MgPSAoY29uc3Qgc3RydWN0IGFjcGlfcHB0dF9wcm9jZXNzb3IgKikN
Cj4gPiArICAgICAgICAgICAgICAgICAgICgoY29uc3Qgdm9pZCAqKXBwdHQgKyBwcm9jLT5wYXJl
bnQpOw0KPiANCj4gTm8gbmVlZCBmb3IgdGhlIG91dGVyIGNhc3Q/DQoNCkkgd2lsbCByZW1vdmUg
dGhlIGNhc3QuDQoNCj4gQW5kIHRoZW4gLSBob3cgZG8geW91IGtub3cgcHJvYy0+cGFyZW50IHBv
aW50cyBpbnNpZGUgdGhlIHRhYmxlPw0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0
Lg0KSSB3aWxsIGFkZCBhIHByb3BlciBib3VuZHMgY2hlY2sgaGVyZS4NCg0KPiA+ICsgICAgICAg
IHRvcG8tPm51bV9zaWJsaW5ncyA9IGNwdW1hc2tfd2VpZ2h0KHRvcG8tPnRocmVhZF9zaWJsaW5n
KTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gK291dDoNCj4gDQo+IE5pdDogTGFiZWxzIGluZGVu
dGVkIGJ5IGF0IGxlYXN0IG9uZSBibGFuayBwbGVhc2UuIFNlZSAuL0NPRElOR19TVFlMRS4NCg0K
T2theSwgSSB3aWxsLg0KDQo+IE90aGVyIGNvbW1lbnRzIChvZiB0aGUgbW9yZSBnZW5lcmFsIGtp
bmQpIGdpdmVuIG9uIGVhcmxpZXIgcGF0Y2hlcyBtYXkgYWxzbw0KPiBhcHBseSBoZXJlLg0KDQpJ
IHdpbGwgdGhvcm91Z2hseSBjaGVjayB0aGlzIHBhdGNoIGFnYWluc3QgdGhlIGdlbmVyYWwgY29t
bWVudHMgZnJvbSBlYXJsaWVyIHBhdGNoZXMgYXMgd2VsbC4NCg0KVGhhbmsgeW91LA0KSGlyb2th
enUgVGFrYWhhc2hpLg0K

