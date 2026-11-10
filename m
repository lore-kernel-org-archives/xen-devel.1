Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F44606A321
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 14:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RdbK5LS/
Received: from list by lists.xenproject.org with outflank-mailman.1481894.1685786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmr3-0006JC-JO; Tue, 10 Nov 2026 14:29:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481894.1685786; Tue, 10 Nov 2026 14:29:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQmr3-0006J5-Gc; Tue, 10 Nov 2026 14:29:45 +0000
Received: by outflank-mailman (input) for mailman id 1481894;
 Tue, 10 Nov 2026 14:29:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xQmr1-0006In-JV
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 14:29:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQmr1-006T8z-08
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:29:43 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af32a46-2eae-0a2a0a5409dd-0a2a450c9d48-38
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:29:42 +0100
Received: from [52.101.62.62]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6af32a54-f479-0a2a450c0019-34653e3ea15b-3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 15:29:42 +0100
Received: from DS7P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::6) by
 CH0PR12MB8488.namprd12.prod.outlook.com (2603:10b6:610:18d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 14:27:20 +0000
Received: from BN1PEPF00018549.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::4) by DS7P220CA0014.outlook.office365.com
 (2603:10b6:8:223::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 14:27:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00018549.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 14:27:20 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 08:27:19 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Tue, 10 Nov 2026 08:27:19 -0600
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
 b=uDJpSrQiv53PXkZQ0sHSXBLzY1tqORc1Ra2iJyVF2CJsk9NI6gZiQpM5FxbFOD+wdlWoJJeXxFGfZR6BTT1LXI+RDjMzUKNwwYdFIKRX0lni4dkot/WM5jrINGB1Ix7FJLLQY5K7ecQTLxGhyUT7WUvlLP+vmuNVu5qudUVofQbDWcj7VtBchArHkFCkK76orU6wR/JC4LEFiDUgGxTiTxtixmCmAyjbvjj8OT7PtF12Jc8a5eLdxTaDC4ygZcv+zooEQuDhJdO2ylfYF6JW3dxGYu/zawvEIRZUlTrI9vWqkbMEjthob1E7Qh4aUicTYB0M0aFeRd63Z0pAsN2qrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quPG9Sq5MvpTcara0/p1JthR/s5Lk4XDxLq7gOIWmnI=;
 b=R+IF9jrqLUPnRHU6YKNR1DiT8FiHsHdNOc+grhsAEfEsyHyEmCJq7A/w87xQq88RXOWooeQ1GQgw40tdrZbcimf9hBNzs9CHGO+AYe3S7IOmomttm9PpGKBjqzktZIet3DRN8LUUVSfntDfmRmCrP3BppU6LvwOHXyApfv0doVr5adhqL/q0fFYiuOavyfBEyFK7nQRIiWPhldFVw5k9OOQWcw42tRerljeJLAmGi6BN7xsbY+rePhtBn2ltgKERu+BwJu0OFTKEaCJrp7zHwKsoHDEKZ9EfnwNcVed0vzPbmxSPQwtlkYtpV8ayAeymPxyWZyi7+vuCTA3YO3NlKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=cyberperseus.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quPG9Sq5MvpTcara0/p1JthR/s5Lk4XDxLq7gOIWmnI=;
 b=RdbK5LS/jIIfw4axCr9vFdgcf3wK1IVmStTT8vHlINhz1GXIiCfRlxorOL9VRSw7L+ZQfFtcpT6wXqInooY6Kw0Hc4p9jaoQL9KajT4IQ9lVTOYFNxi/rGezkdjY/iXxoogmjIZOh99zGNONUemoNc/gp/rgxixoAaAEGUy6TBU=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <aa7eb7ea-faed-4772-a29f-47f12bd57c09@amd.com>
Date: Tue, 10 Nov 2026 15:27:18 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/device-tree: Experimental support for TI K3
 custom interrupt properties
To: =?UTF-8?B?7KCV7ISd7Jqp?= <jed@cyberperseus.com>,
	<xen-devel@lists.xenproject.org>
References: <gab279844341.0.1792481113640@cyberperseus.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <gab279844341.0.1792481113640@cyberperseus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018549:EE_|CH0PR12MB8488:EE_
X-MS-Office365-Filtering-Correlation-Id: 1159a246-9a29-4b7a-a184-08df3f36baac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|56012099006|11063799006|18002099003|22082099003|6133799003|10067099003|261009223027099003|261102123227099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003|261022115727099003|261022105027099003|261022075727099003|261028144727099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	da2aaIh/Am3AX0/ox4irpuJQ7h84NZHRcllZER+GY+Uj97MTgZM1BKyHK5pPO17Ac486qndoRHmigMY/gwkw0yuoB2LbI191CU/MCiNzfbwYOSc4c4TLib+p0wuEXcZImEc4bDcph+x0w1JJ+JMokNNd2QaJ6et0SZxZS4n5ThiKDVUUF+pzCebVVt/9tOCzCvADSbCA8p/+A4M/e+a2lf3e9VBYjuYQemNVhALYt9rELrilRkA853IcPe6dvKwluntIZoCG4pd/bQvgqH+XZp9z4jRimG7OlVhh0Q7iR9Qsv3l9SSMmOGC/bwdyyuVPI6TgG3LTNvGOIPPTxWCnt4kQ+cCkg2HYtddmv8/cba6lvlomM3FQTxOvh+lnbjorpEPLaUzIDbDokkhlemaySM6B/ulV8/W8RMpebFtRy5DvsUDYWShKTmEHoTHb8/YmzPko9sZVowe5cWxQ6GV5s/Y4hgZ/Wd7CMlKPxabUfFoWH7Er5P4RmEuug4U4nzQSvIVdUcMxpud8lx0T5zJavj5WcSEmStuHFQ7yvd8dkIltug08XoEMCIkHOVpzRHUe74i6pP0AWf8bcG8GAr3aU4lbTEPsgGUDd6WMlpKM5K8OPDIs7o6d+CjAHKguG0zFn4VHi5sVoU8zg5Ga3vpdG2y66ni/scVYqmIZnUftUeOmbPTdwF4hvT1mo8RI0gIDM+tA1F1Z5b0Xucgx59VQrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(56012099006)(11063799006)(18002099003)(22082099003)(6133799003)(10067099003)(261009223027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003)(261022115727099003)(261022105027099003)(261022075727099003)(261028144727099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zGejFXvMQvJpN0uPXdJbx37JqIMltxhrPLVB6PrbFMU8DE4xIKhsLhhSCVsEQgdiJC+op0twtnDQ9NpUSJfTuEIvG+pDUNy7LfLKw2e1ExPs487yYSqXHglD3vFA9488uxWA8/FEyTjbWJ8sMdAfx7nj4D8FQcviSOuBJAJdrlj+3n7RsDO0HnSDyc0o2ahHzPeecrWUNOZrZQzZHGvIGbf1ik+E1q7Msy0zuQMuj7UchF6I1XfxXS0Lcz8aOVzhLsHzsDFdqmdnBIslFTBT+P28moqSRXs9+HtTyeTmPLc+657GX06uyhv+n18Cq5DJ04kwyXip5qmeVLzp0I1hJd/RtY7C9t7cmQshuizgo06USD4cn6WJ6lFWvXlFk2BtB+LGSbSxkO8WUh+zknt1emUO3CUJlaYzz38JPOro5UYGmU2c+/RQ1i3HY9qmWPvR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 14:27:20.2106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1159a246-9a29-4b7a-a184-08df3f36baac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00018549.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8488
X-purgate-ID: tlsNG-d25034/1794320982-00CCBA5B-6C653E4F/0/0
X-purgate-type: clean
X-purgate-size: 5236
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 20-Oct-26 09:25, 정석용 wrote:
> Hello,
> 
> This RFC patch adds support for Texas Instruments (TI) K3 custom 
> interrupt properties ('ti,interrupt-ranges' and 'ti,intr-trigger-type') 
> in Xen's device tree parser.
> 
> On TI K3 platforms, certain devices use these custom properties instead 
> of the standard 'interrupts' property due to the TI-SCI interrupt router 
> architecture. Currently, Xen fails to parse these nodes, preventing 
> proper interrupt configuration for those devices.
> 
> To address this, the attached experimental patch extends 
> dt_number_of_irq() and dt_device_get_raw_irq() to parse 
> 'ti,interrupt-ranges' and calculate raw IRQs accordingly.
> 
> However, this implementation has several limitations and is far from ideal:
> 1. Vendor-specific properties are hardcoded into Xen's common 
>    device tree parser.
> 2. Manual index calculations and magic numbers are used rather than 
>    leveraging a proper abstraction layer.
> 
> We would greatly appreciate community feedback on the following points:
> - Is there a preferred way to handle vendor-specific interrupt 
>   bindings like this within Xen's DT framework?
> - Would it be better to refactor this logic into a separate 
>   architecture-specific or controller-specific layer, or is there 
>   an existing mechanism we missed?
> 
> Any advice, suggestions, or architectural guidance is welcome.
One way is to add a new platform like TI K3 for your boards (listing proper
compatibles) and implement a new platform hook for custom IRQ translation (e.g.
platform_irq_xlate()). AFAICT you don't need to implement other hooks like
.init, .smc, etc. because the platform functions should always check for the
hook being non-NULL. The platform gets registered provided there was a
successful compatible match. The new hook could take a dt node pointer to the
device node and to the interrupt parent (INTR in your case) and return a GIC SPI.

NIT: please use Xen coding style.
NIT: remember to use Signed-off-by for the submission

~Michal

> 
> Best regards,
> Jed
> 
> ---
>  xen/common/device-tree/device-tree.c | 64 ++++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
> index 0b5375f151..a084f03487 100644
> --- a/xen/common/device-tree/device-tree.c
> +++ b/xen/common/device-tree/device-tree.c
> @@ -1123,8 +1123,23 @@ unsigned int dt_number_of_irq(const struct dt_device_node *device)
>  
>      /* Get the interrupts property */
>      intspec = dt_get_property(device, "interrupts", &intlen);
> -    if ( intspec == NULL )
> -        return 0;
> +    if ( intspec == NULL ) {
> +        int i, retintnum = 0;
> +        intspec = dt_get_property(device, "ti,interrupt-ranges", &intlen);
> +        if(intspec == NULL) {
> +            return 0;
> +        }
> +        intlen /= sizeof(*intspec);
> +        dt_dprintk(" using 'ti,interrupt-ranges' property\n");
> +
> +        for( i = 2 ; i < intlen; i+=3){
> +            retintnum += be32_to_cpu(intspec[i]);
> +        }
> +        dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpu(*intspec), retintnum);
> +
> +        return retintnum;
> +    }
> +
>      intlen /= sizeof(*intspec);
>  
>      dt_dprintk(" using 'interrupts' property\n");
> @@ -1578,8 +1593,49 @@ int dt_device_get_raw_irq(const struct dt_device_node *device,
>  
>      /* Get the interrupts property */
>      intspec = dt_get_property(device, "interrupts", &intlen);
> -    if ( intspec == NULL )
> -        return -EINVAL;
> +    if ( intspec == NULL ){
> +        int i = 0, newidx = 0, curmax = 0, triggertype = 4;
> +        u32 typelen;
> +
> +        intspec = dt_get_property(device, "ti,interrupt-ranges", &intlen);
> +        if(intspec == NULL) {
> +            return -EINVAL;
> +        }
> +        intlen /= sizeof(*intspec);
> +        dt_dprintk(" using 'ti,interrupt-ranges' property\n");
> +        dt_dprintk(" intspec=%d intlen=%d\n", be32_to_cpu(*intspec), intlen);
> +
> +        p = dt_irq_find_parent(device);
> +        if ( p == NULL )
> +            return -EINVAL;
> +
> +        i = 0;
> +        newidx = index;
> +        curmax = be32_to_cpu(intspec[i + 2]);
> +        while(newidx >= curmax){
> +            newidx -= curmax;
> +
> +            i += 3;
> +            curmax = be32_to_cpu(intspec[i + 2]);
> +        }
> +
> +        tmp = dt_get_property(device, "ti,intr-trigger-type", &typelen);
> +        if(tmp != NULL) {
> +            dt_dprintk(" using 'ti,intr-trigger-type' property\n");
> +            dt_dprintk(" tmp=%d typelen=%d\n", be32_to_cpu(*tmp), typelen);
> +
> +            triggertype = be32_to_cpu(*tmp);
> +        }
> +
> +        out_irq->specifier[0] = 0;
> +        out_irq->specifier[1] = be32_to_cpu(intspec[i + 1]) + newidx - 32;
> +        out_irq->specifier[2] = triggertype;
> +        out_irq->size = 3;
> +        out_irq->controller = p;
> +
> +        return 0;
> +    }
> +
>      intlen /= sizeof(*intspec);
>  
>      dt_dprintk(" using 'interrupts' property\n");


