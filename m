Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F73EC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:24:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374418.1621575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woijO-0005Cw-LT; Tue, 28 Jul 2026 14:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374418.1621575; Tue, 28 Jul 2026 14:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woijO-0005Cn-Io; Tue, 28 Jul 2026 14:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1374418;
 Tue, 28 Jul 2026 14:24:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woijN-0005Cf-KW
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:24:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woijM-00F1g5-UP
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:24:28 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb95-2eae-0a2a0a5409dd-0a2a450bb4fa-18
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:24:28 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb9c-b7e8-0a2a450b0019-d155dd31a402-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:24:28 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso970106f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:24:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c7880dsm58999551f8f.37.2026.07.28.07.24.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:24:27 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248668; x=1785853468; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3lzZ7GYxAZkVGEZUpJdPRfH1NuosiuFuGkMMzSnec4o=;
        b=CH7/s/3o7uf7KReGiZ9e0vkmQdCS/HSAfL91+oPm2FmGXcbpXJXgDQsfzbnoCNBQ5k
         d0ouMlHRiZMtFXIdew75JHvu2Ani2Ovy5BloCmRmc2UxdECQd8CuZ1C994fHbQ2FQtip
         tWz3nRdxcmgBCWEREMh8be0wAoy4kSQvsBS6Y4oeBbTxC9R7QQvasZaNKsJnGtEAwFl8
         e7DYt5F2/LgEY3cFf/AT7Kk45q8+QbT70CONUmaN+jOe6e8gU+YeRWnImD8bd9es8Ad7
         vSqyF9ktHU3bMIfsbkqQcvXOIhQE/Mj0vJOYTkYtW8ZKhzlLEXb944TJBf8N5kctUKC8
         M2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248668; x=1785853468;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3lzZ7GYxAZkVGEZUpJdPRfH1NuosiuFuGkMMzSnec4o=;
        b=BL+heQHICeFH+R2GjvP9c9ryHHBzA2xZbjYuQJcHv3pGGZa4eqHYQGRDMhDdvT+p4/
         7vTN7UabheyDwNn8nFPuCBsFmLcBJ8YY3a12cLEMYySIeNX463ztiadwM/lVTa/P2Ds8
         0U2SLkU6pI/nlov9KU3obv0bM5ByLG6UVUa/NFDE+QdYWD0zNb9s8Pipb+HVDlMt8oSk
         xevUcWvao75/fnaj79bIp7sGUALq/siMbgL3b8kMuS58GUfgxCJPrO8hmwUaOY9fyPOv
         HNTW3MdqtanTJF4nkas7RP4iu0GQJ12jN8ino6NWAMtS454Ej+iBDamMd8zVtgxAURbL
         0A8A==
X-Gm-Message-State: AOJu0YxNTOGz8yGn90s1QnUFkEAl8j1qHVr2T2K4+RLHbK8isZTIjUXM
	llLdOOOpVtOXU3dtUzDqQQC0AIs9w+DAeZyh38stap9xp0dtF24FQLTk8JFoFV4uQzpbkM/pCEb
	Uav/How==
X-Gm-Gg: AR+sD11jLz22tZrByJVaUMvTEUB98+7R0gazqB8iuKg/bOIOzLMSM6ccO1fBZwgzK8D
	liEaqwz7/XRuk0BipxDEFTHOS+TpvuDMkbld9cPsYK2LxUP7b5VXMqaW1GIo0bassYpkED6D/w/
	+I6N2rNaxl+KVR4Q/dEvxrjBC9EXCY4yU7CK2+vZCyoL9l+e8re2234g5C3vshu2wshxF39N601
	oRIHQ0XMJO3pv9urf89ITBcNVpBEI7ui5bQ14y1vzp7tc+8rKPjplyJZhu75ZILhMRNXJKMYuSY
	b4tA6U0fkusfWJMRONgNXCmXq912ox6TpnNtli64u0M2r/aKmhB8Cd7ta3tpBJhbmuSh7h9sbcB
	kRhf4cI/PTE1h8i5KOGy/Aj3y/qI/7f8xHjnmjPVhpTLJoFieyuPbnOaBkZp+SgojbRjPUWfg0b
	CeXWrcLg8KVdySYTjMVcZTv5KTCsfFwCwURKcOGjEA4ON1nsp1fXuJN6Mhp1P1lIGNEw==
X-Received: by 2002:adf:e19c:0:b0:47f:8282:42be with SMTP id ffacd0b85a97d-47fb1ecacaamr3144645f8f.18.1785248668204;
        Tue, 28 Jul 2026 07:24:28 -0700 (PDT)
Message-ID: <0798cafd-50e9-4910-990e-37c64bfa59aa@suse.com>
Date: Tue, 28 Jul 2026 16:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 09/10] x86/shadow: make forced (L1TF) mode enable properly
 preemptable
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>
References: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
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
In-Reply-To: <68c16600-a4bf-4060-a1fc-56c4ae655b03@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785248668-A8AC89EA-1A344F84/0/0
X-purgate-type: clean
X-purgate-size: 5979

Like for log-dirty enable/disable, reduce the amount of work to do
underneath sh_new_mode() by calling shadow_blow_tables() (which is
properly preemptable) up front. shadow_set_allocation() possibly taking
long also is handled similar to log-dirty enable.

Since this code runs inside a tasklet, carrying out preemption isn't
straightforward; see the code comment.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The single-CPU case could of course do with improvement. Plus even on
multi-CPU systems there will still be problems if there are enough
domains all being switched to shadow mode at roughly the same time.

Interaction with other shadow-op preemption is a little rough: Any
attempt to issue a shadow-op (other than get-allocation) will result in
-EBUSY while the operation here is still in progress.

Notes from discussion:
- if there weren't certain special situations (realtime scheduling requirements, null scheduler,
  vCPU pinning), simply handling softirqs _only_ in the tasklet might be okay
- instead of doing shadow_blow_tables() and shadow_set_allocation() from the tasklet, we may be
  able to arrange doing that in the context of the initiating vCPU (with all other vCPU-s paused),
  scheduling the tasklet only once done, and making sure we don't fully exit back to guest context
  in the process (but enough to allow scheduling to occur) [Could we have paravirt_ctxt_switch_to()
  schedule a softirq-tasklet for VMs in transitional state, which then does the work?]
---
v14: New.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -237,6 +237,7 @@ struct paging_domain {
         const struct domain *dom;
         unsigned int op;
         bool drop_allocation:1;
+        bool pv_l1tf_paused:1;
         union {
             struct {
                 unsigned long done:PADDR_BITS - PAGE_SHIFT;
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -18,6 +18,7 @@
 #include <xen/domain_page.h>
 #include <xen/guest_access.h>
 #include <xen/keyhandler.h>
+#include <xen/softirq.h>
 #include <asm/event.h>
 #include <asm/page.h>
 #include <asm/current.h>
@@ -2444,11 +2445,11 @@ static int shadow_one_bit_enable(struct
 
         /* Init the shadow memory allocation if the user hasn't done so */
         if ( shadow_set_allocation(d, 1,
-                                   mode & PG_log_dirty ? &preempted
-                                                       : NULL) != 0 )
+                                   mode & ~PG_SH_enable ? &preempted
+                                                        : NULL) != 0 )
         {
             shadow_set_allocation(d, 0,
-                                  mode & PG_log_dirty ? &preempted : NULL);
+                                  mode & ~PG_SH_enable ? &preempted : NULL);
             if ( !preempted )
                 return -ENOMEM;
             d->arch.paging.preempt.drop_allocation = true;
@@ -2785,22 +2786,80 @@ void shadow_audit_tables(struct vcpu *v)
 void cf_check pv_l1tf_tasklet(void *data)
 {
     struct domain *d = data;
+    int ret = 0;
 
-    domain_pause(d);
+    /* Lock-less read is okay: The field is only written inside this tasklet. */
+    if ( !d->arch.paging.preempt.pv_l1tf_paused )
+        domain_pause(d);
     paging_lock(d);
 
-    if ( !paging_mode_sh_forced(d) && !d->is_dying )
+    while ( !paging_mode_sh_forced(d) && !d->is_dying )
     {
-        int ret = shadow_one_bit_enable(d, PG_SH_forced);
+        bool preempted = false;
+        unsigned int cpu, next;
 
-        if ( ret )
+        if ( !d->arch.paging.preempt.dom )
+        {
+            d->arch.paging.preempt.dom = dom_xen;
+            d->arch.paging.preempt.drop_allocation = false;
+        }
+
+        if ( unlikely(d->arch.paging.preempt.dom != dom_xen) )
+        {
+            /* Wait for other continuation to finish. */
+        }
+        else if ( unlikely(d->arch.paging.preempt.drop_allocation) )
         {
-            printk(XENLOG_G_ERR "d%d Failed to enable PG_SH_forced: %d\n",
-                   d->domain_id, ret);
-            domain_crash(d);
+            ret = -ENOMEM;
+            shadow_set_allocation(d, 0, &preempted);
+            if ( !preempted )
+                break;
         }
+        else
+        {
+            /*
+             * Limit the amount of work to do from sh_detach_old_tables()
+             * (called from shadow_one_bit_enable() via sh_new_mode() ->
+             * sh_update_paging_modes()), such that it doesn't also need to
+             * deal with preemption checks.
+             */
+            shadow_blow_tables(d, &preempted);
+            if ( !preempted &&
+                 (ret = shadow_one_bit_enable(d, PG_SH_forced)) != -ERESTART )
+                break;
+        }
+
+        d->arch.paging.preempt.pv_l1tf_paused = true;
+        paging_unlock(d);
+
+        /*
+         * Crude "preemption" of a tasklet: To avoid hogging the local CPU,
+         * re-schedule the tasklet on another one. Unless of course there
+         * is none, in which case we will simply continue here.
+         */
+        cpu = smp_processor_id();
+        next = cpumask_cycle(cpu, &cpu_online_map);
+        if ( next != cpu )
+        {
+            tasklet_schedule_on_cpu(&d->arch.paging.shadow.pv_l1tf_tasklet,
+                                    next);
+            return;
+        }
+
+        process_pending_softirqs();
+        paging_lock(d);
+    }
+
+    if ( ret )
+    {
+        printk(XENLOG_G_ERR "%pd: Failed to enable PG_SH_forced: %d\n",
+               d, ret);
+        domain_crash(d);
     }
 
+    d->arch.paging.preempt.dom = NULL;
+    d->arch.paging.preempt.drop_allocation = false;
+    d->arch.paging.preempt.pv_l1tf_paused = false;
     paging_unlock(d);
     domain_unpause(d);
 }


