Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67151C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 11:54:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407002.1640173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x260w-0000AZ-MH; Thu, 03 Sep 2026 11:53:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407002.1640173; Thu, 03 Sep 2026 11:53:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x260w-0000AS-Jg; Thu, 03 Sep 2026 11:53:54 +0000
Received: by outflank-mailman (input) for mailman id 1407002;
 Thu, 03 Sep 2026 11:53:53 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x260v-0000AD-C2
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 11:53:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x260u-003Y8T-Ou
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 13:53:52 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995fb9-bab6-0a2a0a5309dd-0a2a450abcaa-48
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:53:52 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a995fd0-f2d2-0a2a450a0019-d155802dc9f2-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 13:53:52 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49ccfbe062eso18297455e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 04:53:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee7febb4sm70596455e9.14.2026.09.03.04.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2026 04:53:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788436432; x=1789041232; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lmUEz1BSQEnPvhNy1tvkOzeOlVh/J2cVvdziF4BKMjs=;
        b=Ih9vcgnhfcT2+mbykv0H8lESbARexyDsrzxiCQ3TT1xV/ItZXrkP1+4c/6u/ZUTv6V
         ktJuiLlbFbFa3HDuOui3GaRusR8T29bZVpOXqbAvDxRueQZyF5qoyQ/z4x+PvHIIbEpI
         H6UO3iqAE8PESTWaXNevnIzbtelLfaqKyuVbdBd31hf8NO/8SzDYb65Q3r19Bi2PQ8jY
         jKUk0U3fcIoA5+a8ZJDyfGuE+bkgWOMsaY4Z+A3GbE5E02zdiqxHJn8/kaIpvZiDzgVM
         P5eJN6isg7JqdpYJUsv/Ge8qR06o8GQ/qt2LYdjzY2ofJaMBfv2qJ23Gw1et0MbjITrY
         JiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788436432; x=1789041232;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lmUEz1BSQEnPvhNy1tvkOzeOlVh/J2cVvdziF4BKMjs=;
        b=fCPci9uj1dZZGVlqNO8xH+1xvmcitWXKrE5DOfxoDugTgzGhU6yC9NNFKZjMgFaOvp
         3+jDXqD1RrVYRLMFO9up2SGi+ODJm9g9g1JJsqMCjhKcAMVA3vojN/G8abo9K+HuNq6b
         FSBZL6/RpRapfQn8Q+p2sWRiWmUKvmPb38NWEm1gwtd3KY+Z5VtOmAQ4KytQ/n88LZKR
         laKxLuYMsLoDYkLAgZb3bnlb9Pk0W64nDxwjofSacah/BXTUCBrCvISjHwf71zftZk5e
         3BJUY+nPqMnTIM+KIc7IR75Pt2TJY4ZxZYDhiLkj4XR5HFBdY1W2QzacFCX0FKOI08ks
         161Q==
X-Gm-Message-State: AFuF++nLZXbNnvCFh6E8hAmQW4ia00EmWtF+qWZi+8m558Rany5muiLI
	cqxS+VtP16Ajonvv8gxIhdxbuQxz3OCsJJG2zik5pwN/Fw3oFPqhrHO0hQ1DjgAXURq6ZHsfnmF
	LiM/IFA==
X-Gm-Gg: AYBFou0ib8vvIqkCSUTljC0KSYYBNLXWPxQ8r0HHliOL56JdAQDkixIz5KCqfBT4yRZ
	lXFJ9yomnvRMxExh2CvKz4xDQSrTEY0KGPvEjjs7p2k1eALir1sY/1zD0bbUFgM6e01fpwwzC+q
	8cem3EFWnuNkzoDvrM7Py5SIsghOxrOQylXU8Pss5Mx2weumF+GJsMQhcfjmnp+ItLBk4UuYRc4
	RanJ8mH4qWzBXVh9C1s4UVXcqcdYwdgZww5G2HT7Ytcl2o/tt5OyArAz0uYBVC36kUAArVAwDly
	ZWHICItmOyS4EPGYgCxRm353duLPMcg15o+6GX0FWc6nx/zLXrMMeBcgIhy+qOUFA43T7RAwD5J
	/wQvL1LQmRklVK+EQt0VwgRrPchinmvBFYwujzN6/m6y0WfmjphrLW5tsh0QYpsxFueTHz4Goym
	gUggmQJNHPsma1B7QJs6KZhOumqxmbf/E8btQb4h9FQvf10e7dZAeulSrHr2HDFUiTrlrUuu9U4
	btbNPq9cyDvUy0M0ehniwQoacIsQ8DqdumhCfaTP5RjR2JnucOp
X-Received: by 2002:a05:600c:3f19:b0:499:93b3:91ea with SMTP id 5b1f17b1804b1-49ce582959cmr243680975e9.15.1788436432199;
        Thu, 03 Sep 2026 04:53:52 -0700 (PDT)
Message-ID: <4eaf8244-25ec-45d4-844d-3d8f6720f57b@suse.com>
Date: Thu, 3 Sep 2026 13:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] sched/core: avoid use of "current" in initializer lists
From: Jan Beulich <jbeulich@suse.com>
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
X-purgate-ID: tlsNG-4011c0/1788436432-59FDECFC-B9F8711E/0/0
X-purgate-type: clean
X-purgate-size: 3501

TRACE_TIME() uses an initializer list and hence is covered by Misra C:2012
rule 13.1 ("Initializer lists shall not contain persistent side effects").
Use intermediate variables to address this.

In vcpu_yield() take the opportunity to rename the existing variable which
better would have been used already before.

In do_sched_op() extend the scope of and rename an existing variable. Also
drop a pointless (and slightly malformed, style-wise) cast there, and
adjust to other one to by style conformant.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note that the violations presently are reported only for Arm. Similar
issues would exist on x86 in Clang builds, afaict.

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
+    const struct vcpu *curr = current;
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


