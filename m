Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128A7C531FA
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 10:24:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369943.1618402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnD4H-0000LN-6G; Fri, 24 Jul 2026 10:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369943.1618402; Fri, 24 Jul 2026 10:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnD4H-0000LG-3Y; Fri, 24 Jul 2026 10:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1369943;
 Fri, 24 Jul 2026 10:23:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wnD4F-0000LA-N5
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 10:23:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnD4E-00DpGL-PI
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 12:23:46 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a633d2b-2eae-0a2a0a5409dd-0a2a4509cac8-20
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 12:23:46 +0200
Received: from [52.101.201.63]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a633d30-be1a-0a2a45090019-3465c93f3993-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 12:23:46 +0200
Received: from SJ0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:a03:333::33)
 by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:23:40 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:333:cafe::af) by SJ0PR03CA0118.outlook.office365.com
 (2603:10b6:a03:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:23:40 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:23:39 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 24 Jul
 2026 05:23:38 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 24 Jul 2026 05:23:38 -0500
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
 b=o+Kg9HZIvkLNVJBkF3UHp/MI+JDV5przUQEFchYa4mTW5XY050OirP8Cdm1aAHjp9L9RAMvl5GtoDcpT0WU9aH2tPbWdBkyoP40yoQyHXulPFwxPmdDEzHnddKXAGAPk7gdeXkLAT8Pk+SJcR9F3mDp74PXH1UBLmjM8TFlHFtxM//9y+u62JFLlCI9VEkma4HCSzp7Km/uoEUgsns/jfKhVtepz/0sDQM+r7OQo8jgPocw+XSPjxh5qnEA9scwPDEWOovfxhyx/4JfFAMWE7sH2zhFirSf7ZbDoBINQoTcY9Ie35kmdI+HSiUsuUa8S+MjAMWlitxdEk8+ji0FkTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eyWDh2YvX/UVIJ9wBzJzTacSY8Z7ghhw0icosbHuqg=;
 b=p6zQNJ42uZztVyCW5yIiEUglZLn72iGvat/uDeRwJz9mdnpRJFkKb3JfasDI844V47P1bQVweK2RcY6JYjWJ7vmlcK6H/3nU1cpHErP+ylm1rmHSrsrRrE7tc4YWBrn2kf0pQEI8P1D7CdVU8Ma1KC9eyBjqP+a2TueOGnVuF+c4az6INY7qR9WqwCNWl15YBk87KpUvD8lBcCHy2bko+mSGMCISOOY6UMXSUGZwNEfbrVgkHEZp/igTRKzfF5D6YVHhMxNPsfPbdFP4cNtNEHKtoIZ9U3pQmOkTIOpYx7zdwxfcxCW1eMN2H9D65GMvE/FmTI/eKKMzq3YPQLEH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ti.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eyWDh2YvX/UVIJ9wBzJzTacSY8Z7ghhw0icosbHuqg=;
 b=ceIRpoXygeQV1Ifj1dg8CJwr5H5CJoSZFtQGs1lKaNeORmDUFkjyHgtzwjcSjn9J3UONoNPQAQBTSHkTWQV1VPqVKlC8D+n09yYcy33gIFyOKqPmbLrrcq34DocCqx1E9YMClvj9GY1UMOq1pZfUJ00qA00HE0IbFZTCGeJ5aNE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e99c0c63-7168-48f5-b326-2e0de63457ad@amd.com>
Date: Fri, 24 Jul 2026 12:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Query] Unable to probe reserved-memory carveouts in DomU with
 Xen
To: Beleswar Prasad Padhi <b-padhi@ti.com>, <xen-devel@lists.xenproject.org>
References: <ba100bd7-5cc0-4f87-af3c-dca887963d44@ti.com>
 <c042c42e-89a6-4d9e-8b9e-3f6ceb259467@amd.com>
 <92ad79d5-ad28-4b17-ae13-174135d565fe@ti.com>
 <a28c9391-ab8a-4998-b35f-9ef4b539220c@amd.com>
 <0e556bb5-269d-47d7-9ae8-68f06eee9fc0@ti.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <0e556bb5-269d-47d7-9ae8-68f06eee9fc0@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: f5162bec-16e6-4574-1ea7-08dee96da135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|22082099003|18002099003|13003099007|10067099003|56012099006|11063799006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info:
	k7DojR2VLkVmYvehbsAGA5IIGQLgkQ92R/ckFti1UxADm9uw99wrZw77cvDvz5kNxp+udVGB139d/VDy+V11EvPzQB/EJcmWBpxrk+6VHCZbuAUmVkXgpgRfNlC2zazZVug8iBJdVzb4DcDsKrHFyCLtClQ0OwLkUYUyXy2KDhkKF/tuwPGMunXSihnhftPNGFsagFXZMCe53ahKYUPLvRY7AUN4UAK+WVgm28g63swLziSzX1dOgMJUuEWYr0nlbyKTrzXhe99Ls/njmmgtXlRuNvU7CvxlDbnMBDa2LpR17iei2vCtGRiLgriuIBBuvng93bIOQQ863vUc/PkHCznjIk0xdkmM9G0cj7s5Sys+nOYAu3sD5AS+Vs4w7muTDbQNUCFZl7hEt9lR2lkK3S7qDW97nW0V7DAyehRU6GqpXv3uwOITv6/DzoJQnXW/ypQJFKS4oZo5WYTBWsgB7MIfYzoBCssa5AiKof3tGuUE1Gs+Q/FrEDTjkrX6H2G9adqb5mQebXWYhRcpIF/7wZc762yJqTP1932DVl25mgGI7qzBqVds4+++PPZ2bBmCePclI7sACTaOcLKdJeGYtS9gs4Op4uIWtWY1A2juI/EnVSbDvMPl9viIUIRiwcwTSlWUL5jymyNBBZqfUgKRhg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(22082099003)(18002099003)(13003099007)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m3vkmwzAmUvy+OmxfImQXaZImdbKMymYJzyfwKHuV9hyG0+ksKC3xs3Wl4ROG36WKqo5uInC90yOOFoqp4GEPoQzG3ebWEBmeyAZf9lXLQ6BgbePIPPUYU/46fbUvif6IMejLyv7mdIyWl70dsWppS+4o4Cli08ozKDdZt0zuonVIPz09jPHDNPqsVNPWNVIL4UaA+af1WdN86qGEOx5Hs94qZCrTfsph0j2WSm3/YRgJJG/X9QAqVELAXjAAN5LVXKASuFA1IX9ZdRjKCs4Rh0w2Dev9VZ1QwLLtqicXkNln8YyqFq8eHf7Dqnh48sokdRMxMYNmyd72OTAolIm/OZiMNkaqXz3T1Ah/MQIRAqONfBWubeyuhmN+lCgW6CyeApLx+0B+SnrUQOPAmId+2LE/tkDdhICTeVcHbXXQlDYEBL+NW7aA/k/hoKweKeo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:23:39.7153
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5162bec-16e6-4574-1ea7-08dee96da135
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
X-purgate-ID: tlsNG-bad1c0/1784888626-3A6DA034-ADB7CE23/0/0
X-purgate-type: clean
X-purgate-size: 7681



On 24-Jul-26 11:26, Beleswar Prasad Padhi wrote:
> 
> On 24/07/26 14:28, Orzel, Michal wrote:
>>
>> On 24-Jul-26 10:32, Padhi, Beleswar wrote:
>>> Hello,
>>>
>>> Thanks for the response! I see, this would solve the cma problem. But 
>>> there are usecases
>>> when we want to use the reserved-memory node; one example is the 
>>> firmware for
>>> remote processors. In that case, how do we passthrough reserved-memory 
>>> nodes to
>>> DomUs?
>> I'm afraid we don't have a solution for that at the moment but this is a
>> limitation we are aware of.
> 
> 
> No problem, I can look into implementing it. Thanks for the
> heads up!
> 
>>  So far, when it comes to /reserved-memory we only
>> have a static shared memory feature allowing to set up a shmem communication
>> region between domUs, where the range is exposed to domains in DT following this
>> spec:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/reserved-memory/xen,shared-memory.txt
> 
> 
> I see, is there any working example or documentation on
> how to use these regions? DT/dom1.cfg configuration?
This is a dom0less feature (for boot time predefined domains) documented here:
https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/device-tree/booting.txt

For libxl, we don't have a nice way to do that in upstream but you can check our
Xilinx docs:
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1718583312/Xen+on+ARM+Share+memory+between+guests

~Michal

> 
> Thanks a lot,
> Beleswar
> 
>>
>> Cheers,
>> Michal
>>
>>> Example:
>>>   60
>>>   61                 mcu_r52_0_fw_memory_region: memory@a1000000 {
>>>   62                         compatible = "shared-dma-pool";
>>>   63                         reg = <0x00 0xa1000000 0x00 0x100000>;
>>>   64                         no-map;
>>>   65                 };
>>>
>>> Thanks,
>>> Beleswar
>>>
>>> On 7/24/2026 1:52 PM, Orzel, Michal wrote:
>>>> Hi,
>>>>
>>>> I'm afraid this will not work. The reason is that Xen only copies nodes from the
>>>> passthrough DTB to final DTB that are placed under `/passthrough` node and
>>>> `/aliases`. /reserved-memory needs to be under root node `/`, therefore it will
>>>> not be copied. However, it seems like you are not using CMA node specifying a
>>>> fixed memory region (using `reg`) but size. In that case you should be able to
>>>> achieve the same using `cma=128M` kernel cmdline parameter.
>>>>
>>>> ~Michal
>>>>
>>>> On 24-Jul-26 08:55, Beleswar Prasad Padhi wrote:
>>>>> Hi all,
>>>>>
>>>>> I have been trying to use reserved-memory carveouts in DomU, but failing constantly.
>>>>>
>>>>> This is the log from Dom1 boot:
>>>>>
>>>>> [    0.000000] earlycon: uart8250 at MMIO32 0x0000000053914000 (options '115200n
>>>>> 8')
>>>>> [    0.000000] printk: legacy bootconsole [uart8250] enabled
>>>>> [    0.000000] Xen 4.21 support found
>>>>> [    0.000000] efi: UEFI not found.
>>>>> *[    0.000000] OF: reserved mem: Reserved memory: No reserved-memory node in the DT*
>>>>> [    0.000000] Zone ranges:
>>>>> [    0.000000]   DMA      [mem 0x0000000040000000-0x0000000051ffffff]
>>>>> [    0.000000]   DMA32    empty
>>>>> [    0.000000]   Normal   empty
>>>>> [    0.000000] Movable zone start for each node
>>>>> [    0.000000] Early memory node ranges
>>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x0000000051ffffff]
>>>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x0000000051ffffff]
>>>>> [    0.000000] On node 0, zone DMA: 24576 pages in unavailable ranges
>>>>> [    0.000000] cma: Reserved 32 MiB at 0x000000004f800000
>>>>>
>>>>> This is my passthrough.dts:
>>>>>
>>>>>      1 /*
>>>>>      2 * This is a partial DT for passthrough node to DomU.
>>>>>      3 */
>>>>>      4 #include <dt-bindings/interrupt-controller/irq.h>
>>>>>      5 #include <dt-bindings/interrupt-controller/arm-gic.h>
>>>>>      6
>>>>>      7 /dts-v1/;
>>>>>      8
>>>>>      9 / {
>>>>>     10         #address-cells = <2>;
>>>>>     11         #size-cells = <1>;
>>>>>     12
>>>>> ~  13         reserved-memory {
>>>>> ~  14                 #address-cells = <2>;
>>>>> ~  15                 #size-cells = <2>;
>>>>> +  16                 ranges;
>>>>> +  17
>>>>> +  18                 /* CMA region for framebuffer allocation */
>>>>> +  19                 linux,cma {
>>>>> +  20                         compatible = "shared-dma-pool";
>>>>> +  21                         reusable;
>>>>> +  22                         size = <0x00 0x08000000>; /* 128MB CMA pool */
>>>>> +  23                         linux,cma-default;
>>>>> +  24                 };
>>>>>     25         };
>>>>>     26
>>>>>     27         passthrough {
>>>>>     28                 compatible = "simple-bus";
>>>>>     29                 ranges;
>>>>>     30                 #address-cells = <2>;
>>>>>     31                 #size-cells = <1>;
>>>>>     32
>>>>>     33                 misc_clk: misc_clk {
>>>>>     34                         #clock-cells = <0>;
>>>>>     35                         clock-frequency = <100000000>;
>>>>>     36                         compatible = "fixed-clock";
>>>>>     37                 };
>>>>>
>>>>>     73                 uart@53914000 {
>>>>>     74                         compatible = "ns16550a";
>>>>>     75                         reg = <0x00 0x53914000 0x1000>;
>>>>> ~_ 76                         interrupts = <0 302 4>;
>>>>>     77                         reg-shift = <2>;
>>>>>     78                         reg-io-width = <4>;
>>>>>     79                         clocks = <&misc_clk>;
>>>>>     80                         oversampling-rate = <16>;
>>>>>     81                         programmable-char-timeout = <4>;
>>>>>     82                         status = "okay";
>>>>>     83                         xen,path = "/bus@100000/bus@22000000/uart@53914000";
>>>>>     84                         xen,reg = <0x0 0x53914000 0x1000 0x0 0x53914000>;
>>>>>     85                         xen,force-assign-without-iommu;
>>>>>     86                 };
>>>>>     87          };
>>>>>
>>>>>     88    };
>>>>>
>>>>>
>>>>> And this is my dom1.cfg file:
>>>>>
>>>>>   1 name = "dom1"
>>>>>   2 memory = 256
>>>>>   3 vcpus = 4
>>>>>   4
>>>>>   5 kernel = "/boot/xen-dom1/Image"
>>>>>   6 extra = "console=ttyS0,115200n8 earlycon=uart8250,mmio32,0x53914000,115200n8 loglevel=8 root=/dev/xvda rw"
>>>>>   7
>>>>>   8 # UART1 (0x53914000) passthrough to Dom1 console
>>>>>   9 iomem = ["0x53914,1"]
>>>>> 11 irqs = [ 334 ]
>>>>> 12 dtdev = [ "/bus@100000/bus@22000000/uart@53914000"]
>>>>> 13 vif = ["script=vif-route"]
>>>>> 14 device_tree = "/boot/xen-dom1/passthrough.dtb"
>>>>> 15 #
>>>>> 17 disk = ["phy:/dev/vda2,xvda,rw"]
>>>>>
>>>>>
>>>>> Am I doing something wrong? Any help or debugging leads would be really appreciated...
>>>>>
>>>>> Thank you,
>>>>> Beleswar
>>>>>
>>>>>


