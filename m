Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C71C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 14:22:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374391.1621549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woihb-0003VQ-Lm; Tue, 28 Jul 2026 14:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374391.1621549; Tue, 28 Jul 2026 14:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woihb-0003VH-Iq; Tue, 28 Jul 2026 14:22:39 +0000
Received: by outflank-mailman (input) for mailman id 1374391;
 Tue, 28 Jul 2026 14:22:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woihZ-0003Sw-OR
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 14:22:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woihZ-004xTM-5A
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 16:22:37 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb1e-2eae-0a2a0a5409dd-0a2a450880f2-28
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:22:37 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68bb2c-f659-0a2a45080019-d1558032c93b-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 16:22:37 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so24570335e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 07:22:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c44a873csm85807545e9.2.2026.07.28.07.22.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 07:22:35 -0700 (PDT)
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
        d=suse.com; s=google; t=1785248556; x=1785853356; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xzunNfHOxzhHTSPk1dD1REpFH01TRuP3mjZJ3vTTN8k=;
        b=eLA93yqF4LR0hFlDou/xeKlw5KABpSb/Mup8kNmCEbASP0MgpD85jUkerJepjllZ1N
         8BkpSefeBza2K5D5EXHzGOn5wB2IaFTDpXTAJtV4x4+RzPeQU9glutoMBhRGW+HXv/Jw
         r3ROGKTa7r9uxm0X0S2QHH+U2Z0/L92UaacpUH8VlQwnHimse7+UK4WvZWedMv82DPPr
         7iV16mU2kByI8jWDNECTN3HkjYz5dOD6C2w11LZtu3/lwqIwLvkzx6QdmvrkXur3pBVP
         81bYJ37oSfeGzxRqEhn/POE8flwGun60tLRZxsFNDYJmegESb6W2QwzluRBj9OonUnxK
         QBHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248556; x=1785853356;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xzunNfHOxzhHTSPk1dD1REpFH01TRuP3mjZJ3vTTN8k=;
        b=Xdc5XD+iEa4IxGnFBak/G5RHGo4zyRbeqnbwM06s7kCPCreGc3smuzTZ1ZHJbrkyIn
         1ziT4LewEhv+9dWK/a/449Ruf9QKeAM5h0vWIKEUeKDVBxBRGX/z67Jhf3PN/jZ7IRuG
         eD60z643lP7BfHakREj/U7BNSs4YdKlKIPGnVfymDxYNDtp0ClmDqdbqBV2Fg/6wgw7k
         fDl79DjSXA/zERbD96kmwaL6YhAP0wIlsOaN/lRtxQ4O7kWdIzxRJXVTBCH+Eov4VRv0
         VpQmC04Pg9PZJsiLBjAQlusO6faIKwlO7rP9ApB4CCfFwDeNlwZEQ92SvBc+fv1holMt
         E9kg==
X-Gm-Message-State: AOJu0Yyi4MC4ku0OGvL24BxdoKMHLA5kO1pW3Py/2Ql9T8jIKPe7xJDv
	FqrjtOXXbyMFdd9WTqNDsiAVotkc2fl0MJLto3bAqyvBazmGWqUbN/gZDu38ThFOXyU+GkXWgr8
	bOUAsiA==
X-Gm-Gg: AR+sD11Vws+2fpvMZPiGMYeNq42GJFznq/OIurkfQ52XVPv04wyMgFeCzS+gALzFkSh
	g3RbSVhfjGVnhNXjbbRUdcshb76amS6K41EeMc83W17dfL1FTIpQGpqi9BBqhnpETTatWCZUWPa
	lMIiIQ0HcVdBcibbcndyFjhrMwwceKJyX5wLwE3XR2w0zeSSFJEzXJ8c2wuvWPPeGYw4gHW4i7b
	jCOhkC139kEcttF+dne2cm4gVU7Aky9j1T2+2d5eabfCTuuddVsyTjh57DnfVJJakojQ4rOyWKi
	u31xJfTgatBndY8okzCvQKp3E9r5o+kGLOeC6OJ79HEAuhkcyyBvvxVnDVvvk690j0MsEFFpMii
	NQAq7TgGxg4ID9MXqJ8sfN8mjvPtaq66J1kNmj254a1NV0RyHChbGVZejYhzAsEFER2BP53ozJw
	Ybcu/2J7OhGYyDcORSVTGWE51gyTgOjY7Kiw62fW8SHZ0X8PamvTD/cJAHlfz8YtmLqX+mBNGVd
	ReE5AKCBbYDL24=
X-Received: by 2002:a05:600c:c16d:b0:493:c8a6:b517 with SMTP id 5b1f17b1804b1-496c6588c3cmr27756545e9.38.1785248556294;
        Tue, 28 Jul 2026 07:22:36 -0700 (PDT)
Message-ID: <ed14e7f9-6e65-4646-84ae-0b167383a50f@suse.com>
Date: Tue, 28 Jul 2026 16:22:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v15 06/10] x86/mm: make more of log-dirty mode enable/disable
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
X-purgate-ID: tlsNG-c1860d/1785248557-CED4087B-82A37201/0/0
X-purgate-type: clean
X-purgate-size: 10439

So far only part of disable was preemptable. Shadow code, however, will
need to purge all earlier shadows, which may take quite a bit of time.
In the general (paging) layer arrange for the hook functions to possibly
indicate the need for resuming. In shadow code leverage "enable" already
calling shadow_blow_tables(), simply making that call preemptable, while
adding a call to that function for "disable".

In order for resume state to be properly guarded, the paging lock now
needs acquiring in paging_log_dirty_{en,dis}able(). HAP's need to
acquire the P2M lock makes it necessary to allow the hook functions to
drop the paging lock.

Note that when requesting resuming, the hook functions must not have
changed the paging (shadow) mode yet; the actual mode change part is
expected to be performed quickly enough to not require preemption. This
is why "blow" (done ahead of mode switching) is preferred over
"detach-old" (occurring with mode already updated). While this may mean
more purging being done now for "disable", starting from a clean state
afterwards may be better overall anyway.

Note further that HAP code is, except for the locking adjustments,
(intended to be) largely unaffected, for not having a need for
preemption checking.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Locking isn't really nice here, but I see no better way given HAP's need
to acquire the P2M lock in its hook functions. Things may end up a little
better if doing away with the hooks and handling HAP and shadow (in part)
separately in paging.c, and then building upon HAP not needing any
preemption checking. Yet whether purging the hooks right here is okay is
unclear (see also "x86/shadow: make clean-dirty-bitmap post-processing
preemptable", where the question also arises).

See also the comments in "x86/shadow: 1-bit-disable doesn't need to
detach old tables". Specifically avoiding shadow_blow_tables() here
would mean pinned shadows wouldn't be needlessly unpinned.
---
v15: Add missing domain_unpause() to paging_log_dirty_enable()'s HAP
     path. Re-base.
v14: (Re)check and update preemption state under paging lock. Adjust
     locking accordingly. Re-base.
v13: New.

--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -199,6 +199,11 @@ struct log_dirty_domain {
 
     /* functions which are paging mode specific */
     const struct log_dirty_ops {
+        /*
+         * enable() and disable() will be called with the paging lock held.
+         * They may drop the lock (but not drop and re-acquire it), but then
+         * need to indicate so by returning a positive value.
+         */
         int        (*enable  )(struct domain *d);
         int        (*disable )(struct domain *d);
         void       (*clean   )(struct domain *d);
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -184,7 +184,7 @@ static int cf_check hap_enable_log_dirty
         return -EBUSY;
 
     /* turn on PG_log_dirty bit in paging mode */
-    paging_lock(d);
+    ASSERT(paging_locked_by_me(d));
     d->arch.paging.mode |= PG_log_dirty;
     paging_unlock(d);
 
@@ -198,12 +198,12 @@ static int cf_check hap_enable_log_dirty
     p2m_change_entry_type_global(d, p2m_ram_rw, p2m_ram_logdirty);
     guest_flush_tlb_mask(d, d->dirty_cpumask);
 
-    return 0;
+    return 1;
 }
 
 static int cf_check hap_disable_log_dirty(struct domain *d)
 {
-    paging_lock(d);
+    ASSERT(paging_locked_by_me(d));
     d->arch.paging.mode &= ~PG_log_dirty;
     paging_unlock(d);
 
@@ -215,7 +215,7 @@ static int cf_check hap_disable_log_dirt
      * normal mode, or via hardware-assisted log-dirty.
      */
     p2m_change_entry_type_global(d, p2m_ram_logdirty, p2m_ram_rw);
-    return 0;
+    return 1;
 }
 
 static void cf_check hap_clean_dirty_bitmap(struct domain *d)
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -104,13 +104,10 @@ static int paging_free_log_dirty_bitmap(
     mfn_t *l4, *l3, *l2;
     int i4, i3, i2;
 
-    paging_lock(d);
+    ASSERT(paging_locked_by_me(d));
 
     if ( mfn_eq(d->arch.paging.log_dirty.top, INVALID_MFN) )
-    {
-        paging_unlock(d);
         return 0;
-    }
 
     if ( !d->arch.paging.preempt.dom )
     {
@@ -121,10 +118,7 @@ static int paging_free_log_dirty_bitmap(
     }
     else if ( d->arch.paging.preempt.dom != current->domain ||
               d->arch.paging.preempt.op != XEN_DOMCTL_SHADOW_OP_OFF )
-    {
-        paging_unlock(d);
         return -EBUSY;
-    }
 
     l4 = map_domain_page(d->arch.paging.log_dirty.top);
     i4 = d->arch.paging.preempt.log_dirty.i4;
@@ -196,12 +190,11 @@ static int paging_free_log_dirty_bitmap(
         d->arch.paging.preempt.op = XEN_DOMCTL_SHADOW_OP_OFF;
     }
 
-    paging_unlock(d);
-
     return rc;
 }
 
-static int paging_log_dirty_enable(struct domain *d)
+static int paging_log_dirty_enable(struct domain *d, unsigned int op,
+                                   bool resuming)
 {
     int ret;
 
@@ -217,9 +210,42 @@ static int paging_log_dirty_enable(struc
     if ( paging_mode_log_dirty(d) )
         return -EINVAL;
 
-    domain_pause(d);
+    if ( !resuming )
+        domain_pause(d);
+
+    paging_lock(d);
+
+    if ( d->arch.paging.preempt.dom &&
+         (d->arch.paging.preempt.dom != current->domain ||
+          d->arch.paging.preempt.op != op) )
+    {
+        paging_unlock(d);
+        if ( !resuming )
+            domain_unpause(d);
+        return -EBUSY;
+    }
+
     ret = d->arch.paging.log_dirty.ops->enable(d);
-    domain_unpause(d);
+
+    if ( ret > 0 )
+    {
+        /* Paging lock dropped by hook. */
+        domain_unpause(d);
+        ret = 0;
+    }
+    else if ( ret != -ERESTART )
+    {
+        d->arch.paging.preempt.dom = NULL;
+        paging_unlock(d);
+        domain_unpause(d);
+    }
+    else
+    {
+        ASSERT(!paging_mode_log_dirty(d));
+        d->arch.paging.preempt.dom = current->domain;
+        d->arch.paging.preempt.op = op;
+        paging_unlock(d);
+    }
 
     return ret;
 }
@@ -229,21 +255,49 @@ static int paging_log_dirty_disable(stru
     int ret = 1;
 
     if ( !resuming )
-    {
         domain_pause(d);
-        /* Safe because the domain is paused. */
-        if ( paging_mode_log_dirty(d) )
+
+    paging_lock(d);
+
+    if ( d->arch.paging.preempt.dom &&
+         (d->arch.paging.preempt.dom != current->domain ||
+          d->arch.paging.preempt.op != XEN_DOMCTL_SHADOW_OP_OFF) )
+    {
+        paging_unlock(d);
+        if ( !resuming )
+            domain_unpause(d);
+        return -EBUSY;
+    }
+
+    /* Safe because the domain is paused. */
+    if ( paging_mode_log_dirty(d) )
+    {
+        ret = d->arch.paging.log_dirty.ops->disable(d);
+        if ( ret > 0 ) /* Paging lock dropped by hook? */
+        {
+            paging_lock(d);
+            ret = 0;
+        }
+        else if ( ret != -ERESTART )
+            d->arch.paging.preempt.dom = NULL;
+        else
         {
-            ret = d->arch.paging.log_dirty.ops->disable(d);
-            ASSERT(ret <= 0);
+            ASSERT(paging_mode_log_dirty(d));
+            d->arch.paging.preempt.dom = current->domain;
+            d->arch.paging.preempt.op = XEN_DOMCTL_SHADOW_OP_OFF;
+            paging_unlock(d);
+            return ret;
         }
+
+        ASSERT(ret < 0 || !paging_mode_log_dirty(d));
     }
 
     ret = paging_free_log_dirty_bitmap(d, ret);
-    if ( ret == -ERESTART )
-        return ret;
 
-    domain_unpause(d);
+    paging_unlock(d);
+
+    if ( ret != -ERESTART )
+        domain_unpause(d);
 
     return ret;
 }
@@ -720,7 +774,7 @@ int paging_domctl(struct domain *d, stru
             break;
         fallthrough;
     case XEN_DOMCTL_SHADOW_OP_ENABLE_LOGDIRTY:
-        return paging_log_dirty_enable(d);
+        return paging_log_dirty_enable(d, sc->op, resuming);
 
     case XEN_DOMCTL_SHADOW_OP_OFF:
         if ( (rc = paging_log_dirty_disable(d, resuming)) != 0 )
@@ -812,7 +866,9 @@ int paging_teardown(struct domain *d)
 
 #if PG_log_dirty
     /* clean up log dirty resources. */
+    paging_lock(d);
     rc = paging_free_log_dirty_bitmap(d, 0);
+    paging_unlock(d);
     if ( rc == -ERESTART )
         return rc;
 #endif
--- a/xen/arch/x86/mm/shadow/common.c
+++ b/xen/arch/x86/mm/shadow/common.c
@@ -2567,13 +2567,22 @@ static int cf_check sh_enable_log_dirty(
 {
     int ret;
 
-    paging_lock(d);
+    ASSERT(paging_locked_by_me(d));
+
     if ( shadow_mode_enabled(d) )
     {
-        /* This domain already has some shadows: need to clear them out
+        bool preempted = false;
+
+        /*
+         * This domain already has some shadows: need to clear them out
          * of the way to make sure that all references to guest memory are
-         * properly write-protected */
-        shadow_blow_tables(d, NULL);
+         * properly write-protected.
+         *
+         * Furthermore see sh_disable_log_dirty() below.
+         */
+        shadow_blow_tables(d, &preempted);
+        if ( preempted )
+            return -ERESTART;
     }
 
 #if (SHADOW_OPTIMIZATIONS & SHOPT_LINUX_L3_TOPLEVEL)
@@ -2585,7 +2594,6 @@ static int cf_check sh_enable_log_dirty(
 #endif
 
     ret = shadow_one_bit_enable(d, PG_log_dirty);
-    paging_unlock(d);
 
     return ret;
 }
@@ -2593,13 +2601,18 @@ static int cf_check sh_enable_log_dirty(
 /* shadow specfic code which is called in paging_log_dirty_disable() */
 static int cf_check sh_disable_log_dirty(struct domain *d)
 {
-    int ret;
+    bool preempted = false;
 
-    paging_lock(d);
-    ret = shadow_one_bit_disable(d, PG_log_dirty);
-    paging_unlock(d);
+    ASSERT(paging_locked_by_me(d));
 
-    return ret;
+    /*
+     * Limit the amount of work to do from sh_detach_old_tables() (called from
+     * shadow_one_bit_disable() via sh_new_mode() -> sh_update_paging_modes()),
+     * such that it doesn't also need to deal with preemption checks.
+     */
+    shadow_blow_tables(d, &preempted);
+
+    return preempted ? -ERESTART : shadow_one_bit_disable(d, PG_log_dirty);
 }
 
 /* This function is called when we CLEAN log dirty bitmap. See


