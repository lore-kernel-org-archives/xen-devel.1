Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562AC55822
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 08:29:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382997.1626252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrX0X-0005W6-7f; Wed, 05 Aug 2026 08:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382997.1626252; Wed, 05 Aug 2026 08:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrX0X-0005Vz-4r; Wed, 05 Aug 2026 08:29:49 +0000
Received: by outflank-mailman (input) for mailman id 1382997;
 Wed, 05 Aug 2026 08:29:48 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wrX0W-0005Vt-6Y
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 08:29:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrX0V-0038D2-JZ
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 10:29:47 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f46f-2eae-0a2a0a5409dd-0a2a45099aea-42
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:29:47 +0200
Received: from [209.85.221.42] (helo=mail-wr1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a72f47b-be1a-0a2a45090019-d155dd2ab9ab-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 10:29:47 +0200
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47f84023916so585398f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:29:47 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47febfe5d7csm7306200f8f.15.2026.08.05.01.29.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2026 01:29:46 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785918587; x=1786523387; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cAYu0/I5sBdxVDFVz3zsOh9BrRmirAGTcNyUBffNHFs=;
        b=KNXpGbxyvXhdsAnZlOnygETV9HzqBRF48vBEK7vCGiCnZ0cg9s/O6qW+c2wDG8zDp3
         c7n/YNwFBa9Zz/NHaFNS8FEGNynMK6UFLV3Ln5O0C+Fw7maA7o0FZn9PBFY7NDGx1LC/
         JTuKqOyhPwbOVXnr/AS6TkcpZyZITOJ9J6/p3uMvNYF6rRQ5uQe8s7X2KBWcRWBaA0U6
         03AIIMi15Bzo286LJ7nlncx8W5TRvJ5sWb7bh77wku5pJJ72PV9lscjVP+BFG4B+3N//
         qjhD53RCgqv8uY0OKj6QCAVk+gqBr6cXR2Uo/A8CaSonIBDZEdg6lLtDEuoqkFynATlK
         0Kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918587; x=1786523387;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAYu0/I5sBdxVDFVz3zsOh9BrRmirAGTcNyUBffNHFs=;
        b=BXsgIfnTuczky4IfoA+ZB4nwWDiU8SqHiIAhqCXUeYPknKW6mV1L3iOWfMTciWYMga
         w02SejC9Qm2KHa2o6bAyNjXzV8aJHB0nO03QB00HwKcanejtEKnBqjq+zaHdXYJ+Z/6+
         OWGo+sFlMpPjNFmPB92lakIpaoBTLVhaJL3bKM1SMvTjnMPx7+vOecDSQl7V5eihE1NK
         Umc3z5bGvNjOTuIim/ZGtCeT1DrsKOQOI+lWNPyYCFs9JyjIhyh9teUONRkO0pZFyPd4
         BomHu2g3vWlFCYOJRYuXMMxjJpB9dnDRDHh9jCNS0/jLC5F/LgEc4E2LUf6J2+Ug21fD
         l0gw==
X-Gm-Message-State: AOJu0YwLrwYl7/VAw/if8LPUijlp5eV4zyJw9SJIMtjyiTwpZgwQyU5W
	jYZ/8+8Mllra8L+SCz+GlAOgms/MQ0GzblVlhIu8ocGYS5Km7sfSN9k6GlLyrOFjrsGI9FYNUTJ
	TWB59vA==
X-Gm-Gg: AR+sD10ZADqSR4fdXab7GzTcRJQ5yIKBoskNr+GMlz8ACKpLkhPatsPZyes1kI2pU/M
	AzpQrC26a4N0Qt+azs8q8202U8HUo5B/BBxUH99s64hRdY1ltv1cwElsdVHlW7yrQPGRMFck6Of
	QYOlUwQ+g4WU+9gSHyUfuDr5ajafi6z19F8Mi80rGkdBpiEui/fICksRIPo6LWFMf5vEXovDJKa
	333d75bJna2jXh9vfXK2yzsaRzYS8sTFq64GYYLcXDZTWU60N95oSIOHUtTd8E9r26M10W+Lqc/
	vGAuIrBI9IAsrblCJBFjAEVHNZGqP6xA1fyCwGyNWaM5mjsCAUDLYf0acrKZaCCULrwpPDjf7Bi
	PWB/O+RkJ9QwaY+UUhlLNQSAO83tr4WUg6qFZsDer9yX2hCKLuLl4/ROosSWebz54Dgxm/meAKN
	HC49eiXk1cz0XC0BULypKz8/Mz/kFBjNjQ+GFYylpn4MBgjYhkHKnN0j2cJwIg437VaSF3RtSFV
	3TzBHEMlGEwzo8Ecz/oT9fiq5PJxC8vTkJUbBvZyW+GWG+g3Pe2
X-Received: by 2002:adf:e005:0:10b0:47f:d0fb:ea40 with SMTP id ffacd0b85a97d-47fec532b81mr6611273f8f.21.1785918586889;
        Wed, 05 Aug 2026 01:29:46 -0700 (PDT)
Message-ID: <2a4d839d-44ce-40fb-af7b-5becd878c9fc@suse.com>
Date: Wed, 5 Aug 2026 10:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: reduce dependencies on x86_emulate/x86_emulate.h
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1785918587-FDA6E034-C3C315E6/0/0
X-purgate-type: clean
X-purgate-size: 13038

Split out struct x86_event to an entirely separate header, and move a few
other items describing the architecture to a new x86-types.h. With a few
forward decls of structures and with a fair number of new #include-s in
.c files, the inclusion of x86_emulate.h (and hence
x86_emulate/x86_emulate.h) can be dropped from all header files except
hvm/emulate.h; it needs additionally adding to hvm/ioreq.h though.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
The use in drivers/vpci/msix.c is certainly somewhat bogus, but as long as
X86EMUL_OKAY etc are used directly there, that's the way to go. Like done
for IOREQ, some abstraction will be needed here if this file was to be
re-used by non-x86.

--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -305,7 +305,7 @@ $(call cc-option-add,HOSTCFLAGS-x86_64,H
 HOSTCFLAGS += $(CFLAGS_xeninclude) -I. $(HOSTCFLAGS-$(XEN_COMPILE_ARCH))
 
 x86.h := $(addprefix $(XEN_ROOT)/tools/include/xen/asm/,\
-                     x86-vendors.h x86-defns.h msr-index.h) \
+                     x86-vendors.h x86-defns.h x86-types.h x86-event.h msr-index.h) \
          $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
                      cpu-policy.h cpuid-autogen.h)
 x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h x86_emulate/private.h $(x86.h)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -38,6 +38,8 @@
 
 #include <xen/asm/msr-index.h>
 #include <xen/asm/x86-defns.h>
+#include <xen/asm/x86-event.h>
+#include <xen/asm/x86-types.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen-tools/common-macros.h>
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -37,6 +37,7 @@
 #include <asm/hvm/save.h>
 #include <asm/hvm/vpt.h>
 #include <asm/time.h>
+#include <asm/x86_emulate.h>
 
 #define domain_vpit(x) (&(x)->arch.vpit)
 #define vcpu_vpit(x)   (domain_vpit((x)->domain))
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -11,6 +11,8 @@
 #include <asm/current.h>
 #include <asm/hpet.h>
 #include <asm/mc146818rtc.h>
+#include <asm/x86_emulate.h>
+
 #include <xen/sched.h>
 #include <xen/event.h>
 #include <xen/trace.h>
--- a/xen/arch/x86/hvm/mmio.c
+++ b/xen/arch/x86/hvm/mmio.c
@@ -9,6 +9,7 @@
 #include <xen/mm.h>
 
 #include <asm/p2m.h>
+#include <asm/x86_emulate.h>
 
 static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
 {
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -11,6 +11,8 @@
 #include <asm/hvm/io.h>
 #include <asm/hvm/save.h>
 #include <asm/acpi.h> /* for hvm_acpi_power_button prototype */
+#include <asm/x86_emulate.h>
+
 #include <public/hvm/params.h>
 
 /* Slightly more readable port I/O addresses for the registers we intercept */
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -23,12 +23,15 @@
  */
 
 #include <xen/sched.h>
-#include <asm/mc146818rtc.h>
-#include <asm/hvm/vpt.h>
+#include <xen/trace.h>
+
 #include <asm/hvm/io.h>
 #include <asm/hvm/save.h>
+#include <asm/hvm/vpt.h>
 #include <asm/iocap.h>
-#include <xen/trace.h>
+#include <asm/mc146818rtc.h>
+#include <asm/x86_emulate.h>
+
 #include <public/hvm/params.h>
 
 #define USEC_PER_SEC    1000000UL
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -34,6 +34,8 @@
 #include <xen/numa.h>
 #include <xen/paging.h>
 
+#include <asm/x86_emulate.h>
+
 #define VGA_MEM_BASE 0xa0000
 #define VGA_MEM_SIZE 0x20000
 
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -38,6 +38,7 @@
 #include <asm/current.h>
 #include <asm/event.h>
 #include <asm/io_apic.h>
+#include <asm/x86_emulate.h>
 
 /* HACK: Route IRQ0 only to VCPU0 to prevent time jumps. */
 #define IRQ0_SPECIAL_ROUTING 1
--- a/xen/arch/x86/hvm/viridian/private.h
+++ b/xen/arch/x86/hvm/viridian/private.h
@@ -5,6 +5,8 @@
 
 #include <asm/hvm/save.h>
 #include <asm/hvm/viridian.h>
+#include <asm/x86_emulate.h>
+
 #include <public/hvm/params.h>
 
 int viridian_synic_wrmsr(struct vcpu *v, uint32_t idx, uint64_t val);
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -18,6 +18,7 @@
 #include <asm/msr.h>
 #include <asm/mtrr.h>
 #include <asm/p2m.h>
+#include <asm/x86_emulate.h>
 
 static DEFINE_PER_CPU(u64 *, vvmcs_buf);
 
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -33,6 +33,7 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/io.h>
 #include <asm/hvm/save.h>
+#include <asm/x86_emulate.h>
 
 #define vpic_domain(v) (container_of((v), struct domain, \
                                      arch.hvm.vpic[!(v)->is_master]))
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -8,7 +8,8 @@
 #include <asm/e820.h>
 #include <asm/mce.h>
 #include <asm/vpmu.h>
-#include <asm/x86_emulate.h>
+#include <asm/x86-types.h>
+
 #include <public/vcpu.h>
 #include <public/hvm/hvm_info_table.h>
 
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -16,11 +16,13 @@
 #include <asm/current.h>
 #include <asm/hvm/asid.h>
 #include <asm/msr-index.h>
-#include <asm/x86_emulate.h>
+#include <asm/x86-event.h>
+#include <asm/x86-types.h>
 
 struct pirq; /* needed by pi_update_irte */
 struct hvm_hw_cpu;
 struct xen_domctl_createdomain;
+struct x86_event;
 
 #ifdef CONFIG_HVM_FEP
 /* Permit use of the Forced Emulation Prefix in HVM guests */
--- a/xen/arch/x86/include/asm/hvm/ioreq.h
+++ b/xen/arch/x86/include/asm/hvm/ioreq.h
@@ -8,6 +8,8 @@
 #ifndef __ASM_X86_HVM_IOREQ_H__
 #define __ASM_X86_HVM_IOREQ_H__
 
+#include <asm/x86_emulate.h>
+
 /* This correlation must not be altered */
 #define IOREQ_STATUS_HANDLED     X86EMUL_OKAY
 #define IOREQ_STATUS_UNHANDLED   X86EMUL_UNHANDLEABLE
--- a/xen/arch/x86/include/asm/hvm/vcpu.h
+++ b/xen/arch/x86/include/asm/hvm/vcpu.h
@@ -14,6 +14,8 @@
 #include <asm/hvm/vmx/vvmx.h>
 #include <asm/hvm/svm-types.h>
 #include <asm/mtrr.h>
+#include <asm/x86-event.h>
+
 #include <public/hvm/ioreq.h>
 
 struct hvm_vcpu_asid {
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -9,6 +9,8 @@
 
 #include <xen/mm.h>
 
+#include <asm/x86-types.h>
+
 extern void vmcs_dump_vcpu(struct vcpu *v);
 extern int vmx_vmcs_init(void);
 int cf_check vmx_cpu_up_prepare(unsigned int cpu);
--- a/xen/arch/x86/include/asm/mce.h
+++ b/xen/arch/x86/include/asm/mce.h
@@ -35,6 +35,7 @@ struct vmce {
 
 struct domain;
 struct vcpu;
+struct hvm_vmce_vcpu;
 
 /* Guest vMCE MSRs virtualization */
 extern void vmce_init_vcpu(struct vcpu *v);
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -8,7 +8,6 @@
 #include <asm/io.h>
 #include <asm/page.h>
 #include <asm/uaccess.h>
-#include <asm/x86_emulate.h>
 
 /*
  * Per-page-frame information.
--- /dev/null
+++ b/xen/arch/x86/include/asm/x86-event.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * x86-event.h
+ *
+ * Helper definitions for event handling, which aren't prescribed by the
+ * architecture itself.
+ */
+
+#ifndef X86_X86_EVENT_H
+#define X86_X86_EVENT_H
+
+#ifdef __XEN__
+# include <xen/types.h>
+#else
+# include <stdint.h>
+#endif
+
+#define X86_EVENT_NO_EC (-1)        /* No error code. */
+
+struct x86_event {
+    int16_t       vector;
+    uint8_t       type;         /* X86_ET_* */
+    uint8_t       insn_len;     /* Instruction length */
+    int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
+    union {
+        unsigned long cr2;         /* #PF */
+        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
+    };
+};
+
+#endif /* X86_X86_EVENT_H */
--- /dev/null
+++ b/xen/arch/x86/include/asm/x86-types.h
@@ -0,0 +1,76 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * x86-types.h
+ *
+ * Type definitions and basic helpers which are more or less directly
+ * describing aspects of the architecture.
+ */
+
+#ifndef X86_X86_TYPES_H
+#define X86_X86_TYPES_H
+
+#ifdef __XEN__
+# include <xen/types.h>
+#else
+# include <stdint.h>
+#endif
+
+/*
+ * Comprehensive enumeration of x86 segment registers.  Various bits of code
+ * rely on this order (general purpose before system, tr at the beginning of
+ * system).
+ */
+enum x86_segment {
+    /* General purpose.  Matches the SReg3 encoding in opcode/ModRM bytes. */
+    x86_seg_es,
+    x86_seg_cs,
+    x86_seg_ss,
+    x86_seg_ds,
+    x86_seg_fs,
+    x86_seg_gs,
+    /* System: Valid to use for implicit table references. */
+    x86_seg_tr,
+    x86_seg_ldtr,
+    x86_seg_gdtr,
+    x86_seg_idtr,
+    /* No Segment: For (system/normal) accesses which are already linear. */
+    x86_seg_sys,
+    x86_seg_none
+};
+
+static inline bool is_x86_user_segment(enum x86_segment seg)
+{
+    unsigned int idx = seg;
+
+    return idx <= x86_seg_gs;
+}
+static inline bool is_x86_system_segment(enum x86_segment seg)
+{
+    return seg >= x86_seg_tr && seg < x86_seg_none;
+}
+
+/*
+ * Full state of a segment register (visible and hidden portions).
+ * Chosen to match the format of an AMD SVM VMCB.
+ */
+struct segment_register {
+    uint16_t   sel;
+    union {
+        uint16_t attr;
+        struct {
+            uint16_t type:4;
+            uint16_t s:   1;
+            uint16_t dpl: 2;
+            uint16_t p:   1;
+            uint16_t avl: 1;
+            uint16_t l:   1;
+            uint16_t db:  1;
+            uint16_t g:   1;
+            uint16_t pad: 4;
+        };
+    };
+    uint32_t   limit;
+    uint64_t   base;
+};
+
+#endif	/* X86_X86_TYPES_H */
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -22,6 +22,7 @@
 #include <asm/p2m.h>
 #include <asm/pv/domain.h>
 #include <asm/setup.h>
+#include <asm/x86_emulate.h>
 #include <asm/xstate.h>
 
 #include <public/hvm/params.h>
--- a/xen/arch/x86/pv/misc-hypercalls.c
+++ b/xen/arch/x86/pv/misc-hypercalls.c
@@ -12,6 +12,7 @@
 #include <asm/debugreg.h>
 #include <asm/fsgsbase.h>
 #include <asm/traps.h>
+#include <asm/x86_emulate.h>
 
 long do_set_debugreg(int reg, unsigned long value)
 {
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -13,6 +13,11 @@
 
 #include <xen/lib/x86/cpu-policy.h>
 
+#ifdef __XEN__
+# include <asm/x86-event.h>
+# include <asm/x86-types.h>
+#endif
+
 #define MAX_INST_LEN 15
 
 #if defined(__i386__)
@@ -25,77 +30,6 @@
 
 struct x86_emulate_ctxt;
 
-/*
- * Comprehensive enumeration of x86 segment registers.  Various bits of code
- * rely on this order (general purpose before system, tr at the beginning of
- * system).
- */
-enum x86_segment {
-    /* General purpose.  Matches the SReg3 encoding in opcode/ModRM bytes. */
-    x86_seg_es,
-    x86_seg_cs,
-    x86_seg_ss,
-    x86_seg_ds,
-    x86_seg_fs,
-    x86_seg_gs,
-    /* System: Valid to use for implicit table references. */
-    x86_seg_tr,
-    x86_seg_ldtr,
-    x86_seg_gdtr,
-    x86_seg_idtr,
-    /* No Segment: For (system/normal) accesses which are already linear. */
-    x86_seg_sys,
-    x86_seg_none
-};
-
-static inline bool is_x86_user_segment(enum x86_segment seg)
-{
-    unsigned int idx = seg;
-
-    return idx <= x86_seg_gs;
-}
-static inline bool is_x86_system_segment(enum x86_segment seg)
-{
-    return seg >= x86_seg_tr && seg < x86_seg_none;
-}
-
-#define X86_EVENT_NO_EC (-1)        /* No error code. */
-
-struct x86_event {
-    int16_t       vector;
-    uint8_t       type;         /* X86_ET_* */
-    uint8_t       insn_len;     /* Instruction length */
-    int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    union {
-        unsigned long cr2;         /* #PF */
-        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
-    };
-};
-
-/*
- * Full state of a segment register (visible and hidden portions).
- * Chosen to match the format of an AMD SVM VMCB.
- */
-struct segment_register {
-    uint16_t   sel;
-    union {
-        uint16_t attr;
-        struct {
-            uint16_t type:4;
-            uint16_t s:   1;
-            uint16_t dpl: 2;
-            uint16_t p:   1;
-            uint16_t avl: 1;
-            uint16_t l:   1;
-            uint16_t db:  1;
-            uint16_t g:   1;
-            uint16_t pad: 4;
-        };
-    };
-    uint32_t   limit;
-    uint64_t   base;
-};
-
 struct x86_emul_fpu_aux {
     unsigned long ip, dp;
     uint16_t cs, ds;
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -25,6 +25,7 @@
 
 #include <asm/msi.h>
 #include <asm/p2m.h>
+#include <asm/x86_emulate.h>
 
 #define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
     ((addr) >= vmsix_table_addr(vpci, nr) &&                              \

