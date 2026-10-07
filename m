Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889DBCA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 00:06:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441812.1659331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBJ-0007xB-31; Wed, 07 Oct 2026 00:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441812.1659331; Wed, 07 Oct 2026 00:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEFBJ-0007x4-0E; Wed, 07 Oct 2026 00:06:49 +0000
Received: by outflank-mailman (input) for mailman id 1441812;
 Wed, 07 Oct 2026 00:06:47 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <milan_djokic@epam.com>) id 1xEFBH-0007vo-CE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 00:06:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEFBG-00HHQD-PA
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 02:06:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58cfa-8faa-0a2a0a5109dd-0a2a4509c6b0-22
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:06:46 +0200
Received: from [52.101.70.110]
 (helo=AS8PR04CU009.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <milan_djokic@epam.com>)
 id 6ac58d16-be1a-0a2a45090019-3465466ed6be-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 02:06:46 +0200
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com (2603:10a6:20b:595::7)
 by AS4PR03MB8229.eurprd03.prod.outlook.com (2603:10a6:20b:4fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 7 Oct
 2026 00:06:44 +0000
Received: from AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5]) by AS2PR03MB9587.eurprd03.prod.outlook.com
 ([fe80::daa7:3b97:acb3:67d5%5]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 00:06:44 +0000
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
 b=SwOawrtHUkIw5W50HiOpUyICniTOKTal302ni152Fp9JbJp9Tb0VQyLz00FI4Jyvzrd87RO7rleLTBvgJSM84mvCVsZMFT1iarxOBB+25MMgEaaXoqseLJJ9aWUmGOr6Rs3tT7qzZpGvk1CqU3iWA4ZFHOvLjxlDyHAoOtf7UJpnRtWA3yat/bbE2y0YyWydnvra/B7476KCZplK57CluxWvKB9k5PTatcQJ/6fHjB1UlHGXyv102nQTuYRhrirbLsveV5wxQh/rBPfRy/nt2NOEnRQs4iOPqF6Qr32P4ivZNBl7ypBf1k2jVQy7weBw6O9MHZUzAafMq0JgW+GYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5uw3+PZK1x4AE2vbC6jzc6Fds0StjgaUR1yhHZVSTk=;
 b=iUf7Lc2Xi2rApR86/JFEA3Z6Zr3A9JTcoFLv1nDLaTM1I0yifhhIMRiCYtIdS90xoKdLQGWnG/JzivEJsIl79KOlmJM+6+hHLlmUmY8dtpGlXt4GSuUb0i0tgMR2eks5xq83EFZDlNCpT9T1otdgqvRl50z/54DUUrG2jq7EsKCvNfxB/uo01aEo5rJprtiormzE+9oEoxzbJlf0FVCT2rNfTlGjrt3QMb82N7HdQMXXTDa5PSFrft26C15xkRAdOcgAkGbMgPW9uAmXQnX+r7/hKDVQkkfoUzukRHhvR4DSr/jJO293TSr6yjr8ts9BNFXU6bFqlPUHSQlRC7Xs8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5uw3+PZK1x4AE2vbC6jzc6Fds0StjgaUR1yhHZVSTk=;
 b=bQ9v2+40FzDAvaeKWDsZi3l913Q0RLefAX6Cf97QNqY8O2qowUjSNeNHjzBVQ0QcW8Kx6dY7pWMpOh5zXVGj5cqq7SYtd3skj7GS8mKRurX3uI76/N+7uYdh3wRN6Bqq6WrIS+EkRHir0CjJ40JUghcDrEtqMKSLEw38etUmAfPdcrJTpDdYERjkonht2JpYwNL9TRAja9CgpInpBkLOsLY8L1Wr6i08fmrMq6HGmBX0qZPAV7+OzgVofVtvtzalTbxRZpOY0FTYxUidkRtZlkRw9E4Ba5dKyDZcFU3XcZbWfNlH6jq4veyBaMvpW6YLoPQWe7e5R8PvM24sVzEMig==
From: Milan Djokic <milan_djokic@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Rahul Singh <rahul.singh@arm.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Milan Djokic <milan_djokic@epam.com>
Subject: [PATCH v4 03/22] xen/arm: smmuv3: Alloc io_domain for each device
Thread-Topic: [PATCH v4 03/22] xen/arm: smmuv3: Alloc io_domain for each
 device
Thread-Index: AQHdVe+9NDppc5gYoUqPmrNkiw396g==
Date: Wed, 7 Oct 2026 00:06:44 +0000
Message-ID:
 <f90e0204a1ccefd4e78f961171a7dfbe7a78e478.1791328190.git.milan_djokic@epam.com>
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
x-ms-office365-filtering-correlation-id: 2fe88597-e791-4e9e-3563-08df2406df82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|56012099006|11063799006|10067099003|6133799003|22082099003|38070700021|18002099003;
x-microsoft-antispam-message-info:
 WyVAe6HItfkL8OQfkcr6H9nrz1MrVHZJVc34M9xMgA5io9YBptW8rmA49kgxo+/uwPxqCBh3T/iFTPUuklIM6KgEkWRvoRxLWHjQrU0CJTTE5hhr+DifVrDRt+lXv18utOEJydo4voCsNt8RTC3Acu/mFFrZ3xDsr/YyU9n7osMz1ONClmNIW+e4hjuXd7HVWN62vpN6YN/XsofwKu73FwD5z7FqBPj7MEKPko2uKS230o5gA77ot1fUcZw2GAfrnrhBUOBzRscBUOmZwfKLvbMXRZYrjTrnYn9D/eenvCyzvmbywH3BJ3m3KUDgZ6cTYJcJRQvOFLBYVHUY3A3gEcsQArpsDXrRQmCAyBV9Y5bWPX3NjSvp9a+MxFpoc3F/PZGQ5sm60I6aoz7LSYh8zTXOY2ofnb3oikisMqQEV9WBuCPCUso4ELRBajFPNvKSIGew+Ld+0dgkwAb0WdpsuWl9RpFn9594dOGq0wPGG08dpa0mURU3r6bcrSY7s8DBwJwL+p0xk+2XbGVNWp3v2uEuSI500k7cGPFgzqr1qAYJKcdv1WahqXRaLH8mpaWcuOXxntyk4mkQkhBzkj9d30+XvPtblxBlh6Knu/0WY6bZ/JEYAu59+AUEZ9nOGq2R0yGGg+SflfR1M/tSx4gujOvkgeSHo+/uzsA/uDHuvpB3X6WFpPtV5TCu01/xN7WEP4+l9FX/+MSD2jE3MgCSEWhbpG91xFxbW37ayWiodoM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB9587.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(6133799003)(22082099003)(38070700021)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVFRdWkrTDBISm5VNnp6dm9kY3p5NVEzclhDdmZVdm5pYm9SeTRWNUxHRWdx?=
 =?utf-8?B?WkZBQk9kU0NQQlRYTTlSVm5JcmpZTWFORFNOQXp6VzNYUWFQSGkrTVpzMlF0?=
 =?utf-8?B?T3lQMEd2T2dCaFhnakFrd001aTdxbkRWdEFWbmVXN1JxbVczOURBVzZLb0dy?=
 =?utf-8?B?ek5ZV3o2SHJoaUNKdHAyekVJbFpIaHgvWEttR2U2dXlORC9ka1ljdEtzMkt3?=
 =?utf-8?B?S0lRWmdBSFhaVDBkMHArQXB3TmtPWEpCVkh6NURHZEtHS2pMWFpiZmdLdjd1?=
 =?utf-8?B?V1A2YjN2SGUxcnJXUkVoRXNnT3RSUHhVLzlsc1NSaElSTmN2dnFnbk8raFVi?=
 =?utf-8?B?dFMxd2tiajlVMFNIckphOC9OcFBhMGVOVjJlMnBnQUhFMGladzB3ZVFaeVpX?=
 =?utf-8?B?clM5Y204MG9LcWJ6K002N0k5UGtWOUJqbVl0SHdzV0kzRHRkZVBWbjQ1Q2s2?=
 =?utf-8?B?Z1pSVlpRWmxKUnVXNmpzM2pqaUdJTUE3YXlBNjByMU81d0RCVDNQWnFtSE12?=
 =?utf-8?B?ZHk1L1pBVVh2NmFrRzlPZVpKclpORWFQbkJsWFRsWUNQYkl4MGhOZzdCODZZ?=
 =?utf-8?B?a1VLUlZXZ2Juc2xQMXAreG9vTHloMytJMXRWTUpiVU1VUHNMbUJuVVdBMmZs?=
 =?utf-8?B?VEVUWDh5WXo0aXlaZ3p4bklYVXdQN1hzVGNRakppWktPZ0JqazRtdkRNblAr?=
 =?utf-8?B?UjErdXFHbnFzWmJQWWE2dDQvaVVCOS9pNmlyU051Vm9uOVRveFlxQUtnRm5F?=
 =?utf-8?B?MjMwbG9ZKzVEVzFlSjJqMm1WOHExZklwc2xhZVVTRHJOWFowQTVEM0xmM3Fi?=
 =?utf-8?B?NWl1VjNSTVZOUkp3akpXdG85NlQzZWppSUkyWHZwcG9OODdOMWVSZkcrdHY3?=
 =?utf-8?B?UXFlUFBaeHEzN2wwaVZoYndiREwvQXVmS2pCTFVkN283ek5laXBqMlE3Tmp3?=
 =?utf-8?B?M3VkeDlqTW5xZTlNdDcvOUFVdkdmY2JtUnkxZXRTYjhkTThSVXZ1UnRyRGN4?=
 =?utf-8?B?dVVmMXFaRjQ4enlwYzJ3WlVvenFiQVVGQ1VxMXVLaXdQMW5ESUY3djA4OFRF?=
 =?utf-8?B?ZVZzVTRWcWhmL1dqY1pBYkkvdk5NQkdybTdoNCt4L01NTUlWZ094dnZMbGNY?=
 =?utf-8?B?S2piUGRzSXRzOS9EUE50azUxblgzeEtkMTNHeTVmbWI5Z2k2SHNYSHNYUDBk?=
 =?utf-8?B?amdSSDVkVFR1QWF5RE9zVnBHWmtVNGxaQzRxYmdmZmZnRWxJakZvS3g4ZmtJ?=
 =?utf-8?B?ME5QdDJkdEZtUnFnK0RsVUlZWUdrUUlCTmFMS0MyNHJ2M29scjFOQ1dTamc1?=
 =?utf-8?B?Rm4vMXRTdUE2ZW8wZzRKcG1PMWoyUkV4TVl4clRnME5ZQ0RoTlAvRUZsODN6?=
 =?utf-8?B?dnBUUDRtRFpIazdPQVpIckVTWmFQNlVQekltZlR4K3lQcENHdzY4Njdyc2ha?=
 =?utf-8?B?cFdNcndJOTI3UzZ6SEJsclNvU2p3cTM3NlJBRFhNcUdqUkxVOHBDTkNTSElv?=
 =?utf-8?B?QW1uaHJsczJQeHFoWTlNNjFFemhoSENmdGJ0QkJUS0xEQngwdVY3N1k5dlcw?=
 =?utf-8?B?OVNpb3h4U2FCTE1qbW15M0ZtMGRYTUt6dzZtcUF1R1hpV0tCU3ltY3oxL2Uw?=
 =?utf-8?B?SzRYSy9vRzdpemVrZHJUZUdiamJ0dU1DcldqQ01GZlNYS3JwYWpSU25mdmx3?=
 =?utf-8?B?NEM2K2xzUG1ZZ0Ivc1JNcWxNR2xuWlNwY2pjVVZlMlErbUd3V2NzWEM1Qzls?=
 =?utf-8?B?QXd4M0t0ZlhMUVB3ZldLcE5YUElaUU5lRFlIYjQxaGxtb1pDQVNBeTlaVjAw?=
 =?utf-8?B?eXZ3NXhidyt4VnRtTFE4UE8zY3oxbUFRblpMa29yUEJtSUc0SzBIRHRBZGFE?=
 =?utf-8?B?QmxSVFlVbUJkQW0yUEo4RnZ4RHhEVHZSc3hYZTJyRVFOdVB6WnJ4RlgwR1Ay?=
 =?utf-8?B?dnRwam1vb3VsblRoRFZ3NWpGQ3N1N3YwUm9EUXNRc0VRYUUvUHRGUHptcG1D?=
 =?utf-8?B?REVLWG9NelpOVDdlbXNCMnVhdU9yOW5Jbmo0ZVlNQ3dwMTRUZFVlait3VmUz?=
 =?utf-8?B?bGw1RE8wVVFYdUtMd0NjR1gvVkpIQzZSazdKekpDQ29RZHJXOUtHT1dZTGZ1?=
 =?utf-8?B?bjg2Mm1XZ3R5d040eUVWeUwxWlNReG4xaGxxOHpVd0R3K01leUowcDJxMjAy?=
 =?utf-8?B?WFhoWGc0NCtNcmpyZjhha0VIeXljMXFZaVZ5QVRLMWdzbU9jck9QMGRyeVh3?=
 =?utf-8?B?cTRxOWZoRTRuekp3cEhuNm9uckllNm1razZNc2o5SVV0VjgvaUZWZWYveTZn?=
 =?utf-8?B?L0I2VzZxZEphNzc3cXUyU0dNYTJkaEFyRWRUZy8rVXVPbEhNRUZiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB9587.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fe88597-e791-4e9e-3563-08df2406df82
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2026 00:06:44.7617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dULlYYKIK/f4PPYwfifnGUTjVhUNTXk+uKcd0wJLD30AEW44L1/kj1EogjROESpqM5dBtcNi7bIVoZHPSp+Fcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR03MB8229
X-purgate-ID: tlsNG-bad1c0/1791331606-BE6DA034-958D5176/0/0
X-purgate-type: clean
X-purgate-size: 8552

RnJvbTogUmFodWwgU2luZ2ggPHJhaHVsLnNpbmdoQGFybS5jb20+DQoNCkluIGN1cnJlbnQgaW1w
bGVtZW50YXRpb24gaW9fZG9tYWluIGlzIGFsbG9jYXRlZCBvbmNlIGZvciBlYWNoIHhlbg0KZG9t
YWluIGFzIFN0YWdlMiB0cmFuc2xhdGlvbiBpcyBjb21tb24gZm9yIGFsbCBkZXZpY2VzIGluIHNh
bWUgeGVuDQpkb21haW4uDQoNCk5lc3RlZCBzdGFnZSBzdXBwb3J0cyBTMSBhbmQgUzIgY29uZmln
dXJhdGlvbiBhdCB0aGUgc2FtZSB0aW1lLiBTdGFnZTENCnRyYW5zbGF0aW9uIHdpbGwgYmUgZGlm
ZmVyZW50IGZvciBlYWNoIGRldmljZSBhcyBsaW51eCBrZXJuZWwgd2lsbA0KYWxsb2NhdGUgcGFn
ZS10YWJsZSBmb3IgZWFjaCBkZXZpY2UuDQoNCkFsbG9jIGlvX2RvbWFpbiBmb3IgZWFjaCBkZXZp
Y2Ugc28gdGhhdCBlYWNoIGRldmljZSBjYW4gaGF2ZSBkaWZmZXJlbnQNClN0YWdlLTEgYW5kIFN0
YWdlLTIgY29uZmlndXJhdGlvbiBzdHJ1Y3R1cmUuDQoNClRoZSBzdGFnZS0yIGNvbmZpZ3VyYXRp
b24gaXMgbm93IHNoYXJlZCBiZXR3ZWVuIGRldmljZXMgYmVsb25naW5nIHRvDQp0aGUgc2FtZSBk
b21haW4uIFVwZGF0ZSBpb19kb21haW4gaW5pdGlhbGl6YXRpb24gdG8gY3JlYXRlIGEgbmV3IHN0
YWdlLTINCmNvbmZpZ3VyYXRpb24gb25seSBpZiBhIFZNSUQgaGFzIG5vdCBhbHJlYWR5IGJlZW4g
YWxsb2NhdGVkIGZvciB0aGUNCnRhcmdldCBYZW4gZG9tYWluLiBTaW1pbGFybHksIHVwZGF0ZSBp
b19kb21haW4gdGVhcmRvd24gdG8gZnJlZSB0aGUNClZNSUQgb25seSB3aGVuIG5vIG90aGVyIGRl
dmljZXMgYXJlIGFzc2lnbmVkIHRvIHRoZSB0YXJnZXQgZG9tYWluLg0KQWxzbyBvcHRpbWl6ZSB0
aGUgSU9UTEIgZmx1c2ggcHJvY2VkdXJlIHRvIGludmFsaWRhdGUgZWFjaCBWTUlEIG9ubHkNCm9u
Y2UuDQoNClNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdoIDxyYWh1bC5zaW5naEBhcm0uY29tPg0K
U2lnbmVkLW9mZi1ieTogTWlsYW4gRGpva2ljIDxtaWxhbl9kam9raWNAZXBhbS5jb20+DQotLS0N
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS12My5jIHwgMTAyICsrKysrKysrKysr
KysrKysrKysrKysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDk0IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21t
dS12My5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL3NtbXUtdjMuYw0KaW5kZXggZDNl
ODhkNWE1NS4uYmQwNjg5NjY0YiAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FybS9zbW11LXYzLmMNCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9zbW11LXYz
LmMNCkBAIC0xMjI5LDE0ICsxMjI5LDQ5IEBAIHN0YXRpYyB2b2lkIGFybV9zbW11X2JpdG1hcF9m
cmVlKHVuc2lnbmVkIGxvbmcgKm1hcCwgaW50IGlkeCkNCiAJY2xlYXJfYml0KGlkeCwgbWFwKTsN
CiB9DQogDQorc3RhdGljIHN0cnVjdCBhcm1fc21tdV9kb21haW4gKmFybV9zbW11X2dldF9kb21h
aW5fczIoc3RydWN0IGRvbWFpbiAqZCwNCisJCQkJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21t
dSkNCit7DQorCXN0cnVjdCBpb21tdV9kb21haW4gKmlvX2RvbWFpbjsNCisJc3RydWN0IGFybV9z
bW11X2RvbWFpbiAqc21tdV9kb21haW47DQorCXN0cnVjdCBhcm1fc21tdV94ZW5fZG9tYWluICp4
ZW5fZG9tYWluID0gZG9tX2lvbW11KGQpLT5hcmNoLnByaXY7DQorDQorCWlmICghc21tdSkNCisJ
CXJldHVybiBOVUxMOw0KKw0KKwkvKg0KKwkgKiBMb29wIHRocm91Z2ggdGhlICZ4ZW5fZG9tYWlu
LT5jb250ZXh0cyB0byBsb2NhdGUgYSBjb250ZXh0DQorCSAqIGFzc2lnbmVkIHRvIHRoaXMgU01N
VQ0KKwkgKi8NCisJbGlzdF9mb3JfZWFjaF9lbnRyeShpb19kb21haW4sICZ4ZW5fZG9tYWluLT5j
b250ZXh0cywgbGlzdCkgew0KKwkJc21tdV9kb21haW4gPSB0b19zbW11X2RvbWFpbihpb19kb21h
aW4pOw0KKwkJaWYgKHNtbXVfZG9tYWluLT5zbW11ID09IHNtbXUgJiYNCisJCQlzbW11X2RvbWFp
bi0+czJfY2ZnLnZtaWQgIT0gSU5WQUxJRF9WTUlEKQ0KKwkJCQlyZXR1cm4gc21tdV9kb21haW47
DQorCX0NCisNCisJcmV0dXJuIE5VTEw7DQorfQ0KKw0KIHN0YXRpYyB2b2lkIGFybV9zbW11X2Rv
bWFpbl9mcmVlKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbikNCiB7DQogCXN0cnVjdCBhcm1f
c21tdV9kb21haW4gKnNtbXVfZG9tYWluID0gdG9fc21tdV9kb21haW4oZG9tYWluKTsNCiAJc3Ry
dWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IHNtbXVfZG9tYWluLT5zbW11Ow0KIAlzdHJ1Y3Qg
YXJtX3NtbXVfczJfY2ZnICpjZmcgPSAmc21tdV9kb21haW4tPnMyX2NmZzsNCisJc3RydWN0IGFy
bV9zbW11X2RvbWFpbiAqZXhpc3Rpbmc7DQogDQotCWlmIChjZmctPnZtaWQpDQotCQlhcm1fc21t
dV9iaXRtYXBfZnJlZShzbW11LT52bWlkX21hcCwgY2ZnLT52bWlkKTsNCisJaWYgKGNmZy0+dm1p
ZCkgew0KKwkJLyoNCisJCSAqIFZNSURzIGFyZSBzaGFyZWQgYWNyb3NzIGNvbnRleHRzIGJlbG9u
Z2luZyB0byB0aGUgc2FtZQ0KKwkJICogWGVuIGRvbWFpbiBhbmQgU01NVS4gVGhlIGN1cnJlbnQg
ZG9tYWluIGhhcyBhbHJlYWR5IGJlZW4NCisJCSAqIHJlbW92ZWQgZnJvbSB0aGUgZG9tYWluIGxp
c3QsIHNvIHRoaXMgbG9va3VwIG9ubHkgZmluZHMNCisJCSAqIHJlbWFpbmluZyB1c2VycyBvZiB0
aGUgVk1JRC4NCisJCSAqLw0KKwkJZXhpc3RpbmcgPSBhcm1fc21tdV9nZXRfZG9tYWluX3MyKHNt
bXVfZG9tYWluLT5kLCBzbW11KTsNCisNCisJCWlmICghZXhpc3RpbmcpDQorCQkJYXJtX3NtbXVf
Yml0bWFwX2ZyZWUoc21tdS0+dm1pZF9tYXAsIGNmZy0+dm1pZCk7DQorCX0NCiANCiAJeGZyZWUo
c21tdV9kb21haW4pOw0KIH0NCkBAIC0xMzE2LDYgKzEzNTEsNyBAQCBzdGF0aWMgaW50IGFybV9z
bW11X2RvbWFpbl9maW5hbGlzZShzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sDQogCWludCBy
ZXQ7DQogCXN0cnVjdCBhcm1fc21tdV9kb21haW4gKnNtbXVfZG9tYWluID0gdG9fc21tdV9kb21h
aW4oZG9tYWluKTsNCiAJc3RydWN0IGFybV9zbW11X2RldmljZSAqc21tdSA9IHNtbXVfZG9tYWlu
LT5zbW11Ow0KKwlzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICpleGlzdGluZzsNCiANCiAJaWYgKCEo
c21tdS0+ZmVhdHVyZXMgJiBBUk1fU01NVV9GRUFUX1RSQU5TX1MyKSkNCiAJCXJldHVybiAwOw0K
QEAgLTEzMjcsNiArMTM2MywyNiBAQCBzdGF0aWMgaW50IGFybV9zbW11X2RvbWFpbl9maW5hbGlz
ZShzdHJ1Y3QgaW9tbXVfZG9tYWluICpkb21haW4sDQogCSAqLw0KIAlzbW11X2RvbWFpbi0+c3Rh
Z2UgPSBBUk1fU01NVV9ET01BSU5fUzI7DQogDQorCS8qDQorCSAqIExvb2sgZm9yIGFuIGFscmVh
ZHkgaW5pdGlhbGl6ZWQgc3RhZ2UtMiBjb25maWd1cmF0aW9uIGZvciB0aGlzDQorCSAqIFhlbiBk
b21haW4gYW5kIFNNTVUuDQorCSAqLw0KKwlleGlzdGluZyA9IGFybV9zbW11X2dldF9kb21haW5f
czIoc21tdV9kb21haW4tPmQsIHNtbXUpOw0KKw0KKwlpZiAoZXhpc3RpbmcpIHsNCisJCS8qDQor
CQkgKiBSZXVzZSB0aGUgc3RhZ2UtMiBjb25maWd1cmF0aW9uLg0KKwkJICovDQorCQlzbW11X2Rv
bWFpbi0+czJfY2ZnLnZtaWQgPSBleGlzdGluZy0+czJfY2ZnLnZtaWQ7DQorCQlzbW11X2RvbWFp
bi0+czJfY2ZnLnZ0dGJyID0gZXhpc3RpbmctPnMyX2NmZy52dHRicjsNCisJCXNtbXVfZG9tYWlu
LT5zMl9jZmcudnRjciA9IGV4aXN0aW5nLT5zMl9jZmcudnRjcjsNCisJCXJldHVybiAwOw0KKwl9
DQorDQorCS8qDQorCSAqIElmIG5vIGV4aXN0aW5nIHN0YWdlLTIgY29uZmlndXJhdGlvbiBmb3Ig
dGhpcw0KKwkgKiAoWGVuIGRvbWFpbiwgU01NVSksIGNyZWF0ZSBpdA0KKwkgKi8NCiAJcmV0ID0g
YXJtX3NtbXVfZG9tYWluX2ZpbmFsaXNlX3MyKHNtbXVfZG9tYWluLCBtYXN0ZXIpOw0KIAlpZiAo
cmV0IDwgMCkNCiAJCXJldHVybiByZXQ7DQpAQCAtMjgwNywyMCArMjg2Myw0MCBAQCBzdGF0aWMg
dWludDMyX3QgX19yb19hZnRlcl9pbml0IHBsYXRmb3JtX2ZlYXR1cmVzID0gQVJNX1NNTVVfRkVB
VF9DT0hFUkVOQ1k7DQogc3RhdGljIGludCBfX211c3RfY2hlY2sgYXJtX3NtbXVfaW90bGJfZmx1
c2hfYWxsKHN0cnVjdCBkb21haW4gKmQpDQogew0KIAlzdHJ1Y3QgYXJtX3NtbXVfeGVuX2RvbWFp
biAqeGVuX2RvbWFpbiA9IGRvbV9pb21tdShkKS0+YXJjaC5wcml2Ow0KLQlzdHJ1Y3QgaW9tbXVf
ZG9tYWluICppb19kb21haW47DQorCXN0cnVjdCBpb21tdV9kb21haW4gKmlvX2RvbWFpbiwgKnBy
ZXY7DQogDQogCXNwaW5fbG9jaygmeGVuX2RvbWFpbi0+bG9jayk7DQogDQogCWxpc3RfZm9yX2Vh
Y2hfZW50cnkoaW9fZG9tYWluLCAmeGVuX2RvbWFpbi0+Y29udGV4dHMsIGxpc3QpIHsNCisJCXN0
cnVjdCBhcm1fc21tdV9kb21haW4gKnNtbXVfZG9tYWluID0gdG9fc21tdV9kb21haW4oaW9fZG9t
YWluKTsNCisNCiAJCS8qDQogCQkgKiBPbmx5IGludmFsaWRhdGUgdGhlIGNvbnRleHQgd2hlbiBT
TU1VIGlzIHByZXNlbnQuDQogCQkgKiBUaGlzIGlzIGJlY2F1c2UgdGhlIGNvbnRleHQgaW5pdGlh
bGl6YXRpb24gaXMgZGVsYXllZA0KIAkJICogdW50aWwgYSBtYXN0ZXIgaGFzIGJlZW4gYWRkZWQu
DQogCQkgKi8NCi0JCWlmICh1bmxpa2VseSghQUNDRVNTX09OQ0UodG9fc21tdV9kb21haW4oaW9f
ZG9tYWluKS0+c21tdSkpKQ0KKwkJaWYgKHVubGlrZWx5KCFBQ0NFU1NfT05DRShzbW11X2RvbWFp
bi0+c21tdSkpKQ0KIAkJCWNvbnRpbnVlOw0KIA0KLQkJYXJtX3NtbXVfdGxiX2ludl9jb250ZXh0
KHRvX3NtbXVfZG9tYWluKGlvX2RvbWFpbikpOw0KKwkJLyoNCisJCSAqIFNraXAgY29udGV4dHMg
dGhhdCBzaGFyZSB0aGUgc2FtZSBTTU1VIGFuZCBWTUlEIHdpdGggYW4NCisJCSAqIGVhcmxpZXIg
Y29udGV4dC4NCisJCSAqLw0KKwkJbGlzdF9mb3JfZWFjaF9lbnRyeShwcmV2LCAmeGVuX2RvbWFp
bi0+Y29udGV4dHMsIGxpc3QpIHsNCisJCQlzdHJ1Y3QgYXJtX3NtbXVfZG9tYWluICpwcmV2X2Rv
bWFpbiA9IHRvX3NtbXVfZG9tYWluKHByZXYpOw0KKw0KKwkJCWlmIChwcmV2ID09IGlvX2RvbWFp
bikNCisJCQkJYnJlYWs7DQorDQorCQkJaWYgKHByZXZfZG9tYWluLT5zbW11ID09IHNtbXVfZG9t
YWluLT5zbW11ICYmDQorCQkJCXByZXZfZG9tYWluLT5zMl9jZmcudm1pZCA9PSBzbW11X2RvbWFp
bi0+czJfY2ZnLnZtaWQpDQorCQkJCWJyZWFrOw0KKwkJfQ0KKw0KKwkJaWYgKHByZXYgIT0gaW9f
ZG9tYWluKQ0KKwkJCWNvbnRpbnVlOw0KKw0KKwkJYXJtX3NtbXVfdGxiX2ludl9jb250ZXh0KHNt
bXVfZG9tYWluKTsNCiAJfQ0KIA0KIAlzcGluX3VubG9jaygmeGVuX2RvbWFpbi0+bG9jayk7DQpA
QCAtMjg2NiwxMiArMjk0MiwyMiBAQCBzdGF0aWMgc3RydWN0IGlvbW11X2RvbWFpbiAqYXJtX3Nt
bXVfZ2V0X2RvbWFpbihzdHJ1Y3QgZG9tYWluICpkLA0KIA0KIAkvKg0KIAkgKiBMb29wIHRocm91
Z2ggdGhlICZ4ZW5fZG9tYWluLT5jb250ZXh0cyB0byBsb2NhdGUgYSBjb250ZXh0DQotCSAqIGFz
c2lnbmVkIHRvIHRoaXMgU01NVQ0KKwkgKiBhc3NpZ25lZCB0byB0aGlzIGRldmljZQ0KIAkgKi8N
CiAJbGlzdF9mb3JfZWFjaF9lbnRyeShpb19kb21haW4sICZ4ZW5fZG9tYWluLT5jb250ZXh0cywg
bGlzdCkgew0KKwkJdW5zaWduZWQgbG9uZyBmbGFnczsNCisJCWNvbnN0IHN0cnVjdCBhcm1fc21t
dV9tYXN0ZXIgKm1hc3RlcjsNCisNCiAJCXNtbXVfZG9tYWluID0gdG9fc21tdV9kb21haW4oaW9f
ZG9tYWluKTsNCi0JCWlmIChzbW11X2RvbWFpbi0+c21tdSA9PSBzbW11KQ0KLQkJCXJldHVybiBp
b19kb21haW47DQorDQorCQlzcGluX2xvY2tfaXJxc2F2ZSgmc21tdV9kb21haW4tPmRldmljZXNf
bG9jaywgZmxhZ3MpOw0KKwkJbGlzdF9mb3JfZWFjaF9lbnRyeShtYXN0ZXIsICZzbW11X2RvbWFp
bi0+ZGV2aWNlcywgZG9tYWluX2hlYWQpIHsNCisJCQlpZiAobWFzdGVyLT5kZXYgPT0gZGV2KSB7
DQorCQkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnNtbXVfZG9tYWluLT5kZXZpY2VzX2xvY2ss
IGZsYWdzKTsNCisJCQkJcmV0dXJuIGlvX2RvbWFpbjsNCisJCQl9DQorCQl9DQorCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZzbW11X2RvbWFpbi0+ZGV2aWNlc19sb2NrLCBmbGFncyk7DQogCX0N
CiAJcmV0dXJuIE5VTEw7DQogfQ0KLS0gDQoyLjQzLjANCg==

