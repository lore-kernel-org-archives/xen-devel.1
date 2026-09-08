Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA610C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:01:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411983.1642456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vS7-0005fZ-MB; Tue, 08 Sep 2026 13:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411983.1642456; Tue, 08 Sep 2026 13:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vS7-0005fS-Ie; Tue, 08 Sep 2026 13:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1411983;
 Tue, 08 Sep 2026 13:01:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vS6-0005fK-JV
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:01:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vS6-00Btv0-0D
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:01:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00724-8faa-0a2a0a5109dd-0a2a450ae664-26
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:01:29 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00729-f2d2-0a2a450a0019-d155dd2be8da-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:01:29 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so3686925f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:01:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30584345f8f.17.2026.09.08.06.01.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:01:28 -0700 (PDT)
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
        d=suse.com; s=google; t=1788872489; x=1789477289; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wCtbma6yni6NMPug+FRpjh+vc4wJezGbeyKqAGWmcyU=;
        b=NqGiAJ3K27SAv1I8ywaqWfqMw0PM5zWq7t3hCRS5WEH1MYW8mZo1Tm3OzNgMuQJUu6
         Ww4A7d6v2NuoPKRHXZxRmEjS2t+rpIbmDSewsiM5ka2eTkQun08bewwymYNMuvPFr2PX
         SPJh0L1r2+wKxCo5qLzHTAB1LLuHOPOi7Vrj5egOcPe451KuUmM5dTv7QkxemZ24Inys
         tq3UNLQwegQSqXXUCaCrYhMZP4s9IQPPRTETEmXpUxM7FCn9ajuwRZAb/bjEf+cTJ+cD
         tlk+OEg/9VUj0sLPUNZnffrUEbEPwf/t4DLqtenBosidl4Qltctvp0ggqWftrd7Fk43/
         1K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872489; x=1789477289;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wCtbma6yni6NMPug+FRpjh+vc4wJezGbeyKqAGWmcyU=;
        b=n4MUSUDq/1wRtVav25HBsSS/xCtSJ/SbDNNBNEnG2WbtgaqlFcQAum9njUERyERwvw
         WD90uJxBaryklJzwnRVSALi8ONUAXZ8zHdtL8f1SLhFrsFPwlu28R8lQvtHlmQQNrgXx
         826pr9nqQys8eaWRPA+FfpfMNXg+Lc/Gp/HWtelW/++keg9+1nWGzjJu47/OytGLg06J
         Qg5Nrh+3SsFemP8cReWVv4KjvifmzhWl91hyBAbTM883GRWHyLXiidbg8+MosLU2R9xW
         RyCXVmjLBptaVH+xZa0AQyOkYCywV58VdN8c72jjNm3KdH+nuu4by7n/KE12Gk+qlKBG
         wIsw==
X-Gm-Message-State: AFuF++luu+mKhsnF8M2vtNekcPwUTMRqgI5CxKUYj2fqwxOTdilxziEj
	/VMTsZQAG70us1byARUJL+by6bhYmu0gMvMQJ8natKxpmwMf9mR0uG28exxmJYgFT/1J8h/axY0
	e7uNRyg==
X-Gm-Gg: AYBFou2C6vQt5ebHlL4R2iU42rercu4OxnryG8PElwW1Z2UoNPL8is4Yjl+bazFyhWE
	1pXbCHLqjmhtXGLAB5qOlX5RMu+rKGkvvBrdfLAxH7kAc4M8MS8GpuORiuasshP+9AsG0l6tFFq
	xCt0TQeOh2Jbm+f0+rixm+Bcpocl27yXjTuoLkS2CXOaHNhQYtvS2zEMb83gvQ2DDhYDBifNiDQ
	Pu/xnIZuFgPOHSTi/XgFZpIOqsnkcuYnDsmK+e/zBgIoq1yLxT/FijmSsySPY3lOAvLTJ7wKLnf
	JeACdaNW/HzWkRJTY0h11OqNmp/hGbqpdMLU37bgLEV2jr1qWe2wUa6/TO6JM1ZtkmRxbB7iHBl
	l0J2IN8VSCarOjtP7EWq92OnsVTGOLbXrdJfoB5T2Ws23UXVlsNOTxPrKBWnzq3uxZ8/FOzjnx/
	bsrJ93K7FK91R/Q76u5ACMNBIPa6ICuMnLVoHBHobVMu6P9ETUCBw+NvVHw6y1VjJkqgvD2r0ey
	nwQP7TBcGAcBKeDCbthH2e9vFjjYKZozLKk5yz9NBf0rSedJnmjmQ==
X-Received: by 2002:a05:6000:2381:b0:485:8c16:a353 with SMTP id ffacd0b85a97d-4858c16a639mr25518802f8f.43.1788872489153;
        Tue, 08 Sep 2026 06:01:29 -0700 (PDT)
Message-ID: <7618c144-2f4a-483c-b078-0d9100b9f251@suse.com>
Date: Tue, 8 Sep 2026 15:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] x86/pass-through: defer event unlock in
 pt_irq_create_bind()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
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
In-Reply-To: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1788872489-50CCBCFC-FDC2351B/0/0
X-purgate-type: clean
X-purgate-size: 3280

The radix tree holding struct pirq * as obtained by pirq_get_info() is
protected by the domain's event lock. The result ("info") and the derived
"pirq_dpci" therefore may not be de-referenced past the dropping of that
lock. Moving the unlock down is safe, but perhaps not obviously so:
- vector_hashing_dest() does a memory allocation, but core event channel
  code does so too while holding the lock; the call to
  vlapic_match_dest() doesn't involve any further locking,
- hvm_migrate_pirq() operates on the corresponding IRQ descriptor, where
  obtaining of its lock is of course fine (those locks always nest inside
  the event lock),
- {hvm,vmx}_pi_update_irte() are very similar to hvm_migrate_pirq()
  locking-wise,
- the locking around guest_mask_msi_irq() is the same as in the earlier
  two bullet points.

As long as the PCI-devs lock is held around both
pt_irq_{create,destroy}_bind(), this is only a latent issue.

Fixes: 35a1caf8b6b5 ("pass-through: update IRTE according to guest interrupt config changes")
Fixes: 1066331913c9 ("passthrough: don't migrate pirq when it is delivered through VT-d PI")
Fixes: 782cf8ba4678 ("pass-through: adjust pIRQ migration")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The last two unlocks could be done a little more efficiently, but then
also in a little less straightforward a way:

        if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
        {
            unsigned long flags;
            struct irq_desc *desc = pirq_spin_lock_irq_desc(info, &flags);

            write_unlock(&d->event_lock);

            if ( !desc )
            {
                pt_irq_destroy_bind(d, pt_irq_bind);
                return -EINVAL;
            }

            guest_mask_msi_irq(desc, false);
            spin_unlock_irqrestore(&desc->lock, flags);
        }
        else
            write_unlock(&d->event_lock);

        break;

Seeing that the IRQ descriptor lock is taken up to three times in a row,
I wonder whether we shouldn't consolidate this (by obtaining desc once and
then passing it into hvm_migrate_pirq() (or a suitable new sibling
thereof) and hvm_pi_update_irte()).

--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -371,7 +371,6 @@ int pt_irq_create_bind(
 
         dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
         pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
-        write_unlock(&d->event_lock);
 
         pirq_dpci->gmsi.posted = false;
         vcpu = (dest_vcpu_id >= 0) ? d->vcpu[dest_vcpu_id] : NULL;
@@ -393,6 +392,7 @@ int pt_irq_create_bind(
 
             if ( rc )
             {
+                write_unlock(&d->event_lock);
                 pt_irq_destroy_bind(d, pt_irq_bind);
                 return rc;
             }
@@ -405,6 +405,7 @@ int pt_irq_create_bind(
 
             if ( !desc )
             {
+                write_unlock(&d->event_lock);
                 pt_irq_destroy_bind(d, pt_irq_bind);
                 return -EINVAL;
             }
@@ -413,6 +414,7 @@ int pt_irq_create_bind(
             spin_unlock_irqrestore(&desc->lock, flags);
         }
 
+        write_unlock(&d->event_lock);
         break;
     }
 


