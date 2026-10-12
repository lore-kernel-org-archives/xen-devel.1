Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDD6CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:26:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445965.1661866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBMD-0004dU-Bq; Mon, 12 Oct 2026 08:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445965.1661866; Mon, 12 Oct 2026 08:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBMD-0004dN-8a; Mon, 12 Oct 2026 08:26:05 +0000
Received: by outflank-mailman (input) for mailman id 1445965;
 Mon, 12 Oct 2026 08:26:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBMC-0004bx-8c
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:26:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBMB-00B9Um-Li
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:26:03 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9997-2eae-0a2a0a5409dd-0a2a450aaf64-8
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:26:03 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc999b-f2d2-0a2a450a0019-d1558030dc5a-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:26:03 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a16aaf2067so19667845e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:26:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2caf4sm299236925e9.10.2026.10.12.01.26.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:26:02 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793563; x=1792398363; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gbCqWsCuxEY5XIFrNsxca019l5IysgC/aX8g/IMX/Vc=;
        b=ejrPi7yNprjNkkaUc7fC4Ub2CCgzigCpjaIFGKL/tjp5isbfv2Q80Kc+BE0b2n5v4u
         qnQOvqyQGVzkrxsYB+q/Sw8eaYKvZY1MzNjcjap1bnKdCQxgvxQTEwhclLQ0hXYAd9Hx
         YAvh/rO0Z9yNTSaOE+Pnq8c6t02nTRuFaFcILsrkt1H9l2RvnROWcdjeMZvK1CY8nlyx
         HbyY4vGnNLQTqquxnKeBu8gwNEPpMJAUe/TV7yx2QhBqNw3sH7OrkBBbnYJbJ8TPcS6N
         o56S4nlNAGJlCbPJEj+RKS9aD3uVxffdKTMs6YXDKANBGBSKoMBpx9SRDSGAjyl6wAK/
         JbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793563; x=1792398363;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gbCqWsCuxEY5XIFrNsxca019l5IysgC/aX8g/IMX/Vc=;
        b=Df6VIwxegJHPEXV7MOgKf2afOtp1GJYRZRT/dZASsDGHYA31Pmukkj2vDzRNdrfZYR
         d0wknU4Ci0MsJTJHgtrItuhrc1L9vlZBJBjjbS37SUZ4M0KYQuG3vSXZNODC3JVXp/GM
         UWMs41Thw0+UM3sZeq3uAYiL+g+JaUPYtyyMrjMqGNaNi1wOC/Yhp+a2VCq6u/D+S+Jv
         kKnUoFJHtyLczBSbw/Q/S7lByR1HhEYDZX+qzfw26s/G8d8ZAGBadA5aYCr7bAim1o9W
         BN1n5sbW9dEcdXvyxtCdo4Sg6668xcQi9d9EuVpPkclLCJXKKjEBw1oTwp4Yl9HOqiwY
         CIUA==
X-Gm-Message-State: AFq9FYKxTGayj35mDleY/Nql0/iV5LmHzrf19pkBKlwhAF0VCyMwoDhF
	LktbrQHOHbfE2l2yFJIJC1U8+ec+r+qm6YBBGeMb2vwkWTFeHad/JyEPVNTPFT+CBE4xA0ATU7R
	Njeaa/Q==
X-Gm-Gg: AYBFou0L3RfBF5rH/VWK/Q9XKM9O9zIv65LE6AQulhPJjL7dELcLwOZe2KQaVZbBPIb
	6mDkWrUSdE+W3w6BvvCehzkR22HkvSZgltlrGFDl1HvI/o8oG6K6F6FJ4BlgLvGyBuAVY9DyEDX
	IMe8Qy/lkItsIwvc/NcXGOQUvMnotjFUrG/ddGcZYB6wIowGbspJDIV/ZovfF7S7p+LNyLkLMOS
	2DyboUr0ORPC64vSuA5x9VF3nxvv8z/T7cQ3hubXbJhaR/8Qk4zLImAHOlwDNRIK1tC9FimQqSb
	RJ9UJxn6dpvzcT+UgVKXbkGx5okSKEzFrDYFpbtANIIqbggi91i3JgAX3MIHm5kANyma1AtNjci
	96ksngsv9EX30oeRTkWCJqz7libUiAwH5pi73yAyn5qM7UfOi/nt3/u46phSCdlf5z274vXPoMq
	zNNgurBytCgCJrve6VwTBth01xNpH+oHtNYxF8ehsOEkpXjK2jxKvVJ0LRyG9U5i8v42rFpVySt
	NiFtar2iz0iJ56oY6dIhUQzldanuy1YuD30LBT2wkfd1ktkUhvzn2P4OYNquQQ=
X-Received: by 2002:a05:600c:609a:b0:4a1:7108:c2b6 with SMTP id 5b1f17b1804b1-4a18e4effabmr161479985e9.31.1791793562962;
        Mon, 12 Oct 2026 01:26:02 -0700 (PDT)
Message-ID: <cdfa9dea-1fc9-4df9-9b96-f10655573ebb@suse.com>
Date: Mon, 12 Oct 2026 10:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 13/15] x86/PVH: prefer smaller E820 regions for stealing from
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
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
In-Reply-To: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1791793563-58FC6CFC-A7FF35A4/10/78276251493
X-purgate-type: spam
X-purgate-size: 2429

Nibbling from the end of large regions tends to split full 2Mb (or even
full 1Gb) ranges, which Dom0 may otherwise be able to use superpage
mappings for (when, like Linux, it e.g. has a direct-map).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Instead of comparing original sizes, we may want to compare remaining
sizes. That may (slightly) further increase the risk of successive steals
not ending up adjacent, though.

There is the (pre-existing and purely theoretical at this point) risk of
(entry->addr + entry->size - size) underflowing. Do we think we need to
cover that remote case?

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -192,6 +192,7 @@ static int __init pvh_steal_ram(struct d
     paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
     paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
                                  PAGE_SIZE);
+    struct e820entry *good = NULL;
     unsigned int i = d->arch.nr_e820;
 
     /*
@@ -202,26 +203,35 @@ static int __init pvh_steal_ram(struct d
     while ( i-- )
     {
         struct e820entry *entry = &d->arch.e820[i];
+        paddr_t res;
 
         if ( entry->type != E820_RAM || entry->addr + entry->size > limit )
             continue;
 
-        *addr = (entry->addr + entry->size - size) & ~(align - 1);
+        res = (entry->addr + entry->size - size) & ~(align - 1);
 
         /* Avoid kernel range, if this is the region it lives in. */
-        if ( *addr < kernel_end && *addr + size > kernel_start )
-            *addr = (kernel_start - size) & ~(align - 1);
+        if ( res < kernel_end && res + size > kernel_start )
+            res = (kernel_start - size) & ~(align - 1);
 
-        if ( *addr < entry->addr ||
+        if ( res < entry->addr ||
              /* Don't steal from the low 1MB due to the copying done there. */
-             *addr < MB(1) )
+             res < MB(1) )
             continue;
 
-        entry->size = *addr - entry->addr;
-        return 0;
+        if ( !good || good->size > entry->size )
+        {
+            good = entry;
+            *addr = res;
+        }
     }
 
-    return -ENOMEM;
+    if ( !good )
+        return -ENOMEM;
+
+    good->size = *addr - good->addr;
+
+    return 0;
 }
 
 /* NB: memory map must be sorted at all times for this to work correctly. */


