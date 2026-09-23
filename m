Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE2EC982FA
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2026 09:21:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1429927.1652568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAK-0004XM-1B; Wed, 23 Sep 2026 09:21:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1429927.1652568; Wed, 23 Sep 2026 09:21:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9JAJ-0004XF-Ue; Wed, 23 Sep 2026 09:21:23 +0000
Received: by outflank-mailman (input) for mailman id 1429927;
 Wed, 23 Sep 2026 09:21:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <chunjie.zhu@citrix.com>) id 1x9JAI-0004Vv-Aj
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 09:21:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9JAH-001WWY-Nt
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 11:21:21 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a06-e002-0a2a0a5209dd-0a2a4501e712-32
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:21 +0200
Received: from [52.101.57.28]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <chunjie.zhu@citrix.com>)
 id 6ab39a10-5984-0a2a45010019-3465391cae0b-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 11:21:21 +0200
Received: from LV3PR03MB7609.namprd03.prod.outlook.com (2603:10b6:408:283::12)
 by BL4PR03MB8106.namprd03.prod.outlook.com (2603:10b6:208:591::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 09:21:19 +0000
Received: from LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c]) by LV3PR03MB7609.namprd03.prod.outlook.com
 ([fe80::146d:1d33:b619:386c%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 09:21:19 +0000
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
 b=y7hxGjT1n4EHplx1pcSXpP8ynOLsMTtTW44XPM1nXzjP+s7UfPguNaG/hTvK63cubGNTLJWziDycReNVna3b8zMpq5Uz7uyweYyh9uOjpr63Qx17dgVVEq+OUGQ8qHk7rwK853kKlCQdaoclYUMf9NqTzemq5qpFi9cWAszWrJB9tz5tM1yFW8hQRW+Gfp0MlCyhBewbu9yI7D/l8zdZHxCUt4IKtZQGQPHSR5wL7n4ltMFnrs9AljCo9HcjsujrsukO5SemicEAd7CZvHW+SeTHovBPDfHc9x3uWEHUFcEV381W1OHGdiBvFcfusfFjhfkAokBh1IR1jTB5cIZWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GntJNyGKX+o72A97gHkQ6+ZdCb8ar/MTVXAUW4MR3h4=;
 b=MXvwLgbKAsQEiCq6AyTGQHXkLc9jGjIsi06DD0+yVRBJho37cuGASW0JwJzPnMF2SS5FLfeKrKEDZ3noCbIB+VxjDwr+pi+iuEu1do4Ae9yZmOM5o/zO/dLeT35jOjHGMzwOvTZMqdQfw1Sp1Vurjju89C4Kl69kYRirKdeZKa9dcFiNNE06oWZ+O/VJuKC/z3KZKsIONOm5+T2Bk2EUv6v9E0EwTApji4CLxQ9fCUGDgbJG9C/PJoTAAT8VS43Yd/6M81Drf3UlHJ68ofNMbXbqmG6G5VI774rjlLPam2XQ00t1sfYNFgb0jo+5/CmY/cmuGR/claVYFEvkWsVphA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GntJNyGKX+o72A97gHkQ6+ZdCb8ar/MTVXAUW4MR3h4=;
 b=lvqGp0Mp0QuLYlkPQwcuvLgDpHosqRmW6yiR6zpqtrfN+pj7wa+vYpmyxbnzlf6EzloXMx0Amikovpdt7qQUm1cBfVYnvZyzajPqqHXWhu0wTF+vwQOpJJMCQgRaCL1G4lQIkbM9VjqcovEESP3zRzd1kbvBacjYqh7gnElKn1M=
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
Subject: =?UTF-8?q?=5BPATCH=C2=A0v1=202/5=5D=20x86/nestedsvm=3A=20remove=20nv=5Fvmentry=5Fpending?=
Date: Wed, 23 Sep 2026 17:20:42 +0800
Message-Id: <ffad0da885db7155f9f67dc7d52af3f00b8a4c6c.1790146987.git.chunjie.zhu@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790146987.git.chunjie.zhu@citrix.com>
References: <cover.1790146987.git.chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KUZPR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:d10:25::9) To LV3PR03MB7609.namprd03.prod.outlook.com
 (2603:10b6:408:283::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR03MB7609:EE_|BL4PR03MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: 610ea4d2-b8c8-4c63-c623-08df195406a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	EP9FLdFdg26AJAAxGxhO1iJ7//umdIuL1g73pYOIUk5f56ArOvuhJTHdFZ7PC+XJ8Txclx5Tjfgwnw616zql2WNuAdKBFHblhobnSG6REKW6T68Vb2gPRs8PCtGxx6VJADpxetpuagMi+JvTTyraoF0DT5HfyyhTPv+RXYCuh7uA11U9p/d+hRxsvbYFqucaGWZX+SI3P8GZlmhh5ftogr0S6RN2rHnqo0DMTljB82cgJCoqV1G30F3DVqOT2dqeQmd223IWPtcm/RLMeSkG960TRg3fn+a1m4EyMHPwpe+N5ezvekxiSq1y1wu3JcVqEw/yF0nsxV4CGV11ngMazXRfJYj4LAu0k7oJD/mJ0utHhqV5T47EObdxdHMSoPG+ww7vc+bzB0VzYEMZCcpifdlDvp/461w/bDX+hmdonXyrATNbpwF6/SFeVRtAuGlDmt/FzWepoRdz+AQe/9VrazB+24qImLR1JvHZirl5+wPo7hwtMVPgqCjY3kYRGtQBC6ryvW9O3NmvFwtpKd2mtdAjwpivwtr7w0iiwJE1ODtZYSTvXFmASQDMZotwwDd9f3ByEee7yfGQPbfI5lCZySZEnYNNOB/hsGq1EC3ZPE1RzhSyuEcv0fqBSy9hvlERNzrqxNwytSMREBVEbrZt7/6tjDCGeD9OytHMElYosVg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR03MB7609.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVNlUFF4UEQ4U2E1T1dGSDhHT0pRYmxISE02UU1Od1FnYU5Ga0lJY1g0ZGVl?=
 =?utf-8?B?TUZ0Zk91OHU1alQ1bUpuUURPYUdrTk11MnRTSE8wVGQ2QmpVZVlDaEdZT1Vw?=
 =?utf-8?B?Mmdzd01VeHBudklNQlZXcldmWUZsN1h1cjU2dldHNTF1endLdnhLTDIxcTBm?=
 =?utf-8?B?em1Ga3Z3R2QxQ1BLdjFsWHlBanhmc21MVXJZTC9VVFJZWFRiVFZSd05xVEQz?=
 =?utf-8?B?dXNzMC9ndis0SHMxY2EyYlRma2ViRVNudTJtTWFWRUhXM1N6V3dUdUhXejFP?=
 =?utf-8?B?L2VNZG1HeFhzVGp0NGJBV0h4U3ZFNkFJblNLYkhqVFRwWDRJTmNYd1duaGo0?=
 =?utf-8?B?b3NkVlZqUGo0RWc4V3FTTU94RWFVMXQ3eEZXQ1Zod25wdTNrYzNhck85NDM2?=
 =?utf-8?B?RkpvcUUxbE16L0I3cEVMYzBTcEFlMjZjK2ZMM3lLcnVyQVZUMlNGcU91cVVn?=
 =?utf-8?B?U21rUVdCNnpYSWZMeEJ4L0JtQ25zeDB6L1puWXgrc1dzS2twVWljREVjbGcy?=
 =?utf-8?B?NjNJWExWTDF5MXo5dHRZeWhFbWJpc1RSaHRnS1VhR3grTzd4dVlZbm8vYktG?=
 =?utf-8?B?bWhTSC8zKzVIUFBPU2lyZC9Nb1k2TW1kd2Z5KzRTaExOcGR2eGJsamFiZjRO?=
 =?utf-8?B?dlU3UHBOU05Ya2YzOFFRSWpDNU43YkZIUHNjTUp4VkJHWE1EbWF0VkVnL29X?=
 =?utf-8?B?WWFNTUUxc0lFOEVSdHhNNjZEa3V1V3h4L28vQ2Q2eDNjMm1XNE5pMml5VFRM?=
 =?utf-8?B?WGZSZmYvYlAvU2JhNzlmQzRzbEpoMUVWa0MrT2hLOGVScE5GYVJ0U3FiL1V1?=
 =?utf-8?B?SFhBZnRScGpGRXBMdDBEK0VIZHl2Z0ZYRGtOZ2JuK3NQOGg5NE1xMTFoWWJ0?=
 =?utf-8?B?ZDZKakZVcWdrV0o4bHdvTmZGZGlQRUpaY0lGNlNQZWJUaGxyeVRqaG1Mb0Fw?=
 =?utf-8?B?a2dBbkVMU1p5dTRYQjVKbnRlR21BVllDa2hNNyttblIzQy9hbnoxcWx4Yndz?=
 =?utf-8?B?cWxLY1RKTi94UURSb204K0FNUEIvMkpXSGo1ZkJVb1hFcEZMTnNmSFcwMXZR?=
 =?utf-8?B?K0d4VVBBdVdvcmkwOEQ3dFkvblVQSFMvZytYdFAyZ1BSeitlRXF3RGc1Y2l0?=
 =?utf-8?B?dmlWcDBucFpYWEZMVWlqWnUrM1BKd3hNZGRkTWRYMmhDbjE1T2hxUU52aTY2?=
 =?utf-8?B?a211TW0raEJzKzZhOWt6OWpDRkVKYWI0U3NLU2ZPTllWdVJUQTl1Um5FZkIx?=
 =?utf-8?B?YXVINFlvNDZlWnE3eHJqdGpSSlcvdVB5M1VMMHpub01JbmgxVVV0SUVDNW5V?=
 =?utf-8?B?Z1VBV0ZnK2FMRGhDc3NrcEc0RVZzcE5nWHl6K0ptWDlKZUdFT0JXdmRQUG1X?=
 =?utf-8?B?aStPQXpKUnc3TVhSRGxCK2M5akx2NzZ3YkZhMlBwOXBvSnBRMWF2VFp4N09Y?=
 =?utf-8?B?eWZPL09ScGhydlRSZVZqTnBNL3JpQmlFOEx4NU5nZGNWUmwxMlE0d2ZKeDVi?=
 =?utf-8?B?emdBdTJ4bkVVblpDL3hRcGd4eEpDK3dhM1pBMjBFcVptYklLaythQ01EZWpa?=
 =?utf-8?B?UW5lRzFZcHlLZzdGS2FwMGtrRVZiRXZSWTl1TVdNeEFZMUpvd0llRWtHaldj?=
 =?utf-8?B?eVNBZ2JkWWhzY1B3eWlOb1BIbVh2NjMvakdKUWJ1ckpFSzFYVUV3UGpBY2tQ?=
 =?utf-8?B?bkVjbU5SV0xwL2ZBU09jWFVSOG9mN0JwNVZ5NXJlclZKVXJTajU4Z1RmZjF6?=
 =?utf-8?B?K01Jc3JWTm9DZ0ZBWVNUL3NLdlBTTUpaSjVkOVY2d1hHckpkb0lxVTZ6dC9I?=
 =?utf-8?B?SnVmZktaaHdJTmZHbWJkQnF3allkOVduMERwSms0WEx5MFlYU0U1NUFZZzQ1?=
 =?utf-8?B?b3ZXWXRJa1Vad0craURtMUl0UTNJMUpiVnRDalpvUnM3ZU5rcDZyZ2ZsVGdU?=
 =?utf-8?B?VUdZUVZpZGlLQi9ZVWlFL2g3aHZiS1ZTNjFpSWIyOWg3ZHdkclhBUmV5L3Zk?=
 =?utf-8?B?SDliaXhIaGIrTjgwM291WkxlOVk0ZjFsTTk4RldVeGFwbHIyZEtiZCtMOUx5?=
 =?utf-8?B?UVVYbFYwL0ZEWlorMVI1RnFGbVlqOU42ekVUdmhTRk1DUTlZTWV4bUJnVm05?=
 =?utf-8?B?TUxtU1NoQU5KQ0hidktQYVpzOEhLMlRsQjlDcWRNZDNJaE5qTEFWRUw3VU1K?=
 =?utf-8?B?Yjh3N1dHNkZ1SlY5Q01GckF6dFNqbGJtSXV0dW56L1JkTEgvRUZtZXFuRyt4?=
 =?utf-8?B?cEF1QmZjdjhvNVlsRFV3ZG45RlpCazlGaVMzN3Z0N1E1Z2lmUVd6WENDaURp?=
 =?utf-8?B?SzVQajQ3Q3lOK2VGZVJNTlI1ODM2N3RLbkNhclBtK1JobmJSMk5uQT09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 610ea4d2-b8c8-4c63-c623-08df195406a1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR03MB7609.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 09:21:19.1961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yr5d/4M3ntgE6QKDeIlnaW4Y3tav0f2FbTVUWHeCt4qP5VQJ659Cf4KSahcgQN3T91gva/5YAjPJWbKAkkiEjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR03MB8106
X-purgate-ID: tlsNG-d62444/1790155281-1EA66757-57A7FBCC/0/0
X-purgate-type: clean
X-purgate-size: 2512

From: Chunjie Zhu <chunjie.zhu@citrix.com>

Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>
---
 xen/arch/x86/hvm/svm/intr.c      | 18 ------------------
 xen/arch/x86/hvm/svm/nestedsvm.c | 23 -----------------------
 2 files changed, 41 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 4b0debfa9a2e..7f6cafb6db78 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -77,24 +77,6 @@ static void svm_enable_intr_window(struct vcpu *v, struct hvm_intack intack)
 
     ASSERT(intack.source != hvm_intsrc_none);
 
-    if ( nestedhvm_enabled(v->domain) )
-    {
-        struct nestedvcpu *nv = &vcpu_nestedhvm(v);
-
-        if ( nv->nv_vmentry_pending )
-        {
-            struct vmcb_struct *gvmcb = nv->nv_vvmcx;
-
-            /* check if l1 guest injects interrupt into l2 guest via vintr.
-             * return here or l2 guest looses interrupts, otherwise.
-             */
-            ASSERT(gvmcb != NULL);
-            intr = vmcb_get_vintr(gvmcb);
-            if ( intr.fields.irq )
-                return;
-        }
-    }
-
     TRACE(TRC_HVM_INTR_WINDOW, intack.vector, intack.source,
           vmcb->event_inj.v ? vmcb->event_inj.vector : -1);
 
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index 171b32be2416..edb3f444756d 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -1433,31 +1433,8 @@ void asmlinkage nsvm_vcpu_switch(void)
     vmexit:
         nestedsvm_vcpu_vmexit(v, regs, svm->ns_vmexit.exitcode);
         nv->nv_vmexit_pending = 0;
-        nv->nv_vmentry_pending = 0;
         return;
     }
-
-    if ( nv->nv_vmentry_pending )
-    {
-        int ret;
-        ASSERT(!nv->nv_vmexit_pending);
-        ret = nsvm_vcpu_vmrun(v, regs);
-        if ( ret )
-            goto vmexit;
-
-        ASSERT(nestedhvm_vcpu_in_guestmode(v));
-        nv->nv_vmentry_pending = 0;
-    }
-
-    if ( nestedhvm_vcpu_in_guestmode(v) && nestedhvm_paging_mode_hap(v) )
-    {
-        /* In case left the l2 guest due to a physical interrupt (e.g. IPI)
-         * that is not for the l1 guest then we continue running the l2 guest
-         * but check if the nestedp2m is still valid.
-         */
-        if ( nv->nv_p2m == NULL )
-            nestedsvm_vmcb_set_nestedp2m(v, nv->nv_vvmcx, nv->nv_n2vmcx);
-    }
 }
 
 /* Interrupts, Virtual GIF */
-- 
2.34.1


