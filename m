Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836E7C61CE3
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 06:24:11 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399052.1635260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wykZZ-0002OG-9D; Tue, 25 Aug 2026 06:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399052.1635260; Tue, 25 Aug 2026 06:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wykZZ-0002O9-5w; Tue, 25 Aug 2026 06:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1399052;
 Tue, 25 Aug 2026 06:23:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wykZY-0002Nw-BX
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 06:23:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wykZV-001HsD-TF
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:23:45 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8d34ed-bab6-0a2a0a5309dd-0a2a450cd374-6
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 08:23:45 +0200
Received: from [52.101.52.69]
 (helo=BL2PR02CU003.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8d34f0-f479-0a2a450c0019-346534456d20-3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 08:23:45 +0200
Received: from CH0PR03CA0090.namprd03.prod.outlook.com (2603:10b6:610:cc::35)
 by SA1PR12MB7444.namprd12.prod.outlook.com (2603:10b6:806:2b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:23:40 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::91) by CH0PR03CA0090.outlook.office365.com
 (2603:10b6:610:cc::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Tue,
 25 Aug 2026 06:23:40 +0000
Received: from satlexmb07.amd.com (149.199.90.133) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:23:39 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:23:39 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Tue, 25 Aug 2026 01:23:37 -0500
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
 b=Q50lXs27T1iuc+qqZSwZqfAYqKCFngoqRAyFST/Lw0IYHdyP0DBcMaGlrp3ieM70SsKxV7oHuIqj/YHQdOEVgEPEmKgN0pa0uxLRVnEBPEiGDAXq45rha1dUSJmOB1kLMLv+x17+TDbN3BhfXnwCskbSVttoyvzx/8J2tn/SMyba/dRS5oI32zSUIquNLV8KvS8lTFm/JplFnq417SKaxPFOAjUMh0G1R+jrZOxyqn6I6XprRleJ29VVuj5bZWwsmOS3R6mwD5wsY8FbUuSF/FJTCwjw2oZQzBNqmoW6VcWr0Dsanhm/3uHUOZS8NHNn4jkm927Vt0/X2Uq9cvEAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IeCCh4kl9hMtFac2eqyAM41Qpl9zaBARN10w+J2uS9I=;
 b=C3ncx6cfHQr5BG32krzz/+MAn/YDbFfsOL7huQJKvIVX103ILFZ8tDi/CElrReyWalb9vq8PUK+ZRygMLhrPczf7Obu06w6p4z7O7NJj98Jef5IuGCS+0qnqVlC9uG0V/RM6NPGjXLcFUj//4LwEK8N8GnVeTHH21ASPkh4Yn3rEzRET0JkEl+7diFz9rijolmSN3LjRtFZJQTXiVKknt3+p6cDAwFbc9o5U2aJXDdkLWXgO6sH/gyLDbE27UB1rNNjv1lp7ZpeOEbhO1XzRhwsHR3JWbEGQEzbHGq2un9ucRhq2Wwxa29Bzh5ypnL591m1JDoQo6ExYDNARclaF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IeCCh4kl9hMtFac2eqyAM41Qpl9zaBARN10w+J2uS9I=;
 b=VBX7eOZZOqKRSfuMJe6KXDL7/omU+NVmtmEebGi1iKpAcgQaNOopY5JgSjxnFHAoRcCeVmBHYS/A+WPhmvpjq/ZO9931yk1aZwaquPG4EnnYLj8uYhIjrWZxBsiYsVomqUuJAR+u1eyfRsnGAXxw4EBmv2RNEkkHKJXcR/kZKtA=
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] panic_PAR refactoring
Date: Tue, 25 Aug 2026 08:23:27 +0200
Message-ID: <20260825062329.16762-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SA1PR12MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f701afe-2637-4346-f2f1-08df02716793
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4nM+G7FXB6kXsrWjTUNdBwsTCDSOb+MgSahHaz0XXhH0uSV/pENHeQWyOTGdKyPAgulxyorZ+IMn4Qld2TrUOTYzaS6uoahQOU8JE2m1nMHcNGtSdiB5CHxdMBn4LM+nsiJOCD5zTDhySWqB+5K9FbrsN/DqtQ6FpM4hWow+ZCvv1HcBZ4qzdHtuQaSuIbU7j2N+/KukWH95GQhBBSg90OFMKO9o5Qyjvf67rzL3JH8Nmq84LBffbPferXNSEIadJ3LC5un1g0QSCOfYKWs1AuvQhIDmpWccPYbkJxDWe12gtGKIYqRtiG+U+pxbTfNO52VeePLAzf4PsJOOy7hxep8lLfaQLvhajiXF1ncbGg4mytszMVBYF45QqmqfraZpYU8O4lxbrfbZYVrxAb+cupjnKqwrveuJpj7EEsnImLhmjfdHSlYBVjusKnUmst73LFhC/YG74pXMcH6EEpnyRG5NOkXy/QjRqZH3xQ/wlZh6Aw2Kh+D/SGpM7dZUWKZC8QoEbJ3EhSI5kyVT06rPw6+x7eyXwZ+kAnC8PHfVsvny4ir1PbnRZIfOWWnUNb5c38QRuWecWS/mikzjPfst5vwiNkmBD5RAN6P46fKWLtWWKwqp1H1e9ucgZOWCnVG4aZuvABbql+pjPIDDv9jdNUbyJIqzGse8fmbwRQ/liKURoT/2zLu9XdjgLPUdNsG2ibKy+BhI6iPL41RVF9epPQ==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	14JvVfqsgzZojymRqRfaeK8P1Ybq9MN5vy6rmLI3C1rUOo+p5KDoQ6vGVIm64ur9epMv/T8us3dbXbRX10z1RHZdhxdmBiBSa3PsTEf2or7lhrhNcl1PE90MiLL1FSW2Wb4Gtb590cNX52udj74XX7m8lTHAVbBzgfDTgC8j+YDajzwO+rI5WP4rptDR3bk19OLmbOjx9PhiSulLwkp1aUEkCFW+vOK4d1Z1lANSuLNGxaN947YI8vPKTIpog9OGSePGKDuE2Lj1MCvwcbAiM4iL/Jqdj4GU2IwFVgvQznwo/qDKmfZe3zhEeGgWyKGIBS/ALyPj31lQHbVeXkAp0tGiH7ofSg37nBLqdzaAzSmRCVHZkKLhlSxmLgn6hzG38/GSshzsTqPR6fZbRKJLAlJPyyuaVqNVDhAzo46YTowB7etWg0DzGXDVOY9y0obq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:23:39.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f701afe-2637-4346-f2f1-08df02716793
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7444
X-purgate-ID: tlsNG-d25034/1787639025-51B35A5B-ABB7C8EB/0/0
X-purgate-type: clean
X-purgate-size: 334

Michal Orzel (2):
  xen/arm: traps: report level 0 faults in panic_PAR()
  xen/arm: traps: drop unreachable stage 2 decoding from panic_PAR()

 xen/arch/arm/include/asm/processor.h |  3 ++-
 xen/arch/arm/traps.c                 | 25 +++++++++++++++++--------
 2 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.43.0


