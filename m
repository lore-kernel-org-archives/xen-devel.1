Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9546EC88E75
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 15:11:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421893.1647516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6UoN-0001Gu-HN; Tue, 15 Sep 2026 15:11:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421893.1647516; Tue, 15 Sep 2026 15:11:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6UoN-0001Gn-Eh; Tue, 15 Sep 2026 15:11:07 +0000
Received: by outflank-mailman (input) for mailman id 1421893;
 Tue, 15 Sep 2026 15:11:05 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1x6UoL-0001GO-7b
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 15:11:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6UoK-00HDv8-2Y
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 17:11:04 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa96004-bab6-0a2a0a5309dd-0a2a4507946e-10
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 17:11:03 +0200
Received: from [40.93.194.38]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa96004-b4ea-0a2a45070019-285dc2262173-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 17:11:02 +0200
Received: from SJ0P220CA0019.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::35)
 by IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:10:55 +0000
Received: from BY1PEPF00026966.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::98) by SJ0P220CA0019.outlook.office365.com
 (2603:10b6:a03:41b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Tue,
 15 Sep 2026 15:10:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026966.mail.protection.outlook.com (10.167.244.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 15:10:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 15 Sep
 2026 10:10:53 -0500
Received: from [10.59.21.158] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 15 Sep 2026 10:10:50 -0500
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
 b=vWIHfdx2yvo2ifZSfC8Rt1yqiB83ZqBHUkaW2xM4PAqRKMHZW2DZb/4E82CRUKpqJC9Kym77OnGQWy89r18GcREPL9Itgh+eNr57NxdJAJlBJSSE1m+zU1YFScMkGzSIGw7nFbnkEGbzEEOhwDTt7OsHGqtHILogXFQuWJouORVCc5quQsyUYxV4A3SY6IPGE8DclbKw22hlWsFNgk8bNxX8Q++KnnoVWpZGAWJNY6TW03kbP4w9AuE0bLRIZYoTHKkYqtGz3dK3NAJ3SBFrdW5coaVSrgGpb/tVTqPaGO4jFgcaQr5PGCAQshrA0KsVGqivfz1fb+LUKk67AkcMAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlRb2gesJ/feywV2dEBLlDH3IlnkEBKEj38S1Cmyy1M=;
 b=I6aqAXpP/SInA8w00WAZzSuOQaBr1k5UvQzrRC0DIRC1JnPb1/uF8DEv4RxABNLyf9RdiI49m3zvcH4ib1/mNqLkiZEZ+rZ4REE5vZSwd5pcs/EtLQqMkysfs7A9NwvxfogbB4ImMdPf34p10TXb+UPvx4qMbiyeuZq6FfNx0a9cUuXlb+HWrzi+LUVsq8R70R6Lx/JnFJB+gXyNU7igynufKcfZfAub4oiaONoLOorUQspZ6C3Ls4yYKMAjJMWPNsmrL8jSt8d1tH+UvRmbIpXU3lHfov8ghPIYvbfmGIgwh8l6sLwP6qlwZJA8r7je53ocSqbsvTLvMZgU9oDyCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlRb2gesJ/feywV2dEBLlDH3IlnkEBKEj38S1Cmyy1M=;
 b=DURdfjvimofBwOm/N+DN3CkNzqFqPF5Ztl718ePkzrQyxblXb/IUr1an/gy7udchXW+lpKGE6mq62qXZFT6Jk7X3bvnm+pPWVNZXeeZKQe9c5Dc29oZg0Py1UhFxVnNBdlzKHgSJFT9p2uA1eHwCyfTvV+yDTtUIAI/DuVyfQcI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e090ed6c-c9aa-4b94-8652-3350cd9473c4@amd.com>
Date: Tue, 15 Sep 2026 17:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] ARM/sysctl: Expose the supported guest GIC modes
 in physinfo
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>, Andrii Sultanov
	<andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, Teddy Astie
	<teddy.astie@vates.tech>
References: <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
 <1789130862.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1789130862.8631fc262581453bbf619ec5b2062170.1a090827031000c4f3@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026966:EE_|IA1PR12MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: 676102be-cb34-4d21-e809-08df133b89be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|5023799004|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BFJ2tLQhmsOZk81RbyCFsNaTXLRfkCmEY/XSfVGmndNHzc5Ty+ylpbmFrNLZjDxAwl66LoRzwhygxAo2KMzig/BLmlvhXthnrpi8vaZFgV7xvZw5puwTNi0wtNfBMNjABNKqlKcM8u3dQ66tluy2oImOf3AjRREWumxNBvUjcYPzaDkybut6+YsifrFLEGL+sziODsGtqbQ2YMgeEw1jPbl6uf7AXRG3zYg7MpLr/RDwnQ6W6uSwZqOINTWfID3mxYzxtZQsQBBsl6IRHFX+gkwYhZ/S18q/STD76YEZb77GN78D2UonjNIkZXMNmrei6CI//Q+hz00Ftby2lLzHH3WnIDAUxjvY1zuCq6nwGfEE5XPh3zBL34FzWgyHd8KDJAFjbPJBOfGMQweJXz3xds+Zv4C9rzxKSMMSeCTuprSwB9+oBYEFLXwFjA+pJ1DSKcQdQddV+juO/NpCX9SLjz1vffv/FuK6KxbPhRZfIs0xQjqN24EYIEOquzOrGt68Zqh+zwSCNV4KY8+OXexunqnGYV0E8u0AENu/pjgDGp+i0lK0JnfCZVEDZi063LLP+ZFIuIN8cs9WzFt9laSH35bUNQ3rMIqMZkqlG9/5lskzUo1QOOiVXnDXWVUE0RjuNJXEwmKbD/RReyzkNUiwmXj2pJ0KnJjfGaRAY+uGMwqTF+ItZw9I4hHR9Svq+y/QH4wdTyf03mj6NR9sp/fysA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	C4a1r/HhWkqC2O1AwqFl0SODcCGw0vdgT+cbiDVsn/94aOQ0b+MTxxbMboq1V8OTMVFIW46gPwmA1y1b6K4V0aWoF4pqCbf8rBsFOo3EaQKqJEPxplFWRdyweFtjpvTAo1Rjm4wz23TGTnaUDQ/Iol5cn467oUicVXTvliHAij3aEvw8BcfhD6Ly8lcgCLyqWpz/s/eSoMtLlT6cMq6OweVZChUUgcbhX4o0Fwq7Y0uWOFZVBsKsPttUOHGDMV6pyO8hmIzcUhZehf1fFrmM3ekdThaOInruFs1BWMpN1A9WYuCIOwM+d0Qa0g5fBD5+CAacXhG/6559O3O4QPJi0x+ub9yHC0BYyzf3vUOUCz5sRm6XEJiboLuWRgXMhuxQJjrHKsJ1TeSzV1CjBLkY7o5K0xlAgWlwhFz5F43Ky/BpqIecDXo5U5tZ3hsuRX4e
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:10:54.3862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 676102be-cb34-4d21-e809-08df133b89be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233
X-purgate-ID: tlsNG-ef75cf/1789485063-A74D3AE4-CC83A485/0/0
X-purgate-type: clean
X-purgate-size: 3725



On 11-Sep-26 14:47, Julian Vetter wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> In preparation to simplify the domain creation logic surrounding GIC
> version.
> 
> On a GICv3 host, also report support for GICv2-compatible guests when
> the hardware's vGICv2 compatibility mode is enabled, rather than just
> the native GIC version.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
> ---
> Changes in v5:
> - Add vgic_v2_hw_enabled() to new vgic implementation.
> ---
>  xen/arch/arm/include/asm/vgic.h |  6 ++++++
>  xen/arch/arm/sysctl.c           | 34 +++++++++++++++++++++++++++++++++
>  xen/arch/arm/vgic-v2.c          |  5 +++++
>  xen/arch/arm/vgic/vgic-v2.c     |  5 +++++
>  xen/include/public/sysctl.h     |  2 ++
>  5 files changed, 52 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 6f9ab1c98c..26c53aaf3c 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -433,6 +433,12 @@ unsigned int vgic_max_vcpus(unsigned int domctl_vgic_version);
>  void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
>                        paddr_t vbase, uint32_t aliased_offset);
>  
> +#ifdef CONFIG_VGICV2
> +bool vgic_v2_hw_enabled(void);
> +#else
> +static inline bool vgic_v2_hw_enabled(void) { return false; }
> +#endif
> +
>  #ifdef CONFIG_GICV3
>  struct rdist_region;
>  void vgic_v3_setup_hw(paddr_t dbase,
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..8411deb7e2 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,7 +12,11 @@
>  #include <xen/dt-overlay.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
> +
>  #include <asm/arm64/sve.h>
> +#include <asm/gic.h>
> +#include <asm/vgic.h>
> +
>  #include <public/sysctl.h>
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> @@ -21,6 +25,36 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> +
> +    /*
> +     * The GIC version(s) we're happy creating guests with. Right now for
> +     * simplicity it is tied to the active hardware version, but this will
> +     * cease to be the case if/when the compatibility modes are enabled.
You carry on this comment but as we are now also informing about the legacy
GICv2 mode (which was not there in v1) I no longer understand what it denotes
and why we need it. I think we can drop this.

> +     */
> +    switch ( gic_hw_version() )
> +    {
> +    case GIC_V2:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
> +        break;
> +
> +    case GIC_V3:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
> +
> +        /* GICv3 may additionally support GICv2-compatible guests. */
> +        if ( vgic_v2_hw_enabled() )
> +            pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
> +        break;
> +
> +    case GIC_INVALID:
Change to default please to make MISRA C R16.4 happy.

> +        /*
> +         * Running a control domain without having the GIC sorted yet?
> +         * Something's broken, but there's nothing we can do about it here.
> +         */
> +        ASSERT_UNREACHABLE();
> +        printk_once(XENLOG_ERR "Unrecognised GIC version %d\n",
> +                    gic_hw_version());
Please swap the printk with ASSERT.

With these remarks addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


