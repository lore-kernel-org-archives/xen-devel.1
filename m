Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1996C606A326
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 09:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=j916YcnO
Received: from list by lists.xenproject.org with outflank-mailman.1468013.1677052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNoMU-0006ZM-EG; Mon, 02 Nov 2026 09:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468013.1677052; Mon, 02 Nov 2026 09:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNoMU-0006ZF-Bd; Mon, 02 Nov 2026 09:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1468013;
 Mon, 02 Nov 2026 09:29:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xNoMT-0006Z5-3t
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 09:29:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNoMS-00Gl6j-Gj
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:29:52 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae85809-8faa-0a2a0a5109dd-0a2a4506ae72-38
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:29:52 +0100
Received: from [52.101.85.63]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ae8580e-195a-0a2a45060019-3465553fed48-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 10:29:52 +0100
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6) by LV1PR03MB989627.namprd03.prod.outlook.com
 (2603:10b6:408:3f8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 09:29:47 +0000
Received: from LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902]) by LVXPR03MB989161.namprd03.prod.outlook.com
 ([fe80::f728:f8a9:4e0c:d902%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 09:29:47 +0000
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
 b=VI4BNcsOq5LzQ+O/GUFD2y+Qyzz94jC6GJeC3zegVKR03vV+ZzrGi3Q0ZKQ3FW4AUyONio0SsmHVsk5NkkHE5y4/4GaWxHwaLDBfJlN0FPRjboSogKKD06Orj0QkQpsNcNh/Sa553LP0eYVnghHG9TZu6ouIIVFAGIWiOqdyGyQqQMSZjWsxRzjlFMXDlHEINPCTpTWT5Miwxj2Un2asLJ/jLyqxUt6BjBIdx8se20VlH9MDDZDIt9JDCK18j922yLIMHVrjmeMkuKW0i1Y3VPotlhHESwct1FGpc8IejQOLD0nLYJPe+NgFDp06cfD0wgcF4YkVffbfiDaU2Avt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYuATOYO7bCOGDMGiT+Nwu163Z/VSqYnN99BtbxvT+I=;
 b=ccZzjmU5rAH2E1fJ2BrlL2VWLgW8Jl8bbQvqnOHRvkSHIeWPDoPaRVVstd/JrjEvZ0m9eUz6SThw0R2PxgAw8g5yV0yum2e3xp89aFjym8hqTVHlvkm2EV79spAofsMl9WGNpolj/IjMgcFEpq07spetVOSZk3L89GrkOpYRNln3e2wvHTOXtnn5/Tkq0ILbNWxPbYr7bkfQUjBIbKSjDy9J9+OfHKkfuqBR9B23DEP8Bs3E/gb1ez8W6/AUDwWn4Xku0ic147lzQHqdRY+cZVwPugbU7PmXvH3eRUpFknT13H0PbA+K9j/D7xoxo4QWrPSvGC4KUfzOT7dyEXmF2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYuATOYO7bCOGDMGiT+Nwu163Z/VSqYnN99BtbxvT+I=;
 b=j916YcnOFJGCEBLcZN4xWPEHXV0nvDO1Gurc8Ypacnm0p5Tu5Sb8iguqCbMK+muCLDvTzFMSpu4x1IwxJzfv/e4EiiSJxRk51sGW+Ynf2u3qTGvYc5bDI6IYs2CNSEoQ2Fz3AcCWJC0/u1uZnW0tkRBKj1Q/pUgMyMW3rCyWksU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: jbeulich@suse.com
Cc: andrew.cooper3@citrix.com,
	chunjie.zhu@citrix.com,
	jason.andryuk@amd.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/nestedsvm: remove dead code for shadow-paging L1
Date: Mon,  2 Nov 2026 17:29:38 +0800
Message-Id: <20261102092938.187235-1-chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d00441c4-6ef6-4f40-bc32-1d4c267a6687@suse.com>
References: <d00441c4-6ef6-4f40-bc32-1d4c267a6687@suse.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To LVXPR03MB989161.namprd03.prod.outlook.com
 (2603:10b6:408:37e::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LVXPR03MB989161:EE_|LV1PR03MB989627:EE_
X-MS-Office365-Filtering-Correlation-Id: 508e11fe-52b7-4dad-9592-08df38c3d61c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BgZsg+QU3KdDkp2N2l87826W8oX1kg1VtJRgVJUIbtlVpdRdCD4iaWb9B+1leM2PilFht+IcgS6VV+zPmnfklHneb7ur3zSRiwA63BjQhtvaGGoiOE7Scr7AiWIfIbfD0olfz8smplEFse5ODU+cF26paFbe/Rw9IDQ7WW2WCH5s0BCrp9utA0K8a0WEMGhygl+VbBsi4FkeCxZlW9iUiRqh85svU4dF9BBbalpgVVQXRCtaejLAe8wYasAKWwGVwwx9wKJ8wmxIuXWbDlfbpvg/dt7OSL5K9+nFK0/MWf7l37Zq1qNGNfnbEuzgyycgEOxyHQpZfHJZdkgq71SOqA3pUwwhCiF2qYLwt4K8f0B37Spd1TzDdzhZbdU7RPxE8z2Q9YSJb5HVsblXFnTXm2zej/GoCsMisbOOaX+0035kbcWhLCNZwYDPW8hV+vKFld7ltrrhXd6IcNl/RJj0D+Rkb9Nd7j/H6fAiJ2fOX5HjdsWyZd4VEfj7hRbdEA4qiuoAUUSifW0ua/UiReWyVofKvdRmK6VacFq1+g9ZkT5YIz7j+AwhCkySBH8ogu8OQZpirEI/JSlzpVgDPAa3/K6TKhhGxDsCwwkip2wf3mtStINL54PEErYTipM/YZoH+iboRXzcjEQqvutev95gIvncJqnBxuyxUflb+7XLAzE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LVXPR03MB989161.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WVLje3uJigOcNtS9IY2YXqybCjE33LMtcCqUW6HWFucJYCW3+832i/sXI/Ag?=
 =?us-ascii?Q?YaOOkNcGnAQbka/kJ2xee36RN/344RcbTJDjW3/C3Xvvok4+Ut42+ebc32nC?=
 =?us-ascii?Q?rYmCMFR6CjwngUFkc1zVL0IKW4sDaIZt1oxXg0qF3upL3VqIn55Af1HkQKX3?=
 =?us-ascii?Q?mI6uj1wx+te/aT6ZPY6c4AxDXmc46d1cycLDW6SPEsY6lkLoqk6+4msxjeJf?=
 =?us-ascii?Q?iSNAwuhlbsmb1daRcxysWH6oG+jh4iWEE6S5nEUZVtkPWYjo8vl9yo0Av6Ux?=
 =?us-ascii?Q?3UI9zTD/3MMwcoUxvfvUSCLdkx7vq103Zojh9bp9i3lV2rlg/qJH4mKkKwSz?=
 =?us-ascii?Q?cmG4VovwQxCfuux3Q/ni0ebelMQ0TlSBOvo2MKtJ6iBK3hJ1TqFLE4cINsDr?=
 =?us-ascii?Q?Mtivvdr9snyyGA49eohcs0HuFVbrxyKMvVOfNkj4pcvojSlhJeR8VXCfDdYO?=
 =?us-ascii?Q?nz+7H8nf1L6TrhsZdbwtfbJ0+CO3PCznbUERhF7+fx+X0WmxMiRLbJ2SF8zL?=
 =?us-ascii?Q?Pk28d/XJjA+4+sOVSbZgJSIAwibKwFZFWQwW5vsD188UsFcwLiJUaOPcg46K?=
 =?us-ascii?Q?zrWT8r69UbCzHt4G4naKVzRCGpvthF1kBDiZ4K2mR2LQbTdSBxeGAKow8E7N?=
 =?us-ascii?Q?Dmdmwy4NQWAtb8MXqr04dSdfn2tMaFktkMBESCNA3GxtUwmBnWNje35vjVb8?=
 =?us-ascii?Q?I217SVxlvi9c0kOj4B1kv232FRz2kCUqVLy6a0FjzOpvKPJY5IYSLsS4p2nU?=
 =?us-ascii?Q?0yS9+D9Ip73qHUBdedyvDvEW44+g6oaAVgDuiFIINMGjUVShd/QqE1Usa2b+?=
 =?us-ascii?Q?BVJCJmiaY6mY4oRHKq3gJzQKoOYuuBD4fv/b2soUYO6pddeYZCtdcYTVQudn?=
 =?us-ascii?Q?PE2/HGx32zEQ7/BnwaaPsewJBGc+WNfAq2ufkq6lcuCyG5YFbB9UgXIxpgg+?=
 =?us-ascii?Q?w78uEX4p2coHnKr0crNoixdZg8GAvumsShxv/cwe3juN9HDewP3GunKSi4NQ?=
 =?us-ascii?Q?rXVcgeCZnsOBlONFECcwiiPF7xL00xBH99o857u7G5H+iemlKirb1jdZl0tL?=
 =?us-ascii?Q?cRB1ZGIApRrIG2tFXLaxqOq5A9YIQV0auHN8MEIsr9igT3AAiVdv/s9leab2?=
 =?us-ascii?Q?Kb0MkooVopObbpdcN/W81ESvSsrLBkG11Fle+BFJi4y7BCFKgCO+gmEEPVlZ?=
 =?us-ascii?Q?gZIV/8+R65T+vyHIEkPaXGDJuUT7ZyKtfXkIWjJTNixb/V5wLxPHi3D11jT7?=
 =?us-ascii?Q?vSEA9Wh4ygxrYDklfWl+a2kN2NJy2DYxSknSJpCV4cDW576LyayOveuvTU/W?=
 =?us-ascii?Q?udsmLcMgUPglzxA/xgUfJIYNYu1rBaG/7kCXWHzCpyc1iJ2gsEjzcRNRHAbW?=
 =?us-ascii?Q?qm/9H1vaUBaCNsW6WtCtiF71c2PLK8eIUydhHfvBve4admousW4joozsLo8l?=
 =?us-ascii?Q?GDHjeQUTbz5ZORaxTfYbxP/LTNcGyYoQL3sVtzXhxH1w+kBp1sZl24OBCUEe?=
 =?us-ascii?Q?zTShndXhf+SE1Uf4Kdu2FI9oz57fMypM5QvyIbg/JG1sZXVPYR2BNCWGMhR3?=
 =?us-ascii?Q?fINrn7RdC6loxi9S1Tjv/Q2U5p0ndIW1yHhDuraBlHfunnfMcrajQlxOf9Da?=
 =?us-ascii?Q?8IFs3ibphma0r3vAVA0EiUfVFQgIOJE9Bau5BDR+MrGOZ4Bp023L8wph8HJP?=
 =?us-ascii?Q?z7MNgSaGx1tcQKFZiHtyDYQu5lPQbE3QhHLWc/wLjYSdnirWNi5jCBN49nDj?=
 =?us-ascii?Q?dIO4QqKx6g=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 508e11fe-52b7-4dad-9592-08df38c3d61c
X-MS-Exchange-CrossTenant-AuthSource: LVXPR03MB989161.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 09:29:47.2530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EHB75FmdAvC5YO9FWt0rds4S9vqfzfDXWDUBJFHVaZ8LM5DD8QdrHuyWh99qf7HM1A0gNgoa7XALvX4WyHrEkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR03MB989627
X-purgate-ID: tlsNG-16d1c6/1793611792-FD80D77B-EA2F7CA4/10/78276251493
X-purgate-type: spam
X-purgate-size: 747
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 12:06:45 PM, Jan Beulich <jbeulich@suse.com> wrote:

> "Guest" alone ends up ambiguous. The "host" / "guest" terminology used before
> wasn't quite clear either, but at least there was some distinction. Easiest
> may be to drop "Guest uses" here (and below). Else, to be unambiguous, it may
> need to be something like "L1 runs L2 under nested paging".
>
> If you agree with dropping "Guest uses" and replacing "host" by "L1", I can
> make these adjustments while committing, implying
> Acked-by: Jan Beulich <jbeulich@suse.com>
> in that shape. Otherwise please submit a v3 with adjustments you consider
> suitable.
>
> Jan

Yes, I agree with both changes. Thank you for the review.

Regards,
Chunjie


