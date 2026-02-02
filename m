Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A78E7314A
	for <xen-devel@archiver.kernel.org>; Mon,  2 Feb 2026 09:57:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1218459.1527199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgT-0001W5-Ld; Mon, 02 Feb 2026 09:57:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1218459.1527199; Mon, 02 Feb 2026 09:57:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vmqgT-0001Vy-IT; Mon, 02 Feb 2026 09:57:29 +0000
Received: by outflank-mailman (input) for mailman id 1218459;
 Mon, 02 Feb 2026 09:51:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IGL7=AG=sony.com=shashank.mahadasyam@srs-se1.protection.inumbo.net>)
 id 1vmqb9-0001Il-KV
 for xen-devel@lists.xenproject.org; Mon, 02 Feb 2026 09:51:59 +0000
Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp
 [2001:cf8:ace:41::4]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c633f1e7-001c-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Feb 2026 10:51:45 +0100 (CET)
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::6])
 by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:51:37 +0900
Received: from unknown (HELO [127.0.1.1])
 ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
 by jpmta-ob1.noc.sony.co.jp with ESMTP; 02 Feb 2026 18:51:37 +0900
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
X-Inumbo-ID: c633f1e7-001c-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1770025905; x=1801561905;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=9aqqCS44lWCHB49Zm7J55r5rkQXnOnuoUWB3fHL0bvM=;
  b=tWqmpYNVkTwCd5q2PW+AHOynhhM3yHAvejO1MOH2xhnJeXjIgapPj/7Y
   9ieaJfZh5khD/WXCmcDH0+fMwj2ZyI/xcWreyYrlSyuczdFx3gk2ueIZB
   zz3SYdKMnbQ/yQ9RpkPlJnuZ1Nohwl7plv3IUHAKEe51xLhX0qpzPzKza
   TpsWiQFvj0KARrOr9GYduaunh4gh8TsJM2MIeIlM4c5blYDeyGxfvbF59
   O9pQkskUoXCc+AcYT3QqRCREKIwLXbLx9Xwht9TOavQA71bWvMKkxnluZ
   rOXoq/PJwF30dDVuXrb6hpkCnj51uKlSCHrvvKc+47I2AAnia9rjxX1Ss
   Q==;
X-IronPort-AV: E=Sophos;i="6.21,268,1763391600"; 
   d="scan'208";a="607384933"
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Subject: [PATCH 0/3] x86/x2apic: Fix hang-up of defconfig kernel on resume
 from s2ram
Date: Mon, 02 Feb 2026 18:51:01 +0900
Message-Id: <20260202-x2apic-fix-v1-0-71c8f488a88b@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIZzgGkC/x2MQQqAIBAAvyJ7TlDBsL4SHXTbai8mCiGIf086z
 sBMg0KZqcAqGmR6ufATB+hJAN4+XiT5GAxGmVkZpWU1PjHKk6t0Fh3qYDEsCkaQMg39z7a99w8
 R+TM4XAAAAA==
X-Change-ID: 20260201-x2apic-fix-85c8c1b5cb90
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=rciqWe9MknIhKucUK+4wbzClj9FvwHeXsn6kPpt+wM8=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhsyG4hXbtvp/s2L/pXvGSPVq9wtGQUU/0+sZWw9OOKhfs
 jfkl8CHjlIWBjEuBlkxRZZSpepfe1cELek581oRZg4rE8gQBi5OAZhIlhTD/8DScGFBO6NF8ydO
 ftFcVXsmfwpX6p0FupNYLebce84rq8zI0Cddbi5zcoJG8MkZzSbn5D/+eMqwb04Pw8ycnOdp7hW
 XuQA=
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

On resume from s2ram, a defconfig kernel gets into a state where the x2apic
hardware state and the kernel's perceived state are different.

On boot, x2apic is enabled by the firmware, and then the kernel does the
following (relevant lines from dmesg):

	[    0.000381] x2apic: enabled by BIOS, switching to x2apic ops
	[    0.009939] APIC: Switched APIC routing to: cluster x2apic
	[    0.095151] x2apic: IRQ remapping doesn't support X2APIC mode
	[    0.095154] x2apic disabled
	[    0.095551] APIC: Switched APIC routing to: physical flat

defconfig has CONFIG_IRQ_REMAP=n, which leads to x2apic being disabled,
because on bare metal, x2apic has an architectural dependence on interrupt
remapping.

While resuming from s2ram, x2apic is enabled again by the firmware, but
the kernel continues using the physical flat apic routing. This causes a
hang-up and no console output.

Patch 1 fixes this in lapic_resume by disabling x2apic when the kernel expects
it to be disabled.
Patch 2 enables CONFIG_IRQ_REMAP in defconfig so that defconfig kernels at
least don't disable x2apic because of a lack of IRQ_REMAP support.
Patch 3 is a non-functional change renaming x2apic_available to
x2apic_without_ir_available in struct x86_hyper_init, to better convey
the semantic.

Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
Shashank Balaji (3):
      x86/x2apic: disable x2apic on resume if the kernel expects so
      x86/defconfig: add CONFIG_IRQ_REMAP
      x86/virt: rename x2apic_available to x2apic_without_ir_available

 arch/x86/configs/x86_64_defconfig |  1 +
 arch/x86/include/asm/x86_init.h   |  4 ++--
 arch/x86/kernel/apic/apic.c       | 10 ++++++++--
 arch/x86/kernel/cpu/acrn.c        |  2 +-
 arch/x86/kernel/cpu/bhyve.c       |  2 +-
 arch/x86/kernel/cpu/mshyperv.c    |  2 +-
 arch/x86/kernel/cpu/vmware.c      |  2 +-
 arch/x86/kernel/jailhouse.c       |  2 +-
 arch/x86/kernel/kvm.c             |  2 +-
 arch/x86/kernel/x86_init.c        | 12 ++++++------
 arch/x86/xen/enlighten_hvm.c      |  4 ++--
 11 files changed, 25 insertions(+), 18 deletions(-)
---
base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
change-id: 20260201-x2apic-fix-85c8c1b5cb90

Best regards,
-- 
Shashank Balaji <shashank.mahadasyam@sony.com>


