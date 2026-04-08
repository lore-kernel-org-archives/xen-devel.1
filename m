Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E021073CA6
	for <xen-devel@archiver.kernel.org>; Wed,  8 Apr 2026 12:23:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1275962.1561621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARwj-0005ZM-AX; Wed, 08 Apr 2026 12:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1275962.1561621; Wed, 08 Apr 2026 12:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wARwj-0005ZF-7q; Wed, 08 Apr 2026 12:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1275962;
 Wed, 08 Apr 2026 12:23:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wARwi-0005Z3-5n
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 12:23:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wARwf-005bLj-WE
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2026 14:23:47 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d648d1-e002-0a2a0a5209dd-0a2a4503c760-6
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:23:47 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d648d3-02b3-0a2a45030019-d155802ad825-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 14:23:47 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4887fd35e60so40745305e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Apr 2026 05:23:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488c5db3676sm25434955e9.5.2026.04.08.05.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Apr 2026 05:23:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775651027; x=1776255827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQhxBolergp3DNGfOBRBD3Fsmiz2HJwK7X3GkKtsJpg=;
        b=LOMqIU3HydqSxB4qL/KZS4M4kXRelxEGYWeWD9VPzGKCkOSjpueQOYvZ0nY/yT1Cfm
         29L2NEKYoBwpcZ3Sj4sGzIGzZTlP/wC04+91R6qWXpVLrUAk12w3OMXyQRHRNwQjG+Wa
         CkzTvYOCUiCZuVcvnR2hU7N/ut1uHKISIKCNwIRvH0o/4yR+3Itf64A5j0Cg6lBtsP8o
         MOSnlFRiwn2Pt9du2RaBZOdyptCNi3nLw6siig0/UTMNW83W4XStyVZmUQfaNC30wC/p
         tWL0ZuDKM47iaNAiIhuZgtl6hblHnICAxKd34AdHq/NSihpK9j3h7lSFs1KOAjm0P25+
         KhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775651027; x=1776255827;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQhxBolergp3DNGfOBRBD3Fsmiz2HJwK7X3GkKtsJpg=;
        b=YDQchz/TxSZnx4Nyt7QbbRnvEV9jc3PBaX18JzSfRqoDMN2br26Q9IDTi/gOSjqpJc
         y6jKSu0iiH9oswefZhdL9bIquLqFq2HDcbgn/g2WNKTZIeje1aOfYbYHCCTRywpmtTLI
         1fZM5Pz49rkA8dNHUUuwkVXqK3AX0WMmc/SDTxEtK1t7e7Tx+bqKIJiPl4mtBI2h0ZWD
         BUmYToX+6I07xJMtVmYqww4QxQ5geo6uxgrVVh1nCUHYwPjJArlByV9ZVphaZmXEmM/F
         sZWfLKi2Jt0KzESY4EpEz7LH+6bcPQtyZ3u1kd609TmKnnJBXOU44vFTBAV9ZE9A/wdf
         X1lw==
X-Gm-Message-State: AOJu0YzfWSk0IW9gyx3qUb0LfQVl57JZSDiE910jhU/HxIjZtGOuMo96
	oz1l/uEi37g/FeGaxwu+iR9HJMngGd5D5vHLPCUVhuNGPrtPXc6tRujebU1Bdks+BakxHCAvqYm
	BQRVWbg==
X-Gm-Gg: AeBDiesOH3gKIZcFyQ9QPs4RZOt/MKKheJMv/k/ZeRMDP4q3/rh7malz6pmzu3fo+Mk
	E+wMFWVEwuPY0QJRtAq8z0kpT6B712rAJugNPxSmZ73JxtXB4pD1KVClbT1zRB9/XHOSLALREEc
	5LA1QURS1t7T4+wSysYa0E6j+oS9LcytSi2SxZmlIIqXokt/rBLjTdcrROG9bJC2MVYt/gBzvJi
	/dzjsIHu5M0epKyvby/LRvJ/ZE0nR6hQw455ldedi1/MQFFbDFTeWIMfjUdZlR+Fh6YL8wDqltz
	jVrJVvGpxExi/tpEJlMtU76rw5b9238g9Ye20YUo/SQ+F03Ejn9O+7aPWx//kIldsgxJQkF562n
	HWexbsdhISooa5N4TM0Vl+OMHtxkSkmv9jtyG8xA+3UxXHeVxvdSJllWrpBtZs0xyZvXxl/2p5d
	P/7/klBXdyZ8GRObYEE+J53Lagmhab4RrYYj45D4Oxkal6ikQLz2Hv/qcs/a6Az/PfFFlliNLjS
	Sm+wnTfWWhNOmo=
X-Received: by 2002:a05:600c:a409:b0:488:c085:22ad with SMTP id 5b1f17b1804b1-488c08523afmr71259885e9.29.1775651026784;
        Wed, 08 Apr 2026 05:23:46 -0700 (PDT)
Message-ID: <4bcc73db-38da-446e-b277-cf94c49002a1@suse.com>
Date: Wed, 8 Apr 2026 14:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] x86: prefer shadow stack for producing call traces
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
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
In-Reply-To: <f064c3af-c22a-40e0-a268-ee37e34297a3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1775651027-43301C9A-490F1BA4/0/0
X-purgate-type: clean
X-purgate-size: 3337

Shadow stacks contain little more than return addresses, and they in
particular allow precise call traces also without FRAME_POINTER.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the 'E' for exception frames is probably okay, I'm not overly
happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
but we use that character already.

As an alternative to suppressing output for the top level exception
frame, adding the new code ahead of the 'R' output line (and then also
ahead of the stack top read) could be considered.

Perhaps having a printk() for the PV entry case is meaningless, for
- no frame being pushed when entered from CPL=3 (64-bit PV),
- no entry possible from CPL<3 (32-bit PV disabled when CET is active)?
In which case the comment probably should just be "Bogus." and the code
merely be "break;".

Quite likely a number of other uses of is_active_kernel_text() also want
amending with in_stub().
---
v2: IS_ENABLED() -> #ifdef. Re-base.

--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -48,6 +48,7 @@
 #include <asm/shared.h>
 #include <asm/shstk.h>
 #include <asm/smp.h>
+#include <asm/stubs.h>
 #include <asm/system.h>
 #include <asm/traps.h>
 #include <asm/uaccess.h>
@@ -705,6 +706,13 @@ unsigned long get_stack_dump_bottom(unsi
     }
 }
 
+#ifdef CONFIG_XEN_SHSTK
+static bool in_stub(unsigned long addr)
+{
+    return !((this_cpu(stubs.addr) ^ addr) >> STUB_BUF_SHIFT);
+}
+#endif
+
 #if !defined(CONFIG_FRAME_POINTER)
 
 /*
@@ -797,6 +805,52 @@ static void show_trace(const struct cpu_
          !is_active_kernel_text(tos) )
         printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
 
+#ifdef CONFIG_XEN_SHSTK
+    if ( rdssp() != SSP_NO_SHSTK )
+    {
+        const unsigned long *ptr = _p(regs->entry_ssp);
+        unsigned int n;
+
+        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
+        {
+            unsigned long val = *ptr;
+
+            if ( is_active_kernel_text(val) || in_stub(val) )
+            {
+                /* Normal return address entry.  */
+                printk("   [<%p>] C %pS\n", _p(val), _p(val));
+                ++ptr;
+            }
+            else if ( !((val ^ *ptr) >> (PAGE_SHIFT + STACK_ORDER)) )
+            {
+                if ( val & (sizeof(val) - 1) )
+                {
+                    /* Most likely a supervisor token. */
+                    break;
+                }
+
+                /*
+                 * Ought to be a hypervisor interruption frame.  But don't
+                 * (re)log the current frame's %rip.
+                 */
+                if ( n || ptr[1] != regs->rip )
+                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
+                ptr = _p(val);
+            }
+            else
+            {
+                /* Ought to be a PV guest hypercall/interruption frame.  */
+                printk("   %04lx:[<%p>] E\n", ptr[2], _p(ptr[1]));
+                ptr = 0;
+            }
+        }
+
+        /* Fall back to legacy stack trace if nothing was logged at all. */
+        if ( n )
+            return;
+    }
+#endif /* CONFIG_XEN_SHSTK */
+
     if ( fault )
     {
         printk("   [Fault on access]\n");


