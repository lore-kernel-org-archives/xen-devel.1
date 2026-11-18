Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CD606A320
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 17:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=p2L7GOuF
Received: from list by lists.xenproject.org with outflank-mailman.1494910.1694153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIk-0001kc-7x; Wed, 18 Nov 2026 17:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494910.1694153; Wed, 18 Nov 2026 17:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTjIk-0001kR-4M; Wed, 18 Nov 2026 17:18:30 +0000
Received: by outflank-mailman (input) for mailman id 1494910;
 Wed, 18 Nov 2026 17:18:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>) id 1xTjIi-0001jD-7n
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 17:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTjIh-005Owu-K9
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 18:18:27 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afdddb2-2eae-0a2a0a5409dd-0a2a450285fe-48
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:27 +0100
Received: from [52.101.85.66]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Alejandro.GarciaVallejo@amd.com>)
 id 6afddde0-4900-0a2a45020019-346555423640-4
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 18:18:26 +0100
Received: from SJ0PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:33f::25)
 by IA0PR12MB8929.namprd12.prod.outlook.com (2603:10b6:208:484::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Wed, 18 Nov
 2026 17:18:14 +0000
Received: from BY1PEPF000264B0.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::36) by SJ0PR05CA0050.outlook.office365.com
 (2603:10b6:a03:33f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Wed, 18
 Nov 2026 17:18:14 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF000264B0.mail.protection.outlook.com (10.167.242.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 17:18:14 +0000
Received: from espagarciav-lx01.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 11:18:12 -0600
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
 b=yqrnm4FekaIm17vi/v3gmRscACcljt6tKNetAsOqQD7vCvt6iZmXGskdtQk5TLj1dTixU8BrsMJdsyS9LN4bOBiN0AYAPRs/uR0vP+uQ0ExFXIiVy+46YVmVFTdQePkvpf4Xf6DSlFLLY8pjyXBUrskuslFmkrBP5v9TX9CJoLW/IqxQBZt/lZ4BUYI/+zHfNK8mZ/MuYZinMrFppj3C54vhh7kk6aFNFdGna/KBU009Wvt5K1KtYkfpe92objlm+h4G05q9L+Ct909BZUq3WraSe4vnndm6zS1e496LmWy+28s+cGCXE8XnPkR6venqz3S/qya0Re/feWZydArFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1xXAnM5rZAcDLMs9VOzpqha8nVmgW+SFRJG5tIXU/bc=;
 b=dLSbGjXE4J3W+7ub6AX/iVLX0XM1D1O6xrA0Pt8PpAXKaBUHHFQw4owtBAO57XRgaHgKBFT3vqecsXfdRmHwbCNpG0sXQu4YyFULwpjlZzan2+U14ngONxu8m+Lw+CXYCrvFQ4ONLCED2WBxQ5Isfn4QytZ2aVi9JMe/BD8svxz5uX+OcK1AX5inrwDBZWGIy8S/GWMZjOkqucxhaTn6DBewxSb5lTB9mjsDrZW4vLaitfNgXL/UdxRfVzp+nZjqnXwbmsF8am0Sa3hNIrt+2ff/nQmzI6j+2b2UEGBkQ89C1FeYZdv946lXMJe9L0QmnIFZ7haqatp1WrepMhblTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1xXAnM5rZAcDLMs9VOzpqha8nVmgW+SFRJG5tIXU/bc=;
 b=p2L7GOuF/klGgNTvfInKevQ81DUv+HjQuAI+ul5Pg6XP/zJm84PVSfJRCp643AnVRO9SXs8t4ps69PDTX/OyahzIqq8Bd83nvGDfEuXa2JcajUDyAvHiw/Czm0mb0h29msgDCFJReEZV6TCONdPK2sGv6VzZZx7eaXnYypwBIu4=
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
Subject: [PATCH 3/5] x86/cpu: Use U suffixes on integer constants
Date: Wed, 18 Nov 2026 18:17:54 +0100
Message-ID: <20261118171758.1125066-4-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
References: <20261118171758.1125066-1-alejandro.garciavallejo@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B0:EE_|IA0PR12MB8929:EE_
X-MS-Office365-Filtering-Correlation-Id: 67609ecc-dde8-49dc-218b-08df4597ee11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|261102123227099003|10067099003|261026121527099003|11063799006|56012099006|261026140227099003|261022105027099003|261022075727099003|261021121427099003|261028144727099003|261021123027099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JRvwOLEmR9GH5YQ1nbElKo7s1eqrXWbZr5EajeBioIIyawQsxNz95XMwlgC1yO9UZFqL7fqUZQXy/V3+lUv5y0lOC0csNVQdf7QNuRz9CLNJTqh4H0DmfJ6CXkjsDX9Wo5wSkgb0uJbnL97Pj6rjwyrg+w5HsEsCipLBbNEGZC3fx0+7fQlFaHtiv5c2lx3+XH5a35vq5Uf4J99R3ssa9fkKk155O0H60wCHq6JeNLUF5R7qyh90QJ0lc83yZGccqo3GA5Lr5AZp49utZUxk2R+HqlBSVnxGUmeyfq7YlZi9Up7AFP64dQODAPqkwbk6girIuNrLhPmwfhMCq9euaQDhLxo20J1ImQQa4n+bC2uELF/EOiSaxA+FGY+WrPz6PDLs6GLhus8VsbB+rviml/JCwJm+Yz+NFkBqwp7q9fvDDb2C6oQnPNBBhd89n4OiyqaMIw6EJ0ayEgXJ0erjxanWRd8sUihIpNDWjZXWG6w7ocieEydkaox9s5LUUIXXs5sPoGYSEYuJobCtQ5pHUiCYTBIabKk9fRmH0fbwKpRV/aeUqSpAHjucpHNPLyzUOfnvgQZm3c1batasPi0p7RJ1JWCliBmKCPW7OMX9ZESJlNA9XLIVUWUDQMyrEwuuF6gU6wcw4og/DtgSbeAguk5QcQ2uy+kykFIb/pKarpNjpU5dBz1oIf+AlReFunB4PjVCgrSrXD8U+eUNCgfz8A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(261102123227099003)(10067099003)(261026121527099003)(11063799006)(56012099006)(261026140227099003)(261022105027099003)(261022075727099003)(261021121427099003)(261028144727099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	krfzMRcAo4xx6DsnUPddAYLYsfYH5wM/EWDWWkliA/EOR1vfV04AV9JJNsbRWeA3uLX14gQe27EndJbQWNsnd9xXidYvLaO9sHrfUIliEFKzvDIX3tbssyNi+8mIlZN+qW9HURtf457zVcoFqGgX+7jcTXu4EOIpLkUJrwPn52dn9MYsCEYmWve2xZPwerh0j53tr4OWzLWf/KKCaAejy7iAWhLS3B7xncU4s0TnBMOjKj8X+ZZq7uc3rSHUCqs/O7s+gIR3fPqB9rB/iimlLshx/N9jV8DVJe9o8qbEA1QrJQRYeo9jPj6t9sJm9N0IRkNA6Z/xJ2oV3SsbFAgD8PFhcgg3d9CBAd408S4Lh1MfDg08hGz9vQruxDdwX7C2dN0SC98rtKwX837K0AHQBCED+9Iaf0rGHBKl8Q3N7/BLK8SSoHFADb3fHEHOPIMM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:18:14.5010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67609ecc-dde8-49dc-218b-08df4597ee11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8929
X-purgate-ID: tlsNG-720697/1795022307-F0B876C6-D09E1043/0/0
X-purgate-type: clean
X-purgate-size: 13281
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MISRA C Rule 7.2 requires a 'U' suffix on integer constants of unsigned
type, and Rule 7.3 forbids the lowercase 'l' in literal suffixes.

Add the 'U' suffix to the CPUID leaves, MSR indices and other constants
above INT_MAX in amd.c, centaur.c, common.c and hygon.c, and uppercase
the existing "ul" and "ull" suffixes.  While at it, use MSR_K8_PSTATE0
rather than open-coding its value.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
 xen/arch/x86/cpu/amd.c     | 48 +++++++++++++++++++-------------------
 xen/arch/x86/cpu/centaur.c |  4 ++--
 xen/arch/x86/cpu/common.c  | 48 +++++++++++++++++++-------------------
 xen/arch/x86/cpu/hygon.c   |  8 +++----
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 21f82990db..fbbba0005c 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -58,7 +58,7 @@ static inline int rdmsr_amd_safe(unsigned int msr, unsigned int *lo,
         ".previous\n"
         _ASM_EXTABLE(1b, 3b)
         : "=a" (*lo), "=d" (*hi), "=r" (err)
-        : "c" (msr), "D" (0x9c5a203a), "2" (0), "i" (-EFAULT) );
+        : "c" (msr), "D" (0x9c5a203aU), "2" (0), "i" (-EFAULT) );
 
     return err;
 #endif
@@ -71,7 +71,7 @@ static inline int wrmsr_amd_safe(unsigned int msr, unsigned int lo,
         "1: wrmsr\n\t"
         _ASM_EXTABLE(1b, %l[fault])
         :
-        : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203a)
+        : "c" (msr), "a" (lo), "d" (hi), "D" (0x9c5a203aU)
         :
         : fault );
 
@@ -85,7 +85,7 @@ static void wrmsr_amd(unsigned int msr, uint64_t val)
 {
 	asm volatile("wrmsr" ::
 		     "c" (msr), "a" ((uint32_t)val),
-		     "d" (val >> 32), "D" (0x9c5a203a));
+		     "d" (val >> 32), "D" (0x9c5a203aU));
 }
 
 /*
@@ -263,7 +263,7 @@ static void __init noinline amd_init_levelling(void)
 	if (levelling_caps & LCAP_e1cd) {
 		uint32_t ecx, edx, tmp;
 
-		cpuid(0x80000001, &tmp, &tmp, &ecx, &edx);
+		cpuid(0x80000001U, &tmp, &tmp, &ecx, &edx);
 
 		/* Fast-forward bits - Must be set. */
 		edx |= cpufeat_mask(X86_FEATURE_APIC);
@@ -444,7 +444,7 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
          * distingush the cores.
          */
         cpu = smp_processor_id();
-        bits = (cpuid_ecx(0x80000008) >> 12) & 0xf;
+        bits = (cpuid_ecx(0x80000008U) >> 12) & 0xf;
 
         if (bits == 0) {
                 while ((1 << bits) < c->x86_max_cores)
@@ -459,7 +459,7 @@ static void amd_get_topology(struct cpuinfo_x86 *c)
         if (cpu_has(c, X86_FEATURE_TOPOEXT)) {
                 u32 eax, ebx, ecx, edx;
 
-                cpuid(0x8000001e, &eax, &ebx, &ecx, &edx);
+                cpuid(0x8000001eU, &eax, &ebx, &ecx, &edx);
                 c->x86_num_siblings = ((ebx >> 8) & 0xff) + 1;
 
                 if (c->family < 0x17)
@@ -531,13 +531,13 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 		 * Make an attempt at determining the node ID, but assume
 		 * symmetric setup (using node 0) if this fails.
 		 */
-		if (c->extended_cpuid_level >= 0x8000001e &&
+		if (c->extended_cpuid_level >= 0x8000001eU &&
 		    cpu_has(c, X86_FEATURE_TOPOEXT)) {
-			node = cpuid_ecx(0x8000001e) & 0xff;
+			node = cpuid_ecx(0x8000001eU) & 0xff;
 			if (node > 7)
 				node = 0;
 		} else if (cpu_has(c, X86_FEATURE_NODEID_MSR)) {
-			rdmsrl(0xC001100C, val);
+			rdmsrl(0xC001100CU, val);
 			node = val & 7;
 		}
 
@@ -549,14 +549,14 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 		wrmsrl(MSR_AMD64_NB_CFG,
 		       nbcfg | (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT));
 #define PCI_ECS_ADDRESS(sbdf, reg) \
-    (0x80000000 | ((sbdf).bdf << 8) | ((reg) & 0xfc) | (((reg) & 0xf00) << 16))
+    (0x80000000U | ((sbdf).bdf << 8) | ((reg) & 0xfc) | (((reg) & 0xf00) << 16))
 
 		for ( ; ; ) {
 			pci_sbdf_t sbdf = PCI_SBDF(0, 0, 0x18 | node, 4);
 
 			switch (pci_conf_read32(sbdf, PCI_VENDOR_ID)) {
 			case 0x00000000:
-			case 0xffffffff:
+			case 0xffffffffU:
 				/* No device at this SBDF. */
 				if (!node)
 					break;
@@ -594,21 +594,21 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 
 	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
 	for (h = c->family == 0x10 ? 5 : 8; h--; )
-		if (!rdmsr_safe(0xC0010064 + h, &lo) && (lo >> 63))
+		if (!rdmsr_safe(MSR_K8_PSTATE0 + h, &lo) && (lo >> 63))
 			break;
 	if (!(lo >> 63))
 		return;
 
 	if (idx && idx < h &&
-	    !rdmsr_safe(0xC0010064 + idx, &val) && (val >> 63) &&
-	    !rdmsr_safe(0xC0010064, &hi) && (hi >> 63)) {
+	    !rdmsr_safe(MSR_K8_PSTATE0 + idx, &val) && (val >> 63) &&
+	    !rdmsr_safe(MSR_K8_PSTATE0, &hi) && (hi >> 63)) {
 		if (nom_mhz)
 			*nom_mhz = amd_parse_freq(c->family, val);
 		if (low_mhz)
 			*low_mhz = amd_parse_freq(c->family, lo);
 		if (hi_mhz)
 			*hi_mhz = amd_parse_freq(c->family, hi);
-	} else if (h && !rdmsr_safe(0xC0010064, &hi) && (hi >> 63)) {
+	} else if (h && !rdmsr_safe(MSR_K8_PSTATE0, &hi) && (hi >> 63)) {
 		if (low_mhz)
 			*low_mhz = amd_parse_freq(c->family, lo);
 		if (hi_mhz)
@@ -662,7 +662,7 @@ static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 	}
 
 	if (bit >= 0) {
-		uint64_t val, mask = 1ull << bit;
+		uint64_t val, mask = 1ULL << bit;
 
 		if (rdmsr_safe(MSR_AMD64_LS_CFG, &val) ||
 		    ({
@@ -728,8 +728,8 @@ bool __init amd_setup_legacy_ssbd(void)
 	 * c->cpu_core_id is sparse on all but the top end CPUs.  Derive
 	 * max_cpus from ApicIdCoreIdSize which will cover any sparseness.
 	 */
-	if (boot_cpu_data.extended_cpuid_level >= 0x80000008) {
-		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008), 0xf000);
+	if (boot_cpu_data.extended_cpuid_level >= 0x80000008U) {
+		ssbd_max_cores = 1u << MASK_EXTR(cpuid_ecx(0x80000008U), 0xf000);
 		ssbd_max_cores /= boot_cpu_data.x86_num_siblings;
 	}
 	if (!ssbd_max_cores)
@@ -838,7 +838,7 @@ void __init detect_zen2_null_seg_behaviour(void)
 static void cf_check fam17_disable_c6(void *arg)
 {
 	/* Disable C6 by clearing the CCR{0,1,2}_CC6EN bits. */
-	const uint64_t mask = ~((1ul << 6) | (1ul << 14) | (1ul << 22));
+	const uint64_t mask = ~((1UL << 6) | (1UL << 14) | (1UL << 22));
 	uint64_t val;
 
 	if (!fam17_c6_disabled) {
@@ -1095,8 +1095,8 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 		 * (AMD Erratum #110, docId: 25759).
 		 */
 		__clear_bit(X86_FEATURE_LAHF_LM, c->x86_capability);
-		if (!rdmsr_amd_safe(0xc001100d, &l, &h))
-			wrmsr_amd_safe(0xc001100d, l, h & ~1);
+		if (!rdmsr_amd_safe(0xc001100dU, &l, &h))
+			wrmsr_amd_safe(0xc001100dU, l, h & ~1);
 	}
 
 	/*
@@ -1180,11 +1180,11 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 
 	display_cacheinfo(c);
 
-	if (c->extended_cpuid_level >= 0x80000008) {
-		c->x86_max_cores = (cpuid_ecx(0x80000008) & 0xff) + 1;
+	if (c->extended_cpuid_level >= 0x80000008U) {
+		c->x86_max_cores = (cpuid_ecx(0x80000008U) & 0xff) + 1;
 	}
 
-	if (c->extended_cpuid_level >= 0x80000007) {
+	if (c->extended_cpuid_level >= 0x80000007U) {
 		if (cpu_has(c, X86_FEATURE_ITSC)) {
 			__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 			__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
diff --git a/xen/arch/x86/cpu/centaur.c b/xen/arch/x86/cpu/centaur.c
index 9123b05dc1..1e756d6c36 100644
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -21,8 +21,8 @@ static void init_c3(struct cpuinfo_x86 *c)
 	uint64_t msr_content;
 
 	/* Test for Centaur Extended Feature Flags presence */
-	if (cpuid_eax(0xC0000000) >= 0xC0000001) {
-		u32 tmp = cpuid_edx(0xC0000001);
+	if (cpuid_eax(0xC0000000U) >= 0xC0000001U) {
+		u32 tmp = cpuid_edx(0xC0000001U);
 
 		/* enable ACE unit, if present and disabled */
 		if ((tmp & (ACE_PRESENT | ACE_ENABLED)) == ACE_PRESENT) {
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 54e3a02dd1..78f26105c5 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -226,13 +226,13 @@ int get_model_name(struct cpuinfo_x86 *c)
 	unsigned int *v;
 	char *p, *q;
 
-	if (c->extended_cpuid_level < 0x80000004)
+	if (c->extended_cpuid_level < 0x80000004U)
 		return 0;
 
 	v = (unsigned int *) c->x86_model_id;
-	cpuid(0x80000002, &v[0], &v[1], &v[2], &v[3]);
-	cpuid(0x80000003, &v[4], &v[5], &v[6], &v[7]);
-	cpuid(0x80000004, &v[8], &v[9], &v[10], &v[11]);
+	cpuid(0x80000002U, &v[0], &v[1], &v[2], &v[3]);
+	cpuid(0x80000003U, &v[4], &v[5], &v[6], &v[7]);
+	cpuid(0x80000004U, &v[8], &v[9], &v[10], &v[11]);
 	c->x86_model_id[48] = 0;
 
 	/* Intel chips right-justify this string for some dumb reason;
@@ -255,8 +255,8 @@ void display_cacheinfo(struct cpuinfo_x86 *c)
 {
 	unsigned int dummy, ecx, edx, size;
 
-	if (c->extended_cpuid_level >= 0x80000005) {
-		cpuid(0x80000005, &dummy, &dummy, &ecx, &edx);
+	if (c->extended_cpuid_level >= 0x80000005U) {
+		cpuid(0x80000005U, &dummy, &dummy, &ecx, &edx);
 		if ((edx | ecx) >> 24) {
 			if (opt_cpu_info)
 				printk("CPU: L1 I cache %uK (%u bytes/line),"
@@ -266,10 +266,10 @@ void display_cacheinfo(struct cpuinfo_x86 *c)
 		}
 	}
 
-	if (c->extended_cpuid_level < 0x80000006)	/* Some chips just has a large L1. */
+	if (c->extended_cpuid_level < 0x80000006U)	/* Some chips just has a large L1. */
 		return;
 
-	cpuid(0x80000006, &dummy, &dummy, &ecx, &edx);
+	cpuid(0x80000006U, &dummy, &dummy, &ecx, &edx);
 
 	size = ecx >> 16;
 	if (size) {
@@ -413,10 +413,10 @@ void __init early_cpu_init(bool verbose)
 				    &c->x86_capability[FEATURESET_7d1]);
 	}
 
-	eax = cpuid_eax(0x80000000);
-	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
-		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
-		eax = cpuid_eax(0x80000008);
+	eax = cpuid_eax(0x80000000U);
+	if ((eax >> 16) == 0x8000 && eax >= 0x80000008U) {
+		ebx = eax >= 0x8000001fU ? cpuid_ebx(0x8000001fU) : 0;
+		eax = cpuid_eax(0x80000008U);
 
 		paddr_bits = eax & 0xff;
 		if (paddr_bits > PADDR_BITS)
@@ -530,7 +530,7 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	c->x86_capability[FEATURESET_1c] = ecx;
 	c->x86_capability[FEATURESET_1d] = edx;
 
-	eax = cpuid_eax(0x80000000);
+	eax = cpuid_eax(0x80000000U);
 	if ((eax >> 16) == 0x8000)
 		c->extended_cpuid_level = eax;
 
@@ -538,8 +538,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	 * These AMD-defined flags are out of place, but we need
 	 * them early for the CPUID faulting probe code
 	 */
-	if (c->extended_cpuid_level >= 0x80000021)
-		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
+	if (c->extended_cpuid_level >= 0x80000021U)
+		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021U);
 
 	if (actual_cpu.c_early_init)
 		alternative_vcall(actual_cpu.c_early_init, c);
@@ -554,19 +554,19 @@ void identify_cpu(struct cpuinfo_x86 *c)
 		c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
 
 	/* AMD-defined flags: level 0x80000001 */
-	if (c->extended_cpuid_level >= 0x80000001)
-		cpuid(0x80000001, &tmp, &tmp,
+	if (c->extended_cpuid_level >= 0x80000001U)
+		cpuid(0x80000001U, &tmp, &tmp,
 		      &c->x86_capability[FEATURESET_e1c],
 		      &c->x86_capability[FEATURESET_e1d]);
 
-	if (c->extended_cpuid_level >= 0x80000004)
+	if (c->extended_cpuid_level >= 0x80000004U)
 		get_model_name(c); /* Default name */
-	if (c->extended_cpuid_level >= 0x80000007)
-		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007);
-	if (c->extended_cpuid_level >= 0x80000008)
-		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
-	if (c->extended_cpuid_level >= 0x80000021)
-		cpuid(0x80000021,
+	if (c->extended_cpuid_level >= 0x80000007U)
+		c->x86_capability[FEATURESET_e7d] = cpuid_edx(0x80000007U);
+	if (c->extended_cpuid_level >= 0x80000008U)
+		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008U);
+	if (c->extended_cpuid_level >= 0x80000021U)
+		cpuid(0x80000021U,
 		      &c->x86_capability[FEATURESET_e21a], &tmp,
 		      &c->x86_capability[FEATURESET_e21c], &tmp);
 
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index ef19c2b367..1f88275ce2 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -17,7 +17,7 @@ static void hygon_get_topology(struct cpuinfo_x86 *c)
 	/* Socket ID is ApicId[6] for Hygon processors. */
 	c->phys_proc_id >>= APICID_SOCKET_ID_BIT;
 
-	ebx = cpuid_ebx(0x8000001e);
+	ebx = cpuid_ebx(0x8000001eU);
 	c->x86_num_siblings = ((ebx >> 8) & 0x3) + 1;
 	c->x86_max_cores /= c->x86_num_siblings;
 	c->cpu_core_id = ebx & 0xff;
@@ -66,10 +66,10 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 
 	display_cacheinfo(c);
 
-	if (c->extended_cpuid_level >= 0x80000008)
-		c->x86_max_cores = (cpuid_ecx(0x80000008) & 0xff) + 1;
+	if (c->extended_cpuid_level >= 0x80000008U)
+		c->x86_max_cores = (cpuid_ecx(0x80000008U) & 0xff) + 1;
 
-	if (c->extended_cpuid_level >= 0x80000007) {
+	if (c->extended_cpuid_level >= 0x80000007U) {
 		if (cpu_has(c, X86_FEATURE_ITSC)) {
 			__set_bit(X86_FEATURE_CONSTANT_TSC, c->x86_capability);
 			__set_bit(X86_FEATURE_NONSTOP_TSC, c->x86_capability);
-- 
2.43.0


