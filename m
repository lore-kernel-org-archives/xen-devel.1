Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1993C5DF9C
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2026 06:24:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399054.1635278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wykZh-0002qI-RL; Tue, 25 Aug 2026 06:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399054.1635278; Tue, 25 Aug 2026 06:23:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wykZh-0002qB-Nk; Tue, 25 Aug 2026 06:23:57 +0000
Received: by outflank-mailman (input) for mailman id 1399054;
 Tue, 25 Aug 2026 06:23:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wykZg-0002p7-Ct
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 06:23:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wykZf-007bIM-Dy
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2026 08:23:55 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8d34f9-e002-0a2a0a5209dd-0a2a4502ecf2-10
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 08:23:55 +0200
Received: from [40.93.195.6]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a8d34f9-6ca4-0a2a45020019-285dc306d149-4
 for <xen-devel@lists.xenproject.org>; Tue, 25 Aug 2026 08:23:54 +0200
Received: from SJ0PR03CA0165.namprd03.prod.outlook.com (2603:10b6:a03:338::20)
 by CY8PR12MB7100.namprd12.prod.outlook.com (2603:10b6:930:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 06:23:44 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::36) by SJ0PR03CA0165.outlook.office365.com
 (2603:10b6:a03:338::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 06:23:44 +0000
Received: from satlexmb08.amd.com (149.199.90.133) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 06:23:43 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:23:43 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 01:23:42 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via
 Frontend Transport; Tue, 25 Aug 2026 01:23:41 -0500
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
 b=lYSiyxEm/tT+8AbAVSiXaCS5HqCqek/ylawjTIenGgKXtGz74fs/jAOQ1oV+KhExLgzHOzNfIH96n9prtYG/PflASEOkSB4cNlpy012MqBQInWhA2zGFFbEF0ZrGXKoadsieBCJn5tt5iO3Bb8J7+VTsv1xNeC+zMXvr5xUm4grSHT119ZPIuPKrxEA2WXGNgOmvewr3UjWRHmMmyFjc1okgoEjLbzGkfRX8knnCYaMRmeZYNs6GqlOSdLEIXW71a1qkurK6OJhhfa/IZwgQWKYbvCvFUSMIcSRA3cd941yHi5dRY1XCFRIkark0jC4A2DUy63aQ4xs7yWgrDky+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4jxQvxAE1oi5hVrdaQxGmUbeCaHi8CJIvOPCare3V4=;
 b=xu8Acbcg+h+YrDOitbMIGnUxOENRRXZW4l4gOojKgqmS3XfAUF+0UPDh7c4pgeKgv+w3gghDq0fwaguxFBb4sH9HpCNhHiRFGjSrhVPQpWhQHYQo7Wti1XjjnNIU7G+Yvqv/nCq/MXwiaN7J4BRaWyZs/sURlCt6v+qa3os8JvLjEqtE9xe/2leeIHsiGfchqlK6gKYb4nTZGBNalwUw6UvHKdPwvs7GbOf+M6FhpiORi8fsIDPz6TZ1LzlheZL7KWjwldRa7k7Kyzr/3/qE77sUBsZJXExvpZfm8Qg5L3xHhFVi2EHwZ/Uhy2eBbreWK/7Nb+VrhF7pA2MqXpToSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4jxQvxAE1oi5hVrdaQxGmUbeCaHi8CJIvOPCare3V4=;
 b=nJ/amJxEKD77HGqbYcCltDBbpkWL+Y4ne5ezz9DSjcXqGcl03Vr0yBvSrH8aV9avFm6YkO5MMdfu4EtFTgLydbgrvhBJkJKvIQy+zuIuF+6TUAOP9JIcop4tUlpGLN4JYhuHLfyO9E7PpnDp3jPSqcyJF8EHsLxVs2dNSpJqaZo=
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
Subject: [PATCH 2/2] xen/arm: traps: drop unreachable stage 2 decoding from panic_PAR()
Date: Tue, 25 Aug 2026 08:23:29 +0200
Message-ID: <20260825062329.16762-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825062329.16762-1-michal.orzel@amd.com>
References: <20260825062329.16762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CY8PR12MB7100:EE_
X-MS-Office365-Filtering-Correlation-Id: b03bdb35-2d08-4c46-0036-08df027169d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|56012099006|10067099003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info:
	hLsmZfnpRuObw/XfEkWPrKZs/n7HMmeRsDROFkDFImKKaH8cRr4aYbWukaJtwxg3d0SQz5QemxGDeVLC2Z11XyMpcVavaJv0dTgP/q1+UQRkKEEvUohIxlozi6tTnTStC+2VrKijRRXtbIXMoZlkXOe7WoWdD0/dVCJka+KwaiDYaVoG+vJBMIZziOcuDFiLCRHGkbZ4CBUqNLHTn5+S8PtIWNQXNtM4QdlZZ6ovEnUvCcRdwKc4QAP8bqXMuQ9wHbzlHJIxDHtREgwN61QpHJagy5nQRiPQhrSpHZw6MO1GK+BOsd4BCsDeEfsfT6vU8mWJxbHL4gnmLnbi0yihAUOMJmcS7OztoASG9ZqXCxlTdvqqAESoZ2ZHx3HdajIQ+ZA7lzKsN4nx0qIP6+EgD22npZPe9p14KDl8APlcwZFuS27WRHpburO/vATBXxXb6H50aWgquyBXH7+Fza6U+h8cwTrivXntzP/OsQc0lz1PFDDnUAcLObPx2b9XGN5wjIhbEQ+gsWH8SNz8/9dIxgII/zoxmUI3vpcAxWqIYSHPHUNeF8ddK55n7xbStGM54awnFQkV7+wtrT/XgUXxDklsxzXTGvNqlkCkTlPJrT6vju8BGvIWUhb8iBr776WCyv9yfQH9LuNU1OBaardRkkg1675+ukSHCGX4KLYYuzSm9Ngl1K24K7oJRgzV5TCI70obhV6TApA9bRf09O055w==
X-Forefront-Antispam-Report:
	CIP:149.199.90.133;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:unknown-90-133.xilinx.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(56012099006)(10067099003)(22082099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QYuvrVdsaEDnjECsUt9liYEnaRi6lO6fAhUn3UfxSLC76SPXeTcY3W5jinUtU5WwQDVr1ao/7u8iZrVmclMxj9TSsyx3IgAsFn0EJkWT4aW7PG9NblAZLb6katMx3B5DFHsKBCtHCgFHKV8ue869ktyQcUgvGoO1omODyY1nDsltihrj5CoDCIQFQar1eLnXEKtBbzAFWOEJedjdpVZqJCBXRcgura83o6/Y59NX6+RZSUhU7dhwfaA7YVgLSPMmQ1OjCcAqvB6yOmLhtyGjqEPEQ9Hngk5CY4HrIsmXsy82Eh/jXdX0FnzbVPm04WhEB7HyTRZZpcUtNqgqUyu7gSwS8pTxYRz7VALaejSp2Xl6qDmZC6V2KB4y72b4yt8XqMlfx9R6AoFSqSF+5CgoTM3UwuLI8fsfj249jQ3KMGua4bkCD1zgBNoXoYnCLsg9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 06:23:43.8915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b03bdb35-2d08-4c46-0036-08df027169d8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[149.199.90.133];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7100
X-purgate-ID: tlsNG-720697/1787639035-67CBA2AC-95602C8C/0/0
X-purgate-type: clean
X-purgate-size: 2545

panic_PAR() is only called from va_to_par(), which translates using
__va_to_par(), i.e. "at s1e2r" on arm64 and ATS1HR on arm32. Both
perform an EL2 stage 1 only translation, so PAR.S (PAR_STAGE2) and
PAR.PTW (PAR_STAGE21) can never be set.

This has been the case since commit a14447dbcf171 ("xen: arm: do not
panic when failing to translate a guest address"), which made
gva_to_par() and gva_to_ipa() return -EFAULT instead of calling
panic_PAR() for guest translations.

Print stage 1 unconditionally and keep an ASSERT() to document the
invariant. PAR_STAGE21 has no user left, so drop it. While at it, fix
the spacing in the decode_fsc() call.

No functional change intended.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/processor.h |  1 -
 xen/arch/arm/traps.c                 | 17 +++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index 509040a1cdc0..8ee8f88fb4cb 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -507,7 +507,6 @@ extern register_t __cpu_logical_map[];
 /* .... If F == 1 */
 #define PAR_FSC_SHIFT   (1)
 #define PAR_FSC_MASK    (_AC(0x3f,U)<<PAR_FSC_SHIFT)
-#define PAR_STAGE21     (_AC(1,U)<<8)     /* Stage 2 Fault During Stage 1 Walk */
 #define PAR_STAGE2      (_AC(1,U)<<9)     /* Stage 2 Fault */
 
 /* If F == 0 */
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index dc0ec8a345ed..1c2bdb7d02c7 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -382,16 +382,17 @@ void panic_PAR(uint64_t par)
 {
     const char *msg;
     int level = -1;
-    int stage = par & PAR_STAGE2 ? 2 : 1;
-    int second_in_first = !!(par & PAR_STAGE21);
 
-    msg = decode_fsc( (par&PAR_FSC_MASK) >> PAR_FSC_SHIFT, &level);
+    /*
+     * The only caller translates using "at s1e2r" (arm64) or ATS1HR
+     * (arm32), i.e. an EL2 stage 1 only translation.
+     */
+    ASSERT(!(par & PAR_STAGE2));
+
+    msg = decode_fsc((par & PAR_FSC_MASK) >> PAR_FSC_SHIFT, &level);
 
-    printk("PAR: %016"PRIx64": %s stage %d%s%s\n",
-           par, msg,
-           stage,
-           second_in_first ? " during second stage lookup" : "",
-           fsc_level_str(level));
+    printk("PAR: %016"PRIx64": %s stage 1%s\n",
+           par, msg, fsc_level_str(level));
 
     panic("Error during Hypervisor-to-physical address translation\n");
 }
-- 
2.43.0


