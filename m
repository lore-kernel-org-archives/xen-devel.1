Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D3F606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 21:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=AJEwFedZ
Received: from list by lists.xenproject.org with outflank-mailman.1455021.1668561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIvD5-00064T-JF; Mon, 19 Oct 2026 21:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1455021.1668561; Mon, 19 Oct 2026 21:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIvD5-00064M-GV; Mon, 19 Oct 2026 21:47:59 +0000
Received: by outflank-mailman (input) for mailman id 1455021;
 Mon, 19 Oct 2026 21:47:58 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xIvD4-00064G-AB
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:47:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIvD3-00Fe6w-NK
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 23:47:57 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad68f6e-bab6-0a2a0a5309dd-0a2a450ce8b0-38
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 23:47:57 +0200
Received: from [40.107.209.52]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad6900b-f479-0a2a450c0019-286bd134b87d-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 23:47:56 +0200
Received: from BN0PR04CA0202.namprd04.prod.outlook.com (2603:10b6:408:e9::27)
 by BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 19 Oct
 2026 21:47:41 +0000
Received: from BN3PEPF00022BD5.namprd03.prod.outlook.com
 (2603:10b6:408:e9:cafe::88) by BN0PR04CA0202.outlook.office365.com
 (2603:10b6:408:e9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 21:47:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF00022BD5.mail.protection.outlook.com (10.167.248.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 21:47:41 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 16:47:40 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 16:47:40 -0500
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
 b=P3rxjNSxJt4ndtHlFCBO2jlSVnOrKGEhq9zfS8nNnbIHAZoGGKeQyTlFKR7VsQoGk87lH+hoAu7p2zlUXcy6ZCCH8SqDNLBvp5/Q+IF6Ql5mePL9OqhStMO6BSzTyvrj4uYO76Xax/mtSrdDjdF0xBWipVdn785R1WbVWlOyWpLzID0rOQIQ8rzzTAtX8S8lGTYvOSa/r36GNnOgKLIyPS9XPfsVWzeUaK0nBgp50jMuWWCNkQCdUJ/bLxYyJDdB+v6s2E1Zy9j+LwDBq5FBJq+0iG+kpUALi5HpaWJCf19Tavg57uNQtiy+uHMLGp2ML5vPn3MHc129bLvE5lmjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX2UBRevsA/zouKWM+YlnctUNNtq/lYu8jwMIdf1MKQ=;
 b=etNHnl9S3QhMto1GMzpL4YkoRU8Z+WN+9ClOO3V4C0ChiaqM3naFYK8Kno0cQRaBiV7ffjEygkdViFBo0Mj9htnIL72NWMPABy5Rmo3MnP+/46kTyLh4X6ByerFSTkm5MpNYIq/rnoLhIAx/PEAj97WFDATv37sPPq5vmBd/+yIo/vmFNwq8Ox20Bt176Avt5s/J4eDbOcnLy3qaQSF4wScRmSH6kGpFm0Au5Z1x0HYkkzjm/ytlSvtFFIlAkWnbsd6GwXkk9QJ2FE5PvCVbyTMZeZpOeVjWo6hjn2oyJ2PO00enVG+ZKq6BEBMbGKlaxbcRQ+AG1VoXVlnwnGtt2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MX2UBRevsA/zouKWM+YlnctUNNtq/lYu8jwMIdf1MKQ=;
 b=AJEwFedZFJa5fOXw1oAfJgU1pQ2zokqUQvbxJ2Vr03TLsnFX0+IirrF1asOY30mDrycS1KMtzdRBv5CBpLfLmLCEFCjr2zZ6falNJJueNrCx63I/3h4lEXKGMWccxt4Q/CzA+i7AwcGVeeWV2DOGjwt0TR6+HS0MqyuERjWWrsA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <25df5d8d-7cd3-4344-86e1-8af883fa9a65@amd.com>
Date: Mon, 19 Oct 2026 17:47:37 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jason Andryuk <jason.andryuk@amd.com>
Subject: Re: [PATCH v4 4/5] vpci: add SR-IOV support for PVH Dom0
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
Content-Language: en-US
In-Reply-To: <103b10d012cc291906025045a2da1ce728f0bffd.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD5:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: f1684f83-ca22-4d09-6115-08df2e2a99df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|23010399003|36860700016|82310400026|376014|1800799024|260925022911599003|6133799003|10067099003|22082099003|260925021311599003|18002099003|56012099006|4143699003|260925021911599003|261009223027099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	oHNtx76ILQMKJkS8xcgXTRwuedu6JG34BJaXm/l3lC7ngcyPjwa7QJr6SB0jOxrpAPvMoAd39FxKg6HHoPaVjpBQM4BpsvFvOVFdkZYN6UqIFA3YuVfl5AmFDkGDn72WzFl3InUecxIX+deiN72DddTRDr3/tl/jedBQ2dj2lzLaWdIPsLhjQ7bd5VCM2C9rUdDGCsV5Nv6EXKkOirxTlI6J4AhVfSIJoOhag7HrFhPNI1f/4YTDNdvbJjaOgDn4XDw9Hd0ij8TzCk56ejiWyBVWttEm2KUawZ2rdRLFoBKwmgiLr2wNJ6f/Yj3F1iH7WTkoI4nEw6Thdw1k94HLR505J+cAxuN3lKm1Se8kbwP7NiasQvb7gy2M4Qd64ib1wTlh6WG8v5za8Pd8NFgLshrIEffGC5Z6cZNXuIK78CO/TT7W8RqWud4zy5oomiS1T5NLHJYTVKffHzPF2m1RrBzzAelhaTcO0pRcQVWBaKIWWYuY7jnH52QAJTRcqO+mW1XgfOpXYQXlb6FBlkEA4I+KhyIJsU8cRU8SriXnnyRWanlUulhooYTp+PbGwBzTN7df574WcFyFTZDNybH42focLuHuHPfmwzOmSrSAdTjSaO+NjmeakMr6o5u7a/Jds2YcCTdlwtu7N55rovRYILTZ2o9/ZAUTkIB9byvwDV0HBd3g0pWLfXaoKuboE7+R+uqUzsTFCFc50tDiHBwvCA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(260925022911599003)(6133799003)(10067099003)(22082099003)(260925021311599003)(18002099003)(56012099006)(4143699003)(260925021911599003)(261009223027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2nkeBcBmmKrp1tZgujGUaQou5CyZHNvHdfPp4iVjcUu8+QyT8nLaZqgDFiF062I3V87oa0yfiYNSZLb4po4z/7aJjSnLILLfKFmQSm401o69Bf6bSSF/24x5PH1nRxuduQYqbboQZ7ws5u7g567h/VQ1dXBOAxK2NzIxgsKTPvyULlr50UTTRT1+sceuOFy2EcLUzisIEfvNma9ko6SPQRy3lzckzDTsAk2g3G1dvDVOUTHbqn4X7onrwuEgKQLFgQmjOdDvpxYKyEKU2BppNKUswxCbVpmQUw3VZaytrsdCiVDJa+p5F1QYxPBdq2ai/iGOQ+MtVuc6q89qt4/vCZD9f+t9QhuEAyp8QOupO0NI+MkuqH2c3iTVHvQ7tA03r2TamaGBoXw7zL6pfyjzMGqj+2LMHd86eDgUZuABcLrkPgY8OUGkTcSJCTpeXKNL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 21:47:41.4525
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1684f83-ca22-4d09-6115-08df2e2a99df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
X-purgate-ID: tlsNG-d25034/1792446477-034D7A5B-7784499B/0/0
X-purgate-type: clean
X-purgate-size: 15213
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-15 10:08, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> This code is expected to only be used by privileged domains,
> unprivileged domains should not get access to the SR-IOV capability.
> 
> Implement a write handler for the SR-IOV control register, so Xen can
> discover the VFs a PF enables and map their BARs. VF BARs live in the
> PF's capability and are re-sized on every VF Enable, as the System Page
> Size register can change them. They decode only while both VF Enable
> and VF MSE are set.
> 
> Xen adds the VFs itself: on VF Enable their routing IDs are recorded
> and config space accesses to them terminated for 100ms, as the spec
> permits; the first access past that adds the VF. Clearing VF Enable
> removes them again.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>


> +/*
> + * Marking is serialised by the hardware domain's pci_lock, which the SR-IOV
> + * control register write handler holds; unmarking only clears a bit.

Maybe add an ASSERT()?

> + */
> +int pci_vf_setup_begin(pci_sbdf_t sbdf)
> +{
> +    struct pci_seg *pseg = get_pseg(sbdf.seg);
> +
> +    if ( !pseg )
> +        return -ENODEV;
> +
> +    if ( !pseg->vf_setup_map )
> +    {
> +        unsigned int nr = PCI_BDF(-1, -1, -1) + 1;
> +
> +        pseg->vf_setup_map = xvzalloc_array(unsigned long, BITS_TO_LONGS(nr));
> +        if ( !pseg->vf_setup_map )
> +            return -ENOMEM;
> +    }
> +
> +    set_bit(sbdf.bdf, pseg->vf_setup_map);
> +
> +    return 0;
> +}

> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 5695c300f7..7c0277a7e4 100644
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -26,15 +26,15 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>           if ( copy_from_guest(&add, arg, 1) != 0 )
>               break;
>   
> -        pdev_info.is_extfn = (add.flags & XEN_PCI_DEV_EXTFN);
> +        /*
> +         * Virtual functions are always discovered by the hypervisor, so
> +         * they don't need to be added here.

Does a PV dom0 still need this path?  vPCI won't be used in that case.

> +         */
>           if ( add.flags & XEN_PCI_DEV_VIRTFN )
> -        {
> -            pdev_info.is_virtfn = true;
> -            pdev_info.physfn.bus = add.physfn.bus;
> -            pdev_info.physfn.devfn = add.physfn.devfn;
> -        }
> -        else
> -            pdev_info.is_virtfn = false;
> +            return 0;
> +
> +        pdev_info.is_extfn = (add.flags & XEN_PCI_DEV_EXTFN);
> +        pdev_info.is_virtfn = false;
>   
>   #ifdef CONFIG_NUMA
>           if ( add.flags & XEN_PCI_DEV_PXM )

> diff --git a/xen/drivers/vpci/sriov.c b/xen/drivers/vpci/sriov.c
> new file mode 100644
> index 0000000000..4e09bdfbfd
> --- /dev/null
> +++ b/xen/drivers/vpci/sriov.c
> @@ -0,0 +1,507 @@

> +static int vf_init_bars(struct pci_dev *vf_pdev)
> +{
> +    int vf_idx;
> +    unsigned int i;
> +    const struct pci_dev *pf_pdev = vf_pdev->pf_pdev;
> +    struct vpci_bar *bars = vf_pdev->vpci->header.bars;
> +    struct vpci_bar *physfn_vf_bars = pf_pdev->vpci->sriov->vf_bars;
> +    struct vpci_sriov *sriov = pf_pdev->vpci->sriov;
> +
> +    vf_idx = vf_pdev->sbdf.sbdf - (pf_pdev->sbdf.sbdf + sriov->offset);
> +    if ( vf_idx < 0 )
> +        return -EINVAL;
> +
> +    if ( sriov->num_vfs > 1 && !sriov->stride )
> +        return -EINVAL;
> +
> +    if ( sriov->stride )
> +    {
> +        if ( vf_idx % sriov->stride )
> +            return -EINVAL;
> +        vf_idx /= sriov->stride;
> +    }
> +
> +    if ( vf_idx >= sriov->num_vfs )
> +        return -EINVAL;
> +
> +    /*
> +     * Set up BARs for this VF out of PF's VF BARs taking into account
> +     * the index of the VF.
> +     */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i++ )
> +    {
> +        struct vpci_bar *pf_bar = &physfn_vf_bars[i];

Maybe just remove physfn_vf_bars since it is only used once?

> +        struct vpci_bar *bar = &bars[i];
> +
> +        /*
> +         * The upper half of a 64-bit BAR holds no address or size of its own;
> +         * the handlers reach the lower half through its type alone.
> +         */
> +        if ( pf_bar->type == VPCI_BAR_MEM64_HI )
> +        {
> +            bar->type = VPCI_BAR_MEM64_HI;
> +            continue;
> +        }
> +
> +        if ( pf_bar->type != VPCI_BAR_MEM32 &&
> +             pf_bar->type != VPCI_BAR_MEM64_LO )
> +            continue;
> +
> +        bar->addr         = pf_bar->addr + vf_idx * pf_bar->size;
AIUI, the PF has the SR-IOV BARs, which are sized like normal.  But I 
thought the pf_bar->size needs to be reduced by some factor to get the 
per-VF size.  I can't find where that is done.  Or am I wrong about this?

> +        bar->guest_addr   = is_hardware_domain(vf_pdev->domain) ? bar->addr : 0;
> +        bar->size         = pf_bar->size;
> +        bar->type         = pf_bar->type;
> +        bar->prefetchable = pf_bar->prefetchable;
> +    }
> +
> +    return 0;
> +}

> +static int map_vfs(const struct pci_dev *pf_pdev, uint16_t cmd)
> +{
> +    struct pci_dev *vf_pdev;
> +    int rc;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +
> +    list_for_each_entry(vf_pdev, &pf_pdev->vf_list, vf_list)
> +    {
> +        /* Don't try to change mapping if it is already in the correct state. */
> +        if ( vf_pdev->vpci->header.bars_mapped == !!cmd )
> +            continue;
> +
> +        rc = vpci_modify_bars(vf_pdev, cmd, false);
> +        if ( rc )
> +        {
> +            gprintk(XENLOG_ERR, "failed to %s VF %pp: %d\n",
> +                    (cmd & PCI_COMMAND_MEMORY) ? "map" : "unmap",
> +                    &vf_pdev->sbdf, rc);
> +            return rc;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +static void size_vf_bars(const struct pci_dev *pf_pdev, unsigned int sriov_pos,
> +                         uint64_t *vf_rlen)
> +{
> +    struct vpci_bar *bars = pf_pdev->vpci->sriov->vf_bars;
> +    unsigned int i;
> +    int rc = 0;
> +
> +    ASSERT(rw_is_write_locked(&pf_pdev->domain->pci_lock));
> +    ASSERT(!pf_pdev->info.is_virtfn);
> +    ASSERT(pf_pdev->vpci->sriov);

AIUI, because sriov was already dereferenced above, this can be dropped 
by the compiler.  At least if (!pf_pdev->vpci->sriov) can be dropped.

> +
> +    /* Set the BARs addresses and size. */
> +    for ( i = 0; i < PCI_SRIOV_NUM_BARS; i += rc )
> +    {
> +        unsigned int idx = sriov_pos + PCI_SRIOV_BAR + i * 4;
> +        uint32_t bar;
> +        uint64_t addr, size;
> +
> +        bar = pci_conf_read32(pf_pdev->sbdf, idx);
> +
> +        rc = pci_size_mem_bar(pf_pdev->sbdf, idx, &addr, &size,
> +                              PCI_BAR_VF |
> +                              ((i == PCI_SRIOV_NUM_BARS - 1) ? PCI_BAR_LAST
> +                                                             : 0));
> +
> +        /*
> +         * Update vf_rlen on the PF. According to the spec the size of
> +         * the BARs can change if the system page size register is
> +         * modified, so always update rlen when enabling VFs.
> +         */
> +        vf_rlen[i] = size;
> +
> +        if ( !size )
> +        {
> +            bars[i].type = VPCI_BAR_EMPTY;
> +            continue;
> +        }
> +
> +        bars[i].addr = addr;
> +        bars[i].guest_addr = addr;
> +        bars[i].size = size;
> +        bars[i].prefetchable = bar & PCI_BASE_ADDRESS_MEM_PREFETCH;
> +
> +        switch ( rc )
> +        {
> +        case 1:
> +            bars[i].type = VPCI_BAR_MEM32;
> +            break;
> +
> +        case 2:
> +            bars[i].type = VPCI_BAR_MEM64_LO;
> +            bars[i + 1].type = VPCI_BAR_MEM64_HI;
> +            break;
> +
> +        default:
> +            ASSERT_UNREACHABLE();
> +            rc = 1;
> +        }
> +    }
> +}


> +static int cf_check init_sriov(struct pci_dev *pdev)
> +{
> +    unsigned int pos;
> +
> +    if ( pdev->info.is_virtfn )
> +        return -EINVAL;
> +
> +    pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +
> +    ASSERT(pos);
> +
> +    if ( xsm_resource_setup_pci(XSM_PRIV, pdev->sbdf.bdf) )

This is a little misleading.  During boot, current is Xen - d[IDLE]. 
With my XSM_HW_PRIV patches, I failed this check since Xen is not the 
hardware domain.

It seems to me the point of this check is to only expose the SR-IOV 
capability to a suitable domain.  If the PF is assigned to a domU - then 
don't show the SR-IOV capability.

SR-IOV and its BARs is more of a hardware domain responsibility, so I 
think this should just be an is_hardware_domain() check.  And I think it 
should be based on pdev->domain and not current.  On the cleanup side, 
this is already checking is_hardware_domain(pdev->domain).

> +    {
> +        printk(XENLOG_ERR
> +               "%pp: SR-IOV configuration unsupported for unpriv %pd\n",
> +               &pdev->sbdf, pdev->domain);
> +        return -EACCES;
> +    }
> +
> +    pdev->vpci->sriov = xvzalloc(struct vpci_sriov);
> +    if ( !pdev->vpci->sriov )
> +        return -ENOMEM;
> +
> +    pdev->vpci->sriov->pos = pos;
> +
> +    /*
> +     * We need to modify vf_rlen in control_write but we can't do it cleanly
> +     * from pdev because write callback only accepts const pdev. Moving vf_rlen
> +     * inside of struct vpci_sriov is also not possible because it is used
> +     * before vpci init. So pass it here as additional data to not require
> +     * dropping const in control_write.
> +     */
> +    return vpci_add_register(pdev->vpci, vpci_hw_read16, control_write,
> +                             pos + PCI_SRIOV_CTRL, 2, &pdev->physfn.vf_rlen);
> +}
> +
> +static int cf_check cleanup_sriov(const struct pci_dev *pdev, bool hide)
> +{
> +    unsigned int pos;
> +    int rc;
> +
> +    if ( !pdev->vpci->sriov )
> +        return 0;
> +
> +    ASSERT(!pdev->info.is_virtfn);
> +
> +    unmark_vfs(pdev);
> +
> +    if ( !list_empty(&pdev->vf_list) )
> +    {
> +        struct pci_dev *vf_pdev, *temp;
> +
> +        printk(XENLOG_WARNING

Thunderbird stripped it from my reply, but there is trailing space above.

> +               "Attempting to remove SR-IOV PF %pp with VFs still present, VFs will be forcefully removed first\n",
> +               &pdev->sbdf);
> +
> +        map_vfs(pdev, 0);
> +        list_for_each_entry_safe_reverse(vf_pdev, temp, &pdev->vf_list, vf_list)
> +        {
> +            pci_remove_device(vf_pdev->sbdf.seg, vf_pdev->sbdf.bus,
> +                              vf_pdev->sbdf.devfn);
> +        }
> +    }
> +
> +    pos = pdev->vpci->sriov->pos;
> +    if ( !hide )
> +    {
> +        XVFREE(pdev->vpci->sriov);
> +        return 0;
> +    }
> +
> +    rc = vpci_remove_registers(pdev->vpci, pos + PCI_SRIOV_CTRL, 2);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%pd %pp: fail to remove SRIOV handlers rc=%d\n",
> +                pdev->domain, &pdev->sbdf, rc);
> +        ASSERT_UNREACHABLE();
> +        return rc;
> +    }
> +    XVFREE(pdev->vpci->sriov);
> +
> +    /*
> +     * Unprivileged domains have a deny by default register access policy, no
> +     * need to add any further handlers for them.
> +     */
> +    if ( !is_hardware_domain(pdev->domain) )

This is the counterpart to the earlier XSM check.

> +        return 0;
> +
> +    rc = vpci_add_register(pdev->vpci, vpci_hw_read16, NULL,
> +                           pos + PCI_SRIOV_CTRL, 2, NULL);
> +    if ( rc )
> +        printk(XENLOG_ERR "%pd %pp: fail to add SRIOV ctrl handler rc=%d\n",
> +               pdev->domain, &pdev->sbdf, rc);
> +
> +    return rc;
> +}
> +
> +REGISTER_VPCI_EXTCAP(SRIOV, init_sriov, cleanup_sriov);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index 9a422f9ea0..767fe5c6c9 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c

> @@ -486,6 +487,11 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
>           return data;
>       }
>   
> +    /* Ahead of any lock being taken, as adding a device acquires them. */
> +    if ( unlikely(is_hardware_domain(d) && pci_vf_setup_pending(sbdf)) &&

unlikely() here breaks the tests build.  Add
     #define unlikely
to tools/tests/vpci/emul.h

> +         !vpci_sriov_add_vf(sbdf) )
> +        return data & (0xffffffffU >> (32 - 8 * size));
> +
>       /*
>        * Find the PCI dev matching the address, which for hwdom also requires
>        * consulting DomXEN.  Passthrough everything that's not trapped.
> @@ -607,6 +613,11 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>           return;
>       }
>   
> +    /* Ahead of any lock being taken, as adding a device acquires them. */
> +    if ( unlikely(is_hardware_domain(d) && pci_vf_setup_pending(sbdf)) &&
> +         !vpci_sriov_add_vf(sbdf) )
> +        return;
> +
>       /*
>        * Find the PCI dev matching the address, which for hwdom also requires
>        * consulting DomXEN.  Passthrough everything that's not trapped.
> @@ -680,6 +691,9 @@ void vpci_write(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
>           /* Tailing gap, write the remaining. */
>           vpci_write_hw(sbdf, reg + data_offset, size - data_offset,
>                         data >> (data_offset * 8));
> +
> +    /* Only once every lock has been released, as removal acquires them. */
> +    vpci_sriov_drop_vfs();

Hooking every vpci_write() for this seems a little unfortunate.  Could 
it be hooked into the vpci softirq?

>   }
>   
>   /* Helper function to check an access size and alignment on vpci space. */

> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 26aa120583..eead9487d0 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h

> @@ -145,6 +145,22 @@ struct vpci {
>           unsigned int nbars:3;
>       } rebar;
>   
> +    struct vpci_sriov {
> +        /* PF only */
> +        struct vpci_bar vf_bars[PCI_SRIOV_NUM_BARS];
> +        /*
> +         * When the VFs which are enabled but not added to Xen yet are
> +         * guaranteed to respond to config space accesses.  Zero if there are
> +         * none.
> +         */
> +        s_time_t vfs_ready;
> +        /* Routing ID offset of the first VF, and stride between VFs. */
> +        uint16_t offset;
> +        uint16_t stride;
> +        uint16_t num_vfs;
> +        unsigned int pos;

unsigned int before uint16_t packs the structure a little better.

Thanks,
Jason

