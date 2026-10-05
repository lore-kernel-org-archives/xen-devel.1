Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACAFCA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 19:05:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441128.1658733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDo01-0002OX-B1; Mon, 05 Oct 2026 19:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441128.1658733; Mon, 05 Oct 2026 19:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDo01-0002OQ-8B; Mon, 05 Oct 2026 19:05:21 +0000
Received: by outflank-mailman (input) for mailman id 1441128;
 Mon, 05 Oct 2026 19:05:20 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDo00-0002OK-8U
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 19:05:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDnzz-003fAn-LT
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 21:05:19 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac3f4b4-2eae-0a2a0a5409dd-0a2a4508904a-42
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 21:05:19 +0200
Received: from [52.101.65.99]
 (helo=DU2PR03CU002.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dmytro_prokopchuk1@epam.com>)
 id 6ac3f4ef-f659-0a2a45080019-346541636e2d-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 21:05:19 +0200
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 (2603:10a6:20b:410::12) by GV2PR03MB11718.eurprd03.prod.outlook.com
 (2603:10a6:150:341::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 19:05:16 +0000
Received: from AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50]) by AM9SPR01MB0028.eurprd03.prod.outlook.com
 ([fe80::851:da2d:b88a:1b50%6]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 19:05:16 +0000
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
 b=k/twDXtT6X6GyaGSo9PBPdtNe6ThlpBTGdE2Kynjp+i2ORTlbInVykAgfR9t7QnuQXKdwhJ9FiQlXGB4tpsVPIu0edikeFh5PbCeCrVAgVwTGyXYTk5WAOUlB05Z+pdkexJAUxRmcV5MLwzltzG4TgoDkDN7g8GcKTqWZc5q72Inl4m58NQ4391hDPgWvNpo+UfVlLKYCZqik3SiTVIH63PpVj9s4bWMMKlWILiZnDHlLwlMFU0PCbggDjOOHpnt4dfDnXSD8k3zzKa8WKNQMGOyJSiV0kIqe/lPM4ZQqJj5fQ0qxMUgyC44ULqWGGvyTptepmoBBXGeTejnVW44ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YMSbsnAf6Alhpa8q8KSshh4NsEukXWDr4BlgcRFka8=;
 b=IVjUCJtQSwzFsXd35CrWVeOwS1Fv1TVgc/O7NtEqMFmctiR7+MqtTRq8dsmANhNN6BDzjIZdDFIYrit4B/yLZwTVUrGBrZER9oXtdzlCpTjCdCI+NU3Cdrx6dHq9bAs2OuyZnp+PQ9/s/fltBkV6IR0z8SMWALZPnl5svOm+WJTL2BNaGU56sT18zajbueNp6T506dI36WsYMrQn6Q1DDI8Wgv/mBWlLkt+8ZWU1hOUCPp5YbpSZ/duVMn5DC0D4sguwycgXIuiE2jTV5WLCDGJjB/dBHsHBcpQKtsXn1F1JBHvO4rtUFL95D/WMuFKWk6ekPJvxEJ82CuHq9h747g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YMSbsnAf6Alhpa8q8KSshh4NsEukXWDr4BlgcRFka8=;
 b=KVnlYRBfVDkMHsISK+XHSHJ6KzEMSyuV9hThJsNr/sgJSCS6r0YbBAjTqo6T8i9dYKidcOAa0rNS5I0yain0E0wJwhDoQw6mZZotzYy306E09SWDjSAr5IV4ujq3Pqpre1s06hRI8fA5B4rMU/g08UEwv3XNfr7TeTelN5W9Cl1bpGseRZtfcbXETzEIBhzO4/9LEBaNZLr9dxvMlYNrIB0RE6khlFyNs+zlhq/NzkzjN5RMjfca/XNUwEWZu+l2Vw3Cip+5IyrVg8U3i1IXWpc47CE0KfaC3AoK+Mwb6T5U5ou3X7RoffDrRLNm7SXkBueS/rHC/Z5YvGnnF+lNeA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 3/4] Eclair: relax "noreturn" function-pointer conversion
 deviation
Thread-Topic: [PATCH 3/4] Eclair: relax "noreturn" function-pointer conversion
 deviation
Thread-Index: AQHdO5mTAmdSCFyTpUW6NFs3gqbHSrbLKaWAgAKDb4CAIdShgA==
Date: Mon, 5 Oct 2026 19:05:16 +0000
Message-ID: <338151bb-4c3f-48c9-bf98-8acd9ea1bbbd@epam.com>
References: <6d212d60-5c0b-4909-996d-5d6a4906b7e1@suse.com>
 <4cca58b6-b555-4064-aa26-5204dc4b99cc@suse.com>
 <3d473b8a85331856ea2b95f9448f2d6c@bugseng.com>
 <e511c588-215e-4e73-9ba4-a0a79cee4478@suse.com>
In-Reply-To: <e511c588-215e-4e73-9ba4-a0a79cee4478@suse.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9SPR01MB0028:EE_|GV2PR03MB11718:EE_
x-ms-office365-filtering-correlation-id: 186d064f-e8f9-4ca8-6925-08df231397af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|42112799006|1800799024|10067099003|56012099006|260925021911599003|260925021311599003|260925022911599003|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 wnYlfECts27Bq6DNckHn5WF3XeEVYtBS4Kl2P2rNgeNSZMXidytirAmxlfmCm3WzoIH+XNohFMhSTpwUVGPwsJBWImxQqX9eL1mmpRtOIp5Yn1XLoAFJ9bUZ1T/9av4yAsH9744Aum8PrwLOMQkj0iEGCrgnLzbAljQ2doPsQubhB9rpTgOE2ETfH8W5JIdM2Q9NF1aD+uTO+6u+fMO8zfMcj8fmMST4YgB7bvt+iKz1pI4RT6cR6Kd7Oukiy/uh1l76nz96hn93IvNeSyv4ECUd3Khiqa+gvhvrJ0MFmqmO5VTeaPnT3HIkcMTzoyJiJ4tlAzzUiD+d2x87eVU/sQXv5RhRR2fyCt3i3aPfw+BhRmtdftCBm/E8my0wQctV7i2HljfxY9B9yO2W945WSleUCCgT+98dh1u4GyzzpZEopIYMKAj2+uWKuvSC1WeqMwezOJnNBTXCs7+G1ixFZhRCCNE8kOaNB0q35iIywfBGxLRJHCaGeucnyJxmrxbePKeHYjrI5lw2/+9fDstEnOKz7CnRunseFekgjFe5UPWvIEjSUzw3IHKg2ke4i1vMJyMs8gZaG3CF7bvKei2WAUcSnxpD5949tSBZnA/M6qKha/yZliBpT5a6Y+YsaplG6lL2SHZPfrbvF3u0YW0PEz35p6tNITPco0H4zeGq8eE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9SPR01MB0028.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(42112799006)(1800799024)(10067099003)(56012099006)(260925021911599003)(260925021311599003)(260925022911599003)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?M3RZbndPVmhXdmNoTGs1TmlNUXJtK1pWY3cvTWJGeGZSZDY5Skw0VDM0RzhL?=
 =?utf-8?B?SWN5WmRiNEJKcXdKMmJ4dXNUQW1DYmtSQ2d6bzFtR20zOGoyakFJakJVbUhq?=
 =?utf-8?B?b2JKSWpUSEtGb1IxVUZQZU5vbkJ0ejVpK29NcTROd2ZqZHFOdU1qMERNaTlE?=
 =?utf-8?B?amlWTTVvY2x3eFpEb1dKQWo4ekNJYUJXZ1oyeXNKOUZ5SVR5dkxUME5KOGpr?=
 =?utf-8?B?K0dHRXBjY0J4QzczSWdwM1F1d2FjWUpRVkd3K25FZWhBVCtxZHJqNnBNWVZh?=
 =?utf-8?B?dHVjVlZrYlVZTmcwb3BObVlBbmx5NjV0dFpzTWF5SG4yQm5TUCttdU8xeHNj?=
 =?utf-8?B?TTQ0cTJQN0J2RzlZZkh0STV2VWE4bmlNNWp1T0FwbDNVMkxiaFBNaTNYTmk4?=
 =?utf-8?B?aHJDMmppdEJzSFZTUVd3Y3hqTnRXUkhrMVhCNWFvMEZaL3pkQmxGK3BoTFhN?=
 =?utf-8?B?dDUweU5ORUVrOGtrMXRmNnlQd0FkM2kwb1hIQm1yNnlNOTdDZThuS01TNElT?=
 =?utf-8?B?d0hjdFpZUDRrdnRQQTY4Ym56bGxMRW0yYUJFbVVxZUhudTRIZENEUDF6Z3Q0?=
 =?utf-8?B?bTVQc0FTek8vVHZ5L2RzSXZZK2R2V0c0dUtPZ0pmTWMvLzIxckZZeGRENGJP?=
 =?utf-8?B?MTVYcEtyODBtRFRMWXFORWRBajZsNWVlVEovTVoybHcyeGV1QUVIMCsyT3RR?=
 =?utf-8?B?dnFwc1JjYzY4UWdwTnIzaVlabGVqd2FlemsvcTloWDBjQzFmZVZDQ05RbEJG?=
 =?utf-8?B?UVhib0lCL1pDSXBHV25ZVUZkbXZmYmZnRk55dE04QVAwVnUrVXEzZTdaSTFV?=
 =?utf-8?B?cVhVVDBQbUJIbEl1RTZsQzFiNUFMOGpYUFhpbG14MzZwVms1ZHk2UGI5SmlW?=
 =?utf-8?B?UHFleEhpZElmZUJDL2NINWRPaEQ0TEEvcEJSYysvL0kyRitxUVVSdEFlWXMw?=
 =?utf-8?B?cXNMZmlldEVqTi9RQjFRZTU2dHBoYXhZbW9PRWhwV0J6RnluNWpsZ2tIb3VH?=
 =?utf-8?B?aFBzUTZSMkhHUnY0TWJmNGlEWnF2WHRzQlVuM3BabmpuV3FLRXZyQjRsdlFm?=
 =?utf-8?B?dzRhSEx0ekk1UmRrWkJBVnhMTG5XSWR3c2c5ZERZOGpWOXpDckMwUVdlazND?=
 =?utf-8?B?YjBVNmdDR21LRmZvWGkrVWlJWXA5T2pGT3IvS3FlN0NzckYrNG1kTnpMeWor?=
 =?utf-8?B?eXAvcEsvWkJ6VVlxSWlYaXlvZS92TmU3aHpOYkIrd054QmR5bWYzaXdReml3?=
 =?utf-8?B?QzhtS2hQYUNoT0REaUI0TndSUXlsUGh1WFZmQ3RwY1JTQi80a1ZJcmdDVEov?=
 =?utf-8?B?YWRDK1ovc3ZCWU1oTHNpcjNyNUlYR21BZFlGTTI0bkZHTTN1ZmRJNnBQdHJx?=
 =?utf-8?B?YTYvQm1TVGpsbUxnTDNrRVRZMmh4bDEySCtRZVYrbW9WaUozUHF2L29jc2o4?=
 =?utf-8?B?L3lTcVFPMnZKd2c3ZFN4TGJNZGs3QWw1clJ6YU5CeDhtSG1BOC9IMHF0SWVS?=
 =?utf-8?B?U1ZPRkJMSklDRGVrOUlPMlQwR3hZNUprNUJZb0ZndFpGb3Zqc29DYkV3OHlk?=
 =?utf-8?B?VllsV3dVY2dUWEc0M1JUT0pmUFBIVGhNeGplcXdKM205bk41VGV1a1VnY1Jo?=
 =?utf-8?B?THY3TTByTHJsYmY4UzlERTl1OW1xenloQmlERVFQdjRSYTBua2dkV3UwNG4x?=
 =?utf-8?B?MU1uTzNZUG1hNi96YkFkQXNWbmVEaGRqZnFrOWxTK2t4cVl2UWlWZldJalNh?=
 =?utf-8?B?K3RsU2Z4MmJLSmQ4bVlrVkJtcHE3N203bTN6V21UMno0U0hTUWwyYVhybHph?=
 =?utf-8?B?N1VkRHpWdmd5RVNVMVNFMmRjU1RkbWc1U1V2WDZidW9PSkM4UG54c1QwSXN2?=
 =?utf-8?B?TWZLNCszK28weUxTMWRkNS9KdTJBeklxVDV3TmIzV2hhMU1kMmNjaWNUVHRP?=
 =?utf-8?B?TVdsNVpudTdlQkJjeUw0L04vSGhTQWJ6dTFXckNtVmNEcDNtNnIwdWZyeXZ5?=
 =?utf-8?B?aEpMa3Y5d2VDUmhvQnpLdUQ5ZncwZm05WGpuTDVoaWgvT2FHdUlzeU9LcEtM?=
 =?utf-8?B?NzB6YzNvZVk2aWVQNzd2OEMydDV6T0p5Rjg4WEUybVZkUjF0QlpaaElZQjVh?=
 =?utf-8?B?RWw3UzhqTmVXQVFQQm9LTXlYekJpei9tMW1hT0w3NlQ5SFRTZFk3WGVPM05l?=
 =?utf-8?B?TS9qaTF0OEtYWTRUN3ZTN3ZwcXVwMGEvSmVuT0NMaTFIc29BS2FnZUFTcVdV?=
 =?utf-8?B?TzAxZ2JUL25aSjZPWGlNMjBQM1lGQVI4d0htbmJySXg0MVhEczk2bk42Rjlq?=
 =?utf-8?B?S3FBZW1OVGlKbUlWVmVxU0NpcUM1MVl0RkQzSi92VDdnQWtRWFBRSVFxbVZm?=
 =?utf-8?Q?UkpVwYsoEOv4/35g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3B0D97B5D79DEC42803873BE4D69B0B0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9SPR01MB0028.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 186d064f-e8f9-4ca8-6925-08df231397af
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 19:05:16.5596
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 67y526BaTjU9UGUC1leKUjzBAoGoX91xBccbME/zdB8Xhy0tNtfhpRKKAl+XVRCS+ZCJXVZ2v6VUSqye0Sc66SvxBdajG0qzzWxzzjEBhs0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB11718
X-purgate-ID: tlsNG-c1860d/1791227119-DF8D587B-262897D4/10/78276251493
X-purgate-type: spam
X-purgate-size: 4780

DQoNCk9uIDkvMTQvMjYgMDk6MjcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMi4wOS4yMDI2
IDE4OjA0LCBOaWNvbGEgVmV0cmluaSB3cm90ZToNCj4+IE9uIDIwMjYtMDktMDMgMTM6NDQsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+IExpa2UgbWlzcmEvcnVsZXMucnN0IHNheXMsIGZ1bmN0aW9u
IGFyZ3VtZW50cyBvdGhlciB0aGFuICJ2b2lkICoiIGFyZSBva2F5DQo+Pj4gYXMgd2VsbC4NCj4+
Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+
PiAtLS0NCj4+PiBJIGNhbid0IGV4cGxhaW4gd2h5IHRoaXMgY292ZXJzIHRoZSB2aW9sYXRpb24g
aW4gbWNlLmM6bWNlX2NhbGxiYWNrcydlcw0KPj4+IGluaXRpYWxpemVyLCBidXQgbm90IHRoZSBv
bmUgaW4gbWNlLmM6ZGVmYXVsdF9oYW5kbGVyJ3MuDQo+Pg0KPj4gUG9zc2libHkgZGlmZmVyaW5n
IGF0dHJpYnV0ZXMgKGUuZy4gY2ZfY2hlY2sgdnMgc2VjdGlvbiBhdHRyaWJ1dGVzKT8gSnVzdCBh
IGd1ZXNzIHRoYXQgd291bGQgbmVlZCB0byBiZSB0ZXN0ZWQsIHRob3VnaC4NCj4gDQo+IEFzIGxv
bmcgYXMgaXRzIGd1ZXNzd29yaywgaXQgY291bGQgZW5kIHVwIGJlaW5nIG1hbnkgKGV4cGVuc2l2
ZSkgdHJpZXMuDQo+IA0KPj4+IEFzIGEgcmVzdWx0IG9mIDY4NTIzMzRmODQxNiAoIkFybS9HSUM6
IGFkZCBub3JldHVybiBpbiBhIGZldyBtb3JlDQo+Pj4gcGxhY2VzIiksIHZnaWNfdjJfbHBpX3Rv
X3BlbmRpbmcoKSBhbmQgdmdpY192Ml9scGlfZ2V0X3ByaW9yaXR5KCkgKGJvdGgNCj4+PiByZXR1
cm5pbmcgbm9uLXZvaWQpIHdvdWxkIGFsc28gbmVlZCBjb3ZlcmluZy4gKEFzIHNhaWQgaW4gYSBy
ZW1hcmsgdGhlcmUsDQo+Pj4gbm9uLXZvaWQgdG9nZXRoZXIgd2l0aCBub3JldHVybiBpcyBzb21l
d2hhdCBvZGQuKQ0KPj4NCj4+IEluZGVlZA0KPj4NCj4+PiBSZWFsbHkgYmVmb3JlIGFuZCBhZnRl
ciB0aGlzIGNoYW5nZSB0aGVyZSdzIG5vIGNoZWNraW5nIHRoYXQgcGFyYW1ldGVyIGFuZA0KPj4+
IHJldHVybiB0eXBlcyBhY3R1YWxseSBtYXRjaC4gSSBoYXZlIG5vIGNsdWUgaG93IG9uZSB3b3Vs
ZCBleHByZXNzIHN1Y2gNCj4+PiBjaGVja3MuDQo+IA0KPiBXaXRoIHRoaXMgbGFzdCBzZW50ZW5j
ZSBpbiBtaW5kIC4uLg0KPiANCj4+IFRoZSBwcmVzZW5jZSBvZiBhIGJpdGNhc3QgaW5kaWNhdGVz
IHRoYXQgdGhlIHR3byB0eXBlcyBkbyBub3QgbWF0Y2ggZXhhY3RseS4gVHlwaWNhbGx5IGZ1bmN0
aW9uIGF0dHJpYnV0ZXMgYXJlIG5vdCByZWxldmFudCB0b3dhcmRzIGRldGVybWluaW5nIGEgdHlw
ZSBkaWZmZXJlbmNlLCBidXQgZGlmZmVyZW50IGNvbXBpbGVycyBtYXkgbW9kZWwgbm9uLXN0YW5k
YXJkIGZlYXR1cmVzIGRpZmZlcmVudGx5IChyaWdodGx5IHNvKSwgaW4gc3VjaCBhIHdheSB0aGF0
IHNvbWUgbWFrZSBhIGRpZmZlcmVuY2UgaW4gdGhlIEFTVCwgYW5kIG90aGVycyBkbyBub3QuDQo+
Pg0KPj4gVG8gY2hlY2sgZm9yIGNvbXBhdGliaWxpdHkgb2YgZnVuY3Rpb24gcG9pbnRlcnMgSSB3
b3VsZCB0cnkgYWN0aXZhdGluZyBzZXJ2aWNlIFNURC5mdW5wdHJjdiwgd2hpY2ggZXNzZW50aWFs
bHkgbWlycm9ycyAtV2luY29tcGF0aWJsZS1wb2ludGVyLXR5cGVzOg0KPj4NCj4+IGNhdXRpb24g
Zm9yIHJ1bGUgU1RELmZ1bnB0cmN2OiAocnVsZSkgQSBwb2ludGVyIGlzIHVzZWQgdG8gY2FsbCBh
IGZ1bmN0aW9uIHdob3NlIHR5cGUgaXMgbm90IGNvbXBhdGlibGUgd2l0aCB0aGUgcG9pbnRlZC10
byB0eXBlLiAodW50YWdnZWQpDQo+PiBwLmM6OC44LTguODogTG9jICMxIFtjdWxwcml0OiBpbXBs
aWNpdCBjYXN0IGNvbnZlcnRzIGZyb20gYHZvaWQoKikoaW50KScgdG8gYF9fdHlwZW9mX18oQEVY
UFJAKSonICh0aGF0IGlzIGB2b2lkKCopKHZvaWQpJyldDQo+PiAgwqAgcXEgPSBtOw0KPj4gIMKg
wqDCoMKgwqDCoCBeDQo+PiBwLmM6IEluIGZ1bmN0aW9uIOKAmGjigJk6DQo+PiBwLmM6ODo2OiBl
cnJvcjogYXNzaWdubWVudCB0byDigJh2b2lkICgqKSh2b2lkKeKAmSBmcm9tIGluY29tcGF0aWJs
ZSBwb2ludGVyIHR5cGUg4oCYdm9pZCAoKikoaW50KeKAmSBbLVdpbmNvbXBhdGlibGUtcG9pbnRl
ci10eXBlc10NCj4+ICDCoMKgwqAgOCB8wqDCoCBxcSA9IG07DQo+PiAgwqDCoMKgwqDCoCB8wqDC
oMKgwqDCoCBeDQo+PiBwLmM6Mzo2OiBub3RlOiDigJht4oCZIGRlY2xhcmVkIGhlcmUNCj4+ICDC
oMKgwqAgMyB8IHZvaWQgbShpbnQgeCk7DQo+PiAgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoCBeDQo+
IA0KPiAuLi4gLSB3ZWxsLCBmaW5lLCBidXQgLi4uDQo+IA0KPj4+IC0tLSBhL2F1dG9tYXRpb24v
ZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+ICsrKyBiL2F1dG9tYXRp
b24vZWNsYWlyX2FuYWx5c2lzL0VDTEFJUi9kZXZpYXRpb25zLmVjbA0KPj4+IEBAIC0zOTEsMTEg
KzM5MSwxMSBAQCBjb25zdGFudCBleHByZXNzaW9ucyBhcmUgcmVxdWlyZWQuXCIiDQo+Pj4gIMKg
fQ0KPj4+ICDCoC1kb2NfZW5kDQo+Pj4NCj4+PiAtLWRvY19iZWdpbj0iVGhlIGNvbnZlcnNpb24g
ZnJvbSAndm9pZCBub3JldHVybiAoKikodm9pZCAqKScgdG8gJ3ZvaWQgKCopKHZvaWQgKiknIGlz
IHNhZmUNCj4+PiArLWRvY19iZWdpbj0iVGhlIGNvbnZlcnNpb24gZnJvbSAndm9pZCBub3JldHVy
biAoKikoLi4uKScgdG8gJ3ZvaWQgKCopKC4uLiknIGlzIHNhZmUNCj4+PiAgwqBiZWNhdXNlIHRo
ZSBzZW1hbnRpY3Mgb2YgdGhlICdub3JldHVybicgYXR0cmlidXRlIGRvIG5vdCBhbHRlciB0aGUg
Y2FsbGluZyBjb252ZW50aW9uIG9yIGJlaGF2aW9yIG9mIHRoZSByZXN1bHRpbmcgY29kZS4iDQo+
Pj4gIMKgLWNvbmZpZz1NQzNBMi5SMTEuMSxjYXN0cys9e3NhZmUsDQo+Pj4gLcKgICJraW5kKGJp
dGNhc3QpJiZ0byh0eXBlKHBvaW50ZXIoaW5uZXIocmV0dXJuKGJ1aWx0aW4odm9pZCkpJiZhbGxf
cGFyYW0oMSwgcG9pbnRlcihidWlsdGluKHZvaWQpKSkpKSkpJiZmcm9tKGV4cHIoc2tpcCghc3lu
dGFjdGljKCksDQo+Pj4gLcKgwqAgcmVmKHByb3BlcnR5KG5vcmV0dXJuKSkpKSkifQ0KPj4+ICvC
oCAia2luZChiaXRjYXN0KSYmdG8odHlwZShwb2ludGVyKGlubmVyKHJldHVybihidWlsdGluKHZv
aWQpKSkpKSkmJmZyb20oZXhwcihza2lwKCFzeW50YWN0aWMoKSxyZWYocHJvcGVydHkobm9yZXR1
cm4pKSkpKSINCj4+PiArfQ0KPj4+ICDCoC1kb2NfZW5kDQo+IA0KPiAuLi4gaG93IHdvdWxkIHRo
aXMgYmUgZXhwcmVzc2VkIGhlcmU/IFBlcmhhcHMgYmVzdCBpZiB5b3Ugd291bGQgbWFrZSBhbg0K
PiBhbHRlcm5hdGl2ZSBwYXRjaD8NCj4gDQo+IEphbg0KDQpQbGVhc2UsIHRha2UgYSBsb29rOg0K
aHR0cHM6Ly9wYXRjaGV3Lm9yZy9YZW4vZDY4YzU2NjA3NzgxYmZhODI5NzY2YWVkMzZlZWIzMWYw
NjA4MGZiYy4xNzkxMjI0NjM4LmdpdC5kbXl0cm8uXzVGcHJva29wY2h1azFAZXBhbS5jb20vDQoN
CkJSLCBEbXl0cm8uDQo=

