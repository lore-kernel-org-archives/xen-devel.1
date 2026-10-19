Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAB3606A319
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=vgYZS1h7
Received: from list by lists.xenproject.org with outflank-mailman.1454826.1668355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItOi-00034a-G2; Mon, 19 Oct 2026 19:51:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454826.1668355; Mon, 19 Oct 2026 19:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xItOi-00034T-Cy; Mon, 19 Oct 2026 19:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1454826;
 Mon, 19 Oct 2026 19:51:51 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xItOh-00034N-8U
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:51:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xItOg-00FSEh-Lh
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:51:50 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad674c3-2eae-0a2a0a5409dd-0a2a450bcb8e-22
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:51:50 +0200
Received: from [52.101.53.3]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ad674d3-b7e8-0a2a450b0019-34653503c71d-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:51:49 +0200
Received: from BL1PR13CA0356.namprd13.prod.outlook.com (2603:10b6:208:2c6::31)
 by CY8PR12MB7290.namprd12.prod.outlook.com (2603:10b6:930:55::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 19:51:44 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::87) by BL1PR13CA0356.outlook.office365.com
 (2603:10b6:208:2c6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.6 via Frontend Transport; Mon, 19
 Oct 2026 19:51:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 19 Oct 2026 19:51:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 14:51:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 14:51:41 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 14:51:40 -0500
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
 b=e+QybuNnvA7vFq5hn6kFzny7AIhJbyh8g2qfnQYcz7k1Hs7Ne75zcuOc160PPTFYk764hdadbIrit6RDuZ3ZPHXIrTQxwF9DGOBh4whn3gM8RPg6PZm61y86knJdgc4nIZZUtPIMw1HQPglUs6maUb3N92zBJFgoJyw1bhAF2PD+FLLczfd9aeVAJkSeLB3OcYesXosclYqOXhOxm5TcJEeHmR7AUBB8AWebjDj0J5dZ6K8NuDO/prQjIlt+XAT4ivFdXyRbqKa0y/Hi5syAB1USavETYiEXXzCsfSSqcLGXG00zLYMnc9H5FCW6HHMgruabp7cDAn0TGty0+uvP/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IOwPRT727iWCjqizbYfYhkYIQvduRkr7SUFrRvv/88=;
 b=y/zEPdbqPG845sc0hgSdU38WX41VRU6pkc6WRm8GOVx+/lVi0IXn8ajfN6fjvKqE8vdaZXKLQK4K8FWvYe39J5N2LqhDjK+SGXxivqLlik3kQBznyrEU7f/ZNtzuCCxcSWbm+AudD3LVw8eNFqHBN0t/waOznxzni/CnJKmWPI8Qi8T/p0KV78tluYjtJqCSIFhFOkm98v9Bf91RTTF5G88Xk0aLKcTsndD2kBPTtWOhvoR+So2vSI1GSh0Ctw7eNZ0e4bCwLVDJGZSMcHm+0ZyS7SchLBLAbnks7pwIZTgIztsfiApi8712a4FjKC+aCLZLY/v2odVzzjV2A43q6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+IOwPRT727iWCjqizbYfYhkYIQvduRkr7SUFrRvv/88=;
 b=vgYZS1h74ptYPB1au5+zCseu6vk4VsY+vDGRAnIfh47bz/7SkKs+SQoYWm1EUEFB/YB4XrTigmjuWPsgN0eBRJBA/c0MhIAHjXW0Qv4SUHW3JAEJPTkVGKH9c2eKL7Rec+D1g3axiVEISTsm+syfD2ms3DgOlFNXsSQokI6iu+k=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <df690201-b95e-4029-9bc0-01069561f893@amd.com>
Date: Mon, 19 Oct 2026 15:46:32 -0400
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] vpci: allow queueing of mapping operations
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1792072426.git.mykyta_poturai@epam.com>
 <14cc4abdcf4c3c3d9a620cf4df3ec87e7b11bd13.1792072426.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <14cc4abdcf4c3c3d9a620cf4df3ec87e7b11bd13.1792072426.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|CY8PR12MB7290:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a9e132-6798-4e4b-a815-08df2e1a66ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Q+PXlVX4mQ60OODVp2Ec//9Ia5lKnD7MOn8hEVVKk6ElJLhJ7GMQ5prpZ3LEdX98j+++sTtG75BRBvFBghJrSgf6uNWVZfeV3JcEbo5QRmztzbpyhusHtK/rEwZ0JTwhH4hDWvjzqMTOciCHlrBJmgQW1P3M7LOTF9w7L0mvht5b3HFS3WmtxkYULHoH0MEpvKaBHajfEVAHY0sSUzQXVJTw10AVAYV/eDvioT5AaqyG1GSOwNjIESuxMJC7CEFXbtgiJ2h8u8mmlx7Rtj4MdixCkB5C08/CRmUwobB926uEVFbawDPgeGBaNbO39fm0afl1/KtDOYqiPi9GZodg2iD5IqCGegPAbwKgqrCkDBptT9hE9iBXczjXaNZKGtuMkAcwih6eTeKJZns08clJo9Madn/mK9W+M7cNoPLQzTRHcuQzPMD7lN5k7ldEjcETh53l1onr8cKaII3wI1UXEvWR3+59xV7qEeSNHUuY0CcgcEScv8jrLat9n3v/rFiFQoEcdN7u+5ZNCG+U4os4ZWOzFiboO8iO/TG+HzxvNwjcUTfbpB+ZOqbzdI6lnEDNv7zC2/vC7zttn8y75eF9VynF8lSb56Cs+O1eyKYxG2yzR5Yk+29AiqCMpjfdymQB9kgig54Wnwy6gnfUlJQ0bbexqSlLlIjANBizUqbJDWAkmF+4HSjdfUXg1Kn4uaTlHQKysbTaGGxVeg/4SDNNIQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	v95Dl1cQo5BYfDmhs8p93GdIUdizF2oQdO63HRgRhFpfcq3DAa/LXDOCJtpClO5KzqHpTJ0Eec2DuHT62pSaXOj201ugx7VuU5tkYdJZSMeQ4k9+HrKfvJniEdhGY1D7/1tgzBljww60g7MCOcSt0Yb2qovDddPvXeHHfSv+HwCblZE7GaRmsf15lyiSrCPXNcXBs7dD87WIjxvsORrhN3rrWgFKrha2dLxuSk3Emffq2U07Xg5EoBUeRq3z6XHPEOVO2SYon4zbbt+fiRlE62fSfMMgKM4y0yj92cRZWVJ1XI8yzWrexlBxwW1/ilO93AV94VczVRqu68eeZsgZ6cUyl6bOsHhNX+wQUyZfrggiVEcOA/8fPrWjlA5Z2bjrqkv85BJTKKQnYg8hA4C6EWfM0Fw8DJvAp3cd725F9eCLQmAt3U084U1OdVpD/kMC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 19:51:43.8312
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a9e132-6798-4e4b-a815-08df2e1a66ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7290
X-purgate-ID: tlsNG-42698a/1792439510-AA8D99EA-E2100490/0/0
X-purgate-type: clean
X-purgate-size: 4982
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
> Introduce vPCI BAR mapping task queue. Store information needed to
> map/unmap BARs in struct vpci_map_task. Allow queueing of BAR map/unmap
> operations in a list, thus making it possible to perform multiple p2m
> operations associated with single PCI config space register access.
> 
> The rangesets describing the ranges to be (un)mapped move from struct
> vpci_bar into the task. They are only live for the duration of the
> operation, and a single per-device set cannot describe more than one

"per-device rangeset"?

> queued operation. Allocate them along with the task and free them once
> the task has been processed.
> 
> This is preparatory work for further changes that need to perform
> multiple unmap/map operations before returning to guest.
> 
> At the moment, only a single operation will be queued. However, when
> multiple operations are queued, there is a check in modify_bars() to
> skip BARs already in the requested state that will no longer be
> accurate. Remove this check in preparation of upcoming changes.
> 
> Amends: 622bdd962822 ("vpci/header: handle p2m range sets per BAR")
> Message-ID: <20260406191203.97662-3-stewart.hildebrand@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

> @@ -280,12 +321,48 @@ static int __init apply_map(struct domain *d, const struct pci_dev *pdev,

> -static void defer_map(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
> +static struct vpci_map_task *alloc_map_task(const struct pci_dev *pdev,
> +                                            uint16_t cmd, bool rom_only)
> +{
> +    struct vpci_map_task *task;
> +    unsigned int i;
> +
> +    task = xvzalloc(struct vpci_map_task);
> +

Nit: No newline needed here.

> +    if ( !task )
> +        return NULL;
> +
> +    for ( i = 0; i < ARRAY_SIZE(task->bars); i++ )
> +    {
> +        if ( !MAPPABLE_BAR(&pdev->vpci->header.bars[i]) )
> +            continue;
> +
> +        task->bars[i].mem = rangeset_new(pdev->domain, NULL,
> +                                         RANGESETF_no_print);
> +

Nit: Extra newline.

> +        if ( !task->bars[i].mem )
> +        {
> +            destroy_map_task(task);
> +            return NULL;
> +        }
> +
> +        task->bars[i].addr = pdev->vpci->header.bars[i].addr;
> +        task->bars[i].guest_addr = pdev->vpci->header.bars[i].guest_addr;
> +    }
> +
> +    task->cmd = cmd;
> +    task->rom_only = rom_only;
> +    task->pdev = pdev;
> +
> +    return task;
> +}
> +
> +static void defer_map(struct vpci_map_task *task)
>   {
>       struct vcpu *curr = current;
>   

> @@ -312,11 +388,17 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>       struct pci_dev *tmp;
>       const struct domain *d;
>       const struct vpci_msix *msix = pdev->vpci->msix;
> +    struct vpci_map_task *task;
>       unsigned int i, j;
>       int rc;
>   
>       ASSERT(rw_is_write_locked(&pdev->domain->pci_lock));
>   
> +    task = alloc_map_task(pdev, cmd, rom_only);
> +

Nit: Extra newline

> +    if ( !task )
> +        return -ENOMEM;
> +
>       /*
>        * Create a rangeset per BAR that represents the current device memory
>        * region and compare it against all the currently active BAR memory

> @@ -343,9 +425,7 @@ int vpci_modify_bars(const struct pci_dev *pdev, uint16_t cmd, bool rom_only)
>   
>           if ( !MAPPABLE_BAR(bar) ||
>                (rom_only ? bar->type != VPCI_BAR_ROM
> -                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) ||
> -             /* Skip BARs already in the requested state. */
> -             bar->enabled == !!(cmd & PCI_COMMAND_MEMORY) )

This is the removed check mentioned in the commit message?  And the 
reason is that a queue of operation 1 unmap, operation 2 map needs to be 
processed sequentially, but cmd won't be changing?

> +                       : (bar->type == VPCI_BAR_ROM && !header->rom_enabled)) )
>               continue;
>   
>           if ( !pci_check_bar(pdev, _mfn(start), _mfn(end)) )

> @@ -152,14 +153,24 @@ struct vpci {
>   #endif
>   };
>   
> -struct vpci_vcpu {
> +#ifdef __XEN__
> +struct vpci_map_task {
>       /* Per-vcpu structure to store state while {un}mapping of PCI BARs. */
> -    const struct pci_dev *pdev;
> +    struct list_head next;
> +    struct vpci_bar_map {
> +        uint64_t addr;
> +        uint64_t guest_addr;
> +        struct rangeset *mem;
> +    } bars[ARRAY_SIZE(((struct vpci_header *)NULL)->bars)];
>       uint16_t cmd;
>       bool rom_only : 1;
> +    const struct pci_dev *pdev;

Is there a reason to move this pointer?  You introduce a hole in the 
structure before it.

Thanks,
Jason

