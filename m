Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF8DC55ABA
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 02:15:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384119.1627192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrndE-0007bD-Bb; Thu, 06 Aug 2026 02:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384119.1627192; Thu, 06 Aug 2026 02:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrndE-0007b6-8l; Thu, 06 Aug 2026 02:14:52 +0000
Received: by outflank-mailman (input) for mailman id 1384119;
 Thu, 06 Aug 2026 02:14:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrndC-0007az-D4
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:14:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrndB-005SbK-QK
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 04:14:49 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ed9f-2eae-0a2a0a5409dd-0a2a4508c090-42
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:14:49 +0200
Received: from [40.93.201.62]
 (helo=CY3PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee17-f659-0a2a45080019-285dc93e5ab0-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:14:49 +0200
Received: from BN1PR14CA0030.namprd14.prod.outlook.com (2603:10b6:408:e3::35)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 02:14:43 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:e3:cafe::8f) by BN1PR14CA0030.outlook.office365.com
 (2603:10b6:408:e3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.20 via Frontend Transport; Thu, 6
 Aug 2026 02:14:42 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:14:42 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:14:42 -0500
Received: from [172.19.79.34] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:14:41 -0500
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
 b=DO/bjLARzlv+5rkIBW7/wS8kN6Cmo/cKvRD1iwfO3MAqqWIdOqoGY+Cmnpk3Pmv5Fx/2VP8ScxF+t1CNPgh60krhudF7xydnya0a+lTyhbZtVMjaPNw9P3AlKKwlrcOLjToKurEZZs6uMK9f2VK/GnxLabF8DvyYXxYYM7W3z4QXluQLV0bPrS3VX0dAoXCX78/2TQKP9CuKQsQGH1/ZBV84duwFkZUX30bMAusR3C/lbzqeX8NkvNPUlc2Lbw3KnIiX1oxTzFnLnfz1K0j8X+C0IboSmLOpCo0IzN2pTvYTAT06Gs6aRLYH1IvWSv5UoovMB8PYblrRNUuxKWXwlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0P6fp9yfApqMGT/Drm+Sfrk8wWNTPqAvXMP5hletWlQ=;
 b=zL4/G5PcNin02TnDsfhULQvRftXDPHo5b5+aGnquY2aKI7ijB5f2MEs9cRiQh/1LyO5oX2I7lUmyVtf0tMA+OcKrwUSHGUUxZ4pKef69ZL1mjaFumxAi1Yts29nz3bHEVrTB7qB/zL8O2J1DWbY8bcxmNC1FOIRDO1nx+pwGJOzHVpABaY+39mp1Y3+t0pacoBycCJTlPSlzEVP2qUdypRBilI5gx4zpcwajRrFN4mq7Y0vm0JTTdlIvG0hUL+5V9E+CzxE/J01vqViAky4B8cuvQ/XHzFsjophVZlmgdalN5OS1Qfs3APX25tUP98M7ER1EX1xw5u/VgSqw4oZjyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0P6fp9yfApqMGT/Drm+Sfrk8wWNTPqAvXMP5hletWlQ=;
 b=4zo/WxPdPif9OwB8yQNv2lX4oohJQ2IluQSjTOTpAskU9119aed3JP+LCj9lstlvXKBCu42yEsbA/uPtsKr2Ay9peG8818g7sv3N0v4ZHrHSxvzC4mS7TihorSHDvrUfzbg5bY/pSdHKR0IMdRUQYh7o5UNpeXJtvgaZ+Sh3Hv0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <f45d2a03-a9df-4d39-8c9c-2276d4f0ebea@amd.com>
Date: Wed, 5 Aug 2026 21:51:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] xen: Drop CONFIG_XEN_PVHVM
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	<xen-devel@lists.xenproject.org>
References: <20260805082137.1214967-1-jgross@suse.com>
 <20260805082137.1214967-3-jgross@suse.com>
 <7179e004-76df-42be-94fd-f314614e65cd@citrix.com>
 <15824536-dff6-426d-b54c-6a1f362adaa2@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <15824536-dff6-426d-b54c-6a1f362adaa2@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 117afe2a-f8f9-4b26-fe0c-08def3607a3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|82310400026|36860700016|1800799024|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	cDep0RmGVdJ+FSUDwi9N56Qf9kpKG3n/heqNoO25ONzqSllnxpGK23rJIZnNr4ZfyUS6Mn+wJOrn+hVMCshsCgYY7yeBcf+MQtAmcYTBziJPZfTQBIXTv52PvWsLm1FYaVZv50PeFo748gXXIIvRy/WnDFJAQsMAWU+m8WmZsIqc5uMtm7Tkc4OyVLL6S5zy00jg4ZVNtzWpZnk8V28FGAJhLcEuuLHn12f7YAdYegEWu1BxW7DTHK/tHLtIAKQ+peoWeK1qyXzUC9+zu6dIF8qCT/3xQqR9F1rVp2dY0QdYHMpHNb+U+LkbZshhPbvl7wdLuSCoKgO9+36gIlOuhC8wosvSgqAdPonjPQOJdNcHiULpOjVEMIdSQrGlQD3nlpCGyOIx+n7W5lEVEXzVPTOUzx0cUw87MIOg/5e09ICiAI571sdjsd50/kMghOzL5aXfKKh/OR5m1+iRXaDUjg197ZZIwUwW+OOomwcyM6tYS3A5CTEpZykZQmsqAVksL3n3Hxkavz6PnwW1im9vAdinH4+HO5FVCCX5eJui4FyGB48vPipTFRxFIwPGuonWX10isQHZs7Ju4GKzVRRT4zWeguCOqDwb4gbQ58rWgt/WSJ1UQ2ohxqlLurcwvFPdjESUO67p+66icKmYkrw4sVwGn/Z/wKTwXPUnTL17JYKQVFVGyzVtnK4iJlj6fk77wNkhQAOByFmn/BsiFJnH4Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(82310400026)(36860700016)(1800799024)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xv+R/7yqZcLhE13Vq5fJu6lI/PUV0ZrbwRUN3fsGyVgHHPPr28PVk3tfIO/AK+uUlExFxHVBmJc+DtrVA2lkZeb4RFLP32314BcaPX3YbYmU6AA1AW5ieBLbzxW7EbsWCbiBWjo9Ul/vbZFWT1KWbQXehjZVb7yo6nj3gOAgRN1m4wmdlrqdwz+uMf5mzyveFSVJuX4FtguRLRqViS+PTJ4M8rTcBePhyIerZeM4V4T4iEmAf5dIV30iplNR7CmpNL0ETPHMh/5SC1ppzRkpJrYiyiUwi+lDpTSsGoRmloLfvzXB5sjfg7MzT8z0IlOXhp/ite4nFCxEIBIRz9A575rOUAiGKWxzyy4aAv/gVfoVL66vWFhp2QYdUKIyHjQhwguoNSDxeMQBo7pq6+a1e+MJ6wl4jPQ9fZFDmGs6rtHM0+3EADBW7lHgqqFinMmZ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:14:42.5971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117afe2a-f8f9-4b26-fe0c-08def3607a3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708
X-purgate-ID: tlsNG-c1860d/1785982489-CD74B87B-81BC9252/0/0
X-purgate-type: clean
X-purgate-size: 1899

On 2026-08-05 04:36, Juergen Gross wrote:
> On 05.08.26 10:28, Andrew Cooper wrote:
>> On 05/08/2026 9:21 am, Juergen Gross wrote:
>>> On x86 CONFIG_XEN_PVHVM is now a synonym of CONFIG_XEN.
>>>
>>> In Xen specific x86 code it can be just dropped, in non-Xen specific
>>> x86 code it can be replaced with CONFIG_XEN.
>>>
>>> In architecture independent code it is used only where CONFIG_XEN is
>>> defined, so it can be replaced with CONFIG_X86 there.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/ 
>>> idtentry.h
>>> index 20f548702404..f400cfac69a6 100644
>>> --- a/arch/x86/include/asm/idtentry.h
>>> +++ b/arch/x86/include/asm/idtentry.h
>>> @@ -745,7 +745,7 @@ 
>>> DECLARE_IDTENTRY_SYSVEC(HYPERV_STIMER0_VECTOR,        
>>> sysvec_hyperv_stimer0);
>>>   DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,    
>>> sysvec_acrn_hv_callback);
>>>   #endif
>>> -#ifdef CONFIG_XEN_PVHVM
>>> +#ifdef CONFIG_XEN
>>>   DECLARE_IDTENTRY_SYSVEC(HYPERVISOR_CALLBACK_VECTOR,    
>>> sysvec_xen_hvm_callback);
>>>   #endif
>>
>> I'm very happy to see a reduction in the number of Kconfig symbols for
>> Xen (there are definitely too many), but this looks wonky.
>>
>> Or are you saying that there really is no way to build a Xen PV guest
>> excluding the HVM-only bits?
> 
> Seems so, yes.
> 
> This has been like this for at least several years now.
> 
> What you can do is to configure the kernel to exclude the Xen platform PCI
> device (CONFIG_XEN_PVHVM_GUEST=n).
I think I caused this inadvertently in 34aff14580d1 ("xen: Remove Xen 
PVH/PVHVM dependency on PCI")

CONFIG_XEN_PVHVM should just be bool, and then XEN_PVH & XEN_PVHVM_GUEST 
can select it.  Then it can be disabled for a PV only build.

I'll send it out, so you can evaluate it.

Regards,
Jason

