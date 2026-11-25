Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E42606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Arxiq9Hl
Received: from list by lists.xenproject.org with outflank-mailman.1501886.1697886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8TO-0007F9-5M; Wed, 25 Nov 2026 08:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501886.1697886; Wed, 25 Nov 2026 08:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xW8TO-0007F2-2h; Wed, 25 Nov 2026 08:35:26 +0000
Received: by outflank-mailman (input) for mailman id 1501886;
 Wed, 25 Nov 2026 08:35:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xW8TM-0007Ev-V8
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 08:35:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xW8TM-00AfiI-BJ
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2026 09:35:24 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b069dc7-2eae-0a2a0a5409dd-0a2a450ae438-16
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:35:24 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b069dcc-f2d2-0a2a450a0019-d155dd30e8d4-3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 09:35:24 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so3117209f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Nov 2026 00:35:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2e6dsm32339316f8f.6.2026.11.25.00.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 00:35:23 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795595724; x=1796200524; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gkuwT4yE2d3PfRW99iDSDkAsT7ZIpb5UxehZ2Vw0AmM=;
        b=Arxiq9HleRqi5O5k6/hiH5a0taOhddKE+SuQ6dm3b/hAlezwFcUfw2q2Fh6u4qp0ef
         AQUGHynlXrZBBlO7cgKGtQJO1QxhoNbsU50aOyNRDb20xFPc+/s9h/7sy/p/azn0MzX6
         xFs4LJ184UYqsBlLsuhTRRDaQJjAQ4NPWVAd+yZMdQrZ1f3+FNqFKWSLZDTJ9mLl/QBT
         Ojb0hbasUlrr95cUWWibWXubjObRB9fmYDeMzN3wKN65zHjSimk5gMJOMBAMRCg/e3HL
         S+QblTLaW8c0UIwWN6zJcnDrUqXhyJos0/uboRIhvTmlI4dW3xMOrwhQ/yOspn5eC0az
         3rMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595724; x=1796200524;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gkuwT4yE2d3PfRW99iDSDkAsT7ZIpb5UxehZ2Vw0AmM=;
        b=pnvMUu7gqjkz1Z1nABdtrzksOt8WatqEYumvh8ZIPjTOCPz6kNpGzrj7avY+6roh//
         CwM0DYM3FSP/nFje7tssuqAla30lXpY7C1t/kzVmw+Nfc6ghhVebKYQbkx3UDbZiP8e6
         VBzl3pI5Sg7bUFjpNx89ENz/w9/A9LLwiY0nxXhFBD32lWpLjhpx443gbH4v/VC0TRqR
         UOhnmCpkNHEU6ox3PubMQRnLMltkpEO1ud0alNDzlL7vhDMD6SytknL3Bv6ap1nXSAv4
         qtwpUiH8eXwbigGZilki5r/E+c3dxPs8sxZ0aRZy4HHOQX4UkFYkjAcrOQtGj9C8fbr8
         ERGw==
X-Gm-Message-State: APuU4Z8enD0zc8KLK6XSPeogogF+oaDXqBRWkmllwh6gXuHis4RghVcP
	cybG8k2RbQmeqZlXcbcn2QqZdaJnXJR0rY0/W7pwueAXnk15ycjoo4nVrOGVviHJspjQV/4Xxmn
	rsVm+NQ==
X-Gm-Gg: AZFdTZdiPFuH5INfO3oR+dP2v/CzbPs/pAuWS9gN3eQxW75VGycJ3cXPDfTgVeWy9aP
	SO8lEGI7D9wdfU8DJy/3xVL8X3fHbyvtDTS1Y0ay3YMD0IoZDPRO7PFeYWdviQ3BYnEFMrNIbnY
	ccYwnwbLgVthsuWVnquHtPIy7QcBnanvyqAzL5PmyzbWK3SlCtWrXfVrC19gsFxU/9e8vxs20N1
	FuO0QcBtOp0Om+aPaKc3njA/P0+d3ZJrTAwe948HKt3qVfJHN7dcVG0dC7cM87F95uQlQ0Vca8b
	KpGHoNh0E/MhiNn+joJliSdoe6m7ffgHdtqLUyMfAZSqa65jg+TfZZ0z1FOlvj8cJfiSdCDme8I
	M2Te2ZQ1bx7Bt6OGRc+IOyxa6/IJ6u4TyXGtzJkxgNftPV78BYjfpapFmf5q462HpEPGIAeMmiR
	dOKVbh0ZfaaGJCh+fiE/7AeXtKh0eI7ChxWoHZLzvLLb/Vcyu/Ep7qUAUlvt0NF8TGg5iC3DbXb
	8nS2gx9M4XgrtuhQvO9XfPh45cjv1Sm+6XwX69vkAeVKpu/Iqo3yIvlDsZ7xU2CVk5jKjPbYvTs
	1Igu+zds9QQcvtNWk6o7JJ3ZXLvMYlGhs6MbjSN1vOnpqzAhVcKS9UWEdmWBorjonhLVlb5JNzD
	in1ppOPLDKzLD+9i3
X-Received: by 2002:adf:e189:0:b0:4b7:6a63:89b2 with SMTP id ffacd0b85a97d-4b76a638a20mr8974297f8f.20.1795595723777;
        Wed, 25 Nov 2026 00:35:23 -0800 (PST)
Message-ID: <98b59682-fb65-4403-9f67-45404d898550@suse.com>
Date: Wed, 25 Nov 2026 09:35:21 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xmalloc: correct _xrealloc() for large or changing alignment
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1795595724-4B0D9CFC-ECF393BF/10/78276251493
X-purgate-type: spam
X-purgate-size: 3410
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The curr_size calculation on the non-page-aligned path may include leading
padding; therefore that size cannot be passed unadjusted to memcpy() (or
the min() used in its invocation).

Further, for the "can be re-used" case on the non-page-aligned path, if
alignment changes from what was used for the original calculation, the new
pointer could differ from the original one. Hence memory contents may need
moving.

No in-tree users presently exercise either of the problem cases. Add some
self-testing to cover them.

Fixes: 50879e805edb ("xen/common: Introduce _xrealloc function")
Reported-by: Roger Pau Monné <roger.pau@amd.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -681,13 +681,20 @@ void *_xrealloc(void *ptr, unsigned long
 
         if ( tmp_size <= curr_size )
         {
+            void *p0 = p;
+
             /* Add alignment padding. */
             p = add_padding(p, align);
 
             ASSERT(!((unsigned long)p & (align - 1)));
 
-            return p;
+            if ( p == ptr )
+                return ptr;
+
+            return memmove(p, ptr, min(curr_size - (p - p0), size));
         }
+
+        curr_size -= ptr - p;
     }
 
     p = _xmalloc(size, align);
@@ -730,3 +737,73 @@ void xfree(void *p)
 
     xmem_pool_free(p, xenpool);
 }
+
+#ifdef CONFIG_SELF_TESTS
+
+#include <xen/init.h>
+
+static int cf_check __init selftest(void)
+{
+    unsigned char *ptr = _xmalloc(1, 1), *new;
+    unsigned long align;
+
+    if ( !ptr )
+        return -ENOMEM;
+
+    BUG_ON(!IS_ALIGNED((unsigned long)ptr, MEM_ALIGN));
+    ptr[0] = 'A';
+
+    new = _xrealloc(ptr, MEM_ALIGN, MEM_ALIGN);
+    if ( !new )
+        goto out;
+    BUG_ON(!IS_ALIGNED((unsigned long)new, MEM_ALIGN));
+    BUG_ON(new[0] != 'A');
+    memset(new + 1, 'B', MEM_ALIGN - 1);
+    ptr = new;
+
+    for ( align = MEM_ALIGN << 2; align < PAGE_SIZE; align <<= 1 )
+        if ( !IS_ALIGNED((unsigned long)ptr, align) )
+            break;
+    new = _xrealloc(ptr, MEM_ALIGN, align);
+    if ( !new )
+        goto out;
+    BUG_ON(!IS_ALIGNED((unsigned long)new, align));
+    BUG_ON(new[0] != 'A');
+    BUG_ON(memchr_inv(new + 1, 'B', MEM_ALIGN - 1));
+    ptr = new;
+
+    new = _xrealloc(ptr, align >>= 1, MEM_ALIGN);
+    if ( !new )
+        goto out;
+    BUG_ON(!IS_ALIGNED((unsigned long)new, MEM_ALIGN));
+    BUG_ON(new[0] != 'A');
+    BUG_ON(memchr_inv(new + 1, 'B', MEM_ALIGN - 1));
+    memset(new + MEM_ALIGN, 'C', align - MEM_ALIGN);
+    ptr = new;
+
+    new = _xrealloc(ptr, align << 1, MEM_ALIGN << 1);
+    if ( !new )
+        goto out;
+    BUG_ON(!IS_ALIGNED((unsigned long)new, MEM_ALIGN << 1));
+    BUG_ON(new[0] != 'A');
+    BUG_ON(memchr_inv(new + 1, 'B', MEM_ALIGN - 1));
+    BUG_ON(memchr_inv(new + MEM_ALIGN, 'C', align - MEM_ALIGN));
+    ptr = new;
+
+    new = _xrealloc(ptr, align, MEM_ALIGN);
+    if ( !new )
+        goto out;
+    BUG_ON(!IS_ALIGNED((unsigned long)new, MEM_ALIGN));
+    BUG_ON(new[0] != 'A');
+    BUG_ON(memchr_inv(new + 1, 'B', MEM_ALIGN - 1));
+    BUG_ON(memchr_inv(new + MEM_ALIGN, 'C', align - MEM_ALIGN));
+    ptr = new;
+
+ out:
+    xfree(ptr);
+
+    return new ? 0 : -ENOMEM;
+}
+presmp_initcall(selftest);
+
+#endif /* CONFIG_SELF_TESTS */

