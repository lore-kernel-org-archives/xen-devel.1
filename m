Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBCB606A321
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FPGv6Z+w
Received: from list by lists.xenproject.org with outflank-mailman.1480044.1683979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP7D-0000xx-Hr; Mon, 09 Nov 2026 13:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480044.1683979; Mon, 09 Nov 2026 13:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP7D-0000xq-EQ; Mon, 09 Nov 2026 13:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1480044;
 Mon, 09 Nov 2026 13:08:50 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQP7C-0000xR-1I
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:08:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQP7B-003y5h-EM
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:08:49 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5d4-8faa-0a2a0a5109dd-0a2a4502d7fe-40
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:08:49 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5e1-6ca4-0a2a45020019-d155dd2cf077-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:08:49 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-491971ac844so820372f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:08:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b90ee249d3sm144512205e9.7.2026.11.09.05.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:08:48 -0800 (PST)
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
        d=suse.com; s=google; t=1794229729; x=1794834529; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kWNN+CSvpz5vv5zgWaxbE6Boj6ISxZgPbPxn4bWn+ns=;
        b=FPGv6Z+w/YU0ez+XvH0IYpRbcDVkfvWsuW2KWHh8kNkiNU/3pYwbM8Ah+ZXzc46vwX
         oj3g+Dd3is1paSufOp3QDIavH25lQ+Oe2tMIjqF306plaWzUoHxrhtReiIfhHlTJEFVN
         lDrGwiHFKXm1WGtigeq0eq6AbZoXS5TsPs/J+9MiIaAyDzOZ6u+4XfjbmnPxUXlxWkjE
         6B3oYUZIKgxQ803ixCl4mMCnzNdG9HG1b6SO+JCooAxGTgSlVGXyzdUaQXWuHlzlh3Ch
         sicIW5/9Dm9bPyINHEcmgUl0s3n+vHG4npUHFM9/pxdRwrDHoDVbIy7o2BxFTaCOrxZy
         zw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229729; x=1794834529;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kWNN+CSvpz5vv5zgWaxbE6Boj6ISxZgPbPxn4bWn+ns=;
        b=YUUs2VNLtSCWQFNMrRDfP4NUAIXO/hQUg10AFmbw0ENz9T95khCTa01d7f8nlGoKlj
         DWuoAIIt6AGSt/tBEzLkxI7mMuVO0NO1g/WP74qWIl+WpK0I5T5JcC8iWJb1aQ/4H/Kd
         9JBAxwqEXZMzjNdzTuZA3TRU5SJ0nPONA1s/bRjCbPgLqiXAz5/mCLwvgdGPFf6f9GVQ
         8KAEspOiZpiC/j/DhCljFpULeoYPm7kSCyH5QcBoINsMdrrX04Cklad0gMb645mAW05Z
         QTbXy1ay+UDwz3HO7I1vM4NVLHjnPJUtQLjPU8MwRsdcMWwqhBgm15b8dVVZbZBeWjVb
         i+uQ==
X-Gm-Message-State: APuU4Z+o1fF4H/zXGvsuKKrPDmavA1fWgjiR/bGwFZ3S9NGDjtTpaiNN
	RhQ05RhhroV+QWcVh7xizXaeyxRerzy1IE4FDL8j1VZrItj12gnnABIIMPnxzjlkzu43sa53jLU
	vskEAtA==
X-Gm-Gg: AYBFou2AKUk4dWZvgJ8tPJg7JJquFT6YAobRREe45p4EzrwQ0x70uH+a42fjc8IZtIH
	Bs6Ehy9ylzGYYpk9s9GXBxRgbU6XhzH94sUey+Qjx+aJvQg/+1rBa20JJ9a0K4oGdLqF4+cR4De
	D8ss2dyMfppoJ5UATzyWGXj8TREDUfMmWHrRYEVoTH7U5UCtC2BG5hS54jDHTfPy3dl4ewXDMoY
	UH6fMSF5LFZd5vaG/dJ9O0ettk1O60sCNw5kSDnYu3qjU+kriNVlkvxzKkWa6/MJCFLYPwyjRAz
	4PQFktbpA4FZqEpwtY1sL02CT6mtahZFEYJL7w4H2TzGN4bS1B/Aaa8QV6V3e63Hgbg9yr0FhD1
	n7qjQgs8AiOfOIjR5nNUAOYsviSgk10g/mmoRMITmrwW2iI34Rk6DNKIPrWCklITZmV0tuftBrw
	n1B8zMCFcD/vCHAenL17Ogb67+1E+B5bal6VCJfldBv+RvD39O474MnfEAxuMeo5czoKfXn9cjI
	3iVlsV9LEoedPkmnWunpyT7g+QSwzVpLrhT375ZrutvEG1ztBDQwMR+u2gdOw3AfTjNPiedyLkx
	LtLtN7f8SNuEKFMeCVnPezPsSEesx4H7Vzp0xfMnPtuCe+Jfb44MGW2xrHJCeLrKTwqIWt+JAKC
	xY8HbTrLbYf3uK+k3
X-Received: by 2002:a05:600c:1c02:b0:4a2:74f:46c1 with SMTP id 5b1f17b1804b1-4b9633cee71mr91387225e9.8.1794229728618;
        Mon, 09 Nov 2026 05:08:48 -0800 (PST)
Message-ID: <6df9553e-af02-4c82-80c8-5b34dd7e919e@suse.com>
Date: Mon, 9 Nov 2026 14:08:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 3/4] x86/traps: reduce indentation in
 fixup_exception_return()
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
X-purgate-ID: tlsNG-720697/1794229729-F32B12AC-3877A60C/10/78276251493
X-purgate-type: spam
X-purgate-size: 7461
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The earlier "x86/traps: use entry_ssp in fixup_exception_return()" left
unnecessary scopes and hence unnecessarily deep indentation. While that
was intentional (to improve readabilirty of the diff), rectify this now.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
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


