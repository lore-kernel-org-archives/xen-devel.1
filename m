Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26965C61DD3
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2026 09:33:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1403864.1637816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0yO1-0005Le-Mx; Mon, 31 Aug 2026 09:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1403864.1637816; Mon, 31 Aug 2026 09:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x0yO1-0005LX-Jh; Mon, 31 Aug 2026 09:33:05 +0000
Received: by outflank-mailman (input) for mailman id 1403864;
 Mon, 31 Aug 2026 09:33:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <frn1furkan10@gmail.com>) id 1x0yO0-0005LO-Kp
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 09:33:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x0yNz-004FyN-SZ
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2026 11:33:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a954a3d-8faa-0a2a0a5109dd-0a2a450ad042-26
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:33:03 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <frn1furkan10@gmail.com>)
 id 6a954a4f-f2d2-0a2a450a0019-d155802ec183-3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 11:33:03 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso23011295e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 31 Aug 2026 02:33:03 -0700 (PDT)
Received: from notebook.. ([88.230.40.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482fbab5a2csm19211268f8f.4.2026.08.31.02.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2026 02:33:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168783; x=1788773583; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ew5tNWjshpkIdmi3bl3fAmKE4835tm4KGljhRmFiYHo=;
        b=maym6Q8If5XAkogFJ23PxVHtCsfiKXw8NCmH7O5d7fvPqF16XZhXD71S1NQw4+M2tm
         PZTzpCcId+/1gh/zOm0SKTNuSRGcZqzJgaiqmcsaHQCbFEBVMHqbqvsWr4UIwlk6tc6i
         Lm1hgrezZ66QmsY7S+m/7doUFcs1e7OS/48LSgP8E+T++F7WLOoPcX6ziRngSmsN9WHZ
         tZEQ9AXgsCvZcf5WBGDDLQlqBpzyEwA8Rl2br75jb6IHQPM2qgaHUkUrlYBio8Vti4+I
         iTJJ780UNNx9h/APwPCWSBYGzuIIzyMcBxI25v+OcusxtWlj28uC00iJZHNQNvivDECO
         4+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168783; x=1788773583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ew5tNWjshpkIdmi3bl3fAmKE4835tm4KGljhRmFiYHo=;
        b=bJ08PxtaJxebOgXvNt7u5lfk/QWYWzikkfrckwKbClKoeQLFQPHnu2+v/+tcjEFHmO
         psjcQhYlPp+BjgQGs+nl0a4C1THE+7dnwNTEvQj2JS/H/gI/AdujpTrCWF7ZJOEPMyiL
         E3zmlebyEe8wgFkwPDsOyCdkwkYzQ4HArQti31buifyrsIzZ9ocl6hEKzASfvtwaV3g1
         WJXZtra0vI2624igqdLMT6K2SuedYU2226pI1zKb7zsCGvRZy6KPJGMpr0qhbuBmnDLL
         vKYjObtXd2cGSHZU32yzj/nbwy8Ud1N5ok/SYYkW28Ak4ffiKsG58EjGikkAxjBWX4s5
         nhcg==
X-Gm-Message-State: AFuF++lsWq+tuaqx0Xpv5Ru6PRBvYp/B2hG88K6YkWsYwmakBuAsq/KV
	CF7sOrylZ8FCZjZ00fTHLGqpIzseFe11EyBG9QmpPCaCqyNmRXGv6DlgLWj0xQ==
X-Gm-Gg: AR+sD11dOc0ifx7kgLfMxhzGh9U2ltKmV59oLGYW2Y1/NBBjHbGVkNUmQmtpVAQF6dH
	+GwM0uEww8axeWXlrQXDAomCnF/ZObu6BnJ2cVy4en+eouFOMDERweJ/eAXGpSLrIcf7K5BncLg
	CBhW+6+3H0KqY27Vc+7RYp2XS0Pd985gQgUUAKL0sJWaPfh0ypQmFO+Jf+YcNxrSsazQDpqP5/u
	+pK3V7DEf3N7c+WR53lt05J+mK2XQG3b08Txrr272psrd9ORHZ7KQ56einvqJjhO0AyVVxb2GTq
	puAHXqON+J6EfvPpLsT4OLDqMYPYUW8q/szJu0w2CiREXOPtx7qYGoUoCRopbEG9nv4mp8juYl8
	1Z1Cfw3H4bAEZgko8rEeQV3fRga2Cdu7pKRT947tPNb/xGMFrmWlBGVHhrPUiI0riB5JWvTnu/z
	Y+Jh42bM6CfMFUK4KuTIB7XfnbvJ32/Rij/h4BeUVdSPZRrT06lNMHwSM6pq0=
X-Received: by 2002:a05:600c:3b21:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49b91c3f643mr353135395e9.8.1788168782736;
        Mon, 31 Aug 2026 02:33:02 -0700 (PDT)
From: Furkan Caliskan <frn1furkan10@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: jgross@suse.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	Furkan Caliskan <frn1furkan10@gmail.com>
Subject: [PATCH v4] xen/common: add vcpus_create() and keep max_vcpus in sync
Date: Mon, 31 Aug 2026 12:32:19 +0300
Message-Id: <20260831093219.9815-1-frn1furkan10@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831051637.5029-2-frn1furkan10@gmail.com>
References: <20260831051637.5029-2-frn1furkan10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1788168783-510C9CFC-B3FF9457/0/0
X-purgate-type: clean
X-purgate-size: 6769

Every vcpu_create() call site that builds more than one vcpu loops
over ids up to d->max_vcpus and stops on the first failure, but none
of them roll max_vcpus back to match. This leaves d->vcpu[i] == NULL
for ids below max_vcpus, which anything walking d->vcpu[] can then
dereference. This is what caused the crash: sched_move_domain()
walks every vcpu slot up to max_vcpus without checking for empty
ones, so when a domain built in a non-default cpupool had vcpu
creation fail partway through, domain_kill() later moving it back
to the default cpupool handed one of its empty slots straight to
the new cpupool's scheduler, causing a NULL-pointer dereference
inside sched_alloc_udata().

Add vcpus_create(d): creates every vcpu of d up to max_vcpus and
rolls max_vcpus back to the failed id on error. This keeps
d->vcpu[i] is non-NULL for all i < d->max_vcpus, instead of guarding
every reader of d->vcpu[] agains holes individually.

Convert every site that builds vcpus in a loop to call this function
instead.

Fixes: 61649709421a ("xen/domain: Allocate d->vcpu[] in domain_create()")
Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Furkan Caliskan <frn1furkan10@gmail.com>
---
v4:
 - Return -ENOMEM instead of -EINVAL from vcpus_create() on failure.
---
 xen/arch/arm/domain_build.c   | 15 +++++++--------
 xen/arch/x86/mm/mem_sharing.c | 11 ++---------
 xen/common/domain.c           | 24 ++++++++++++++++++++++++
 xen/common/domctl.c           | 19 ++++---------------
 xen/common/sched/core.c       |  7 +++----
 xen/include/xen/domain.h      |  1 +
 6 files changed, 41 insertions(+), 36 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 72d5316180..e08ee21ee5 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1774,6 +1774,7 @@ static void __init find_gnttab_region(struct domain *d,
 int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 {
     unsigned int i;
+    int rc;
     struct vcpu *v = d->vcpu[0];
     struct cpu_user_regs *regs = &v->arch.cpu_info->guest_cpu_user_regs;
 
@@ -1842,17 +1843,15 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
     }
 #endif
 
-    for ( i = 1; i < d->max_vcpus; i++ )
+    if ( (rc = vcpus_create(d)) )
     {
-        if ( vcpu_create(d, i) == NULL )
-        {
-            printk("Failed to allocate d%dv%d\n", d->domain_id, i);
-            return -ENOMEM;
-        }
+        printk("Failed to allocate d%dv%d\n", d->domain_id, d->max_vcpus);
+        return rc;
+    }
 
-        if ( is_64bit_domain(d) )
+    if ( is_64bit_domain(d) )
+        for ( i = 1; i < d->max_vcpus; i++ )
             vcpu_switch_to_aarch64_mode(d->vcpu[i]);
-    }
 
     domain_update_node_affinity(d);
 
diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index 5c7a0ff30e..cd7f747c80 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1612,21 +1612,14 @@ int mem_sharing_fork_page(struct domain *d, gfn_t gfn, bool unsharing)
 
 static int bring_up_vcpus(struct domain *cd, struct domain *d)
 {
-    unsigned int i;
     int ret = -EINVAL;
 
     if ( d->max_vcpus != cd->max_vcpus ||
         (ret = cpupool_move_domain(cd, d->cpupool)) )
         return ret;
 
-    for ( i = 0; i < cd->max_vcpus; i++ )
-    {
-        if ( !d->vcpu[i] || cd->vcpu[i] )
-            continue;
-
-        if ( !vcpu_create(cd, i) )
-            return -EINVAL;
-    }
+    if ( (ret = vcpus_create(cd)) )
+        return ret;
 
     domain_update_node_affinity(cd);
     return 0;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index e16f1ac383..32b7fa34d1 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -539,6 +539,30 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
     return NULL;
 }
 
+/*
+ * Create every not yet existing vcpu of d, up to d->max_vcpus. On failure,
+ * d->max_vcpus is rolled back to the id that failed, keeping d->vcpu[i]
+ * non-NULL for all i < d->max_vcpus.
+ */
+int vcpus_create(struct domain *d)
+{
+    unsigned int i;
+
+    for ( i = 0; i < d->max_vcpus; i++ )
+    {
+        if ( d->vcpu[i] )
+            continue;
+
+        if ( vcpu_create(d, i) == NULL )
+        {
+            d->max_vcpus = i;
+            return -ENOMEM;
+        }
+    }
+
+    return 0;
+}
+
 static int late_hwdom_init(struct domain *d)
 {
 #ifdef CONFIG_LATE_HWDOM
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index a6210db4fb..39f3f219ca 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -698,7 +698,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
 
     case XEN_DOMCTL_max_vcpus:
     {
-        unsigned int i, max = op->u.max_vcpus.max;
+        unsigned int max = op->u.max_vcpus.max;
 
         ret = -EINVAL;
         if ( (d == current->domain) || /* no domain_pause() */
@@ -708,21 +708,10 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         /* Needed, for example, to ensure writable p.t. state is synced. */
         domain_pause(d);
 
-        ret = -ENOMEM;
-
-        for ( i = 0; i < max; i++ )
-        {
-            if ( d->vcpu[i] != NULL )
-                continue;
-
-            if ( vcpu_create(d, i) == NULL )
-                goto maxvcpu_out;
-        }
-
-        domain_update_node_affinity(d);
-        ret = 0;
+        ret = vcpus_create(d);
+        if ( !ret )
+            domain_update_node_affinity(d);
 
-    maxvcpu_out:
         domain_unpause(d);
         break;
     }
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d3a0a97e1d..14069eed03 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3497,10 +3497,9 @@ void wait(void)
 #ifdef CONFIG_X86
 void __init sched_setup_dom0_vcpus(struct domain *d)
 {
-    unsigned int i;
-
-    for ( i = 1; i < d->max_vcpus; i++ )
-        vcpu_create(d, i);
+    if ( vcpus_create(d) )
+        printk("Failed to create all vcpus of dom0 (max_vcpus now %u)\n",
+               d->max_vcpus);
 
     domain_update_node_affinity(d);
 }
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index aeb8b36ad1..eaf406a814 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -34,6 +34,7 @@ typedef union {
 } vcpu_guest_context_u __attribute__((__transparent_union__));
 
 struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id);
+int vcpus_create(struct domain *d);
 
 unsigned int dom0_max_vcpus(void);
 int parse_arch_dom0_param(const char *s, const char *e);
-- 
2.34.1


