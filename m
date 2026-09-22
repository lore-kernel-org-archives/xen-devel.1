Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C2BC98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 18:59:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429439.1652314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x95hd-0002o5-4G; Tue, 22 Sep 2026 18:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429439.1652314; Tue, 22 Sep 2026 18:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x95hd-0002ny-1e; Tue, 22 Sep 2026 18:58:53 +0000
Received: by outflank-mailman (input) for mailman id 1429439;
 Tue, 22 Sep 2026 18:58:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Leonid_Komarianskyi@epam.com>) id 1x95hb-0002ns-Ry
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 18:58:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x95ha-000dk7-H4
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 20:58:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Leonid_Komarianskyi@epam.com>)
 id 6ab2cfd1-8faa-0a2a0a5109dd-0a2a450bc242-38
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:58:50 +0200
Received: from [52.101.72.121]
 (helo=AM0PR02CU008.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Leonid_Komarianskyi@epam.com>)
 id 6ab2cfea-b7e8-0a2a450b0019-3465487985b3-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 20:58:50 +0200
Received: from DB5PR03MB10049.eurprd03.prod.outlook.com (2603:10a6:10:4a0::9)
 by VI0PR03MB10733.eurprd03.prod.outlook.com (2603:10a6:800:264::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 18:58:45 +0000
Received: from DB5PR03MB10049.eurprd03.prod.outlook.com
 ([fe80::9240:92cd:d9da:bf9e]) by DB5PR03MB10049.eurprd03.prod.outlook.com
 ([fe80::9240:92cd:d9da:bf9e%5]) with mapi id 15.21.0428.015; Tue, 22 Sep 2026
 18:58:45 +0000
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
 b=oc+ruYOKUoKN7DOXKoh5fm8A+TEg96+hqDUQqPI/7JGcngQ7cHrFCi9UyiK+uanY0OalWKNp60+4M3CjDYF9q4bje7qqHKsuVcVN9PKxGPI2/cr1I7zvcJ3pqzkC7fHHGViBdG1uITJbuhWK4zvytGYeJgOBCX8Fel4953HHB19F0V2nTvytW5BixXNd0KdpayAmDYoaRTO0GLQN4pxeURldvx3CxvfH5wFY/2LM590CeGI/KiL5v6JGA2sQVhbHQHlJiWy5Inw41u1Ca8aVlk3OCApVcOUxK1fditEk4Ro0vLqJgr9ohgwQ/Z5QSI5qRW/PTGTMvZy7iMhQsb9zeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdID0DFE4HAU7xd8Jz5U0z8FNuSv078dhHif4ac5eZs=;
 b=xKjLhtMBgc1kiNMX6ZQoblWf8QIuCOmOurhZ2tzYkguYcSZAYhHm9pwMKn2hbdh7Uwmaz/L0rq/gVpF8d9INYIfzSPSpNtzZK3ypw6gttIznaMJuq90mPVTNAJBlj1S2h5nckAV0W88V/ElhEvnWogIf1XffxrXZdM5RyZ6iFXtBxIAzqWTeWd84pXKl3yUAq/q3zYrYPHgyKpA3Sx92HFcrmsSXceUICyDm3m9ElNiPaNwP2PpEk5RP/TxYhZPPpjM95EHwHdQIScvcgFg4K5yLpWW+ERI7zohyoTsTAJXX85sa92QoEOShuCK12hLOAPZIk3qDhQOIFeAsDLUW8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdID0DFE4HAU7xd8Jz5U0z8FNuSv078dhHif4ac5eZs=;
 b=gXourLZoYtwzEcC2fsfdrh6Y22nyRxwR7H/Cva0KBKubIOyHdZLTUu+kroWfeAb26KtRrI07FUS+P2uwgGwaHS+pXR7o0wbYaeAgQwa/nEYHvF97892QmB0PSlf7+CN4lWssQBNXo5ERlE+UT7ftr+9UToFx+8xPYQyHg2WBATGMOfHR2V6npd/RnskP6fK1lGQ58N2rcYMfsTP+cAmtFciAs8U1fuqs6dRHnk+Z99ylXdy2OpDYnkqiymUznv9t5+5v3OmB90LREa9Kz0C1QELUflnhkuvvmSpKYoi2jnIod+3O9wBxTq9rfKE6EUK63pbdKZsehRxZh23A9/cprw==
From: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
Thread-Topic: [PATCH v2] xen/arm: gicv3: initialize eSPI unconditionally
Thread-Index: AQHdSsRkuuRG4YXur0mlXN3LfWLvYg==
Date: Tue, 22 Sep 2026 18:58:45 +0000
Message-ID:
 <13181424f9be3f5e31977fbd505209cd0508571b.1790102501.git.leonid_komarianskyi@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR03MB10049:EE_|VI0PR03MB10733:EE_
x-ms-office365-filtering-correlation-id: 69e3f00e-ecf5-4ff9-509a-08df18db874e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|5023799004|11063799006|6133799003|10067099003|56012099006|18002099003;
x-microsoft-antispam-message-info:
 9+w/QoSgF3KxjRt0YIgp/Ypdiyg62HN/ebrMvU1vNMlabMVbESzyOkIRrBvDiWUMj7HeNK3L99Q50lrNDrlXZWFH9HTl/H2HhF5BbRpHixoQsxDRSDk5ez0E/0cb5YyoPHS9okMdM9wcntQp8DbICOhngglqwp2aoUaGLag6Y/WbjWUf405j9Grk68Cm3Zbeha1hfsLzSrUakHxH7JMwnSIDDL4SMf729obpfHVCRNbumn2iYn78TDB5Usm13HyPq84xu7eVLm498IR2vYljv5mPoKVc2tFD308bz3mvhHqQa294brnKg4bwkaiTsAkwMNbqQe878iSAEUY/sNL3kqxPYUANSbF4Ou7f8OB3lxEcBzxkAGsHP68rorHo8/9isojNivmuv6xanJcdy5+AVokOxMUMwxZncyjLSDbcX6H1xpsV8isgV26IarEahZVufJ0GwLsHuk0Tyx9DL8mFc0XCbCp+Aiv6VBpy1uYtn/LoKnBNFMlTZh4NhweiULZSTarChuL3z1mYtmTxmvRgo61lguwP0orWbc+cOmeeTvHRbORhwUcOFEUMyl83Wy6/2/GomazO19B4gswjOK1AFTL+G2u0ELpiXGsIek06R6dr8wtuYG6LPxtp8+Yo0Xfk3MggoGReHT2ILzGqYppunL8Krm5KChOxhb7kYo1jMkKGCt/Zqf7PXLvnxx7Ss6C75G0jCRXjKwp7QTIKgy6nlGEPbhSZQIigbi5xTy/DYek=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR03MB10049.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(5023799004)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q1c1SXJEVFJBU2h2YmUzak5GR2JwT0hwNllhSmdHVmlZaGJPL0RxdjVBaDEx?=
 =?utf-8?B?YTJYc243RElEQlpMc2pYY2YrTzJ6Yks2ZkdOT2UvNTErd084akF5YlVPSERm?=
 =?utf-8?B?bE82THFwdTVUdHJJVmo0ZDRkQ05hS0lnMVlIRDhuV0hhZFRmNmZ5dmpweUtT?=
 =?utf-8?B?U05helJyQ3Npc3htNnh4c2p0Rit4NFkzVmVad3Q4OEVRUDNueDV0MmpjdjFu?=
 =?utf-8?B?WnBESUFPZ0VrQ3NKVElsQzQ2cVQ0M1NXSk14SkkrMzBWV3ovL1IyMTdHVTFo?=
 =?utf-8?B?Nkt5aUxvSVQ1dkNJYzV1NG1oZ0MxTFIxclR0ekFtMmtLMWo2R3JiWHFaNGxD?=
 =?utf-8?B?WWtzMUlwdFVQUUZYRDZEMUo4dDRWTHFPbGlkTjJvVWlOMm43ampDYkhzOU1K?=
 =?utf-8?B?dXdxRWJ1ZkhSUUt6TVdFaXVBREQvemtpY0k4MkNzMWFoaVJ4N1YyOUFDZW9a?=
 =?utf-8?B?U0UycDh4a3l4UUFFcUZiS2xMbTJCQzlDbnV6UEI3Vzh5MTE0ZVhBcXhoSGFr?=
 =?utf-8?B?TXRnL0JYVGVTODZQK0NtUjZNb284aUVtWXZrU0dVVGpFQTJvZDJydktMRHRm?=
 =?utf-8?B?ajJnZFJ4ZTFVaGFOeFJCcnlEaGgzdjFvUGgwWDN2dkpNdkwxa3lVaHd2K0x1?=
 =?utf-8?B?TUl6WmJvcnNhMnROdzEyZTI0ZElRcTl0d3VZVW5PR3didzdTbWFOWWYwQ3Vw?=
 =?utf-8?B?M016V0FEQXZEQWR3S2pmdzk4ZGN2dUZXWTMxWUVaNys2TkF2ZDZLYXJSOGFX?=
 =?utf-8?B?WWJTYVBHYkptSjBDVzMrSENCTmdCZEtHaUQycWFFU3JPdXcveDFEcVJLZmox?=
 =?utf-8?B?ZTFmLzJUWGcrcWorZUhpUG83VDRkUnNwaXNCV2JUMy9UV2kvVGtXWDVwWXQ5?=
 =?utf-8?B?SGU1UHdaWlkwM2kzVTRRbTF4NXVOZnliQ3d6STh0bkoxZ1lTc1ZZTUNWajA1?=
 =?utf-8?B?cVpKc0JIcmZDM09qU05FU2ttWU5nZy9BS2h5cGcxZ1lsQWdXdElUbVIxUXdG?=
 =?utf-8?B?ZWJIcmVja0FZOVJmMGhsaUpxekNtWnEyUzZyWFFGSit0cWxzcnV2WjlWMmR2?=
 =?utf-8?B?MU5QUFJyWjYyNG0xQkM5SUVkWCtrQ0V0VkdrM054aG56Z2ZnVE9VUjIvSS9Z?=
 =?utf-8?B?b3BPQmxYclNpVzZveWJ0Rmhwajl2amkrbGhGU3FPRmJDZk5HS1gvYTNVQnVK?=
 =?utf-8?B?NFJyaXQ2Tk5jVnhKQ09KOFVXZE9sQ29nTDVrbCtHaE05cGF5NmNKcU5sb2Zq?=
 =?utf-8?B?em1ESVNBVnFNZ2N1TDJXZzlXck9ySS9BZlQvd3VISzNpVExISFp4ejNFTGd6?=
 =?utf-8?B?bU15QXJEUms3SjliUERSWnVMTVgvVDVGa0JGTUpKQmJ2OFJZZXpieWg5TWhB?=
 =?utf-8?B?T3lQQ0pPZklnWEtLbG5QTGZvYUFnOTIzOEtFdHpodXFZRUtPcjdKVy9lK1Jn?=
 =?utf-8?B?eWFPclRlSlhDOUl0N3QxMVhoQkVDSnhRcnNvSmlEWTZUaVVIN0llamtlN1dw?=
 =?utf-8?B?dTRuTW1USE11dEtVRDhiakVZaEU5VVJSamFkOEtKY055dXg3cko2TG13TFNX?=
 =?utf-8?B?Z3cwUnlGRUdZT0Vwa2Vra3M3NkQ0bEdaRkZwQTE0QlRxM0VBbUJCc25EUkc5?=
 =?utf-8?B?UDllSDhvZHQxaGxETVFBTFhxRUtKN2RYMDYxU21SQjJvZ042SDcxbkN3Rk41?=
 =?utf-8?B?VjBWWFpMRjFwVzlCa1BON1BOTEZVZXF5OEtvNUhUcDN6UnpUVTh6eFNHZFN3?=
 =?utf-8?B?MmxDQnN4TnVIRERWQUtQVlRKYXlpYVYyVHQ4ejZvcURkVmpVS2pOSGpGOXFB?=
 =?utf-8?B?UUI5Y2ZBUzVZUmdIYVNLNWtIZXRpWEpOQXZEM3NSM3lIcnFDeFIvMldZekE5?=
 =?utf-8?B?U2ZQZyt0Vng4YUV1cUM5STRwcnB4dzNuaDhiZEwrb0d2OU5RTnhiQ3lTOXNV?=
 =?utf-8?B?Rm9WMjdveFFrdXpwNFR3NCtlZWlvQm1YOVBkQ0EzK01Sc2ZQekZIK0JNVjFo?=
 =?utf-8?B?L09jcS9xa0VwaFF6WUY3V2ZFdzU1V2Y5cVFnSHRvYzJTcmc4SUFMV1N2VHg4?=
 =?utf-8?B?M1pDbEhQUWtTSGZkc3B4clZhSjBISzBRTmN3WDNyTkxTcmJDb29JTjRRTkkw?=
 =?utf-8?B?anYvYmtYcHFYV0x5ZVhjclBWMVVkS3hVbmZoWTlGbzNIUWlIOW55Rnk1N1lU?=
 =?utf-8?B?YTd1dk8rZlEwV2s2SDRhQ09Tc05NeTdrSjRGZXh5Y3pDUVE1alRNY1VYbUxG?=
 =?utf-8?B?b3NNK2Z4VXlTNFIzZ0hINDI4c2NqYmF1dHhZRWo2ZnEzZ0NWUU1TQUNSc3h5?=
 =?utf-8?B?WWNsdzcxZ0M3Q1M1aWRLVWQ5MGw2cmZoTGpLQis0cHJCK2R6NElHQTN2R2xa?=
 =?utf-8?Q?xx56xycrgfwhCGd4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR03MB10049.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e3f00e-ecf5-4ff9-509a-08df18db874e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 18:58:45.6296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WHeOxv4HEkWsIkbx/Dtm+Xg/NU3cmg4otoN2uHha6oGzMpXJRXY5Z6V6V5Z7xAtCc4mWqfc1Sj0zlfwpd6WzMzXy7auXtLVOGu7oyUmkkDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR03MB10733
X-purgate-ID: tlsNG-42698a/1790103530-AA0C59EA-3A0C6932/0/0
X-purgate-type: clean
X-purgate-size: 5842

U2luY2UgdGhlIGZpcm13YXJlIG1heSBpbml0aWFsaXplIGVTUElzIGJlZm9yZSBYZW4sIGFuZCB3
aXRob3V0DQpDT05GSUdfR0lDVjNfRVNQSSBlbmFibGVkLCBYZW4gd291bGQgbm90IHJlaW5pdGlh
bGl6ZSB0aGVtIHByb3Blcmx5DQpkdXJpbmcgYm9vdC4gSW4gc3VjaCBjYXNlcywgb25jZSB0aGUg
R0lDIGlzIHJlLWVuYWJsZWQgaW4gWGVuLA0KaW50ZXJydXB0cyBtYXkgYmUgcmVjZWl2ZWQgdGhh
dCBjYW5ub3QgYmUgaGFuZGxlZC4NCg0KVG8gZW5zdXJlIHByb3BlciBvcGVyYXRpb24gb24gaGFy
ZHdhcmUgd2l0aCBlU1BJIGZlYXR1cmUsIGV2ZW4gd2hlbiB0aGUgZVNQSQ0KY29uZmlnIGlzIGRp
c2FibGVkLCBnaWN2M19kaXN0X2VzcGlfY29tbW9uX2luaXQoKSBzaG91bGQgYmUgaW52b2tlZA0K
cmVnYXJkbGVzcyBvZiB3aGV0aGVyIENPTkZJR19HSUNWM19FU1BJIGlzIGVuYWJsZWQgb3Igbm90
LiBUaGlzIHdpbGwgbm90DQphZmZlY3QgaGFyZHdhcmUgd2l0aG91dCBlU1BJIHN1cHBvcnQsIGFz
IHRoZSBmdW5jdGlvbiBjaGVja3MgaWYgdGhlDQpoYXJkd2FyZSBzdXBwb3J0cyBlU1BJcyBieSBy
ZWFkaW5nIHRoZSBHSUNEX1RZUEVSLkVTUEkgZmllbGQgKHVzaW5nDQpHSUNEX1RZUEVSX0VTUElT
X05VTSBtYWNybyksIHdoaWNoIGluZGljYXRlcyB3aGV0aGVyIHRoZSBleHRlbmRlZCBTUEkNCnJh
bmdlIGlzIHN1cHBvcnRlZC4gSWYgdGhlIGhhcmR3YXJlIGRvZXMgbm90IHN1cHBvcnQgZVNQSSwg
dGhlIGZ1bmN0aW9uDQp3aWxsIG5vdCBwZXJmb3JtIGFueSBhY3Rpb25zLg0KDQpUaGVyZSBhcmUg
bm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGZvciBzZXR1cHMgd2hlcmUgQ09ORklHX0dJQ1YzX0VTUEk9
eS4NCg0KU3VnZ2VzdGVkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KU2ln
bmVkLW9mZi1ieTogTGVvbmlkIEtvbWFyaWFuc2t5aSA8bGVvbmlkX2tvbWFyaWFuc2t5aUBlcGFt
LmNvbT4NCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24uY29tPg0KLS0tDQpD
aGFuZ2VzIGluIHYyOg0KLSByZWJhc2VkIG9uIHRoZSBjdXJyZW50IHN0YWdpbmcNCi0gcGxhY2Vk
IFN1Z2dlc3RlZC1ieSB0YWcgZmlyc3QgdG8ga2VlcCB0YWdzIGluIGNocm9ub2xvZ2ljYWwgb3Jk
ZXINCi0gYWRkZWQgQWNrZWQtYnkgZnJvbSBKdWxpZW4gR3JhbGwNCg0KVGhpcyBpcyBhIGZvbGxv
dy11cCBwYXRjaCByZWxhdGVkIHRvIHRoZSBkaXNjdXNzaW9uOg0KaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcveGVuLWRldmVsLzgyMDcwNGQwLTQwNDctNGYwMi1hMDU4LTAxZGFiYTI3NjVmMUB4ZW4u
b3JnLw0KDQpTZW5kaW5nIHYyIHdpdGggdGhlIHJlcXVlc3RlZCBjaGFuZ2VzLCBhcyBJIG9ubHkg
bm93IG5vdGljZWQNCnRoYXQgdGhpcyBwYXRjaCBoYXMgbm90IGJlZW4gbWVyZ2VkIHlldC4NCi0t
LQ0KIHhlbi9hcmNoL2FybS9naWMtdjMuYyAgICAgICAgICAgICAgICAgIHwgMzIgKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0NCiB4ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMu
aCB8ICAyIC0tDQogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlv
bnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9naWMtdjMuYyBiL3hlbi9hcmNoL2Fy
bS9naWMtdjMuYw0KaW5kZXggYWNkYWMyMjk1My4uNDYzNzY5ZDc3YiAxMDA2NDQNCi0tLSBhL3hl
bi9hcmNoL2FybS9naWMtdjMuYw0KKysrIGIveGVuL2FyY2gvYXJtL2dpYy12My5jDQpAQCAtNzAz
LDE3ICs3MDMsMzIgQEAgdW5zaWduZWQgaW50IGdpY19udW1iZXJfZXNwaXModm9pZCkNCiAgICAg
cmV0dXJuIGdpY19od19vcHMtPmluZm8tPm5yX2VzcGk7DQogfQ0KIA0KK3N0YXRpYyB2b2lkIF9f
aW5pdCBnaWN2M19kaXN0X2VzcGlfaW5pdF9hZmYodWludDY0X3QgYWZmaW5pdHkpDQorew0KKyAg
ICB1bnNpZ25lZCBpbnQgaTsNCisNCisgICAgZm9yICggaSA9IDA7IGkgPCBnaWN2M19pbmZvLm5y
X2VzcGk7IGkrKyApDQorICAgICAgICB3cml0ZXFfcmVsYXhlZF9ub25fYXRvbWljKGFmZmluaXR5
LCBHSUNEICsgR0lDRF9JUk9VVEVSbkUgKyBpICogOCk7DQorfQ0KKyNlbHNlDQorDQorc3RhdGlj
IHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfZXNwaV9pbml0X2FmZih1aW50NjRfdCBhZmZpbml0eSkg
eyB9DQorI2VuZGlmDQorDQogc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfZXNwaV9jb21t
b25faW5pdCh1aW50MzJfdCB0eXBlKQ0KIHsNCiAgICAgdW5zaWduZWQgaW50IGVzcGlfbnIsIGk7
DQogDQogICAgIGVzcGlfbnIgPSBtaW4oMTAyNFUsIEdJQ0RfVFlQRVJfRVNQSVNfTlVNKHR5cGUp
KTsNCisjaWZkZWYgQ09ORklHX0dJQ1YzX0VTUEkNCiAgICAgZ2ljdjNfaW5mby5ucl9lc3BpID0g
ZXNwaV9ucjsNCisjZW5kaWYNCiAgICAgLyogVGhlIEdJQyBIVyBkb2Vzbid0IHN1cHBvcnQgZVNQ
SSwgc28gd2UgY2FuIGxlYXZlIGZyb20gaGVyZSAqLw0KLSAgICBpZiAoIGdpY3YzX2luZm8ubnJf
ZXNwaSA9PSAwICkNCisgICAgaWYgKCBlc3BpX25yID09IDAgKQ0KICAgICAgICAgcmV0dXJuOw0K
IA0KLSAgICBwcmludGsoIkdJQ3YzOiAldSBlU1BJIGxpbmVzXG4iLCBnaWN2M19pbmZvLm5yX2Vz
cGkpOw0KKyAgICBpZiAoIElTX0VOQUJMRUQoQ09ORklHX0dJQ1YzX0VTUEkpICkNCisgICAgICAg
IHByaW50aygiR0lDdjM6ICV1IGVTUEkgbGluZXNcbiIsIGVzcGlfbnIpOw0KIA0KICAgICAvKiBU
aGUgY29uZmlndXJhdGlvbiBmb3IgZVNQSXMgaXMgc2ltaWxhciB0byB0aGF0IGZvciByZWd1bGFy
IFNQSXMgKi8NCiAgICAgZm9yICggaSA9IDA7IGkgPCBlc3BpX25yOyBpICs9IDE2ICkNCkBAIC03
MzMsMTkgKzc0OCw2IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBnaWN2M19kaXN0X2VzcGlfY29tbW9u
X2luaXQodWludDMyX3QgdHlwZSkNCiAgICAgICAgIHdyaXRlbF9yZWxheGVkKEdFTk1BU0soMzEs
IDApLCBHSUNEICsgR0lDRF9JR1JPVVBSbkUgKyAoaSAvIDMyKSAqIDQpOw0KIH0NCiANCi1zdGF0
aWMgdm9pZCBfX2luaXQgZ2ljdjNfZGlzdF9lc3BpX2luaXRfYWZmKHVpbnQ2NF90IGFmZmluaXR5
KQ0KLXsNCi0gICAgdW5zaWduZWQgaW50IGk7DQotDQotICAgIGZvciAoIGkgPSAwOyBpIDwgZ2lj
djNfaW5mby5ucl9lc3BpOyBpKysgKQ0KLSAgICAgICAgd3JpdGVxX3JlbGF4ZWRfbm9uX2F0b21p
YyhhZmZpbml0eSwgR0lDRCArIEdJQ0RfSVJPVVRFUm5FICsgaSAqIDgpOw0KLX0NCi0jZWxzZQ0K
LXN0YXRpYyB2b2lkIF9faW5pdCBnaWN2M19kaXN0X2VzcGlfY29tbW9uX2luaXQodWludDMyX3Qg
dHlwZSkgeyB9DQotDQotc3RhdGljIHZvaWQgX19pbml0IGdpY3YzX2Rpc3RfZXNwaV9pbml0X2Fm
Zih1aW50NjRfdCBhZmZpbml0eSkgeyB9DQotI2VuZGlmDQotDQogc3RhdGljIHZvaWQgX19pbml0
IGdpY3YzX2Rpc3RfaW5pdCh2b2lkKQ0KIHsNCiAgICAgdWludDMyX3QgdHlwZTsNCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vZ2ljX3YzX2RlZnMuaCBiL3hlbi9hcmNoL2Fy
bS9pbmNsdWRlL2FzbS9naWNfdjNfZGVmcy5oDQppbmRleCAzNzE0Y2ZlYjdkLi4yMDgxYjJmZThm
IDEwMDY0NA0KLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL2dpY192M19kZWZzLmgNCisr
KyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9naWNfdjNfZGVmcy5oDQpAQCAtNjMsNyArNjMs
NiBAQA0KICNkZWZpbmUgR0lDRF9JUk9VVEVSbkUgICAgICAgICAgICAgICAoMHg4MDAwKQ0KICNk
ZWZpbmUgR0lDRF9JUk9VVEVSbkVOICAgICAgICAgICAgICAoMHg5RkZDKQ0KIA0KLSNpZmRlZiBD
T05GSUdfR0lDVjNfRVNQSQ0KICNkZWZpbmUgR0lDRF9UWVBFUl9FU1BJX1NISUZUICAgICAgICA4
DQogI2RlZmluZSBHSUNEX1RZUEVSX0VTUElfUkFOR0VfU0hJRlQgIDI3DQogI2RlZmluZSBHSUNE
X1RZUEVSX0VTUElfUkFOR0VfTUFTSyAgICgweDFGKQ0KQEAgLTczLDcgKzcyLDYgQEANCiAjZGVm
aW5lIEdJQ0RfVFlQRVJfRVNQSVNfTlVNKHR5cGVyKSAgICBcDQogICAgICAgICAoKCh0eXBlcikg
JiBHSUNEX1RZUEVSX0VTUEkpID8gXA0KICAgICAgICAgR0lDRF9UWVBFUl9FU1BJX1JBTkdFKCh0
eXBlcikgPj4gR0lDRF9UWVBFUl9FU1BJX1JBTkdFX1NISUZUKSA6IDApDQotI2VuZGlmDQogDQog
LyogQ29tbW9uIGJldHdlZW4gR0lDRF9QSURSMiBhbmQgR0lDUl9QSURSMiAqLw0KICNkZWZpbmUg
R0lDX1BJRFIyX0FSQ0hfTUFTSyAgICAgICAgICgweGYwKQ0KLS0gDQoyLjM0LjENCg==

