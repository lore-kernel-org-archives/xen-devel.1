Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3720E606A8B2
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 18:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fgVrUACa
Received: from list by lists.xenproject.org with outflank-mailman.1484482.1687839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClL-0000JY-7E; Wed, 11 Nov 2026 18:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484482.1687839; Wed, 11 Nov 2026 18:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xRClK-0000HV-IJ; Wed, 11 Nov 2026 18:09:34 +0000
Received: by outflank-mailman (input) for mailman id 1484482;
 Wed, 11 Nov 2026 18:09:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 1xRClH-00089O-Gl
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 18:09:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xRClG-00FSoo-Tg; Wed, 11 Nov 2026 19:09:30 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af4af53-2eae-0a2a0a5409dd-0a2a450aba5c-4
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:30 +0100
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+abad5507353db368323c+8480+infradead.org+dwmw2@casper.srs.infradead.org>)
 id 6af4af55-f2d2-0a2a450a0019-5a9b3222ba54-3
 for <multiple-recipients>; Wed, 11 Nov 2026 19:09:25 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xRCl9-0000000CKvf-2M2F; Wed, 11 Nov 2026 18:09:23 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xRCl9-0000000HWsu-1UOe;
 Wed, 11 Nov 2026 18:09:23 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=casper.20170209 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=mKH9BxiVhD1hkWOxu0QRNvIl232YhI8uqiNY5R0UwSo=; b=fgVrUACaSLph0J26X6E/7/ickG
	K3hS2UAraMzNHVHR2xkmPOrKX5AWdkNZ7oeNDrtt6pCdiGRLupJwii0llUquynMXlz8ehO5gqHKZ/
	LlusvvLB8cDDCGYWPA97DJuDxBDNgikoDSBuosnQOTWifs5oXmIBM4b574rSa0FqdIhcYpcTVN825
	ff9cnbKHI+kdyVlzabIpLVrfUWJb4D6fKPlbkHhJ8f5fQeRT6XvfdXbg5S0HzJAYhQMN6+0qRsonE
	tIfL4thRfwH/L2EDJolKRkyypzcIDGzsXVywbP/wFBejG/rKp13lKdeQYqbPkG/4K98Cob01nZEcY
	OMkEqRyQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Paul Durrant <paul@xen.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Jack Allister <jalliste@amazon.com>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	joe.jin@oracle.com,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH v13 14/26] UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
Date: Wed, 11 Nov 2026 10:09:10 -0800
Message-ID: <20261111180922.4177927-15-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111180922.4177927-1-dwmw2@infradead.org>
References: <20261111180922.4177927-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-4011c0/1794420570-5A1DDCFC-51B6E4A1/0/0
X-purgate-type: clean
X-purgate-size: 3998
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Jack Allister <jalliste@amazon.com>

A subsequent commit will provide a new KVM interface for performing a
fixup/correction of the KVM clock against the reference TSC. The
KVM_[GS]ET_CLOCK_GUEST API requires a pvclock_vcpu_time_info, as such
the caller must know about this definition.

Move the definition to the UAPI folder so that it is exported to
usermode, change the type definitions to use the standard for UAPI
exports, and add the Linux-syscall-note exception to the SPDX licence
identifier as is conventional for exported headers.

Define __KERNEL__ in scripts/xen-hypercalls.sh: the UAPI header now
pulls in linux/types.h, and the script's raw $CPP invocation with
$LINUXINCLUDE does not define it, which would trigger the "attempt to
use kernel headers from user space" warning from the UAPI type
headers.

Signed-off-by: Jack Allister <jalliste@amazon.com>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Paul Durrant <paul@xen.org>
Tested-by: Dongli Zhang <dongli.zhang@oracle.com>
---
 MAINTAINERS                                   |  4 +--
 arch/x86/include/{ => uapi}/asm/pvclock-abi.h | 27 ++++++++++---------
 scripts/xen-hypercalls.sh                     |  2 +-
 3 files changed, 18 insertions(+), 15 deletions(-)
 rename arch/x86/include/{ => uapi}/asm/pvclock-abi.h (82%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9fadc98d3c49..773f7c800f6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14663,8 +14663,8 @@ S:	Supported
 T:	git git://git.kernel.org/pub/scm/virt/kvm/kvm.git
 F:	arch/um/include/asm/kvm_para.h
 F:	arch/x86/include/asm/kvm_para.h
-F:	arch/x86/include/asm/pvclock-abi.h
 F:	arch/x86/include/uapi/asm/kvm_para.h
+F:	arch/x86/include/uapi/asm/pvclock-abi.h
 F:	arch/x86/kernel/kvm.c
 F:	arch/x86/kernel/kvmclock.c
 F:	include/asm-generic/kvm_para.h
@@ -29780,8 +29780,8 @@ R:	Boris Ostrovsky <boris.ostrovsky@oracle.com>
 L:	xen-devel@lists.xenproject.org (moderated for non-subscribers)
 S:	Supported
 F:	arch/x86/configs/xen.config
-F:	arch/x86/include/asm/pvclock-abi.h
 F:	arch/x86/include/asm/xen/
+F:	arch/x86/include/uapi/asm/pvclock-abi.h
 F:	arch/x86/platform/pvh/
 F:	arch/x86/xen/
 
diff --git a/arch/x86/include/asm/pvclock-abi.h b/arch/x86/include/uapi/asm/pvclock-abi.h
similarity index 82%
rename from arch/x86/include/asm/pvclock-abi.h
rename to arch/x86/include/uapi/asm/pvclock-abi.h
index b9fece5fc96d..6d70cf640362 100644
--- a/arch/x86/include/asm/pvclock-abi.h
+++ b/arch/x86/include/uapi/asm/pvclock-abi.h
@@ -1,6 +1,9 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 #ifndef _ASM_X86_PVCLOCK_ABI_H
 #define _ASM_X86_PVCLOCK_ABI_H
+
+#include <linux/types.h>
+
 #ifndef __ASSEMBLER__
 
 /*
@@ -24,20 +27,20 @@
  */
 
 struct pvclock_vcpu_time_info {
-	u32   version;
-	u32   pad0;
-	u64   tsc_timestamp;
-	u64   system_time;
-	u32   tsc_to_system_mul;
-	s8    tsc_shift;
-	u8    flags;
-	u8    pad[2];
+	__u32   version;
+	__u32   pad0;
+	__u64   tsc_timestamp;
+	__u64   system_time;
+	__u32   tsc_to_system_mul;
+	__s8    tsc_shift;
+	__u8    flags;
+	__u8    pad[2];
 } __attribute__((__packed__)); /* 32 bytes */
 
 struct pvclock_wall_clock {
-	u32   version;
-	u32   sec;
-	u32   nsec;
+	__u32   version;
+	__u32   sec;
+	__u32   nsec;
 } __attribute__((__packed__));
 
 #define PVCLOCK_TSC_STABLE_BIT	(1 << 0)
diff --git a/scripts/xen-hypercalls.sh b/scripts/xen-hypercalls.sh
index f18b00843df3..51a722198997 100755
--- a/scripts/xen-hypercalls.sh
+++ b/scripts/xen-hypercalls.sh
@@ -5,7 +5,7 @@ shift
 in="$@"
 
 for i in $in; do
-	eval $CPP $LINUXINCLUDE -dD -imacros "$i" -x c /dev/null
+	eval $CPP -D__KERNEL__ $LINUXINCLUDE -dD -imacros "$i" -x c /dev/null
 done | \
 awk '$1 == "#define" && $2 ~ /__HYPERVISOR_[a-z][a-z_0-9]*/ { v[$3] = $2 }
 	END {   print "/* auto-generated by scripts/xen-hypercall.sh */"
-- 
2.43.0


