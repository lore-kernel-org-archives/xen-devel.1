Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295D606A32D
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=gFrBuXFs
Received: from list by lists.xenproject.org with outflank-mailman.1503417.1699125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZeC-00026z-Mg; Thu, 26 Nov 2026 13:36:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503417.1699125; Thu, 26 Nov 2026 13:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZeC-00026s-Jo; Thu, 26 Nov 2026 13:36:24 +0000
Received: by outflank-mailman (input) for mailman id 1503417;
 Thu, 26 Nov 2026 13:36:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZeB-00026i-F1
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:36:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZeA-00FaLW-R4
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:36:22 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0835d1-bab6-0a2a0a5309dd-0a2a4508855c-26
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:36:22 +0100
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0835d6-f659-0a2a45080019-d155dd2ad8d9-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:36:22 +0100
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-498f5fa5103so4182439f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:36:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6b9add26sm41191423f8f.44.2026.11.26.05.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:36:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700182; x=1796304982; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrzE5C9udTDhw1JB851Zc7Pw+RZX8N2Gvg2dfMlOkdc=;
        b=gFrBuXFs2vrONboPrQQHq6atGR9sM9ZJ3sJysAuKv6VE3fRHj9HbpygMxFF5mg0z/U
         Ewkl8JcvPAl1jVkIMeTVpPaa0pr88G93URNDovoQVsaFTIUDQVH8Em1E1yUKEYCZjFoF
         VQV/+sIYbHt2Hxsvulxqm1vKPWqlC2MQB1ohpNar8Pfi+fCFFCxoT32e1CwJj9SrQ+5A
         p8YkfyV6pUonXjCkwQX7gVHrHAbcP9Perpz98HRIGnYoGp9oHVxnDegn6w3FGenTQ0SX
         aiqSl6Ti7WO46tv0H5D4CtD+sjwG5wcXKigZKkxIfIKopc1iWfgK7ZrwYHte3kZj7hVT
         GMmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700182; x=1796304982;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FrzE5C9udTDhw1JB851Zc7Pw+RZX8N2Gvg2dfMlOkdc=;
        b=b5+7tfcSj9jqFqo4176wGpoDLnXkF9YWhCKIsWUNAyPgKuqAPapZOEIxqygwAaxBcD
         vMoz4J3hcJC5f7pyv1R3zworod+xtzYp0AyfEfIeNJQXF0mUXd2juwoiA0gAEuic7H2+
         u8rglbn8hk+rq3k57Sn3tSsXBKyvvR38M14AlPTmP1YL9lxIVcuGNlr7OKQ9ahD+ol3o
         b0fmWqNad1ojoVDs96MH2IGmniJLoHWhlWICFvWziPY/TJ8vo6GMycYl/JuHc8rjhLe4
         QBpRIFrGUZcTFbsazrFKV6rjm7OY2TP6wpFDf2zcPi9bCQUCzCLjuqupqC6iBYZbEpbo
         ap7A==
X-Gm-Message-State: APuU4Z/I3wAmb5riTVuJyqcnIbyds25r7N0n54SGzeGtAjnFcLLceEZI
	IQRVd090jwyAzPTkdt3G7AOh/ryZceC9dU9kzir2q0cV61O+qdOkDQgbtA9K/KTKxkPhj9CUBv+
	0RddXTQ==
X-Gm-Gg: AZFdTZeeEdxmSg5SeHCfjEYlzw6nDCHkFXFs26XA7qKdBsPHwWZdS21kRgzGkn7gAux
	BQBc3NaBBqRlWKpCxLBGt9qyHWbkTNThWE78VghhMyZPenqMkUG1Djjs1Sst/+578UKdsjdyOXm
	f7pvEFvdPpKRsIg4tVe5y6+s6tZ3ZTfbsJ44Q4ZxdX/zrqBUjvIYj12oueyDe8x4VL1GmMRSZMw
	rO8np/r2jT//1GQceWfH6dPPfqSShM/bclKpChN2Kb6uGZa1nmP7K2tLJardZvvfobV9aJRu+Hs
	8D1mBAS9jgAPRkV9QpewKBi6Y/nby1tg0zaa8TAfCvSe4ZfbbD5bp9K1615yCu7JO2TnnqqZVRG
	yl/CqIJdVHlyPM6dQ0BBkqtuA3OxK/2rRc0AIaX7ZGxoXOLHFic29An8Kqt9f3MW4Aqk0ykh56i
	OWo7x3AmwgaX7tyAWvBEokpnJWN7F2XHmAm0e1QX5qxhr9xW0Io5TOwhgSJfr2cUk5QyKtTHRjK
	5bXeo3shBV2v6NoCeRTKlQJSb27E1xLGcQqPnnUxlHfrPGyjp1AyyjyTPI2oLl3YGLeuDTqNUhd
	TURHHF6zxcE/QAXuqyFIul8eiwoC6wlQztl4p3AWLZSX3E6Rd2UhC5A5g6u9hGzyAMk4OLP/yIl
	c3TIgu8wndo7QjvOE
X-Received: by 2002:a05:6000:26d0:b0:4a6:8012:197 with SMTP id ffacd0b85a97d-4ad5d5f9320mr40751087f8f.2.1795700181708;
        Thu, 26 Nov 2026 05:36:21 -0800 (PST)
Message-ID: <ebe22349-be46-4853-a142-ffc934c995ba@suse.com>
Date: Thu, 26 Nov 2026 14:36:20 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 02/13] x86/passthrough: don't blindly assume vCPU-s exist
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1795700182-CCD7087B-D78079F2/10/78276251493
X-purgate-type: spam
X-purgate-size: 6301
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

First, pirq_guest_bind() really only needs a vCPU to establish IRQ
affinity, and it already has fallback logic which can be used if the vCPU
passed in is NULL. Have the caller pass in a (guaranteed non-NULL) domain
pointer, making the vCPU one optional.

Reported-by: Roger Pau Monné <roger.pau@amd.com>

While altering pirq_guest_bind()'s signature also convert its boolean
parameter to bool.

Further, while generally hvm_girq_dest_2_vcpu_id() would return only IDs
of valid vCPU-s, for a single-vCPU guest it would return 0 no matter
whether that vCPU was created already. Use domain_vcpu() when consuming
the return value; subsequent code already deals with the pointer being
NULL.

Fixes: fbe487b996b5 ("PCI passthru: VT-d I/O hooks")
Fixes: 85715f4bc7c9 ("MSI 5/6: add MSI support to passthrough HVM domain")
Fixes:  ("")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'll fill the missing Fixes: when xenbits is willing to work again.

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1627,14 +1627,15 @@ int pirq_shared(struct domain *d, int pi
     return shared;
 }
 
-int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+int pirq_guest_bind(struct domain *d, const struct vcpu *v, struct pirq *pirq,
+                    bool will_share)
 {
     struct irq_desc         *desc;
     irq_guest_action_t *action, *newaction = NULL;
     unsigned int        max_nr_guests = will_share ? irq_max_guests : 1;
     int                 rc = 0;
 
-    WARN_ON(!rw_is_write_locked(&v->domain->event_lock));
+    WARN_ON(!rw_is_write_locked(&d->event_lock));
     BUG_ON(!local_irq_is_enabled());
 
  retry:
@@ -1651,7 +1652,7 @@ int pirq_guest_bind(struct vcpu *v, stru
         {
             printk(XENLOG_G_INFO
                    "Cannot bind IRQ%d to dom%d. In use by '%s'.\n",
-                   pirq->pirq, v->domain->domain_id, desc->action->name);
+                   pirq->pirq, d->domain_id, desc->action->name);
             rc = -EBUSY;
             goto unlock_out;
         }
@@ -1666,7 +1667,7 @@ int pirq_guest_bind(struct vcpu *v, stru
             xfree(newaction);
             printk(XENLOG_G_INFO
                    "Cannot bind IRQ%d to dom%d. Out of memory.\n",
-                   pirq->pirq, v->domain->domain_id);
+                   pirq->pirq, d->domain_id);
             return -ENOMEM;
         }
 
@@ -1690,7 +1691,7 @@ int pirq_guest_bind(struct vcpu *v, stru
         {
             const cpumask_t *affinity = NULL;
 
-            if ( !opt_noirqbalance )
+            if ( !opt_noirqbalance && v )
                 affinity = cpumask_of(v->processor);
             else if ( !cpumask_intersects(desc->affinity, &cpu_online_map) )
             {
@@ -1710,7 +1711,7 @@ int pirq_guest_bind(struct vcpu *v, stru
     else if ( !will_share || !action->shareable )
     {
         printk(XENLOG_G_INFO "Cannot bind IRQ%d to dom%d. %s.\n",
-               pirq->pirq, v->domain->domain_id,
+               pirq->pirq, d->domain_id,
                will_share ? "Others do not share"
                           : "Will not share with others");
         rc = -EBUSY;
@@ -1734,17 +1735,17 @@ int pirq_guest_bind(struct vcpu *v, stru
         printk(XENLOG_G_INFO
                "Cannot bind IRQ%d to %pd: already at max share %u"
                " (increase with irq-max-guests= option)\n",
-               pirq->pirq, v->domain, irq_max_guests);
+               pirq->pirq, d, irq_max_guests);
         rc = -EBUSY;
         goto unlock_out;
     }
 
-    action->guest[action->nr_guests++] = v->domain;
+    action->guest[action->nr_guests++] = d;
 
     if ( action->ack_type != ACKTYPE_NONE )
-        set_pirq_eoi(v->domain, pirq->pirq);
+        set_pirq_eoi(d, pirq->pirq);
     else
-        clear_pirq_eoi(v->domain, pirq->pirq);
+        clear_pirq_eoi(d, pirq->pirq);
 
  unlock_out:
     spin_unlock_irq(&desc->lock);
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -718,7 +718,7 @@ static int evtchn_bind_pirq(evtchn_bind_
 
     info->evtchn = port;
     rc = (!is_hvm_domain(d)
-          ? pirq_guest_bind(v, info,
+          ? pirq_guest_bind(d, v, info,
                             !!(bind->flags & BIND_PIRQ__WILL_SHARE))
           : 0);
     if ( rc != 0 )
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -315,7 +315,7 @@ int pt_irq_create_bind(
              */
             pirq_dpci->dom = d;
             /* bind after hvm_irq_dpci is setup to avoid race with irq handler*/
-            rc = pirq_guest_bind(d->vcpu[0], info, 0);
+            rc = pirq_guest_bind(d, d->vcpu[0], info, 0);
             if ( rc == 0 && pt_irq_bind->u.msi.gtable )
             {
                 rc = msixtbl_pt_register(d, info, pt_irq_bind->u.msi.gtable);
@@ -375,7 +375,7 @@ int pt_irq_create_bind(
         pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
 
         pirq_dpci->gmsi.posted = false;
-        vcpu = (dest_vcpu_id >= 0) ? d->vcpu[dest_vcpu_id] : NULL;
+        vcpu = (dest_vcpu_id >= 0) ? domain_vcpu(d, dest_vcpu_id) : NULL;
         if ( iommu_intpost )
         {
             if ( delivery_mode == dest_LowestPrio )
@@ -527,7 +527,7 @@ int pt_irq_create_bind(
             }
 
             /* Deal with gsi for legacy devices */
-            rc = pirq_guest_bind(d->vcpu[0], info, share);
+            rc = pirq_guest_bind(d, d->vcpu[0], info, share);
             if ( unlikely(rc) )
             {
                 /*
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -184,7 +184,8 @@ void pirq_cleanup_check(struct pirq *pir
 extern void pirq_guest_eoi(struct pirq *pirq);
 extern void desc_guest_eoi(struct irq_desc *desc, struct pirq *pirq);
 extern int pirq_guest_unmask(struct domain *d);
-extern int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share);
+extern int pirq_guest_bind(struct domain *d, const struct vcpu *v,
+                           struct pirq *pirq, bool will_share);
 extern void pirq_guest_unbind(struct domain *d, struct pirq *pirq);
 extern void pirq_set_affinity(struct domain *d, int pirq,
                               const cpumask_t *mask);


