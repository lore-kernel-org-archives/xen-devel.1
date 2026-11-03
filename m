Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAE3606A327
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZE90cJ9t
Received: from list by lists.xenproject.org with outflank-mailman.1469741.1678497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOE1X-0008Os-5g; Tue, 03 Nov 2026 12:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469741.1678497; Tue, 03 Nov 2026 12:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOE1X-0008Ok-3A; Tue, 03 Nov 2026 12:53:59 +0000
Received: by outflank-mailman (input) for mailman id 1469741;
 Tue, 03 Nov 2026 12:53:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOE1V-0008OT-VC
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 12:53:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOE1V-007FLq-BO
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 13:53:57 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d953-2eae-0a2a0a5409dd-0a2a4508d06c-46
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:53:57 +0100
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9d965-f659-0a2a45080019-d155802ed47d-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 13:53:57 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4a218c463d1so27924455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 04:53:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2aa481a45sm51437475e9.7.2026.11.03.04.53.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 04:53:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793710437; x=1794315237; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rFrjfLJvymmO7wm+shvpLfY3kMeh2pY6kKTI+A0f32s=;
        b=ZE90cJ9tivhpn8kGvzWYAYuZBat9z5bZMLhYzHTBMFVChZ3ayUErjgHfEgn9PU2tgU
         RHiwkNv2J8PYtEHBiu8fPWb694crg63f8aCm+i8o0Raz5kLT4njg4XCP5Z3pk3vTdzsC
         mjiY2LT7UTxemBosjVBybG9H+5If8bugSdfxbryU7iVDEzXwmM8SZ5wJss3Wn272LWYb
         Uom1Tk489kPrqfVlyKIdHr3769PlX6k73MNbDMYoG9rdsXHRqC0uE9SM+IWKOAclpqGw
         E2t8J1zJSh05KHYdAAoAqFsc2ki02s59/QWDJzyoNivE7b2tyVQaJnj/W4hZMWGm5q+J
         fX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710437; x=1794315237;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFrjfLJvymmO7wm+shvpLfY3kMeh2pY6kKTI+A0f32s=;
        b=ChHUKPd10UlQC25qtUyaQQBRIFFFs889lpLnuloZ+qFTdSmp8joREoIFF4+EWE5cAD
         VfH//oxKk0+eDpKEsAJ6ejmDzaM1jARG4yeUye5BclW/LlSCzK3TNN+rg5S5CZsj3+Ya
         oLZsJsO32gbe2kVlH0Dl6ig4F7o1tsmJfDsGiTvGsQMRMMm97WJ8+kXya7E6iC5n8XxC
         GxQsvpJRkzuevc7m1AzcP+fy3qyImrE5DD9t/PBTmCaja9vsjRPddzTJX1khJMz50Zkv
         2WSixz2l2d0X0mz+STxR3OxEh7Zn1n2sNmvWJzjjNvQRHa2cefDfI1lm5GWAYiJs6opi
         kiEA==
X-Gm-Message-State: APuU4Z9fDM42QguBHcEFioBJTwMHryI56mVRShl4QJw442V9wwARqRLx
	6YyCxt2icD9c9djo46+ai2BUdRQhJUqFaEMdf683EDKvcIjX/+NGuVB9GxUre0H9m3gVqdk9pB7
	SrniFmg==
X-Gm-Gg: AYBFou3IsZ6QUvwF0JOenItiNTdDvOiAB3NB5zjEluO2V64YrnnNrdzIRDV2+Pnh/rF
	D7ffQZ1I2Di27HkQyZK6vGDw6YBigzvcw2FduPiQI4xBGKD4q92qYbT7bKJJyq59vlvTBk45GHj
	ceiEd+RNnlKYotkbOtCpbeyxktOWtGG4zn2Y24sB4hBUZWBHtx4f1endlUtxDE+/+UWEQKC3Jku
	MuAVCPy55Bess16olL8tpO85zbbinmHfi3LcVlu7FQW3vdv8kJvIT/9Zfshvq1WXUyTIaOhdcNM
	NQD1mnk2RPrhR/wqI709vZIS5s2nCD9POkjR0pDwuj/jmDWwSzXddXCr5spOjMmme4TvH1oWzLt
	6KUui9cAcAHPRx+GHFeGvbGXk/kZ5RnrVyQG9GK9WAr1npn2/69kZRSiqXUbJIdUpSZOvZEzTPi
	ICdrXhrxEkjjCaxbdhZ7tXY0TjgfSiOC/3gDZKt9Id95nM8/vqWHDsA/UwAKel9+dfMmVQVdzVf
	YWWBWz8xLLbZ/ws/L3ndrWxHNYlLVQNJhh8MaPuDhZNSGAEpwI5Juk8oMmFyzD0rxjo6kQYFxoq
	T40NunAmRfpwuQs6lw4AVGVz/T2z0zkiful3Rck6WEWqqO2AH3/xE25G6YfEXW8b/1nMds0Ly+i
	TfpdhanL8jtkevFG8/5l8FsUNAyWJQpCW0K7jLg==
X-Received: by 2002:a05:600c:4e43:b0:4ab:e27d:e241 with SMTP id 5b1f17b1804b1-4ac180f28f7mr283466735e9.15.1793710436812;
        Tue, 03 Nov 2026 04:53:56 -0800 (PST)
Message-ID: <9cd6da48-7a5e-4971-93e1-7d7262ddf7fc@suse.com>
Date: Tue, 3 Nov 2026 13:53:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/cpufreq: allocate processor_pminfo[] dynamically
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1793710437-DFAD487B-DE4682C9/10/78276251493
X-purgate-type: spam
X-purgate-size: 5035
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

There's no need to have a NR_CPUS-dimensioned static array there.

As ordering of pre-SMP initcalls isn't well-defined, allocate the array
from both cpufreq_presmp_init() and cpufreq_register_driver().

Alongside adding a few NULL checks, drop a redundant one from
get_cpufreq_para().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -104,8 +104,7 @@ static int get_cpufreq_para(struct xen_s
     pmpt = processor_pminfo[op->cpuid];
     policy = per_cpu(cpufreq_cpu_policy, op->cpuid);
 
-    if ( !pmpt ||
-         ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
+    if ( ((pmpt->init & XEN_PX_INIT) && !pmpt->perf.states) ||
          /* Avoid NULL deref of pmpt->perf.states[] */
          ((pmpt->init & XEN_CPPC_INIT) && pmpt->perf.state_count) ||
          !policy || !policy->governor )
@@ -369,7 +368,7 @@ int do_pm_op(struct xen_sysctl_pm_op *op
 
     if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
         return -EINVAL;
-    pmpt = processor_pminfo[op->cpuid];
+    pmpt = processor_pminfo ? processor_pminfo[op->cpuid] : NULL;
 
     switch ( op->cmd & PM_PARA_CATEGORY_MASK )
     {
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -227,7 +227,7 @@ int do_get_pm_info(struct xen_sysctl_get
 
     if ( !op || (op->cpuid >= nr_cpu_ids) || !cpu_online(op->cpuid) )
         return -EINVAL;
-    pmpt = processor_pminfo[op->cpuid];
+    pmpt = processor_pminfo ? processor_pminfo[op->cpuid] : NULL;
 
     switch ( op->type & PMSTAT_CATEGORY_MASK )
     {
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -218,7 +218,7 @@ int cpufreq_limit_change(unsigned int cp
     struct cpufreq_policy policy;
 
     if (!cpu_online(cpu) || !(data = per_cpu(cpufreq_cpu_policy, cpu)) ||
-        !processor_pminfo[cpu])
+        !processor_pminfo || !processor_pminfo[cpu])
         return -ENODEV;
 
     perf = &processor_pminfo[cpu]->perf;
@@ -273,7 +273,7 @@ int cpufreq_add_cpu(unsigned int cpu)
     unsigned int shared_type;
 
     /* to protect the case when Px was not controlled by xen */
-    if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
+    if ( !processor_pminfo || !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
     if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
@@ -448,7 +448,7 @@ int cpufreq_del_cpu(unsigned int cpu)
     const struct xen_psd_package *domain_info;
 
     /* to protect the case when Px was not controlled by xen */
-    if ( !processor_pminfo[cpu] || !cpu_online(cpu) )
+    if ( !processor_pminfo || !processor_pminfo[cpu] || !cpu_online(cpu) )
         return -EINVAL;
 
     if ( !(processor_pminfo[cpu]->init & (XEN_PX_INIT | XEN_CPPC_INIT)) )
@@ -563,6 +563,9 @@ int set_px_pminfo(uint32_t acpi_id, stru
     struct processor_pminfo *pmpt;
     struct processor_performance *pxpt;
 
+    if ( !processor_pminfo )
+        return -ENOMEM;
+
     cpu = get_cpu_id(acpi_id);
     if ( cpu < 0 || !perf )
     {
@@ -726,6 +729,9 @@ int set_cppc_pminfo(unsigned int acpi_id
     int ret = 0, cpu_id;
     struct processor_pminfo *pm_info;
 
+    if ( !processor_pminfo )
+        return -ENOMEM;
+
     cpu_id = get_cpu_id(acpi_id);
     if ( cpu_id < 0 )
     {
@@ -947,6 +953,11 @@ static struct notifier_block cpu_nfb = {
 
 static int __init cf_check cpufreq_presmp_init(void)
 {
+    if ( !processor_pminfo )
+        processor_pminfo = xvzalloc_array(struct processor_pminfo *, nr_cpu_ids);
+    if ( !processor_pminfo )
+        return -ENOMEM;
+
     register_cpu_notifier(&cpu_nfb);
     return 0;
 }
@@ -954,6 +965,11 @@ presmp_initcall(cpufreq_presmp_init);
 
 int __init cpufreq_register_driver(const struct cpufreq_driver *driver_data)
 {
+    if ( !processor_pminfo )
+        processor_pminfo = xvzalloc_array(struct processor_pminfo *, nr_cpu_ids);
+    if ( !processor_pminfo )
+        return -ENOMEM;
+
    if ( !driver_data || !driver_data->init ||
         !driver_data->verify || !driver_data->exit ||
         (!driver_data->target == !driver_data->setpolicy) )
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -32,7 +32,7 @@
 #include <public/sysctl.h>
 
 struct cpufreq_driver __read_mostly cpufreq_driver;
-struct processor_pminfo *__read_mostly processor_pminfo[NR_CPUS];
+struct processor_pminfo **__read_mostly processor_pminfo;
 DEFINE_PER_CPU_READ_MOSTLY(struct cpufreq_policy *, cpufreq_cpu_policy);
 
 /*********************************************************************
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -59,7 +59,7 @@ struct processor_pminfo {
     uint32_t init;
 };
 
-extern struct processor_pminfo *processor_pminfo[NR_CPUS];
+extern struct processor_pminfo **processor_pminfo;
 
 struct px_stat {
     uint8_t total;        /* total Px states */

