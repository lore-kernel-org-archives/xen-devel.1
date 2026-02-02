Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5483EE73151
	for <xen-devel@archiver.kernel.org>; Mon,  2 Feb 2026 09:57:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1218461.1527204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgT-0001Z4-RW; Mon, 02 Feb 2026 09:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218461.1527204; Mon, 02 Feb 2026 09:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgT-0001YC-Od; Mon, 02 Feb 2026 09:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1218461;
 Mon, 02 Feb 2026 09:52:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGL7=AG=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vmqbB-0001Il-Vv
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:52:01 +0000
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [2001:cf8:ace:41::4]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d121b1ab-001c-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 10:51:59 +0100 (CET)
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:51:38 +0900
Received: from unknown (HELO [127.0.1.1])
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob1.noc.sony.co.jp with ESMTP; 02 Feb 2026 18:51:38 +0900
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
X-Inumbo-ID: d121b1ab-001c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770025920; x=1801561920;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4/LXZGnNgY5t+nsrdXbfktyTBcde00tw0WwNVU5EQeQ=;
  b=nI6A7Ytwa1+zLh8IWECSnhLfuTcw4lqBn+HE9NyTzMST2ejWcv/0885i
   bTphFfjN08hVCUeoZAOE0EzeJREtl4uhiNSonsGqcqWEDvSz3lSXyl9il
   kCroDYD+AJfjEwynf9Os7NyNE4mOmUWHbpB8KhpFljpEoQbSqMerrIh04
   AaQqpxAFGmxeBvSlpT0xL/QFwy8O0wGOZm9RTvk3W33wtQp+XJTOobQCv
   ez1PLsvIjuQ9BBALQdp0icSXXp7Vu6xil43egXNmHWYY/7WgCtdDnY9fZ
   l9V+C4CXNxlWqVzJ8EDWE4beYS17MnLNWhTjezCZmv9yyV7GDK60pIxfR
   g==;
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="607384935"
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 02 Feb 2026 18:51:02 +0900
Subject: [PATCH 1/3] x86/x2apic: disable x2apic on resume if the kernel
 expects so
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-x2apic-fix-v1-1-71c8f488a88b@sony.com>
References: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
In-Reply-To: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Suresh Siddha <suresh.b.siddha@intel.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
 Ajay Kaher <ajay.kaher@broadcom.com>, 
 Alexey Makhalov <alexey.makhalov@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Jan Kiszka <jan.kiszka@siemens.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-kernel@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev, 
 jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=paULGXp6rwtbR4pGaBXqE9RYtLD7iRkEUs2lKCF5e4o=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsyG4hUGCzw4VzFOfPGnVC7+kcNGzhiLW3NYOT9WyZ0Rv
 y9psSK2o5SFQYyLQVZMkaVUqfrX3hVBS3rOvFaEmcPKBDKEgYtTACaytoXhv9Nrfese5QfJMkqT
 Qxp2Whn+q/TjDzf7xqHB/8O9W3/eVob/iW1Xy2aecbmXM6u73+ju1V8pak2+7/wsF/ZYNW4wOtz
 NCwA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

In lapic_resume, ensure x2apic is actually disabled when the kernel expects it
to be disabled, i.e. when x2apic_mode = 0.

x2apic_mode is set to 0 and x2apic is disabled on boot if the kernel doesn't
support irq remapping or for other reasons. On resume from s2ram
(/sys/power/mem_sleep = deep), firmware can re-enable x2apic, but the kernel
continues using the xapic interface because it didn't check to see if someone
enabled x2apic behind its back, which causes hangs. This situation happens on
defconfig + bare metal + s2ram, on which this fix has been tested.

Fixes: 6e1cb38a2aef ("x64, x2apic/intr-remap: add x2apic support, including enabling interrupt-remapping")
Cc: stable@vger.kernel.org
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
 arch/x86/kernel/apic/apic.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index d93f87f29d03..cc64d61f82cf 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2456,6 +2456,12 @@ static void lapic_resume(void *data)
 	if (x2apic_mode) {
 		__x2apic_enable();
 	} else {
+		/*
+		 * x2apic may have been re-enabled by the
+		 * firmware on resuming from s2ram
+		 */
+		__x2apic_disable();
+
 		/*
 		 * Make sure the APICBASE points to the right address
 		 *

-- 
2.43.0


