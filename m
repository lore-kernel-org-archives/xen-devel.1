Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A939C5B56A
	for <xen-devel@archiver.kernel.org>; Wed, 12 Aug 2026 13:25:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389061.1629994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu8wY-0005y2-QL; Wed, 12 Aug 2026 13:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389061.1629994; Wed, 12 Aug 2026 13:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wu8wY-0005xv-NR; Wed, 12 Aug 2026 13:24:30 +0000
Received: by outflank-mailman (input) for mailman id 1389061;
 Wed, 12 Aug 2026 13:24:28 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wu8wW-0005xp-HN
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 13:24:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wu8wV-00EMEv-Kj
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2026 15:24:27 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c7405-2eae-0a2a0a5409dd-0a2a45069e9e-28
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:24:27 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a7c740b-195a-0a2a45060019-d155dd35a45c-3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 15:24:27 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47fde295992so724798f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Aug 2026 06:24:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48150d4e260sm7471367f8f.17.2026.08.12.06.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Aug 2026 06:24:26 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1786541067; x=1787145867; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JVccR9w/bwY0Ic7GfkQ7xKl3W2XpWX3MtG1+JWOraBM=;
        b=Mw25E9GbCz0+gRf1rjtI9VXf7kg3LCE2zQDDAyG6IUDZ//xoCs6LVAqnWAqgozm+Dq
         8vXQz3DBKaR0ueWQ4NXt2+4x+4UBFsKhdc8zl/rEd/xARz2uwttaauuoBWZbeyg8UtoN
         4FAiM75uPkxkl45piNOre75nYgCTeV8DY/nAvVqCc7braYFniUSWWYHdzZzS3ix39R53
         CHS63r1QoL6+kTldS1e20EUYR6KVamHDCM4E5TpKnX0kjPoOBpjperaT/T893lJjcvL7
         6NY5wK5NvcQ9eMSlTAZYVXAxlxH8lpt435Q7/XSAl1XwsiriWAAvusSff/rtQWgUd68N
         GHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541067; x=1787145867;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVccR9w/bwY0Ic7GfkQ7xKl3W2XpWX3MtG1+JWOraBM=;
        b=MO8k5GjmwSiXT3dZ7eEngVc7RWy1lmwutCIuFu+J5fncCJQC1DLTwCDpY5RS1HtJxb
         1xEphFm5BNaASUW6nMj1phcDuxL7CRxMDXCJ4bIlijGn8A7DDz4bgXBiS/kJap4xRet9
         58/imz0CvY07Cwuwafic85GHxTin5B7IaEhsrPkV+NMN/1ZYZG+76fD8rbreDIBWnaCR
         Ur+y4jNBJPAM8HUkQFpvDigkZ4XLLXDQ2TN1gXWlkg2yeUyitjCupwue2ECyIM0tERhJ
         M413GKXmwK381Osj4Blo+1AoJSLzbN8GKQPD4i23i2L98MIzSXNfK5HTfkc2IKhMiK+l
         A+fg==
X-Gm-Message-State: AOJu0YyQUzNlQBN3yNMlair+MTQyEAVw74IyoSAiEn+ZFKpSFm11io38
	GHAEszFce5JEyeTFj7hEZIYhtJaYtj9i/f/5ZBGQ/ekNHglb+oTD2sEzY9RzlC/3+/QPApbwOaN
	tiKWIHA==
X-Gm-Gg: AR+sD11zYsfUwEX1hqYvas5cEpoLBKBpffSuHPhPuaUfROXWA3ftur3xGh6eKy2S/44
	cZnkzLTttPUxnJfnQawsldZA0S+FifVtAEQzYt/niUwW8ibvwnVfYrhUEAoZjV23YK+UYHRBJfQ
	e/7wJEIO3m/9nzmpSZPxiDU4/tNmz39B9lEe6QWy1ZwdQ4XKoAuzw69UcpzOaJ1opSKhxIIp00H
	dk6duHpMrVw3O/VCfUUzVEbKfltieESsbbn8P2wdUfUzDrzahFwvwkQPiUVN6VHFelSZr97DYfu
	DBgFOlQ7Uiw+AqQMKq/wjNCkESazVDLwRJ5OjKolEjuN+UAAQotguf/W80sgSbjQmITGlHVn99v
	qyLa8Re2bmgku8SS2X60Fp1r/fCi94+3zhg6bJ5wMYrCPyRSj46mI6BRnHCVtqWON/yuKkYa03x
	0dtZaKX1RYxViEDBjHUbufLaLejRHKLzRwycxSde3H3mJSxeBE0eRtLBH6pGzGzwibBimwjeeCs
	GiGstzZtJdlHyLyFYB1CgksgkAEu6O8hm8ngJUtGFcI/lFHgOs1
X-Received: by 2002:a5d:5f94:0:b0:475:da0e:744d with SMTP id ffacd0b85a97d-48153055113mr6689567f8f.8.1786541066820;
        Wed, 12 Aug 2026 06:24:26 -0700 (PDT)
Message-ID: <f6f7eded-b6a3-49b4-8c68-38d263c3b58e@suse.com>
Date: Wed, 12 Aug 2026 15:24:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86: reduce dependencies on x86_emulate/x86_emulate.h
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1786541067-FE87577B-B73DE2C6/0/0
X-purgate-type: clean
X-purgate-size: 13691

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
---
v2: Minor comment adjustment ahead of enum x86_segment. Also cover
    hvm/svm/vmcb.h.

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
 
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -11,6 +11,7 @@
 #include <asm/paging.h> /* paging_mode_hap */
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
+#include <asm/x86_emulate.h>
 
 #include "nestedhvm.h"
 #include "svm.h"
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -4,7 +4,7 @@
 
 #include <xen/types.h>
 
-#include <asm/x86_emulate.h>
+#include <asm/x86-types.h>
 
 struct vcpu;
 
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

