Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C30C55ABA
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 02:16:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1384131.1627220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrneZ-0000Ge-8G; Thu, 06 Aug 2026 02:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1384131.1627220; Thu, 06 Aug 2026 02:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrneZ-0000GU-3B; Thu, 06 Aug 2026 02:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1384131;
 Thu, 06 Aug 2026 02:16:13 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wrneX-0000Cx-JJ
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 02:16:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrneX-002APw-0D
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 04:16:13 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee4e-e002-0a2a0a5209dd-0a2a450ae860-14
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:16:12 +0200
Received: from [52.101.85.64]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a73ee6b-f2d2-0a2a450a0019-346555403318-3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 04:16:12 +0200
Received: from SJ0PR13CA0007.namprd13.prod.outlook.com (2603:10b6:a03:2c0::12)
 by MW4PR12MB6682.namprd12.prod.outlook.com (2603:10b6:303:1e3::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:16:07 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::40) by SJ0PR13CA0007.outlook.office365.com
 (2603:10b6:a03:2c0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.7 via Frontend Transport; Thu, 6
 Aug 2026 02:16:07 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:16:07 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:15:53 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:15:53 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:15:52 -0500
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
 b=kP+MY6reK9n+KgKtWgmIMQZFyiR3h066PE7t6+Fe2swwZB8ezOIBimzxayv3BIjEk5nUFzFjDh+o86IcqFXggVHnWLPXnnVCGe3oBKq/Iq8Iv3rR33Yba1ALCyvARUf4dAOrdY1x9vxmr6h9xnmcYFU7JKJe881l8Sgrknun7M5bbTX9D5IM/A6gvEzmcYfQgEjxnL/sayyKrFHvBfiqXs2Dla1/sIN0VWQ05IYI6hxf60i/blHF7Gt0zDfrYc1Ieo04y7wd8VTWOCHYJ/LfaDxvJMGVyvlVuTl/Ln4SpCnKNaDYJTh39pcaJJ6bep9tPx92n/o4B09IeO3ec9w9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Xv0fA6/T7b3pIp+x7N+NA8yd+wXonHAePsFkZrVh0g=;
 b=QE2czA3MCUIEEfhUuWXe+4pCXBOaYFWuGcQB17Jdo/cTarpLrleY4VyVuGSj/w03pFWvtW35RJzAKLUnpUNGFxGAfh2wWmHYk4WHCbtnod565l5v4ARTBy40nsqJb6w6/qRHjiEj53a/+6GvfziuZgswHP3ufgHvhtWsWQR3Ob9Z0xD1evA3INFnTTW12Xde03QfxehfXcsqLQIQScHKeUxyph3mniVB14afhNcpfWsF3IVPwpvGGtDaLJ0mmcuwoFWI3YtDP0bvHQyd4zodbZ+D4wfi/T40Fq8obgBgYf5qlDtyTtVMV9DLbQvhTf4+Qv1DP9GAs04bhi/DJZ9l5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Xv0fA6/T7b3pIp+x7N+NA8yd+wXonHAePsFkZrVh0g=;
 b=QghUWubbjkvkU7KV6Da/m6iZVyH63MMkbZQ8B08xHsIm5Bb2NTK4ZwvsiDJlP5BYgxyA1PKymM12we2rrNQAxLsIWRrtpPcHp0p5aUSOuermjDarMrdeUAH1RB+rGIkfK9LQinZ7MlF8fCMV2tw7qH7ZHyA2hWZXoe6oUdQCCDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
	<jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Thomas
 Gleixner" <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Jason Andryuk <jandryuk@gmail.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] xen/Kconfig: select XEN_PVHVM
Date: Wed, 5 Aug 2026 21:52:31 -0400
Message-ID: <20260806015233.202486-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806015233.202486-1-jason.andryuk@amd.com>
References: <20260806015233.202486-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|MW4PR12MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: e7772e28-c9bc-4c2f-3f60-08def360acaf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|36860700016|82310400026|1800799024|921020|10067099003|5023799004|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D3wvuUBQx835/K8ljV1ZOJgk+n0ph5OZ7/i5Esc+m4zOOoPoz2+p47cW//cRKeo/1Ylc5HA6tlckc+myPS7BM6cOu831kbSlTbx6EjWHfX0CFbUfw2gLbjtxKexaZKrpKP6RmwY8x1Mm0hxn6VQxdik+Ftv0VSopo/I+5oUTqW/um17UARbCd9tS99SoIVxLgIpefsHikvSpLZy2c2vbX8Eb91Pyon3U/egkg418he5fI+j/yTblvcf+MDA16vurBXEEkU6wd60jiCgBa1Xve5aywp7Ol9UnYPJXOR4GlV/dJYbE9nXbIpc8YTZ7KVs7YyXfvU9bG5PgfhPTe08bx1Wk3EsCqMJrZniPQnEmPT4PZz9qWkAigZ4AIkdfbuVYFtAe/MjZzZygXGxl6kJMA1nzdMf7OBP1ktMD3CCv/cVoMD/B5IfAAAFtJbp1HAlMm7YDqrB8KAcnkTcyq+LEWVqcL0KbMdqg6kyTECwzrhJ0tni4SoBsR7eRu9NQUaOPyrjOgymtc5zIEC10r/5NJUClAybb1EnwDIPBY+AJe8Ni3o5WgyEGiTMzgYHeDU6EUp3IbPntnpjp9A39q9l9obMB05EQ/x5KalkF21+3oPJetEWC5jsjHfRvjNxPIxf+r+ZEh+ASKyeQsLAFEMdYIsWvsTFoqkMR8j58+Ni/fGvo+VhdsBOZjn6uaX1sfPQiFcxrITk8zpZ2NeTbo/eQnDluDqZdXQ7k2YAp910IBOM5thxOPUrIJLjDOi+fDhVe
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(36860700016)(82310400026)(1800799024)(921020)(10067099003)(5023799004)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zdoew5idMZ/uCpHJb08mf+fDQOsptiovS67Kpj5VeFBDnq4MZZPhWbKlSq/lxHM0vTjtej5OIE19nZDywcEd/SyfRLsOuLxcCdiNBJcTqFGMhdByvqxFrWjBuhk3QJoc1FhrXVSHvdVRAug2qGUmD5ou1hM8SIHg9e8oI3w/n9mAIzD2CjSmzQcA1oYd92xlagpRuoHfI2g8ipAlnOjT80PIpgNtdi/bF92CJn6D5gAViLO7bWwlOjIdeL1xP6hvJGgkmMW5xyKp0EPmzLVDRNsHf4KyumwklL+qqVPL1zWU5Qn5aqBa6aPiGavKK5SOajwSsO9ITbEuOr3LCHhWdMbqXQhcCUczIFM0e9PjgsE+cLK1FXLaT9gW1URcvpkHZkgQiouwwwTXjAMiXFyF7KJCdeHCb5pYDraV6oiirJ7ZJrKZcAkM0eQB2dx7/zdz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:16:07.1414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7772e28-c9bc-4c2f-3f60-08def360acaf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6682
X-purgate-ID: tlsNG-4011c0/1785982572-4AEDACFC-8E30C4D5/0/0
X-purgate-type: clean
X-purgate-size: 1241

XEN_PVHVM cannot be disabled as it is a hidden variable with def_bool y.
Switch XEN_PVHVM to a plain bool, and make XEN_PVH and XEN_PVHVM_GUEST
select it.  It will be pulled in as needed, and drop the code from
PV-only builds.

Fixes: 34aff14580d1 ("xen: Remove Xen PVH/PVHVM dependency on PCI")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 arch/x86/xen/Kconfig | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/Kconfig b/arch/x86/xen/Kconfig
index 99b06f5c47cd..7bdaa28ff232 100644
--- a/arch/x86/xen/Kconfig
+++ b/arch/x86/xen/Kconfig
@@ -51,7 +51,7 @@ config XEN_PV_DOM0
 	depends on XEN_PV && XEN_DOM0
 
 config XEN_PVHVM
-	def_bool y
+	bool
 	depends on XEN && X86_LOCAL_APIC
 
 config XEN_PVHVM_SMP
@@ -61,13 +61,15 @@ config XEN_PVHVM_SMP
 config XEN_PVHVM_GUEST
 	bool "Xen PVHVM guest support"
 	default y
-	depends on XEN_PVHVM && PCI
+	depends on XEN && PCI
+	select XEN_PVHVM
 	help
 	  Support running as a Xen PVHVM guest.
 
 config XEN_PVH
 	bool "Xen PVH guest support"
-	depends on XEN && XEN_PVHVM && ACPI
+	depends on XEN && ACPI
+	select XEN_PVHVM
 	select PVH
 	help
 	  Support for running as a Xen PVH guest.
-- 
2.55.0


