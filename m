Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCFB5CD4851
	for <xen-devel@archiver.kernel.org>; Tue, 19 May 2026 09:37:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312673.1582740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGtP-0006Zg-57; Tue, 19 May 2026 09:37:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312673.1582740; Tue, 19 May 2026 09:37:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPGtP-0006ZZ-1P; Tue, 19 May 2026 09:37:39 +0000
Received: by outflank-mailman (input) for mailman id 1312673;
 Tue, 19 May 2026 09:37:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wPGtN-0006Xj-E8
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:37:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPGtM-008mum-LH
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 11:37:36 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c2f5c-e002-0a2a0a5209dd-0a2a4508c7a8-6
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:37:36 +0200
Received: from [52.101.193.11]
 (helo=CH1PR05CU001.outbound.protection.outlook.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c2f5e-63b5-0a2a45080019-3465c10b511f-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 11:37:36 +0200
Received: from MN2PR19CA0068.namprd19.prod.outlook.com (2603:10b6:208:19b::45)
 by LV2PR12MB5870.namprd12.prod.outlook.com (2603:10b6:408:175::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 09:37:31 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::e4) by MN2PR19CA0068.outlook.office365.com
 (2603:10b6:208:19b::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.26 via Frontend Transport; Tue, 19
 May 2026 09:37:31 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 09:37:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 04:37:31 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 04:37:31 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 04:37:29 -0500
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
 b=QRVprQEOaVLNkPacXmavgq+OU1seG90wekh08L/SD2y/V2GujbBAipJ+vjv5iQ1E2NrId0mzxsg6kHJ0bpPKvhVSUVn4zaXzvhlV/9uFesMtRkg6zR6+8P40wqHs/JeyOtPNaZ8rsXtUz5lK+bpj2zjTMGdR50BJXO0EpVOvLWGZMDpe9EaUFpwpp/z6TCDtR/J7U1xJ4k/yX7HUreI7Ijqk5WGiz1ZWW6pbHNuh5KfkDxtqxMqUIbPO4ZGbLqcnoEfOsi/ftJXtpYzohBC2oYTDXeheor0XKsYZ0uySE9e4bkW7atv/qAc9gEta8gohFXgdQkXbEfnQUoCbQzdqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuOv5HfDcvhsI0JVCdIlwkh2QgMA4dOvBo1NQZ9xx2g=;
 b=JfV2TWZgxRts7zLbgj1VzoRb1G1WTrJkL9TwUJX/8LzEXTkwRx2EAFvyxMWs3n6y92Fur2cucjznlt/dAE47+Vo+23a/yS/YasoaOo50YRMnNJcTf/RohiXZhrsA5q6rz/8bMt8kdkItgcM1VgO922Vg+4zjit7hANUm9TBSBNy7jiwdYxdJAkM/qZjyGqwWqqTjE/9Q4UAFhseXA+D6qxvchk4asZfcLMyihBCyTrR2O0/afe5sv+jWwRUaMdUR9Qkh365g1YgV2f1yFmy8JGk0xK8oHyuFZxXxUQ4+tMsgOL3JIJZeogZMF06K+1A2/Rx+pt39sCv0rUqYGnrIrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AuOv5HfDcvhsI0JVCdIlwkh2QgMA4dOvBo1NQZ9xx2g=;
 b=Ybj6wluNx0pp9ofI0Wbal69DnIWhJYUFiT7uLWcJbe2bjqEOHdJqFixW1aNRHTmx30DpL3Pxdldsz6zMFyS4N5YE06VjNynvMxA3n/cN92AqTXYvgghOWhmlY2FnNdTyu3pT4lx5pM4059Sy8KN0ZYZ42+vNDC6K7FCyiHsAQuc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <8ade5ff1-a702-4a91-b596-a98833716c20@amd.com>
Date: Tue, 19 May 2026 11:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] xen/libfdt: fix UBSAN null pointer in
 fdt_property()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Baptiste Le Duc <baptiste.le-duc@vates.tech>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <cover.1779179301.git.oleksii.kurochko@gmail.com>
 <0addc679de64cb59b28cf49ba3d39d17443d1ac8.1779179301.git.oleksii.kurochko@gmail.com>
 <ca61a607-2f55-47b6-93f2-c25079dfd88b@amd.com>
 <e943765c-45f6-4802-bef6-e2fffd49149e@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <e943765c-45f6-4802-bef6-e2fffd49149e@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|LV2PR12MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 9291a555-0827-45d4-f68f-08deb58a3fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|11063799006|4143699003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZXDNwONUXgX3WCI94RFD7QNb773TI00wjEn2fntZ71nmveAd6wmOsCadeB6sTrMX6x6vtdD6k7Uo6pNjfay2egSfs9/q+3oAc+Zawl5GaIVEv3YHUA0DQp6IpEl1DFBoNV5lYmSwXZI8T2t75OhYqar9hbqxrLkSdob/qY4R0+4JiXH05EiizGxtN/bJX82ABgg9ck2Z+fJ9mKRIV24yU5FC/ZvhI/gdMDKS8u/txIqibHDJ86ioKbRDCCdPUG4FfmmTGvZCDEzxYEZLrBjS+OBw3sFD5c7CBF6ra1D+VKyi7kwFLo4ezEPAZnkatjzofxg/AVmLkb3NEq1eiDyChZycPYCdZMq3ivXjPrhFhohAlDkaNKZFam+knuvk71wzAMezLj3cD2MdbDm80ABFQXzMcgB76r9gcKCJDGNYDEVbhIBLXerqskLD5izo9BuS6y684lKFWUzwPeAAOGjutLAJesv1Eq60DBaXBqgYEFowgYgmTKWgJpIkvbQBNtRZ9EUayqncjdJnS25cXxPuTNM2+Rl+MSm0K3x2n+E7vMc8V2O/AK29mE2NOhnc5Ll2E9l0xBruCMO4HokDBR9JqhUjtH2NM4fgJELBfA5H5X9oE3Tht0j+sZ2JYOQBtgtjMYd6t2wPhgt/Jl+GRjCSGDG2wz1LfF6s3uHX7yifNHwyNLL2ZvM/3AKy+CO28BfVWSyWoQ1qbfJVge5eAsqPitgGSZDCGEFRekHR9XjTzDs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(11063799006)(4143699003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U2ecZosUZaRwz4eSkkMNz9I3LOWFcdMpxSvwA25KDFg5M790w1f/qSGajbwkXOyYwratZRmxmmqa88pjuGcoLCsbQAW0z19IkqPTjkko58kz1+8y97MTRZmNk7JKJunCcCZLml1uBu1N/aLcJ0XiSDY5m/KPuORHT/dImLxRz0EWSBoRdoIBxBeLkmcIE1pyfsmu+FpM7mUoTFHe2AAJxzdelw2kyEiNy2sS9fEdYW7Qx06yaZVsZdVCfmEzxz8gjXrd+SxuXbZgqN/AiLrV2m5jp9oc87NUBHRr4ATdtRA5Rngv01JJaES7txoGp5vSC13VOMUU2IRfegMXJA7MPlD8wPA6e7QBwdMNcb3Wl42klxYU6PRyuaRMucP2eUfqZ2Gyq2N864eaJMgJr+2F+moUqpNQ3+ppOW6x+A4rXfc6OKdPHoBfWDPlGimE6nhr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:37:31.3540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9291a555-0827-45d4-f68f-08deb58a3fd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5870
X-purgate-ID: tlsNG-c1860d/1779183456-BC766DB1-240C7391/0/0
X-purgate-type: clean
X-purgate-size: 929



On 19-May-26 11:16, Oleksii Kurochko wrote:
> Hi Michal,
> 
> On 5/19/26 10:49 AM, Orzel, Michal wrote:
>> Hi Oleksii,
>>
>> We treat libfdt as external library and we don't accept any edits here prior to
>> first sending a fix to libfdt and then cherry-picking a patch (in fact, afacit
>> we then do the libfdt version update).
> 
> Thanks for clarifying that.
> 
> Just to be sure I don't confuse something.
> According to the commit ...:
> 
> commit ad9cf6bde5b90d4c1e5a79a2803e98d6344c27d7
> Author: Vikram Garhwal <fnu.vikram@xilinx.com>
> Date:   Thu Nov 11 23:27:20 2021 -0800
> 
>      Update libfdt to v1.6.1
> 
>      Update libfdt to v1.6.1 of libfdt taken from 
> git://github.com/dgibson/dtc.
>      This update is done to support device tree overlays.
> 
> ... I have to send this patch to git://github.com/dgibson/dtc, right?
Yes, that's the main DTC/libfdt repository.

~Michal


