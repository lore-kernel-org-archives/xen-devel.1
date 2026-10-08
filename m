Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F118ECA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 11:19:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443209.1660610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEm9t-0005Ak-Sp; Thu, 08 Oct 2026 11:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443209.1660610; Thu, 08 Oct 2026 11:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEm9t-0005Ad-Pd; Thu, 08 Oct 2026 11:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1443209;
 Thu, 08 Oct 2026 11:19:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xEm9s-0005AS-F9
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEm9r-000t4p-Rw
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 13:19:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac77c29-8faa-0a2a0a5109dd-0a2a45079f56-44
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:19:31 +0200
Received: from [52.101.85.45]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6ac77c41-b4ea-0a2a45070019-3465552d2051-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 13:19:31 +0200
Received: from SJ0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:a03:39c::18)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 11:19:24 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:39c:cafe::64) by SJ0PR03CA0343.outlook.office365.com
 (2603:10b6:a03:39c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Thu, 8
 Oct 2026 11:19:24 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Thu, 8 Oct 2026 11:19:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 06:19:18 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 8 Oct
 2026 06:19:17 -0500
Received: from [192.168.31.141] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 8 Oct 2026 06:19:15 -0500
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
 b=LBzXqK7UmbICItDxpd8o7hvmQRgOion1d1w6l8CHuA9LXqhmLCqlzMnAXd7jDcbE3gG/pWYK3QaI4Vvtvo6H4hO2flcmivmp3dmsIuLjudrSDeXjhhX7wfu+pfAOAe/NXuOaPTKM0JTnEOam8NmP+8It5VYtXpYaKoapKhYI8Zf3uWnzD/jqzQOV5gL6WukDnpfcekMwpPVGOtgunRIpNgZvuLVlmatR56i4XkhbILzT7luDJxJQj718A22TB94YjHPCkNkyKtXqBp8tkas3FuRHqMOfJyVz3V9MOGLKz6+jChxtKNW9kna/oPYMkb4tZ7VVVcWq5OGCSkyPKQsY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLSse4rAU+6PCtYi9uC8Lbii33l9MhxK/pNybWLbHno=;
 b=cCV22iE0kJput2j09kEiQaqasZIo7ik6kkvvwouXUbeGcl5L2c7JuDnqTAKbREH3V4/YwtNJUDMx0ZxDFPoiZPaSKRv2c8d7HSwF9KtaRvx1D2yYNGEOKLjpYGtCcN0/DUPfcj2/3G/8bBLiMiZT8YG2RI15xVyzusavvXHHdB/6630aa5eU5fwmGMJrrBe4Ki2ULXIQYDx+nplgw053puEEQFdpK+gKZBNLLbco+S/HyoS7tL0uhAd5E3C5GdfU937tfkMk9TWlBkGt2Il2JO290U2eVn+dbp4huH0tRJ0v2PphmRBVzIU6KCzjHLxZclDYitUZf1pxYHKdeuSZ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLSse4rAU+6PCtYi9uC8Lbii33l9MhxK/pNybWLbHno=;
 b=x3YGgH5G8Dba6lK9zUGBJikFTimwDhAucH8cqd7o5jlQXlr/5diqW2Uq5sSf6HJNgVq9JRqu8k+i3B+dLBzHM8mBsozO4OwLksMgAeH3y5daCyzUF4ScQlZn2dYCxeAHNTEycbIosGMUBS5d2ji6Udze3O2MM09aO1A+lD+pIX8=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f15c39d3-b4f1-4fa8-bd2e-fd10d33b698f@amd.com>
Date: Thu, 8 Oct 2026 13:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/device-tree: move discard_initial_modules() to
 common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>
References: <20261001111630.112472-1-oleksii.kurochko@gmail.com>
 <20261001111630.112472-3-oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261001111630.112472-3-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: d63600c8-a1f0-4ba6-8428-08df252e01c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|7416014|4143699003|5023799004|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	5bBKA7YGDOGnxGTGGwDgoAp7LQbPRN4UR0Ea2ladzMkCZfAAhFTTir6j9/wynbR74N60CCRVGZpi8EdXCsgORLl0Fd1BAnMkCcWhuERyEC8ikss+RGct+voWvQtLi2yv1mPfX2TEoCbIY64TX2sLfOONp3VLzaaKJ1h0ELofhDZ0tmSc4EQRAvQLQVHzOaAAriAR92gmb9f0X+dpDvoPmfz4ZexHnYznKRV5S6T20A+dZW7f3R9ljcqx6M1xAzaiSXQwrLk1nI8CESlnNXuUj4wcIJZl77qNRClFPDxFxhzhJS+AuQgBJUE/CoPCsjqpJTtjgFHpNaiwgzYDz4AAzAlBZGPyD5zBzQFVweXNv589XMXGfvwDRkDPqp5PL4+c4bn2ekep1rIE8S+vl6xbC1yKe9Fh+IUD9ELzr8LPPu2qOkEBWVWXCFUXhmQZpuJVyHYWpiSjNqLJlNupReySbcWxDvWqu/lG2nQ9U9JTkxbdQb6xkjv/o4PMIvYpPRsU06uSh7Iw0+VFWzA2ccGHNfxaB94EqKIkiM8TJXDHKUiK7kACVLgNBsN1y3vgvHx8lxCy9NdRIi/KdoIJ2zCGErgKUd3UgE54nRYH3u4fob1A0gz+7000QyilnzBRoZHcmWWQHLRtGsn8LxRcr0l0WXdrX+TzF47cBamlRjRx7xNTbwaGqHF337RTANKXxMq1CpP4sN5fq2ZVimDfl9OKsw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(7416014)(4143699003)(5023799004)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X254T8ElKqszDK8Mw802WmQjXSC7C3YI0NcYBhWLdKD/fLnLSShIYjZnwuOXGDyuMO4Z363DQkt34e/5LtfSBx1eVhg4Mrci/n79w61x/PiZnW18Zx9nV2lSPlUkAfyQGA5oTi7V0+odhR7ogZolUm1yWHTJSJxQe14tK/q1ooe7qPxlDCgojTxOMGWZrGLswJPxhDiTLQD0Eae3fJctqPHPj5sg29IGjG4E6jehfv6nag6cPQSTA4pdUn/lIkwlc9uSm65ijO90Muu0KmPAsQKlK/OlLKlsiaM0VDmZ1JYBaQE608FisdXI1RdCqtW1urKl1kiqAIRdYXwdoz9y0xTd/GR/gt24m6fgCeGyJWW7u60W5ev6ImcAcOAGhnYdrxBHslcC0i8yS9H+IisCpAw/Yr2QdWzau4dT1DsFnT13O9wc2ORtYMy8x6IWHl1Z
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 11:19:23.7195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d63600c8-a1f0-4ba6-8428-08df252e01c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174
X-purgate-ID: tlsNG-ef75cf/1791458371-A54C3AE4-55841F77/10/73395122804
X-purgate-type: spam
X-purgate-size: 3547



On 01-Oct-26 13:16, Oleksii Kurochko wrote:
> Everything discard_initial_modules() touches is already common code:
> bootinfo.modules, using_static_heap and fw_unreserved_regions(). Move it
> out of Arm into common/device-tree/bootinfo.c, next to the boot allocator
> handling of the same memory, and declare it in xen/bootinfo.h, so that
> other device-tree based architectures can reuse it instead of growing a
> copy of their own.
> 
> The arch-specific remove_early_mappings() is not moved along with it:
> how the early FDT mapping is torn down is up to the architecture. As the
> DTB is one of the boot modules being released, the mapping has to go once
> they are discarded, so call it from start_xen() right after
> discard_initial_modules(), which keeps the common function free of any
> arch dependency.
> 
> While moving it, use unsigned int for the loop counter and replace the
> "goto out" by a plain return, as there is nothing left to do at the label.
> 
> No functional change.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/arm/include/asm/setup.h  |  2 --
>  xen/arch/arm/setup.c              | 35 ++-----------------------------
>  xen/common/device-tree/bootinfo.c | 30 ++++++++++++++++++++++++++
>  xen/include/xen/bootinfo.h        |  8 +++++++
>  4 files changed, 40 insertions(+), 35 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index c491c567298f..02fdf2b56c9c 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -40,8 +40,6 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
>  
>  void create_dom0(void);
>  
> -void discard_initial_modules(void);
> -
>  void init_pdx(void);
>  void setup_mm(void);
>  
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 16f899dff57b..a65c3d2a655e 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -210,39 +210,6 @@ static void __init processor_id(void)
>      processor_setup();
>  }
>  
> -void __init discard_initial_modules(void)
> -{
> -    struct boot_modules *mi = &bootinfo.modules;
> -    int i;
> -
> -    /*
> -     * When using static heap feature, don't give boot_modules memory back to
> -     * the heap allocator
> -     */
> -    if ( using_static_heap )
> -        goto out;
> -
> -    for ( i = 0; i < mi->nr_mods; i++ )
> -    {
> -        paddr_t s = mi->module[i].start;
> -        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
> -
> -        if ( mi->module[i].kind == BOOTMOD_XEN )
> -            continue;
> -
> -        if ( !mfn_valid(maddr_to_mfn(s)) ||
> -             !mfn_valid(maddr_to_mfn(e)) )
> -            continue;
> -
> -        fw_unreserved_regions(s, e, init_domheap_pages, 0);
> -    }
> -
> -    mi->nr_mods = 0;
> -
> - out:
> -    remove_early_mappings();
> -}
> -
>  /* Relocate the FDT in Xen heap */
>  static void __init relocate_fdt(const void **dtb_vaddr, size_t dtb_size)
>  {
> @@ -509,6 +476,8 @@ void asmlinkage __init noreturn start_xen(unsigned long fdt_paddr)
>       */
>      discard_initial_modules();
The comment above is now duplicated with the one you added in xen/bootinfo.h.
I'd drop it from here (can be done on commit).

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

NIT for the future: if you send a series of patches, please move the fixes/code
movement changes at the beginning of the series.

~Michal


