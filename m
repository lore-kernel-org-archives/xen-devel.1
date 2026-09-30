Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32F7CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:43:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437094.1655867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsiS-00041m-Dg; Wed, 30 Sep 2026 11:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437094.1655867; Wed, 30 Sep 2026 11:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsiS-00041f-Ax; Wed, 30 Sep 2026 11:43:16 +0000
Received: by outflank-mailman (input) for mailman id 1437094;
 Wed, 30 Sep 2026 11:43:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsiQ-00040A-On
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:43:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsiQ-00E9Fr-5X
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:43:14 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5c9-2eae-0a2a0a5409dd-0a2a4509ebe6-14
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:43:14 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5d1-be1a-0a2a45090019-4a7de18c8bce-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:43:14 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffe281cb1so26269275e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:43:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01751613dsm47209935e9.3.2026.09.30.04.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:43:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1790768593; x=1791373393; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7UlEPoDDJhLeviLZJAxh1QAj5n/whaugPJ987VD1ywg=;
        b=DWw1R7LNLVG10TzIfTgJBIh6FHea0SA/YfQkTis5CAOIbcU15w3GeDo0w0wbxS0KQk
         ya3clCQn0e4lOVPcqCRDvbEFEYmN7DIJ3jCx07BE9ClGwMrgV4sYBWG35UY4nM0RJXbQ
         Say2yp7qHQXQC1Bdof4Joz2Gmkr1n29Ha+s0MrhDB/nqv9ZThwKCVnG2+6WnWTQfFWqd
         LSQX1TTkfZq5SGJNuc5Jeihrzll9V6c2XEAyGvfSVTzg8lolTM6X8mR71Q0fg//ZRplC
         QftO4/XWP4fWeSqikRD46vAModeT201Q6xh+61bZH8F601d89YqZcdMncIVebURd4dYK
         Xs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768593; x=1791373393;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UlEPoDDJhLeviLZJAxh1QAj5n/whaugPJ987VD1ywg=;
        b=eZ0YH6RM1Oc6mOPYZkPQ//wINEJgL4ifwsdSep24c7FQNGXgu+E2NyNt6oYoebeK14
         OQVYThSQBLVM1W6P1zVOVK1P5BLHtEB2VSQNAPcWFPkI7/vtHdhnWI2UqWH3ydgc+nbA
         cukDEJbXzxmNbR6nPYCews41Sv7IMFbl4hk6X4TW9R3aOUYL8KYh3vr+2doyga12LdJT
         h0cqYsqTr3LuwHFXoADu+hGuvNUwrZv7ExAAq7m0WHqDzS7icNIcEaiiY8AeoWVDfvNo
         9sP719JaAj6Zk15nYeHMshR7c5TiqoQ6oMJ7lf8bjEqkjG2jjM7Z0gItBkb5fR0mkoX/
         0y3Q==
X-Gm-Message-State: AFuF++l31Q0bjN8vPxehwliX9lZQhRST5RkVhcEftkSRvtoDU2o4x6O6
	CqpUO1VqvKTlqhr/jKPNzcAZwnNeq4RTmEEIR+MmyAuQNec3qRCq5GU2XiZY82d1VlJ4Xe6x5xj
	VSqDS4g==
X-Gm-Gg: AYBFou2RPynz0QkUCP9cRHw5YTTEWFmEELd6WYz5+oQxdY2lV1WMeOy5aHyvmO6Td6w
	5REeyeEuJspj7HR5zeRJEyUQ2kqioY78HXTy40wZfFN56DKJQ/FudJfMv4XY3p+vZQ7nSrWAcQA
	91NnPgFtdtIFZKC/+62w6ApAO7v8EM1rUS166+mmqiF1yk0IhPe4h3EvU9snlmv7HFw7qejZYJi
	/ygmI5q26kaUoULc3HczL8D4ASDYum/7LSno4je45p/GGTVvZKZaRhfh9s3g+XneJTyANMVG16U
	82tT67Zzraayu1EEftaA/nkU/riW55O/4DN7+BzGxeaTNLXPLvPdABaKFNjxkgJhCjQVlVw7Mra
	6Vcv9gKr+Lid2YtcY55G9Oe+Nwg6SU8yrE0xMxWUZWnpmDxV6FpoRE5JpdhkfOKPQygBqV/jMLB
	t2imCQJj6cNgaAe+cRgzWSLHGxzyfP1n5Ovvjq678EyTkdZSsaaBsweXh/65eNc3Rb2xW+Pg+bL
	91YC+k0/Ex/x6/I9aWjsNe/nSx0HkByMroSH+4drOJPsQK6n5YIvNlVjbdBog==
X-Received: by 2002:a05:600c:4fcb:b0:4a0:3b9:f16b with SMTP id 5b1f17b1804b1-4a01ab4f2d9mr22071065e9.0.1790768593473;
        Wed, 30 Sep 2026 04:43:13 -0700 (PDT)
Message-ID: <bb14302d-d366-4841-a639-3af02d755cff@suse.com>
Date: Wed, 30 Sep 2026 13:43:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/5] x86/pass-through: use simpler locking primitives in
 pt_irq_{create,destroy}_bind()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
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
In-Reply-To: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1790768594-3B8D1034-6E5A065A/10/78276251493
X-purgate-type: spam
X-purgate-size: 2309

Both functions already assume IRQs to be enabled upon entry, by e.g. their
acquiring of the domain's event channel lock. Hence like e.g.
hvm_migrate_pirq() (also called from here) does, saving/restoring of
EFLAGS.IF isn't necessary (because of the functions called, we can't
really avoid the saving there).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger@xenproject.org>
---
v2: Add IRQ-s-enabled assertions.

--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -228,6 +228,8 @@ int pt_irq_create_bind(
     if ( pirq < 0 || pirq >= d->nr_pirqs )
         return -EINVAL;
 
+    ASSERT(local_irq_is_enabled());
+
  restart:
     write_lock(&d->event_lock);
 
@@ -400,8 +402,7 @@ int pt_irq_create_bind(
 
         if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
         {
-            unsigned long flags;
-            struct irq_desc *desc = pirq_spin_lock_irq_desc(info, &flags);
+            struct irq_desc *desc = pirq_spin_lock_irq_desc(info, NULL);
 
             if ( !desc )
             {
@@ -411,7 +412,7 @@ int pt_irq_create_bind(
             }
 
             guest_mask_msi_irq(desc, false);
-            spin_unlock_irqrestore(&desc->lock, flags);
+            spin_unlock_irq(&desc->lock);
         }
 
         write_unlock(&d->event_lock);
@@ -588,6 +589,8 @@ int pt_irq_destroy_bind(
     struct pirq *pirq;
     const char *what = NULL;
 
+    ASSERT(local_irq_is_enabled());
+
     switch ( pt_irq_bind->irq_type )
     {
     case PT_IRQ_TYPE_PCI:
@@ -606,9 +609,7 @@ int pt_irq_destroy_bind(
         break;
     case PT_IRQ_TYPE_MSI:
     {
-        unsigned long flags;
-        struct irq_desc *desc = domain_spin_lock_irq_desc(d, machine_gsi,
-                                                          &flags);
+        struct irq_desc *desc = domain_spin_lock_irq_desc(d, machine_gsi, NULL);
 
         if ( !desc )
             return -EINVAL;
@@ -617,7 +618,7 @@ int pt_irq_destroy_bind(
          * pt_irq_create_bind is consistent across bind/unbinds.
          */
         guest_mask_msi_irq(desc, true);
-        spin_unlock_irqrestore(&desc->lock, flags);
+        spin_unlock_irq(&desc->lock);
         break;
     }
 


