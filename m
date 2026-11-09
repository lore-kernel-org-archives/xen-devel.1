Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13E3606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=GatG4V6O
Received: from list by lists.xenproject.org with outflank-mailman.1480039.1683972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP6t-0000Wy-BZ; Mon, 09 Nov 2026 13:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480039.1683972; Mon, 09 Nov 2026 13:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP6t-0000Wq-7k; Mon, 09 Nov 2026 13:08:31 +0000
Received: by outflank-mailman (input) for mailman id 1480039;
 Mon, 09 Nov 2026 13:08:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQP6r-0000U6-KW
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:08:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQP6r-007emB-19
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:08:29 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5bf-bab6-0a2a0a5309dd-0a2a4507d41c-34
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:08:28 +0100
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5cb-b4ea-0a2a45070019-d1558033e434-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:08:28 +0100
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a35a60499eso6289365e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:08:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b76cbdb9cdsm194886635e9.1.2026.11.09.05.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:08:26 -0800 (PST)
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
        d=suse.com; s=google; t=1794229707; x=1794834507; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MgcXWj5vqnP+4zvYUktX5k7TuUXNjhHYEeS80l/cLOs=;
        b=GatG4V6Oyrx0EZ4NbrFbsYKBtSKWu+Mm93yja4qQMqyHRdeSFsbfZy9x+JX7EvfgUp
         GL8OWjdLwXVjT55Cul886OOxiAz+gWAhwbS1tvVQ1sEfRydpO7WLlncyILGiIjReFoSG
         fBjZtBM4TL2cd6CE1K12AI6VznE1uoUyrNGBxCWgD/rBA0LM/gdTItF72JCtXNheDqfO
         DYiD9T7jp4vL1ilWvOXLTGyvcL3QhkSD5X1QpdlFpCIlDD+uVzqdZZHiH1ak6qTZXpAf
         g263JMqIOSViZ+v3b01JgycSQdA1vQoLv39GAMaZIwGfMMY24tXWF6+Fra3PkxfjPq3u
         O7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229707; x=1794834507;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MgcXWj5vqnP+4zvYUktX5k7TuUXNjhHYEeS80l/cLOs=;
        b=BHYn70eCB3i+7d6Kbn+Z1RfogoKmQMP06Z1WLNHPdow0KYZE3OMsgqyTEGKTy5Sd8f
         FvcQp6UywAnjNvipMhEaAkQ1X9IXsSV+s7h5qAN2aRT58uGZnF0SLufdifkG5BAMede/
         dRpUupTASW1HIM3OCLPUplnxK8/9AWlPlV3MOWyHixUBv7eBBx4q9njFC287gSFpUF6N
         zITLdG9nLxUGjYY9+WOz9ZJnbDeh9I1eoh+QuWTPqGR4JZ56TYa/TZrWeGs0np4vayzN
         I6/KpyNJrwk/bkLVddb8Kiy+2kZfiocfHKwW9tRK9Ys2qpHnZa0ZAAiq9IWVyfOdU56R
         RThQ==
X-Gm-Message-State: APuU4Z9K8WdoBfIsI4jJc8Bz0a5Lga39FdjN7IboXwqIFlKik8sl9X/6
	0RtUwla3L+3dRdtIiVymPph8Oq4VcH4o4swnukWbw9RgGJ6zOwDK7m3jDPJYu5HcTQxJ0nIn+0n
	xpsGUqQ==
X-Gm-Gg: AYBFou1/kxtIHLAr/aRxYxkhYugvs9dAHf5OWCSidHmLXYYmYLTirBymnofHH2C1RbA
	/E8v0rN1335MqnSySlF6QyBpgtW4CdHEILU3/ZzoUydtYJyr+v8fR1baMB2MFuX/mUts0QB3ytZ
	KTQZ9DcKZRFntzEmDMGfx12lHqFe0LLitr0u+u0fY0vg1GH4jIfB8g0ny5UiT/cc2l92DYU1K1Q
	bGl4ba9UnpEWiKLkMQE/JmoOPhUZ1JdNzjmW60TvJ9TegGeAinjxGgNwAC3qDcAMNMh5KAd1L9w
	yZwSflrRs1DJrN+IGS186VDWh9hWJWFqVBuSaKJWAY3mdnBtCDzLm/aQRed2hIAQwwrDmEkmorh
	gWXPXSY2towM5FFU0kpg6tZUjH0W3y06Lh1Gc7H1lMhZhGH6Osb5k0kFSO/zsSXoPo6Xa6ApRo1
	u+xkcqtYPk1zVPGD0S+X5UtR2fig80z22DkrckzkPMCTrULHLJNTvS0nkFLQqndUqU/CFnNJUxj
	NX4SE7oFmM9l5zjbZXjJc9ijEUTVvD7e5PB9EBNels9rOcdV5XcnW3CWLvVKfYxjVQYg85pRtQx
	C7C9S0eCfTJYC6aFdzKjtV1SKplkotSI90W5RL+2yZ+SxJEsqS+E2vAPihiMKgT6RgvbaLIfjMQ
	Q+gJGIee5xeeyPEg=
X-Received: by 2002:a05:600c:1906:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4b963c8153cmr71863165e9.31.1794229707510;
        Mon, 09 Nov 2026 05:08:27 -0800 (PST)
Message-ID: <edcf7f03-183b-4fae-bea1-d938e95a7eaa@suse.com>
Date: Mon, 9 Nov 2026 14:08:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 2/4] x86/traps: use entry_ssp in fixup_exception_return()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
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
In-Reply-To: <d0de0425-a0fd-4ced-9768-ff102b953a22@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1794229708-358C1AE4-2863B18D/10/78276251493
X-purgate-type: spam
X-purgate-size: 5932
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


