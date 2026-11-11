Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EA460A2618
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FZmxe0Xz
Received: from list by lists.xenproject.org with outflank-mailman.1484094.1687452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9wP-0003Fu-5b; Wed, 11 Nov 2026 15:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484094.1687452; Wed, 11 Nov 2026 15:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9wP-0003Fn-1d; Wed, 11 Nov 2026 15:08:49 +0000
Received: by outflank-mailman (input) for mailman id 1484094;
 Wed, 11 Nov 2026 15:08:48 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9wO-0003FT-2z
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:08:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9wN-00GV8d-Fx
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:08:47 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484ec-bab6-0a2a0a5309dd-0a2a4504a42a-22
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:08:47 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af484ff-b57f-0a2a45040019-d155dd35f1b4-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:08:47 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so1286361f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:08:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4983284c99bsm11447866f8f.7.2026.11.11.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:08:46 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794409727; x=1795014527; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JCKHFNSJLx+4ih/INQPF/K8VKDkD9CYqpmxnnodEKG8=;
        b=FZmxe0XzFObPJwpaxU5+dIkE9oKocC1X+499AWP5YzeGAK1fg+jsj5Sdp3zYVGMVxk
         iUxYHfMScsdu5jZWEdMvQh5R/u+Lq/wa7jlJqEkJSkEexVTAlWXHNB7GIzEXg5Ijf4gz
         jvsussTxNZ2Fbazq3hd8xDcsSz68eSWMd1DLvMSEBrFBwtz65kRNVul1bMrn5x70GCAL
         m20T1qtGHpJOyR92tjEMdrK1Ycg3Lq6oSP8H1a3jiIDHcKhjGA7uSVH7ZTfxK/dbh8mz
         +M1eE/gq6Mr9yf14AxCPRp4k5grLK9Kd4NU9vXYLFEfuL6+TWS12XXqpvJd0lfEkMt18
         ZXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409727; x=1795014527;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JCKHFNSJLx+4ih/INQPF/K8VKDkD9CYqpmxnnodEKG8=;
        b=wqtuzhDRArAVytO/Mlj/RCKrawi1wyijyMXi0tPdOmjvG8U37B4FfbaoUyfQFdyCwO
         ALaUXM973LFjzUUJXd0i1ZEdeD7nqeEsP6Illvo1Ilas6J2EYp0eGXscZg0JKB5Y2+V2
         uf0wV9lnn7PwVF1M2eOt4rohHciXn1hLnFHcLGLgi0R4XYFBcGostlqtqNJ+SHvcJEe1
         xSdGxJqg8ys9ryO3UiTw0miRvL5tHpA3qtWYa4jhj6EIBGSv77AQoLbMQMfbgaODcfOp
         5jutGcULpgtWZcZbvUBEOazOGiXBd8KDiMP0aD5mNvERnrD2UcQ7/PqkqeyPIv5it7r+
         07gg==
X-Gm-Message-State: APuU4Z/tWE5aVU2zXcOdzvKp9c9th54EqjXGtZid9Cewt9OBYuU8A08T
	Zk9RYQfvxPfNtziyk8EDkNmNbPuaz6Tw/JBZesP2J4JcO4nuMBK3WFWhCa6YyyLTAbFD2yEt16F
	Qzt1uKw==
X-Gm-Gg: AYBFou3CA5PHp+O2BoG8wRWMsnO+jR80uOw+VAN1G6yUHvn5BJXnC0TZiBvqkNhcHMe
	4DdDoXpyONhOqjIyi4+rpMvfggzYTTDAa3zKG6hAtcmSqiPh4Q62xX2ZvAvBEsWKyqHhgHk4PsR
	1+mIzGuu5/x3MWSYbYFK2IQoZjvqSnyAkgkz+TPLgJX2w0F4xW/+LIxgcfBpwXavRKvwm+IpuP5
	zp1K6U+p5v6G1oUJTkllOuT5gaxRNoCzNnlyCM+KZ7bPEE+cdf1KqLnhma9iJuK87DwSEjDa6AW
	vo/KOpqzqxqFIysSujPAcuq9hvA7Ykah1WlRFW1JhjTWb4KMQ8oLhvcxub0vYaIGBYQnFJm75Hg
	pWx9/W+AMQgw+QV67l2kUWyi8B3GZB2Omui04gBb1Ph0PXBDGaiU/VDtNpnIEwbru4L2QCkAWaa
	e0twIhQJ2H8Sql7nrgTXd6euRrxUjhTT1U20+m/XD0RVL3jBd3WOuwg4oPcrNLyhDZcDM/Dqn/5
	gwEBsLXDX41FolVxBk+w21SsqPrCYIukfiQ0j5Vb0ghI0/j/r8qwOz+SLKzOlFQapTZfdcHQjq7
	gajMn6OpaLdOw1kci+iCDXIO6K0lEJHgfcF2mzMp4Eat9rm1Le27DDA5okxcnDuZR1oM7jGx9ap
	w9qLRJzasENQgimpUz04=
X-Received: by 2002:a5d:584d:0:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-499c7a2371amr4750228f8f.49.1794409726930;
        Wed, 11 Nov 2026 07:08:46 -0800 (PST)
Message-ID: <59313824-bcd1-4af6-b6a2-e051ae3935d4@suse.com>
Date: Wed, 11 Nov 2026 16:08:46 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 05/28] x86: use xvmalloc() for extended context buffer
 allocations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794409727-C2AC8B50-72358B07/10/78276251493
X-purgate-type: spam
X-purgate-size: 4135
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is in preparation for the buffer sizes exceeding a page's worth of
space, as will happen with AMX as well as Architectural LBR.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: Re-base.
v2: New.
---
TBD: Really I'd like to see x*alloc_bytes() go away, but as per the
feedback on "assorted replacement of x[mz]alloc_bytes()" this looks to
be controversial.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -21,6 +21,7 @@
 #include <xen/trace.h>
 #include <xen/types.h>
 #include <xen/vm_event.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/acpi.h>
 #include <asm/cpu-policy.h>
@@ -463,7 +464,7 @@ long arch_do_domctl(
             goto sethvmcontext_out;
 
         ret = -ENOMEM;
-        if ( (c.data = xmalloc_bytes(c.size)) == NULL )
+        if ( (c.data = xvmalloc_array(uint8_t, c.size)) == NULL )
             goto sethvmcontext_out;
 
         ret = -EFAULT;
@@ -479,7 +480,7 @@ long arch_do_domctl(
         domain_unpause(d);
 
     sethvmcontext_out:
-        xfree(c.data);
+        xvfree(c.data);
         break;
     }
 
@@ -509,7 +510,7 @@ long arch_do_domctl(
 
         /* Allocate our own marshalling buffer */
         ret = -ENOMEM;
-        if ( (c.data = xmalloc_bytes(c.size)) == NULL )
+        if ( (c.data = xvmalloc_array(uint8_t, c.size)) == NULL )
             goto gethvmcontext_out;
 
         domain_pause(d);
@@ -522,7 +523,7 @@ long arch_do_domctl(
 
     gethvmcontext_out:
         copyback = true;
-        xfree(c.data);
+        xvfree(c.data);
         break;
     }
 
@@ -1001,7 +1002,7 @@ long arch_do_domctl(
             if ( !ret && size > PV_XSAVE_HDR_SIZE )
             {
                 unsigned int xsave_size = size - PV_XSAVE_HDR_SIZE;
-                void *xsave_area = xmalloc_bytes(xsave_size);
+                void *xsave_area = xvmalloc_array(uint8_t, xsave_size);
 
                 if ( !xsave_area )
                 {
@@ -1015,7 +1016,7 @@ long arch_do_domctl(
                 if ( copy_to_guest_offset(evc->buffer, offset, xsave_area,
                                           xsave_size) )
                      ret = -EFAULT;
-                xfree(xsave_area);
+                xvfree(xsave_area);
            }
 
             vcpu_unpause(v);
@@ -1035,7 +1036,7 @@ long arch_do_domctl(
                  evc->size > PV_XSAVE_SIZE(xfeature_mask) )
                 goto vcpuextstate_out;
 
-            receive_buf = xmalloc_bytes(evc->size);
+            receive_buf = xvmalloc_array(uint8_t, evc->size);
             if ( !receive_buf )
             {
                 ret = -ENOMEM;
@@ -1045,7 +1046,7 @@ long arch_do_domctl(
                                         offset, evc->size) )
             {
                 ret = -EFAULT;
-                xfree(receive_buf);
+                xvfree(receive_buf);
                 goto vcpuextstate_out;
             }
 
@@ -1063,7 +1064,7 @@ long arch_do_domctl(
                 ret = 0;
             if ( ret )
             {
-                xfree(receive_buf);
+                xvfree(receive_buf);
                 goto vcpuextstate_out;
             }
 
@@ -1090,7 +1091,7 @@ long arch_do_domctl(
                 vcpu_unpause(v);
             }
 
-            xfree(receive_buf);
+            xvfree(receive_buf);
         }
 
 #undef PV_XSAVE_HDR_SIZE
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -12,6 +12,7 @@
 #include <xen/guest_access.h>
 #include <xen/softirq.h>
 #include <xen/version.h>
+#include <xen/xvmalloc.h>
 
 #include <public/hvm/save.h>
 
@@ -146,7 +147,7 @@ int hvm_save_one(struct domain *d, unsig
     else
         v = d->vcpu[instance];
     ctxt.size = hvm_sr_handlers[typecode].size;
-    ctxt.data = xmalloc_bytes(ctxt.size);
+    ctxt.data = xvmalloc_array(uint8_t, ctxt.size);
     if ( !ctxt.data )
         return -ENOMEM;
 
@@ -192,7 +193,7 @@ int hvm_save_one(struct domain *d, unsig
     else
         domain_unpause(d);
 
-    xfree(ctxt.data);
+    xvfree(ctxt.data);
     return rv;
 }
 


