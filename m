Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A24606A323
	for <xen-devel@archiver.kernel.org>; Thu, 12 Nov 2026 11:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=UvFfcF8F
Received: from list by lists.xenproject.org with outflank-mailman.1485610.1688774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT6O-0001CX-V4; Thu, 12 Nov 2026 11:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1485610.1688774; Thu, 12 Nov 2026 11:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRT6O-0001CQ-SS; Thu, 12 Nov 2026 11:36:24 +0000
Received: by outflank-mailman (input) for mailman id 1485610;
 Thu, 12 Nov 2026 11:36:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xRT6N-0001BA-2k
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 11:36:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRT6M-006aQY-Fl
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2026 12:36:22 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a4a7-8faa-0a2a0a5109dd-0a2a4504e606-40
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:36:22 +0100
Received: from [40.93.196.44]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6af5a4b5-b57f-0a2a45040019-285dc42caba1-3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Nov 2026 12:36:22 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by SA1PR03MB6515.namprd03.prod.outlook.com
 (2603:10b6:806:1c6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 11:36:19 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 11:36:19 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKYqiXof7eqmuNr+fzkGI/NK+CbU4KgZYJLbawBkHKAcrVeeAexl/MFqXudIYwVy//zI0SuHOGJTOQ44+WAiMRixnxrKhxCo5qj1Dt7wVgmBylKoD1WHFvBhrIiZBtOtzVXRRbmzpUnUUzcueMu/ntTI+qX0l5o/X5kNmTE3WgZuHBaU05gPojjrpwz8ww+dXbFXsT3cbbx2T0lbrM4BlID97KoV1MM6XJNzXtUsgpMvyXWbr3jZJnYjX7yMVuNNs5+ZqL3SvJXPGaMqfo+QYQvgFwSm5BLf4LaJDJdRVebtX1iZ8jZ4/G8WazeN4cg0FA66LlymJeDaQ6zKnmu11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er+KA8GKZ8h2nuvwxP5tJMw1+lvwfsTYsqnpsq7Qzg4=;
 b=YvASRvelY5atK4nE9RjTt8iMzb7T9aGIo8QVkE2o+mLqJwoPRkMTfQ2ZTaqQWV9Mb2OGI0w5GHOzmb9CMdgkV5gDp9qLKiczxk/re+YxWITtw0WZzeZjOlBHk7YAgEoajFsnR/y0+ok2c3eSMEVEGy5zp6PeKGcZW17qH1EB++KoyiRMjnqyTFpWinXiBlGTwyJNRr/WTfcXbBWfqapU1rbMU/WeGq+ih1/cwsupNTx8ierSuLBMAg4m9RfEOheK0QHuLb4E5/LmSOL20fBIDqEkSmw8oiSq7DRePKGl/5nNsCTjde/MB+cQhmCdBhcF7vUsNb3AY8dyc21qRQbIEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er+KA8GKZ8h2nuvwxP5tJMw1+lvwfsTYsqnpsq7Qzg4=;
 b=UvFfcF8FB+kApiD4leEELBooniJTnN9DuePmf9HwIPxcMSSfxjTG+k6SbEi/s2S30rXXKgNnOgo1HPGmcSc23xAhbSbCGxLPQunIucMEbXWU4e9kfDo9iHImSX8I27Zzu7Mxb7xcUeWGPiMIBnbL+4mnGqM2c9WsGMNC0fVn1HI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: ross.lagerwall@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: [PATCH v3 3/3] x86/hvm: don't let EFLAGS.IF block #MC in hvm_interrupt_blocked
Date: Thu, 12 Nov 2026 19:35:25 +0800
Message-Id: <b1b1e6b0b0f5630debc9d6f2a05ccc90693c1631.1794482561.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1794482561.git.chunjie.zhu@citrix.com>
References: <cover.1794482561.git.chunjie.zhu@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: JN3P275CA0031.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:ca::11)
 To LVXPR03MB989161.namprd03.prod.outlook.com (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|SA1PR03MB6515:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2dd188-8759-47a8-43a5-08df40b12b88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|22082099003|18002099003|11063799006|10067099003|261021121427099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	bXys+xSGvy3bfgiXOZY0Z+Wlgb+0HQrKJbkScbQfOYmONGSy/QcYtzNEbIpFqZStHb9nCYEYAlz4irrvu//SX57cg+lhYkY3km1JdkCcLHCyY573MARJ9cCUYfN2f3AfB2qJAsh1lG+0xAPONp3DPvhze8mI9kXl5KnvOeJsAWRawbLQrOgHOhj06Bc+Z5AyrD+80c/zhS9PPafiDp165aUGjAt48Z1vA3KskTIQMjsHSq2/VDndQaT3CxAQDonQRJ3XEsVTSXxGk+f7EgmTfLkh7H3IlSLmoZBbYOrKDjqMJ/GwyI4frr2RmMg0t9wYxHoGQRd4oHsGKtbRG19Saasc2dSQ79sL9sSHvJTj4Htpc5vx2MmPd8LCaRGs9+YJ5lohfWE4Zh42T7UokprIxR7gh5VgucqJezmrlmH27urYXvBwdchq+Sb4IJekftWToBAW1EkkWLXUXabWp0VkZQigJPkurDt4JwF2s0zeMCSUSgPZ9Dusqs+CAJQRC49W32Jbvbzix7Q1+02acGne0SLmKiE23w5Vz7VWDfBk2sgNo04YerRPykvwnyqUyTv/TLFfkqBTKeWCcW1qstJ3pJrZUK9KeaB7HKKoLxwgZgYeBrqPKftV+Rpb5FijLVvERiAEEB5DcA6IBn+AOYJEaFgduVHz4oe6LURKQLy4mKY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(22082099003)(18002099003)(11063799006)(10067099003)(261021121427099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nedpUvw6l9AiXdIAJfbjSoUlx0wefmfaU9RPZSjam9FFla+yqKMnjVrxUvfc?=
 =?us-ascii?Q?bkTXJb7jUCTikVzxipYeyBawRuVzZvITSfZscHW5wU0WTzLbZ/xw4muvB7dt?=
 =?us-ascii?Q?6YA4K+qsANewfGRYGPg5ybLT1jnGk5yyGAe4VRdxN5QnfnBSRizvM8VejIbB?=
 =?us-ascii?Q?Lax7jXj7Gi5DOM8nUX1iKgK+kUTJ3keTSt5uphdpoR+MZ5pbCvLZ3pU/YKnJ?=
 =?us-ascii?Q?obK/KBWWcWrr11PRWb/WRLddDywr4t+oSLY9GlKs+OOr+oGso9p67nrWZO4P?=
 =?us-ascii?Q?OxXvL4HTjIQKux3k/VGmDoHU55moGyTBynGP1f0lSd4BTRSmPfmAMi/1fbe+?=
 =?us-ascii?Q?DpSHvknK04nqm/6l49Gk5u3BRdRqT0zPwG8v2s3HfBPpzys1WHRYKmR0wMQV?=
 =?us-ascii?Q?0wTGPUvaGgJFBnsZqsHEpeVnayAtymIHybco8pgpkSIqhXRixLLGu3Owv5Ye?=
 =?us-ascii?Q?tttB+L+WSIl3FVvNG/E3LdcAIKCHWat6JW/2K+hWOANQM1yKoCGeYeW0s7iw?=
 =?us-ascii?Q?FNPFfDQtB58P77c8Xw7Zheny8RO21BWtXdB5ubVUh89tIueNjW8QWAlUEpIU?=
 =?us-ascii?Q?HTkWJJofYWiOY/TC0YnR11/8XSgzosdZLOTtnRHuyIAvm6CKmbrf0J3jKoCD?=
 =?us-ascii?Q?NuzCF7g1E2BRHfoLHxMFG+m6y3voGpuFB3qsLa16XJgx6jMsp85PsuYRTMJW?=
 =?us-ascii?Q?PqDCySr+s0yltHCyz5HSixvvfrbBXWQB+diyn26vk3QPfg/+NKSAW3Pv2imc?=
 =?us-ascii?Q?WiixlQRudCV7TYYOVjGiBBn86svlpg9gVTVzccH5g2TPr5oNSbMIOZKeqPfJ?=
 =?us-ascii?Q?L5ru7RfeDpQE7KPNZv80BI9G3xAw3cD3bPYTrRltSxfG9JHec4Vl9mk3hq4E?=
 =?us-ascii?Q?deHZ2ewEcdyb09UXyQr4xZNokPAadyz/kvDZhYeAA9itaraXM+LDplTdmWGV?=
 =?us-ascii?Q?oC2OwYx3lkUIgeE5H/iHCSsgOvG13TJO9Ymo4T5cOBfP3aQzDms/cL2o1dXd?=
 =?us-ascii?Q?OrM0TmhDkyuCHP8dZDz+Y0x6U80Td5OhdxLnuk5GaiT9KenD4ReP53FQPHaz?=
 =?us-ascii?Q?/X1rl4b8Um7rWstsKIr2gkL7+IU4ho4VqxXUDtBrOo92Zt07IK+Kd0Gl0XWJ?=
 =?us-ascii?Q?S9zROyfmDVwayPgkPvnYo6fAfot2s/5uDKyMCnjmVTPwpLvvpcw3ygDKzDDU?=
 =?us-ascii?Q?/XUw+yf/qBcxy+dHZIcG32y3uNL91GmKNFCt0TifxRh9tptXm6eur9jD674d?=
 =?us-ascii?Q?y+GUxNl5FWGYDE974q9SMMVLfsq2sKSMp8s2U1pjz6BkOXAdqhRImMS206Oj?=
 =?us-ascii?Q?HLIb7dG7zv/pT0SWdYTZynUNX1OULxw1J/a7A2iHm+q9nX9chF2K8SE24OtZ?=
 =?us-ascii?Q?xH1lhO/1IrCJCEZsf6Q976q4alxU2ydshDb8g0lHjv8zf3fmXN0U290ekJLG?=
 =?us-ascii?Q?KkXOMwSGRzIayL5woYeBru7dMNYcixGikQsodqHz3Agl1hsQ37Sai6cMSVCn?=
 =?us-ascii?Q?zpmIhNzR8d0x5T7N4DwP38gsgHiFv0jCHBfGzfiv9vtAYbDPfviO49cQU1M8?=
 =?us-ascii?Q?hGo+0k4xPx8Lud+XCmwSCrNLaU3fVp76ErgpPuaH/aNR7GO94kJYveq9NYC4?=
 =?us-ascii?Q?SL+1qfBTBfACu3puUh9udpyaMXqh33eQwSHhXZNj2AVYBIG7YG84z012B/IL?=
 =?us-ascii?Q?lTBz0VufwT16taY4B55WIIqOR5TBu1xJAeLMRrNjKmNvpnQG5MQeynlU2pFu?=
 =?us-ascii?Q?QMlSf4SEnA=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2dd188-8759-47a8-43a5-08df40b12b88
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:36:19.6866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UV9qN88uS5ZYDtgeXjs8AeMOUG8PvToGcCS9pUyFkGp29BNqb14vMTc9+5ZWn4Ozm4CiKBdNzWYSzLjC2EwBZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6515
X-purgate-ID: tlsNG-ebf023/1794483382-50EDEB50-166C97D9/0/0
X-purgate-type: clean
X-purgate-size: 1077
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Chunjie Zhu <chunjie.zhu@citrix.com>

EFLAGS.IF doesn't mask NMI or #MC, but hvm_interrupt_blocked() only
exempted NMI from the EFLAGS.IF check, so a pending #MC was held off
while the guest had interrupts disabled.

Exempt hvm_intsrc_mce as well.

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
v3:
 * New patch.  hvm_interrupt_blocked() only exempted NMI from the EFLAGS.IF
   check, not #MC, as noted by Ross.

 xen/arch/x86/hvm/hvm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 8fd095a4f8e6..710647626427 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -3902,7 +3902,9 @@ enum hvm_intblk hvm_interrupt_blocked(struct vcpu *v, struct hvm_intack intack)
             return intr;
     }
 
+    /* EFLAGS.IF doesn't mask NMI or #MC. */
     if ( (intack.source != hvm_intsrc_nmi) &&
+         (intack.source != hvm_intsrc_mce) &&
          !(guest_cpu_user_regs()->eflags & X86_EFLAGS_IF) )
         return hvm_intblk_rflags_ie;
 
-- 
2.34.1


