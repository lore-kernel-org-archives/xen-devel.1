Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7271BCA5FF0
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 10:24:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441346.1658934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2Lp-0001hY-JX; Tue, 06 Oct 2026 10:24:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441346.1658934; Tue, 06 Oct 2026 10:24:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xE2Lp-0001hR-G5; Tue, 06 Oct 2026 10:24:49 +0000
Received: by outflank-mailman (input) for mailman id 1441346;
 Tue, 06 Oct 2026 10:24:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xE2Lo-0001hJ-KJ
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 10:24:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xE2Lo-00Bgz2-0h
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 12:24:48 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4cc60-bab6-0a2a0a5309dd-0a2a4504a8ac-36
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:24:47 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac4cc6f-b57f-0a2a45040019-d1558035ccc3-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 12:24:47 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4a168355946so5425095e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 03:24:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17c7b7f00sm13803035e9.13.2026.10.06.03.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2026 03:24:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791282287; x=1791887087; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3whEvDDGudRFBdQmtdVS8fdNXFeYB7xx89+j7BgZ5Lk=;
        b=Tw+ppuiycfn2E7gT+WLsgoB2D9tVBpqtKWk8ztjx+HWwPM1fj7k4D5DteER3AbqIfC
         EiWp5DIv9GIMkVDzcHoqK8hqrkCGUkBuo2f7KpY/fGniyk57FJKhr6X9RyG0SxG+t7SW
         5BcXZ8EeCEedJuT87HtmIrhnC6yb/n+3FyKGqISBbw3/UojOG1QGG1iFwnrB4ppBgf+a
         Eo7A1WxE6EytsQEOaJignkwSz7aT7rEKAWW8bMnWeyeslU7ocW94s35ArMh2yenwH1eJ
         RSfBYrBrCpVcUyw98z8vDNG86hJ5SaDajTCjbe7B3wlcpJgdBjagdAKxKqn1bnX7WZ+2
         fCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282287; x=1791887087;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3whEvDDGudRFBdQmtdVS8fdNXFeYB7xx89+j7BgZ5Lk=;
        b=R+8gEYCrWkgAUNSDabh1u3vo0O4Ck9fG2HilvCwg90PmVk5JJwL/ePPrfqA3kEqU8z
         YFtbb2/xdGpYvMeSkfcqcAWbioALXKCVNqTbwgbgSycmqiHZT+wo0JkZcmHSCVwY2K8k
         7S3lSOQjkSpPz+BKUCTo19tPG1tr+ZAaLAvVVh0ymQ8WmOvqQ8QIYFdnMfWWC7vJURPt
         ezKhmvTxAqdLcgCb3NkYSSR8O7vIqDZGWrANt/JPj8+D0PtGYjIXPVulFDRpgI05So85
         kFnaj6KDdWCB33j03TKaYBj/ldtpcFHmUGPSaqDoTsJrGrG7Tt2QiQPq5+k4gSSYaFOH
         F2nA==
X-Gm-Message-State: AFuF++n70nveKciTxgUtPdYiaOpaAxa1XL9j90iSlttq87OIavjLLX4/
	Q6ZyOuS1pYmwaV8mNK5kMHiDLCk1rKiHRMiNHB5K7vvlulQVaeTsEr0DBtuV0REzHeMisrZlvlA
	7acyZIA==
X-Gm-Gg: AYBFou3HewtIuCzHZ2ayFamL+1QKwznoe20kDadUc+rPXE3tJ2GXpLatZ+aoyKjkGdA
	LzbwAcZHTmpwSrKBzshjeWZFRgoZmDKZmRuOORBbKA0pFnRrAQzQDiltze4c9tJYppHtjRatthD
	afVxXHZ2oOxkKSmsZ4sKviSApVy0bhqqP8ko/B8uFhsnFfsCzT1izJHBjF7I5R10TVQyGLx/OZV
	WGS6k3Viq02SojYbJwzkw+xD9I7BarHHeja8A7IhuorcjgWRoLL9jWsr118vx59M+atNqeJzeON
	+HiKeCMW7YDj8VviC7O6jtYAF5hjRkHBSsgaqDTRscXH3gH77djC7j5biBJNVdSEcxU+NGr7kB2
	laRvRVhlQ2JlLZt4fNGqk4TCvCXYx5joM+Tp23Ax2m5cM6x82inhIzBJvj4ukDTreH3hsjfu+mC
	4QLMjerGxdpmGyIPctQDbam/mM+aw6PbPNBq4jc6pjEzDAGtEh/9X4KinYIbXqBxk+Bscvpn0RJ
	N7ojJORzRJgM5ylaKE9N4sPgxE3HilccdeO1Cb9rtwdRqXGTvgVwM36hT8ldhvLa6OvcIgn5w==
X-Received: by 2002:a05:600c:c491:b0:49e:69ff:c6b1 with SMTP id 5b1f17b1804b1-4a17b562d60mr16865665e9.31.1791282287291;
        Tue, 06 Oct 2026 03:24:47 -0700 (PDT)
Message-ID: <29e67a54-119d-4991-a301-5f0351b125d7@suse.com>
Date: Tue, 6 Oct 2026 12:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: add noreturn in a few more places
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
X-purgate-ID: tlsNG-ebf023/1791282287-52ECEB50-99D6B3A7/10/78276251493
X-purgate-type: spam
X-purgate-size: 3545

start_secondary(), do_double_fault(), play_dead(), and tboot_s3_error()
never return, so would better be annotated anyway.

context_switch() and continue_running() are odd: We can't
(unconditionally) add noreturn to their declarations, as Arm's variants do
return. Put the attribute on x86'es definitions instead (the use of
unreachable() in reset_stack_and_call_ind() allows the compiler to figure
that out itself, but Eclair wants the annotation in addition).

Note that adding "noreturn" to do_double_fault() causes new violations of
the same rule (2.1) at the two call sites in entry_from_{pv,xen}().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2916849077

entry_from_pv() wants the annotation only when PV=n, yet once added gcc
then warns about "return" being used in a "noreturn" function. Is there
any other approach to address this besides adding #ifdef inside the
function (i.e. replacing the !IS_ENABLED(CONFIG_PV) check that's there)?
Perhaps need to deviate it?
---
v2: Drop entry_from_{pv,xen}() changes, for being controversial.

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2163,7 +2163,7 @@ static void __context_switch(void)
     per_cpu(curr_vcpu, cpu) = n;
 }
 
-void context_switch(struct vcpu *prev, struct vcpu *next)
+void noreturn context_switch(struct vcpu *prev, struct vcpu *next)
 {
     unsigned int cpu = smp_processor_id();
     struct cpu_info *info = get_cpu_info();
@@ -2240,7 +2240,7 @@ void context_switch(struct vcpu *prev, s
     reset_stack_and_call_ind(nextd->arch.ctxt_switch->tail);
 }
 
-void continue_running(struct vcpu *same)
+void noreturn continue_running(struct vcpu *same)
 {
     reset_stack_and_call_ind(same->domain->arch.ctxt_switch->tail);
 }
--- a/xen/arch/x86/include/asm/cpuidle.h
+++ b/xen/arch/x86/include/asm/cpuidle.h
@@ -26,7 +26,7 @@ static inline int mwait_idle_init(struct
 int cpuidle_init_cpu(unsigned int cpu);
 void cf_check default_dead_idle(void);
 void cf_check acpi_dead_idle(void);
-void play_dead(void);
+void noreturn play_dead(void);
 void trace_exit_reason(u32 *irq_traced);
 void update_idle_stats(struct acpi_processor_power *power,
                        struct acpi_processor_cx *cx,
--- a/xen/arch/x86/include/asm/tboot.h
+++ b/xen/arch/x86/include/asm/tboot.h
@@ -126,7 +126,7 @@ int tboot_in_measured_env(void);
 int tboot_protect_mem_regions(void);
 int cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler);
 int tboot_s3_resume(void);
-void tboot_s3_error(int error);
+void noreturn tboot_s3_error(int error);
 int tboot_wake_ap(int apicid, unsigned long sipi_vec);
 #else
 static inline void tboot_probe(void) {}
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -326,7 +326,7 @@ static void set_cpu_sibling_map(unsigned
     }
 }
 
-void asmlinkage start_secondary(void)
+void asmlinkage noreturn start_secondary(void)
 {
     struct cpu_info *info = get_cpu_info();
     unsigned int cpu = smp_processor_id();
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1080,7 +1080,7 @@ const char *vector_name(unsigned int vec
     return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
 }
 
-void asmlinkage do_double_fault(struct cpu_user_regs *regs)
+void asmlinkage noreturn do_double_fault(struct cpu_user_regs *regs)
 {
     unsigned int cpu;
     struct extra_state state;

