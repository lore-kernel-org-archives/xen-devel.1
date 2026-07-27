Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E4CC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:27:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371545.1619045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIY6-0001Gs-Tq; Mon, 27 Jul 2026 10:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371545.1619045; Mon, 27 Jul 2026 10:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIY6-0001Gl-RC; Mon, 27 Jul 2026 10:27:06 +0000
Received: by outflank-mailman (input) for mailman id 1371545;
 Mon, 27 Jul 2026 10:27:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIY5-0001FI-51
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:27:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIY4-000tj7-Hv
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:27:04 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673277-5cb7-0a2a0a5109dd-0a2a4509e17c-10
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:27:04 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673278-be1a-0a2a45090019-d155802ce90d-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:27:04 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4955de8797cso15396365e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:27:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b499cc49sm239774435e9.9.2026.07.27.03.27.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:27:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1785148024; x=1785752824; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MgcXWj5vqnP+4zvYUktX5k7TuUXNjhHYEeS80l/cLOs=;
        b=afG9qVNUStF4s0dDBTtkepAZmquBZfkIiyl9tusYIPnkQs5zjffWVLnp/e7jhKZpJT
         4bae1XomRmPuKyXpcbt8w1m/7ql1Blo9pdbnY6h9pycAAjvsiPyBaOzjOjWOV+YWVY4O
         ieZd4rBdOOZ8mylrgvTAZQyAJO/JcGe110QmmfL0GTRxfx2qrwie1X+YWP/TTcqoD6q2
         tntmRjQcyLh+wV+c5dH1VsEXhe7Kj7X4jy7bfTJ/VGOdRabboHTPL4af+hNEYaD8j67z
         wx0zmhfCKlXQ5DEWTy3k5MdybnMMLPUgwLxqWZQdnZ39QwNCLVR9YH9gNeKoXEak8Bxh
         4tFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148024; x=1785752824;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MgcXWj5vqnP+4zvYUktX5k7TuUXNjhHYEeS80l/cLOs=;
        b=pVEw5r5uTsFjdwnQw0WKoAE66cn+sfveprML+1Aws4TpsyGpUsYMlAlUOdWbQ4casJ
         3KcwUgGYljK21GW6V1ncat/vp49zvcU4yrUWXRXfMYF9MEOWVsyGFI5pQruWVDdxFqan
         ODczxyr+Gic6HLiJx8HVTvi0ubDzIeaidkAuJYG8YovCTzLeLSApnybhEHyUkmZPTBQJ
         fRPIjNRlHdBF0Vg07zBuJh/4M3x6vW1v87a33wcKirIPlO133FU+WdE089S+HFMMKEJV
         LLCiF1sIwMpFz+PppGktSRCJESQ2npzSOqwMdzELF+HbsDIAsuvinFVTsPRg1a9Zowv1
         fnZw==
X-Gm-Message-State: AOJu0YxubXqt4NovywVnxdFjGmmASGHWRxVaOd8Nl6LrOwSk3pANCML8
	9kIA70KuAxYM0vBsx06Wi1P9ZlJ2iGMLf6DBhXVe9s6EqW5f7Qpjitov+eFv99CtehaBzOvSy9+
	byDEGAg==
X-Gm-Gg: AR+sD102XxdqgWEPZnqNsx+CDqUOCYWFhevaJN6FC9UX3oYK4ptxcz3DrR9HoVMOY98
	qZ4qH9OXeTEdHQB8zBkLDxiYLI5n3fHLbOLILDPl2GEL84bfIgZIGjmM40uHx9HZwV8uWQ6G1VF
	dvCntbiASnq249tSDU2kV1MXAMU0c+iilRtghT5QZ7C2gLfirScM5kAa4ttCDy6QPwdrHExImUX
	zJVcdeQ4JtGIzsd6T0r/NQT6JfhevWcoBNZfFlwrK8IZCTwFyWm0XAyJHOzhiAXUbvVHxfJIPcz
	KBe3vud7ERmjhUvvfmTPcgN6KVIihv0OH1ZSZxkyL8ZWRPP3PDhIGa4lAiAHT0R9OlyKLfRn7WR
	BefgCaWzCpzzusZq4DLq7MmPeBMrnSmWwWfasWUMhDsMdS1/E+W4Bh2zA74cKIIJZZ3mP10BPz6
	DmHGkz3RtZ/Bv1TXWlgoLQtDIUaarKolozywKNJ3PimjyxZQWiuMeM+uPgy0KnC7WtE5MQhV7rR
	36C
X-Received: by 2002:a05:600c:1392:b0:493:e79e:da98 with SMTP id 5b1f17b1804b1-496bd6d22fdmr53277045e9.39.1785148023951;
        Mon, 27 Jul 2026 03:27:03 -0700 (PDT)
Message-ID: <96f66873-5c50-4044-93f9-bcd3de717656@suse.com>
Date: Mon, 27 Jul 2026 12:27:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 2/4] x86/traps: use entry_ssp in fixup_exception_return()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
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
In-Reply-To: <f6dd91c2-f43a-4c9a-89f3-a42c8b954959@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785148024-FC610034-78C03261/0/0
X-purgate-type: clean
X-purgate-size: 5932

With the value recorded on entry there's no need anymore to go hunt for
the respective exception frame on the shadow stack. By deriving "ptr"
from that field (without any offset), it then ends up pointing one slot
lower than before. Therefore all array indexes need incrementing, nicely
doing away with all the negative ones.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Indentation of the prior inner (but not innermost) if()'s body is
deliberately left untouched, to aid review. It'll be adjusted in a
separate follow-on patch.
---
v3: Relax the first BUG_ON().
v2: IS_ENABLED() -> #ifdef. Re-base.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -690,19 +690,6 @@ unsigned long get_stack_trace_bottom(uns
     }
 }
 
-static unsigned long get_shstk_bottom(unsigned long sp)
-{
-    /* SAF-11-safe */
-    switch ( get_stack_page(sp) )
-    {
-#ifdef CONFIG_XEN_SHSTK
-    case 0:  return ROUNDUP(sp, IST_SHSTK_SIZE) - sizeof(unsigned long);
-    case 5:  return ROUNDUP(sp, PAGE_SIZE)      - sizeof(unsigned long);
-#endif
-    default: return sp - sizeof(unsigned long);
-    }
-}
-
 unsigned long get_stack_dump_bottom(unsigned long sp)
 {
     switch ( get_stack_page(sp) )
@@ -1187,26 +1174,29 @@ void asmlinkage noreturn do_unhandled_tr
 static void fixup_exception_return(struct cpu_user_regs *regs,
                                    unsigned long fixup, unsigned long stub_ra)
 {
-    if ( IS_ENABLED(CONFIG_XEN_SHSTK) )
+#ifdef CONFIG_XEN_SHSTK
     {
-        unsigned long ssp, *ptr, *base;
+        unsigned long ssp = rdssp();
 
-        if ( (ssp = rdssp()) == SSP_NO_SHSTK )
-            goto shstk_done;
+        if ( ssp != SSP_NO_SHSTK )
+        {
+            unsigned long *ptr = _p(regs->entry_ssp);
+            unsigned long primary_shstk =
+                (ssp & ~(STACK_SIZE - 1)) +
+                (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
 
-        ptr = _p(ssp);
-        base = _p(get_shstk_bottom(ssp));
+            BUG_ON((regs->entry_ssp ^ primary_shstk) >>
+                   (PAGE_SHIFT + STACK_ORDER));
 
-        for ( ; ptr < base; ++ptr )
-        {
             /*
-             * Search for %rip.  The shstk currently looks like this:
+             * The shstk currently looks like this:
              *
              *   tok  [Supervisor token, == &tok | BUSY, only with FRED inactive]
              *   ...  [Pointed to by SSP for most exceptions, empty in IST cases]
              *   %cs  [== regs->cs]
              *   %rip [== regs->rip]
-             *   SSP  [Likely points to 3 slots higher, above %cs]
+             *   SSP  [Pointed to by entry_ssp; Likely points to 3 slots
+             *         higher, above %cs]
              *   ...  [call tree to this function, likely 2/3 slots]
              *
              * and we want to overwrite %rip with fixup.  There are two
@@ -1219,13 +1209,10 @@ static void fixup_exception_return(struc
              *
              * Check for both regs->rip and regs->cs matching.
              */
-            if ( ptr[0] == regs->rip && ptr[1] == regs->cs )
-            {
-                unsigned long primary_shstk =
-                    (ssp & ~(STACK_SIZE - 1)) +
-                    (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
+            BUG_ON(ptr[1] != regs->rip || ptr[2] != regs->cs);
 
-                wrss(fixup, ptr);
+            {
+                wrss(fixup, &ptr[1]);
 
                 if ( !stub_ra )
                     goto shstk_done;
@@ -1242,7 +1229,7 @@ static void fixup_exception_return(struc
                  * - if we're on an IST stack, we need to increment the
                  *   original SSP.
                  */
-                BUG_ON((ptr[-1] ^ primary_shstk) >> PAGE_SHIFT);
+                BUG_ON((ptr[0] ^ primary_shstk) >> PAGE_SHIFT);
 
                 if ( (ssp ^ primary_shstk) >> PAGE_SHIFT )
                 {
@@ -1251,39 +1238,30 @@ static void fixup_exception_return(struc
                      * addresses actually match.  Then increment the interrupted
                      * context's SSP.
                      */
-                    BUG_ON(stub_ra != *(unsigned long*)ptr[-1]);
-                    wrss(ptr[-1] + 8, &ptr[-1]);
+                    BUG_ON(stub_ra != *(unsigned long*)ptr[0]);
+                    wrss(ptr[0] + 8, &ptr[0]);
                     goto shstk_done;
                 }
 
                 /* Make sure the two return addresses actually match. */
-                BUG_ON(stub_ra != ptr[2]);
+                BUG_ON(stub_ra != ptr[3]);
 
                 /* Move exception frame, updating SSP there. */
-                wrss(ptr[1], &ptr[2]); /* %cs */
-                wrss(ptr[0], &ptr[1]); /* %rip */
-                wrss(ptr[-1] + 8, &ptr[0]); /* SSP */
+                wrss(ptr[2], &ptr[3]); /* %cs */
+                wrss(ptr[1], &ptr[2]); /* %rip */
+                wrss(ptr[0] + 8, &ptr[1]); /* SSP */
 
                 /* Move all newer entries. */
-                while ( --ptr != _p(ssp) )
-                    wrss(ptr[-1], &ptr[0]);
+                while ( ptr-- != _p(ssp) )
+                    wrss(ptr[0], &ptr[1]);
 
                 /* Finally account for our own stack having shifted up. */
                 asm volatile ( "incsspd %0" :: "r" (2) );
-
-                goto shstk_done;
             }
         }
-
-        /*
-         * We failed to locate and fix up the shadow IRET frame.  This could
-         * be due to shadow stack corruption, or bad logic above.  We cannot
-         * continue executing the interrupted context.
-         */
-        BUG();
-
     }
  shstk_done:
+#endif /* CONFIG_XEN_SHSTK */
 
     /* Fixup the regular stack. */
     regs->rip = fixup;


