Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D44CC982EA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:21:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429925.1652560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAC-0004Fu-Qw; Wed, 23 Sep 2026 09:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429925.1652560; Wed, 23 Sep 2026 09:21:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAC-0004Fn-Ms; Wed, 23 Sep 2026 09:21:16 +0000
Received: by outflank-mailman (input) for mailman id 1429925;
 Wed, 23 Sep 2026 09:21:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9JAB-0004FI-Eo
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:21:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JAA-00CYaM-Rq
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:21:14 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a02-8faa-0a2a0a5109dd-0a2a4506e7d4-22
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:14 +0200
Received: from [40.93.195.61]
 (helo=SN4PR2101CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a09-195a-0a2a45060019-285dc33dd2fe-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:14 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by BL4PR03MB8106.namprd03.prod.outlook.com (2603:10b6:208:591::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:21:12 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:21:12 +0000
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
 b=S39SDGmxQNfwCfkqBzSUJakOgaha7dWJ+R9dFHD+aUJmI0HrMoKtVWs+yYUugIeCPrlZSJBtmIRfttVEhpOl3sFJLkNHBjohuAl3M25kJKhQU128Y08am4BDWcIofHU4XN3vOn96aqDs6QL43iS3PKLprUBs6bDdJ1R0VKbx+j7xd0FTSBq/oJ75zuesLlxWOIvBHDdWUqRXnQ+xt9ynq5ebGWD6J5uqnuxOB79N5uZn71gv3EfpNZZFzpxMXbRnV399YPWty0SA6gqmQKVQAjzy6BivLTbtJk2/vuJ2iOQaierA59W1Duve/SrPaaVeqE730JOj7XTL9gNy6Wn1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NJv1vhwGLQHHcsMb5ZEwN2EqsKM7E/Z918v8aaivmyo=;
 b=jCo/KppaYkWkB41GNMMQwWJnNTKiwvT3MCxZY7AGTmlpMY0B7drI2qcDNtDSf1JdB8tz4xHE/Y4eRbA7ePClAzivnQT3qGfIheKi7JsW/YKvZ6xnInbj2nnhEq2wstcaynySxyk4JMcGNWMDto04xqt2idVlN63tWm8lGjZRFoMbmKquuCvthHnY0pi/zRcV1Xya1nSbKaGAmKsq9NCAzwlvYBnlB6tpanaUOOwT2gQQkk9JJ8hARPq+xk82yFUylSxAv8bO2E8lJJGj8FOX4M2RhsazaJbSrTKsfaYOePCZLIrG2lAUYjsGfjo52ukgVvmmMPhkkGjucE4M5wy/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NJv1vhwGLQHHcsMb5ZEwN2EqsKM7E/Z918v8aaivmyo=;
 b=Pr9Y1JZ6B0J1jC9vcPcuYtU0SomyldOqCveqHr/epUK0IJveE9jY8ILmvFPjrf4hxuE7MXCFkoyJXPkntSNXxUMHYYf7BPbKC/ZjO6zd5Z8X687N5Ii0nsrgi+zQHEEjLXdLNr/Gc9U/nJ7AlGeT5/QcLAtWooAq1Kleya8FSgI=
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
Subject: =?UTF-8?q?=5BPATCH=C2=A0v1=201/5=5D=20x86/nestedsvm=3A=20update=20vmrun=20without=20pending=20or=20deferred=20flag?=
Date: Wed, 23 Sep 2026 17:20:41 +0800
Message-Id: <6a89e46dcdeaed7a0cae11356eec54dcb81d8701.1790146987.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790146987.git.chunjie.zhu@citrix.com>
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:820:d::6) To LV3PR03MB7609.namprd03.prod.outlook.com
 (2603:10b6:408:283::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|BL4PR03MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 124a2cbe-d91c-4672-ebce-08df19540257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	9H0jnOuhh3Dd82ucZ5UnfarBVRFOMklt9oE0FHiv4GgIJqZjJlacXuIgJyIFyGaZ2thDJkTIsVhRfO+G6o7zgRFH4M4OBqPK/0BUHhZyjPAz3mec00IuP53i4O91a39rAA4guDSM+G5BVhbbgkqq1wUdaTIdBGKhnLiHVKhlHmFKX/DvtsVJlbr3UgIzhTVR4hjtuDuQXnaJz1WrjRxcy2RSxYeOtw8JcQqTZ5B34u1F7NlV2XVW5vtYHtb+SmmNu2TLaX6TUpkNVbG+0zLLvPKbja4gG/SpNQ9c2aul4jKllIhvHwMC7AsbY4lnKj6HD//GoaT0aiy2C9yja6nzJ2mUinW5CTYJFhhX8aywtSeF5aAh3Jj+0nvgMJykDwjW/xIBp1ZSmwG19yTNTfqE3R5I6KyaGckj0LKOJgGQMJIGpGR7DZp5SJN01gzllIboI6Kj73d46v+TZ6m1TwwuJ9us9Obc0jkLTVJrLBNyK/1ue6hdDuzDiCeRKQyeUrCcVHWREAunNN+vYQ5V/GGxk3T2wLSyvImy2jpW5eKCmiObCOaNFKFKCdAXQGY1+ZgaIVR4pda3E8yT8qnYLbpITbrI3WuQs9YZlmy0rEMxKT19XUR7D82XCvPSgZjAfllb7cizVgWp6ugz6En+sb2o981O5YRfIiumLXEAAQLAyao=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckNSSElCbWUrWERNNDQ0VXd4ZXFlbmRQcjFjWmk1VFRxWWhyUlRGVkpGUHhE?=
 =?utf-8?B?TS9lUHBYcXJYZHR1TmRqVmRiYnFiZlp0ai91bThPTjV3Sm05RGJMTkhNMUkr?=
 =?utf-8?B?ckNPQVhBaXBxNzNsdnhTWEpxY0JucXNnS2pwRkZZanFFVDJMbm90bkR1THNm?=
 =?utf-8?B?ZE1tY3NzbDN6RGltS3dQWXpQSkNDaUNFOXNQcjBCd1A0V2NXQ3BDR2h1dDVK?=
 =?utf-8?B?a2htWWxxS29GUStadGZPUUo2U0cwMTFXRkl6ZFRkQ3dYNTBCTGsrMG1FY0px?=
 =?utf-8?B?Y096dXh3Q25QT2dLZkV4Z3NSbVFIUm94NnVKdzQ3WjJpbTJYZit5M1VZWVdF?=
 =?utf-8?B?VEIxRWpNejhwMzFXZFZLWWFqcXJ0T0xrdUVYZTZQV3QyVHhFUWxFQjFkbktn?=
 =?utf-8?B?MHJlc0FwWlFkZm1lVGdKYkxqMWxPUTFZNEExbDhKeVdaZEhqZjdsSzByeC8w?=
 =?utf-8?B?VlcybVZtdDMvZlBMN2NzZlVLQ2tsRHJGWVVmMHBCQzlhOWFJVkc1amtJdCtn?=
 =?utf-8?B?M1I0TmJ2NzlJWXA0WDNLOVUxNHlVbDZQZmFIc1o0NjdvdE9GYml1ZTdoK2FF?=
 =?utf-8?B?MzRoYURQZ3NqTmk5bVdlb05PSXE3NGE2dGVBYmJRYlA2aWViV2tYSGl2SEg3?=
 =?utf-8?B?akVRZjM2NnhVdEwxenNmVGREUjA0UndNT0JnMElLYTQzcFpwS0NnTFBZR2gr?=
 =?utf-8?B?Z2oxeEJkeDBuZVVGTCtpWGNLOFVwcVplS3U1RWlkbi81U3lUOXc2a2xqVldX?=
 =?utf-8?B?Uy83KzJEMkNMckpKOC9OSlRSZU9EQVVwV2FEalVkNHlMbnZucldRZmoxc0pO?=
 =?utf-8?B?S0dhZVFQaUxiV3VZUHFEdEVDM0UrNHF4OFg1MHByeXVPZlpML1dDK0dnOXhl?=
 =?utf-8?B?Y2s4UFM1bFFUSnBQeGlpOVFOd2N5anRXdC9ldHJaOVdFdm1rNzJURnpCRkxo?=
 =?utf-8?B?d1ptR0l2MWZQbkFzVkpxQzd0a2s1UmE2VU9qU0Nob3BXUktNd1ZJZ08xeFhQ?=
 =?utf-8?B?b1gyREhWTVJGTC9ydFBDSlBBc1huQjM1YjNFOUl3SzlveHRNSVdwd0xjNGRs?=
 =?utf-8?B?YjRvMG9CRFFuK1B6WFRLRGtROTNBWUJuV1FKYjRoYUZLUUdpcWNQYkpFTlFv?=
 =?utf-8?B?azRMcEdIN05SVVN1UzZXeVJMSkxFci9tZmpuZHdyd3lUd1lSNVRCRVZvRWt5?=
 =?utf-8?B?RVg2RjVlVGtyWSsxNk9ZMDluOXhmcTdnK1ZvYWZzdEprSEtiUFhIVTVjaHJW?=
 =?utf-8?B?QnBSZmlMMnQ0cFVEd05XSVBIUmtnLzdnVnJoNTAwRVE1dFBYczEzTkwyQnI1?=
 =?utf-8?B?OUNqUGYyZ1lBQ3VTMTkwMU9IcGVEejRaT25vOXNmZzNDRnRjZDZJbFh4ZU1E?=
 =?utf-8?B?WDk2aTJWZXBZc1pLVGltck1WeGkzN2FUR3Q4dXBVS3VkdG1jV1BVVEVnU21r?=
 =?utf-8?B?TzhaMXlFbmJ5Z1pJOHFxTXFIKzYxNktGaS9qMkcwU3RWa2E3enI2bnVHVndv?=
 =?utf-8?B?NTRMYXJmTUExb2o5bzBxZVFqSFNpUzF3T0JXbGNEZGhkNmhtMDFnM0QzMkN0?=
 =?utf-8?B?cXVoVmxvVjdmckRmWmZVMXhJeisySHg4eDBuRU1BcFRxVVk0d3ZHUVpWZ2tz?=
 =?utf-8?B?ckpqbUVoNlI4RDBwckxTMEtvVksxWkxpbW5PaDg1eUFmOFF1UGVMMnNEbVVv?=
 =?utf-8?B?UHp1cXBEeCs3aGQ3SzBDbDJ0ZDJLVlFkdHVFaitXaXFtSjRaMmFlcVlZTlJQ?=
 =?utf-8?B?OUoyemZZaGtMdVlUNVNZdHpzM0s2aGovNjUrMDg0WCtyckE2bzJncGpuWnpE?=
 =?utf-8?B?UEtNRS9Kd0hqTEcxWm1oVEhON1pNamdUZ3ZhMElaL25WdXFvV3NZVk9CQXNG?=
 =?utf-8?B?U2hIRUFnZ21TbHVkK1hQRm1jeXdoUmYzQXpkejNRbXNJZ0NDdnI0dFYwaWZy?=
 =?utf-8?B?TWtWSis3aytiWWlVWUtBY2h5cVFncmJjNkJwRVc2cmFVZkJUQmlwR2xQemxa?=
 =?utf-8?B?bWdsK0dBNDUrUmxqVWMrTWVSazRoSnh4eVhjUmFzMWVCZXRYWFdwMGZsZ0Y5?=
 =?utf-8?B?SmZLUGUyMzJXOEt2V3V5dW44Mm96VUE4K1VtR0VWU3ltZTlZTmNmcHd3VWlj?=
 =?utf-8?B?aGcrY0xaTWNONUoxamQzY1pXdU1zeFdCR0paVllJRUVpb3ZkditnQkwwbUEr?=
 =?utf-8?B?KzhabHNuV2l3S05KTkk1Z3p2MkEzZ2djVnc1am8rd1dtTWpXc0NyUnN1UEFZ?=
 =?utf-8?B?S1pOUzdxMzVJeVowU3ZSZlJ3SmlQbTF5anJFdVJaWDB5NEY3Y09jYW1SYTNw?=
 =?utf-8?B?UjFWa0lQYzZiaEs2ZGE4akJpcGJwZyswREI1bXdWM01jTlpmaStnUT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 124a2cbe-d91c-4672-ebce-08df19540257
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7609.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:21:12.0164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1uR958YQLkLg7W0wALNkrBhijhcIDRBj5fExlUs8hBtDbhGgb1FmDl++DDkdFELsS/C15bgnLctDb1+MKSf4TA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8106
X-purgate-ID: tlsNG-16d1c6/1790155274-FE67277B-A46F138D/0/0
X-purgate-type: clean
X-purgate-size: 6729

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/entry.S      | 48 +++++++++++++++++++++++--------
 xen/arch/x86/hvm/svm/nestedhvm.h  |  1 +
 xen/arch/x86/hvm/svm/nestedsvm.c  | 31 +++++++++++++++++++-
 xen/arch/x86/hvm/svm/svm.c        | 11 +++++--
 xen/arch/x86/x86_64/asm-offsets.c |  1 +
 5 files changed, 77 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/entry.S b/xen/arch/x86/hvm/svm/entry.S
index d9613a2a8fed..59d865635fd5 100644
--- a/xen/arch/x86/hvm/svm/entry.S
+++ b/xen/arch/x86/hvm/svm/entry.S
@@ -28,31 +28,51 @@ FUNC(svm_asm_do_resume)
         GET_CURRENT(bx)
 .Lsvm_do_resume:
         call svm_intr_assist
-        call nsvm_vcpu_switch
-        ASSERT_NOT_IN_ATOMIC
 
-        mov  VCPU_processor(%rbx),%eax
-        lea  irq_stat+IRQSTAT_softirq_pending(%rip),%rdx
+        /*
+         * The nested p2m repair below may need to take nestedp2m_lock and
+         * issue synchronous cross-CPU TLB flush IPIs, doing this with
+         * interrupts disabled can deadlock.
+         */
         xor  %ecx,%ecx
-        shl  $IRQSTAT_shift,%eax
-        cli
-        cmp  %ecx,(%rdx,%rax,1)
-        jne  .Lsvm_process_softirqs
-
         cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
 UNLIKELY_START(ne, nsvm_hap)
+        cmpb $0,VCPU_nhvm_guestmode(%rbx)
+        UNLIKELY_DONE(z, nsvm_hap)
+        cmpb $0,VCPU_nhvm_stale_np2m(%rbx)
+        jne  .Lsvm_update_nestedp2m
         cmp  %rcx,VCPU_nhvm_p2m(%rbx)
         sete %al
         test VCPU_nhvm_guestmode(%rbx),%al
         UNLIKELY_DONE(z, nsvm_hap)
+.Lsvm_update_nestedp2m:
         /*
-         * Someone shot down our nested p2m table; go round again
-         * and nsvm_vcpu_switch() will fix it for us.
+         * The nested p2m table is stale, fix it here.
          */
-        sti
+        mov  %rbx,%rdi
+        call nsvm_vcpu_update_nestedp2m
         jmp  .Lsvm_do_resume
 __UNLIKELY_END(nsvm_hap)
 
+        ASSERT_NOT_IN_ATOMIC
+
+        mov  VCPU_processor(%rbx),%eax
+        lea  irq_stat+IRQSTAT_softirq_pending(%rip),%rdx
+        xor  %ecx,%ecx
+        shl  $IRQSTAT_shift,%eax
+        cli
+        cmp  %ecx,(%rdx,%rax,1)
+        jne  .Lsvm_process_softirqs
+
+        cmp  %cl,VCPU_nsvm_hap_enabled(%rbx)
+        je   .Lsvm_vmenter
+        cmpb $0,VCPU_nhvm_guestmode(%rbx)
+        je   .Lsvm_vmenter
+        cmpb $0,VCPU_nhvm_stale_np2m(%rbx)
+        jne  .Lsvm_retry_nestedp2m
+
+.Lsvm_vmenter:
+
         call svm_vmenter_helper
 
         clgi
@@ -148,4 +168,8 @@ __UNLIKELY_END(nsvm_hap)
         sti
         call do_softirq
         jmp  .Lsvm_do_resume
+
+.Lsvm_retry_nestedp2m:
+        sti
+        jmp  .Lsvm_do_resume
 END(svm_asm_do_resume)
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bb04a043430..e22ef259c171 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -41,6 +41,7 @@ void cf_check nsvm_vcpu_destroy(struct vcpu *v);
 int cf_check nsvm_vcpu_initialise(struct vcpu *v);
 int cf_check nsvm_vcpu_reset(struct vcpu *v);
 int nsvm_vcpu_vmrun(struct vcpu *v, struct cpu_user_regs *regs);
+void nsvm_vcpu_update_nestedp2m(struct vcpu *v);
 int cf_check nsvm_vcpu_vmexit_event(struct vcpu *v,
                                     const struct x86_event *event);
 uint64_t cf_check nsvm_vcpu_hostcr3(struct vcpu *v);
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a8b15d6eae05..171b32be2416 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -361,6 +361,35 @@ static void nestedsvm_vmcb_set_nestedp2m(struct vcpu *v,
     n2vmcb->_h_cr3 = pagetable_get_paddr(p2m_get_pagetable(p2m));
 }
 
+void nsvm_vcpu_update_nestedp2m(struct vcpu *v)
+{
+    struct nestedvcpu *nv;
+    struct nestedsvm *svm;
+    struct p2m_domain *p2m;
+
+    ASSERT(v != NULL);
+
+    nv = &vcpu_nestedhvm(v);
+    svm = &vcpu_nestedsvm(v);
+
+    if ( !nestedhvm_paging_mode_hap(v) )
+        return;
+
+    p2m = p2m_get_nestedp2m(v);
+
+    /*
+     * This may happen if we've handled VMEXIT_NPF at the same time as a
+     * nested flush IPI from another CPU.  We've got a different P2M so the
+     * host CR3 needs updating.
+     */
+    if ( svm->ns_vmcb_hostcr3 != vmcb_get_h_cr3(nv->nv_vvmcx) ||
+         vmcb_get_h_cr3(nv->nv_n2vmcx) !=
+         pagetable_get_paddr(p2m_get_pagetable(p2m)) )
+        nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
+
+    nv->stale_np2m = false;
+}
+
 static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
 {
     struct nestedvcpu *nv = &vcpu_nestedhvm(v);
@@ -516,7 +545,7 @@ static int nsvm_vmcb_prepare4vmrun(struct vcpu *v, struct cpu_user_regs *regs)
         /* host nested paging + guest nested paging. */
         vmcb_set_np(n2vmcb, true);
 
-        nestedsvm_vmcb_set_nestedp2m(v, ns_vmcb, n2vmcb);
+        nsvm_vcpu_update_nestedp2m(v);
 
         /* hvm_set_cr3() below sets v->arch.hvm.guest_cr[3] for us. */
         rc = hvm_set_cr3(ns_vmcb->_cr3, false, true);
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index e6a0edcf71ab..fc447d24d67e 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -2118,6 +2118,8 @@ static void
 svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
                     struct vcpu *v, uint64_t vmcbaddr)
 {
+    int rc;
+
     if ( !nsvm_efer_svm_enabled(v) )
     {
         hvm_inject_hw_exception(X86_EXC_UD, X86_EVENT_NO_EC);
@@ -2131,8 +2133,13 @@ svm_vmexit_do_vmrun(struct cpu_user_regs *regs,
         return;
     }
 
-    vcpu_nestedhvm(v).nv_vmentry_pending = 1;
-    return;
+    rc = nsvm_vcpu_vmrun(v, regs);
+    if ( rc )
+    {
+        if ( nestedsvm_vcpu_vmexit(v, regs, VMEXIT_INVALID, 0, 0) ==
+             NESTEDHVM_VMEXIT_FATALERROR )
+            domain_crash(v->domain);
+    }
 }
 
 static struct page_info *
diff --git a/xen/arch/x86/x86_64/asm-offsets.c b/xen/arch/x86/x86_64/asm-offsets.c
index baf266ab8013..772d1959e5a5 100644
--- a/xen/arch/x86/x86_64/asm-offsets.c
+++ b/xen/arch/x86/x86_64/asm-offsets.c
@@ -129,6 +129,7 @@ void __dummy__(void)
 
     OFFSET(VCPU_nhvm_guestmode, struct vcpu, arch.hvm.nvcpu.nv_guestmode);
     OFFSET(VCPU_nhvm_p2m, struct vcpu, arch.hvm.nvcpu.nv_p2m);
+    OFFSET(VCPU_nhvm_stale_np2m, struct vcpu, arch.hvm.nvcpu.stale_np2m);
     OFFSET(VCPU_nsvm_hap_enabled, struct vcpu, arch.hvm.nvcpu.u.nsvm.ns_hap_enabled);
     BLANK();
 #endif
-- 
2.34.1


