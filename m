Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0183CC88E73
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2026 14:33:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421015.1647194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x67k7-0001vA-4x; Mon, 14 Sep 2026 14:33:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421015.1647194; Mon, 14 Sep 2026 14:33:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x67k7-0001v2-1w; Mon, 14 Sep 2026 14:33:11 +0000
Received: by outflank-mailman (input) for mailman id 1421015;
 Mon, 14 Sep 2026 14:33:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x67k4-0001uw-Pb
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 14:33:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x67k3-00AEEo-OY
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2026 16:33:07 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa80597-2eae-0a2a0a5409dd-0a2a450a97a2-40
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 16:33:07 +0200
Received: from [52.101.57.32]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6aa805a2-f2d2-0a2a450a0019-346539202a16-3
 for <xen-devel@lists.xenproject.org>; Mon, 14 Sep 2026 16:33:06 +0200
Received: from MN2PR14CA0018.namprd14.prod.outlook.com (2603:10b6:208:23e::23)
 by BL1PR12MB5826.namprd12.prod.outlook.com (2603:10b6:208:395::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 14:32:54 +0000
Received: from BN3PEPF00022BCB.namprd03.prod.outlook.com
 (2603:10b6:208:23e:cafe::68) by MN2PR14CA0018.outlook.office365.com
 (2603:10b6:208:23e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 14:32:54 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCB.mail.protection.outlook.com (10.167.248.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Mon, 14 Sep 2026 14:32:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 14 Sep
 2026 09:32:54 -0500
Received: from [172.20.10.246] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 14 Sep 2026 09:32:52 -0500
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
 b=P7mJTt209GHhz8k+14/GlHVQtav9EV5QD/AmEUw7pA2KOJ6IYICIMgM4NPUVA5TzFl8ybRmY4+wpuI2Nv3G9F55iSmQPaoZLgoaM490z8JYaYPwTHMu2m4b6shxjPLvmBwQCB50BNOtO3aJn6x8gsskwJ7Ps0DMa3rI2JZVjiGgMONWj55hdaDSYfB/xMZkjJBQYXQlIElbBlwJ1og275nZUenMTrN2RwY5heXFafpPhOPbzb4vHciAMbVnwLX3A02eSi97NwcTFX1Q2fGi8xyRbeJV4joGIUHOpY82CylbdkFiP9UT2Op2l2SwQIvNWl8JNHjf4WPks5vwJ+hkkCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jtEkKwmNvCfF5torAU4XaBwSUSR88U+gxejZ7gt4JHY=;
 b=YYH3QM+sns6pFxV7FqX0G1taFgb2a+MqxJK0y2Du/jY/GuYYftGCY+kGuf54ntOPjdm1zoKgRCoQY2EK/FEEVif52+gPjpXpXx8ds+S+Txy5H/qSxBeDar/JaZd3o+7az8AYmKImxhLexal4f+VJXb32zENX3XLFiben09RMZAPIgB6Jil2RYZMvFBpHcYGONrJHwCrr0SUerxIMGxSFOlGrX0pFTbxgPnXogFJ93akp7zxnaBgnZueByStMPceyg5G38bUs628QVdFDM50vACWgobRHSARXXI049O7BplkeSZeUJ8iWow794zWhOoWoQu5gva9sxy9mb1QlxhHWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jtEkKwmNvCfF5torAU4XaBwSUSR88U+gxejZ7gt4JHY=;
 b=nZ+HRRbEaXBJfD4QD06Sx39peqLbIP7VwNBr1Ckqw7FAewjMma41mowoZD4HjzoNQf9hGZ0XMQ5DRAYfU0rYxfDzkcUHIYYSmgQXjsbl1O1BzEVWV/fP14GxFxUAwI8XzArUoXkDcn9yXs4xk2KPtT74+aUmzbHEyysRRWzeeLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <e3125438-fc9a-4358-b201-5ae320cfc6df@amd.com>
Date: Mon, 14 Sep 2026 16:32:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 01/20] xen: introduce CONFIG_HAS_SHARED_INFO for archs
 without a shared page
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Romain Caritey <Romain.Caritey@microchip.com>, Baptiste Le Duc
	<baptiste.le-duc@vates.tech>, Zheng Zhang <zhangzheng@iscas.ac.cn>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
References: <cover.1788876411.git.oleksii.kurochko@gmail.com>
 <e7a9fd1c4bac8f2dc635423bb4d038dbf0fc4ada.1788876411.git.oleksii.kurochko@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e7a9fd1c4bac8f2dc635423bb4d038dbf0fc4ada.1788876411.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCB:EE_|BL1PR12MB5826:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f73f0e-70d0-4848-2772-08df126d1085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|82310400026|36860700016|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	mkPuD9TrbEdT0uL8rNE8XAjXs0Y2tsU8dkp0ol6N7fvggbtZWqrnqmPA30oiqGM1HEir77OHXSuAQ7UmzxowgBhyIuRJOTP/wTtyMkzHlePrBPh/JWtPKQiDu687CK+oMnuPTmmLMRxtANdCfssxduBl2Zw6vUJKlZ8td7EEm0vn16pE4HCOjdTOuMEuOQJHEd3MVrNC3olZFRncX6VFNEf+RY9zggWVjirXqdvoZy/xmwpSTLz8gButayglEh9V08giw/Xh2GR0S/3DZkd9926y+Tjbs+1AjZfNpOEwb0DaLLRDxRUaEbSbGhsCPVuNcwx/2WMywArDuTk0P2ulpoVQhR8F70txfICIU3dCfOB2/ghrZsmFouacgOak9ruR+11ToS4c++wZ9asWAH9FCuX4btGKgYV/9bIlIv0ehJw38xBL2Gg6UWehzqh2/OQ7PT+Farbh+LtUrrK29RzdqG4sPMAmRKODZop0BpNzF9rZd/5NMK7uy6LJ6/IwYA6BjxjSyL+YDJspn/8aJ1YV8yhR6Z5fXSN52a5dETyyWmufmYgnWcr2e0nXZuLYfCKJVPo99ZLum7+p1k7BfKYJO5FNZIQLgGV1bUp3FecPZmAj9ASK60DuvDfjGCdG+9LvHCa2vWW5vtleNpHa1VfYQnGNTCb4CChg2jIVAKc8UVLTHfdsElqA5NIE88dD8X0l
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4rGSga3CxuxW+HV1+EYTt1PZGFG9LHLiRQVWZEmvI2MPUO8c/8Ch14vQHCz6nnhjkbl3VfI4ee6uF46SIMeSyfQdM5bSqBdTiLR7b2ND1ykd5I4dKN0ivGEaM0MdHcqk+rDdAcSir8u9vPVb5UOOumteyxX2E2BbWGJu4JUJarMMyRK03CpMZ+J/uQWTfxp9JkKaNguy+C3Fv7oOf3lfkqr4pJU5EsCiVazrx42j5Nw6f3UFD9T0Cg/W/YiW2fVAeDNtjXvfWFxxbtTxbt7m11ysIiL8sN0qi3kbG6ju9hVj1ZZDcof0StnVhdSmk4m4j195RNdukVGtz3tl6hEZ51OqoOTTBYUhn9aqOQXXU0l9Ix7rowsX9nMzXDeyNuuNVCUPTUXHky5cVgM7Wwv7dY+r67mz2mNLVrpUO9Erdd9AdrNyHF7AoWP2K2CGWdeV
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 14:32:54.7360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f73f0e-70d0-4848-2772-08df126d1085
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5826
X-purgate-ID: tlsNG-4011c0/1789396387-506CECFC-669C85EE/10/73395122804
X-purgate-type: spam
X-purgate-size: 2801



On 09-Sep-26 17:07, Oleksii Kurochko wrote:
> On architectures that run guests in dom0less mode without the PV ABI
> (currently RISC-V), no shared_info page is allocated and d->shared_info
> remains NULL throughout the domain lifetime.  Several places in common
> code access d->shared_info through the shared_info() macro or directly,
> causing UBSAN null-pointer errors on such architectures.
> 
> Rather than adding runtime NULL guards that are logically unreachable
> on x86 and Arm (where shared_info is always allocated), introduce a new
> Kconfig symbol CONFIG_HAS_SHARED_INFO selected by x86 and Arm.
> 
> On !HAS_SHARED_INFO the shared_info() macro expands to a dereference
> of shared_info_absent, an extern pointer that is declared but
> intentionally never defined.  Any use of shared_info() that is not
> dead-code-eliminated will therefore cause a link-time failure, making
> missed guards impossible to overlook.
> 
> The 2L event-channel ops call shared_info() and must not be compiled on
> architectures without a shared_info page, so event_2l.o is gated on
> CONFIG_HAS_SHARED_INFO.  On such architectures evtchn_init() installs the
> FIFO ops as a placeholder instead, so that a later guest opt-in to the
> FIFO ABI via EVTCHNOP_init_control has no special-casing to do; if FIFO
> support itself is also unavailable (!CONFIG_EVTCHN_FIFO), a dedicated
> no-op evtchn_port_ops_none table is installed instead, so that
> d->evtchn_port_ops is never NULL.  evtchn_fifo_word_from_port() is
> guarded against uninitialised d->evtchn_fifo so the FIFO ops are safe
> before evtchn_fifo_init_control() is called by the guest.
> 
> With CONFIG_HAS_SHARED_INFO=n all vCPUs fall back to the global
> dummy_vcpu_info, so writes through vcpu_info() could leak data between
> vCPUs. Reviewing the write paths in common code: the write in
> map_guest_area() stores the constant ~0 so nothing serious would happen
> if it were leaked; the event_2l.c paths are not compiled on
> !HAS_SHARED_INFO, as event_2l.o is gated on CONFIG_HAS_SHARED_INFO; the
> write in vcpu_info_populate() targets the new mapping buffer, not
> dummy_vcpu_info.
> 
> Outside common code, the remaining writes are x86 PV-specific, for which
> CONFIG_HAS_SHARED_INFO=y. No code changes are needed.
> 
> Finally, struct domain's shared_info field itself is gated on
> CONFIG_HAS_SHARED_INFO, as it would otherwise be a permanently NULL
> pointer: every user of it is either arch code for an architecture that
> selects HAS_SHARED_INFO, or common code already guarded by the same
> Kconfig symbol.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com> #Arm

~Michal


