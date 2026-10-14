Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845C5CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 13:36:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1449058.1664986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGz9S-0006Zb-Kv; Wed, 14 Oct 2026 13:36:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1449058.1664986; Wed, 14 Oct 2026 13:36:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGz9S-0006ZU-I2; Wed, 14 Oct 2026 13:36:14 +0000
Received: by outflank-mailman (input) for mailman id 1449058;
 Wed, 14 Oct 2026 13:36:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xGz9Q-0006ZO-M1
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 13:36:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGz9P-00BaUj-Jr
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 15:36:11 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6acf8536-2eae-0a2a0a5409dd-0a2a4503c5da-46
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:36:11 +0200
Received: from [40.93.196.25]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6acf8549-fae8-0a2a45030019-285dc41969e9-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 15:36:10 +0200
Received: from CYZPR14CA0020.namprd14.prod.outlook.com (2603:10b6:930:8f::25)
 by SA0PR12MB4366.namprd12.prod.outlook.com (2603:10b6:806:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 13:36:05 +0000
Received: from CY7PEPF000000EF.namprd04.prod.outlook.com
 (2603:10b6:930:8f:cafe::b) by CYZPR14CA0020.outlook.office365.com
 (2603:10b6:930:8f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Wed,
 14 Oct 2026 13:36:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY7PEPF000000EF.mail.protection.outlook.com (10.167.247.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 13:36:04 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 08:35:57 -0500
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
 b=Ik/n5qsDackDgQIiAfmR/UOJFDR7lQYE/08/oJ98/yfybaWkwCwxdAXbzgVIY5hVFH9elc8UmD7Chq+agMh7nsuodrFhj9lOE4ELfTBYvFgFNev/2U6LTbGYpXzMQH9Ckvm6hVJnQHdUcAM2HKa6MbXYj/QKrvfqU6ip5Vbe3nsvBZq+sqHXR8rGFuUdx4VheBQjr4oN3TlnGXsPVNwzwQ8QMdImf5/WAFqlNqRkj2ET2euG9IZ2XvB6AHOh1IOY5xq7CaroKnUIRYkGDySQwdl4C6n/wN5gpeUZyFce8OqhfJMg3ZxUm8b/Pg1lmuG6ovodWxsZIiPDmbJCBYo49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3uZNeXE42tXk3NhU494qyzBKaz8QrbXL/HzVkz7lhM=;
 b=k4/EyvcPFkgnHqqJyfHiJFl8H4/E7Fhc0il5cvpTCDZJEZrcomRhgmrNaeFY9KZPX7aEOxxDiCxG5/XHXpwNfM7XVRyvkBocfyq5rPLVuuYwJS77U87i7kuGXY/VlSHXY/Q6ckKVN+ETuL7wD++TWza6cnBBNW9FCFn+MbSgiVykOKfB6zQPQUzb29S32MQ3ZslZLEJ1hLIMhMGQFF9VKGgvcgTEIxBAaFafx1xWRxo6QM/jwjNO7NyE/pEv83AoW5u7IV7mUPYok0+F1/AvmN+M/RYxsEu/NabbCntL0KZgNHITcvsRFHmjy/xhq3yyZxKyOe2KTlS8H/H9aud6uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3uZNeXE42tXk3NhU494qyzBKaz8QrbXL/HzVkz7lhM=;
 b=xlNCTvIICulPti+n6sjSiwkpC5fRNBJxRGiFKkd+aq9mX5N1ynxSzIOWKM+j7FrdVNX6tXeOXcq44dg5Yf0lqXjUS4Df5d1xGdgf8RGHNFXqWpLkVQgNzR8CdwmufFxd6Jac9TZ8b5u/r7PjinvaMvBOCrxzo4liRs+fRTBCsGo=
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH] x86/atomic: Fix UB on various atomic helpers
Date: Wed, 14 Oct 2026 15:35:50 +0200
Message-ID: <20261014133551.622462-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000EF:EE_|SA0PR12MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f6d3c9a-d88d-45f9-01e3-08df29f8185a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yQRDYmLBldvkpAw8QLkDvR7KI/rbD+fncwK5unLNrwT1t/zjy6kLsvodu1oYJQrOApL9Vmalk57aJ2FWRFdeuWUkT+MhcYXXk06l3q/+ncdhF7T1ABaqPnHSajaOeMXMn0BJsmWrde3Lnc+hP37d8XlTHyIbgcdlwxaCBaW2OO8AIlMYiydJJXtuSjUUn8SgkSjbTqgjbhjgne+EyKIZBZ0tzl/3IzxSkcbH+pwlPRfJ64nzZMX+T4PqoFhQw1OIWAamHJREyZ33e8fWAuIF0LBOFnIMQw3EO4LJCto1dLA057e2yYfOKS/7MtzWMihR1ys6wmFYTpb6l/bRHldoL8ityjhfxBRMPNswq7j+rKORdjrUYnERTVcseyBmolIGyliR+aFobdcTCZ0PhedbpI8THkiqQJBxRebGNS9sFWPHLFaPQWXmgHBfuCbhWiEKAbLgxTOUItebBxeyxMoeHe3oyBqxI859ADBxMWBomPIUR6yFhzrjGrC9aorN5+SZaGe5RfZlpi5BtSS2bcd/8RdeWURLIoS/9Wh+7oxg2E1u7zqfFe+9jR6xEZEAKdXBu+iDnbcGTWA+n9SMh3HHPutgozgVwMU8mh//yltzfTr7K2kz654NNpn/a1TAQSaT2quZ6/v+K8YktPCthSBb681wKLO02FfnJj9sM+GJej0RHD3ul9g4VZDo5WMlkSkBQPtGSalyuJlhDaFq3IHjgA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VoC49as/xNK3Mt2bqR8z3wWVWAXXe0mgYLXSbGj8Zkf3gJmr0WxMLFbORoHVLG3sqqOS3KUP65upR1Gt4q6CeJRAjveVO4lDmZJrGWRivGLpAzCHUGwGPMtITb5kbf2R3Lb89Wyyy7JJ1pSjjmjH294Ftr1amLjE1Upityvmx0bYvRGX7qcSFXwa8o4QcWDoTYQbHKozK0S2NPdyK5IHUuHP+J6mTV5xBtuaqJdogff3NZWwXmbKYy5Hzd95GxEqcpm/BDd/t2H2Y2f11DbVWq8sDtkAmzMA78jsHjuJEYfe42/q/kzPGt2jfcmLdMjMzD4W0JGwnLkUmdd0jnF0Bcw6Zhs5OrcwANphrZCePlb15QEXdaxO64JZz7Rzuu9FptDpHW9DrcQDUHYX5LP64CI/U09ep5Q5DxhacrCs/a5PMfNNYXRF9QC7Q7oUsHrE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 13:36:04.6195
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f6d3c9a-d88d-45f9-01e3-08df29f8185a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY7PEPF000000EF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4366
X-purgate-ID: tlsNG-33051d/1791984970-6D2D84E9-259D62CC/0/0
X-purgate-type: clean
X-purgate-size: 2256

The atomic interface is signed. There's UB if a caller adds over INT_MAX
or subtracts below INT_MIN where the addition/subtraction is done in
C, just like in a regular int. Make the outward facing interface respect
two's complement on wraparound by round-tripping through unsigned for
arithmetic.

While at it, fix the while loop to have Xen style.

Fixes: e0efc0738163 ("atomic: replace atomic_compareandswap() with atomic_cmpxchg()")
Fixes: c98c80084d77 ("asm/atomic.h: implement missing and add common prototypes")
Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
I'd prefer to turn this into an unsigned interface, but then some
callers would need changing in non-trivial ways.

OTOH, one could argue the atomics merely highlight the UB already
present in signed arithmetic, and thus this doesn't need fixing. I'd
prefer to remove UB where possible.
---
 xen/arch/x86/include/asm/atomic.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/atomic.h b/xen/arch/x86/include/asm/atomic.h
index ed4e09a503..8f227e0e6f 100644
--- a/xen/arch/x86/include/asm/atomic.h
+++ b/xen/arch/x86/include/asm/atomic.h
@@ -122,7 +122,7 @@ static inline void atomic_add(int i, atomic_t *v)
 
 static inline int atomic_add_return(int i, atomic_t *v)
 {
-    return i + arch_fetch_and_add(&v->counter, i);
+    return (unsigned int)i + arch_fetch_and_add(&v->counter, i);
 }
 
 static inline void atomic_sub(int i, atomic_t *v)
@@ -135,7 +135,9 @@ static inline void atomic_sub(int i, atomic_t *v)
 
 static inline int atomic_sub_return(int i, atomic_t *v)
 {
-    return arch_fetch_and_add(&v->counter, -i) - i;
+    unsigned int ui = i;
+
+    return arch_fetch_and_add(&v->counter, -ui) - ui;
 }
 
 static inline int atomic_sub_and_test(int i, atomic_t *v)
@@ -221,8 +223,9 @@ static inline int atomic_add_unless(atomic_t *v, int a, int u)
     int c, old;
 
     c = atomic_read(v);
-    while (c != u && (old = atomic_cmpxchg(v, c, c + a)) != c)
+    while ( c != u && (old = atomic_cmpxchg(v, c, (unsigned int)c + a)) != c )
         c = old;
+
     return c;
 }
 

base-commit: 7168cc02f86fb069da6e7405afbf5c7a1c215b0d
-- 
2.43.0


