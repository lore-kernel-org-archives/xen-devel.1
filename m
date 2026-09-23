Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1027C982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:21:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429936.1652586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAZ-0005NW-Ma; Wed, 23 Sep 2026 09:21:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429936.1652586; Wed, 23 Sep 2026 09:21:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAZ-0005NA-Is; Wed, 23 Sep 2026 09:21:39 +0000
Received: by outflank-mailman (input) for mailman id 1429936;
 Wed, 23 Sep 2026 09:21:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9JAY-0005IS-Fr
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:21:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JAX-0017u4-SU
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:21:37 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a1d-bab6-0a2a0a5309dd-0a2a450c829e-12
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:37 +0200
Received: from [52.101.57.2]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a20-f479-0a2a450c0019-346539026ed6-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:37 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by BL4PR03MB8106.namprd03.prod.outlook.com (2603:10b6:208:591::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:21:35 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:21:35 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-Id:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oB8xzTn5m48EtYiUi9N+tYqbbTv8e7uzFakRrSIWtmiLG/K6IoDp7Z31zCGYdYSPN7rnWY7TWSdl1pjngaHyyzuGzvedVa3mgOrjZaDDCgIdnqCNL/iyRbaSh8gNlNZ0e66SRH2gxJyxUuQBLbwqeWcMLncMQsBdZlCr8Czns/FAHhfQpUbxf6H5CreY18aYw9/2rUVoQfUASUkDFuZyjCf7TFnMLCARnYWn3Y27dHy8ZSrXY5IFj2EWQzbKMI9j38bR2wItElJSqjG4tF81NWK9gOYeFL+MPa3Gc5k+49CI/C4P6xEwB7P7boagiPQg3LFLckMCcjOaGmjnVnDh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0G5DFHvfT3OxxH3EakjBBKP8uv26iIDoAqt94XNIBo=;
 b=roy0obYufjH+LX15/CI78RIdU4iOriNQmSe8Cf/lPDUoQO7rXgOizUFojNi1qJunxfuqfTz7VCeuVyuwW3iYVykGNghJAJazXH/X6VklwF7fO3E2wWoPgrCtTAta1eOe7Khqwry0ADvccBXMuxS3Mk6p1yJcQKNOs8lWVIT9E0YrnwzOzWoyayZXYGtohdxR3TCuEEN/X7md+LVQSoX09f2hAjjpBN33ZXRw1hme4mgSoWQV7Pk4953Wpcv6QivzjogufiG003e+CBn7TeXVEWm9l2PEnNFLMfZ5WaBA+am8VLLdi2LF1cAGgWyaPGfyxoNF7MhI5D73+rndmyURmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0G5DFHvfT3OxxH3EakjBBKP8uv26iIDoAqt94XNIBo=;
 b=kA79D9UYM8qw+QE55lT6QwT9bRuap7ih9YM7H6nTwxUQo1eFrNJ3ajngMksWgIO4QjQJzx7lv9BMqMfOJnKFI7JFuYb35b+MeyhCAa0WvCtQ6JtPFOZr+VoYJoH/G4Q4k3dgVXe2jKYfVAk5/eeselutcpT1eDqc2dXfpqjmHnM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: chunjie.zhu@citrix.com
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	jason.andryuk@amd.com,
	teddy.astie@vates.tech,
	Chunjie Zhu <chunjie.zhu@citrix.com>
Subject: =?UTF-8?q?=5BPATCH=C2=A0v1=204/5=5D=20x86/nestedsvm=3A=20update=20vmcb=20correctly?=
Date: Wed, 23 Sep 2026 17:20:44 +0800
Message-Id: <293d4fce5adc8b4a7f8e9e2700ecaee988ac803c.1790146987.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790146987.git.chunjie.zhu@citrix.com>
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR0401CA0034.apcprd04.prod.outlook.com
 (2603:1096:820:e::21) To LV3PR03MB7609.namprd03.prod.outlook.com
 (2603:10b6:408:283::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|BL4PR03MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be20fbe-389d-40f2-f23f-08df19541065
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info:
	4lOAWRITY+UDSE69gr0ZFuK+spQTbEsoGnUanMt0Qb+qXG/NIFs3ftPr8CXEvKZVVro7notdN2wbQGwo+IR9MHkDkiY6sNRNUaytqMipDaP2dftEx9fDyEz5wylTKXFKRVQVrZwMbzE4NrhR0vGucaxIBRu9yHZGWxcaCTpeFg/fv1oijIu+VTah79BbGpVfaIrVijv86JrR1NV6kiViK9+GLl3ZNtN7ZVe5afIL/8yS6xKk68aqRoJMN3gvyPqRI2llGJiJ0L67Z20R+XsjbXFMDhgryiZUKH3TxKG9KA4zZqBCEWqtoJpisPh1Q8U9mLJam3gLQ2YtVWnc1TEN6faaZ12trJgW87xSvR0gLpLHTPrMGKl0k6MW4fxE7y3tXh8I/kqYYOHXzneTZ3IG8PEAcVBNTH1JJbX1zG1GL8daY60JMPa0jRYFXLtr/tR3ErknUyg/vFmMsL4tT2uRzEplD23Y1UIEy3tLocJeu24zvULv3TufwbUf+eFZGvxhvQFzfIe2pyykxdG7HGg8a8rW85tsNWYoqtwLbKNn++GjWX/40w0RZ8/bMCU3T9cAV8zydzHNcJfbu2jM2bVStSD2obi1kdEIlQr27OEmwpD7za09bxNFLm54EuPxd/8RFhMEw5EaXMBMEyQcuGyttMo32MHl6I7P1pS18JbuAtU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGhUTEFZZk11NVJuZWcyejMrdHQvWklHVXZaRmE4NjQza1BrSUxXaGVNdlVr?=
 =?utf-8?B?NmRwZkxraFpaWk1JZ0NpclhlbEFjaFYyWnBLVmFTWGhjd2lJdUdJTVBPaDlh?=
 =?utf-8?B?NlRLcWtrTCtPUkpUVkVhWnNnUjJvcHhWYVZvbkdmQkNodXBKVFdwcHh1azQ3?=
 =?utf-8?B?djhrNjBnN1dBWHhodGNEdk11Nmowd2dkdnh0UWJQNFBLMkpmOXdydDBBUUJ2?=
 =?utf-8?B?ZTVJVlVjVUgxOHB0M2h3UnNtVktpcEduNk1tOGNMNzc2TFFqbC9lMlVkQnR5?=
 =?utf-8?B?NFlHeCtkL1h0VE1XQTd4azExK1l5dEprblg4cEprWGExTzV1Z1A1OTF1UlZ1?=
 =?utf-8?B?V1JPWmpTczJTajZCQnREcWRKcXVNTlBaa3BYN2dta3UzeHZMQ1lvaWs2Z0ZF?=
 =?utf-8?B?Nkpydlhla2Z2MkdZbzB2RjdUZWh1S2JFa0QyUC9kaVcySjRWYUxPM1g0VlZl?=
 =?utf-8?B?VytoZG5pNW16Zm5EQW1kcndQVEU5US9pQkhGaWM0OGN2UHNNL1llMzNxYWZP?=
 =?utf-8?B?RFpoOWNtSWNETDBXNlQ1Mk5EOGRNbmJHVWptbzAyczFLU2NZZnVRQXRyMnlv?=
 =?utf-8?B?UVBQZWk0TDVuVHdONzV1V0JCWnc2SExieUQrSTRlTWlLM25iSmtPdDRpMkNH?=
 =?utf-8?B?QlA5YXBLODhudEN0eHVDRm1yK3Y1a1AxMkFLMFVNVmFBUHJLWjVGSHJZRDQ2?=
 =?utf-8?B?aUdqMTh3dHVwVlo3aG9ndkFYQmVSbFdwb2Yzbkt4N3VDeDZIUkpjQ2ZtRGJn?=
 =?utf-8?B?cVpqRUtpVVd1eWwxWFI0dEoweklRTTlVZ3drU2tqTUJrSWFua09tU3NGejA3?=
 =?utf-8?B?SWxWM0h4VDh6dlBMQlVqTlhNMGlNai9WSnpGWlluSWkwTFc2ZFV4azQ0bUp5?=
 =?utf-8?B?TlNCWFZlWGVQTzVubVhnMUpkOVE4VXFiNXRrZUVJZi9wSTB5OGxpSXByamtC?=
 =?utf-8?B?SHY0UFIyeWQxRzI0bERTK1dIaXlhREJSNHF0amlXdldhL2FSWkNxTjhkNFRj?=
 =?utf-8?B?RTdjcUlleWdqZUhRSHVVVlE0STRiMjdISkFtL251T2k2ZjN0SEhBS3V6YXVr?=
 =?utf-8?B?NWxFVjVKWU5aT3NCYVh6L1hpNG5STzArTWl1azVNRXZCV3Y5OERweTBjamdJ?=
 =?utf-8?B?NzZkNUl4TXFKRGlnM2xsMVZtUHl6YkJ2bXJqSVVOU1JsN2cxaDVTUkRCc0ZH?=
 =?utf-8?B?Ymg3b0tTNDRKdFRqREc3bTNsSjZGRzM5akEwZVF2ZndtT1BINW5mR1J6aFVW?=
 =?utf-8?B?UGhralZiRGMweUUzS0U1QUl2c1g0blBaU2FIZmdVUEI1R1ZQRXNrR0hORUVm?=
 =?utf-8?B?WFpUdzI4MWsvTUVQTk50czhpbjVMeFVoUG9ZSUxaSnp1QWVzR3Z3anQyK1V4?=
 =?utf-8?B?WjRJQ2xIREJWTGVnQ3p2Tlhkb05WK00vUE5ydFFYd0ZsVnRWTGd2NHNvcURD?=
 =?utf-8?B?aTFKSXJ2Zyt1Vi9QL1N1Y0FINENmQ0c0Y084VU9qRlVESjk5d3F4aDFYZ3E3?=
 =?utf-8?B?UUxjNjd5OWg0K3hSNUVQUFFVRkw2ajZJSWxLbjN5ZUZGWGNUMUZWWlQxSGs1?=
 =?utf-8?B?R2pzQ00yL1ZZa0ZSY0Fyd2Q1VldMZER1M1BKQ1VxKy83VUtLelh4YWEyNEpt?=
 =?utf-8?B?OE5DekkyYnI2cVpQdnpoMmtkbS9YZUZtL2lRczBnYUhUSkpTeGVPQWNuYlZV?=
 =?utf-8?B?eDZPNWp6ZlFZQm95L3lKcXVjZVhuWmppM053bkJZZkVwaFIwNSt0azgxV1lC?=
 =?utf-8?B?STNid3liTHFvVXFIZjFBZjJoS3VjL0dPQ1N0QU5rNGEyRENaVUlTZnFDZXpp?=
 =?utf-8?B?RVVpYmZzTkdvbkVQR2Jpb3NxL3ZPSlpnY25VUTJEMjJ5OEpKRkpVbmJCQTgw?=
 =?utf-8?B?TDdzQ3JTUUNMRlY2dnhMdCtNYWloWHhJVUszNlF3L09jSFVlNWdiT1JtSEEr?=
 =?utf-8?B?YWxwcjhNRWtyRWhNVmxEMHF3WS9YMGZNUEJlWk5HWjJxWXRReDMrTHYyN0RV?=
 =?utf-8?B?cHpmV2c5cm4vVkN1UG9RQmwvZWx2QVdacEtIOEc4MnAySm9CQXBxcVFaRWNS?=
 =?utf-8?B?WWloZHBEMElZZUtLM3h2TXplb1pUWFpmYXhvbXJqSWVOcG5EOHNuSWhvQkxk?=
 =?utf-8?B?RjZlMWJncy96S01aZzF4SkY1K3JQc2tFcEZvWFJveDIzRkVBNzFGRFNsd09l?=
 =?utf-8?B?YS83dHBBbTdKNVduZFZ1Z1dYdnZqTkppZUhlNzFETnhubmg4OWpNWDIvSHdn?=
 =?utf-8?B?VThEcXByNXZUdjlCT0k0aXh0MXdVcVhPdVpJT2RLcnc5ZXYra3dxbkt1ckpt?=
 =?utf-8?B?aitZZ1M5NVk5MjFuMUZyWG5GYWduWVZlSEtGcGZ3VmpxeEFZRVRMdz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be20fbe-389d-40f2-f23f-08df19541065
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7609.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:21:35.4537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4r7GZj/MvflqtvuAfnDYplFsLbaXf6DjFZ1yNB0Z+qq1AsjFXKa+nPCUSc7igWfa5jnWbqAixqChq2VadhBKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8106
X-purgate-ID: tlsNG-d25034/1790155297-034D7A5B-861885D8/0/0
X-purgate-type: clean
X-purgate-size: 13662

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/nestedsvm.c         | 100 ++++++++++++++++-------
 xen/arch/x86/hvm/svm/svm.c               |   4 +
 xen/arch/x86/hvm/svm/vmcb.c              |   3 +
 xen/arch/x86/hvm/svm/vmcb.h              |   6 ++
 xen/arch/x86/include/asm/hvm/svm-types.h |   2 +-
 xen/arch/x86/include/asm/msr-index.h     |   1 +
 6 files changed, 87 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 9e5e804a5b00..82e01e513e69 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -146,16 +146,15 @@ int cf_check nsvm_vcpu_reset(struct vcpu *v)
     svm->ns_exception_intercepts = 0;
     svm->ns_general1_intercepts = 0;
     svm->ns_general2_intercepts = 0;
+    svm->ns_general3_intercepts = 0;
 
     svm->ns_hap_enabled = 0;
     svm->ns_vmcb_guestcr3 = 0;
     svm->ns_vmcb_hostcr3 = 0;
     svm->ns_asid = 0;
     svm->ns_hostflags.bytes = 0;
-
     svm->ns_iomap = NULL;
 
-    svm->ns_gif = 1;
     return 0;
 }
 
@@ -416,6 +415,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         svm->ns_exception_intercepts = ns_vmcb->_exception_intercepts;
         svm->ns_general1_intercepts = ns_vmcb->_general1_intercepts;
         svm->ns_general2_intercepts = ns_vmcb->_general2_intercepts;
+        svm->ns_general3_intercepts = ns_vmcb->_general3_intercepts;
     }
 
     /* We could track the cleanbits of the n1vmcb from
@@ -444,6 +444,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         n1vmcb->_general1_intercepts | ns_vmcb->_general1_intercepts;
     n2vmcb->_general2_intercepts =
         n1vmcb->_general2_intercepts | ns_vmcb->_general2_intercepts;
+    n2vmcb->_general3_intercepts =
+        n1vmcb->_general3_intercepts | ns_vmcb->_general3_intercepts;
 
     /* Nested Pause Filter */
     if ( ns_vmcb->_general1_intercepts & GENERAL1_INTERCEPT_PAUSE )
@@ -472,6 +474,17 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         n2vmcb->_vintr.fields.intr_masking = 1;
     }
 
+    /*
+     * If L1 granted its L2 vGIF, the copy above already carried the enable
+     * and the GIF through.  Otherwise seed it set, as a VMRUN of a guest
+     * without vGIF starts with GIF set (APM vol.2 15.5).
+     */
+    if ( !ns_vmcb->_vintr.fields.vgif_enable )
+    {
+        n2vmcb->_vintr.fields.vgif_enable = 1;
+        n2vmcb->_vintr.fields.vgif = 1;
+    }
+
     /* Interrupt state */
     n2vmcb->int_stat = ns_vmcb->int_stat;
 
@@ -487,7 +500,8 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
     n2vmcb->virt_ext.bytes =
         n1vmcb->virt_ext.bytes | ns_vmcb->virt_ext.bytes;
 
-    /* NextRIP - only evaluated on #VMEXIT. */
+    /* NextRIP is consumed by VMRUN as the return address for injected soft events. */
+    n2vmcb->nextrip = ns_vmcb->nextrip;
 
     /*
      * VMCB Save State Area
@@ -652,10 +666,12 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
     int ret;
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
     struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *ns_vmcb;
+    struct vmcb_struct *ns_vmcb, *n1vmcb;
 
     ns_vmcb = nv->nv_vvmcx;
+    n1vmcb = nv->nv_n1vmcx;
     ASSERT(ns_vmcb != NULL);
+    ASSERT(n1vmcb != NULL);
     ASSERT(nv->nv_n2vmcx != NULL);
     ASSERT(nv->nv_n2vmcx_pa != INVALID_PADDR);
 
@@ -700,7 +716,8 @@ nsvm_vcpu_vmentry(struct vcpu *v, struct cpu_user_regs *regs,
         return ret;
     }
 
-    svm->ns_gif = 1;
+    ASSERT(n1vmcb->_vintr.fields.vgif_enable);
+    n1vmcb->_vintr.fields.vgif = 1;
     return 0;
 }
 
@@ -756,7 +773,7 @@ nsvm_vcpu_vmexit_inject(struct vcpu *v, struct cpu_user_regs *regs,
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
 
     ASSERT(vmcb->_vintr.fields.vgif_enable);
-        vmcb->_vintr.fields.vgif = 0;
+    vmcb->_vintr.fields.vgif = 0;
 
     ns_vmcb = nv->nv_vvmcx;
 
@@ -939,12 +956,18 @@ nsvm_vmcb_guest_intercepts_exitcode(struct vcpu *v,
             break;
         return 0;
 
-    case VMEXIT_VMRUN ... VMEXIT_XSETBV:
+    case VMEXIT_VMRUN ... VMEXIT_RDPRU:
         exit_bits = 1ULL << (exitcode - VMEXIT_VMRUN);
         if ( svm->ns_general2_intercepts & exit_bits )
             break;
         return 0;
 
+    case VMEXIT_INVLPGB ... VMEXIT_IDLE_HLT:
+        exit_bits = 1ULL << (exitcode - VMEXIT_INVLPGB);
+        if ( svm->ns_general3_intercepts & exit_bits )
+            break;
+        return 0;
+
     case VMEXIT_NPF:
         if ( nestedhvm_paging_mode_hap(v) )
             break;
@@ -1026,10 +1049,15 @@ nsvm_vmcb_prepare4vmexit(struct vcpu *v, struct cpu_user_regs *regs)
     /* TLB control */
     ns_vmcb->tlb_control = 0;
 
-    /* Virtual Interrupts */
-    ns_vmcb->_vintr = n2vmcb->_vintr;
-    if ( !svm->ns_hostflags.fields.vintrmask )
-        ns_vmcb->_vintr.fields.intr_masking = 0;
+    /*
+     * Virtual Interrupts.  #VMEXIT writes back V_TPR and V_IRQ (APM vol.2
+     * 15.6); the remaining fields do not change.  Copy vGIF back only if
+     * enabled in L1.
+     */
+    ns_vmcb->_vintr.fields.tpr = n2vmcb->_vintr.fields.tpr;
+    ns_vmcb->_vintr.fields.irq = n2vmcb->_vintr.fields.irq;
+    if ( ns_vmcb->_vintr.fields.vgif_enable )
+        ns_vmcb->_vintr.fields.vgif = n2vmcb->_vintr.fields.vgif;
 
     /* Interrupt state */
     ns_vmcb->int_stat = n2vmcb->int_stat;
@@ -1437,19 +1465,30 @@ nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack)
 bool
 nestedsvm_gif_isset(struct vcpu *v)
 {
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
-    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
+    struct nestedvcpu *nv = &vcpu_nestedhvm(v);
+    struct vmcb_struct *n1vmcb = nv->nv_n1vmcx;
+    struct vmcb_struct *n2vmcb = nv->nv_n2vmcx;
+    struct vmcb_struct *ns_vmcb = nv->nv_vvmcx;
 
-    /* get the vmcb gif value if using vgif */
-    if ( vmcb->_vintr.fields.vgif_enable )
-        return vmcb->_vintr.fields.vgif;
-    else
-        return svm->ns_gif;
+    /*
+     * An L2 with no vGIF of its own shares L1's GIF.  L0 keeps that shared
+     * GIF in the L2 shadow, to keep an L2 CLGI off the host's.
+     */
+    if ( nestedhvm_vcpu_in_guestmode(v) &&
+         !ns_vmcb->_vintr.fields.vgif_enable )
+        return n2vmcb->_vintr.fields.vgif;
+
+    /*
+     * The VMCB virtual GIF is authoritative.
+     */
+    return n1vmcb->_vintr.fields.vgif;
 }
 
 void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v)
 {
+    struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
     unsigned int inst_len;
+    vintr_t intr;
 
     /*
      * STGI doesn't require SVME to be set to be used.  See AMD APM vol
@@ -1464,7 +1503,9 @@ void svm_vmexit_do_stgi(struct cpu_user_regs *regs, struct vcpu *v)
     if ( (inst_len = svm_get_insn_len(v, INSTR_STGI)) == 0 )
         return;
 
-    vcpu_nestedsvm(v).ns_gif = 1;
+    intr = vmcb_get_vintr(vmcb);
+    intr.fields.vgif = 1;
+    vmcb_set_vintr(vmcb, intr);
 
     __update_guest_eip(regs, inst_len);
 }
@@ -1485,10 +1526,9 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
     if ( (inst_len = svm_get_insn_len(v, INSTR_CLGI)) == 0 )
         return;
 
-    vcpu_nestedsvm(v).ns_gif = 0;
-
     /* After a CLGI no interrupts should come */
     intr = vmcb_get_vintr(vmcb);
+    intr.fields.vgif = 0;
     intr.fields.irq = 0;
     general1_intercepts &= ~GENERAL1_INTERCEPT_VINTR;
     vmcb_set_vintr(vmcb, intr);
@@ -1504,10 +1544,17 @@ void svm_vmexit_do_clgi(struct cpu_user_regs *regs, struct vcpu *v)
 void svm_nested_features_on_efer_update(struct vcpu *v)
 {
     struct vmcb_struct *vmcb = v->arch.hvm.svm.vmcb;
-    struct nestedsvm *svm = &vcpu_nestedsvm(v);
     u32 general2_intercepts;
     vintr_t vintr;
 
+    /*
+     * These accelerate the L1 VMCB.  A world switch loads an EFER rather
+     * than writing one, and an L2 EFER write says nothing about L1; the L2
+     * shadow is configured in nsvm_vmcb_prepare4vmrun().
+     */
+    if ( nestedhvm_vmswitch_in_progress(v) || nestedhvm_vcpu_in_guestmode(v) )
+        return;
+
     /*
      * Need state for transfering the nested gif status so only write on
      * the hvm_vcpu EFER.SVME changing.
@@ -1515,7 +1562,6 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
     if ( nsvm_efer_svm_enabled(v) )
     {
         if ( !vmcb->virt_ext.fields.vloadsave_enable &&
-             paging_mode_hap(v->domain) &&
              cpu_has_svm_vloadsave )
         {
             vmcb->virt_ext.fields.vloadsave_enable = 1;
@@ -1525,11 +1571,9 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
             vmcb_set_general2_intercepts(vmcb, general2_intercepts);
         }
 
-        if ( !vmcb->_vintr.fields.vgif_enable &&
-             cpu_has_svm_vgif )
+        if ( !vmcb->_vintr.fields.vgif_enable )
         {
             vintr = vmcb_get_vintr(vmcb);
-            vintr.fields.vgif = svm->ns_gif;
             vintr.fields.vgif_enable = 1;
             vmcb_set_vintr(vmcb, vintr);
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1552,7 +1596,6 @@ void svm_nested_features_on_efer_update(struct vcpu *v)
         if ( vmcb->_vintr.fields.vgif_enable )
         {
             vintr = vmcb_get_vintr(vmcb);
-            svm->ns_gif = vintr.fields.vgif;
             vintr.fields.vgif_enable = 0;
             vmcb_set_vintr(vmcb, vintr);
             general2_intercepts  = vmcb_get_general2_intercepts(vmcb);
@@ -1574,5 +1617,6 @@ void __init start_nested_svm(struct hvm_function_table *hvm_function_table)
         cpu_has_svm_lbrv &&
         cpu_has_svm_nrips &&
         cpu_has_svm_flushbyasid &&
-        cpu_has_svm_decode;
+        cpu_has_svm_decode &&
+        cpu_has_svm_vgif;
 }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index a8d258aa3980..074f09a0e0e9 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1660,6 +1660,8 @@ static void svm_dr_access(struct vcpu *v, struct cpu_user_regs *regs)
 
     TRACE(TRC_HVM_DR_WRITE);
     __restore_debug_registers(vmcb, v);
+    if ( nestedhvm_enabled(v->domain) && nestedhvm_vcpu_in_guestmode(v) )
+        vmcb_set_dr_intercepts(v->arch.hvm.svm.vmcb, 0);
 }
 
 static int cf_check svm_msr_read_intercept(
@@ -1990,6 +1992,8 @@ static int cf_check svm_msr_write_intercept(
     case MSR_K8_SYSCFG:
     case MSR_K8_VM_CR:
     case MSR_AMD64_EX_CFG:
+    case MSR_K8_HWCR:
+    case MSR_K8_VM_IGNNE:
         /* ignore write. handle all bits as read-only. */
         break;
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index d069280a4da8..5354c4f1b85f 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -194,6 +194,9 @@ static int construct_vmcb(struct vcpu *v)
 
     vmcb->_vintr.fields.vnmi_enable = cpu_has_svm_vnmi;
 
+    /* GIF is set out of reset; with vGIF its value lives in the VMCB. */
+    vmcb->_vintr.fields.vgif = 1;
+
     return 0;
 }
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index 3760f71a8625..d098bf1d1355 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -288,7 +288,13 @@ enum VMEXIT_EXITCODE
     VMEXIT_MWAIT_CONDITIONAL= 140, /* 0x8c */
     VMEXIT_XSETBV           = 141, /* 0x8d */
     VMEXIT_RDPRU            = 142, /* 0x8e */
+    VMEXIT_INVLPGB          = 160, /* 0xa0 */
+    VMEXIT_INVLPGB_ILLEGAL  = 161, /* 0xa1 */
+    VMEXIT_INVPCID          = 162, /* 0xa2 */
+    VMEXIT_MCOMMIT          = 163, /* 0xa3 */
+    VMEXIT_TLBSYNC          = 164, /* 0xa4 */
     VMEXIT_BUS_LOCK         = 165, /* 0xa5 */
+    VMEXIT_IDLE_HLT         = 166, /* 0xa6 */
     /* Remember to also update VMEXIT_NPF_PERFC! */
     VMEXIT_NPF              = 1024, /* 0x400, nested paging fault */
     /* Remember to also update SVM_PERF_EXIT_REASON_SIZE! */
diff --git a/xen/arch/x86/include/asm/hvm/svm-types.h b/xen/arch/x86/include/asm/hvm/svm-types.h
index 256bf5b91402..24363a58ffcb 100644
--- a/xen/arch/x86/include/asm/hvm/svm-types.h
+++ b/xen/arch/x86/include/asm/hvm/svm-types.h
@@ -44,6 +44,7 @@ struct nestedsvm {
     uint32_t ns_exception_intercepts;
     uint32_t ns_general1_intercepts;
     uint32_t ns_general2_intercepts;
+    uint32_t ns_general3_intercepts;
 
     /* Cached real MSR permission bitmaps of the l2 guest */
     unsigned long *ns_cached_msrpm;
@@ -66,7 +67,6 @@ struct nestedsvm {
     uint64_t ns_vmcb_guestcr3, ns_vmcb_hostcr3;
     uint32_t ns_asid;
 
-    bool ns_gif;
     bool ns_hap_enabled;
 
     union {
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index ad1c6c97f8f7..beb858bf99bb 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -250,6 +250,7 @@
 #define MSR_K8_VM_CR                        _AC(0xc0010114, U)
 #define  VM_CR_INIT_REDIRECTION             (_AC(1, ULL) <<  1)
 #define  VM_CR_SVM_DISABLE                  (_AC(1, ULL) <<  4)
+#define MSR_K8_VM_IGNNE                     _AC(0xc0010115, U)
 
 #define MSR_VIRT_SPEC_CTRL                  _AC(0xc001011f, U) /* Layout matches MSR_SPEC_CTRL */
 
-- 
2.34.1


