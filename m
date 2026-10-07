Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E01CA5FED
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:07:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441833.1659418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBc-0002Oq-Nk; Wed, 07 Oct 2026 00:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441833.1659418; Wed, 07 Oct 2026 00:07:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBc-0002NM-DX; Wed, 07 Oct 2026 00:07:08 +0000
Received: by outflank-mailman (input) for mailman id 1441833;
 Wed, 07 Oct 2026 00:07:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBa-0001yi-Jt
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:07:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBa-00Bv1m-02
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:07:06 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d14-e002-0a2a0a5209dd-0a2a4501d89a-22
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:05 +0200
Received: from [52.101.66.96]
 (helo=DUZPR83CU001.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d29-5984-0a2a45010019-346542605c75-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:07:05 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:07:04 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:07:04 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=epam.com header.i="@epam.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:x-ms-exchange-senderadcheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kROg9S3up0FcySHzCosPr82VITPT7t0nIeOXhvsOBTtH8L8HkQY98QxvkjeILZeucOJXWZuG7QgmGwSkqiHM18jstnmnwFIoVAfpICkBgjQdKVLA6svWA2T9BYulfmOM4Za6gjyDL3xLC+y67jepzyjN2GWCRcO7U2XZLAD1R2HAjxgy4qHiPSpIwL4vb8DDM8KTG1gUOwbVVGGw2NFwi6XnPpC3iGctYUj68s1FRFr7BmcH49+Np/tWTcGKYWQ8coAV6bnehjJZxN/QBR4GNqR4v0UgptAc5aEliawSrVL/DNXlSk+fmRS/70KzkCbGxKQvEXmRg4GJbhrAmIBzkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80QaLYCIkbbd3V9618ZPaglbC0xPD61hD7G2WmvMdYg=;
 b=IoKBKwZrdwXZBXuyNqLnmQMayoWuhCli02UF6nesXBm+PY0FDy2lwf9Dx0FKT/czMUMC9GmgZPkjl4I/LhI40h+qZrVZnX/bQdXjjurU27tPqef8ztbh7aKK2qb+R1ffh7+9BPsm3CSX9qSRfz6oflbUKEiKFt4vMEFeA8JXXfSI70Ada9PLChW8tosQHdIkt2j19CteQI9WNlKoFRE8JSq57JOsHtl4BdP+OZPdtYKRCTe0ZPRMoUB3G3J7Yk1u6FTx62fclnKojKq9T4anblsXPOla7pVQjnA9/9xyyR1lh5SojArcUZJVpwufasyhb3mwwyQ3TAmbkCtyB2i6Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=80QaLYCIkbbd3V9618ZPaglbC0xPD61hD7G2WmvMdYg=;
 b=GJRnnAr584hZmvsPTihbkTnuoCXlN8Kw1hiF0flAwLxClePhgpoOcYLnEDcDORm5MCKqPBrnQrP361T+kPh2XlQT+jKaggLsx4LmopbweJpXPqGm7qhuRmd7brQaMP0g8d4igeFIpYjK3qr/0jjp+P7VGUHgVevS+qnh//w/q02loVWeX/BsCiULiw6jkja02KBWdpABYorMc9ObGrULyJnvtJM4WRgLXwQn+Xzzo832lRLBqZbKsGLbNATI2Mu6UbKHJi1MjuLc/lCL+OFg80m1b/iFGm+b0SDfKCrYP3eHvSSm8dOGYwmUAdQAyWMAJdBBFDsRbtW/spp6YDXCng==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v4 13/22] xen/arm: vsmmuv3: IOMMU device tree node for dom0
Thread-Topic: [PATCH v4 13/22] xen/arm: vsmmuv3: IOMMU device tree node for
 dom0
Thread-Index: AQHdVe/IIN84IILw1U2j1MPuKYXDMQ==
Date: Wed, 7 Oct 2026 00:07:04 +0000
Message-ID:
 <c38b1a9476f54e42050e4712a98b19bf1d97f3a0.1791328190.git.milan_djokic@epam.com>
References: <cover.1791328190.git.milan_djokic@epam.com>
In-Reply-To: <cover.1791328190.git.milan_djokic@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB9587:EE_|AS4PR03MB8229:EE_
x-ms-office365-filtering-correlation-id: 6c6aefb1-d552-4135-1f68-08df2406eb1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|260925022911599003|56012099006|260925021911599003|11063799006|10067099003|260925021311599003|6133799003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 HLl+Eupk6HL4DuwS8z6RXrGqks9jMU46ZoCPOVIYb3Mrj5S3SO6uoOpapbMibPrcIecbZV4gmrlFAe2T/7RKCcnZLkF730jXoLMi3oXTeu+bc1G2qlDJ2Wfgn0nuKbSioi+ZSkBo3JVxH5f0PTPDoOsRPW91PgsnzEe7I/NiPJRMwti7/s9DCgTffPovF4icCbBEM2GOqVhIlPfT2HFMZITZy1JwwtFc1cM5LPQRX7XbyjtkkBXwGywog0ThJdN+vynPAvGrLU0LHScZyyegZu2mI9Pa1YEYCFvKCgW/gjNUoH+ps8U5jV1mHESRIAZRDmXc+MHxyDXltJm5sxpZTPTOZ/t/UBY85t/wzQOAum5RAArgKwXKo+rhUfeA6lX6vGX9STtO2DCXKDggVuEwKSsu413Z4vgJ9c6WhqmbQHcLrT9qFnU1CbjL80uSWSE24WThBkm6gs4wVoogWanQEi4JitIxgjB6KYshmC5bRLmqFpKDDcOf3eqlXFW79CUTu4EWnmrZgAk2ndGLHS3cQZlfNnl0ALU+H6DtQ766jR9bXVQqXA7s4VMGS+W8xNgCaI2OSuulm77MViQibiAI6TfzGcxNEGWvvTk8Zqf0fbWmFQCYWeZRiTl/TL/jMv/4gS/Z2lv689L/Wlz64hHYforc9fcqgrN6PfPWiWuS6IYpZbq7Ghw9imfhEEXRmiQmTGmpJLftqmPlNKOO4vEaV+plUywj2/zg/sVm+rTlKYk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(260925022911599003)(56012099006)(260925021911599003)(11063799006)(10067099003)(260925021311599003)(6133799003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dmxYRUxKYVBZeFF4Wm9lMFBjMDJLNTgvVGtsWGxMbFBxRlBBZnlBOGcwVytF?=
 =?utf-8?B?aHN5TU9DcjBJZkZxbFBCOFdkU0JlOFNVR244NlE0Yi9xNS94UmNURTR4ZmZo?=
 =?utf-8?B?dGd0SGZ5eExsa25DQ2gwTzNya3RYTGVTRTJWaC9VMmZCKzd4djkxS0llT2M5?=
 =?utf-8?B?TzRTZk0vVklHTDNuR3d3OHMyQUJRdENQUDg0R1FIaVhMYkpRcnZ4WTF2ek9i?=
 =?utf-8?B?OEMxVDdMS2IvR0I5SUdWeTFtQTQwRHNvdFYyclNTVktOTURPZjIrQmhlYVJi?=
 =?utf-8?B?ZXdqQk1zUXpsdTN0L3VnWXl3TUhYM21palV0Q0RzdjJFVlMyeURQWU05NDBX?=
 =?utf-8?B?N3RQZ3RpR1I3bU5BempHTy9zQUp4VGQ5T0lWMHBOYXljblZqTFVBUTNUampz?=
 =?utf-8?B?VnpUVHE2SzZnZ1d0eU8xM2RWNUMxdXRSTGt2RkRLWTFpZnZsck5rL1NIdnpt?=
 =?utf-8?B?bHFtMzl1RXVVVUFxU1U2Q0ZoOWlCRVhBdWUwK1pZL2FHbllVREl4OFpxeDVk?=
 =?utf-8?B?ejZsUkcxR3d1bGxvSlFEYVpRVUlhd1lQSzlTSFlDNWJBR0w1MGNXaWhVK3Z2?=
 =?utf-8?B?WERTTHRyRDRJSkRoTmt0Vi8yOUlVOWNYdi9tY3g2dmd6eEpteTBCR3Nwc0RK?=
 =?utf-8?B?b1g2MElQL1FuaWltRjQ0NUYrQVkxS2g2ZVUyQUZQQmsvUGQ3b1MvMWxFcm83?=
 =?utf-8?B?d0ZsTStVYlQ0djZGcW8yallON2hCbzhiWndmN2ZUU0E5ZE1GS3NRUEpCMURR?=
 =?utf-8?B?SXJOSk05WG5UM2RHWDJ3TjdOdHZOY3JzSitFWC9INURQR2JnSHc0WU9oR1JJ?=
 =?utf-8?B?V0JFNURhT3c1Yi9PTWJ4V2VUZE8wR1NVbUE3QTZHb3k1SHVFV2NVdHIwckZm?=
 =?utf-8?B?a25aSm8wR3hiY1lqNWYxU1pqdks2bUR0Q2FNekJkVHdkVmdWcmJ1azhlRGRI?=
 =?utf-8?B?bm1KZyt2M2dxdkV5bFdoWkpPb3p2U2l3eWxCS2t3SU1VQkFIMm15VVU1Q2FK?=
 =?utf-8?B?cGU3d0ZNejMvU0dVdmwxMVZsV25kZFd2eGNmV0YyeFJXQ1dmTlhTMEZ3U2xs?=
 =?utf-8?B?WnpBcjJhekIzbU8yRmlFTklBZWsvTzlMY0t2Q0NKS05SNDJnOWJPK1lWOWtM?=
 =?utf-8?B?V1EyZU13NG5WSTBVcVNudzRnSkt1TlJLLzd6ckFUYUtXN1ZNMXU0TXZpS1lu?=
 =?utf-8?B?RU5Sa3lmS2Y3cmJRMUtVMGJuOWVLczd1UzgrVjZ0MVdpZHBUSXFzcU9PYVlB?=
 =?utf-8?B?Q09QZlBKYkhrK0VMNzIzWEdaaEdoTVA1NTRieTVKQkUzbHI2L3BOS1FJVmNL?=
 =?utf-8?B?MmRKY2VUN05Qems4UHN6d2tRWDhjMHpMZmZEQTJLREllL2ZsS3dTKzl2MHVI?=
 =?utf-8?B?cnpwY2JpMGJ5R1ZwQlYxMUdDcTZDSW1LWUFqNXhPckllTDJSaHFyTnU2ajRS?=
 =?utf-8?B?V1JmbVYvMjg3aHVPWjNtZ2VyZXJkR2c5ak9yY21ZU3dKV3NRczg4YllyYVpk?=
 =?utf-8?B?RmQ5L09VZUdpUm0rOGNIc3h4a2dNcWJDNlNlZC9NMEltbTBPUi8zUHkxUG5v?=
 =?utf-8?B?Skd2UFlFbjN4L2ZmZDhBSlREZUQ0WDJMLytxdjAxMHZMaEZiaFFsV3Fxa0xS?=
 =?utf-8?B?SmxNcGhldGZRcVZUbDkrUWttY0JFd2k1Zzg4UFNnZzlnMW1zdjRQUFE5OEdB?=
 =?utf-8?B?dmxCdHdwQXdtWjJnU0JGMkIxK0tBdEtIMGdzYlAxUks2ZTFTam8rZkx0a3V1?=
 =?utf-8?B?NGNkZklYVVFNL2ZadGFGKzhYMzh2NW5pTDQ2Q3RyNFl2ODJhVDNiQW56R1hi?=
 =?utf-8?B?SmVWMGdRbGoxZ0JDVi9CZzlRWGZlak9ObkEvQkNwWUNNeHplZVIxNklINkRj?=
 =?utf-8?B?WDN3RVBCdUFtU0RxRGdBRzRONWhNYUEzRkFpWjRKS3ZDM0trT2Y3YmVISjEr?=
 =?utf-8?B?OGM5ODdqM0lKTmRZbUZZNFUyWE5QMlJkRTlWelU3N0VaOWxLY3RCR0djRGJ4?=
 =?utf-8?B?dlJNckxyRGpXbXA0Z0J1K1VRVnAvQURoZ01HaVE4NDhsV1lzY2s1Z2R6OEtm?=
 =?utf-8?B?UEIrd1VGaEd5dURvK05JNHZxVkFWekFad29heFNRRUR4c1ZPWVV2cjJYVnNn?=
 =?utf-8?B?SEVYb3R6VUVrS1V6M01KR1pKd0VXUWROdnozSFAxbW92ZFFScVpEeHJqM1Fi?=
 =?utf-8?B?S3RLVEV2T1V4NnZZTlZVNDRDQmNHZHl4dngxNWRqOEtpT1daNExwKzdqSjg1?=
 =?utf-8?B?NzZ6YnY2OXd6NGRqTUIyWXFNaUhPeVppZG84ZmlMNG13Um13NTBBYm1HVE9L?=
 =?utf-8?B?ZmticFRlWk9MV1ZETld0RituMjRCWEl4d21uQ0QrN0EycEI0bVFmUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6aefb1-d552-4135-1f68-08df2406eb1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:07:04.2642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3ClXgeoJzT02GQLyp/pF7wlymeduX7pT+ywakT5X9mtagWuRquqbkooBGNRuxD5eAXQS5udkFI6up2JC/9dq/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-d62444/1791331625-BEC61757-E9EB88FD/0/0
X-purgate-type: clean
X-purgate-size: 6874

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNClhFTiB3aWxsIGNyZWF0
ZSBhbiBJT01NVSBkZXZpY2UgdHJlZSBub2RlIGluIHRoZSBkZXZpY2UgdHJlZQ0KdG8gZW5hYmxl
IHRoZSBkb20wIHRvIGRpc2NvdmVyIHRoZSB2aXJ0dWFsIFNNTVV2MyBkdXJpbmcgZG9tMCBib290
Lg0KSU9NTVUgZGV2aWNlIHRyZWUgbm9kZSB3aWxsIG9ubHkgYmUgY3JlYXRlZCB3aGVuIHZpb21t
dSBpcyBlbmFibGVkDQp2aWEgS2NvbmZpZyBidWlsZCBvcHRpb25zLg0KDQoiaW9tbXVzIiBwcm9w
ZXJ0eSB3aWxsIGJlIGFkZGVkIGZvciBkb20wIGRldmljZXMgdG8gdmlydHVhbA0KSU9NTVUgbm9k
ZSB0byBlbmFibGUgdGhlIGRvbTAgbGludXgga2VybmVsIHRvIGNvbmZpZ3VyZSB0aGUgSU9NTVUu
DQoNClNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0KU2ln
bmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQotLS0NCiB4
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICAgfCAxMDIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystDQogeGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zpb21tdS5oIHwgICAxICsN
CiAyIGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jDQppbmRleCBjZDJlMDlmMDA1Li42NTEzMTQwMTMzIDEwMDY0NA0KLS0tIGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQorKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMNCkBAIC01NTcsOSArNTU3LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IHdyaXRlX3Byb3Bl
cnRpZXMoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywNCiAgICAg
ICAgICAgICBjb250aW51ZTsNCiAgICAgICAgIH0NCiANCi0gICAgICAgIGlmICggaW9tbXVfbm9k
ZSApDQorICAgICAgICAvKg0KKyAgICAgICAgICogRXhwb3NlIElPTU1VIHNwZWNpZmljIHByb3Bl
cnRpZXMgdG8gaHdkb20gd2hlbiB2SU9NTVUgaXMNCisgICAgICAgICAqIGVuYWJsZWQuDQorICAg
ICAgICAgKi8NCisgICAgICAgIGlmICggaW9tbXVfbm9kZSAmJiB2aW9tbXVfZ2V0X3R5cGUoKSA9
PSBYRU5fRE9NQ1RMX0NPTkZJR19WSU9NTVVfTk9ORSApDQogICAgICAgICB7DQotICAgICAgICAg
ICAgLyogRG9uJ3QgZXhwb3NlIElPTU1VIHNwZWNpZmljIHByb3BlcnRpZXMgdG8gaHdkb20gKi8N
CiAgICAgICAgICAgICBpZiAoIGR0X3Byb3BlcnR5X25hbWVfaXNfZXF1YWwocHJvcCwgImlvbW11
cyIpICkNCiAgICAgICAgICAgICAgICAgY29udGludWU7DQogDQpAQCAtMTQ1Nyw2ICsxNDYwLDk1
IEBAIGludCBfX2luaXQgbWFrZV90aW1lcl9ub2RlKGNvbnN0IHN0cnVjdCBrZXJuZWxfaW5mbyAq
a2luZm8pDQogICAgIHJldHVybiByZXM7DQogfQ0KIA0KKyNpZmRlZiBDT05GSUdfQVJNX1ZJUlRV
QUxfSU9NTVUNCitzdGF0aWMgaW50IF9faW5pdCBtYWtlX2h3ZG9tX3Zpb21tdV9ub2RlKGNvbnN0
IHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pDQorew0KKyAgICB1aW50MzJfdCBsZW47DQorICAg
IGludCByZXM7DQorICAgIGNoYXIgYnVmWzI0XTsNCisgICAgdm9pZCAqZmR0ID0ga2luZm8tPmZk
dDsNCisgICAgY29uc3Qgdm9pZCAqcHJvcCA9IE5VTEw7DQorICAgIGNvbnN0IHN0cnVjdCBkdF9k
ZXZpY2Vfbm9kZSAqaW9tbXUgPSBOVUxMOw0KKyAgICBzdHJ1Y3QgaG9zdF9pb21tdSAqaW9tbXVf
ZGF0YTsNCisgICAgZ2ljX2ludGVycnVwdF90IGludHI7DQorDQorICAgIGlmICggbGlzdF9lbXB0
eSgmaG9zdF9pb21tdV9saXN0KSApDQorICAgICAgICByZXR1cm4gMDsNCisNCisgICAgbGlzdF9m
b3JfZWFjaF9lbnRyeSggaW9tbXVfZGF0YSwgJmhvc3RfaW9tbXVfbGlzdCwgZW50cnkgKQ0KKyAg
ICB7DQorICAgICAgICBpZiAoIGlvbW11X2RhdGEtPmh3ZG9tX25vZGVfY3JlYXRlZCApDQorICAg
ICAgICAgICAgcmV0dXJuIDA7DQorDQorICAgICAgICBpb21tdSA9IGlvbW11X2RhdGEtPmR0X25v
ZGU7DQorDQorICAgICAgICBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAiaW9tbXVAJSJQUkl4
NjQsIGlvbW11X2RhdGEtPmFkZHIpOw0KKw0KKyAgICAgICAgcmVzID0gZmR0X2JlZ2luX25vZGUo
ZmR0LCBidWYpOw0KKyAgICAgICAgaWYgKCByZXMgKQ0KKyAgICAgICAgICAgIHJldHVybiByZXM7
DQorDQorICAgICAgICBwcm9wID0gZHRfZ2V0X3Byb3BlcnR5KGlvbW11LCAiY29tcGF0aWJsZSIs
ICZsZW4pOw0KKyAgICAgICAgaWYgKCAhcHJvcCApDQorICAgICAgICB7DQorICAgICAgICAgICAg
cmVzID0gLUZEVF9FUlJfWEVOKEVOT0VOVCk7DQorICAgICAgICAgICAgcmV0dXJuIHJlczsNCisg
ICAgICAgIH0NCisNCisgICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsICJjb21wYXRpYmxl
IiwgcHJvcCwgbGVuKTsNCisgICAgICAgIGlmICggcmVzICkNCisgICAgICAgICAgICByZXR1cm4g
cmVzOw0KKw0KKyAgICAgICAgaWYgKCBpb21tdS0+cGhhbmRsZSApDQorICAgICAgICB7DQorICAg
ICAgICAgICAgcmVzID0gZmR0X3Byb3BlcnR5X2NlbGwoZmR0LCAicGhhbmRsZSIsIGlvbW11LT5w
aGFuZGxlKTsNCisgICAgICAgICAgICBpZiAoIHJlcyApDQorICAgICAgICAgICAgICAgIHJldHVy
biByZXM7DQorICAgICAgICB9DQorDQorICAgICAgICAvKiBVc2UgdGhlIHNhbWUgcmVnIHJlZ2lv
bnMgYXMgdGhlIElPTU1VIG5vZGUgaW4gaG9zdCBEVEIuICovDQorICAgICAgICBwcm9wID0gZHRf
Z2V0X3Byb3BlcnR5KGlvbW11LCAicmVnIiwgJmxlbik7DQorICAgICAgICBpZiAoICFwcm9wICkN
CisgICAgICAgIHsNCisgICAgICAgICAgICBwcmludGsoWEVOTE9HX0VSUiAidklPTU1VOiBDYW4n
dCBmaW5kIElPTU1VIHJlZyBwcm9wZXJ0eS5cbiIpOw0KKyAgICAgICAgICAgIHJlcyA9IC1GRFRf
RVJSX1hFTihFTk9FTlQpOw0KKyAgICAgICAgICAgIHJldHVybiByZXM7DQorICAgICAgICB9DQor
DQorICAgICAgICByZXMgPSBmZHRfcHJvcGVydHkoZmR0LCAicmVnIiwgcHJvcCwgbGVuKTsNCisg
ICAgICAgIGlmICggcmVzICkNCisgICAgICAgICAgICByZXR1cm4gcmVzOw0KKw0KKyAgICAgICAg
cHJvcCA9IGR0X2dldF9wcm9wZXJ0eShpb21tdSwgIiNpb21tdS1jZWxscyIsICZsZW4pOw0KKyAg
ICAgICAgaWYgKCAhcHJvcCApDQorICAgICAgICB7DQorICAgICAgICAgICAgcmVzID0gLUZEVF9F
UlJfWEVOKEVOT0VOVCk7DQorICAgICAgICAgICAgcmV0dXJuIHJlczsNCisgICAgICAgIH0NCisN
CisgICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0eShmZHQsICIjaW9tbXUtY2VsbHMiLCBwcm9wLCBs
ZW4pOw0KKyAgICAgICAgaWYgKCByZXMgKQ0KKyAgICAgICAgICAgIHJldHVybiByZXM7DQorDQor
ICAgICAgICByZXMgPSBmZHRfcHJvcGVydHlfc3RyaW5nKGZkdCwgImludGVycnVwdC1uYW1lcyIs
ICJjb21iaW5lZCIpOw0KKyAgICAgICAgaWYgKCByZXMgKQ0KKyAgICAgICAgICAgIHJldHVybiBy
ZXM7DQorDQorICAgICAgICBzZXRfaW50ZXJydXB0KGludHIsIGlvbW11X2RhdGEtPmlycSwgMHhm
LCBEVF9JUlFfVFlQRV9MRVZFTF9ISUdIKTsNCisNCisgICAgICAgIHJlcyA9IGZkdF9wcm9wZXJ0
eV9pbnRlcnJ1cHRzKGtpbmZvLCAmaW50ciwgMSk7DQorICAgICAgICBpZiAoIHJlcyApDQorICAg
ICAgICAgICAgcmV0dXJuIHJlczsNCisNCisgICAgICAgIGlvbW11X2RhdGEtPmh3ZG9tX25vZGVf
Y3JlYXRlZCA9IHRydWU7DQorDQorICAgICAgICBmZHRfZW5kX25vZGUoZmR0KTsNCisgICAgfQ0K
Kw0KKyAgICByZXR1cm4gcmVzOw0KK30NCisjZW5kaWYNCisNCiBzdGF0aWMgaW50IF9faW5pdCBo
YW5kbGVfbm9kZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvLA0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbm9k
ZSwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQpDQpAQCAt
MTUyNSw2ICsxNjE3LDEyIEBAIHN0YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQogICAgIGlmICggZHRfbWF0Y2hf
bm9kZSh0aW1lcl9tYXRjaGVzLCBub2RlKSApDQogICAgICAgICByZXR1cm4gbWFrZV90aW1lcl9u
b2RlKGtpbmZvKTsNCiANCisjaWZkZWYgQ09ORklHX0FSTV9WSVJUVUFMX0lPTU1VDQorICAgIGlm
ICggZGV2aWNlX2dldF9jbGFzcyhub2RlKSA9PSBERVZJQ0VfSU9NTVUgJiYNCisgICAgICAgICB2
aW9tbXVfZ2V0X3R5cGUoKSAhPSBYRU5fRE9NQ1RMX0NPTkZJR19WSU9NTVVfTk9ORSApDQorICAg
ICAgICByZXR1cm4gbWFrZV9od2RvbV92aW9tbXVfbm9kZShraW5mbyk7DQorI2VuZGlmDQorDQog
ICAgIC8qIFNraXAgbm9kZXMgdXNlZCBieSBYZW4gKi8NCiAgICAgaWYgKCBkdF9kZXZpY2VfdXNl
ZF9ieShub2RlKSA9PSBET01JRF9YRU4gKQ0KICAgICB7DQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3Zpb21tdS5oIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3Zpb21t
dS5oDQppbmRleCA4NDRjZjM0ZDU2Li41YWUyMTA0MmYwIDEwMDY0NA0KLS0tIGEveGVuL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3Zpb21tdS5oDQorKysgYi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
dmlvbW11LmgNCkBAIC0yMCw2ICsyMCw3IEBAIHN0cnVjdCBob3N0X2lvbW11IHsNCiAgICAgcGFk
ZHJfdCBzaXplOw0KICAgICAvKiBVc2VkIGZvciBkb20wIEVWVFEgYW5kIEdFUlJPUiBpbnRlcnJ1
cHRzICgxLTEgSVJRIG1hcHBpbmcpICovDQogICAgIHVpbnQzMl90IGlycTsNCisgICAgYm9vbCBo
d2RvbV9ub2RlX2NyZWF0ZWQ7DQogfTsNCiANCiBzdHJ1Y3QgdmlvbW11X29wcyB7DQotLSANCjIu
NDMuMA0K

