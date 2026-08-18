Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 283B7C5DF70
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 08:51:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393759.1632586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFWv-0004E5-Od; Tue, 18 Aug 2026 08:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393759.1632586; Tue, 18 Aug 2026 08:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwFWv-0004Dy-L6; Tue, 18 Aug 2026 08:50:45 +0000
Received: by outflank-mailman (input) for mailman id 1393759;
 Tue, 18 Aug 2026 08:50:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wwFWt-0004DZ-Rc
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 08:50:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwFWt-00EUqE-3B
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 10:50:43 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a841cd6-8faa-0a2a0a5109dd-0a2a450c95c0-16
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:50:42 +0200
Received: from [52.101.125.95]
 (helo=TYVP286CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a841cdf-f479-0a2a450c0019-34657d5f78b8-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 10:50:41 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OS9P286MB6268.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:40c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Tue, 18 Aug
 2026 08:50:37 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 08:50:36 +0000
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
 b=sg7SzwAbZZCghqs3xmmWczjcTetVG3GT4HJNO2g2N0IcmuowXRQvihRBW1CT496uw60J4DPy7JLHaUKDP9SWWCaoeY0VFZzxv8Jl0FDrC5dwliO/fALy2taMgOf6PB/wqZC3AhrP5rOQyGkZKGkuDkt1aZHYrVFQLwB2zkw5L6t7GUiWo+/JkatFtaEHnRn3dpNVkctYtZTVSJ1A+jHdnwLmCPhBsyaZt/ziPbmNUALxoOlKvW5I40x2cOsqc0BfTNRuF7lOrSGK0Csqc43vWe5rp/h/bMqjP8K8ffHWjT2Z1F+M5zyUTwaA8/h8XkuC8tpkRiiIohqsytRHMm1/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbvT8x9zoq0rkWeJWBifYWg2YRUo1eaIi1gYrNArckQ=;
 b=E8KSPIwr4tufivnfkR0K0Wot2BKdcqpuIlB+qQzd8lDcAukl0LHnwTlIVCGE52iQzyZtxINi13pAe/QZFKNxYgng1HrszPxzWF1EQO3T5bZn1xTbISt05r0OIRFc7qjlelI6GrK+z7ChqANpNqdx7eqx/KYmWkrf1tGm8SR/qr6wYuNYH6ZsrsQYvNDPf9ktW0q8Vn6rp3k1eAi2UDbtEBeIeNGpqnL9dtm9P64eWp5crsk0GWttmxEjGiYuh5VZjs0VSKFbEe9KytwXOBWVEWWAjxh1aM5dIdupdz+2ldzNFeByY+tlxLCNGaLLV8jUPtgIjCUwgVc58Ff68fks4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbvT8x9zoq0rkWeJWBifYWg2YRUo1eaIi1gYrNArckQ=;
 b=tO3gnQHVpq6XFg14/s4FtjmU1FFpJL2r3GjgnIhLDVBzOSihvrj2VbpqWBlacUEkzooo+KY3R6tDMM0IT4L7k7vQ3u2+pe83mLzRKog8PFoTuUPSkqRlicN6leafFnGX6QFekJCQHkNs1rZeq5Y/Xjsfd3CIPSq1l18jB774FJw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH v2] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
Thread-Topic: [PATCH v2] xen/arm: Hide PMU registers from the guest, when the
 vPMU feature is disabled.
Thread-Index: AQHdKtQB8xBHNNKUi0aqLwvXe0fRLbah1oEAgAGbhOA=
Date: Tue, 18 Aug 2026 08:50:36 +0000
Message-ID:
 <OS9P286MB722234CE96BB22DD89AC65B082A62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260813032938.3946-1-taka@valinux.co.jp>
 <37b2d119-7ff9-4862-9bcd-acb0b7ff4c9d@amd.com>
In-Reply-To: <37b2d119-7ff9-4862-9bcd-acb0b7ff4c9d@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OS9P286MB6268:EE_
x-ms-office365-filtering-correlation-id: 116cf1e9-8a1d-42b3-1e65-08defd05c5d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|6133799003|38070700021|22082099003|18002099003|10067099003|4143699003|56012099006;
x-microsoft-antispam-message-info:
 iRJ32zHvGfM5UEUb7hvfw8UXY/spM9Rk+4HNCujcADBICWdaFYoYyOeh6ztlWXNSrI18+p8l2wHNu0fVqjG+eJcU1OxIhF73U/A4+dYaaCZMTuRvNC69Gw8YLJ0rQAcB4i4TLtXVoCUAJU7DeqBEnHJ/ATzZk72YTY9H/V+jwSCMOZ7bWnXLrJT25nTflbD5MhusDAt7GLe8XLP5JubQUCIGI5z2uMNftL98Sos0NqE47/NH5wagAcYV4O0AgzswjMhpX1niNa6PIHGulBonBtSojTNUYLFHx5YFYQ2JUki3YV7Zku/FS2+3UMfzgt0hZs4o8UQYrtVsZtNOo6LbQYyuwbfZ9Uw69wBrN9Et8ZbYQOaX+ggzBaDDupbb/0NS/I/GnGsrB6R8NSrfzRAwqYQI9zI0UqlFoJ9SMpQaIpnOnVLqTf/gmKCn+OfW+Idutc7vgD7UIpHvg/YIz1+xyXahuCl7l6fnJQO5H4uYHELemRLw3K0onWdhIm/KonaRCk1ZY8LqweZEk4QVE9gbK7zthW/CGFf+1E5VvAL8N5wFO9Jgwzfw8y8fGTr3jWEAjqXfCLlOKFCfTKJNHIHcDkZX5t3XIjAxuI8KvFQXpBEUD8s/FoL7v1a9lIg10CH9V/D+LzPl4kmMAxT08AyvImkeqbSmVKkRsiUYZFaZAUjmhCl3cfzUKug2v0jslRJ6yO8qnkt3Eg4r7lz8oJxRuskZaRkkJkQIgWQWBXTOsog=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(6133799003)(38070700021)(22082099003)(18002099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T1dPU21QMHlWOGhmZEdFM2hSN0Y3VnN1ZHFhVjM5NmRpVmo2TWVvK1kzcnU5?=
 =?utf-8?B?RjVNQnlKSGpwbWRYRmpTcUZLS0NacE1GR0YzMkVVcnErSlJTZEJuTVZMT29K?=
 =?utf-8?B?NHV4Y3lrWXdQbzVHeEhNMkZqUHhCTGhQUUhpU2RRSmE0Q2pkZ3l4cSs3WnFk?=
 =?utf-8?B?aUY3MnZrZDlOVkM0bC9MVHJlK2UwTnpkTVNQdHl5REZPWXA3ZEM0M2RoL3ls?=
 =?utf-8?B?QXlraktHalBHdTJDOWJSOTVnczJ5anFubkV4YmwrVURHUkp3dy91S3hUdTQ5?=
 =?utf-8?B?U3pjazZTNlh1bTI5VzAzVDQ4Yk9jZkhkTEsrY0FEOVdPUHBjdDhwQ3cvM3M1?=
 =?utf-8?B?QkRibEJlTVdNSnR6ZkNZUHArK3prMXhlNVJBeENrOEZPSEtFbWtBZVh6VVZG?=
 =?utf-8?B?UUNCd0Rra2VwSVVVdzVURmw0TEcrRVU1dElwZ3IzWEdVSnhLVDgvYmtaK2tj?=
 =?utf-8?B?VEV6cnQwSDI3ZmR2Ukp0RHlKQzVXamV3Q2FISWNhV25uTndOMTh4clkxYzcx?=
 =?utf-8?B?RkN3eWZtdHZJcGt2SHh0ZTJjdlNBbUUxeFMrNmlZTzQ2NUlJTDNuWTVTUFVk?=
 =?utf-8?B?SE9kWWFDa3R5TUVLeno1NUk5a1ZqQjRxRHlGMW5YREZXekFPT1NFamo3TDBX?=
 =?utf-8?B?K2ZSRmJLSmtiZFJpZzhrdHdMUDhmM1RtcGZEYUlpc2tFMmhvSmUxdHNncWZz?=
 =?utf-8?B?WGpSM01OdERQUVVpN0dTd2h4K056NGhETWVOT09UcUM3anE5aXBkZDVpRTVM?=
 =?utf-8?B?NjhockZXaE01aFF1WEJSZEpmZUgvSVBIVjdnWER6bmd3YnhCUTJOVzVpbCt0?=
 =?utf-8?B?TlB6eklPVFNwWWtpVlJiK1ZGK3NlWDVZOU9GMnNaTzZPdG1pZmRFR21XajEx?=
 =?utf-8?B?Mkp6WGMwNWNGVVJvdW44V1JRQU5sQnhVWThQOWNZQTZCQzREY3RVYzBaOENy?=
 =?utf-8?B?aGsyNm02T3JpOFZqZHNldUVQWkR5TWVPZHFFU1FEMUZzZ2VaOHZOTUhjZTBT?=
 =?utf-8?B?TDNtWnpIL3lSK0ZIbWJqYXZVNEZkVThtWitPbE9VV1ltSXVxazVCRFVrNWxY?=
 =?utf-8?B?UE9mNDh4ZWVmTVdTMGNTd2UvUnNSMHZ6OFduYm9BaE9TcVhLN0dwQ2VWYkFO?=
 =?utf-8?B?S3ZSNG5OMlJ3REFBS21GSkFmR0VuNldRRVhvRlArT3k4Q0kvWVlTU2tQbHNP?=
 =?utf-8?B?Z2F6ZUp3Tk5jZHNVK0pTL2lHY2UxcVcwdDc2TXJvWnMxRzhia0JFTHpwK2Vy?=
 =?utf-8?B?bUU5Y1hMeDZqSHl4STdnYkVmRHR1aFlmNjVXM1Z2NFU4U2tEVmkwK1NLZUp6?=
 =?utf-8?B?cDB6a29kRDlLS1EwekZZWVREUzY3NGI0c1hXcU9lMmF3SW1leUIwSWgwNGxW?=
 =?utf-8?B?NTVuQ29jazd1UnMxZ3BlcWRsSldWVEhVdzFKVmlIQThWbjNjOE9adDA4L0Zl?=
 =?utf-8?B?MTdJcnRBWFlJL3JJem52SFBQUFRQekYxYmVyWWQ2emVDWkRTZVlHSVF5Ni9o?=
 =?utf-8?B?WkJSMjJpdFh4TFJNb0VYRGRxL1F3Wk1qRUY2SytiWm5vZTVJTjlQR05kNVN5?=
 =?utf-8?B?c0YwaGFuMGZvQi81bFM4WE1LSDdYeE14Uzl4UGxOWVZ5cWNVVHZFZ2VsY0Zk?=
 =?utf-8?B?L1h5ZGNwcVUydU5Vb3k4YnNWNDVnZTBkOHpkYVVtQW51eWMrZU0xQ3lZNCtv?=
 =?utf-8?B?Y2RLYkpuZTNjeS93RVhCZmlQSVBxRS9tWUtkeHlZaEgwR2N4MEMvYnJxT3dk?=
 =?utf-8?B?TTFrc3FQQVZZTisyeExtK0VFQ1BDWVZTTW1oS0hrd3E1WXBpZlh3ZmM4R0E2?=
 =?utf-8?B?YVpwYXVabWpLeitlUFpsZy9ON1U2WDdlMGExVU4wRkJrNzJHKzdjTysyNlRF?=
 =?utf-8?B?OGNRNkJZaStOcEh6REhlQ3RNVS9BMU5wVCt1bHptcFFaTFBIRlJnWWhUcXR4?=
 =?utf-8?B?OXBZQzVFR2NHZkYzOTROWVJaVTVabkM2NE03U0RVMnRBQ0h2dVhvakpWU0FG?=
 =?utf-8?B?alIrcGw0WHFaWlVJTkpxWmxhUlhCa1RLNmNtNFJJUkYrcW5QcVZrODB3SFgz?=
 =?utf-8?B?V3R3MHAzenNNQ2JGVm44aHh0Zy8rK3JIS2Rkcm9IdFMzSWllTEp0Y0VlRkJu?=
 =?utf-8?B?Z3dETjl4MHUwUlpGb04zQ1l1NVJsNHVHalJHT0JaNDlUUjZEekxMRFM0M1l0?=
 =?utf-8?B?Vkd5aVVsbUlKTkZ0TmhpOTZ6Z1BVamVhV2ZkMzlDR29UcytFTXRwRERjdk1n?=
 =?utf-8?B?NXNUbnJjSnU2UVphdVlBd2wzZUN6VGJRNWQ2dDByODBKZTBOZmIyaVdrTjB1?=
 =?utf-8?Q?DSbxVSCyzmDvU4aYM0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 116cf1e9-8a1d-42b3-1e65-08defd05c5d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2026 08:50:36.8700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6pthHj8s9IGnh16eXcD1iORHoTO7k8gdyGwl/3stwi5mumjjC/3si64VnV9vT1pQVKB4+dnsrZIec/7uLUiHAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6268
X-purgate-ID: tlsNG-d25034/1787043042-00CCBA5B-0EFB83F9/0/0
X-purgate-type: clean
X-purgate-size: 7566

SGVsbG8sDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLg0KDQo+ID4gT24gQVJNdjguNC1BIGFu
ZCBuZXdlciBwbGF0Zm9ybXMsIGJvb3RpbmcgRG9tMCBMaW51eCB3aXRoIEFDUEkgZW5hYmxlZA0K
PiA+IGNhdXNlcyB0aGUgZG9tYWluIHRvIHByb2JlIGFkdmFuY2VkIFBNVSBmZWF0dXJlIGJhc2Vk
IG9uIHN5c3RlbSBJRA0KPiA+IHJlZ2lzdGVyIElEX0FBNjRERlIwX0VMMS5EdXJpbmcgdGhpcyBw
cm9iZSwgTGludXggYWNjZXNzZXMgUE1NSVJfRUwxLA0KPiA+IHdoaWNoIGNhdXNlcyB1bmhhbmRs
ZWQgcmVnaXN0ZXIgdHJhcHMgYW5kIGNyYXNoZXMgdGhlIGRvbWFpbi4NCj4gPg0KPiA+IFRvIGFk
ZHJlc3MgdGhpcyBpc3N1ZSwgSSBpbXBsZW1lbnQgdGhlIGZvbGxvd2luZzoNCj4gUGxlYXNlIHVz
ZSB0aGUgaW1wZXJhdGl2ZSBtb29kDQoNCk9rYXkuDQoNCj4gPiAtIEhpZGUgUE1VIHJlZ2lzdGVy
cyBmcm9tIGEgZ3Vlc3QgZG9tYWluIHdoZW4gaXRzIHZQTVUgZmVhdHVyZSBpcw0KPiA+ICAgZGlz
YWJsZWQuDQo+ID4gLSBQcm9hY3RpdmVseSBtYWtlIFNQRSwgVFJCRSwgQlJCRSwgYW5kIFRyYWNl
IEV4dGVuc2lvbnMgaW5hY2Nlc3NpYmxlDQo+ID4gICB0byBndWVzdCBkb21haW5zLCBhcyB0aGV5
IGNvdWxkIHBvdGVudGlhbGx5IGNhdXNlIHNpbWlsYXIgaXNzdWVzLg0KPiA+IC0gQWRkIGVtdWxh
dGlvbiBmb3IgUE1NSVJfRUwxIHJlZ2lzdGVyIGFjY2Vzc2VzIHBlcmZvcm1lZCBieSBhIGd1ZXN0
DQo+ID4gICBkb21haW4gd2hlbiB2UE1VIGlzIGVuYWJsZWQuIEhvd2V2ZXIsIHNpbWlsYXIgdG8g
cmVhZHMgZnJvbSBvdGhlcg0KPiBXaGVuIHZQTVUgaXMgZW5hYmxlZCwgdGhlcmUgaXMgbm8gdHJh
cC9lbXVsYXRpb24NCg0KVW5kZXJzdG9vZC4NCg0KPiA+ICAgUE1VIHJlZ2lzdGVycywgdGhlIHJl
YWQgdmFsdWUgcmV0dXJucyB6ZXJvIChub3RlIHRoYXQgdGhpcyBpcyBhDQo+ID4gICB0ZW1wb3Jh
cnkgaW1wbGVtZW50YXRpb24pLg0KPiA+IC0gRW11bGF0aW9uIGZvciBQTVNTIChQTVUgU25hcHNo
b3QpIHJlZ2lzdGVyIGFjY2Vzc2VzIGlzIG5vdCB5ZXQNCj4gPiAgIGltcGxlbWVudGVkLCBiZWNh
dXNlIFBNU1Mgc3VwcG9ydCBpcyBub3QgYXZhaWxhYmxlIGluDQo+ID4gICBxZW11LXN5c3RlbS1h
YXJjaDY0IGFuZCBjb3VsZCBub3QgYmUgdmVyaWZpZWQuDQo+ID4NCj4gPiBGaXhlczogMDdiOWFj
ZWExMTZlICJ4ZW4vYXJtOiBBZGQgaGFuZGxlciBmb3IgSUQgcmVnaXN0ZXJzIG9uIGFybTY0Ig0K
PiA+IEZpeGVzOiAzNjY5YTFjYjk1OTggInhlbi9hcm06IGNyZWF0ZSBhIGNwdWluZm8gc3RydWN0
dXJlIGZvciBndWVzdCINCj4gRml4ZXMgY29tbWl0IHRpdGxlIG5lZWRzIHRvIGJlIGluIGJyYWNr
ZXRzICgpDQoNCk9rYXkuDQoNCj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvdnN5c3JlZy5j
DQo+ID4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L3ZzeXNyZWcuYw0KPiA+IEBAIC0yMjksNiAr
MjI5LDcgQEAgdm9pZCBkb19zeXNyZWcoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsDQo+ID4g
ICAgICAgKi8NCj4gPiAgICAgIGNhc2UgSFNSX1NZU1JFR19QTUlOVEVOU0VUX0VMMToNCj4gPiAg
ICAgIGNhc2UgSFNSX1NZU1JFR19QTUlOVEVOQ0xSX0VMMToNCj4gPiArICAgIGNhc2UgSFNSX1NZ
U1JFR19QTU1JUl9FTDE6DQo+IFdoYXQgYWJvdXQgQUFyY2gzMiBQTU1JUj8NCg0KT2theSwgSSB3
aWxsIGFkZCBhIHRyYXAgaGFuZGxlciBlbnRyeSBmb3IgQUFyY2gzMiBQTU1JUiByZWdpc3RlciBh
Y2Nlc3Nlcy4NCg0KPiA+IEBAIC0zMDYsNyArMzA3LDYgQEAgdm9pZCBkb19zeXNyZWcoc3RydWN0
IGNwdV91c2VyX3JlZ3MgKnJlZ3MsDQo+ID4gICAgICBHRU5FUkFURV9USUQzX0lORk8oSURfUEZS
MF9FTDEsIHBmcjMyLCAwKQ0KPiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKElEX1BGUjFfRUwx
LCBwZnIzMiwgMSkNCj4gPiAgICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9QRlIyX0VMMSwgcGZy
MzIsIDIpDQo+ID4gLSAgICBHRU5FUkFURV9USUQzX0lORk8oSURfREZSMF9FTDEsIGRiZzMyLCAw
KQ0KPiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0RGUjFfRUwxLCBkYmczMiwgMSkNCj4g
PiAgICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9BRlIwX0VMMSwgYXV4MzIsIDApDQo+ID4gICAg
ICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjBfRUwxLCBtbTMyLCAwKQ0KPiA+IEBAIC0zMjYs
NiArMzI2LDE4IEBAIHZvaWQgZG9fc3lzcmVnKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLA0K
PiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKE1WRlIxX0VMMSwgbXZmciwgMSkNCj4gPiAgICAg
IEdFTkVSQVRFX1RJRDNfSU5GTyhNVkZSMl9FTDEsIG12ZnIsIDIpDQo+ID4NCj4gPiArICAgIGNh
c2UgSFNSX1NZU1JFR19JRF9ERlIwX0VMMToNCj4gWW91IG9ubHkgY292ZXIgQUFyY2g2NC4gV2hh
dCBhYm91dCBBQXJjaDMyIERGUjA/DQoNCk9rYXksIEkgd2lsbCBhbHNvIGFkZCBhIHRyYXAgaGFu
ZGxlciBlbnRyeSBmb3IgaXQuDQogDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgc3RydWN0IGRv
bWFpbiAqZCA9IGN1cnJlbnQtPmRvbWFpbjsNCj4gVXNlIHYtPmRvbWFpbiBpbnN0ZWFkIGxpa2Ug
dGhlIHN1cnJvdW5kaW5nIGNvZGUNCg0KT2theS4NCiANCj4gPiArICAgICAgICB1bmlvbiBjcHVp
bmZvX2RiZzMyIGluZm9fZGJnMzIgPSBkb21haW5fY3B1aW5mby5kYmczMjsNCj4gPiArDQo+ID4g
KyAgICAgICAgaWYgKCAhKGQtPm9wdGlvbnMgJiBYRU5fRE9NQ1RMX0NERl92cG11KSApDQo+ID4g
KyAgICAgICAgICAgIGluZm9fZGJnMzIucGVyZm1vbiA9IDA7DQo+ID4gKw0KPiA+ICsgICAgICAg
IHJldHVybiBoYW5kbGVfcm9fcmVhZF92YWwocmVncywgcmVnaWR4LCBoc3Iuc3lzcmVnLnJlYWQs
IGhzciwgMSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZm9fZGJn
MzIuYml0c1swXSk7DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICAgICAgY2FzZSBIU1JfU1lTUkVH
X0lEX0FBNjRQRlIwX0VMMToNCj4gPiAgICAgIHsNCj4gPiAgICAgICAgICByZWdpc3Rlcl90IGd1
ZXN0X3JlZ192YWx1ZSA9IGRvbWFpbl9jcHVpbmZvLnBmcjY0LmJpdHNbMF07DQo+ID4gQEAgLTM0
OCw3ICszNjAsNiBAQCB2b2lkIGRvX3N5c3JlZyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywN
Cj4gPiAgICAgIH0NCj4gPg0KPiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0FBNjRQRlIx
X0VMMSwgcGZyNjQsIDEpDQo+ID4gLSAgICBHRU5FUkFURV9USUQzX0lORk8oSURfQUE2NERGUjBf
RUwxLCBkYmc2NCwgMCkNCj4gPiAgICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9BQTY0REZSMV9F
TDEsIGRiZzY0LCAxKQ0KPiBXaGF0IGFib3V0IERGUjEgZmllbGRzIGxpa2UgUE1JQ05UUj8gVGhl
eSBzdWZmZXIgZnJvbSB0aGUgc2FtZSBwcm9ibGVtLg0KDQpPa2F5LCBJIHdpbGwgZml4IGl0Lg0K
IA0KPiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0FBNjRJU0FSMF9FTDEsIGlzYTY0LCAw
KQ0KPiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0FBNjRJU0FSMV9FTDEsIGlzYTY0LCAx
KQ0KPiA+IEBAIC0zNTgsNiArMzY5LDIyIEBAIHZvaWQgZG9fc3lzcmVnKHN0cnVjdCBjcHVfdXNl
cl9yZWdzICpyZWdzLA0KPiA+ICAgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0FBNjRBRlIwX0VM
MSwgYXV4NjQsIDApDQo+ID4gICAgICBHRU5FUkFURV9USUQzX0lORk8oSURfQUE2NEFGUjFfRUwx
LCBhdXg2NCwgMSkNCj4gPg0KPiA+ICsgICAgY2FzZSBIU1JfU1lTUkVHX0lEX0FBNjRERlIwX0VM
MToNCj4gUGxlYXNlIGFkaGVyZSB0byB0aGUgb3JkZXIgaW4gd2hpY2ggdGhlIGNhc2VzIHdlcmUg
b3JpZ2luYWxseSBwbGFjZWQNCg0KT2theS4NCg0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIHN0
cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47DQo+ID4gKyAgICAgICAgdW5pb24gY3B1
aW5mb19kYmc2NCBpbmZvX2RiZzY0ID0gZG9tYWluX2NwdWluZm8uZGJnNjQ7DQo+ID4gKw0KPiA+
ICsgICAgICAgIGlmICggIShkLT5vcHRpb25zICYgWEVOX0RPTUNUTF9DREZfdnBtdSkgKQ0KPiBU
byBhdm9pZCBkdXBsaWNhdGlvbiwgcGxlYXNlIGludHJvZHVjZSBpc192cG11X2RvbWFpbg0KDQpP
a2F5LCBJIHdpbGwuDQoNCj4gPiArICAgICAgICB7DQo+ID4gKyAgICAgICAgICAgIGluZm9fZGJn
NjQucG11X3ZlciA9IDA7DQo+ID4gKyAgICAgICAgICAgIGluZm9fZGJnNjQubXRwbXUgPSAwOw0K
PiA+ICsgICAgICAgICAgICBpbmZvX2RiZzY0LnBtc3MgPSAwOw0KPiA+ICsgICAgICAgIH0NCj4g
PiArDQo+ID4gKyAgICAgICAgcmV0dXJuIGhhbmRsZV9yb19yZWFkX3ZhbChyZWdzLCByZWdpZHgs
IGhzci5zeXNyZWcucmVhZCwgaHNyLCAxLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgaW5mb19kYmc2NC5iaXRzWzBdKTsNCj4gPiArICAgIH0NCj4gPiArDQoNCj4gPiBA
QCAtMjE2LDE2ICsyMTYsMTggQEAgc3RydWN0IGNwdWluZm9fYXJtIHsNCj4gPiAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyB0cmFjZV92ZXI6NDsNCj4gPiAgICAgICAgICAgICAgdW5zaWduZWQg
bG9uZyBwbXVfdmVyOjQ7DQo+ID4gICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYnJwczo0Ow0K
PiA+IC0gICAgICAgICAgICB1bnNpZ25lZCBsb25nIF9fcmVzMDo0Ow0KPiA+ICsgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIHBtc3M6NDsNCj4gPiAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyB3
cnBzOjQ7DQo+ID4gLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgX19yZXMxOjQ7DQo+ID4gKyAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2ViZXA6NDsNCj4gV2hlcmUgZGlkIHlvdSB0YWtlIHRo
aXMgZmllbGQgZnJvbT8gSSBjYW4ndCBzZWUgaXQgaW4gdGhlIGxhdGVzdCBBcm0gQVJNOg0KPiBo
dHRwczovL3N1cHBvcnQuYXJtLmNvbS9kb2N1bWVudGF0aW9uL2RkaTA0ODcvbWMvLVBhcnQtRC1U
aGUtQUFyY2g2NA0KPiAtU3lzdGVtLUxldmVsLUFyY2hpdGVjdHVyZS8tQ2hhcHRlci1EMjQtQUFy
Y2g2NC1TeXN0ZW0tUmVnaXN0ZXItRGVzY3JpDQo+IHB0aW9ucy8tRDI0LTItR2VuZXJhbC1zeXN0
ZW0tY29udHJvbC1yZWdpc3RlcnMvLUQyNC0yLTc5LUlELUFBNjRERlIwLQ0KPiBFTDEtLUFBcmNo
NjQtRGVidWctRmVhdHVyZS1SZWdpc3Rlci0wP2xhbmc9ZW4NCg0KSW4gYSBzbGlnaHRseSBvbGRl
ciBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbCwgdGhlcmUgd2FzIGEgU0VCRVAgZmllbGQN
CmluIElEX0FBNjRERlIwX0VMMS4gSGFzIGl0IGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBzcGVjPw0K
aHR0cHM6Ly9zdXBwb3J0LmFybS5jb20vZG9jdW1lbnRhdGlvbi8xMTExODAvMjAyNS0wOV9BU0wx
L0FBcmNoNjQtUmVnaXN0ZXJzL0lELUFBNjRERlIwLUVMMS0tQUFyY2g2NC1EZWJ1Zy1GZWF0dXJl
LVJlZ2lzdGVyLTA/bGFuZz1lbg0KDQpUaGFuayB5b3UsDQpIaXJva2F6dSBUYWthaGFzaGkuDQo=

