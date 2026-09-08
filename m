Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0834BC79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:03:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412012.1642491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vUM-0007Wt-MJ; Tue, 08 Sep 2026 13:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412012.1642491; Tue, 08 Sep 2026 13:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vUM-0007Wj-Io; Tue, 08 Sep 2026 13:03:50 +0000
Received: by outflank-mailman (input) for mailman id 1412012;
 Tue, 08 Sep 2026 13:03:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vUK-0007VN-Aw
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:03:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vUJ-00HE7L-Nv
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:03:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa007a4-bab6-0a2a0a5309dd-0a2a4504da4c-48
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:03:47 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa007b3-b57f-0a2a45040019-d155802bdde3-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:03:47 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso49770895e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:03:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49d1e728677sm784515e9.2.2026.09.08.06.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:03:46 -0700 (PDT)
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
        d=suse.com; s=google; t=1788872627; x=1789477427; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+vtrY7KzlKFzHbPTxxbP/vZcWl/f7JuDpE3t3EALSeM=;
        b=N/hmohWgq3L7vOHbCEUZ85XQ7SpR/NJE8N48YnEHUdfivIDNPJwUCnFE20n4JBFMcV
         wrQYzD4Txkt6mJSIEL8LAq5A2MMMMoVz+4TgMO5HTH8H1P8tkMrW+ke8UdZztvXfh8TE
         gAFn7Y2FR4A+K8b1Z2eDRukR/t4Mu6SXGkJG+xbpPZ9pW/wHwcOIX/MRD7WSaNc+cEIb
         PX55hbYbu+T/sWQv7NCzabw3z0/3h9o1deOTttiphzVghpaEDgbfcK3en4PIXIn8h2o3
         uigX4csz4oQ1czrXlsx4ZAtZVM7QHn3Mtlcim6YAdGWvf91zZWDOUNUlFKEng4+wSoXm
         t9WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872627; x=1789477427;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+vtrY7KzlKFzHbPTxxbP/vZcWl/f7JuDpE3t3EALSeM=;
        b=seEZbXbGVQNlkGSGysNSpko0QFam1S1nsp3hmo1YXL4+H0cjguIvrlx8hR8o8gDZbb
         1sIQlyJavD4uDKkNLlNA6NBApk7HhWki1iZX68FIJbPKAGmnjZpARONnWSFSG/LJknxE
         HmxEHWt8Vzye3U9hg6fGszEJ87k6dB4bWvhgdM1bxBX8359t9E0+zjjvcr1KIrRs3TYa
         1nc/+oqikS3bq4yK3nm1h7DZOtOKKz7UfE3ndEHz59DL9VWFFXomFaBjABoEBS5x1XJ6
         Dke3AWLRCt2/oKPaOtZNNSWEGOOZMLPGUtUBi0SmZjCYt10cRwyZJFELM677mFhhKZIL
         OoHw==
X-Gm-Message-State: AFuF++lLndc3M/PqRj3ZXk2q3PcA3I7vhVtAEqpQr1f7bydifUyo4bA0
	+2Q7krLs/WcOaIJsaGHr91F2VSoZTxe2NXvG3mgB8/yCZ0finG7gOF+fsttXyLePfs8CjMA0Syw
	EzMuVRw==
X-Gm-Gg: AYBFou0qk2Q9AT7nj8ZQ7azhV0zAp8uppXJJoAJTjgwIulZaSczluGkWW8sqTTgXr2z
	0Qn2gA2h1xtuuRN+AIi/tY7W2MsZD7wzTvWgINLhDnMqx764N3AXHGnuAYP9Epc8p4GnzmMEzSs
	UH/aZ2rhpHpcwEHzH6f0GAn+L/37EafDH7NS4fzFAfmpBJoHs1YP5TJiUxurISBI7oYHsaGPZi3
	EvN7Rkl7n70cYEsG1eoBfdlxw6q3o3okq4LLK0HvAotddbjWpQc+UlQvSJdizl3fZCcAIi8XoOl
	vufuknsa2B/G5vgmDLA7oSUan9IXBQKkODYOlYqrEnWYok6p7rg6G4HHVMO8+rNvggzf6hZXVZ9
	5xjm8kmvZVyp9mq6Alo8YouwUx/JKpGyG8TrNKyqsaA+b11dhrtn1t3arErIpE+cWhp1dflrRSG
	wLQ2fugCpCo5xDryIdA7gil5UtCsU4a5k1tZEjo4f7y8/Jw4PeVBFZTmq5LIcxRorYXnSexS8mj
	6RPxv9hd/xx4CcvZSrbqgb4czDAZyA1d2YL71lSE/XncpN5o79G
X-Received: by 2002:a05:600c:34c9:b0:49c:f729:d757 with SMTP id 5b1f17b1804b1-49cf824f757mr282660295e9.11.1788872627030;
        Tue, 08 Sep 2026 06:03:47 -0700 (PDT)
Message-ID: <d9cedc6d-6884-4565-a62e-08bd8aefd236@suse.com>
Date: Tue, 8 Sep 2026 15:03:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] x86/pass-through: use simpler locking primitives in
 pt_irq_{create,destroy}_bind()
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
X-purgate-ID: tlsNG-ebf023/1788872627-C14D3B50-4B870148/0/0
X-purgate-type: clean
X-purgate-size: 1788

Both functions already assume IRQs to be enabled upon entry, by e.g. their
acquiring of the domain's event channel lock. Hence like e.g.
hvm_migrate_pirq() (also called from here) does, saving/restoring of
EFLAGS.IF isn't necessary (because of the functions called, we can't
really avoid the saving there).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -400,8 +400,7 @@ int pt_irq_create_bind(
 
         if ( pt_irq_bind->u.msi.gflags & XEN_DOMCTL_VMSI_X86_UNMASKED )
         {
-            unsigned long flags;
-            struct irq_desc *desc = pirq_spin_lock_irq_desc(info, &flags);
+            struct irq_desc *desc = pirq_spin_lock_irq_desc(info, NULL);
 
             if ( !desc )
             {
@@ -411,7 +410,7 @@ int pt_irq_create_bind(
             }
 
             guest_mask_msi_irq(desc, false);
-            spin_unlock_irqrestore(&desc->lock, flags);
+            spin_unlock_irq(&desc->lock);
         }
 
         write_unlock(&d->event_lock);
@@ -606,9 +605,7 @@ int pt_irq_destroy_bind(
         break;
     case PT_IRQ_TYPE_MSI:
     {
-        unsigned long flags;
-        struct irq_desc *desc = domain_spin_lock_irq_desc(d, machine_gsi,
-                                                          &flags);
+        struct irq_desc *desc = domain_spin_lock_irq_desc(d, machine_gsi, NULL);
 
         if ( !desc )
             return -EINVAL;
@@ -617,7 +614,7 @@ int pt_irq_destroy_bind(
          * pt_irq_create_bind is consistent across bind/unbinds.
          */
         guest_mask_msi_irq(desc, true);
-        spin_unlock_irqrestore(&desc->lock, flags);
+        spin_unlock_irq(&desc->lock);
         break;
     }
 


