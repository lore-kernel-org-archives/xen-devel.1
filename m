Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA0E606A321
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 07:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=Gz8HpupB
Received: from list by lists.xenproject.org with outflank-mailman.1485196.1688476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRP9g-0004HZ-PI; Thu, 12 Nov 2026 07:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485196.1688476; Thu, 12 Nov 2026 07:23:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRP9g-0004HS-MT; Thu, 12 Nov 2026 07:23:32 +0000
Received: by outflank-mailman (input) for mailman id 1485196;
 Thu, 12 Nov 2026 07:23:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <stephen.cheng@citrix.com>) id 1xRP9f-0004HM-HY
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 07:23:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRP9d-002jUk-FM
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 08:23:29 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6af5695a-bab6-0a2a0a5309dd-0a2a450cc7dc-48
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 08:23:29 +0100
Received: from [40.93.201.10]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <stephen.cheng@citrix.com>)
 id 6af5696f-f479-0a2a450c0019-285dc90a61bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 08:23:28 +0100
Received: from CO1PR03MB7889.namprd03.prod.outlook.com (2603:10b6:303:275::14)
 by IA3PR03MB7665.namprd03.prod.outlook.com (2603:10b6:208:50c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 07:23:12 +0000
Received: from CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767]) by CO1PR03MB7889.namprd03.prod.outlook.com
 ([fe80::2d02:5605:87a2:6767%4]) with mapi id 15.21.0592.010; Thu, 12 Nov 2026
 07:23:12 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BHUiqblOJpp+dzFYDTujLtfuuaGdCSK8KgYXJe7sDIxKkAjNBjCd6atURdvfzwDcVtv1BnbB0Ro+RpY4+Og9CvDmRLxggiETl5c0EUm25ERWDrHdONaQNaV1gyaKcqMchZjrkt0tFZR+ILWgJsIF1h458XHN6g62jUSI7KxIpKRo8pVIlf1FrQArv9fEETMwy2VAOnFICKL099T5NA38Jsqnk2D8gsVZgKCEyeapIK2U2E9DuBE+BA+K3oMe/yIpIRe83B4R12i0KlPxf1vDtT/Z/WempjqMO7wykikye4TS2hNJPk+FwlNAwFyJNtvMccHFZ51mPhkDKRy3yNYeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XR8JEGoYPCfsZjoILRnh+E5XF2Q/88OwZ/wLa1p470=;
 b=iGaC7s4lq6SbbgkPC90+gp64Y+UJRw6D1623635FJjQRO/1AcW5ciU/j+UW8knzARHtFS8Zq1+ULlwMDpf6310TmiDoyJqx0CU4kuUGgJhg6Dr7RIo8bK3tWtwyPX1gqlqQ4hriXSkMlw59pBP80keedRLCFksVI//Ug/PKzWWK/Ui4XDNF2K6wjVhk2rTCRhARw6eixTWWQVfe67lFVni9/VxEzUsTUfveVFO2DwtxXTWvQaW3F7ZUXqqEjzqg3IkGMDzH4fBMMirar9boEa+ccflL5XtaT+yrNOCvB4qxzokksQZ3gvGffr8zmqtZWl/o2DDPUdZ0v4Ujqllflgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XR8JEGoYPCfsZjoILRnh+E5XF2Q/88OwZ/wLa1p470=;
 b=Gz8HpupB1vSGsFpm6QYJSmP4Fj+v3jut//3SJsWj7s8BUt3m2y5aS1fu1CK4yBLlhTpR9+oJRQRISpYnFPjpEZCUPG54XNDYgQ5arH1GjZPm7mHKURk5eusDU0UfegyEypoc+luTlCsdfdD8bqU2jqua+BR1QkIdO7hhgRYijCE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Stephen Cheng <stephen.cheng@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stephen Cheng <stephen.cheng@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86emul: Treat the vector of INT imm8 as unsigned
Date: Thu, 12 Nov 2026 15:23:02 +0800
Message-ID: <20261112072303.86955-1-stephen.cheng@citrix.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0051.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:3::10) To CO1PR03MB7889.namprd03.prod.outlook.com
 (2603:10b6:303:275::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB7889:EE_|IA3PR03MB7665:EE_
X-MS-Office365-Filtering-Correlation-Id: 222ee68b-7b9e-4943-4a0b-08df408dcf47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|261026140227099003|11063799006|261022105027099003|261021135927099003|261021123027099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QlZXVuqt6wJ6QPFTmHHskkDVhcaWSCXANIi6UMZuGsEkiVa04bDA0bSy3DOgDhyEAnaoowhlLqNtDdDZqGn9qNfNItXm7CebZnZBTKS9FPTutNu3y5a9Miw+D7Wmcv5clPJZ5A8934LPcwvAwZhsCp6Gyw6zdyAZcDU6eoc7BDfc0K+3SMy4bHCvkLLvnfCkLHWcJwzqJLX6OQrizL2soKHt5+CeJANozX5dgRFcgLP4+mKPXi8K7nH8lyvSFZa2qY6vP6Omh4faJk9P6xsGb4lv3JSa8upREhvSTUp9chWb2V5/H2nsnNCAPFkN25dTWZEPPXV90dj9HxJHlMM7o26xUthq7HSQuOd6ttoOH/6HrrxPb+fYGiSJK+/1RakpGarE5Nv1xTQvfP58X4WceFwWXOZu/rDozQShPOF6wdiskqyhm6rb9G+Dooxsqxa1vK2v/e7qD9R9wlgMboffIZkclWr7CEPabJ4U8SazpuZdqInZxrCk5GFNqAtIfwnezaxPvwjAe1QObzRzdi7Ad0/3wVId6Fom4icoaDlLN14I2vexvRc/nTviVNH8De6y2aEiE2bMKr2s2UIQtiVz0hBkB/FK764XdR6Li1RuYUxfJmWNTD8QBZNvdk/NqSLMOk66oaqfy+TpGlqwnJI7BMIaFvhYP6D6pA7Bj4F1kvI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB7889.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(261026140227099003)(11063799006)(261022105027099003)(261021135927099003)(261021123027099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dL0duldvER9E7SOI6d2pu8EpCb4BOisl6IbcU53wC5mZdCLQe5Dws4bKN1bK?=
 =?us-ascii?Q?Dy/YwGO+DCgcOdZVYp5Q8ytOa+N5xC137b3fL6icsF4cXB5J6KMe/rkk3G/w?=
 =?us-ascii?Q?PoFeBmmD4nXoe4q7jaI7+qS97GtXf0a6ckFnOrtjy8AlTPvt535KLf/UxsA7?=
 =?us-ascii?Q?xpccHPwom2akEK4Se0KSVU5wjS1aPNbCuLJMjiyW6cJ2w5KlDlsd9lpZJCFn?=
 =?us-ascii?Q?aoKjyoMAS2ipDNws+zOU3jvrqPS9uPNadV437a8s26gsBkfjgysm4VqPUeI6?=
 =?us-ascii?Q?rsn7E2VnxdIbBuMiuL872S1R60YJqv6fTAfu+AKpUmVI0A2mpzWxdZGgqntg?=
 =?us-ascii?Q?DQE4Q5MbVunzpbeSpv/70XlCsEJeXbq0plO5rh8Ktee0k8WWy60lpMWNy/YV?=
 =?us-ascii?Q?K03BWR+/zW2aiM8KFG599gaiurQrvf5xy3nzU9azcnMKAphkldYyBIlRZGwB?=
 =?us-ascii?Q?1HeY7o9f3QWebDHeMFdhB7AXl3qarDsLZL3wZrQ7cD3Gt4IC7yJeIHgE8Qe7?=
 =?us-ascii?Q?CvBhLEOCUOmVSPAytvoZw+P4Ap4gRSRaZoXOq87USE10GIpLaznz5Lc10A0B?=
 =?us-ascii?Q?vjWvq/hkNHSXDzyL3IU8Iiq1VAMOKusRhk3D6DKR2GFXl7Hxlf+VPhIjcXka?=
 =?us-ascii?Q?PNvgbZQNjpwb9FPimvOljcVBdXtiEGTarwueaaNMMPvM/sKKPku1nsX9OjRf?=
 =?us-ascii?Q?QHCPNWczxvFV575Yb13106pCS2D/OFXNHMRILmHycLulWb1PemgeZf6/f0Ot?=
 =?us-ascii?Q?cLRUGs5D+jOgHGLslhOSOuq0gCL/I+UXhp2EVYNegV12ddF+AE8zW6kP7ROb?=
 =?us-ascii?Q?eDu/yE1ucsiDKECbqmvLGlDer7VZdZpjpurKBd1lr1KJnxHdWNuelgfHLyYj?=
 =?us-ascii?Q?+SoZXjuDy6tEIbA1ERA9RufV90bhAWXnQxXBaaBtq9xFbMr93g/DdwI2v51s?=
 =?us-ascii?Q?6KGpU5NSus76Nh23pLNQuzCzGpEzAxhbmr89S6VTRccsfuukq1BQxBSr1v4V?=
 =?us-ascii?Q?V1kow861p6+TMIXDDAhxF9n3aWIUFwNDwz7SUs+Hl4HekvI9sfk5XFXXS4n3?=
 =?us-ascii?Q?ZpkIt0VrMvAbq8H+zzBTi8GuMmz/x1VLfiQvrnvkqobUjcv1KTF94+b+5HLy?=
 =?us-ascii?Q?N96E0AJYO/kNla2CfBfrB2ldUq60vAtcq3rjUzELQL1uMANlgPwnI2FUxniX?=
 =?us-ascii?Q?v+hwv/dIYNfAtS4/0RUvMAPjRG+mvG9UoIDp8I7reUyCXDfRaY5zXtaxp1J1?=
 =?us-ascii?Q?Tpy4AkgSrDtnIh5ABJTYFancyX/mSm7KRc9AayYVamVu9Vsoj96ibOx48gUE?=
 =?us-ascii?Q?e/m0vgvxK7hZLl2/GpeCpmPU7p28haevavRViGlvdCKjktMoJzDMuC8TamKJ?=
 =?us-ascii?Q?OijU5aCLBZKWgAFwuWBLgxJ/e8bFkXw0kaUImXJCYV+G/pZjINjikHXTa3u4?=
 =?us-ascii?Q?FoYV9jhrkdgMObdwcMLLZTYlsC2DRNTcATOz8D0L2W5Pv/FNpM5bcsR3jFct?=
 =?us-ascii?Q?ysq05mIWu1f9iNa7zdxORnPvTQFnoMln1Z96QD2MiOEXQTS6UFAvk0rL3cS3?=
 =?us-ascii?Q?bVZPIN5ll6d/GeKuoMNjyUUx8PIjFwfIlFEJjjCYiJbzgYUMsXcC7720s5ed?=
 =?us-ascii?Q?EK53mXxKKNwrhjFcDh9RwgktFVn0mQ8W/Ap3hNgXGaGs8IyAIbUB7AATzN5O?=
 =?us-ascii?Q?NCdo6Ni1rTWnnwDyy65WzkMcqdCfH3us5V6Kg6SuD7Qo3OBZJY8AfAlLG6cP?=
 =?us-ascii?Q?Ld1f4AEkhQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222ee68b-7b9e-4943-4a0b-08df408dcf47
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB7889.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 07:23:12.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IcXHzlov3urslWGuQVSITROon5yLq4SH+Sed7/wza2Xh/OHrrpv94YAZMn6lxPFYhg08EQhB/c4moMJ8M3swrBQyVZwVGEOSuuF8OvTxYvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7665
X-purgate-ID: tlsNG-d25034/1794468209-5113AA5B-F2B6AB23/0/0
X-purgate-type: clean
X-purgate-size: 1549
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The decoder sign-extends all 8-bit immediates (SrcImmByte). For INT
imm8 the immediate is the vector, which is unsigned. So INT $0x80 to
INT $0xff put a negative vector into the event (e.g. -128 for 0x80).

hvm_inject_event() then fails its "vector == event->vector" assertion,
and a debug Xen panics. An HVM guest can trigger this with the forced
emulation prefix (hvm_fep).

Cast the vector to uint8_t, as is already done for the port of IN/OUT
and the operand of AAM/AAD.

Fixes: 52053d5fc2f9 ("x86/emul: Drop swint_emulate infrastructure")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Stephen Cheng <stephen.cheng@citrix.com>
---
I found this with an XTF test which runs "int $0x80" with the forced
emulation prefix. Tested on AMD with a debug build: without the patch
the host panics, with it the guest gets vector 0x80 (also 0x21, 0x7f
and 0xff).

 xen/arch/x86/x86_emulate/x86_emulate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_emulate/x86_emulate.c b/xen/arch/x86/x86_emulate/x86_emulate.c
index f168f3ebcf..8d53873c67 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate/x86_emulate.c
@@ -2453,7 +2453,7 @@ x86_emulate(
             ctxt->event.type = X86_ET_SW_EXC;
             break;
         case 0xcd: /* int imm8 */
-            ctxt->event.vector = imm1;
+            ctxt->event.vector = (uint8_t)imm1;
             ctxt->event.type = X86_ET_SW_INT;
             break;
         case 0xce: /* into */
-- 
2.49.0


