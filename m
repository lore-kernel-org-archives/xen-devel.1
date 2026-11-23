Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3669606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 23 Nov 2026 10:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DWGVGT73
Received: from list by lists.xenproject.org with outflank-mailman.1500329.1696542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVRHZ-0004WG-4f; Mon, 23 Nov 2026 10:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1500329.1696542; Mon, 23 Nov 2026 10:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVRHZ-0004W9-23; Mon, 23 Nov 2026 10:28:21 +0000
Received: by outflank-mailman (input) for mailman id 1500329;
 Mon, 23 Nov 2026 10:28:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1xVRHX-0004W3-4k
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 10:28:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVRHW-003O7r-B1
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2026 11:28:18 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b041540-2eae-0a2a0a5409dd-0a2a4507be48-6
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 11:28:17 +0100
Received: from [52.101.201.59]
 (helo=PH7PR06CU001.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6b04153f-b4ea-0a2a45070019-3465c93bd698-4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Nov 2026 11:28:16 +0100
Received: from BN9P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::6)
 by IA5PR12MB999302.namprd12.prod.outlook.com (2603:10b6:208:605::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 10:28:12 +0000
Received: from MN1PEPF00079401.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::72) by BN9P222CA0001.outlook.office365.com
 (2603:10b6:408:10c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Mon,
 23 Nov 2026 10:28:12 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF00079401.mail.protection.outlook.com (10.167.249.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Mon, 23 Nov 2026 10:28:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 23 Nov
 2026 04:28:11 -0600
Received: from [192.168.31.141] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 23 Nov 2026 04:28:10 -0600
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
 b=tsMfyVwe6u1TQqIORm4u5CyEnHVCnYEftAQqUd0+Su5w9CDp/iW2B079Q2wG72H1l4Xos7GAW0AmggGAh51bfOLb+WyNbonMXq58hn1AB/tdefrXkRm5unDNI183jkvAlTy6JlAMJKJ7jNmxts2xt64gPU/4yIHH3MTZe7aUcyx9RiZltPsbOdEEtDkx4kK6Fs1ngIsclLlDka19Cy3PQzzse2Bvcz5lPAaO8JaNEfrf1K6uSYuUDp7sYeiQo77snv/zbXr+pi+X3dnuGI0WMlNKDvW2ZlkfS+L5LQ7jFOImuC1yIgf36CWrR8OjgbRcBCsKNYIrd9mx5R+euC3Ysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xj5kEbFCI6MDfYHUBsnFHHog4ohosZUlmGKBlr45R0=;
 b=izDDgfRpb7WYgTLxdn5qUTwMYHR2uihuxmAYdxS42P8vzx1LkOANr+Rl4aPv83wcSsP361xaCxmsK89DGn+0Swd8cj+GVvTuSgmBkuyhXrZCxjqs7VCOEh2BuDtw12GiWJ8bEPvEPp0+E7AmNK0JtifJ/QpquttULJ3QtMG0uIZYdVpcXrpZpAo8+jvNq6wwCHrlY3zYVMpxepGuvnOksmEisMuJfthLutNbkZS4hncMX4I7J3kqAcUUd5S5MACJw/3oC1UHgr1zOHTZjoAZuPkyuqBo5iLPc3Dz6Ek0QKIEtW+zZ3nnoAlt88D4+8fxwZE8zQtEYHXTh9NPhuyFvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xj5kEbFCI6MDfYHUBsnFHHog4ohosZUlmGKBlr45R0=;
 b=DWGVGT73r26JXIFHs4H+lmuQBVjKNGMRMf45I9lCbiWauxVBNBKXkVDBH7kwFgjtUsVqFPr2tdmHrIlFMmJL0sJJQeMjvjT9BoL8zFpVwyIGLXeXtB8jyE5SXmoVVb0pBtw+Hnw0OOlkBuJaOhGSNvcivXdI5AiO2aN3MDHryrA=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <0efda1ce-3183-40ad-8501-aa80437f1dc1@amd.com>
Date: Mon, 23 Nov 2026 11:28:09 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/dt: Skip non-RAM reserved-memory regions in
 make_memory_node()
To: Kuan-Wei Chiu <visitorckw@gmail.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<marscheng@google.com>, <eleanor15x@gmail.com>, <jserv@ccns.ncku.edu.tw>
References: <20261117073655.2279142-1-visitorckw@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20261117073655.2279142-1-visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF00079401:EE_|IA5PR12MB999302:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e19c92-cde2-4295-5ffa-08df494c79de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|11063799006|10067099003|56012099006|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OEiiGNGKgMOSgni0D042KW4HAtz1+zaPQ9IKzCVw4uIytLNjx1BS2qKiGCMXh3+BhrwfQpvKsQLtulrp3s8TniVUZ6K2Ekgtf70TAgjRvIRGaRyLrZdyNSkhhLAuJWOkKwIkdqGpAhB4cl0QNdVET3FLlLKILyTk2OjoB3ozGLk+JtzPLP0DocdeGazmDVPCEd8Q93RKU3hMxB+8TTUhnQPBufcanRzp0ZBxkIjdjlusyd9j0SWchCZYmCpu8WE+i1WJlALs7kgiw3AWwVHlZOOji0Ch5HX7KM3cQ6Wdp+rU8sRA8tQ1RbTX72Lq1sgFR6wCUQAfsQa8VAAwyLs1sT+i3r+WA8mRnlOjzrikrepzlYewk3AtHSGGdxwJwfXDkciMz3AJ2yX0crh4PebnYMymJ2OtxHXFctWki1Mh2q5ieC2v8TYNjQRNErKiVEtt79GKergex7Ho1t9Ftl54aYFImsGCOvPCudXIBlgmZOYnHwiV60HWnCe/cv1NZfwEQ/FFhiGoH9UXhtMLGBBc/atknPDXwcVbhZ46TIvDk2f9e475tFbl78w5Zg8khVUchGxKahFu96Dhy/DTnO9meJX/HN0PT1munMK4dzXSNPK2CWG43Fh1+oweepPgLZ0AUfSKvjwOnidumqgatQWMgpEAdmD9PbcznNtqYQ3fw8S4NDt6l3GdV6G+uaTrngF35MynLDYkWsdGIfC/5KS7DQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(11063799006)(10067099003)(56012099006)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f5sJpHsIgVi0uZ/Vrh2w8UsTLzJ/YK2jb8aySUQ1x/kDBSVdHlpDkNEtPp+4vAvAt5jswin5sGzIdFaJE/IuEkq6QoWkQRKLGpz3N6zWCwVT3H8KpCUNFAHD1boygTNVIR8s7/WB0UIG8QzpuoMED3m9YYLq5R6fL4AMpFjTg3QkC1vtXm2ASouF8q8EKGdSWBWkEQeOyr0gGlu3FUVeUFy8tY6YtE7+BkqCoADOJxafFyu/9CxA3CjkMf/7FyaSETN+65h1xC6G7cjO3bggPz13FZoTCnvPwkW3+QL6TgJN++Ssa9YlcP/KP2VsejrHLIlvlWXW5U82BluS93Cg9zIoymFU7IvQoIl71pt6MNHpB0VmoxitsVodeI3Z7JrXyIajzTggFEdw7R3PaLlKnWq465KmNR/GVZJu3z+9FL7Yi9nUmxz4TzRAXZRXxSAj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:28:12.0406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e19c92-cde2-4295-5ffa-08df494c79de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF00079401.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA5PR12MB999302
X-purgate-ID: tlsNG-ef75cf/1795429696-A50CDAE4-88B6001E/0/0
X-purgate-type: clean
X-purgate-size: 1164
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 17-Nov-26 08:36, Kuan-Wei Chiu wrote:
> Xen creates a second /memory node for the hardware domain from
> bootinfo_get_reserved_mem() without checking whether those regions
> belong to host RAM. However, /reserved-memory can also describe non-RAM
> regions such as on-chip SRAM outside system RAM. For example, Linux's
> Documentation/devicetree/bindings/nvmem/rmem.yaml defines nvmem-rmem
> nodes under /reserved-memory, and the comment in Linux's
> early_init_dt_reserve_memory() notes that a no-map region may not be
> part of memory. Listing them in a /memory node causes the hardware
> domain to register non-RAM addresses as system RAM, conflicting with
> device MMIO mappings.
> 
> Skip reserved-memory banks outside the host RAM banks reported by
> bootinfo_get_mem() in make_memory_node(). Skip this check when booted
> via EFI, where bootinfo_get_mem() only contains usable memory and does
> not include reserved regions.
> 
> Fixes: 248faa637d2f ("xen/arm: add reserved-memory regions to the dom0 memory node")
> Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


