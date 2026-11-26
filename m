Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952A606A339
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=no/55bbZ
Received: from list by lists.xenproject.org with outflank-mailman.1503283.1699066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWWoI-00075u-Oc; Thu, 26 Nov 2026 10:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503283.1699066; Thu, 26 Nov 2026 10:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWWoI-00075n-LI; Thu, 26 Nov 2026 10:34:38 +0000
Received: by outflank-mailman (input) for mailman id 1503283;
 Thu, 26 Nov 2026 10:34:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1xWWoI-00075h-49
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 10:34:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWWoH-007UAw-4M
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 11:34:37 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b080b35-2eae-0a2a0a5409dd-0a2a4502978a-16
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 11:34:37 +0100
Received: from [40.93.194.15]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6b080b3b-4900-0a2a45020019-285dc20f08bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 11:34:36 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by PH0PR03MB6954.namprd03.prod.outlook.com
 (2603:10b6:510:171::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Thu, 26 Nov
 2026 10:34:30 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%6]) with mapi id 15.21.0639.011; Thu, 26 Nov 2026
 10:34:30 +0000
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
 b=XHI6KdKz2ebkqYmrvOPWdwQa+K2jv241WLKw1T9C+JzNTruUVE77Mxfj3fityCHV6QlwLzT4iICB5RQmnEcXkM3nKYbVnsBQRHyM6NnPPgY5cjOQRXbunnm9R/RKVMnvR1xYsa8Nt5W14+UJ6XE/TqAl2u7AsnMPm6L4VrBh9l8rBrHEtYFONNhZpb62qq8/mqsBPDAVZFQoZngvNkWy2wv6fjUcyf9cL+TAb97/pvrxVvmLFTgVo8q5lk9i/MQZus/lKipa2kiOzJ08Tb+qpmld+r1Zu7RETSBxZXfuDTMLPTKWLLpi5n88z2qME3/WQxSuDNF0I9LXg/SJjo20iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0f8OYDJlKJydwPxHZsSA3IOV/pqVClfbloEvnh5JD4=;
 b=lf2G2m8K74ejbmoXi7kS50nCU0RonT40Yerrqy56NtvoeXkgHJM86Eymwe/54mG5KQ40QNgdkYPKaCq5uKDsJEGImrYh6i+b+C+muxsA8YATuIEJiNEHPbKOoZPZ4FMMW0QuyN20WiCFuzLIJsqEJdoS8JFwsGah9qj1ekEyjAQkrG7GRnM0knRLiYWvVodmoQhk1nf/EenIIqPxCB84dYLpNC5twPSGlbWkYKZFtSoELQNO+8wcf4lVCjYSu3FqZwQOtz1Hnyc/q+cFXp+v6uJSvVcnb0lZYOg4s2v+0NHH0udDfN8h/g252yJ93KpmB4yvjeydAnN6mS/aTQGpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0f8OYDJlKJydwPxHZsSA3IOV/pqVClfbloEvnh5JD4=;
 b=no/55bbZDaXJfijDo70Old45hVk8AE22Vooxo0TTrUmJUdPMyd7rUrHYPNPk4XhpN/yq/2gpk4URLrJ7RUVSmC30kAuSzgh8WgKLVFPDsGBhicSOtcMVl/WfBuCGJYH3CkqcwllqL2bvUv0vPNRf7kQnWSYgf7rBc/YinPuAQJc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: abdelkareem.abdelsaamad@citrix.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	jbeulich@suse.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org,
	Lin Liu <lin.liu01@citrix.com>
Subject: Re: [PATCH v1 4/5] x86/nestedsvm: update vmcb correctly
Date: Thu, 26 Nov 2026 18:34:20 +0800
Message-Id: <20261126103420.1109160-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118140811.101510-1-abdelkareem.abdelsaamad@citrix.com>
References: <20261118140811.101510-1-abdelkareem.abdelsaamad@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|PH0PR03MB6954:EE_
X-MS-Office365-Filtering-Correlation-Id: f07888af-ea92-4837-d2c5-08df4ba8da5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|22082099003|18002099003|56012099006|261026121527099003|10067099003|11063799006|261026140227099003|261021123027099003|261028144727099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	jIvowAEhyiGnEq9WL9be7VhPvWtutgpxDTOtXi215P70seYtLTHevNg+j0C0xTDln4OXFMJeP5xrOKXu2UFf5BDmau42IUfpkocUWf9pdK/gF5/0CPRmmT80hZPWbQHKSNhb1Dg0OENqzw7XsHyDTNTkvnwA9SNnKYCnO48nOPh9o9savKNLcibbKL9dGkggfhErDEYYc8YM9vJi7jsTPRrUroD7gGdFlwVTNOx1Lgl1VotYKf6ulyMmK9ha891aq6JiqCs0wbOCfmficYVhxbFCM6MbgO4mpwQSgJeRmTjZo02acdiRxx6SvZL53FnqWBAkLnIO7N217eQVl3TQmHueIFB968VGwG5HfqRCq8/9sE7bc9zoq077Mmo/8DMGfF7zjBtMdfCtVO0OLz4VDQ6tOWJd36F3P+sH+2rPI6nideYXUAE1SH1lefR09BI4fXIjAG+dQ6SKjojZy9HEyNyrFcbWNbXsfsJ5pJV5x0dzkk3pwQDeK4E7FM3c9riK52o3Ojz7g3oSLkLvbOzQLlwrXxAA/5S7AAGEwqKVfBFe23PJfVTZA2FirwVKV7/eyxo/gsw2uUv1JLRTmLpF7+TbRTyvFspVoo3sB/zEtZSItLkbi4tjZWJUI+j4VgswRHD+SMJ0MutFWCOzGdShMBcaTGuJAKzAU3/IXIeNSIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099006)(261026121527099003)(10067099003)(11063799006)(261026140227099003)(261021123027099003)(261028144727099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YXU2pi8hWuGLayt/zSSdCnlC4Kj4SUNmQRzRG3184tzLuChqwGPriOkSBzmy?=
 =?us-ascii?Q?lc5OtlJN7lrqnfaItLUH5YCiOJlexKA9D0OoQAXsY6QnTokegkedCWtvY5B1?=
 =?us-ascii?Q?g3rv7UkZQTrDU691PCiyTVPTriJNX/bhwXYldV9HOIhPvXcTrtFAbaYcFP0a?=
 =?us-ascii?Q?PQJuI+Oy3kEwIy4QLiK6o29Z7flsYuUFlr622md/3ALi4FndwQ+FW//eluER?=
 =?us-ascii?Q?3EOu5NZh9hG1g6fa7TsGfhjiY4BDPK+IOIMj5LJwH0FmZ1Vrsd4WsarEtXw+?=
 =?us-ascii?Q?nZjU5lhXKUJ/A2SVnD50MCGUSS2LFNDLnSYjmx04zAn86rs36txq88t8DniK?=
 =?us-ascii?Q?mNNSUFrvgbQ2LdnWwhxqR+MbGG4CCMK7RKzGazXayU4x5dTxGJNgC8WDaegZ?=
 =?us-ascii?Q?Yph3Zyns4EnKym2xqKyXeyWdmFV5G1yo+IklT1g81FoQCc6xSWfmaGMSBdac?=
 =?us-ascii?Q?erzQ2jSM1Wna0u7Q+Ca+RAS/cbHnM3AChrgISVshY0NvtHQCEk2oerWb8PEZ?=
 =?us-ascii?Q?37EOUucVOkK5J70PODbMXXu7ryHlSJNY/fkpbF+vB+oLvbh5FYyoTJWgE4TX?=
 =?us-ascii?Q?bJ9O9IP03LroAYx05j52vYmzMV0LclrXGTftf++VvHtb3hn1tdLO8akziwzD?=
 =?us-ascii?Q?CGSQpzHZUPtquMRLGVj2tuu5ab5NUZMPSLmq0WJJRc3q8dzx+MmQu/ns7Rmm?=
 =?us-ascii?Q?n4nM+UWsP3ugfx7qw6TUKfJPZSdchHKHlf82qj1el99LhAsJ0tuNl7aseNp/?=
 =?us-ascii?Q?W7QecG+dgRydlme32mXcdxEirgs8Yh+D51eZBdMK2bNxz3htxie4V/141MWy?=
 =?us-ascii?Q?TRPf8jy0p+9d0T6qm8eE5vfjHBurnMUsm2HnllGQEdIy9jKVxwHnPqjt1P2O?=
 =?us-ascii?Q?rx/WEUInECIlbvv10Y+XsccKb+2dtW8oyffxeHwAKJ+XXmDG5r2uXTkVeboY?=
 =?us-ascii?Q?CqX4eWdr9m/Y/6gd7gLkNMamCGwofhhGI/pzCG2xsPLg/UwbRhuHNcRnAO9q?=
 =?us-ascii?Q?cmywqEPWAhQQlfA0fzcBpsGh93Yvt5PnWi8YnsW66l3GIt4JDh/VnyL3UfmT?=
 =?us-ascii?Q?eR6ZYUvCKNclgc0EPGLRuLqkytspUwUZG4UFBUVrOaG5oITutLmbBUQ+kKlQ?=
 =?us-ascii?Q?x9/BDseG8+qJd4a0lKFXJ/j3OkOPyub150j5msxOpRwXdMDZG9ZvM2JsW7kF?=
 =?us-ascii?Q?d6nBhSK2k+vQ6AI9WEWEn9+zdbSY3w7mT2Kc+PCq1/8dMLgEje9CUMJdu2Gi?=
 =?us-ascii?Q?Z+y6vcnoDGaei1f52sJz26M3H48lGQcLQVMOkH/7WM7/TgWse61sSKfakRh4?=
 =?us-ascii?Q?v2cd5BZ53qm8vw1sJZigaKxL2MlvlHlBD8uEVMeylP1tF3nFk5YvIXH7ToCR?=
 =?us-ascii?Q?rxYfF7WY99VgqbHQ94FqtsESJJBenAnUm1b0uFIfUi9ItgSr8TmKbBiZLEOC?=
 =?us-ascii?Q?HxVGeswd1LryAilVYnTESH0ma4alTj/dbKzzqD490d7p0Apwmdpcftabcw2f?=
 =?us-ascii?Q?gGkyHRHnjnE8AlzUZVe376F71WpLnYwwz9QjQk7gTDaTijXFzyg/2aejxxcu?=
 =?us-ascii?Q?HxVBIMuILr1UwwadJ70TJeuOPNLddu7qh/7eH3OTSsJgW1OxfgFQ2nxOEULQ?=
 =?us-ascii?Q?zH13/h/aeFRmKRtoRfVQJF7SPQ+91H3LHAN0ZcaVQieKn7IoF5jWZCtUYBkb?=
 =?us-ascii?Q?QjyuVH9KUsQySK28lHbwphvEHVeGIKDaGytuGd7HfPtmIv4JX2pyLeK++nuv?=
 =?us-ascii?Q?8xxawMW71g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f07888af-ea92-4837-d2c5-08df4ba8da5b
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 10:34:30.3156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OUMUuuhfX7zBBPpK+ND0cVJdIbcZEq1jQAie35eHQOyxbD1IyA3JKq4xLT7Zmlq0LVh6KKirLYGAvyf0O4INA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6954
X-purgate-ID: tlsNG-720697/1795689277-325946C6-36502C10/0/0
X-purgate-type: clean
X-purgate-size: 1863
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 18, 2026 at 02:08:11PM +0000, Abdelkareem Abdelsaamad wrote:
> > +     * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
> > +     * 15.6); the remaining fields do not change.
> Not sure if this has changed recently but the APM also mentions the
> INTERRUPT_SHADOW bits? Not sure if the plural bits means also
> GUEST_INTERRUPT_MASK?

Thanks for the review, Abdelkareem.

You are right that the comment is misleading.  The code is not affected:
the int_stat field (INTERRUPT_SHADOW and GUEST_INTERRUPT_MASK) is copied
back as a whole right after this block, via
"ns_vmcb->int_stat = n2vmcb->int_stat;".  The comment only describes
_vintr, so saying "the remaining fields do not change" next to it reads
as if int_stat is not written back.

Also, I have to apologise for the format of this v1.  It is not a proper
patch series: I squashed changes written by several other people into a
single "update vmcb correctly" patch, and left only my own
Signed-off-by on it.  This hunk is an example.  The comment and the
change to copy back only V_TPR, V_IRQ and (if enabled by L1) vGIF come
from Lin Liu's "x86/nestedsvm: write back only what #VMEXIT updates",
and the APM references (vol.2 15.5, 15.6, 15.33.2) are from his commit
message, not from me.  That makes it hard to review, and loses the
authorship and the reasoning in the original commit messages.

v2 ("[PATCH v2 00/13] x86/nestedsvm: rework nested VMRUN/VMEXIT
handling") already splits the work into smaller, separate patches, but
I will make sure that every patch keeps its original author and commit
message, and that each patch does one thing.

Patches this large are also very hard to review.  From now on I will
split the changes into small patches and submit them one by one, so that
each can be reviewed and committed on its own.


