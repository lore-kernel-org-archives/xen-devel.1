Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B841606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=oI8Ii+Wr
Received: from list by lists.xenproject.org with outflank-mailman.1465284.1675968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMa5F-00024D-Ry; Fri, 30 Oct 2026 00:03:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465284.1675968; Fri, 30 Oct 2026 00:03:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMa5F-000246-P6; Fri, 30 Oct 2026 00:03:01 +0000
Received: by outflank-mailman (input) for mailman id 1465284;
 Fri, 30 Oct 2026 00:02:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMa5D-00022u-Ob
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 00:02:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMa5D-00BnQs-5W
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 01:02:59 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ae3de85-8faa-0a2a0a5109dd-0a2a4502de76-36
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 01:02:58 +0100
Received: from [52.101.48.38]
 (helo=MW6PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ae3deb0-6ca4-0a2a45020019-346530268da1-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 01:02:58 +0100
Received: from CH3P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::29)
 by SA1PR12MB999084.namprd12.prod.outlook.com (2603:10b6:806:4a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 00:02:52 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::44) by CH3P221CA0005.outlook.office365.com
 (2603:10b6:610:1e7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Fri,
 30 Oct 2026 00:02:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Fri, 30 Oct 2026 00:02:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 19:02:51 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 19:02:48 -0500
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzDJf3aLrHWKAmR9wzNlY0NYfIcRzIa5hse4+tI0TrYuGB3zeCi1eL4aAiDz5pk82cm22nmr5kFYXr3YW96z981bIaXk5NbifJ4aw2McErYNb1ZWfEcytPhuPGTIAWk8OARU8vzn6bI6OasLPC7ORAOyyKQYAiuBe9xulS9JYJPVWy+X9gB0WCVRGFZ6Ljt9k28biTJX39G34p+J5eqEoGk8invsOxACafFrSo+uTiEYiGz3ByxvxPN/O92t1OOCk2zk3lhCsC/G8xD8nHbhm3ekvb7zrPbJRq05YwYQId6xJ4lla6kZkQay2Ic0XrsYh4W92CfCVgjM4+Qgz/GsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGZqTsZQRonp6yDXZ074c5A5YvMS6rkOgc+QQ3a5fRU=;
 b=eeymBwviZvr/JQdZDxDn5190z0JYFnrmr2d29fKap26zqfoLYXGGZZob6e46BcV4gTLTL+XVeIqPs4VNTD3l1eIyxX/UEOl+WNXERI3iqAW5diyE+D6+JS6Z/+tzSiKXQy48hlw2f2KFQX28Z5pzhbDahqZ27tFhw50bDQKnBtaO53S448sR5jGli1om3jhk888tLF9sGdUI7HOSGtdG/uTC/O7eH1as2hOqzJk8bw1imfckMZzwt6YYkGodMVkmSlXhMTGE6y4njDjIQ03aWcsK39SYoDIRCVat/6nJcY2/yl4477zYjoSwTYZFoFV53NvxXr7Xmyf1wsLRVSON8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGZqTsZQRonp6yDXZ074c5A5YvMS6rkOgc+QQ3a5fRU=;
 b=oI8Ii+WrK4qXnvCFEL387BqTr7CNG08B2LMcOBHIvsHkkQsBzeXuTCQGbKGobjJ+6fFdfL6IiAKucSIELuwcr14Ptb/HPzmuNq7FLpmBA5E0++5Bu3KDjdOk26iCT/DxWz38BinCkJonNWSCk1j0l4E7GFo4CzVo/jYvGkYh2/0=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <eb630916-1341-4760-9e88-5a37eca03106@amd.com>
Date: Thu, 29 Oct 2026 20:02:43 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] common: introduce "brk" allocator
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
References: <8ad3beb3-af5a-477b-af97-614edb22631a@suse.com>
 <4fc90702-fb9a-4f96-88f0-35bd3b4857f4@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4fc90702-fb9a-4f96-88f0-35bd3b4857f4@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|SA1PR12MB999084:EE_
X-MS-Office365-Filtering-Correlation-Id: 3985e348-db41-4fd9-557e-08df361923fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|6133799003|22082099003|18002099003|56012099006|4143699003|11063799006|261022075727099003|261028144727099003|261021121427099003|261009223027099003|261026121527099003|261022105027099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xW4DSPijWKlYnwfb7broc4yCxt05O04URWBaaOT/W1Xv14e6LDV4fy6M2UFdGsdiW+sRR3NMzCtBrpW32BaZ5AmPWo6jkfpOf9G+r1JqfFTxGfrU5un98+97fPzCkO3cF/vU8uCYNyk3Mss68qK2Qv3JEdjHJAupHeA3hFkvQ3BhfnTr4vABjo571sV+4WZoyG/VT8QR076aEJRVX/WZGkJSSnlFhOusdqQnLG9WvkON9S0UL9n7tBd2PTLKZCPcFjXtD6mu9gxF8zQXcbBKFTNwGaLBFcv9a0JNFpe1v00it6nsN824Kcv6l4jVrPI7eAD1TVTrydPQwGKTBvc7F4q8syie4EllrCzWTE5Ub73myyquKlgImK7quJKc9NeWr1sxpfeaOwuazqMdKctbVzV5LK97Yt7uit2PhLreIwkNjDEbx2hXFyFBDYg1RwGgsS+r98zPOheYNHsw77Rz99GJOx4iD7FXI95DZd0ignJ0AWdl5HUJCMmva5BS/HziOJLKcq/Ggf34Jxxm4YIhEuTtWiqUJLG+sol1YN0pNQS7MlcKg+yeV7hLkd8Rg7WNxQJF1i4maYVjLqg7loc4AjwdtQgvzlUXfnqIkpWK8k1MehrRlDximi+q/7X9PzkJJBER+RYF+EaCbVPTHNs0wjO7FwGQFYz5kU5oKtFO0evDRJq8X2gdf9EnmTcn8kYNEbbL2lyZ8H+1MZHjolTyww==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261022075727099003)(261028144727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261022105027099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7kSPwppNgOZR+X01MjRZUOJQ+cwKQ5tHvEGEZ3UJiBc7ave22fAmuamZCiBB1evYkq7yQk4ySPws1BugWXV7Lqwtpa7F8cCgbFFcWMenzj1BpRskinA+3vRcOSA7xabAfvXEtwV48sX2viJQ31ZtTgwuNIH6SKxausXOAsK5uCftGpXpQgUYBMsuw9Jn1CleFuawahsGmT2zIplgg3iG56AGTckvxXGRmRgrLTebObB1a7ne382eVk3afltizVP9nkppTngvrtUMj+eG8zmuUT21SgJyaiLyoI21X+4sccM0GsW9U9laPSn2qqQ2ngvOKoaF/HoE1mWeyCGHlpcgE47vu8G8Wgzipaygv7NIFN1i8L9SXLtvr7qvxppHSWzg9MrZs6v5Bbs7KIPuZKytohxiBzpAW+fyct+Oi5wmhAixtgWcpbAgMvHPVFeFAp4D
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 00:02:51.5520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3985e348-db41-4fd9-557e-08df361923fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB999084
X-purgate-ID: tlsNG-720697/1793318578-F10A02AC-4AD9D86B/10/78276251493
X-purgate-type: spam
X-purgate-size: 2048
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-14 09:01, Jan Beulich wrote:
> ... to replace (on x86) ebmalloc(), and then to find further use(s) to
> allow recovering memory which is needed very early (and hence needs
> setting up statically), but may not fully be used (or not be used at all).
> 
> Note that unlike free_ebmalloc_unused_mem(), brk_free_unused() (once
> other code is converted) will be able to free part of the BRK space even
> in the xen.efi case on x86. That would happen if BRK space extends across
> a 2Mb boundary, and actual use stops before that boundary.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changing setup.c's reserve_e820_ram() uses would be cumbersome when done
> right here. That'll be done when ebmalloc() is replaced, and hence
> what's there can also simply be replaced.
> 
> When linking xen.efi, GNU ld prior to 2.46 produces a base relocation for
> the reference to __subsystem__, which is wrong (that's an absolute symbol,
> after all). That does no harm for our purposes, though.

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/brk.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef X86_BRK_H
> +#define X86_BRK_H
> +
> +static inline unsigned long brk_adjust_start(unsigned long start)
> +{
> +    unsigned int subsys;
> +
> +    /*
> +     * Only xen.efi will have the symbol __subsystem__ available, and it'll
> +     * be non-zero (10) there.  In ELF the symbol will be undefined, and
> +     * hence zero will be loaded into the register.
> +     */
> +    asm ( ".weak __subsystem__; mov $__subsystem__, %0" : "=r" (subsys) );

This seems like an indirect way of determining if xen.efi is running. 
Your comment explains this, so it's ok.  It seems to me that an 
alternative would be to add an explicit symbol to the xen.efi linking 
instead of this implicit one.  Though that would just be replacing 
__subsystem__ with something else, so maybe it's not worth it.

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Regards,
Jason

