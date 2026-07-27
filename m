Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A477DC531D0
	for <xen-devel@archiver.kernel.org>; Mon, 27 Jul 2026 10:27:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1371562.1619063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIYf-0002RN-G8; Mon, 27 Jul 2026 10:27:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1371562.1619063; Mon, 27 Jul 2026 10:27:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1woIYf-0002Qf-Cm; Mon, 27 Jul 2026 10:27:41 +0000
Received: by outflank-mailman (input) for mailman id 1371562;
 Mon, 27 Jul 2026 10:27:40 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1woIYe-0002PL-B5
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 10:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1woIYd-003N6b-O9
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2026 12:27:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a673293-bab6-0a2a0a5309dd-0a2a45059aa8-36
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:27:39 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a67329b-4cb1-0a2a45050019-d1558033e18a-3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 12:27:39 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-49554ebb87dso23340315e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2026 03:27:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b49a6e17sm204668195e9.13.2026.07.27.03.27.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jul 2026 03:27:38 -0700 (PDT)
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
        d=suse.com; s=google; t=1785148059; x=1785752859; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y40rikzKdW41I0gcKC+jqL54qXX/dn+hAUR30HB1xyE=;
        b=eN1HgbjSNoKcDbMR551t7P/VdBvPAI7V6So8cCmSHKbRbC3XKdwbAU239kcKwTEHMR
         IAjKMfWNRvC5U4B0NIaOPxLj/nCfqyvWI9q4qpTA9VLE3HkxWJtE02yQQSnt+SkO7zsk
         k9+URCIfURbTCF5qh6YWYApUIE9TbcSi/MJ54flyokOSmy9xxxGvzHKAzMC1lf4mZxXB
         2hI0Hq1uHYO4tByD6livb6yYTmBpUlpiXyOGh1U/YxuY4cbuE2aheNDY9Y/RD3XtF4sx
         CbuZR58/q7MGGvuZpFYz1UsBTqG7fFXU98gvIEmxmYso9S1z5kopUMHg4THCHa4C8SOm
         0Ckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148059; x=1785752859;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y40rikzKdW41I0gcKC+jqL54qXX/dn+hAUR30HB1xyE=;
        b=W3SGXKiFqyzCdyQvYZqACNyMI3zv8/wLqgtogactHW6IO7DaPGXHU+1qs95anKBpvk
         L9ZfWzvcaMkKiRI9Lsong81D2kwbhphd7DpyqyYvYCVvsjNfzBr9ZMCNP1Ci181U/Q7V
         JUNv9OKhbd9aAg1WbxnSZRO7W/RPZ+Huos+msi6G7JZl9ydeye2uMT3x1IKwXAHeLADx
         VDBk7BM33Qr6zha2vDUWAku9oeF2fx36QdbWaei5uq67LMkMKzYozwYfG9KXdJSbNgLq
         zbUz53A28BWhbKvKr5qTTp21GnQaxcPgg/eeG+tLmV6Wp42404xnGzyzlT6yq8PviDG8
         Ca8g==
X-Gm-Message-State: AOJu0YyrN1RTlc45W18AEnaLWlM0bXA/SDq2+oi32WTp47LFNuMvEtzA
	v2ZLh0xhw0otFFydYHWtrvtNh43uCSyyhEMaAn0wpwNvV7Usah2RMeLCmFaWrYpUeFrdqkrL169
	7ybW3fg==
X-Gm-Gg: AR+sD11NaT/kSG4+eoj648xaaSYTmcvWrmZTBhYRUUfNqOhluLuam567zwkQjizJ43S
	TRcxiTmwEvih5C6DmpgBue4/QUF2uKMu6jUzHTqPLHPlVuho1FbYp90UAOU9N/9FqxWQfQI71kl
	wVUozRLQYgK3+lzH2HWd38J4oYlz2WNX6Ig8VDLNd4tKOSOx7kd7vWv95W62Kl4mJvvdTDgrE/i
	3jJsFXiW0i2Hhm/nJCLpyslLCT1xEGmafSvklCzESUT1jlLBy9u44ymGEn0dLLrq/+xZN9uPz9Z
	KZmSTBJaNVEJMbGENh1CIjHn4fQmLgSFysJF4dP62aHcyiUY+6UjMzGC8gSWTCgT3dvv5FxhGk2
	MxuHE6kLrrzPwvwGygayyzzNhGZq4NDcMdH5rgWOaAkxHpFqRzg7TPeDfHUPmnmB7mNXf9bfa6s
	pofw9XgL8VkACCiThRBuk7kukOgxFfyJ0jXhJRFcQ6WqPqpBbNFtpJcJ/OWdsSedzfMA==
X-Received: by 2002:a05:600c:1986:b0:496:c249:ddb7 with SMTP id 5b1f17b1804b1-496c249dfaemr12725075e9.6.1785148059174;
        Mon, 27 Jul 2026 03:27:39 -0700 (PDT)
Message-ID: <b0753d91-5519-4ca8-8251-99e08392ea07@suse.com>
Date: Mon, 27 Jul 2026 12:27:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 4/4] x86: prefer shadow stack for producing call traces
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
X-purgate-ID: tlsNG-c201ff/1785148059-F7CB82A1-D626C62C/0/0
X-purgate-type: clean
X-purgate-size: 4605

Shadow stacks contain little more than return addresses, and they in
particular allow precise call traces also with FRAME_POINTER=n:

(XEN) Xen call trace:
(XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
(XEN)    [<ffff82d04032d802>] C search_exception_table+0xc2/0x177
(XEN)    [<ffff82d040358378>] C traps.c#extable_fixup.isra.0+0x18/0x6c
(XEN)    [<ffff82d040358e3b>] C do_invalid_op+0xab/0x106
(XEN)    [<ffff82d040201d98>] C x86_64/entry.S#handle_exception_saved+0x88/0xf4
(XEN)    [<ffff82d07fffe044>] E ffff82d07fffe044
(XEN)    [<ffff82d040412db0>] C stub_selftest+0xd0/0x168
(XEN)    [<ffff82d0403508d6>] C setup.c#init_done+0x116/0x15a

as opposed to this counterpart (earlier during the same boot, before CET
is enabled):

(XEN) Xen call trace:
(XEN)    [<ffff82d04032d730>] R extable.c#search_one_extable+0x70/0x73
(XEN)    [<ffff82d04032d802>] S search_exception_table+0xc2/0x177
(XEN)    [<ffff82d040358378>] S traps.c#extable_fixup.isra.0+0x18/0x6c
(XEN)    [<ffff82d040358e3b>] S do_invalid_op+0xab/0x106
(XEN)    [<ffff82d040201d98>] S x86_64/entry.S#handle_exception_saved+0x88/0xf4
(XEN)    [<ffff82d040412db0>] S stub_selftest+0xd0/0x168
(XEN)    [<ffff82d0403d0cc9>] S do_initcalls+0x29/0x38
(XEN)    [<ffff82d04041adf2>] S __start_xen+0x1c72/0x2235
(XEN)    [<ffff82d040288a57>] S __high_start+0xb7/0xc0

(note the entirely missing entry for the stub itself [1]; sadly there are
no stray entries there).

[1] Arguably we could teach FRAME_POINTER=n traces to recognize stubs as
    well. But not FRAME_POINTER=y ones. In fact, what's missing there
    isn't the stub itself, but (of course) its immediate caller.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While the 'E' for exception frames is probably okay, I'm not overly
happy with the 'C' (for CET). I would have preferred 'S' (for shadow),
but we use that character already.

As an alternative to suppressing output for the top level exception
frame, adding the new code ahead of the 'R' output line (and then also
ahead of the stack top read) could be considered.

Quite likely a number of other uses of is_active_kernel_text() also want
amending with in_stub().
---
v3: Correct "link to other shadow stack" check. Don't log a line for the
    (impossible) PV case. Add example stack trace to description.
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
@@ -797,6 +805,49 @@ static void show_trace(const struct cpu_
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
+            else if ( !((val ^ (unsigned long)ptr) >>
+                        (PAGE_SHIFT + STACK_ORDER)) )
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
+            else /* Bogus. */
+                break;
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


