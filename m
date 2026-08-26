Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D18C5DF97
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 12:36:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399919.1635892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCrT-0003ca-QU; Wed, 26 Aug 2026 12:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399919.1635892; Wed, 26 Aug 2026 12:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzCrT-0003cT-Nf; Wed, 26 Aug 2026 12:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1399919;
 Wed, 26 Aug 2026 12:36:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzCrS-0003cN-3A
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 12:36:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzCrQ-0085EP-4f
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 14:36:08 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8eddae-2eae-0a2a0a5409dd-0a2a4502db4e-16
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:36:04 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8eddb4-6ca4-0a2a45020019-d155d034dc9c-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 14:36:04 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-69c600f76ccso1406693a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 05:36:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a9ef4d2sm359613266b.59.2026.08.26.05.36.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 05:36:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1787747764; x=1788352564; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rv3V08n1rNWcfH/Wq0wKEeP+mXrRm3kizeLFPwSWLhY=;
        b=adfZchmCAKiv8NPfyWAXfNBx1SkefDpDM01wpDVZzd9A3I5bxC0tdbYKaHbGBiDNpp
         ZoQvbXhuhw17vV7xEdAVwy/lv6OxLUUDzdYG06y/UZAcwsNiUAqziFVAKUG18PD7Zfzv
         xjDKaUOSsFH94SRLn+SipUsS4mWQhk8v2Lps2Uu9QlU18fvHxeI0E1lJyPlu5br32Ic1
         NxnIZRz1nKT4IMk78ABd1iv3cMD2ocoDNmBbdAQM3Z2nQZkgIrkaOhMd5uqHzG9Ezipj
         yCXcB7ypGiqPv6w0ivuqQduY0TZkdIRSVU/gOw6R8n8HdtWXX5epV60LsuguQ3ntWRdu
         ZmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747764; x=1788352564;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rv3V08n1rNWcfH/Wq0wKEeP+mXrRm3kizeLFPwSWLhY=;
        b=ZZNrJpCAV4U/g+6+7IJE89eM9KveK7Hb67S4+inyRa3xeSkA1pR0gJHXllP7XF781t
         m/V6VIlNm+jEGgoi8cqYgg0lLyEiPFj3O6IChF8KJS96oirOzl4DRItTQ2ie2+y97Jxi
         aNuZ8JvG/kJzLHu5nuSBLJjlG08eA75JpFeScR1FHhP8+473/IXZK4E+iWZepLqlsd4c
         XQVgtHKA0jPoLkjFrD0Imp0glt80ABl+oQlH4ZeurrRt9BTBxYdIuae6828hEA6FsEld
         Ik9KO4swztgT11eYs9quM3UGdkmMIx9WLpKWzvGhehRO4S23YvvdW5HmH5sLQI4rFc9L
         oO6Q==
X-Gm-Message-State: AFuF++nAHNvkrRKpFaXg4OdqxFWg+CtHQx3hui51bnE1HN7vB+xO0FCu
	vYE9yAFtnuyqVJuBoi6tfKe5TMmEj6HydVeag1i78r94K042hS/3IW4gUPwDru9ray/TG4afpiP
	vs83ufA==
X-Gm-Gg: AR+sD12TAIVk7FkdD5SZ+OaSqT7V8tiEaBrefR8YMXbO2MScw2A3JjAFfEETbBzb1mo
	I2NoBpgYRmMKdDNOCKKoCT1h0KompoQJa0XvX2GDR340K+eNANeljAA0EHg3wnEBXxsK2kxiH+9
	zA60JuKnqFzZIUiH3BptWsLygjmz5VDfq0wDE0/Utt20ndRtAjuS5/J9QUhLwPnwoaj9pAHah8D
	+RYrIUPt6w6TJ6ssnGrlVELWokR5LfRjyt6i9hEQd03VN1Zok9QBPDGOQAM9CX1n4wwC+dDVfeF
	EflrdVOepJddl5Jx9oUc2orq9KghlIE9cq6xd44VZa9hrWwPTN8E3gvXjGrJZ9pnRYv8qubya3a
	hOBRfUTLA+dQAz35fQXgmrMwDEa/ElsAAx4DggnUVrAxjHgNSWWOexvvLvwdTczgz6e/bq2sfQ8
	GRP4qP/SsBiCNdzQJEfseJYR6Iz01mILlq7M1Qt5sFHJ/l0lTuHNVQFPMlBvX4F+TwrkAs5Jkcz
	xDl75bHkThJIuGxCSB7lpxxXiDESmTIvcIy2O33c/94oHw/yJbW
X-Received: by 2002:a17:907:72c1:b0:c20:1c9d:8d4b with SMTP id a640c23a62f3a-c250bb05c0fmr805557266b.2.1787747764400;
        Wed, 26 Aug 2026 05:36:04 -0700 (PDT)
Message-ID: <b9c89c9f-20e1-441c-bf77-7da42eafdae3@suse.com>
Date: Wed, 26 Aug 2026 14:36:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, George Dunlap <gwd@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: always park offline CPUs
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
X-purgate-ID: tlsNG-720697/1787747764-F18AC2AC-7DDEEEF2/0/0
X-purgate-type: clean
X-purgate-size: 6947

While on AMD (or Hygon) CPUs the situation isn't as bad wrt broadcasting
of #MC, some "multicast" can still happen. Therefore the reasoning to park
CPUs rather than fully offlining them applies everywhere.

Don't retain the dependency on the "mce=" cmdline option either: That
option may best be dropped as well, as not enabling MCE will result in a
shutdown when #MC would otherwise be raised.

Drop the global variable, using a #define (just like common code does)
instead. Outside of common code, simplify expressions / code accordingly.
(In common code we still have to cater for x86 wanting it different from
everyone else.)

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
As it was never actually used after its introduction, we may want to
further consider dropping CPU_REMOVE again.

I was almost certain that we would have at least one place (presumably a
CPU notifier handler) were we assumed no parking for AMD/Hygon. Yet I
couldn't find anything; did I overlook the crucial bits?

--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -436,7 +436,7 @@ static void cf_check dump_cx(unsigned ch
 
         if ( cpu_online(cpu) )
             print_acpi_power(cpu, power);
-        else if ( park_offline_cpus )
+        else
             printk("CPU%u parked in state %u (C%u)\n", cpu,
                    power->last_state ? power->last_state->idx : 1,
                    power->last_state ? power->last_state->type : 1);
@@ -1360,7 +1360,7 @@ long set_cx_pminfo(uint32_t acpi_id, str
          * If we've just learned of more available C states, wake the CPU if
          * it's parked, so it can go back to sleep in perhaps a deeper state.
          */
-        if ( park_offline_cpus && apic_id != BAD_APICID )
+        if ( apic_id != BAD_APICID )
         {
             unsigned long flags;
 
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -432,9 +432,6 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
-	if (!(c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
-		park_offline_cpus = opt_mce;
-
 	initialize_cpu_data(0);
 }
 
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -716,15 +716,8 @@ static int cf_check cpu_callback(
         rc = cpu_bank_alloc(cpu);
         break;
 
-    case CPU_UP_CANCELED:
-    case CPU_DEAD:
-        if ( !park_offline_cpus )
-            cpu_bank_free(cpu);
-        break;
-
     case CPU_REMOVE:
-        if ( park_offline_cpus )
-            cpu_bank_free(cpu);
+        cpu_bank_free(cpu);
         break;
     }
 
--- a/xen/arch/x86/genapic/x2apic.c
+++ b/xen/arch/x86/genapic/x2apic.c
@@ -181,12 +181,8 @@ static int cf_check update_clusterinfo(
              !cond_alloc_cpumask_var(&per_cpu(scratch_mask, cpu)) )
             err = -ENOMEM;
         break;
-    case CPU_UP_CANCELED:
-    case CPU_DEAD:
+
     case CPU_REMOVE:
-        if ( park_offline_cpus == (action != CPU_REMOVE) ||
-             system_state == SYS_STATE_suspend )
-            break;
         if ( per_cpu(cluster_cpus, cpu) )
         {
             cpumask_clear_cpu(cpu, per_cpu(cluster_cpus, cpu));
--- a/xen/arch/x86/include/asm/percpu.h
+++ b/xen/arch/x86/include/asm/percpu.h
@@ -1,7 +1,7 @@
 #ifndef __X86_PERCPU_H__
 #define __X86_PERCPU_H__
 
-#define PARK_OFFLINE_CPUS_VAR
+#define park_offline_cpus true
 
 /*
  * Force uses of per_cpu() with an invalid area to attempt to access the
--- a/xen/arch/x86/include/asm/smp.h
+++ b/xen/arch/x86/include/asm/smp.h
@@ -25,12 +25,6 @@ DECLARE_PER_CPU(cpumask_var_t, scratch_c
 DECLARE_PER_CPU(cpumask_var_t, hpet_scratch_cpumask);
 DECLARE_PER_CPU(cpumask_var_t, send_ipi_cpumask);
 
-/*
- * Do we, for platform reasons, need to actually keep CPUs online when we
- * would otherwise prefer them to be off?
- */
-extern bool park_offline_cpus;
-
 void smp_send_nmi_allbutself(void);
 
 void send_IPI_mask(const cpumask_t *mask, int vector);
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -80,16 +80,12 @@ void __init set_nr_cpu_ids(unsigned int
 	printk(XENLOG_INFO "SMP: Allowing %u CPUs (%d hotplug CPUs)\n",
 	       max_cpus, max_t(int, max_cpus - num_processors, 0));
 
-	if (!park_offline_cpus)
-		tot_cpus = max_cpus;
 	nr_cpu_ids = min(tot_cpus, NR_CPUS + 0u);
 	if (nr_cpu_ids < num_processors)
 	{
 		unaccounted_cpus = true;
-		if (park_offline_cpus)
-			printk(XENLOG_WARNING
-			       "SMP: Cannot bring up %u further CPUs\n",
-			       num_processors - nr_cpu_ids);
+		printk(XENLOG_WARNING "SMP: Cannot bring up %u further CPUs\n",
+		       num_processors - nr_cpu_ids);
 	}
 
 #ifndef nr_cpumask_bits
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2144,8 +2144,7 @@ void asmlinkage __init noreturn __start_
             /* Set up node_to_cpumask based on cpu_to_node[]. */
             numa_add_cpu(i);
 
-            if ( (park_offline_cpus || num_online_cpus() < max_cpus) &&
-                 !cpu_online(i) )
+            if ( !cpu_online(i) )
             {
                 ret = cpu_up(i);
                 if ( ret != 0 )
--- a/xen/arch/x86/smp.c
+++ b/xen/arch/x86/smp.c
@@ -92,9 +92,7 @@ void send_IPI_mask(const cpumask_t *mask
     if ( system_state > SYS_STATE_smp_boot &&
          !unaccounted_cpus && !disabled_cpus && !cpu_in_hotplug_context() &&
          /* NB: get_cpu_maps lock requires enabled interrupts. */
-         local_irq_is_enabled() && (cpus_locked = get_cpu_maps()) &&
-         (park_offline_cpus ||
-          cpumask_equal(&cpu_online_map, &cpu_present_map)) )
+         local_irq_is_enabled() && (cpus_locked = get_cpu_maps()) )
         cpumask_or(scratch, mask, cpumask_of(smp_processor_id()));
     else
     {
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -67,8 +67,6 @@ DEFINE_PER_CPU_READ_MOSTLY(struct stubs,
 cpumask_t cpu_online_map __read_mostly;
 EXPORT_SYMBOL(cpu_online_map);
 
-bool __read_mostly park_offline_cpus;
-
 unsigned int __read_mostly nr_sockets;
 cpumask_t **__read_mostly socket_cpumask;
 static cpumask_t *secondary_socket_cpumask;
@@ -1149,7 +1147,7 @@ static int cf_check cpu_smpboot_callback
         break;
     case CPU_UP_CANCELED:
     case CPU_DEAD:
-        cpu_smpboot_free(cpu, !park_offline_cpus);
+        cpu_smpboot_free(cpu, false);
         break;
     case CPU_REMOVE:
         cpu_smpboot_free(cpu, true);
--- a/xen/include/xen/percpu.h
+++ b/xen/include/xen/percpu.h
@@ -34,7 +34,7 @@
 #include <xen/types.h>
 #include <asm/current.h>
 
-#ifndef PARK_OFFLINE_CPUS_VAR
+#if !defined(PARK_OFFLINE_CPUS_VAR) && !defined(park_offline_cpus)
 /*
  * Do we, for platform reasons, need to actually keep CPUs online when we
  * would otherwise prefer them to be off?

