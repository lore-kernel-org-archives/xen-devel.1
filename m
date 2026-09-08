Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F73C79F9E
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 12:21:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411877.1642344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3up1-0003bg-Ca; Tue, 08 Sep 2026 12:21:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411877.1642344; Tue, 08 Sep 2026 12:21:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3up1-0003bZ-9i; Tue, 08 Sep 2026 12:21:07 +0000
Received: by outflank-mailman (input) for mailman id 1411877;
 Tue, 08 Sep 2026 12:21:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3up0-0003bR-6L
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 12:21:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3uoz-00H5I8-FB
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 14:21:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ffda5-8faa-0a2a0a5109dd-0a2a45048360-46
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:21:05 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9ffdb1-b57f-0a2a45040019-d155802ee806-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 14:21:05 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49d05d51553so24245895e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 05:21:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce554d52esm333316485e9.3.2026.09.08.05.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 05:21:04 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788870065; x=1789474865; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y400oWD1wHNJh0ADtJXm8+RnBJvVktOI+IIWHcewNYQ=;
        b=R4atMQZMSmO7g+jWt/12Hcd3G9ax89Xi2wTBQYWr4PRfIcMH0JJ/GqYsfFGG4hY/qQ
         RLpV7RPoTiYXIuihpkfA8SBHtG3TI2lRmCm1Y7eAD3k+wVJqINswTRGdy8ckaHsXagIm
         7mvHWkiZE8KaJtmjC1+Hh9NjxxKZKhWeSuOq+iGttqo+B4nzYV0/U7s3Maszzc/7P3R3
         OHubq8Bb8XL4z2CdTi8Jmc8qpUs8SMT8wkvLvFVYv4y7TGxWQIGO/mvdo2t9L3wVJiBs
         IH1wQmmlHNBtTUXBxC8no409xCCL6pALmis70r3VoJPjkiDSiAt1s1Rus1tIuG07XiQE
         dqog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870065; x=1789474865;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y400oWD1wHNJh0ADtJXm8+RnBJvVktOI+IIWHcewNYQ=;
        b=G4xRgMlCQeZOMqi1N6m9Hmo4TjA462J9Ul9SEsGtAXWD2CYeXRo4MrwhUkvI6mnVpB
         rWj3n0smQmG1mXvw9+P5qfUYp+BPV7/UGqQfcwIXrcQlvQCHykt/i5Wzby5muwNrC31K
         wQLCVy+b2NVLdDDjPvJWWjGKbuKiDtaWb8lK/LKDdgO2TjlrgA5hZkdUznvPkuEcgrIB
         7B6OxrhLBXeNXPb+9jXM55+/XLlwHdAcpkybvvb1Rtg8Xe6hDpuzcAN8ekQRbeOVfJVq
         lTuFsDOvJGaD0uiX+DXgJA3ljH+zjmlboBW5sdHnVIEgzoPFuqpwgRytEEKipEzSdjZ1
         66eg==
X-Gm-Message-State: AFuF++mDgrcoadc4bdQcIO+pXS1T4FtrGf5YSJMliOuTFX23T8XdbiGu
	vvsbsTM/25eB3+1KpaMNcMoyOENG6eGFXwP4wq7hF/Y7NW3+U5VfKvSBXl/qPi+VMg9FfiFgBf2
	XjZFTpw==
X-Gm-Gg: AYBFou3Z84Qw1lFYz+32AiqzC7ga8kJquAXdg8Fj52GmOVsIfjCV1B/T3isbCBpwLLo
	vpgOTYJvafR6ytMbupJ27x1cgMt4G+RmKpPxngXQyHq2MGGsKf7ZduHCEuKz3/8JRw2qfcGiM+X
	B9b/tADMG+pobyXsPF5he6njoyHWS9fbTHGf1XmzvSEBJMsJFuhY5iuDKolh/W8GCvmj2LpAfGX
	PKIN/lv3T5DpIME+C7JDOL6Rbi6j3uTx/Aofm/p9rgh2TLwwcie8zzZ3q64F+tYxeq0OrGbZsQN
	/4I4WntUVLSKn2oKQma+btcrXEL7ICTerDfl5ilbSy0mFwcesQTu1b0Y51ZJRS/oYSmQkRNCYRG
	xAWYEoeFUZSSb95v1BCwsg3oQpctNi2TEbM41VaTJD62S+TvPimnFtoytizT3cmudi3oO5crt/v
	SN7zWj1G4tEYMVGwrUHl2bcVUtNoXH0qDBp79BeRBu71WjjiQoeZOJMFiaWnRdktmBAk/bKQ1Yf
	KbIx+CL24DzwIOrb6ouw+RfhXLighYuug3lrHuRGMj0qy6d6xtk
X-Received: by 2002:a05:600c:8b88:b0:49c:fc6e:a3d8 with SMTP id 5b1f17b1804b1-49cffde8d95mr239986635e9.23.1788870064722;
        Tue, 08 Sep 2026 05:21:04 -0700 (PDT)
Message-ID: <1ba6f97e-4745-4b12-bc80-dffebcadf576@suse.com>
Date: Tue, 8 Sep 2026 14:21:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v1.1 3/4] sched/core: avoid use of "current" in initializer
 lists
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 George Dunlap <gwd@xenproject.org>
References: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
Content-Language: en-US
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
In-Reply-To: <db6f62c4-0631-43d0-a501-9667af6242ec@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788870065-C34C3B50-2175747A/0/0
X-purgate-type: clean
X-purgate-size: 4943

TRACE_TIME() uses an initializer list and hence is covered by Misra C:2012
rule 13.1 ("Initializer lists shall not contain persistent side effects").
Use intermediate variables to address this.

In vcpu_yield() take the opportunity to rename the existing variable which
better would have been used already before.

In do_sched_op() extend the scope of and rename an existing variable. Use
both variables throughout the function. Also drop a pointless (and
slightly malformed, style-wise) cast there, and adjust to other one to by
style conformant.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the violations presently are reported only for Arm. Similar
issues would exist on x86 in Clang builds, afaict.
---
v1.1: Also replace further (unrelated) uses of current in do_sched_op().

--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -1531,20 +1531,20 @@ static long do_poll(const struct sched_p
 /* Voluntarily yield the processor for this allocation. */
 long vcpu_yield(void)
 {
-    struct vcpu * v=current;
+    struct vcpu *curr = current;
     spinlock_t *lock;
 
     rcu_read_lock(&sched_res_rculock);
 
-    lock = unit_schedule_lock_irq(v->sched_unit);
-    sched_yield(vcpu_scheduler(v), v->sched_unit);
-    unit_schedule_unlock_irq(lock, v->sched_unit);
+    lock = unit_schedule_lock_irq(curr->sched_unit);
+    sched_yield(vcpu_scheduler(curr), curr->sched_unit);
+    unit_schedule_unlock_irq(lock, curr->sched_unit);
 
     rcu_read_unlock(&sched_res_rculock);
 
     SCHED_STAT_CRANK(vcpu_yield);
 
-    TRACE_TIME(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
+    TRACE_TIME(TRC_SCHED_YIELD, curr->domain->domain_id, curr->vcpu_id);
     raise_softirq(SCHEDULE_SOFTIRQ);
     return 0;
 }
@@ -1914,6 +1914,8 @@ typedef long ret_t;
 
 ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
+    struct vcpu *curr = current;
+    struct domain *currd = curr->domain;
     ret_t ret = 0;
 
     switch ( cmd )
@@ -1938,9 +1940,9 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HAN
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
-        TRACE_TIME(TRC_SCHED_SHUTDOWN, current->domain->domain_id,
-                   current->vcpu_id, sched_shutdown.reason);
-        ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
+        TRACE_TIME(TRC_SCHED_SHUTDOWN, currd->domain_id, curr->vcpu_id,
+                   sched_shutdown.reason);
+        ret = domain_shutdown(currd, sched_shutdown.reason);
 
         break;
     }
@@ -1948,19 +1950,18 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HAN
     case SCHEDOP_shutdown_code:
     {
         struct sched_shutdown sched_shutdown;
-        struct domain *d = current->domain;
 
         ret = -EFAULT;
         if ( copy_from_guest(&sched_shutdown, arg, 1) )
             break;
 
-        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, d->domain_id, current->vcpu_id,
+        TRACE_TIME(TRC_SCHED_SHUTDOWN_CODE, currd->domain_id, curr->vcpu_id,
                    sched_shutdown.reason);
 
-        spin_lock(&d->shutdown_lock);
-        if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
-            d->shutdown_code = (u8)sched_shutdown.reason;
-        spin_unlock(&d->shutdown_lock);
+        spin_lock(&currd->shutdown_lock);
+        if ( currd->shutdown_code == SHUTDOWN_CODE_INVALID )
+            currd->shutdown_code = (uint8_t)sched_shutdown.reason;
+        spin_unlock(&currd->shutdown_lock);
 
         ret = 0;
         break;
@@ -1993,7 +1994,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HAN
         if ( d == NULL )
             break;
 
-        ret = xsm_schedop_shutdown(XSM_DM_PRIV, current->domain, d);
+        ret = xsm_schedop_shutdown(XSM_DM_PRIV, currd, d);
         if ( likely(!ret) )
             domain_shutdown(d, sched_remote_shutdown.reason);
 
@@ -2010,8 +2011,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HAN
         if ( copy_from_guest(&sched_watchdog, arg, 1) )
             break;
 
-        ret = domain_watchdog(
-            current->domain, sched_watchdog.id, sched_watchdog.timeout);
+        ret = domain_watchdog(currd, sched_watchdog.id, sched_watchdog.timeout);
         break;
     }
 
@@ -2021,7 +2021,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HAN
         unsigned int cpu;
 
         ret = -EPERM;
-        if ( !is_hardware_domain(current->domain) )
+        if ( !is_hardware_domain(currd) )
             break;
 
         ret = -EFAULT;
@@ -2033,7 +2033,7 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HAN
            break;
 
         cpu = sched_pin_override.pcpu < 0 ? NR_CPUS : sched_pin_override.pcpu;
-        ret = vcpu_temporary_affinity(current, cpu, VCPU_AFFINITY_OVERRIDE);
+        ret = vcpu_temporary_affinity(curr, cpu, VCPU_AFFINITY_OVERRIDE);
 
         break;
     }

