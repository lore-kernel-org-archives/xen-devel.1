Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EDDC531F9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 08:22:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369876.1618353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnBAf-0007NO-Pj; Fri, 24 Jul 2026 08:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369876.1618353; Fri, 24 Jul 2026 08:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnBAf-0007NH-N2; Fri, 24 Jul 2026 08:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1369876;
 Fri, 24 Jul 2026 08:22:17 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wnBAe-0007NB-VR
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 08:22:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnBAe-00DRhf-7n
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 10:22:16 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6320b7-e002-0a2a0a5209dd-0a2a450a937a-0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 10:22:15 +0200
Received: from [40.93.198.48]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a6320b6-f2d2-0a2a450a0019-285dc6300d75-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 10:22:15 +0200
Received: from MN0P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::25)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:22:10 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::44) by MN0P221CA0021.outlook.office365.com
 (2603:10b6:208:52a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.12 via Frontend Transport; Fri,
 24 Jul 2026 08:22:10 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 08:22:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 03:22:09 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 03:22:08 -0500
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
 b=QX9w3LSDx9vn518apcUqWSOLWMeINB+saHdG4WbX3a2mgc9tSMyxOSRfRiYUo6PL/CTWqgp2lRkWSbSyUs7pbO/RkWkR3MCsuC2z9LsYf3fedpg8yJQVLRqwqsfRRl9vETOMrr6/rwb/M9w+CUUm+eU8BwWwLziP2UQiNMHlHYil24SK0tKYMmH/Dj+yPBNhm12fHlO33Qx9RahqTozYkof1OvXce9paH3m5OCiVfct7POpkldHM2Iwxk5U1r2klIKKMczjGVYH73xLPzdo4nn4MgXkMzcKPHxU8ZBBFiPaThpqaZQpMZWg3t4LPGQ0a9Q2ZPyK2G1BqcsY/JJaFow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKZsURe/YOwgT1buT3Tatszo5VHfah4o8xKwrDszR1M=;
 b=yXaTvlBOkgzXQiGYb/+TDFQwDbK59LRQWp9A3TK0477a9IF4PLNpfQVc5XuQvZmYQh9ADWeura4XGBbBEjNPCOo32zLlxv3dXjITMpQTVbc3xsBNq5qn/5A8xD+o2KGNYo7ZqPKVHILqaB9RjnjGNndga7qWbDpMSr1bTF1CeLWhH9MnVdNv6dYVqoCzgQMoYoZhLFPQaVjCDrT8s5s3zYtlLgMBP0de1Qz/mHMm30FO0QLBtLeylIHQv7uJdarA2soL99i63MO0HJAl1cPyVDOmOfpbAcBMWgRUkcB4XQx1Cyqzrf7tARXVKhclLdRnyf9A2XBDl3eXx4dGtCwyRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKZsURe/YOwgT1buT3Tatszo5VHfah4o8xKwrDszR1M=;
 b=spJII4e1NKr8kJAOg8oqRPsHCXCZbBsZYnDB78Kkt4L4/97nY8FEfbH4suAvVLODblICJk4uuF+9TXWQKDh1cKA912/QtWnIRDBv+jYfBV9Fx4hX07vJy8SaZZutBI0EpxEBSLVSZeSx7vgrfHJeCT9t6E0v39FYMIk6x5fll6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <c042c42e-89a6-4d9e-8b9e-3f6ceb259467@amd.com>
Date: Fri, 24 Jul 2026 10:22:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Query] Unable to probe reserved-memory carveouts in DomU with
 Xen
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <xen-devel@lists.xenproject.org>
References: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b9b9fd4-5a62-4854-541a-08dee95ca7f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|10067099003|11063799006|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	oZahHQYvrfnF4ExbVcnRVUMpaE4dAb3Yaiyl+SFzQNckgqoiB5O47YpN8gEIyppo+KQI2tTjtLXQtz9pxnBKqsHEqrDlFXlitnw4GjdKh+nYKfXeM+5pqt6KrvCSgvKoOP3K5SOYH5Wm/iP5LfDyNQh/8x7/ZjFnFqJyn7N1ty9wb/ujo+mTllXCsWJlryX2dHFe7SonNI4CnpYnM4ph7PLg9E0EpxtVnwNiy/Afk4ZCEkNP4+IZ3DvIq3JmyhEuqxH1xaLQJbNO2fK4mill0my47K3e5eblOkndXvww090p6QcXKf7DdiYAeQKwvhT6YyasUx5PtqNGEWgv5+pdiWKrk0RTM/6ne8afY4LvS8SWREzXm7v/5HnEjoIc/h3Q7PlTwZ19wFUYW+52zX8MQlj+sC9/Car23/Lg5Hs+oJT0hAQBF4byLRgEfj9FLIOOb2XXCGvJNpMK5U/Shr3mEFDkPL/DPtId4FVJ0XckI46V5vCrd7LsAaWRDnctwCIlsNsfPHIUrR3u1BaKjeN2wULmHb4K5wNlufyasG9RKXqiHfHVd/VfBCdyTQB9h1CVccOS0CBEPWSGGEPRgpAVoxCogukkpXFwCJDAbP2relAUUtLeMcAI93j5k80tiBkAVZMxqY7e8DxbKJ1DODiZkSYDEc2HaTeW72mh8YMYfQhgicfdVLXdGxCBMro67F6iUF3aA5T6iXT2MKGo5HAVPg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mt/tQtceglsTQcfdsIRS07sZTMMtwGszH/HyZrkMB8pq/kFhS/xfyMu6QcJVu6kzDicRC5Bwgbc+BXgcaNPJ4fFzM0Ga51SImbI4ndsDQwp1p5C27DphHaznpNfWsLoVMlL9XGeBWzAlw/qXUAVypDRIkq+IlCxNWkAwFpre8G+l3tdNpMuNBmOl1Da01PH1TogrUGNxOdU/ABLxBqqkNNZ8noUCS8bi5M/k1N59RXgv2GdS1O6IC7ly8DnfJXQiLFxYp+mMRL5es9Qt74CR6qeel5PhitDtgovb/fIt1TQaNv9QY0Zaw4Y3/y9pFfTzs1zPAZidx+T2rnKtQTYOhMSdB1CuHaX3IY6CuM8k28RerSJ3hOCrDLcNlU6VkQxh0drD9wFtaab7/nI2EX85KL+QsXLi/pcGbP5o3t7NPAIzSOdAARsPsmSkmTPgbv94
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:22:09.6825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b9b9fd4-5a62-4854-541a-08dee95ca7f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
X-purgate-ID: tlsNG-4011c0/1784881335-52ADCCFC-F7A2BE48/0/0
X-purgate-type: clean
X-purgate-size: 5107

Hi,

I'm afraid this will not work. The reason is that Xen only copies nodes from the
passthrough DTB to final DTB that are placed under `/passthrough` node and
`/aliases`. /reserved-memory needs to be under root node `/`, therefore it will
not be copied. However, it seems like you are not using CMA node specifying a
fixed memory region (using `reg`) but size. In that case you should be able to
achieve the same using `cma=128M` kernel cmdline parameter.

~Michal

On 24-Jul-26 08:55, Beleswar Prasad Padhi wrote:
> Hi all,
> 
> I have been trying to use reserved-memory carveouts in DomU, but failing constantly.
> 
> This is the log from Dom1 boot:
> 
> [    0.000000] earlycon: uart8250 at MMIO32 0x0000000053914000 (options '115200n
> 8')
> [    0.000000] printk: legacy bootconsole [uart8250] enabled
> [    0.000000] Xen 4.21 support found
> [    0.000000] efi: UEFI not found.
> *[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT*
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000040000000-0x0000000051ffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000051ffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000051ffffff]
> [    0.000000] On node 0, zone DMA: 24576 pages in unavailable ranges
> [    0.000000] cma: Reserved 32 MiB at 0x000000004f800000
> 
> This is my passthrough.dts:
> 
>     1 /*
>     2 * This is a partial DT for passthrough node to DomU.
>     3 */
>     4 #include <dt-bindings/interrupt-controller/irq.h>
>     5 #include <dt-bindings/interrupt-controller/arm-gic.h>
>     6 
>     7 /dts-v1/;
>     8 
>     9 / {
>    10         #address-cells = <2>;
>    11         #size-cells = <1>;
>    12 
> ~  13         reserved-memory {
> ~  14                 #address-cells = <2>;
> ~  15                 #size-cells = <2>;
> +  16                 ranges;
> +  17 
> +  18                 /* CMA region for framebuffer allocation */
> +  19                 linux,cma {
> +  20                         compatible = "shared-dma-pool";
> +  21                         reusable;
> +  22                         size = <0x00 0x08000000>; /* 128MB CMA pool */
> +  23                         linux,cma-default;
> +  24                 };
>    25         };
>    26 
>    27         passthrough {
>    28                 compatible = "simple-bus";
>    29                 ranges;
>    30                 #address-cells = <2>;
>    31                 #size-cells = <1>;
>    32 
>    33                 misc_clk: misc_clk {
>    34                         #clock-cells = <0>;
>    35                         clock-frequency = <100000000>;
>    36                         compatible = "fixed-clock";
>    37                 };
> 
>    73                 uart@53914000 {
>    74                         compatible = "ns16550a";
>    75                         reg = <0x00 0x53914000 0x1000>;
> ~_ 76                         interrupts = <0 302 4>;
>    77                         reg-shift = <2>;
>    78                         reg-io-width = <4>;
>    79                         clocks = <&misc_clk>;
>    80                         oversampling-rate = <16>;
>    81                         programmable-char-timeout = <4>;
>    82                         status = "okay";
>    83                         xen,path = "/bus@100000/bus@22000000/uart@53914000";
>    84                         xen,reg = <0x0 0x53914000 0x1000 0x0 0x53914000>;
>    85                         xen,force-assign-without-iommu;
>    86                 };
>    87          };
> 
>    88    };
> 
> 
> And this is my dom1.cfg file:
> 
>  1 name = "dom1"
>  2 memory = 256
>  3 vcpus = 4
>  4 
>  5 kernel = "/boot/xen-dom1/Image"
>  6 extra = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x53914000,115200n8 loglevel=8 root=/dev/xvda rw"
>  7 
>  8 # UART1 (0x53914000) passthrough to Dom1 console
>  9 iomem = ["0x53914,1"]
> 11 irqs = [ 334 ]
> 12 dtdev = [ "/bus@100000/bus@22000000/uart@53914000"]
> 13 vif = ["script=vif-route"]
> 14 device_tree = "/boot/xen-dom1/passthrough.dtb"
> 15 #  
> 17 disk = ["phy:/dev/vda2,xvda,rw"]
> 
> 
> Am I doing something wrong? Any help or debugging leads would be really appreciated...
> 
> Thank you,
> Beleswar
> 
> 


