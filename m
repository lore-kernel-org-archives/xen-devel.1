Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E02CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:24:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445951.1661839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBKx-0003Dk-IM; Mon, 12 Oct 2026 08:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445951.1661839; Mon, 12 Oct 2026 08:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBKx-0003Dd-FY; Mon, 12 Oct 2026 08:24:47 +0000
Received: by outflank-mailman (input) for mailman id 1445951;
 Mon, 12 Oct 2026 08:24:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBKw-0003DS-Fu
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:24:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBKv-004h4N-Sb
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:24:45 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9948-8faa-0a2a0a5109dd-0a2a4502bf3c-32
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:24:45 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc994d-6ca4-0a2a45020019-d155802bc418-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:24:45 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so13389395e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:24:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf15691sm265454305e9.6.2026.10.12.01.24.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:24:43 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793485; x=1792398285; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KDxjiJoC7Zfxqe0fOfGwbY9xr+haAUaY8IesLtAlI3I=;
        b=WzYHTfezot9xOniBwkGTdIWRTwepyGYS326zvaFzLYTztLCHXK9pX1ES76hgfAYAoB
         gIGgMWJw7OQHWS/okTHJEcVBWU/tPc4ByMvwR4/7y+dkPj/0ELeY+HpdkywMmpWTSEDL
         D7AZgaGsffxZCEqEoHb+Ma8dZXZgKvW0O4tpXvN7KE3iuFYj+K93Qv4+n4p2OjmCerDU
         HP8xCLjR+GOs7cPvvvLhc/8rBU2NuyxuoDplA4wBs/TwRubPfBz4F+6BBfnhFCH0iFOm
         HzDYT/MKIlGj2ddy8SRbUxgwGYdCwBB1GnoQThQnxeyx3HliXoTaQjY2S9OO3IYy32sj
         OffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793485; x=1792398285;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KDxjiJoC7Zfxqe0fOfGwbY9xr+haAUaY8IesLtAlI3I=;
        b=S59UFyzTTbVQhfjuML+HlSQjOjLzzDGq4pwutVFdO3ncL5nXXXojE0+oIvjADRQTwz
         ciUwZRVKJBJH4ehahG2DVcy8bVWYjV0e2pjpL+m9f6zQDme3gssYP/xzn/lCSYqnQk07
         HhkxRBAKEO3BMRapHBEgrYyw7WaDKA2GRa7XBg/mabqu5Rt9hdrYoiQfD+ys7Of6jPjZ
         5XywX1M0jjPCA2hZWKb7qtvw8iiVi90FJD3W/B4NLREn3WtFQGL+RH58L5B1LQzlLX2N
         9q4rwDFvEfOGhuG3WrVjYK4ELdrz53vyjLD/N5MNCkRXhd/kRpLZG+KciYPab8/fZ8CS
         CUgw==
X-Gm-Message-State: AFq9FYIaMgMmW1d7JLWDyhxLkBs+QYk3DapfbfVMas1stHDkmZYhejEm
	NpNmwUKF7rNbiTEJ/tYUcEaiOQoLdKoN6Lk9D3qtOlkIa2j12UxPv8a0dfBrqvRCxz+2loysjlw
	8piHcYw==
X-Gm-Gg: AYBFou02O3G3+pPpQHya7R5crOKJRlWOekFVqcltVSqWO9tp0nRfS6/wwMVLg0jfeq3
	2xRqKxftf8N2+jGuRVtAnVEBnMBmdJoJoW7hlPL3jmXBKYUVSZiCBHXDIicxWH5jmMf9ojO4QTt
	zakDMFy6S+3lgwMz7Azufvog9yL9iyG5u7avWryUk8ujJ8AJb28j6wSm9nIfRAm8ktAQh9wy1w2
	A9JdvHv2BKHgcFEaMHzbLugR3diJa3ju6T47/v51vty2G0mD5FFFXSZc65iBEAOk2oQmeUj7hb8
	tUPrKOr+A8JKTgcchsMb6WMrRAjOnvykeo0hxh2wNn3CKc+djQgDw/cQ0u7z0CsYuX+D5GBwhq5
	SyeobQS9P63giSSIMtSnDXFW8T+hq03dLuWGpMD0+HunG5p7xdVcb5xunNg2XgIiJDIN7jRaTs8
	CP9roazGO7rwQXYIHOpJMERtG19tv43qdReBusLg2+Gm0FU+zSYKv6syv01fg7TF33Tkfs0XvI1
	IcCEhP3124tT3Nt6+87vISiGvoamjU+QDfm8aDA9dcd5pg7MDX7a8NxXl3tf60=
X-Received: by 2002:a05:600c:46cf:b0:4a1:7e1f:21bc with SMTP id 5b1f17b1804b1-4a18e4d6636mr169211865e9.29.1791793483815;
        Mon, 12 Oct 2026 01:24:43 -0700 (PDT)
Message-ID: <c27c214a-da72-419d-ae30-2315b85d0c83@suse.com>
Date: Mon, 12 Oct 2026 10:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/15] x86/PVH: convert find_memory() to using a rangeset
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
X-purgate-ID: tlsNG-720697/1791793485-30BC02AC-52595182/10/78276251493
X-purgate-type: spam
X-purgate-size: 3172

Subsequently we will need to exclude a 2nd range here. To avoid
complicating the logic when it needs to cover two ranges, follow the
suggestion left in a code comment and convert to using a rangeset.

Suggested-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The Suggested-by: is based on the respective commit's S-o-b. I didn't go
hunt for whether this may have been suggested in review of that patch.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -518,14 +518,38 @@ static int __init pvh_populate_p2m(
 #undef MB1_PAGES
 }
 
+struct mem_info {
+    size_t size;
+    paddr_t addr;
+};
+
+static int cf_check __init _find_memory(
+    unsigned long s, unsigned long e, void *data)
+{
+    struct mem_info *info = data;
+
+    if ( e + 1 - s >= info->size )
+    {
+        info->addr = s;
+        return 1;
+    }
+
+    return 0;
+}
+
 static paddr_t __init find_memory(
     const struct domain *d, const struct elf_binary *elf, size_t size)
 {
-    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
-    paddr_t kernel_end = ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
-                                 PAGE_SIZE);
+    struct rangeset *ram = rangeset_new(NULL, NULL, 0);
+    struct mem_info info = {
+        .size = size,
+        .addr = INVALID_PADDR,
+    };
     unsigned int i;
 
+    if ( !ram )
+        return INVALID_PADDR;
+
     /*
      * The memory map is sorted and all RAM region starts are aligned to
      * page boundaries.
@@ -542,26 +566,22 @@ static paddr_t __init find_memory(
 
         ASSERT(IS_ALIGNED(start, PAGE_SIZE));
 
-        /*
-         * NB: Even better would be to use rangesets to determine a suitable
-         * range, in particular in case a kernel requests multiple heavily
-         * discontiguous regions (which right now we fold all into one big
-         * region).
-         */
-        if ( end <= kernel_start || start >= kernel_end )
-        {
-            /* No overlap, just check whether the region is large enough. */
-            if ( end - start >= size )
-                return start;
-        }
-        /* Deal with the kernel already being loaded in the region. */
-        else if ( kernel_start > start && kernel_start - start >= size )
-            return start;
-        else if ( kernel_end < end && end - kernel_end >= size )
-            return kernel_end;
+        if ( start < end &&
+             rangeset_add_range(ram, start, end - 1) != 0 )
+            return INVALID_PADDR;
     }
 
-    return INVALID_PADDR;
+    /* Remove the kernel range, rounded to page boundaries. */
+    if ( rangeset_remove_range(ram, (paddr_t)elf->dest_base & PAGE_MASK,
+                               ROUNDUP((paddr_t)elf->dest_base + elf->dest_size,
+                                       PAGE_SIZE) - 1) != 0 )
+        return INVALID_PADDR;
+
+    rangeset_report_ranges(ram, MB(1), -1, _find_memory, &info);
+
+    rangeset_destroy(ram);
+
+    return info.addr;
 }
 
 static bool __init check_load_address(


