Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D336ACC6B2D
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 01:25:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449777.1665373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHADj-0005HQ-BK; Thu, 15 Oct 2026 01:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449777.1665373; Thu, 15 Oct 2026 01:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHADj-0005HI-66; Thu, 15 Oct 2026 01:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1449777;
 Thu, 15 Oct 2026 01:25:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <taka@valinux.co.jp>) id 1xHADh-0005HC-3Q
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 01:25:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHADg-006AoR-DI
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 03:25:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ad02b23-2eae-0a2a0a5409dd-0a2a45048f8e-44
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 03:25:19 +0200
Received: from [52.101.229.73]
 (helo=TY3P286CU002.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <taka@valinux.co.jp>)
 id 6ad02b7c-b57f-0a2a45040019-3465e54904be-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 03:25:18 +0200
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:458::18)
 by OSCP286MB4572.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:325::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 01:25:14 +0000
Received: from OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6]) by OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
 ([fe80::c8c9:25cd:8d13:96d6%6]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 01:25:14 +0000
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
 b=j5Hcp7Nb2JRvB8ydLUdDt52I7VWAlKGlKVJAz1KeBBU7o56thKsXvhWOPLo8LbTVtt4O+tWjx8OaCi2jM1KUX3jjMRoYMQqIb6wlhkBsnK1ZfauHHZYfoFiXJw+30gy+NmWKbuJlaCScgOBpA+sWjQg9AkuJu/uGinz7EKRf43GfKajovMrsa+IrmSyoPuT5od7cpqMar7Ho0IdH2hCIo7t/UdW5QjJ9uV0ZColA4vnVPUIIwpgAAe0cApNnmQlx7Duxe+diI9N8Y1s1nW3Wi3oQKqxu2ySNHEHQuGXTvPaJJkIUc6hNzGUJ3620cjruy8WUhSoFgWWA8pwPLJ3w0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abFzb1SzuGcSHh3a/H/YTeiolw1uiygo8nLnU8Pc5Ns=;
 b=EnSVRldm+GTs+SXqdZ/5hdc5GcE666cOgtjoP0V0JR/36G3oEbw9O0xEDxK9MJZjyhN3BcCLR3Ujo+4nG+onRwy2tY6uGRw1EpHNB5pXmAgYgzxBkJWGy2uEcwLRpyJWjz8FR/7oojtY4IgRhbsPb7VWjYg5pz1GUCcBdzCq9Y3GU09km2Tm+2hAFNDBkgr16MPuthPj/Hs6nitGFY+wKURFwMKHzafL46OYwde2KggoNO+w1UwwCYdNEszxND4muitYOQ4tO9eSWyJkOXfKJSrMEKmwpFT75eWkLAGWRM9bb4hc5oi1kTKCfDFQrq6XDL+vB6Zi6S3R88Wu4tkHsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abFzb1SzuGcSHh3a/H/YTeiolw1uiygo8nLnU8Pc5Ns=;
 b=ZK4C8ijq10bLtMHuzYXNn8JyZQ3SQbVfgqkGz9EWT0YlXOiF1CNRA4iLkJR/m/c/4Elh423DNiPYwgAx7kh2P8ptWZrBS11uQQ0zyWpaePw9tLEZ0clal0IlF7GFrkpv+7ABsVtUCI5k9lyFR43Kx0XQjdsg7U4GFHL2Gc+Jhhw=
From: Hirokazu Takahashi <taka@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Mykyta_Poturai@epam.com" <Mykyta_Poturai@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger@xenproject.org>
Subject: RE: [PATCH v11 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Topic: [PATCH v11 1/4] xen/device-tree: Parse 'cpu-map' node for CPU
 topology exploration
Thread-Index: AQHdWv7FBR3TH740A0acT806Ikcnyrb9B02AgADESSA=
Date: Thu, 15 Oct 2026 01:25:13 +0000
Message-ID:
 <OS9P286MB7222BD77A2C254C3935DA7F0829C2@OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM>
References: <20261013103616.121916-1-taka@valinux.co.jp>
 <20261013103616.121916-2-taka@valinux.co.jp>
 <0d892635-2284-40bf-8b0b-3c067d49d465@amd.com>
In-Reply-To: <0d892635-2284-40bf-8b0b-3c067d49d465@amd.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS9P286MB7222:EE_|OSCP286MB4572:EE_
x-ms-office365-filtering-correlation-id: 93314076-ae8b-410a-ac1b-08df2a5b29bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|38070700021|56012099006|4143699003|261009223027099003|10067099003|22082099003|18002099003|6133799003|260925021911599003|260925022911599003|260925021311599003;
x-microsoft-antispam-message-info:
 vEiXhddAiGowYA50gc3/O3CJlTy7yHHUIdn0yX7Vp/WJzwbriCgEPFdLdQv978g6of86hKPF8o8ywnZ3/6KF/HT+20EcCJO+dKOHKMRgqXV/Aby9EmCYSaYOftPnKxz6rmJcqBAP2+bjFZneNwNYI23FTd8DLye4iVlmUhcDOmE4/QOeKrvQPd87fVhbSTj9QaPtLYsfwhxUdgjN3qxzLEF0es4skymDafLK+bEqxQe4co73Ensx6rFi/71R50pohub3wLD6t+IZdDsdNRSjIeoX1R3V9884xLu1C3qK2JY2LV+5XNbSlO133FU2SEsr3mWO3m1hC5ISM27c71q/BGLspx7v2lpvBQ3o9B7ivqKGcBDH2Ivk11Lb5etfriRfEkAWkqctKou7nOaatozZAi9Mx0j7SeL52yqK1TpExEbSBVmrc0SGdEJIZzYLHtKs7FUMIBVR1OSBj/lXT2RW2OH0uQlHsiBzw6qvm0F8w1l1VyI3gIxsbScMVcA49q5uFTivU4YmF5XrD7BDBldn6DWk33p4zr9GqnyjYidCNiTuZVBf6DczYZdcKO8+gJ5bzLGgm8AHjHbi19LtY/I0nTL3o1RuYOvLj83Iw8xEJEAYJ2fS6zyj8ytrKZblqqjk/0gZJCr+tsuSKwIrzrNqdWI8YL40NwYjVzkz+tmTml8kpegIv7TwUaq8teeLTDjP1lf9VSsKFZsOGsrP1wtDjgWhB2tlqEQhbLnl4OjjCyI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(56012099006)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(260925021911599003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V3JoWCtEZkR3ekZCaFAvelFFOERsV3huUi9YK1BTWVRYVHBURXpxT2FWeS82?=
 =?utf-8?B?OFBDTjFOckRSOEdlbTVYQ0VRK1ZRL00zRDlpNkpuRVRyL0RRS2UzdVRvUTEw?=
 =?utf-8?B?aXY4UkVnamZzWHQrQVNRRlh3VkFnVElSNGN1c0UvTW5KUDhmaE9YdzMxcXlj?=
 =?utf-8?B?VklTdEdlMzBxMHdvZzU0TWJ0MWU0U00weGZVeklyR05pMDFXcTNzNk1hbWtI?=
 =?utf-8?B?Qm1hZlFFeXI3WjNXdWc2Zk56OThlR29kZmNEZWNYbFlRSFJWYXBDUms1N1kw?=
 =?utf-8?B?allhcmVpcUZTQ0tWMllZQlZEamc1eWxxTzZ5QjIxejV6K1Y0TG50M3dCZzZt?=
 =?utf-8?B?Vk82NzdkTkFPVm9uR0U1Mjdxd05RblNEc2hpS0tCTExqQURGZXRiWkI3Qmh5?=
 =?utf-8?B?VzlGSUROMDVmZ0cxdEt4VUliaUpKWUNPUEh6UXc1R0t3RUlwaXY2TldHaHI4?=
 =?utf-8?B?dURSM2RPS3pxSHhIbHNVMFI0eGRuL1M0b1pFZFFhL0xIYTdISzJ5bldpVVB4?=
 =?utf-8?B?U1dhSVZOWnBCbUcxUzFFYTFuNDJYeTVKVFl6WkdyU0FCdVc3dS9ueEhvaTdw?=
 =?utf-8?B?b3ZKbk93TXRweXFOdlp1RHZ1c1FTanRGZmY5VlY2b2d4OVBsdVlaVDVRcWRP?=
 =?utf-8?B?ck9ZamFOMFpkSmFaRWQvMDNQYWlHbnZTM0pSNG11M2xINnpXR1B4VjQwTDV1?=
 =?utf-8?B?MDRuSlh4Vnl6alZ4Z0Z2ZzFOYWVGWHFoYUxYYXQ5dkJyYWY0SnBxbGhaMVRp?=
 =?utf-8?B?OG0zM1dVQWNZaEpIYVI0YW1GWm0zSXNMMHBJU212Qlo5Y2ttRlhGTlArQzhp?=
 =?utf-8?B?QWlLZnpBcTRQME9nT3hZZVQ5ZDV5S2pIRGV5VnZ4YXZXcWliQVFTSXpGY1NB?=
 =?utf-8?B?YllrejlRRDNaZGExaXI2UUpqaTJvbmZDRVRXM3k0clRQUlFrTTdvckZyaXZx?=
 =?utf-8?B?bDR6ZVl3ZDFxR2VUMmdwZ1ZmMG1DRkJvMldxSHV3U0VoTXJRdzFZMFlVWXY0?=
 =?utf-8?B?U0Qvbkw2Q2VSOHZSK1JvNjlyWUtoT2J5QjFjR2o5azc1UElPc0o1UzVPd2RL?=
 =?utf-8?B?ZVJ0R0RtZjc4UHJxWG9TT2NhT0hSR2s2cXdtQ2FRMmQyYzNNRDNRYTBIUHRO?=
 =?utf-8?B?SnExVDBySjdISm1hZlpFME1ybXN1ZnFnS0k4d3FKeVZSeW4raUVBRFZXRExi?=
 =?utf-8?B?aEdjZERxTmxjaVZlY0d1Yjl2R3JSdjlaaUVvTTFrUllEdHBQaVhCMHpmTzVZ?=
 =?utf-8?B?eWE2cXJ0VUpUM1U3eGFleG5lY09GblU5UU13TVdGdDhFU2ZsYWFnSzdlSWhV?=
 =?utf-8?B?ZWZQS3NEQVB1MjNNdVAxVmlLcHJBd0tSSXRaaXpEOUFKZUM3N1c1cVVuMXpP?=
 =?utf-8?B?aEFZbmNCOVVlMkw4K0NJTmhTVk9BY2c3bnV5WG0ySGFNWXZ5R0lBaDVwTFpI?=
 =?utf-8?B?Z25jWTdPVDhQL2NLVWFhVTBaLzMwN1hGd0pKZ29BZlJsR2dIYXBmSi94bTBO?=
 =?utf-8?B?bXFWR0E1MXVzZGZmM1JQNU5HS1p4M0VBSS8zN3dybDJjZ3R3N0ZuZFc0bzQr?=
 =?utf-8?B?SjhrYWgyMzJCRUQvYU1VRnhxOHdPYS9rNGhNS05HY1A3c05YR1M1ZGlwQkds?=
 =?utf-8?B?aXJWeEVLcGJUL3JLYkUwQ3ZZWkdKWVJGcXdZM3dkMEpZL3RFV2xCMVVtSCs3?=
 =?utf-8?B?d1JBUGxkZnBoU0ZQMk44WFFsK09OazZxbDdDN29pRzlLekpJRm0rY3NFMVFE?=
 =?utf-8?B?WjlyWUlnRGp1Z0U5bHdqa2pmNFFMNUFsVml6SjlRSU9NbkZvVG9TVFgzWkIw?=
 =?utf-8?B?LzVKTkpaUmRlV3RYUnlsY1ZIUGRVL3NZRjdPejQ0TVhQdExIM0VRZmROaGNy?=
 =?utf-8?B?QW0xcnEra3dLSmJGV1kzZEMvblRYVXZVdWVLZmtXUExJL1RCQm9WVytFWGdZ?=
 =?utf-8?B?RFdNc2NTaVdqV2VmRlBzcHlUV3lUcVN6QjcvSzhXSnBIZUNsdUh4VTZzaGNa?=
 =?utf-8?B?K2t6VkVNL0c1VUxmUWtHNG9ha2dKSDhzQytodlRGZWxnamtsNnJmQU9KQjFx?=
 =?utf-8?B?K0lxVWsxMnJDUWRkdFVMbTV0QzdJT2NiZzlrNFZlUm1uRWhxdlZOTTExbHhH?=
 =?utf-8?B?cWxuODdTcVpBMWVEeXFmWkVSOWFoak1QZk5ZaFhwc0hOZEMzdXpEenN6YTgz?=
 =?utf-8?B?YW1HS0o0eFRpRFBSZUlQeFQ1djBUVmVKTnE0dzIvWnJ2c0haUzZzUW85MlZD?=
 =?utf-8?B?TmZRaVF1R0JYUVFZT0pLVHFNQkpxZTlsVDNwdjZMTjd3N2wzeTRsVHZ1cXF5?=
 =?utf-8?Q?oBMFD4S69nSQLefuL5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS9P286MB7222.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 93314076-ae8b-410a-ac1b-08df2a5b29bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 01:25:14.0085
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ArmDIrdyGbe3cL1cGWXsf9WoYsQxdz1lLVozdy76OrfhVK+LyICylMvZUCup9xLc1ZKKjZkf1uOZ7L8gG68TIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCP286MB4572
X-purgate-ID: tlsNG-ebf023/1792027519-583C0B50-83D5CB0C/0/0
X-purgate-type: clean
X-purgate-size: 7432

SGkgTWljaGFsLA0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuDQoNCj4gPiBAQCAtMjQ1LDYg
KzI0NywxMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZHRfc21wX2luaXRfY3B1cyh2b2lkKQ0KPiA+
ICAgICAgICAgIH0NCj4gPiAgICAgICAgICBlbHNlDQo+ID4gICAgICAgICAgICAgIHRtcF9tYXBb
aV0gPSBod2lkOw0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoIChyYyA+PSAwKSB8fCAoaSA9PSAw
KSApDQo+IFBsZWFzZSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgdGhlIHNlY29uZCBwYXJ0IGku
ZS4gYm9vdCBDUFUgbWF5IGxhY2sgZW5hYmxlDQo+IG1ldGhvZC4NCg0KT2theS4gSSB3aWxsIGFk
ZCBhIGNvbW1lbnQuDQoNCj4gPiArICAgICAgICAgICAgLyogUGFzcyB0aGUgaW5mbyB0byBkdF9p
bml0X2NwdV90b3BvbG9neSgpICovDQo+ID4gKyAgICAgICAgICAgIG1hcF9jcHVfdG9fZHRfbm9k
ZShpLCBjcHUpOw0KPiA+ICAgICAgfQ0KDQoNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9N
YWtlZmlsZSBiL3hlbi9jb21tb24vTWFrZWZpbGUNCj4gPiBpbmRleCBmNjlkNDdkMTg5Li5kMGVi
MzlhNjMzIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9jb21tb24vTWFrZWZpbGUNCj4gPiArKysgYi94
ZW4vY29tbW9uL01ha2VmaWxlDQo+ID4gQEAgLTUsNiArNSw3IEBAIG9iai0kKENPTkZJR19HRU5F
UklDX0JVR19GUkFNRSkgKz0gYnVnLm8NCj4gPiAgb2JqLSQoQ09ORklHX0hZUEZTX0NPTkZJRykg
Kz0gY29uZmlnX2RhdGEubw0KPiA+ICBvYmotJChDT05GSUdfQ09SRV9QQVJLSU5HKSArPSBjb3Jl
X3Bhcmtpbmcubw0KPiA+ICBvYmoteSArPSBjcHUubw0KPiA+ICtvYmotJChDT05GSUdfR0VORVJJ
Q19DUFVfVE9QT0xPR1kpICs9IGNwdS10b3BvbG9neS5pbml0Lm8NCj4gPiAgb2JqLSQoQ09ORklH
X0RFQlVHX1RSQUNFKSArPSBkZWJ1Z3RyYWNlLm8NCj4gPiAgb2JqLSQoQ09ORklHX0hBU19ERVZJ
Q0VfVFJFRV9ESVNDT1ZFUlkpICs9IGRldmljZS5vDQo+ID4gIG9iai0kKGZpbHRlci1vdXQgJChD
T05GSUdfWDg2KSwkKENPTkZJR19BQ1BJKSkgKz0gZGV2aWNlLm8NCj4gPiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9jcHUtdG9wb2xvZ3kuYyBiL3hlbi9jb21tb24vY3B1LXRvcG9sb2d5LmMNCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmNlNTA0MDg4NTgN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIveGVuL2NvbW1vbi9jcHUtdG9wb2xvZ3kuYw0K
PiA+IEBAIC0wLDAgKzEsNjkgQEANCj4gPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAtb25seSAqLw0KPiA+ICsNCj4gPiArI2luY2x1ZGUgPHhlbi9hY3BpLmg+DQo+ID4gKyNp
bmNsdWRlIDx4ZW4vY3B1LXRvcG9sb2d5Lmg+DQo+ID4gKyNpbmNsdWRlIDx4ZW4vY3B1bWFzay5o
Pg0KPiA+ICsjaW5jbHVkZSA8eGVuL2R0LWNwdS10b3BvbG9neS5oPg0KPiA+ICsjaW5jbHVkZSA8
eGVuL2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi94dm1hbGxvYy5oPg0KPiA+ICsNCj4gPiAr
c3RhdGljIHZvaWQgX19pbml0IGZyZWVfdG9wb2xvZ3lfdGFibGUodm9pZCkNCj4gPiArew0KPiA+
ICsgICAgdW5zaWduZWQgaW50IGNwdTsNCj4gPiArDQo+ID4gKyAgICBmb3IgKCBjcHUgPSAwOyBj
cHUgPCBucl9jcHVfaWRzOyBjcHUrKyApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgZnJlZV9j
cHVtYXNrX3ZhcihjcHVfdG9wb2xvZ3lbY3B1XS50aHJlYWRfc2libGluZyk7DQo+ID4gKyAgICAg
ICAgZnJlZV9jcHVtYXNrX3ZhcihjcHVfdG9wb2xvZ3lbY3B1XS5jb3JlX3NpYmxpbmcpOw0KPiA+
ICsgICAgICAgIGZyZWVfY3B1bWFza192YXIoY3B1X3RvcG9sb2d5W2NwdV0uY2x1c3Rlcl9zaWJs
aW5nKTsNCj4gPiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBYVkZSRUUoY3B1X3RvcG9sb2d5KTsN
Cj4gPiArfQ0KPiA+ICsNCj4gPiArdm9pZCBfX2luaXQgaW5pdF9jcHVfdG9wb2xvZ3kodm9pZCkN
Cj4gPiArew0KPiA+ICsgICAgdW5zaWduZWQgaW50IGNwdTsNCj4gPiArICAgIGludCByZXQ7DQo+
ID4gKw0KPiA+ICsgICAgaWYgKCBudW1fcG9zc2libGVfY3B1cygpID09IDEgKQ0KPiA+ICsgICAg
ICAgIHJldHVybjsNCj4gPiArDQo+ID4gKyAgICBjcHVfdG9wb2xvZ3kgPSB4dnphbGxvY19hcnJh
eShzdHJ1Y3QgY3B1X3RvcG9sb2d5LCBucl9jcHVfaWRzKTsNCj4gPiArICAgIGlmICggIWNwdV90
b3BvbG9neSApDQo+ID4gKyAgICB7DQo+ID4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5H
ICJDUFUgdG9wb2xvZ3kgdGFibGUgYWxsb2NhdGlvbiBmYWlsZWQuXG4iKTsNCj4gPiArICAgICAg
ICByZXR1cm47DQo+ID4gKyAgICB9DQo+ID4gKw0KPiA+ICsgICAgZm9yICggY3B1ID0gMDsgY3B1
IDwgbnJfY3B1X2lkczsgY3B1KysgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIGlmICggIXph
bGxvY19jcHVtYXNrX3ZhcigmY3B1X3RvcG9sb2d5W2NwdV0udGhyZWFkX3NpYmxpbmcpIHx8DQo+
ID4gKyAgICAgICAgICAgICAhemFsbG9jX2NwdW1hc2tfdmFyKCZjcHVfdG9wb2xvZ3lbY3B1XS5j
b3JlX3NpYmxpbmcpIHx8DQo+ID4gKyAgICAgICAgICAgICAhemFsbG9jX2NwdW1hc2tfdmFyKCZj
cHVfdG9wb2xvZ3lbY3B1XS5jbHVzdGVyX3NpYmxpbmcpICkNCj4gPiArICAgICAgICB7DQo+ID4g
KyAgICAgICAgICAgIGZyZWVfdG9wb2xvZ3lfdGFibGUoKTsNCj4gPiArICAgICAgICAgICAgcHJp
bnRrKFhFTkxPR19XQVJOSU5HICJDUFUgdG9wb2xvZ3kgdGFibGUgYWxsb2NhdGlvbiBmYWlsZWQu
XG4iKTsNCj4gPiArICAgICAgICAgICAgcmV0dXJuOw0KPiA+ICsgICAgICAgIH0NCj4gPiArICAg
IH0NCj4gPiArDQo+ID4gKyAgICBpZiAoIGFjcGlfZGlzYWJsZWQgKQ0KPiA+ICsgICAgICAgIHJl
dCA9IGR0X2luaXRfY3B1X3RvcG9sb2d5KCk7DQo+ID4gKyAgICBlbHNlDQo+ID4gKyAgICAgICAg
cmV0ID0gYWNwaV9pbml0X2NwdV90b3BvbG9neSgpOw0KPiA+ICsNCj4gPiArICAgIC8qIEZyZWUg
dGhlIENQVSB0b3BvbG9neSB0YWJsZSBpZiBpbml0aWFsaXphdGlvbiBmYWlscy4gKi8NCj4gPiAr
ICAgIGlmICggcmV0ICE9IDAgKQ0KPiA+ICsgICAgICAgIGZyZWVfdG9wb2xvZ3lfdGFibGUoKTsN
Cj4gSW4gYSBwcmV2aW91cyByZXZpc2lvbiBJIGFza2VkIHRvIHByaW50IGFuIGVycm9yIChleGNl
cHQgZm9yIGV4cGVjdGVkIGVycm9ycw0KPiBsaWtlIC1FT1BOT1RTVVBQKS4NCg0KTXkgaW50ZW50
aW9uIGlzIHRvIGF2b2lkIGR1cGxpY2F0ZSBtZXNzYWdlcyBiZWNhdXNlIGR0X2luaXRfY3B1X3Rv
cG9sb2d5KCkgYW5kDQphY3BpX2luaXRfY3B1X3RvcG9sb2d5KCkgYWxyZWFkeSBlbWl0IGRldGFp
bGVkIGVycm9yIGxvZ3MgdXBvbiBmYWlsdXJlLg0KDQo+ID4gK3N0YXRpYyBpbnQgX19pbml0IHBh
cnNlX2NvcmUoY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2RlICpjb3JlLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzb2NrZXRfaWQsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNsdXN0ZXJfaWQsDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGNvcmVfaWQpDQo+ID4gK3sN
Cj4gPiArICAgIGJvb2wgbGVhZiA9IHRydWU7DQo+ID4gKyAgICB1bnNpZ25lZCBpbnQgdGhyZWFk
X2lkOw0KPiA+ICsgICAgdW5zaWduZWQgaW50IGNwdTsNCj4gPiArDQo+ID4gKyAgICBmb3IgKCB0
aHJlYWRfaWQgPSAwOyA7IHRocmVhZF9pZCsrICkNCj4gPiArICAgIHsNCj4gPiArICAgICAgICBj
b25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKnRocmVhZDsNCj4gPiArICAgICAgICBjaGFyIG5h
bWVbMjBdOw0KPiA+ICsNCj4gPiArICAgICAgICBzbnByaW50ZihuYW1lLCBzaXplb2YobmFtZSks
ICJ0aHJlYWQldSIsIHRocmVhZF9pZCk7DQo+ID4gKyAgICAgICAgdGhyZWFkID0gZHRfZmluZF9j
aGlsZF9ub2RlX2J5X25hbWUoY29yZSwgbmFtZSk7DQo+ID4gKw0KPiA+ICsgICAgICAgIGlmICgg
IXRocmVhZCApDQo+ID4gKyAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsNCj4gPiArICAgICAgICBs
ZWFmID0gZmFsc2U7DQo+ID4gKyAgICAgICAgY3B1ID0gZ2V0X2NwdV9mb3Jfbm9kZSh0aHJlYWQp
Ow0KPiA+ICsNCj4gPiArICAgICAgICBpZiAoIGNwdSA9PSBJTlZBTElEX1RPUE9fSUQgKQ0KPiBn
ZXRfY3B1X2Zvcl9ub2RlIGNhbiByZXR1cm4gSU5WQUxJRF9UT1BPX0lEIGFsc28gb24gbWFsZm9y
bWVkIERUcyBlLmcuIG1pc3NpbmcNCj4gcGhhbmRsZSB3aGljaCB5b3Ugbm93IGFjY2VwdC4gU2hv
dWxkbid0IHdlIHJldHVybiAtRUlOVkFMPw0KDQpPa2F5LiANCg0KPiA+ICsgICAgICAgIHsNCj4g
PiArICAgICAgICAgICAgLyoNCj4gPiArICAgICAgICAgICAgICogSWdub3JlIHRoaXMgQ1BVIG5v
ZGUgZGVmaW5pdGlvbiBhcyB0aGUgY29ycmVzcG9uZGluZyBwaHlzaWNhbA0KPiA+ICsgICAgICAg
ICAgICAgKiBDUFUgZmFpbGVkIHRvIGJvb3QuDQo+ID4gKyAgICAgICAgICAgICAqLw0KPiA+ICsg
ICAgICAgICAgICBwcmludGsoWEVOTE9HX0lORk8NCj4gPiArICAgICAgICAgICAgICAgICAgICIl
czogQ1BVIGZvciB0aHJlYWQgaGFzbid0IHN0YXJ0ZWRcbiIsIGR0X25vZGVfbmFtZSh0aHJlYWQp
KTsNCj4gQ1BVIHRvcG9sb2d5IGlzIGluaXRpYWxpemVkIGJlZm9yZSBicmluZ2luZyBDUFUgdXAs
IHNvIHRoaXMgbWVzc2FnZSBpcyBpbmNvcnJlY3QNCj4gYW5kIHRoZXJlIGFyZSBtb3JlIHRoYW4g
b25lIHNjZW5hcmlvcyB3ZSBtYXkgZW5kIHVwIHdpdGggaGVyZS4gTWF5YmUganVzdCAiQ1BVDQo+
IG5vdCB1c2VkIGJ5IFhlbjogaWdub3JpbmciLg0KDQpZb3UgYXJlIHJpZ2h0LiANCg0KPiA+ICsg
ICAgICAgICAgICByZXR1cm4gMDsNCj4gVGhpcyBzdG9wcyBwYXJzaW5nIG90aGVyIHRocmVhZHMg
d2hpY2ggSSBkb24ndCB0aGluayBpcyB0aGUgcmlnaHQgd2F5IHRvIGRvIGl0Lg0KPiBXZSBzaG91
bGQganVzdCBjb250aW51ZS4NCg0KWW91IGFyZSByaWdodC4NCg0KPiA+ICsgICAgZWxzZSBpZiAo
IGxlYWYgKQ0KPiA+ICsgICAgew0KPiA+ICsgICAgICAgIC8qDQo+ID4gKyAgICAgICAgICogSWdu
b3JlIHRoaXMgQ1BVIG5vZGUgZGVmaW5pdGlvbiBhcyB0aGUgY29ycmVzcG9uZGluZyBwaHlzaWNh
bA0KPiA+ICsgICAgICAgICAqIENQVSBmYWlsZWQgdG8gYm9vdC4NCj4gPiArICAgICAgICAgKi8N
Cj4gPiArICAgICAgICBwcmludGsoWEVOTE9HX0lORk8NCj4gPiArICAgICAgICAgICAgICAgIiVz
OiBDUFUgZm9yIGxlYWYgY29yZSBoYXNuJ3Qgc3RhcnRlZFxuIiwNCj4gZHRfbm9kZV9uYW1lKGNv
cmUpKTsNCj4gU2FtZSB3b3JkaW5nIGlzc3VlLg0KDQpPa2F5Lg0KDQpUaGFua3MsDQpIaXJva2F6
dSBUYWthaGFzaGkuDQo=

