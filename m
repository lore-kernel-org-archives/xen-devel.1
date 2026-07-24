Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD064C531FA
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 08:58:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369902.1618371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnBji-0003mR-Qx; Fri, 24 Jul 2026 08:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369902.1618371; Fri, 24 Jul 2026 08:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnBji-0003mK-OF; Fri, 24 Jul 2026 08:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1369902;
 Fri, 24 Jul 2026 08:58:29 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wnBjh-0003mE-8l
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 08:58:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnBjf-009sxt-QB
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 10:58:28 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a63292f-e002-0a2a0a5209dd-0a2a4502e89e-10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 10:58:27 +0200
Received: from [52.101.53.8]
 (helo=BL0PR03CU003.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a632932-6ca4-0a2a45020019-34653508a70e-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 10:58:27 +0200
Received: from SA9PR13CA0096.namprd13.prod.outlook.com (2603:10b6:806:24::11)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:58:22 +0000
Received: from SA2PEPF00001505.namprd04.prod.outlook.com
 (2603:10b6:806:24:cafe::83) by SA9PR13CA0096.outlook.office365.com
 (2603:10b6:806:24::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Fri, 24
 Jul 2026 08:58:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF00001505.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 08:58:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 03:58:21 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 03:58:20 -0500
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
 b=CEE2EHA9YxaF5t0V/TuLPz+ohjd1BXm7Ud0Rj0W9uTcdq+F9pfxV4t4F7cC/Az9UzGX1wWqwbQEpZ9gwferDYackB7VR4wM7EDf/0VYaD0mbbj1FHKFCm/BIuAXOHfIaUrQBMLDojvbyftelgDunz4YWeNoBHujYV6wPFMWOU9+KTA8Ul0tqdpEliBVhtj1061paeMWXUOZIaPV+V9DUZ4OiCTcsEedS5PyHgKfphYfvb6iVCVI/d/E/Pqr9QhHK3DDb3AAsCFrqumVWClMMW10N17Xoa82kRZF0OtO/yPoB/IMXqRQ4uDP4nUWtttgNKKhYhr9wf0N0siMSRt0Fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEeI4jmw91LkbgKlBaywTLIDwwVRBhYtUb1a+MdlzIc=;
 b=hRtxG4JUnxgVyc/J5TRXTYr6dnwzJ6dRwC8plFX5Z2z1SM2i4S0hstnn4XGdGh5B1BsQ3jqoAqGFlX307Di+Y6W1Pr4grSz/i4uPjfRqz7l6fVyVHemBBOcf9JOKbIa18Ml38N/tWcbCoJgKdboelXO7T3q8d/F4sHn13NZ/IhZdSWy4EOfDc1+8bZlPx0rFNVKV1xYQD9b9wwRnMwu6wC14UX/qrZCgWh+CvuE4XyMCcIoVLBwbBWCFH2I8YdbZl/Kemu0/pbLN5tjCcpukYQBmSTYqjPKa/GUtxFNo9XahxStkGdP0Fy2MWRZSMCqjE+3nWANZYlrmYJDnuIHoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEeI4jmw91LkbgKlBaywTLIDwwVRBhYtUb1a+MdlzIc=;
 b=43A5j8KRGSz1GRikvA/N6KYBScga420levQ8xbUAh9b2KanIeYm1bQoXzuG/si+gtHyrwhEoKZlzpXdgoe5Pqh+C/sPUuq1vz8IGL/ufsQrPdmeaOKEo3kKXUeO0wPEbsB+Ds5rYgyFfrXJ48HaLlP7AtDaMcb/1RBQExTmR+jo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <a28c9391-ab8a-4998-b35f-9ef4b539220c@amd.com>
Date: Fri, 24 Jul 2026 10:58:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Query] Unable to probe reserved-memory carveouts in DomU with
 Xen
To: "Padhi, Beleswar" <b-padhi@ti.com>, <xen-devel@lists.xenproject.org>
References: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
 <c042c42e-89a6-4d9e-8b9e-3f6ceb259467@amd.com>
 <92ad79d5-ad28-4b17-ae13-174135d565fe@ti.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <92ad79d5-ad28-4b17-ae13-174135d565fe@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001505:EE_|MN2PR12MB4392:EE_
X-MS-Office365-Filtering-Correlation-Id: 5757791d-f64f-4baf-e48d-08dee961b6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|13003099007|6133799003|56012099006|11063799006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	uO3ovG1v0E746xw/n120NP7JcNctEOK9IGBuWuxC2PF4Kj/WYt4AAwJt0l1ie0U6sMDTAEGnBy7bUH5Ob/IIirvnYsa4vtzd7C0k4IcmlMQvIb/Tve7n9MD0RXY5UoHZcOJLHBnARspYXTcOHp423anGqH8EXdFjUcF6lfA4mcuLqzhKpfvpcdGUo6RGiXv21uUDT8gt2Gd1k37ikGcedp+CThhAVzjWLRuWKS+61OvR0+BANEN5doIW/w1sJZBWJbqq6JeqqnA9MBFcfwYG1APjHRLuYNQubM+ZwTnM51MrPVr2NsP5w1JxsCLrFzddhrpII+HTAjVbtW9E+EqCTb8AFQj7MHfCNbyBVT6GmLY/AfW5Ksjgqjzcjn0Wzwa3QimlHT5DMcqabOTpTeeFPt4HWCTWpRy7fd33lD2PPwSSbnokSF9SY/0FhGwFLmHDNcpom2QEvolHLIXOcZw/M/hNTTRKBZzivRjFnLY1ymI7xcdrAAt9PLp7SvJaTooPb8tyUkRd4Jf3I/sF+o7NU3rFYoszzmT0/2zPZyb8Pg+L/FxOxkb5yLjveZx9z3AUQrdTndk8L0+UDhOLL+UjbxUY0snjV/15PhIZdGb2lRnuw7swknI8x7ry1dMgvUBYgnNH524MUIxlQNxoh1Nqe9+pawTMb1ukvlaw54PyvyqSgH01eZWEOxOoCoD5UzzfI8I855+OHAV4XNY0gKjWgw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(13003099007)(6133799003)(56012099006)(11063799006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	nqSQaS3OV725jvsHtAjW7vRL0ZFmrzzkO5Uzhgvwz+1r2HuL+zYU3Yy1ls/G+NWZBnXfT7tlC4bhzZhbVgRqUJ1rWujeQ6t70IV2w4++TAMyeXytWzkJqkt917BQm8D1/NDGAy4xKLw7v8ioyO+nBJT3rPX9/+4gvJ/aE2bNj2vwMA2Xf+WUzQIJio2AAbg0I3cBpt0EUtDTah/DqEsTk3K+CWLD2pNIa9UZbXmacOaBu6PBWNuY6uy2pkzDYAQvuWdDn7ma+pBAi4k0pu0WNGDvG/ODROFjCoUhBkSghbLEvVbJuaTcSy1KwVTPmwIdK5PV0rMdDcYdGkCfdNOUZpqQOqAbG+d5AEDSlX+oA2fkUtyXlky51cZXkDvtYTDHbU86tgfP41tbn94l2WOzuw+6EU8iG54GYFS1tqInykCvUxq7Oymz7D8xmrsCmlEs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:58:21.8924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5757791d-f64f-4baf-e48d-08dee961b6b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001505.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
X-purgate-ID: tlsNG-720697/1784883507-F06A72AC-DBA840A7/0/0
X-purgate-type: clean
X-purgate-size: 6630



On 24-Jul-26 10:32, Padhi, Beleswar wrote:
> Hello,
> 
> Thanks for the response! I see, this would solve the cma problem. But 
> there are usecases
> when we want to use the reserved-memory node; one example is the 
> firmware for
> remote processors. In that case, how do we passthrough reserved-memory 
> nodes to
> DomUs?
I'm afraid we don't have a solution for that at the moment but this is a
limitation we are aware of. So far, when it comes to /reserved-memory we only
have a static shared memory feature allowing to set up a shmem communication
region between domUs, where the range is exposed to domains in DT following this
spec:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt

Cheers,
Michal

> 
> Example:
>   60
>   61                 mcu_r52_0_fw_memory_region: memory@a1000000 {
>   62                         compatible = "shared-dma-pool";
>   63                         reg = <0x00 0xa1000000 0x00 0x100000>;
>   64                         no-map;
>   65                 };
> 
> Thanks,
> Beleswar
> 
> On 7/24/2026 1:52 PM, Orzel, Michal wrote:
>> Hi,
>>
>> I'm afraid this will not work. The reason is that Xen only copies nodes from the
>> passthrough DTB to final DTB that are placed under `/passthrough` node and
>> `/aliases`. /reserved-memory needs to be under root node `/`, therefore it will
>> not be copied. However, it seems like you are not using CMA node specifying a
>> fixed memory region (using `reg`) but size. In that case you should be able to
>> achieve the same using `cma=128M` kernel cmdline parameter.
>>
>> ~Michal
>>
>> On 24-Jul-26 08:55, Beleswar Prasad Padhi wrote:
>>> Hi all,
>>>
>>> I have been trying to use reserved-memory carveouts in DomU, but failing constantly.
>>>
>>> This is the log from Dom1 boot:
>>>
>>> [    0.000000] earlycon: uart8250 at MMIO32 0x0000000053914000 (options '115200n
>>> 8')
>>> [    0.000000] printk: legacy bootconsole [uart8250] enabled
>>> [    0.000000] Xen 4.21 support found
>>> [    0.000000] efi: UEFI not found.
>>> *[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT*
>>> [    0.000000] Zone ranges:
>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x0000000051ffffff]
>>> [    0.000000]   DMA32    empty
>>> [    0.000000]   Normal   empty
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000051ffffff]
>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000051ffffff]
>>> [    0.000000] On node 0, zone DMA: 24576 pages in unavailable ranges
>>> [    0.000000] cma: Reserved 32 MiB at 0x000000004f800000
>>>
>>> This is my passthrough.dts:
>>>
>>>      1 /*
>>>      2 * This is a partial DT for passthrough node to DomU.
>>>      3 */
>>>      4 #include <dt-bindings/interrupt-controller/irq.h>
>>>      5 #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>      6
>>>      7 /dts-v1/;
>>>      8
>>>      9 / {
>>>     10         #address-cells = <2>;
>>>     11         #size-cells = <1>;
>>>     12
>>> ~  13         reserved-memory {
>>> ~  14                 #address-cells = <2>;
>>> ~  15                 #size-cells = <2>;
>>> +  16                 ranges;
>>> +  17
>>> +  18                 /* CMA region for framebuffer allocation */
>>> +  19                 linux,cma {
>>> +  20                         compatible = "shared-dma-pool";
>>> +  21                         reusable;
>>> +  22                         size = <0x00 0x08000000>; /* 128MB CMA pool */
>>> +  23                         linux,cma-default;
>>> +  24                 };
>>>     25         };
>>>     26
>>>     27         passthrough {
>>>     28                 compatible = "simple-bus";
>>>     29                 ranges;
>>>     30                 #address-cells = <2>;
>>>     31                 #size-cells = <1>;
>>>     32
>>>     33                 misc_clk: misc_clk {
>>>     34                         #clock-cells = <0>;
>>>     35                         clock-frequency = <100000000>;
>>>     36                         compatible = "fixed-clock";
>>>     37                 };
>>>
>>>     73                 uart@53914000 {
>>>     74                         compatible = "ns16550a";
>>>     75                         reg = <0x00 0x53914000 0x1000>;
>>> ~_ 76                         interrupts = <0 302 4>;
>>>     77                         reg-shift = <2>;
>>>     78                         reg-io-width = <4>;
>>>     79                         clocks = <&misc_clk>;
>>>     80                         oversampling-rate = <16>;
>>>     81                         programmable-char-timeout = <4>;
>>>     82                         status = "okay";
>>>     83                         xen,path = "/bus@100000/bus@22000000/uart@53914000";
>>>     84                         xen,reg = <0x0 0x53914000 0x1000 0x0 0x53914000>;
>>>     85                         xen,force-assign-without-iommu;
>>>     86                 };
>>>     87          };
>>>
>>>     88    };
>>>
>>>
>>> And this is my dom1.cfg file:
>>>
>>>   1 name = "dom1"
>>>   2 memory = 256
>>>   3 vcpus = 4
>>>   4
>>>   5 kernel = "/boot/xen-dom1/Image"
>>>   6 extra = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x53914000,115200n8 loglevel=8 root=/dev/xvda rw"
>>>   7
>>>   8 # UART1 (0x53914000) passthrough to Dom1 console
>>>   9 iomem = ["0x53914,1"]
>>> 11 irqs = [ 334 ]
>>> 12 dtdev = [ "/bus@100000/bus@22000000/uart@53914000"]
>>> 13 vif = ["script=vif-route"]
>>> 14 device_tree = "/boot/xen-dom1/passthrough.dtb"
>>> 15 #
>>> 17 disk = ["phy:/dev/vda2,xvda,rw"]
>>>
>>>
>>> Am I doing something wrong? Any help or debugging leads would be really appreciated...
>>>
>>> Thank you,
>>> Beleswar
>>>
>>>


