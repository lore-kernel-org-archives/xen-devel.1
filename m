Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4003C4450F
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jul 2026 04:54:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364630.1615657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkaZz-00030f-EV; Fri, 17 Jul 2026 04:53:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364630.1615657; Fri, 17 Jul 2026 04:53:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkaZz-00030U-Ak; Fri, 17 Jul 2026 04:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1364630;
 Fri, 17 Jul 2026 04:53:42 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1wkaZw-00030M-VU
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 04:53:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkaZv-001dKF-EU
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2026 06:53:39 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a59b52f-e002-0a2a0a5209dd-0a2a4506a1cc-46
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 06:53:37 +0200
Received: from [52.101.229.80]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6a59b54e-195a-0a2a45060019-3465e550ba23-3
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2026 06:53:36 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by TYCP286MB1827.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:100::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 04:53:31 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 04:53:31 +0000
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
 b=PaL5whuL8LSFXzz3etLDPrcc/stKz91Ziv93G9V/91xRNoZTDAmiN9PzlDtW3F7hOPbZgiQRzpn4ptyGv2bhkZ8R0byu01iLqm71mhiMRhigj+KFSDZ+rjpud9PbjDxarJ/wI38UonBwngRhkqLG4SmpqyxZNKRwVSrQrD748vTQls5K7wpfakLKdgQxWkCyAY+5IYHWZ4w6NF7yRtux5QVAhmdF2v28/IXs6146hrHyiXcRJBPfwJtVZKbadfkSLn6lLW0aDJJwSMFxj7ixPAKfmlsLdgBpKMwux98P9PQGx3N2OQtg6ooygTiScrF8wzQWjZer7u6GAip6Bz3RkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c1zapCuzjJUU4sk+MPFTu9l/x08DiDYrzy1X0bWahE=;
 b=AM88tz40ECuSNdpZ4RJ9W2vaThivk6nxk7FyUVVpwJM9DoYA2kiVjL22TYu8sj+RrStYC4lMuYP0Ai+stVl21qTcJJUDLa6NIWjICjbtYK0ZulGDzo08fnASuTAuZ6DZRDALpJLFlwvwOHvqUSsp/CcsCLK454mWNCCiSNJEH0VotogBPzuDxVmzAXfdOBZoRRmLKdcoF8rp6wjpFRwAXLsrODYFm0zWh1DRUm4lkBjaa8c/jNlWoBHDQsovfiN54K889S94i9JbSQlPgioI8+JYa6oxhKOgOaRZcMNfD6vkt+ZlOM5hMq2h9hSCjq5hyDOB5Hs07MRrGnC0+egwMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c1zapCuzjJUU4sk+MPFTu9l/x08DiDYrzy1X0bWahE=;
 b=gAiPN4S5FGEQaM1L0eJ/wzKKEljOq+blUWhcFAHVQl0QnDJRSZGiCPEGl1/8/iHy6MnCCtq42eUzgQdNBZRlSoFnxRmC/cHSdxXAQLNYNJZG+MRMTTCrF/IcC/tp7CUziydfsc785Q3wjLyH0TISAnH6k4R1/FuEC0CS9rtjMO8=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: Jan Beulich <jbeulich@suse.com>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v6 4/5] xen/acpi: Import PPTT definitions from Linux
Thread-Topic: [PATCH v6 4/5] xen/acpi: Import PPTT definitions from Linux
Thread-Index: AQHdE335ELZPxIrmIUu65z0sAohBp7ZwPjQAgADq88A=
Date: Fri, 17 Jul 2026 04:53:31 +0000
Message-ID:
 <OS9P286MB72222AE885FF9CA3B2C25AAC82C62@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20260714104445.919830-1-taka@valinux.co.jp>
 <20260714104445.919830-5-taka@valinux.co.jp>
 <077f245a-7a0d-497d-90db-6a0bfaf4bd0a@suse.com>
In-Reply-To: <077f245a-7a0d-497d-90db-6a0bfaf4bd0a@suse.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|TYCP286MB1827:EE_
x-ms-office365-filtering-correlation-id: 46dceb57-4cda-4740-0b8a-08dee3bf59af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|38070700021|10067099003|56012099006|4143699003;
x-microsoft-antispam-message-info:
 Ie81RMbVkYLP6Q+prPOvkkvbsvO2D1Yr+CBiQOc3HUPow/sUcvZSmWWZ8TUsEpU9Ou8l6U2itqAhutRY7Y4pdSdIQfmzaytbf9e6kv4NY9l0WgT/j5bWwybPqBlhhTzij8SomQaoRTFB+jFO60rwdUjloTnmO2u6TQJwpb4xPTYYWz0t/v5RIgGfY4QV06I+MUBBQD45qX2XAZyWG9ocEccVRZu1rk7pCuS4sV+ZMz64Be99tRixoHPPODSIn1sFrm0mibmDU6IlzqdBKgnFpGYP/mxabcHgwMG+8O4Az8/YDV1yoqzjaPwCuJwoXWOyBiSKtwSrp0mKxsnwF0VPo7UtGCs5EC2ld6UTJmekcMLD2vf73UgO2hUCAbFOFfZ5tXGEXTBT37tKDeIdJoUsl4QyyNt7x3h4A4ze7DMjZQm//mhMjhb2iocp/HoOiB4vaO8/kXDDoLa4BkibcY21Yta+/wiXVXAM2hXjHQIcJ7e//WIRHlhxSCtxLbH6fqF3Kq/36Vc+6PCKCG5Tp98/fj+3Ni3BJUj2MmYW6sfFN0Oo6DGN3fDbWqpdQH1Tupuol0Kc3rW6nQ6VjWTYSu9Wqm/MRrt3A89S+oGt69x6B3ZuuGPCOW+c2x7w/jo6ipjNRq+JztXrUzwKguqRXXE2QK5tm1ziLgrBs1SYQNghRAYK6Be9fL79fJu5YEtAH+y75pHJ+DXyXbCMKBV51xAUMw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(38070700021)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dzI0NVV0eEM3YUFtV091clB6Q251T085bStFWU9hdDlrcTZkb2FJSWc0MmZa?=
 =?utf-8?B?K2VpMU1EMWNYT0RSWlkxWUhicngvRzFOS0RLcUw5UHM4WGxJRnJtZVNLV3FG?=
 =?utf-8?B?VXFFSGlhTUhYNDEyTTZ0bEl5bHJnZTRJbkJ0cmthMlE3VU1NcXA4b1BkSUJY?=
 =?utf-8?B?c1haVnZkVGtyTXNJQkFYeWIxZ1ZxTEJZeDZXdmh3WlN0Z0hwM0xINnpPajQ1?=
 =?utf-8?B?dHlQK1ZoSG5IMkJ4QVBmTDZOdFZZQjJlVWJZYnRCajRyWGg0RStJSjFLYXNq?=
 =?utf-8?B?NUJWT05QQUhXWEdkMVRKU29WZVIvdmVhSDFQQ3Q5UWRSRndScTlyRFB0SEpl?=
 =?utf-8?B?VGgzVlhzRGtWOFp0ek1VV1VEcSsyd21oTGQ0V0lPRUpKazJONjNCckVTMk1D?=
 =?utf-8?B?dkZvbjM1Unk1SWxQQVVCVVdkSnQvZ29GNFpCdUlEdHFrSlNEazVpTllFS3Jw?=
 =?utf-8?B?RHNKVHg2Q2w4V2NXdGwvd21lMTkwVmQrbERMMVYyZ2Y2TlN3ay8ySUFJall0?=
 =?utf-8?B?Wi91R2ZKbnRNbElhcTFJcnlpSWlXRDNOOG43T1hvbHAzV1h1Z3dFRFFmYXVq?=
 =?utf-8?B?SW9TV3kzZnB1a2hESnpoSmlMZElpR0I3UTRobldnZ05BbGs1RlRYdFlHd1lY?=
 =?utf-8?B?M1Bnd3gydm94UmZ5K2cyVDBGellPajJtcjBTTUZiUEh5eGVzWFdPdk1wd2JS?=
 =?utf-8?B?UjNaUTdCOUVOSUtLQTQwZmZCejdBMXF4LzZVN3doWVh3TW5LWklQNjgyRlFv?=
 =?utf-8?B?NFVPOGVOYzVCcDhpT1ZyM3hDNHpVUkNRVEZoQWdCU1RTS3VIV2JmbmI5VGU2?=
 =?utf-8?B?K1R3dnJ1MGloL0JKMHltY0xQNDJRelFsWG4rSjhibTJqVTlvMDZKRXpPeWFi?=
 =?utf-8?B?T1A5M3piSmZhVDd0Uzcyd0M3elRFY2VHV1dSZFFObW9nb0lnSUdIR05QbG83?=
 =?utf-8?B?cFNZbnU3N2ZyWHZwUExRSmxYak9CZGExSG56KzVybG5ad2s5dFdub2NPQkQ3?=
 =?utf-8?B?YjFmZFltK3JYVDVabDFsQTY1Mml4OFFaWFhuRkdla0RXSUxHV0pQbkVxRjhE?=
 =?utf-8?B?YnV3cnFwN0xHc2wyTUN3a0hERCtpZ1RvSzVYbjdHbytqSjhUa3FxenFjSFpE?=
 =?utf-8?B?cWpzbFZuaFFLdEtmTEtvV1ZZWGtPejlxQjR0cWV2SFdtQnowSmlTUlpCUGhu?=
 =?utf-8?B?WVVOWnlJOFlOVEJCeWJNUzNEUGVva09vaStnU2d0VUh4MkJtd1hLZnZmMGEx?=
 =?utf-8?B?VXdxbWh0MGU0MmlIM2U4cUZBMmhyZVlrV2NjSTN5dGFUUXhXT1NMMW5JaDJE?=
 =?utf-8?B?Vkg0SEo0TVluWnRYSDVuSk9VTFlITnZTbTBVVGhsd0cyK0JWYmlRSzBRYVZq?=
 =?utf-8?B?WXV6VGNrVE1hVlVqTlh5Nnc0cFp1MnhaaU9CMHBHMWFLNkREby84UjRNR1FV?=
 =?utf-8?B?V0RnR01ST05lZWR5YkdYV1NoTWM3d2ZNc0NYcHJYNXBza0xuUjFpSUZwbEFP?=
 =?utf-8?B?cVNaRFEvME5MWUNmYTRDMnlCWElZd2xWR2dmZDh5bnhmc1RLWGM5dmlTSFBS?=
 =?utf-8?B?Rzl1ZGhTNkJoaVJLRVBGcXIzS1I3UnRMNzVqMU5qUkptYnpQMG1CcVpwTlo4?=
 =?utf-8?B?SXppQWJpVk1KbDBuTFliWWJYQnZxSW8vdDI3WmJzUk5NbUdCd1M3akJTNVdO?=
 =?utf-8?B?UTBnYWI1d21JbEhZT0p1T3creE93S2RNVHFkcmxlV2dsTFo2MnJ5UndrQ1FF?=
 =?utf-8?B?VDNxbWlRMStORUN4SWs1emNEMTRxdW1MZC9ZN213VEdrbmcyTDdkWXprN1F2?=
 =?utf-8?B?dWtNcUlPdkhBUVdLc0k0cEJQWDltdW54bFJyUHJ4RkRURnh4b1dkTmV0Zldl?=
 =?utf-8?B?aWFYMzA0c0R0OGJQL3hqNjExTVd6SWg0VUFYTzREdkRZQjcxek5XVTNmd0N0?=
 =?utf-8?B?dnVXUXNGVWJ1bGRXVCs3bXNnNU16aWlpSVBIaGQ1TERUVktkZm1Pa2VOZktQ?=
 =?utf-8?B?MG0yMkUyWk1FTzlLUHE3K0tKQ2FoYVR6dFhKMmZnZTc1SHdkUUwvcTZydGNl?=
 =?utf-8?B?K3lndDZXTU9rT0hCZHphV0dvWjFqbkJzeXdBUGxhd1dKWktIbWExZTJqOFZQ?=
 =?utf-8?B?RlhjOXovZUFxTllHOHNPRE5pMm9tMkEySVk5bytsczdLSk1jSXM5aGxtZ3dD?=
 =?utf-8?B?bFdzYVcvYTV3OURXVzNNUUhiWmNQRGJ3UEtvQkRYN0w2cTBzdjhNN3hNejVx?=
 =?utf-8?B?TGFLUWQreXVYcUxmQ1o5SWRYV1FXU25xb2YyY3dDb25SOGtUTzlmL1lkNzli?=
 =?utf-8?Q?CV6QDz66tVBvxR/dPj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 46dceb57-4cda-4740-0b8a-08dee3bf59af
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 04:53:31.5813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONONTi6BuQ8jiItkopefj0Z+39Ln2xM4iRXZdSJG6J5TnP950V0DFf6hZQHHgjwWP+TOBooqKPsHa2rQ4SY2lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB1827
X-purgate-ID: tlsNG-16d1c6/1784264017-FE07177B-973BCB0B/0/0
X-purgate-type: clean
X-purgate-size: 1220

SGVsbG8sDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NiA0LzVdIHhlbi9hY3BpOiBJbXBvcnQg
UFBUVCBkZWZpbml0aW9ucyBmcm9tIExpbnV4DQo+IA0KPiBPbiAxNC4wNy4yMDI2IDEyOjQ0LCBI
aXJva2F6dSBUYWthaGFzaGkgd3JvdGU6DQo+ID4gSW1wb3J0IHRoZSBQcm9jZXNzb3IgUHJvcGVy
dGllcyBUb3BvbG9neSBUYWJsZSAoUFBUVCkgZGVmaW5pdGlvbnMNCj4gPiBmcm9tIHRoZSBMaW51
eCBrZXJuZWwgaGVhZGVyIChpbmNsdWRlL2FjcGkvYWN0YmwyLmgpIGludG8gWGVuLg0KPiA+DQo+
ID4gT3JpZ2luOiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
c3RhYmxlL2xpbnV4LXN0YWJsZS5naXQNCj4gMDkxYzRhZjM1NjJkDQo+IA0KPiBOb3QgcmVhbGx5
LiBUaGlzIHdhcyBvbmx5IGEgY29ycmVjdGlvbiB0byB3aGF0IHdhcyBkb25lIGVhcmxpZXIuDQo+
IGU2MmY4MjI3ODUxZCBtaXJyb3JlZCBhbiBBQ1BJQ0EgY29tbWl0IG1vdmluZyBQUFRUIGZyb20g
YWN0YmwxLmggdG8NCj4gYWN0YmwyLmguIGI4MzU1YmNhYzI1MyBpcyB3aGVyZSB0aGUgZGVmaW5p
dGlvbnMgZmlyc3QgYXBwZWFyZWQuIEknZA0KPiBzdWdnZXN0IHRvIHJlZmVyZW5jZSBhbGwgdGhy
ZWUgY29tbWl0cywgbWF5YmUgYWxzbyB0aGUgb25lIHRoYXQgd2FzDQo+IGluIG5lZWQgb2YgY29y
cmVjdGlvbi4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogSGlyb2thenUgVGFrYWhhc2hpIDx0YWth
QHZhbGludXguY28uanA+DQo+IA0KPiBXaXRoIHRoZSBPcmlnaW46IHRhZ3MgcHJvcGVybHkgc29y
dGVkOg0KPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpPa2F5
LCBJIHdpbGwuDQoNCkhpcm9rYXp1IFRha2FoYXNoaS4NCg==

