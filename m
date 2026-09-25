Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EB1C98321
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2026 16:58:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1434267.1654346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA9FO-000735-82; Fri, 25 Sep 2026 16:58:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1434267.1654346; Fri, 25 Sep 2026 16:58:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xA9FO-00072y-5N; Fri, 25 Sep 2026 16:58:06 +0000
Received: by outflank-mailman (input) for mailman id 1434267;
 Fri, 25 Sep 2026 16:58:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1xA9FM-00072s-FT
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 16:58:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xA9FL-000mMx-3h
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2026 18:58:03 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab6a7e7-8faa-0a2a0a5109dd-0a2a45078bc6-34
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 18:58:02 +0200
Received: from [40.107.201.11]
 (helo=CH4PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6ab6a819-b4ea-0a2a45070019-286bc90bf3d0-3
 for <xen-devel@lists.xenproject.org>; Fri, 25 Sep 2026 18:58:02 +0200
Received: from PH8P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::21)
 by PH0PR12MB5605.namprd12.prod.outlook.com (2603:10b6:510:129::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 16:55:58 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:510:2db:cafe::76) by PH8P223CA0028.outlook.office365.com
 (2603:10b6:510:2db::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 16:55:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 16:55:57 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 11:55:57 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 25 Sep
 2026 11:55:56 -0500
Received: from [192.168.19.2] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Fri, 25 Sep 2026 11:55:55 -0500
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
 b=GxEkftyMq1yKIK/lY3PT3rX/Y3sha5QlP4asq31hzVN4Gr2A1xfgw4zoyxeCXxhNdlOpJ/yYqFA70GgarGhvhuOYC/CfWqZGvQ+jFEICg05V3k2BNkQHW2+2QOeBprCmhMWNJc+/B8KAkN80/GxFHj7RmipLu7pjbouSxXnzfxW4PSxBMBnZ6KZ8xcwjHcp6Kl9JS21WPa0jxuUB2sXM+GI5dTwrQLZvI5CC+rHsw7n8cOXwTfUiqva9ESrGd3U8j3kuqCHSVjwvh42pG+XqvjN5+gNqCLwPWLzH2tmSce27y+6Fq5/ykuIRkJ+GdDkQJ11LJHF4R3nMUWVR11Vhxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBYnBOZDM3nu9WVWq1DMFGITKg/TPb8Fsu1LyWjoZNk=;
 b=VlOl36EYODdZbpyrVIm7SyIIHezFtp5M4L3tAhE8YAUT2nfSR/A3I4QDJDJhUS+yqPaGaeZGGuCcHCqaz2Mn/qkIvuB1dFOldQTVK2FaauPAEWylFbu92Pwk6r7hL8qAk8nMsKtCvHEQ0xNyZpFxPG/dCUW1dgWxI9Fy05ZvtDRGgEu/w3dp9EkTvVRWZzI+EM+7OIrazvj1tIoQHjwKZvuAAiQI43xurynJ2ORlRaFItkk3EyRZBIWZj4+t9tW2SZA9dh36Gej1RqANmHDEgynyWUDuewzJmBlucNaVGyWrW/HsEpDzY4j5nXHaIgpkkDGGuau9XkBGKuRsQQAZFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBYnBOZDM3nu9WVWq1DMFGITKg/TPb8Fsu1LyWjoZNk=;
 b=lFLmWJ0dkU3g1EXfv1tAFLMzlkLLSBWMJkQFw4UTW47ONq3Fk6/bAIQrjKzDOiaIbINS5XzTm7Mudeia0GW+drmvjLoqorzmJ7udCOPX7a4oJWKLM6R8atXqLXeKg/nWFF6//E4KUyC+eMw90z6ZNZfJKQeDmcqfYQEvEmlRGMI=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <dbd7fdab-3833-4b65-b8b6-d92b5beb9e17@amd.com>
Date: Fri, 25 Sep 2026 12:55:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Implement SR-IOV support for PVH
To: Mykyta Poturai <Mykyta_Poturai@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1775742115.git.mykyta_poturai@epam.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <cover.1775742115.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|PH0PR12MB5605:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2bf6a2-2585-42a4-5c36-08df1b25dee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|260925021311599003|260925021911599003|56012099006|11063799006|10067099003|22082099003|18002099003|6133799003|260925022911599003;
X-Microsoft-Antispam-Message-Info:
	6bhKwRo08IULYPi5sy66vuilL2/HmcOnFZF0I7tGIZFhc//b2N878nNLWrs8u+X1enCaTMfzBYQ2F43aagI64Yo9xqfXjr2Y/ECM2tEssSuGIyPa/A2uoDCDeJ7wJGnI5hev8QGKKA0oDiRzQVZo+oUHdj1IzWvYLA/TbLjvdtnfmJT36vdStyw1OOoXX+sNKiilp9dEWcOkVv/YcOKa+kcrfruwTcUErX6FuKqrSF+7BH+DqS66Uu05rfZnkt0oaU9uN1A9vnaAmkGrMVMLXBVd6Taci/ax73gUegVuZfCefyotUxgyJPbFMrjL7EjcRB9rwVKCRuy/g/SMiO5Rjp+rktWUkrAE/VBcl6Uo2BPnX/qDL9cr665GWMs1iynUg9kEOxiAG3fJO30S9H4otYFJ1AbXjNVGPIuD+hO1yh8W/NSELQA8JdsgKf7KXI9BpX9jmTPnTA89xR2wLHSoiGMzKHgMR3CAMVoKTYv5xaMO0eN9qm0qg4g8qwwEozIyEf6xrbBsNKFJJpadH4VDJ+VVl5ZlbF0OaAP4WTa59YbIwaH8npXZSdOVC762ce3HbmXxSdnSDmYpcHxtRaoLTqKSOc5wyuiova46EcPg8lXGFVxP8QYDaU8fFO/jfSeV/VxevMUrP34SHv+tZaRgow==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(260925021311599003)(260925021911599003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H+Crp9mpATPQFcPZl0/HU/C+oW+1M29TdcH4xwZzDIyKk1c74Xeww8d5v5ASqaVg8MfHCH4dx74GSyGI0jaqg4deEkX949BXwGNo1wjYiitS15XuztdNO9B68FyZ+YjBr+LeLV2yyVdudBOEcBe6tvs6fjP/+Dds5tPNNlDL5uMkrPxwAJME+EtxO4Gbl9rTMPr0nP1mLs80bqKnjTE34J8zjVywzLu/W5K6pDnKun2vLlRCE8R35Pw5LvTLvxKoNGlCr269UxjRiTWEkaSoXOyalOIl9lyiAmlNS/b7UEchUpXHCjFoJ67mb9s6UkDhsBXLxoXuSXog8SAoUv5wH2cp79Vr29ZkPyNvDn70lrYCoEvsuSNTIRLq3RgaISRMg4k2EU0snsHSf03qLV1jolgF4B3w1LNECFzsc0jJg/9HOMvrehZTy0NkGZfhgdxi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 16:55:57.6208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2bf6a2-2585-42a4-5c36-08df1b25dee9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5605
X-purgate-ID: tlsNG-ef75cf/1790355482-368D9AE4-8335A1DE/0/0
X-purgate-type: clean
X-purgate-size: 5108

On 2026-04-09 10:01, Mykyta Poturai wrote:
> This series enables support for PCI SR-IOV capability for PVH domains.
> It allows Dom0 to enable and use SR-IOV virtual functions and for these
> functions to be passed to guests.
> 
> To achieve this, add handlers for SRIOV_CONTROL registers, simplified handlers
> for VFs headers. Xen relies on dom0 to enable SR-IOV and call
> PHYSDEVOP_pci_device_* to inform about addition/removal of VFs.
> 
> Core functionality is based on previous work[1].
> 
> Tested on R-Car Spider board with Samsung NVMe SSD Controller 980 and Intel
> X550T ethernet card.

Hi Mykyta,

I'm testing these patches from the patchew branch 
https://gitlab.com/xen-project/patchew/xen/-/tree/patchew/cover.1775742115.git.mykyta._5Fpoturai@epam.com?ref_type=tags
with an Intel 82576 card which uses the igb driver.  I think your X550T 
testing uses the ixgbe drvier.

SR-IOV capabilities are exposed, and I can create VFs (PF c4:00.0, VF 
c4:10.0).  However, the VF network interfaces don't work.  They can't 
get an IP address.  The PF reports "Detected Tx Unit Hang" as seen in 
the log snippet below.  I trimmed out some "Spoof event" and "invalid 
MAC filter messages" from Xen.  I also included some baremetal logs 
which don't have "Spoof event" messages.  On baremetal, the interface 
gets an IP and is usable.

This is an x86 PVH dom0, but you tested with ARM?  Do you know if there 
are any other dependencies for this patch series?  I'll keep looking at 
it, but I figured I'd ask first.

Thanks,
Jason

PVH dom0:
12:20:34: igb 0000:c4:00.0: 1 VFs allocated
12:20:34: pci 0000:c4:10.0: [8086:10ca] type 00 class 0x020000 PCIe Endpoint
12:20:34: igbvf 0000:c4:10.0: enabling device (0000 -> 0002)
12:20:34: igbvf 0000:c4:10.0: MAC address not assigned by administrator.
12:20:34: igbvf 0000:c4:10.0: Assigning random MAC address.
12:20:34: igbvf 0000:c4:10.0: Intel(R) 82576 Virtual Function
12:20:34: igbvf 0000:c4:10.0: Address: a6:26:55:1d:6b:92
12:20:34: igbvf 0000:c4:10.0 enp196s0f0v0: renamed from eth0
12:20:34: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:20:34: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:20:34: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:20:37: igb 0000:c4:00.0 enp196s0f0: igb: enp196s0f0 NIC Link is Up 
1000 Mbps Full Duplex, Flow Control: RX/TX
12:20:39: igbvf 0000:c4:10.0: Link is Up 1000 Mbps Full Duplex
12:20:39: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00

12:22:17: igb 0000:c4:00.0: Spoof event(s) detected on VF 0
12:22:51: igb 0000:c4:00.0 enp196s0f0: NETDEV WATCHDOG: CPU: 1: transmit 
queue 0 timed out 5004 ms
12:22:51: igb 0000:c4:00.0: Detected Tx Unit Hang
             Tx Queue             <0>
             TDH                  <78>
             TDT                  <83>
             next_to_use          <83>
             next_to_clean        <78>
           buffer_info[next_to_clean]
             time_stamp           <ffffa303>
             next_to_watch        <ffff88812e03c790>
             jiffies              <ffffbca5>
             desc.status          <160200>
12:22:51: igb 0000:c4:00.0 enp196s0f0: Reset adapter
12:22:53: igbvf 0000:c4:10.0: Link is Down

Baremetal:
12:51:01: igb 0000:c4:00.0: 1 VFs allocated
12:51:02: pci 0000:c4:10.0: [8086:10ca] type 00 class 0x020000 PCIe Endpoint
12:51:02: pci 0000:c4:10.0: Adding to iommu group 35
12:51:02: igbvf 0000:c4:10.0: enabling device (0000 -> 0002)
12:51:02: igbvf 0000:c4:10.0: MAC address not assigned by administrator.
12:51:02: igbvf 0000:c4:10.0: Assigning random MAC address.
12:51:02: igbvf 0000:c4:10.0: Intel(R) 82576 Virtual Function
12:51:02: igbvf 0000:c4:10.0: Address: 5a:d0:88:3d:0d:44
12:51:02: igbvf 0000:c4:10.0 enp196s0f0v0: renamed from eth0
12:51:02: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:02: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:02: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0 enp196s0f0: igb: enp196s0f0 NIC Link is Up 
1000 Mbps Full Duplex, Flow Control: RX/TX
12:51:05: igbvf 0000:c4:10.0: Link is Up 1000 Mbps Full Duplex
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00
12:51:05: igb 0000:c4:00.0: VF 0 attempted to set invalid MAC filter 
00:00:00:00:00:00


