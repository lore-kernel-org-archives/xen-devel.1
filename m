Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761C6606A337
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DKRhCHqX
Received: from list by lists.xenproject.org with outflank-mailman.1480052.1683988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP7c-0001YT-Sr; Mon, 09 Nov 2026 13:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1480052.1683988; Mon, 09 Nov 2026 13:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQP7c-0001YM-QI; Mon, 09 Nov 2026 13:09:16 +0000
Received: by outflank-mailman (input) for mailman id 1480052;
 Mon, 09 Nov 2026 13:09:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQP7a-0001WD-Me
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 13:09:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQP7a-00E8fp-3I
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 14:09:14 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5f4-bab6-0a2a0a5309dd-0a2a4503c872-14
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:09:14 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1c5f6-fae8-0a2a45030019-d155802cd8e5-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 14:09:10 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so5993505e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 05:09:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm238392435e9.7.2026.11.09.05.09.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 05:09:09 -0800 (PST)
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
        d=suse.com; s=google; t=1794229750; x=1794834550; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y40rikzKdW41I0gcKC+jqL54qXX/dn+hAUR30HB1xyE=;
        b=DKRhCHqXXdSJKro64NcOClKf7cHrgS1RLh2F6LViifY9AWlJVi/02FLdF49OW0F+SV
         KjljLrgcs2ibtFJ8/zwO/UEFG/kOaEii0gJGldmviHd85Z/8p+Aqh63JQFLYgwBkOsxa
         OWJLzgbU0G8dB9YfhP+iQ+bqutbtaZThBMiiK/y6y12ogKA+c71r0LBaypoWTxp2AkdG
         Tkrk5sA3MnByRbEzLpNNpK/IcetRRlm0HIQeXuTDc8lbe2U4tgn3Z/uf4nb0fx6m4LpM
         6E13/E01ZoFqpM2qEpb6yRMYLnMFNFVJ/wffch1S/+CIohX1yEb2NItZMLeTCJl4qL2B
         yVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229750; x=1794834550;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y40rikzKdW41I0gcKC+jqL54qXX/dn+hAUR30HB1xyE=;
        b=anhNirGYwI64mWmOV02UrTzg2ZX7zJG6cQqCR0H/lzgXPg/nlZDPHYrgHWNAgNQN8t
         TScpFBjnlPmIhaLGDa1c1M2NGPPTOA7VI/SLeq72KbqWAa9CRhKRqWnp4UDBOvUGZ1SN
         K16gZ1D5Q60xFqrFm3cm5VKlOD2NmiBHl7A68f7rgMdTOPTgLMdeOmsgAu2GWaQy/ucV
         EcZYkLmoGH/0i2gB/0Hfj+r+ZFc+kGWp4akfLgFS9pHSyVzw8PNMX9TMe/Nc/WGwh0h9
         spWFRKTvtA36974ermMRwMZEvqMb3v5L252tSGjzVMobxCdt461hiP8oIEgwEGV4nY4f
         tcFg==
X-Gm-Message-State: APuU4Z8kQIiYKyolgnV/k32IuMlJss6rZphwFRO9r8vR6nFKkvZEcdsL
	pXapVgus8mDIRMwqpJ8Q2NZ9xTsxarn7GD0jB22a2Ngk15TM57jeEFARDFlXcl39ZZfJ5dOwjKv
	+5LuKCA==
X-Gm-Gg: AYBFou0k8KpcmdMmjzJj5KQuWQW39vfDGV1qZ2TQPdg4GA5V0cn+D5YP+v755JmvZLm
	QHXP2sDaC/bHHVLJ8PzOHc3Qn3/kWyB9voG6t+ojzXUkM74psUvhOe7c/v23gn9bPRBiaznZU/n
	xFHqytOsPfUgYeytD+JZzMBlXisbt7UdFJ+aUbUQcaBQiI4f5PiYiiU5w3BxQoUtdchHQ+WxRPF
	mRGbOZc0aI4MVHfrHCPya7+t71+JiCfiT09a61HJ0/meWl8XJTv1rmws9sZ9ERlT6sNee3ALv/5
	8rJcVB88X8VDIaWRxCCxS6jqUP+UK/s1xO3sdF4IM9X/czDR1Zo/3UG7RK77HJHn8HAmgPL3mhI
	wDXzmJH9mkPYdQatP0lW5WRJtJGcPtBvFf911C5oP9fa6jnWHletP/Va7RH9TDiDN+3l11lhBk3
	S/5qNfL7QrCmlw5nUb4qVhWxzF8lSeMd76pcMuYnYeSTPc1cPt5Jcx0vCu9YtjPBGtJxwNQTixO
	yOS3c4fA4q3nhjUEzjk62a6GUAH/yR72zc9dPMNQNnYJNBsaOZh1HYQcUACH0qjUX8F3oGiHOp+
	d8HNRIkns96/pynka02V0HSX+C2fCFIXSCFU5uTp7mmj5aTZHfskosl5ZtkABwv9woXg++WQPQZ
	DYrD0aGRtHMuAWr4=
X-Received: by 2002:a05:600c:3148:b0:4b7:dc0:89c with SMTP id 5b1f17b1804b1-4b963c88bd6mr79037015e9.32.1794229749743;
        Mon, 09 Nov 2026 05:09:09 -0800 (PST)
Message-ID: <bfec463b-a4dd-4a4a-bafb-c596f83630a1@suse.com>
Date: Mon, 9 Nov 2026 14:09:07 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 4/4] x86: prefer shadow stack for producing call traces
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
X-purgate-ID: tlsNG-33051d/1794229750-760FE4E9-3413C342/10/78276251493
X-purgate-type: spam
X-purgate-size: 4605
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


