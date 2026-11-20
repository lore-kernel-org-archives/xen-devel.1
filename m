Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4432606A320
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=f7u6JOsO
Received: from list by lists.xenproject.org with outflank-mailman.1498335.1696151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xURas-0007QQ-Gq; Fri, 20 Nov 2026 16:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498335.1696151; Fri, 20 Nov 2026 16:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xURas-0007Oz-Cq; Fri, 20 Nov 2026 16:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1498335;
 Fri, 20 Nov 2026 16:36:09 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ross.lagerwall@citrix.com>) id 1xURar-0007LJ-1Q
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 16:36:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xURaq-009teX-Dt
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 17:36:08 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b0076e9-e002-0a2a0a5209dd-0a2a4505dd3c-34
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:36:08 +0100
Received: from [52.101.57.68]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ross.lagerwall@citrix.com>)
 id 6b0076f5-4cb1-0a2a45050019-34653944a145-4
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 17:36:08 +0100
Received: from CH8PR03MB8274.namprd03.prod.outlook.com (2603:10b6:610:2ba::5)
 by SAAPR03MB282009.namprd03.prod.outlook.com (2603:10b6:802:301::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 16:35:34 +0000
Received: from CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096]) by CH8PR03MB8274.namprd03.prod.outlook.com
 ([fe80::ebe2:32c1:d2be:a096%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 16:35:34 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRLDWr+fMZjz1JCPYru8N0VdnVZlRJAHhMl4Qx72Gdme4xxWjagn04UsqIERN3uijz2V5/5k4iAA0wyfXb3We1YubgBhwqA71r/xyrduWzRR/1KCm86CCtK89+RTXMmrhvU89ZBOhunEu0H+uT2V5LhvyIhRiPP3iTIAaBsCjSssZx6dBLI192ietVuXtAQ+nLptfJQ1cuSDRXxBIyEzdW82riouXdBoZZk7jy/hsIKwGzliuqC/PDdUTTg1CDfpeHrw1jSMAKXGKzF3j+egrAAZN+eaBAcHAPQpr4/u5wcvywlWVh6G2/QA+RlxjpXOH2qe/HNgFupWeGqHHcL21w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nb2OZaMYgBFgKKxuzsmEYyjkNljLAe0Cx995xQxk+qM=;
 b=yYzZg0idhe9VBBgPsHmm2kCyjTFXYenE6bdnj3BLHhlpLSy4YKbHvKx359V7Land3L7DYJwPcftOVAz1DylyvCoz9R0Zpxjrxx6sLTlBsUJMJPBdbkNxyli9aLCZQYZBDMuCfep2SXiglHO/+XP4gaD09zmLJytFUzLFCUnLKbF6/62cgg7majDCEZRSXUc7Gb0u6AOVVZ5niTjflH9MLLo80Zx57DnC/uUVqEbQKstukQuOfyM7382hRTITO5o4jS0lo5MSm+4G/2SLujMwpME3fOKaYfHaCeDY9ne4aOepYmqG9Y5eUXViHWacn2A6pMeXs0arjMiSxNNHTHNDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nb2OZaMYgBFgKKxuzsmEYyjkNljLAe0Cx995xQxk+qM=;
 b=f7u6JOsO0eINw4rJd0LZy/vyWdpkQKH4uARRu96RPHZyTB8EaO9YYwsuNOAagFUfthUVKFxeMljdMu582IDXhaqwdYTsbqd09ydmTWEgFAWFNgPQKuvpsoBlJCqypsnDNJZ5mmbu16KzHyzxOlhn9QQKL/rbs2xqR/rvJx9qeus=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v1 2/2] x86/nestedsvm: Handle L2 writing to the L1 APIC TPR
Date: Fri, 20 Nov 2026 16:35:03 +0000
Message-ID: <20261120163503.1907256-3-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120163503.1907256-1-ross.lagerwall@citrix.com>
References: <20261120163503.1907256-1-ross.lagerwall@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0221.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::20) To CH8PR03MB8274.namprd03.prod.outlook.com
 (2603:10b6:610:2ba::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8274:EE_|SAAPR03MB282009:EE_
X-MS-Office365-Filtering-Correlation-Id: 9aaa9fd1-7991-457f-da6f-08df47244cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261028144727099003|261026140227099003|261102123227099003|11063799006|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Eote73TJlOcFtKTBs4Z9bLsSU2FoBwPAN5iwsFwuHE8a0NIEAk+/wvpLwtD1x1bUhWyC0IbLU4T0deqQzKQtaXMXJrQvWyjY7q6Dp1CevLoMZ+mm3ok+/L9I7RA+D7DT/I2OMNhJq0TxEv8cYNzZusgedYFdwJTZEJk3izllNQTKYs8IQU83Wp5MUOJ4O+8AxsnWiiOxSnrqjyLT8jVGReed5zlst5ml3XeCeaH9mgJrAtnXQ4YcCpWuj59BqDZQo8NqK8chZ1Jdzej5YYk5D57WYcQUSQ/IEI4rEbIpwZwEOhZH4yfnsmZK8ptuNxsQikHq3R6j/vyebu0+EREHKfrxiPpHOdXjc/FZG1lsRQNXOUq3k4tfKcRI6GjzNbSLyRq0yWBKqwKFTltQPqE/4r3meNOlZL/pTAQFRyAt9oD84X1goKzJTB+KHK8EVeOvlkiu4qVV9l55SonRF4I8QaOaezD3fY00VEzNErsgqLnoPkCMSNRtG92Dqxs+adU5wu4DPkTR9RUnDdg+8xQYqOCzzgkYIPO6hQx3f8YpxBBBsd6ETNf2OlScfsGzBonWSaeEHSsquyRTEtuUjPDyFbZ7PRHcEILpqSEDHuBddwNbVZw4Ps6d+ryXKl/RkJt4d323P8uC4pXV23fCzfYW30zFa206EmFCaDizy9CnrHU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261028144727099003)(261026140227099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gXniqvyEHuQehXvX6wgvMz2IvY1rYILDf0hpEFgMiYXi8dnqkakEbxT6lIWQ?=
 =?us-ascii?Q?TYNbN68/3T3Qiz3E3szgokcZXg1kLNezwWs24BINePIu1oPXNJJnUiDm6iY3?=
 =?us-ascii?Q?1BR/yoOilj8QSoKv98EbQQRcCiAQuvXhIUDMlZOoSb3UkD3BVYgTn8DtXKds?=
 =?us-ascii?Q?kWoWGiSqEIxpr56Dwy0zi32WWgWBO6msogTUIkC34L0Ky5IkOposKDFSS0lJ?=
 =?us-ascii?Q?ydejUANVRMY9CnVOruZt7N7SapHdLbMCZ6A7KY26bbmQwTHULX7tgqWCU66Q?=
 =?us-ascii?Q?sUqz4ArlZhWY/ZUdyNCVzagzwBljw6wqkCD8tIooZy1R7Bn1cgvfQERiR//W?=
 =?us-ascii?Q?bN2V05vxeviygyW60kM6VvUBdMdVjj1E4h7W5bxps6oW/q01nbLfsqCp88tF?=
 =?us-ascii?Q?RFNowBknfRykGhMWsQpnh0xJmZ1JzPtBX4QU+alQdraU2/78qr5A9YFvdwZj?=
 =?us-ascii?Q?D+XQw5Iu7+D4KFYbeZtMKyOB8mV5t3yJrshFwRjtHHmYmCBsUtCpCWLd9CQq?=
 =?us-ascii?Q?VxSNWMX52Xb2O1YBtIg6OtCxcnmLHZqfugpEkVYrWuGohZIqAWGJ0vVK7lku?=
 =?us-ascii?Q?bhyfN/qXpI2pAVMSE4+CFOTelh57T42tvWoggaiHIAJAeMQXGx2MwsdpABFA?=
 =?us-ascii?Q?R7p/NVv4hG6L9tr6V+aHGWhUqDPtwCQLpdd3WK0bKvTne873N1YsQQnWe4bW?=
 =?us-ascii?Q?FX3MJjEmotLiaAD6WXMvPrswDKpfqrWV8AaEBZCm9siJr7c+MxDnt/+Lxe/6?=
 =?us-ascii?Q?ejSTGFCcC3Pl4JIobkgE7dydxwrAl04mS/YiGZXBMHIKxvK7DIWZWLPiy66m?=
 =?us-ascii?Q?awQyQ+h97waDW6peYwHD1iJBezLusoV6+b+Z+bzA2aS/oATuhPxJLkzJHYWj?=
 =?us-ascii?Q?GYeC2otLD+RvtmoetkRjZoh5NbM+vFG8DFThrHLWt7Y+SDeWZT3BL5nazyrt?=
 =?us-ascii?Q?fcXSGbgxnNmFF80QEofDcGZofRIF7YZLR21vgx/mnykh4c/B0XdJu6cgCDln?=
 =?us-ascii?Q?+Ijiq2hSFn0z1DNHCPIox6/TKrIoZJ5rxbR9SLHg9MYu/1XubrVL8LW3Ps6w?=
 =?us-ascii?Q?/8b+qrXJGtYgrK3krJl9htXZFHfOETJnaWSPsLNMUDZ6o163lDJ8mh48tWsL?=
 =?us-ascii?Q?0VwOs7dhNqT7cY+53KK/R6OCUYGmr9l8HUqiZ0m0Lmq2JDCCUt5o0YyUgx6n?=
 =?us-ascii?Q?LxzPDwHWkTIkwKVT2LScGC8tP1I4IyAEPfA+vjWiy2RR0MIWcdsln2aXI6l5?=
 =?us-ascii?Q?1EoUFntF+aA/JhYMeXwsQEqmOcoC2DxtjT26s5oKJuYvY9FNIDd1lHAMEEKY?=
 =?us-ascii?Q?TCywwK8kie8FaCwd2Evh49j1Rs6R2o/EuYAT/tBFVwuAWN9oA2itIFHjhsWq?=
 =?us-ascii?Q?WdUgbhRUWnOUEQF8TpM8dFYLdgXlolC3wLZCvTL2cWQPPv2W++btmM/+LNSG?=
 =?us-ascii?Q?IiIaiznOtrafqv70QHfSBYZB7DZp12/kD6dzb/oHaRp0ySdxHlf7vtNJMvbZ?=
 =?us-ascii?Q?GyyLJcrH41jPA0PuGuYXkfCMA3IVsPojiLsIQ/C7HKDV4ukeO3pdTAeokPlU?=
 =?us-ascii?Q?0vNXC1sy0LRPSbnPzXvJYEyOzfeQUfASIzQjf3eje2N7IdlYJQX2uBmzKdOD?=
 =?us-ascii?Q?C+LtAxhFWCxBQ/XnFl3nEWxXk6ANGkeCGz+9gI8UJiCWME4dtkHvNfhG/vAF?=
 =?us-ascii?Q?ta9vUAt0TH9AHbOQwr5dUEx7CtPseOEp4TI2iGfcVyEFPVpHDNfp8GZhoek0?=
 =?us-ascii?Q?mksNYudQkdWZlTzEHUiaEezM3lj8TNQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaa9fd1-7991-457f-da6f-08df47244cdf
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 16:35:34.5623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7C1SHzxF01d96lsXAqvYpTlnusXz7KUUKz8UPM0vzKxmBPQLbHSN7j0rgoDlB09jnLeS/XYXVmkwCFY1tdxqXpEzydjoY6z63VvQOVEZCZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAAPR03MB282009
X-purgate-ID: tlsNG-c201ff/1795192568-253192A1-D414738A/0/0
X-purgate-type: clean
X-purgate-size: 1943
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

L1 may allow L2 to write to its APIC TPR. Handle these changes by always
syncing the APIC TPR to VMCB(0-1) rather than skipping the sync if in
guest mode. This ensures that subsequent L1 accesses to CR8 see the
correct value.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 1043f4a988a8..b691fd2ea6d6 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -944,6 +944,7 @@ static void noreturn cf_check svm_do_resume(void)
 {
     struct vcpu *v = current;
     struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     bool debug_state = (v->domain->debugger_attached ||
                         v->domain->arch.monitor.software_breakpoint_enabled ||
                         v->domain->arch.monitor.debug_exception_enabled);
@@ -974,8 +975,8 @@ static void noreturn cf_check svm_do_resume(void)
         vmcb->cleanbits.raw = 0;
     }
 
-    if ( !vcpu_guestmode && !vlapic_hw_disabled(vlapic) )
-        svm_update_tpr(vmcb, vlapic);
+    if ( !vlapic_hw_disabled(vlapic) )
+        svm_update_tpr(n1_vmcb, vlapic);
 
     hvm_do_resume(v);
 
@@ -2521,6 +2522,7 @@ void asmlinkage svm_vmexit_handler(void)
     uint64_t exit_reason;
     struct vcpu *v = current;
     struct vmcb *vmcb = v->arch.hvm.svm.vmcb;
+    struct vmcb *n1_vmcb = vcpu_nestedhvm(v).nv_n1vmcx;
     int insn_len;
     vintr_t intr;
     bool vcpu_guestmode = false;
@@ -3075,10 +3077,10 @@ void asmlinkage svm_vmexit_handler(void)
     }
 
   out:
-    if ( vcpu_guestmode || vlapic_hw_disabled(vlapic) )
+    if ( vlapic_hw_disabled(vlapic) )
         return;
 
-    svm_update_tpr(vmcb, vlapic);
+    svm_update_tpr(n1_vmcb, vlapic);
 }
 
 /*
-- 
2.56.0


