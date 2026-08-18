Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F67C5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:19:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393523.1632342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE6g-0002Px-HT; Tue, 18 Aug 2026 07:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393523.1632342; Tue, 18 Aug 2026 07:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwE6g-0002Pq-Ea; Tue, 18 Aug 2026 07:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1393523;
 Tue, 18 Aug 2026 07:19:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wwE6f-0002Pc-ML
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:19:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwE6f-00EBKC-33
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:19:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a840772-8faa-0a2a0a5109dd-0a2a45059c0a-40
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:19:32 +0200
Received: from [52.101.57.65]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a840783-4cb1-0a2a45050019-346539412227-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:19:32 +0200
Received: from CH0PR03CA0241.namprd03.prod.outlook.com (2603:10b6:610:e5::6)
 by CYYPR12MB8702.namprd12.prod.outlook.com (2603:10b6:930:c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 07:19:26 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::86) by CH0PR03CA0241.outlook.office365.com
 (2603:10b6:610:e5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 07:19:26 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 07:19:26 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 02:19:25 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 02:19:24 -0500
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
 b=TutpTAnYnGAsnHKdI49DyZio7gHiov0RJMxqY8U4guIGQynuoMW5TDJGcxFXqpFP5qj2O3bOfbCQOgM2+SLJ1/YOwFWY3rnGsY1ATWsVbEq/ciR4AjTQorIVCek7Dj1EeAQ3NJxt//AXfxbi9NmKQUwH7l+hN8LgkEpiL5puU4eQTz1TEHQgQpfWjk5TgG8WI/PAcX15z+g50eWzI0ZneU4IS1Yb9ANP2e1NrKlzq+ZBgrp87M/BIs4GC3I5+UwoU8rMdo8BP0qjlAhg8s5I85hkgTz7n3f14/FHZHtTz4yrRLA206sejW5kZGl7MhmuEDf0lSp7bKNJGCjj5AXelw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9P0gGPgWpneLVxUs1PK1OcKo3ZL9EA+X6hbK2ABu/ow=;
 b=WKAgA8qJCC2aIPEMHQtIcBoqto2ZNfXSxQz5uc8NzX53+BEmNCpYrFp0r62wb8iCefv7b/68cZjQnSHzrJTa9bNGF+59Avti0IrrnacHX1XbJYI+gI42NEdjMMwpBkG3jUK7n7WDDhixGCIRVR30DlLM5Foq6q2OtBWqA5R/OT8uHYFC8MzGwxjdaTOUMTwVdgSK4luFTmCWf+eSU4Or1ED2DM3FW9KLenA4J39fsIpxiS4BPLTiGrgIH/mDKcEJAr2Ejyp4qp2R85pIsg7HZzG8dZFD9iFAAbbqZqB/SeZHdA/eVgsTapIrJHs8v9ATHFUCOF+sJQLS2/Igs5b3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9P0gGPgWpneLVxUs1PK1OcKo3ZL9EA+X6hbK2ABu/ow=;
 b=GCACG8GQFZBfGJ9f0wRoi9h+5GlC7pyfpAKuoc0lPgEs9XXtZBCgBLqOWdarB45+yoegQ9eAewMgKGXI4KAyHXsL69cWtyxWIu8xAIIrUp5sUWpHdpICSUbkI83OpJRO0Jv8DFC3KYEf9PsAHU3M867D1J0zyGaGW8lh9dJvPC8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <6351248a-e923-4e76-adb1-596224417f7e@amd.com>
Date: Tue, 18 Aug 2026 09:19:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: add myself as reviewer of i.MX8M
 related patches
To: Wig Cheng <onlywig@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, John Ernberg <john.ernberg@actia.se>,
	Peng Fan <peng.fan@nxp.com>
References: <20260818025224.4165503-1-onlywig@gmail.com>
 <20260818025224.4165503-5-onlywig@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260818025224.4165503-5-onlywig@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|CYYPR12MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: 2406e876-0da5-4c89-de44-08defcf90909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	J0c7njDboY9GW+Pq3PVyc4IUEjHo7C5Sw0FtGaNzIKdNeZouHIYuCjVb8QkJjrgFz5UbWY1GhQtY6DY4LMlA2vP1P3Jltp6s4OWp49mEw1F0l+cDq0sbUeLsgEXW9a5iqzH7FfvQvx8v+dmFOeFOPNhY6qEILaffLfi2kpZja+jZ9rdIQIy3QYguwgAGLxXkWl33nhLtuz3jwkDRwNnv77AKGYOyL0zA4oTZHemDSvl+o3DAxf1noJbL/Ts1THeN1sQLfO9stVUV5u4ezL9pgix7KaslwjlhYpbY6oRQ9oWNz/vIWFwEy1EbzsMz4i08KbCUOFIhWHRVHwvZZvlkH8vMIzvzycEbolVRUhJlhO7Fy9TkJHHjbvTXWTqoR8M+p4i0HqDV9eJrG8+HYJ8U0iIFGTOuiCzaIG2NBbkWhqj1mauteJybO9Cy/Y2KRr6X+qjSn1VoUwqw2JNN8cy2yW0x/kePovi7QrX1DLE6Xc4koZYR41onHwbdrqKFYveVIk8EkSlXpJqrrPX4TaFKwe+k4JCnal1ZK/9MppmYHOeJbRP07tRtRSRgaUqIJJxZG+81/tSLVOqfQAuMMty2zvQVc5YoSAY8eg86oEw0MlQ8q8Z+EhY3QP+tuBpycymIxp0ovZ/wtvFM0r1gW0zWVpQJvHoTOIkOecWsu4M5g3PCvbcMTeZb1sY73IwdekJvdR3omcdsGzt2ZtMPYOh1Ug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BnMappz3JoMfRPfd0H3WZNb5+GbBEBLT+qWSz4sQSsFTOEeBWO/UYvHsqRMGkrgRqGZ3PiiP9zrs0Cn0oqXikPP1BNHCH1gcM1o+Q6LMizyLjVUNi59/m0Bv4SwHEFiUqbMZsIni3pUzO9K923lOhh9YFvdsAMnKfne0n6/IKqQBNjuxsnMgR3yc2Le/mI4KXsEWjxjcurL/PuQXcsx75/yi2AqO0wNel8gW19H/P0tm63k5gl+bdrN6f9ywfC+ewvF7wzUKAOvDmvnuOL69Fox5PvOlYZZzb0Qcw7Y7ool5mPXRMNhTDWIG8HEdclzdgy1VrkS+rhj2BItc99MT9s6LTxrA5Jqb4bCYuXC3kKV4NSxDnjepfrw3W5VLqO/d5l1s2pYg7h4DoIijFNblQShpndjKA3CbhSqzVSYux7MUPPfpoGGUVNJGY1bVhBJ5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 07:19:26.1575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2406e876-0da5-4c89-de44-08defcf90909
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8702
X-purgate-ID: tlsNG-c201ff/1787037572-24D1E2A1-D6589C2B/0/0
X-purgate-type: clean
X-purgate-size: 258



On 18-Aug-26 04:52, Wig Cheng wrote:
> I wrote the i.MX8M platform and UART support and can help review
> patches touching these areas.
> 
> Signed-off-by: Wig Cheng <onlywig@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


