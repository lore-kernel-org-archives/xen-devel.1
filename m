Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E681C88E4C
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 11:03:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416386.1645450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4z2h-0002v8-So; Fri, 11 Sep 2026 11:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416386.1645450; Fri, 11 Sep 2026 11:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4z2h-0002v1-Q7; Fri, 11 Sep 2026 11:03:39 +0000
Received: by outflank-mailman (input) for mailman id 1416386;
 Fri, 11 Sep 2026 11:03:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x4z2g-0002uv-86
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 11:03:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4z2f-00144p-L8
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 13:03:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa3e001-8faa-0a2a0a5109dd-0a2a4508ca52-24
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:03:37 +0200
Received: from [52.101.52.24]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa3e007-f659-0a2a45080019-346534185a6c-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 13:03:36 +0200
Received: from MW4P223CA0015.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::20)
 by DM4PR12MB7624.namprd12.prod.outlook.com (2603:10b6:8:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 11:03:30 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:80:cafe::8a) by MW4P223CA0015.outlook.office365.com
 (2603:10b6:303:80::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.10 via Frontend Transport; Fri,
 11 Sep 2026 11:03:29 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 11:03:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 11 Sep
 2026 06:03:29 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 11 Sep 2026 06:03:28 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7AOgJc8Un7D7+CMG4PirKd0+2jcLaHSGwli0wGPLSMAQIRJSRd0O+WXozxrbGs+blEeFECzj/ri6l8zrjRIQtTZZi5Yw3SpJYtKye6WPCkdh8AIfL/ySWfYgbctpqt/5p+4AJJZhIrPFoCHgir9XK3IVlIV0NKMgpDjTQfWraub6aduEMv/NWcVtHL94lgCyNNwPACRFqGWGk6YrTzPl4JvqM+ys6WqKJLF5yq4hIElyZ/PX7/GgnV6iwY58cJqa1On4CYOYt8uzgvReba/s6Dnml+ecKz2v6JqLPVBApT2L/aMjiRGV1hrKFdb+ghZtK8gbcBYzhOCuQxN1PMDzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ecex6EjQ7/nbKiyjI7EhIgLYA7bPmZOxJAuA8lE0sc=;
 b=jgyb30lEM0Wf7TJkF8actGz5XljAILAfZeejfpgfxKVa5iGgjjNUksrMCnm3VT7gxgZXW0P4rz0eG/tCaLpEZLyw1Zt0/Jqx59yMIOTIjsGanFdLn0+opXyjw7I+Nr6uzj+Wry6qSHvIUgb0YJ/iDx/fLOMv/FjiM9D/GB9szhhMpscDeYm998e5PRQOFvIyYHtsg5Y8WNwXgzdGF1N4PRizK8Ps6OIreuk1MaGKHAEb7M6PhNHoe9RSssotek2pga4ZwMJ3H+1VjZv05HFCMk0MagpbD9utZc2MEmVASb1VRo/7T+mYG9Sy2CUUmHC6z2t+L1ChbKeqRr3O/1guuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ecex6EjQ7/nbKiyjI7EhIgLYA7bPmZOxJAuA8lE0sc=;
 b=hwFdQ4YJKtXMxvqRr21NOoqe3iGypoFNRV8kHInc6SFvucwQHEwuxEBF2W/XBWr4BCHn4iJNLVuzFxkqIOMO9gwig2f6cajnuimS5W5RxXEpqExIGS1GJsE27om0wP6JLwMfIcqYsj8HzclFQ6DMxLURaNe/kmyHmgdw3GO5ANo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <fc7d64e7-1de3-4d8a-ae88-abfbc2735624@amd.com>
Date: Fri, 11 Sep 2026 13:03:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/arm: make is_espi() a pure range predicate
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1787050437.git.mykola_kvach@epam.com>
 <8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <8e42437f8abca2722f1a2e2568bbb5b938c23e85.1787050437.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|DM4PR12MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df4e77b-4bec-4e05-8bdb-08df0ff44ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|4143699003|10067099003|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hrQvIuLTN0EoaMXEEloJ2NCJgy3QVM+DgDvYZHdiWgloNKyxSElNhx9Wxyf4DK/n8b1TGcbar8BrpHK1gVSILTT+swzPhF75390gnQPgakUBptNe7nZ1O9MfrieDHxO3gnPc9t/EdC2iVwlSXBuxO4Xg9aQ7jHcZwTUYw5NR13DTPjTOuvYOXpB7+kIyQT86DIqd4K4QeyGAmdsRiyBQWZSqPxYq/GDHFeTy6lMtmr92YKNxvUkMFn3r0BcD/e9HE90XvLxHjq3mvo3eYHtpROO085e/wW/kuwLpSUGmifQBtEXQtuqFMyW1aBRoXyV896HgaWAEzawNVSdyFnrYFxtRFG+g3o1GNwTYHj0aJz2NS+Lbh/TRgjR54rTv31wOGq2+4sCAGrOYr0lbsvSIMCocEGLWMFuktwWb8IU5NNedRjcDGMi9NPAq9Vl/aIK4iVPr+vvQg4F598fO1eTXLV0IeB94IhXjgQib9tmOhY+JThKwZ5zTam1kVbsMeuHip/MAN7iIXbVDA+8egIaiRoHKVzkylMtkNMTVJR+VFdIj/VnK6J2a6BXqvI8lyeRL4RyV72429TeNEzD7rM37fkYkdk4qBtgdZSi7zfZP2a+ugL4lJeHyV7T9TLEZ/X0wS2a1wieDe4fB9y5+qpkqizd/YN4FHclHT3aNpmxKmyfAEAth79TS1e/a+parxL+35e/ff9JUGim3CJReDLOaqg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(4143699003)(10067099003)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kh8yKfrlhX2qCMqOGKuOTFHfjhRcNR/S/gpbJo9hVXIjzLNKArnvpEKE8qDjXTc9I84LaI4LbToHodeBlIhpJQ5fMHiz7UUZYwS6P9qlq2HM5sy04wXbTIKs6CtDj8q1AWr5w521o2BmH8Xt8aFsVzu+u3tzvj9IpYOnKq5HGW+YLgBlIjcJPYdJ7Ztg7cUuGol8ZiEQA6ubWNu09UioWAzkU3w5DueseCb3mEmQ8jWsJcWCSfb7E0bZOqup80oFBaycJyN+25fQhAhxAjdRADTJgBvE3aREMmRL4CzPerlsXHAs78XgxcuA0HEFp08C7kxA0W8UjfP44htbtVrPk5z/yNIOAhuFPJkKx4WpCHYk/bnfys4JIbdn5idI8ZamcnV2YPy1mMNhLzewwtGSogVNMOguo4g6KT9HuOiz4KOGK/cgNVrMzB/LVwly2by2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:03:29.6919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df4e77b-4bec-4e05-8bdb-08df0ff44ff2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7624
X-purgate-ID: tlsNG-c1860d/1789124617-D634587B-0F8DC02A/0/0
X-purgate-type: clean
X-purgate-size: 3592



On 18-Aug-26 13:32, Mykola Kvach wrote:
> is_espi() currently changes its result according to CONFIG_GICV3_ESPI
> and asserts when an eSPI INTID is passed to a build without eSPI
> support. This makes a range predicate carry configuration policy and
> causes callers to depend on its hidden side effects.
> 
> Make is_espi() report only whether an INTID is in the architectural
> eSPI range. Gate eSPI handling explicitly at call sites and preserve
> the debug checks on paths where an eSPI is invalid without compiled-in
> support.
> 
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - New preparatory cleanup requested during review.
> ---
>  xen/arch/arm/gic.c             |  5 ++++-
>  xen/arch/arm/include/asm/irq.h | 11 -----------
>  xen/arch/arm/vgic.c            |  4 ++--
>  3 files changed, 6 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index 078049e741..075e1d2c50 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -348,7 +348,10 @@ void gic_interrupt(struct cpu_user_regs *regs, int is_fiq)
>          /* Reading IRQ will ACK it */
>          irq = gic_hw_ops->read_irq();
>  
> -        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) || is_espi(irq) )
> +        ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
> +
> +        if ( likely(irq >= GIC_SGI_STATIC_MAX && irq < 1020) ||
> +             (IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq)) )
Take a look at LPIs that are also protected by CONFIG option. We don't ASSERT
because they are gone in a release build. We want to BUG() for eSPIs same as for
LPIs if we cannot continue with this condition (we haven't configured/enabled
them, so it's impossible condition where something went wrong). Here you should
just BUG().

>          {
>              isb();
>              do_IRQ(regs, irq, is_fiq);
> diff --git a/xen/arch/arm/include/asm/irq.h b/xen/arch/arm/include/asm/irq.h
> index 09788dbfeb..c29f3d04a3 100644
> --- a/xen/arch/arm/include/asm/irq.h
> +++ b/xen/arch/arm/include/asm/irq.h
> @@ -66,18 +66,7 @@ static inline bool is_lpi(unsigned int irq)
>  
>  static inline bool is_espi(unsigned int irq)
>  {
> -#ifdef CONFIG_GICV3_ESPI
>      return irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID;
> -#else
> -    /*
> -     * The function should not be called for eSPIs when CONFIG_GICV3_ESPI is
> -     * disabled. Returning false allows the compiler to optimize the code
> -     * when the config is disabled, while the assert ensures that out-of-range
> -     * array resources are not accessed.
> -     */
> -    ASSERT(!(irq >= ESPI_BASE_INTID && irq <= ESPI_MAX_INTID));
> -    return false;
> -#endif
>  }
>  
>  static inline unsigned int espi_intid_to_idx(unsigned int intid)
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index e5aca17dcb..e14123a30a 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -718,8 +718,9 @@ struct pending_irq *spi_to_pending(struct domain *d, unsigned int irq)
>      unsigned int idx;
>  
>      ASSERT(irq >= NR_LOCAL_IRQS);
> +    ASSERT(IS_ENABLED(CONFIG_GICV3_ESPI) || !is_espi(irq));
>  
> -    if ( is_espi(irq) )
> +    if ( IS_ENABLED(CONFIG_GICV3_ESPI) && is_espi(irq) )
Following the LPIs, irq_to_pending() returns NULL if they are not supported and
we somehow ended up here. We should do the same here without using IS_ENABLED
and ASSERT. Note though that for that, some call sites need to be enabled not to
dereference NULL.

~Michal


