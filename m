Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77436C5AC82
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2026 23:37:07 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1385304.1627800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dt-0002NH-KU; Thu, 06 Aug 2026 23:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1385304.1627800; Thu, 06 Aug 2026 23:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ws7dt-0002N7-GK; Thu, 06 Aug 2026 23:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1385304;
 Thu, 06 Aug 2026 23:36:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3kRp1agYKCfQoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 1ws7ds-0002Ay-Bw
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2026 23:36:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1ws7dr-005BVk-OV
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2026 01:36:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3kRp1agYKCfQoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 6a751a63-5cb7-0a2a0a5109dd-0a2a45099b3a-22
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:51 +0200
Received: from [209.85.216.71] (helo=mail-pj1-f71.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3kRp1agYKCfQoaWjfYckkcha.Ykitaj-Zarahheopo.tajlnkfaYp.knc@flex--seanjc.bounces.google.com>)
 id 6a751a92-be1a-0a2a45090019-d155d847f0b3-3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Aug 2026 01:36:51 +0200
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38e11baa66eso2407878a91.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Aug 2026 16:36:51 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786059410; x=1786664210; darn=lists.xenproject.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eYIjdKzjgH3nVD0iNsx5sVBVp8XFdFFsnkR62+s/p+Q=;
        b=E5LLqXiTKfzr8w4IqDOo0QY+iuqgo807Di4c0I7wK/4WJ1kEtAr1iBNZ5Co/adFgd7
         g9urHpdWNoBF625p4u+bzb+hRk+OsRZQj/yhe8zZBiPKaahmUMqCCDjaeCKmjMmz6ye9
         dmp2/sMqpu4rCeGpyX4nHdggjfTtmecinVOb9X30S3uUgLgVqD6L7eh9E2iSllqOm8bN
         Sf7tOm0pAb7a2Q6O0zvos0/+MTdvhdcN0ODVxx4Wmx7w4JQUKb2kULU2pH3ugQ1IHSlg
         ICwAJW3Uv1iyLFl81CYS6S03Vhfmll9oYOhowG6BqV0g87YU8XYGxkl417TzFIQvUwE9
         XN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786059410; x=1786664210;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eYIjdKzjgH3nVD0iNsx5sVBVp8XFdFFsnkR62+s/p+Q=;
        b=aojaK7+BgMLo+SOsVlGT+yu67L3XJcLffNpnPSTr/pq407ZEGFlr8OcvWqVJR/u7gk
         TcH4sHntzj2BasUFEUGh0RQYHyvKWhbj+GyraKQ82vJSeYQQ8iGAFR9JQx09jSwU/+if
         JrKJtbAiaK+WPapRrMzjG+YjdpDTlcTVjAVBU4V97KxLVF78fkTUeb46nd2iDdn0r6W8
         uDWm+agfUHrhoWv43Walgd3hXpbOUPoFizIWW/k9c4aDuRh4lyFbcNHP5tdvVPYBU14i
         GnkyZ4tGAJ1gZYVs6JlE6PjEIQUK1kbdBfcXeKc+GtWMQ/MREtccVZBINX9LPOX/6e02
         SHcg==
X-Forwarded-Encrypted: i=1; AHgh+RqQUZ8OwWDYlSNYhqZGCYaWsTyA9pOE3f+blw6hStF5CEFjKPFwnBxCsB4KHiIUGEWPCjST6DM99lk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpTHW9Vso1wNanHWQpCnJQ1IF6wDKoXCGdmmoFjwtK8hy9zZdN
	ugB21nk58bD7586574X8ENdSBaZRz7f0LI6rpAlMVoFOMW0/SmGR/lrpmWdNvqqnUcYgaU/Kad2
	1bCA+YQ==
X-Received: from pjji3.prod.google.com ([2002:a17:90a:6503:b0:381:224:393a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c106:b0:38e:250b:122f
 with SMTP id 98e67ed59e1d1-3909d8d5993mr5453558a91.16.1786059409368; Thu, 06
 Aug 2026 16:36:49 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  6 Aug 2026 16:35:37 -0700
In-Reply-To: <20260806233609.212337-1-seanjc@google.com>
Mime-Version: 1.0
References: <20260806233609.212337-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.679.g6767b8d81c-goog
Message-ID: <20260806233609.212337-21-seanjc@google.com>
Subject: [PATCH v6 20/51] KVM: x86: Officially define CPUID 0x40000010 as PV
 Timing Info (TSC and Bus)
From: Sean Christopherson <seanjc@google.com>
To: Kiryl Shutsemau <kas@kernel.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.makhalov@broadcom.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	John Stultz <jstultz@google.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, x86@kernel.org, linux-coco@lists.linux.dev, 
	kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Michael Kelley <mhklinux@outlook.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Nikunj A Dadhania <nikunj@amd.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1786059411-BDAC0034-07F8BD3C/0/0
X-purgate-type: clean
X-purgate-size: 3769

From: David Woodhouse <dwmw@amazon.co.uk>

Formally define and document CPUID 0x40000010 as providing TSC and local
APIC bus frequency information for KVM's PV CPUID range.  Way back in
2008, VMware proposed (https://lkml.org/lkml/2008/10/1/246) carving out a
range of CPUID leaves for use by hypervisors.  While the broader proposal
from VMware was mostly shot down in flames, use of CPUID 0x40000010 to
provide TSC and local APIC bus frequency information survived and made it's
way into multiple guest operating systems.

XNU unconditionally assumes CPUID 0x40000010 contains the frequency
information, if it's present on any hypervisor:

  https://github.com/apple/darwin-xnu/blob/main/osfmk/i386/cpuid.c

As does FreeBSD:

  https://github.com/freebsd/freebsd-src/commit/4a432614f68

More importantly, QEMU (the de facto "reference" VMM for KVM) has
conditionally provided timing information in CPUID 0x40000010 for almost
9 years, since commit 9954a1582e ("x86-KVM: Supply TSC and APIC clock
rates to guest like VMWare").

So at this point it would be daft for KVM (or any hypervisor) to expose
0x40000010 for any *other* content.  Officially carve out and define the
CPUID leaf so that Linux-as-a-guest can follow suit and pull TSC and Local
APIC Bus frequency information from CPUID.

Defer providing userspace with the necessary information needed to
precisely and accurately enumerate the _actual_ configured TSC frequency
to the guest (that exact information, along with the scaled ratio, isn't
exposed to userspace).  As evidenced by QEMU, providing CPUID 0x40000010
without help from KVM is entirely possible, just not ideal.

Link: https://lore.kernel.org/all/ea0d7f43d910cee9600b254e303f468722fa355b.camel@infradead.org
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
[sean: drop KVM filling of CPUID, add documentation, massage changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/virt/kvm/x86/cpuid.rst | 12 ++++++++++++
 arch/x86/include/uapi/asm/kvm_para.h | 11 +++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/virt/kvm/x86/cpuid.rst b/Documentation/virt/kvm/x86/cpuid.rst
index bda3e3e737d7..a5ee8ff052ce 100644
--- a/Documentation/virt/kvm/x86/cpuid.rst
+++ b/Documentation/virt/kvm/x86/cpuid.rst
@@ -122,3 +122,15 @@ KVM_HINTS_REALTIME 0            guest checks this feature bit to
                                 preempted for an unlimited time
                                 allowing optimizations
 ================== ============ =================================
+
+function: KVM_CPUID_TIMING_INFO (0x40000010)
+
+returns::
+
+   eax = (Virtual) TSC frequency in kHz
+   ebx = (Virtual) Bus (local APIC timer) frequency in kHz
+   ecx = 0 (Reserved)
+   edx = 0 (Reserved)
+
+Note, KVM only defines the semantics of KVM_CPUID_TIMING_INFO; KVM does NOT
+advertise support via KVM_GET_SUPPORTED_CPUID.
diff --git a/arch/x86/include/uapi/asm/kvm_para.h b/arch/x86/include/uapi/asm/kvm_para.h
index a1efa7907a0b..c3a384711f3a 100644
--- a/arch/x86/include/uapi/asm/kvm_para.h
+++ b/arch/x86/include/uapi/asm/kvm_para.h
@@ -44,6 +44,17 @@
  */
 #define KVM_FEATURE_CLOCKSOURCE_STABLE_BIT	24
 
+/*
+ * The timing information leaf provides TSC and local APIC timer frequency
+ * information to the guest.  Note, userspace is responsible for filling the
+ * leaf with the correct information.
+ *
+ *  # EAX: (Virtual) TSC frequency in kHz.
+ *  # EBX: (Virtual) Bus (local APIC timer) frequency in kHz.
+ *  # ECX, EDX: Reserved (must be zero).
+ */
+#define KVM_CPUID_TIMING_INFO	0x40000010
+
 #define MSR_KVM_WALL_CLOCK  0x11
 #define MSR_KVM_SYSTEM_TIME 0x12
 
-- 
2.55.0.679.g6767b8d81c-goog


