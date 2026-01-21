Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531C2D262B5
	for <xen-devel@archiver.kernel.org>; Wed, 21 Jan 2026 14:30:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1209828.1521747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDv-0007Nv-0c; Wed, 21 Jan 2026 14:30:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209828.1521747; Wed, 21 Jan 2026 14:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDu-0007KQ-Pu; Wed, 21 Jan 2026 14:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1209828;
 Wed, 21 Jan 2026 14:30:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viZDt-0006vP-GP
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 14:30:17 +0000
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170130001.outbound.protection.outlook.com
 [2a01:111:f403:c10c::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3667767-f6d5-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 15:30:15 +0100 (CET)
Received: from MN2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:208:1a0::20)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 14:30:09 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::4) by MN2PR07CA0010.outlook.office365.com
 (2603:10b6:208:1a0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Wed,
 21 Jan 2026 14:30:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:30:07 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 08:30:01 -0600
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
X-Inumbo-ID: b3667767-f6d5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=esOxIYS2LiIhmNk6ZshNwIWIxf2PphzNLZHbgLkU+kteLXNfdX7lB71+ajvS1ftfl+aqmQWpduIjMUZuNOAYflqY6PmX7zc/04SyYdojAJ7zSYaMd3ymo4rImXEjSdBNH45LEuTmyjHbOOKiBsBQ8fTTLVE5Rl3MuMbxFgN/yHaV9rzmdS8gmCc39UvewnsDuCFpNFH9H1QSAYHjkMsJ1XCqsDRIaTJnwWaKZ0bQnMU8BY4Ig/SiDmWSzpRyNZFwzS0yMCCxZYqUImif+cPHkZsgM5B9388d9fdvFml8QvcW1ZDS2Ihi1owqzdD8KaNjbIwPHuKocy/i/uXmYHQItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQaQz/co1dWKOQJegRLRV/x0sT/NPpp7Wh/Pk2meZ2I=;
 b=BiiWPQivei4D0Ht/IIJxMqJ00zd3mGw7QhOnGsm9Fqj9d5Y6Rsyk8/beynKXynnPFjlE8kKMoREVjz3bjfAhrT8RhWLP4JpE4LpedJZ93113hfR0dsNNQvCmC3oq6mFcS8tx9ILjjCO+f/7sqkOE5szKG9NeXm3FCSlRwDKznqlcyMFcfEcVOOKXP7mdIQxo6qUe+Xd/UKwpIHEJ2a16LB9cWFe3UUetwBKlwvSKB3681oXGiJN2+n8X5APFq6FqQX2tGxDaDeH3S4j7AFkbuLfDW6irxXWUBDzOgGMAt6bjSvWMrqjiw19ZJL9TClApzLPYBx+I7I3sPNMS7abaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQaQz/co1dWKOQJegRLRV/x0sT/NPpp7Wh/Pk2meZ2I=;
 b=rh1Iqpqa75jTYWNy8BTUJRXpAxOmcE9vNlNECjFyxatHQn6kbK+sEk2uH2UDYFk0PmpM+xv7AdTqp1aKztD63yCviTNoNJJgdlWWVXB+Faj8ages+pEmF887+iZE4h+yIED5Hl/1lAt42gAHxeHW3VSVEbN3Rg0aTvvsqeY5iVc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v2 3/3] CHANGELOG: Note the new SVM bus-lock intercept
Date: Wed, 21 Jan 2026 15:28:55 +0100
Message-ID: <20260121142857.39069-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
References: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|CH1PR12MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa9d2c2-f45d-4d29-0c31-08de58f9937d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pfZrC5XgLexW+KXFhPAjKP4OQf9+o3GsPLVurtuPDyzt5pdHTRtXt/24DMTa?=
 =?us-ascii?Q?YfsG1lbmlLwcQiRDROFCry3IpXQg7m192HFt4tkwkEtAfozlYGBSaHqy1Yt0?=
 =?us-ascii?Q?EoeF7uBma0dq1/BfmfVbp/1cXrIpb5KOiNumkDOhKqRBC+ZaYtb4Cb9hPIMf?=
 =?us-ascii?Q?1xW5gYEX9rYZiWzI3w35aMenmHw/D6owCk7LR32LMSB5YJt0UJt5TsjU0o3W?=
 =?us-ascii?Q?xgHHL7ewnYr7sFWl6agBI2mYdztF4jlImk+N37eOqJYVxt1bXcJh3AZBSBVQ?=
 =?us-ascii?Q?ShcqiBD4pBmCfT1tJMD/v8JRW3xJEK+KJfgslyviTaN8BrJhOWRfV9uImzvv?=
 =?us-ascii?Q?fsCbZ+qIOIV7gADLUp33stWufJkvaK/sSyTT8OVhjHdNh68SkY4Whq7nrf5N?=
 =?us-ascii?Q?E7DtoDTF17DX52DOgWtcPXCJkWr60AR3qW6RNGpjhpnN18hXYzw0DB2hgxWS?=
 =?us-ascii?Q?oH53PIyFfjdOIcMBbUxv33/ZAAf7REHKiduNi1JUc7/6sUyZJJp/i4O8WebL?=
 =?us-ascii?Q?L8ZKRVzv8EBdzo61ZXG2inXe+D5MxXHCnS0Z/AEf2wSNNp7ST1EQngdxJyxg?=
 =?us-ascii?Q?cVhjoUP9LSTJoFuZBtCbpBAGZgGI8RkTEeIMZwevuNiPTeR6kGrBeBN76/46?=
 =?us-ascii?Q?tSpeHtGZA/pzFqTLNzkoqRqkAoQdNX910DJCVym5SCYeYe3/Z9NU5eNYyU9m?=
 =?us-ascii?Q?nnPI4BcFrFuWA+AoJuXbAIhuWU0g/RGuMWz05S/9OHPlxBFYFTQ1iNL1Lv0t?=
 =?us-ascii?Q?EIbvN1aF+gtljPDMgs33I0Wer7fz1dIAuWcjPjLsJm/MNHsY04/rMABAejwk?=
 =?us-ascii?Q?ndgUZYoHbSwFVaxQOVDk6v9yLriyin9kfcESzcUKaT+P6003TnyleFaffC5y?=
 =?us-ascii?Q?b1/N8++IntRG6lB3+PbQLay3l+q/KQ4b7r/caWEdg87pBuOQtNuLYbNvBwur?=
 =?us-ascii?Q?JP/oq8Ng3yW52rDOr8iL4tOg1QB6StNee1MlATXAygiJH14n3cip0ce3uJ/D?=
 =?us-ascii?Q?oXXBXtb2KFhaIlXfVAF8b8NjnVWPQGIaUe+cc4BEJiHuUO2lYYbWQIDB/poW?=
 =?us-ascii?Q?6SnEyOJgg43NI7OTFxrqDYdbGNNmm74pEWHmnbWWHRTFhk8vKJs/AlHAk6pO?=
 =?us-ascii?Q?/W66Q1yKAezqTjJEfE0sHUZkrGn6DWRjy0kNjz1c2Uq1jxEGIkUERJWxVqpw?=
 =?us-ascii?Q?IeE9Hc0np54lqCMpiIEcOleMWwklGhqExpWGbFZaMs91fNWZE++fBbKRsm7z?=
 =?us-ascii?Q?YqckoDDppKEnKvufEE5BwFBdqbOLNlYF5Mmf/AdhG2gTcQqQtA+PexN6tzub?=
 =?us-ascii?Q?e09mYYpMGfLLKJGAAkYHXmcNa2yh/EY0+1YchZ3vU6C0rtSwhHg5EXHloHwW?=
 =?us-ascii?Q?nncRkfVspi2b7+03K4p6PVK/tZSIIfQoTAIHZk21gmK1/HNOM3ml52Zf4hCh?=
 =?us-ascii?Q?sJZMIyjbh0LJsrjxclJMIW+WOk2v7zJBMS7HRcRRJ5l6THNZze49Xtki5YHj?=
 =?us-ascii?Q?6vYcGsi2mFUnwWa/scrq74HYVOa/l7zD48Hv3tlRcvu+ZE6/7zTyxN6jlq16?=
 =?us-ascii?Q?ZUKTWP+3zUGVlMVmqAA6uxr6U2seZnNyjTdzAPBcSZfnGwr51Xn2pvHae8SG?=
 =?us-ascii?Q?RA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:30:07.7300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa9d2c2-f45d-4d29-0c31-08de58f9937d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 CHANGELOG.md | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 53d92a2597..07c1745f22 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
 
 ### Added
+ - On x86:
+     - AMD bus-lock detect, used by Xen to mitigate (by rate-limiting) the
+       system wide impact of an HVM guest misusing atomic instructions.
 
 ### Removed
  - On x86:
-- 
2.43.0


