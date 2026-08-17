Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB36C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 12:40:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392906.1631864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwd3-0002AW-M7; Mon, 17 Aug 2026 12:39:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392906.1631864; Mon, 17 Aug 2026 12:39:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvwd3-0002AO-IJ; Mon, 17 Aug 2026 12:39:49 +0000
Received: by outflank-mailman (input) for mailman id 1392906;
 Mon, 17 Aug 2026 12:39:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wvwd2-0002AI-6p
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 12:39:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvwd1-00Bt6H-Jj
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 14:39:47 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a83010c-8faa-0a2a0a5109dd-0a2a4506df86-12
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:39:47 +0200
Received: from [52.101.46.52]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a83010c-195a-0a2a45060019-34652e34fc3a-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 14:39:42 +0200
Received: from BN9PR03CA0353.namprd03.prod.outlook.com (2603:10b6:408:f6::28)
 by CHXPR12MB999221.namprd12.prod.outlook.com (2603:10b6:610:2fa::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Mon, 17 Aug
 2026 12:39:33 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::5e) by BN9PR03CA0353.outlook.office365.com
 (2603:10b6:408:f6::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 12:39:33 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Mon, 17 Aug 2026 12:39:33 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 07:39:33 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 17 Aug
 2026 07:39:33 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Mon, 17 Aug 2026 07:39:29 -0500
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
 b=PAg/ZIM6eL665tU4oTPAjrVkgAkeQMNEImPfHp1lAaIwQYkPRVt1YkEUUd5rvBKrUejBA0qFKGhv5YhVe4IxbjC+XPfOFKBjS/QbjWxi7jbtiLZKAUdv/rcCln4SwSJW1CUKPQS6OtxJtHPVaSAU6Bv/Vsyra/j5ZBe9bWs+PlfwfNXWPxzKbshjW2EVbmCwlClMNRVaMYZ0R0aoVDyk4LXXejTip7uCLxgtT7amyyS2SyI0Z8AuSXnyilebdvMVZ4u/AgfFxERldRGebzDyPsjBDtPo3N6bjo7rUszl25VKWUCaDPNOZqSWIzfBINyX0sK+36hbkk2L062DsvTIPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3u6Db12QY4PhKMFWPD5Y/+VusXMFIdi/b0QbYsJf84=;
 b=xo/O1VWvyi189LtXzd0ydExjjW56S9ywgb+WTtDsydlivGHDeh5vLP1DR7mBasRSw+x7R5ckCVwcW0j4aaDBeN7kjWKnYjZYqKCs+dZzgh3D6flC38jgNxJvhUXV98BLmK8iHU8oI4crQKQjuFOHhRi3hpcPZa2qNFfbfeOFjRvA1wslT/cS1MP3mlXRHshumyF26I9L2o0fzk8KDrifxO+f3Y1vyQQFkyqq5zTxj7kLJbrnG4W2ME72ZI9tvCBMzOo3i1Cqs+C7j6jv/RHCp+FOd2KHj8EcLcw0VHkdZkUrq3VglvjG/hq7pDzT31c2IDhCaD+2ImS/13T5wmQmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vates.tech smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3u6Db12QY4PhKMFWPD5Y/+VusXMFIdi/b0QbYsJf84=;
 b=OsX5e8YF4RtMMjb7E3s9zn6pci4izW5W3Fop5GoXsHz8PXkJKsV3UtpXCx0VbvMrAfHfrvCfbNwsd/UXU3UW2HZa0ghZYIEdIvZmt88RlczGOZMIGmqymndH2jd0zv0bACqQJXUp+nmxSNTMT7se4rqmsY5RSOt+/hGo77kdMzk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <ee383990-f688-4244-b817-5df4c2f8decc@amd.com>
Date: Mon, 17 Aug 2026 14:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] ARM/sysctl: Expose the supported guest GIC modes
 in physinfo
To: Julian Vetter <julian.vetter@vates.tech>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>, Guillaume Thouvenin
	<guillaume.thouvenin@vates.tech>, =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>, Timothy Pearson
	<tpearson@raptorengineering.com>, Alistair Francis
	<alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>, Teddy Astie <teddy.astie@vates.tech>
References: <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
 <20260716141138.88265-1-julian.vetter@vates.tech>
 <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1784211104.8631fc262581453bbf619ec5b2062170.19f6b44e427000edb5@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|CHXPR12MB999221:EE_
X-MS-Office365-Filtering-Correlation-Id: 33411fc7-3661-4350-f83a-08defc5c9720
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|7416014|376014|1800799024|23010399003|56012099006|4143699003|5023799004|11063799006|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info:
	CAMrLQV7BkdhyZHblKvmwpItkkKBIc+J3kQZGNzHp/REjvqFp5X91EE50fAGdOniJt5hsyjhdw9u6mhWqXz0tAIKW6WsOTV8t5zAeQE+rteNgOixyyK6rCYE/vZXoS3O5jxkoddSkfliCUwHUT51uvfW5CIM+hImscbdarpYk1hTk4zFqkMF52IaJzdCxzX98uaujhR+1ktMLoZ4FGXQ5EXc/HqWBgelsnLCslLHbXEixoWPupPiq3RF0WQwh+pwP+ZvIF2TKbvIvIXSdjLWnvlYy2j0v65LpEDYWjyw18NcPKvo1T4nVpCtXLX2b63WPYnU+i+pTvWJM36BjOlzvRZIOoTXoW3OhGF7yGVa7MwgZCRQep2lu4x/GUmTaOw0bO3d9GtJbiCaKr/k+8YdGqueAbkS9Ob21saM1yZfkZlbT44e69KuSIY8cJ/P80NUMhiHqN240Cq58rixmOeqEQCWnm808A0xbFY9SgWfphrCtmdk1gcIY7pv91e4NWZ3F0kKIwVp2PO5aLRylU2QSqxX25OXzlS29++Ra8j9P1hS+aRKwGLn7ZjE9VaCs8XKaTUgFfStzkiExdBE7StgbJXCKgryvBpiYmwm9cjuot763pWpSq8ahsjOtKms+G3n4IEmL3ixDc3erHsrTvRkAaBAarZaOAbaQeE6qhWUTZ2VEnk3YGQkqmkIoswHNPANGbkrZDmX42LuUNtp/lU8tQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(7416014)(376014)(1800799024)(23010399003)(56012099006)(4143699003)(5023799004)(11063799006)(10067099003)(18002099003)(6133799003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SyuUwcO9XRBSTMm8WGXjOFbKxP/se0P42etSVs4B1W+bRq7LPtWr8//sjJSouLV1utwH9151vF0tvK3yJKZ1yX1xA00eAIYQ8ojakcvjognFaHAcQJUBmyRtQ7q/CiiB2EiIPxFTzpouFujhzvUUDGArz0T+Kva2U3JwzYngRRzwdRy3rKHYbXO1rhuMRxRkSH2bAwKwX44/cOvW7XPJdsdGbt3lvyWOOQT9G0c7NqWiL7xYoU7F4oAhGH+0kAwRuBCI6nQKe36iz/XZprP6AjBMdEYZkCwb0OFy0HtKeW8HAymAtR/PWHNjgn4W/wlrzfwzAng00awZfKNttvmh5FltEEraIGOyUR+wnzN4m/jEwuTEAQHr4TtftV+RWE9eigBTnGmDnQu08xXJSJhKEjecHV/8N0CfCdh7Pg6t5DyS9JnHb7YzYuFjZ/8ahO16
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 12:39:33.5455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33411fc7-3661-4350-f83a-08defc5c9720
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999221
X-purgate-ID: tlsNG-16d1c6/1786970387-FCA0477B-1DFCFFD5/0/0
X-purgate-type: clean
X-purgate-size: 2579



On 16-Jul-26 16:11, Julian Vetter wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> Changes in v3:
> - No changes
> ---
>  xen/arch/arm/sysctl.c       | 26 ++++++++++++++++++++++++++
>  xen/include/public/sysctl.h |  2 ++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
> index 32cab4feff..3b0edf4cec 100644
> --- a/xen/arch/arm/sysctl.c
> +++ b/xen/arch/arm/sysctl.c
> @@ -12,7 +12,10 @@
>  #include <xen/dt-overlay.h>
>  #include <xen/errno.h>
>  #include <xen/hypercall.h>
> +
>  #include <asm/arm64/sve.h>
> +#include <asm/gic.h>
> +
>  #include <public/sysctl.h>
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
> @@ -21,6 +24,29 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
>  
>      pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
>                                         XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> +
> +    /*
> +     * The GIC version(s) we're happy creating guests with.  Right now for
> +     * simplicity it is tied to the active hardware version, but this will
> +     * cease to be the case if/when the compatbility modes are enabled.
s/compatbility/compatibility/

GICv3 may support GICv2 and we support libxl guest requesting GICv2 on a GICv3
host. Why are we not exposing this information here?

> +     */
> +    switch ( gic_hw_version() )
> +    {
> +    case GIC_V2:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V2;
> +        break;
> +
> +    case GIC_V3:
> +        pi->arch_capabilities |= XEN_SYSCTL_PHYSCAP_ARM_GIC_V3;
> +        break;
> +
> +    case GIC_INVALID:
> +        /*
> +         * Running a control domain without having the GIC sorted yet?
> +         * Something's broken, but there's nothing we can do about it here.
> +         */
Add ASSERT_UNREACHABLE here.

> +        break;
> +    }
>  }
>  
>  long arch_do_sysctl(struct xen_sysctl *sysctl,
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index c7cd9b4eb0..d20ebf3644 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -106,6 +106,8 @@ struct xen_sysctl_tbuf_op {
>  
>  #if defined(__arm__) || defined(__aarch64__)
>  #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
> +#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V2    (1U << 5)
> +#define XEN_SYSCTL_PHYSCAP_ARM_GIC_V3    (1U << 6)
>  #endif
>  
>  struct xen_sysctl_physinfo {

~Michal


