Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DDAC53219
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:27:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371551.1619055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIYM-0001ea-8Z; Mon, 27 Jul 2026 10:27:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371551.1619055; Mon, 27 Jul 2026 10:27:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIYM-0001eT-5s; Mon, 27 Jul 2026 10:27:22 +0000
Received: by outflank-mailman (input) for mailman id 1371551;
 Mon, 27 Jul 2026 10:27:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIYK-0001dv-KV
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:27:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIYK-00GveR-18
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:27:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673282-e002-0a2a0a5209dd-0a2a450c89b0-12
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:27:20 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673287-f479-0a2a450c0019-d155dd31c516-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:27:19 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47640541585so1572009f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:27:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bb5a46sm46860374f8f.9.2026.07.27.03.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:27:19 -0700 (PDT)
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
        d=suse.com; s=google; t=1785148039; x=1785752839; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AqSjmcCLXigH7zyg0H7IqSqKdhTEi7QtkMIfRzneltA=;
        b=gOG9lr80GHfvCbOVLhoUNysTGWWBI1IX4mU0qBvJImtRGuf9EtWtJjw/W985QRgEtI
         d3DGEwEcDlZu6pDhdLIDzmYP+ptBFbedizAWPsdaQjuQPPTryASXYT++iPsq/QEJnF3q
         y0VoMtICgoyNwmAoKXFQPGWvjYr7uXM6ayg3k6hwLB9yr9fi/TxyNdYg3WkDDKycpHqK
         8RZuIYzBXw51VEOFFHcAiNJjyhpK5zwbU921pJ8Juf+YfQBuP379TFULghZox5Ju5uNE
         Xf7iP5s3ZThuDZi37eYUk6eDf5ni6tnzO1qHZQ/FhRU0JeR6KC3AqLLaspLYlicUUg4H
         KLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148039; x=1785752839;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AqSjmcCLXigH7zyg0H7IqSqKdhTEi7QtkMIfRzneltA=;
        b=gj+GUGPIBH+VPXd7bTsmWHPEoiCcrDLNWeGuIhmpH+vGyGCzLioZZDLkNKOFr5SxxB
         rLTBoV8OJtTV5gkRnIRYQhHyni4CwBTFuWTBg7w9EOBR3w8epFmEY/uE28H9yBt4sTjh
         ETnFrsCaFDXiQutoG8VAH1n5p81jq1fgJ47XUAZfI2lM8ByELDj35osnY/7a6iWbkIDA
         SvyCUkKxs61W5+gaRPnXj2obcdmxMnhxRW7Zr0OftASIeCM5gzkQxANL4sGNip8tw1mz
         CsaDM7W3s+yecru0bIHuXTGCK1v9TYp4VsrI/jaHS+npM/mElN9kc/MIq4IS7BIgCZjb
         vb/g==
X-Gm-Message-State: AOJu0YyxT1CgEwjv9y9Lq3xuEKAU9QexT9gT2x01YlBIvtGhFVy5GiiV
	QHDgnXi8gZirLjg672Z0Ulgx0yaAUUx517BH28jASYUqXD5NGHUgDiDOr1YdnByWUncGBno4Rq3
	mbdbIFQ==
X-Gm-Gg: AR+sD11C1QBCq8ZYb5gLQhJZOxTAdSyib+MrCXGYbQ3k6P9HvfPUZKpYIrbYjZOADDN
	Djq1KkKYXupaRXiZZ0yLG0DBuUN4GadoBsf6nuWxaikUkdW/E86l3RDiQVaoLCwnvFw2J1BbbJU
	8QKUbko9dB4Tqdh8HmDBBpuxcpEDAnojWid++fCzPnXS2Q/hiSvgVew79IBMI3PlFUUXS9M+J4t
	/uSDAa61Qdt9nCcZsO2KauVjOmVL70C1tIY0CsBQhe6ibLFI6QB5aICeJPhtn9AyQJTaTVDk1gJ
	gP6VYQB2O32Nscd0ELNkrud2KDEP2DvdhSUgH81oMhKrCmYoOgbTgn0W+IH965EEaSOzF+CYsKD
	SpN5yVRcMH/WmckS2K2oG9bCGLnBPr01kJcGjA54RP3z4YzYnanVNiv7wevLq4li33X930REJGA
	u0UamGE3B/DOYnb5Ut2eQ92GrY7cK9OFE0KaD9LTHnFdrn6XnKKqVWZVIC8P6TuPtdIgk8RGHbG
	Wfn
X-Received: by 2002:a05:6000:1a86:b0:47f:97a4:f121 with SMTP id ffacd0b85a97d-47f9feb5316mr9148793f8f.30.1785148039425;
        Mon, 27 Jul 2026 03:27:19 -0700 (PDT)
Message-ID: <dd38f7cd-a823-4569-b5f1-7358ae6325fd@suse.com>
Date: Mon, 27 Jul 2026 12:27:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/4] x86/traps: reduce indentation in
 fixup_exception_return()
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
X-purgate-ID: tlsNG-d25034/1785148039-012C8A5B-52362AE6/0/0
X-purgate-type: clean
X-purgate-size: 7408

The earlier "x86/traps: use entry_ssp in fixup_exception_return()" left
unnecessary scopes and hence unnecessarily deep indentation. While that
was intentional (to improve readabilirty of the diff), rectify this now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1175,90 +1175,86 @@ static void fixup_exception_return(struc
                                    unsigned long fixup, unsigned long stub_ra)
 {
 #ifdef CONFIG_XEN_SHSTK
+    unsigned long ssp = rdssp();
+
+    if ( ssp != SSP_NO_SHSTK )
     {
-        unsigned long ssp = rdssp();
+        unsigned long *ptr = _p(regs->entry_ssp);
+        unsigned long primary_shstk =
+            (ssp & ~(STACK_SIZE - 1)) +
+            (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
+
+        BUG_ON((regs->entry_ssp ^ primary_shstk) >>
+               (PAGE_SHIFT + STACK_ORDER));
+
+        /*
+         * The shstk currently looks like this:
+         *
+         *   tok  [Supervisor token, == &tok | BUSY, only with FRED inactive]
+         *   ...  [Pointed to by SSP for most exceptions, empty in IST cases]
+         *   %cs  [== regs->cs]
+         *   %rip [== regs->rip]
+         *   SSP  [Pointed to by entry_ssp; Likely points to 3 slots
+         *         higher, above %cs]
+         *   ...  [call tree to this function, likely 2/3 slots]
+         *
+         * and we want to overwrite %rip with fixup.  There are two
+         * complications:
+         *   1) We cant depend on SSP values, because they won't differ by
+         *      3 slots if the exception is taken on an IST stack.
+         *   2) There are synthetic (unrealistic but not impossible)
+         *      scenarios where %rip can end up in the call tree to this
+         *      function, so we can't check against regs->rip alone.
+         *
+         * Check for both regs->rip and regs->cs matching.
+         */
+        BUG_ON(ptr[1] != regs->rip || ptr[2] != regs->cs);
+
+        wrss(fixup, &ptr[1]);
+
+        if ( !stub_ra )
+            goto shstk_done;
+
+        /*
+         * Stub recovery ought to happen only when the outer context
+         * was on the main shadow stack.  We need to also "pop" the
+         * stub's return address from the interrupted context's shadow
+         * stack.  That is,
+         * - if we're still on the main stack, we need to move the
+         *   entire stack (up to and including the exception frame)
+         *   up by one slot, incrementing the original SSP in the
+         *   exception frame,
+         * - if we're on an IST stack, we need to increment the
+         *   original SSP.
+         */
+        BUG_ON((ptr[0] ^ primary_shstk) >> PAGE_SHIFT);
 
-        if ( ssp != SSP_NO_SHSTK )
+        if ( (ssp ^ primary_shstk) >> PAGE_SHIFT )
         {
-            unsigned long *ptr = _p(regs->entry_ssp);
-            unsigned long primary_shstk =
-                (ssp & ~(STACK_SIZE - 1)) +
-                (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8;
-
-            BUG_ON((regs->entry_ssp ^ primary_shstk) >>
-                   (PAGE_SHIFT + STACK_ORDER));
-
             /*
-             * The shstk currently looks like this:
-             *
-             *   tok  [Supervisor token, == &tok | BUSY, only with FRED inactive]
-             *   ...  [Pointed to by SSP for most exceptions, empty in IST cases]
-             *   %cs  [== regs->cs]
-             *   %rip [== regs->rip]
-             *   SSP  [Pointed to by entry_ssp; Likely points to 3 slots
-             *         higher, above %cs]
-             *   ...  [call tree to this function, likely 2/3 slots]
-             *
-             * and we want to overwrite %rip with fixup.  There are two
-             * complications:
-             *   1) We cant depend on SSP values, because they won't differ by
-             *      3 slots if the exception is taken on an IST stack.
-             *   2) There are synthetic (unrealistic but not impossible)
-             *      scenarios where %rip can end up in the call tree to this
-             *      function, so we can't check against regs->rip alone.
-             *
-             * Check for both regs->rip and regs->cs matching.
+             * We're on an IST stack.  First make sure the two return
+             * addresses actually match.  Then increment the interrupted
+             * context's SSP.
              */
-            BUG_ON(ptr[1] != regs->rip || ptr[2] != regs->cs);
+            BUG_ON(stub_ra != *(unsigned long*)ptr[0]);
+            wrss(ptr[0] + 8, &ptr[0]);
+            goto shstk_done;
+        }
 
-            {
-                wrss(fixup, &ptr[1]);
+        /* Make sure the two return addresses actually match. */
+        BUG_ON(stub_ra != ptr[3]);
 
-                if ( !stub_ra )
-                    goto shstk_done;
+        /* Move exception frame, updating SSP there. */
+        wrss(ptr[2], &ptr[3]); /* %cs */
+        wrss(ptr[1], &ptr[2]); /* %rip */
+        wrss(ptr[0] + 8, &ptr[1]); /* SSP */
+
+        /* Move all newer entries. */
+        while ( ptr-- != _p(ssp) )
+            wrss(ptr[0], &ptr[1]);
 
-                /*
-                 * Stub recovery ought to happen only when the outer context
-                 * was on the main shadow stack.  We need to also "pop" the
-                 * stub's return address from the interrupted context's shadow
-                 * stack.  That is,
-                 * - if we're still on the main stack, we need to move the
-                 *   entire stack (up to and including the exception frame)
-                 *   up by one slot, incrementing the original SSP in the
-                 *   exception frame,
-                 * - if we're on an IST stack, we need to increment the
-                 *   original SSP.
-                 */
-                BUG_ON((ptr[0] ^ primary_shstk) >> PAGE_SHIFT);
-
-                if ( (ssp ^ primary_shstk) >> PAGE_SHIFT )
-                {
-                    /*
-                     * We're on an IST stack.  First make sure the two return
-                     * addresses actually match.  Then increment the interrupted
-                     * context's SSP.
-                     */
-                    BUG_ON(stub_ra != *(unsigned long*)ptr[0]);
-                    wrss(ptr[0] + 8, &ptr[0]);
-                    goto shstk_done;
-                }
-
-                /* Make sure the two return addresses actually match. */
-                BUG_ON(stub_ra != ptr[3]);
-
-                /* Move exception frame, updating SSP there. */
-                wrss(ptr[2], &ptr[3]); /* %cs */
-                wrss(ptr[1], &ptr[2]); /* %rip */
-                wrss(ptr[0] + 8, &ptr[1]); /* SSP */
-
-                /* Move all newer entries. */
-                while ( ptr-- != _p(ssp) )
-                    wrss(ptr[0], &ptr[1]);
-
-                /* Finally account for our own stack having shifted up. */
-                asm volatile ( "incsspd %0" :: "r" (2) );
-            }
-        }
+        /* Finally account for our own stack having shifted up. */
+        asm volatile ( "incsspd %0" :: "r" (2) );
     }
  shstk_done:
 #endif /* CONFIG_XEN_SHSTK */


