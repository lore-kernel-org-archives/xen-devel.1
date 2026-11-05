Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2D60720D1
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HKDJZu1h
Received: from list by lists.xenproject.org with outflank-mailman.1474996.1681863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj2-0003l1-Hg; Thu, 05 Nov 2026 15:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474996.1681863; Thu, 05 Nov 2026 15:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOzj2-0003k9-9X; Thu, 05 Nov 2026 15:50:04 +0000
Received: by outflank-mailman (input) for mailman id 1474996;
 Thu, 05 Nov 2026 15:50:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 1xOzj0-00032k-DJ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 15:50:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOziz-00GUtv-Q9; Thu, 05 Nov 2026 16:50:01 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca5a5-8faa-0a2a0a5109dd-0a2a4506e25e-8
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:01 +0100
Received: from [90.155.92.199] (helo=desiato.infradead.org)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <BATV+4c1d8b341febb4002902+8474+infradead.org+dwmw2@desiato.srs.infradead.org>)
 id 6aeca5a8-195a-0a2a45060019-5a9b5cc78bf8-3
 for <multiple-recipients>; Thu, 05 Nov 2026 16:50:00 +0100
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
 id 1xOziw-00000003Bo2-28cD; Thu, 05 Nov 2026 15:49:58 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red
 Hat Linux)) id 1xOziu-0000000Aaza-0bAa;
 Thu, 05 Nov 2026 15:49:56 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=desiato.20200630 header.d=infradead.org header.i="@infradead.org" header.h="Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=172rW2csVgIW8w3rofrqDqPbG51uDxT7XAZeT+28lqg=; b=HKDJZu1hdZbYfVaBOCLlBavSnA
	V2TA2mcvmVf58eYsqLUFUe/O1HGkUqDYLxh7hKC0/beriyKNx406TAdR+fxUIJcCicJj7ZtRPdrtg
	v8U493D/1ozG5g5huFss99LV35zEJpMn6tuWI09mTXLpEQ5Tkei6UNAMShpEzmscf56d7cdvFq/p+
	Ksz6ArXcuNDw5K5SZXmX7tFDttCVGoC5tVmwb7Ba6a9NZrikijNdZcNKb+evRsYgyACCcJmSPLv5W
	0lu5QwNNyDOXiYQxOlYu0jqSLRPANM9R1+TZ2jL2lYB1L7JC3SFawOmzoOiCNQvXHWfoV9swqj02n
	vfbX3PwQ==;
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
Subject: [PATCH v11 13/23] KVM: selftests: Use UAPI pvclock-abi.h in xen_shinfo_test
Date: Thu,  5 Nov 2026 07:49:44 -0800
Message-ID: <20261105154955.2525419-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105154955.2525419-1-dwmw2@infradead.org>
References: <20261105154955.2525419-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-16d1c6/1793893801-F5C0F77B-22E8A53C/0/0
X-purgate-type: clean
X-purgate-size: 3842
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

Now that pvclock-abi.h is a UAPI header, use it in xen_shinfo_test.c
instead of locally duplicating the struct definitions.

Sync the tools/ mirror of the header to the UAPI content: the KVM
selftests include path puts tools/arch/x86/include ahead of the
installed kernel headers, so the mirror is what actually gets used.
That makes the struct fields __u64 (unsigned long long), so switch
the verbose printfs away from PRIu64, which is "lu" on 64-bit.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 tools/arch/x86/include/asm/pvclock-abi.h      | 27 +++++++++-------
 .../selftests/kvm/x86/xen_shinfo_test.c       | 31 ++++++-------------
 2 files changed, 24 insertions(+), 34 deletions(-)

diff --git a/tools/arch/x86/include/asm/pvclock-abi.h b/tools/arch/x86/include/asm/pvclock-abi.h
index b9fece5fc96d..6d70cf640362 100644
--- a/tools/arch/x86/include/asm/pvclock-abi.h
+++ b/tools/arch/x86/include/asm/pvclock-abi.h
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
diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index aaa414c677ad..c48c0bf44257 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -98,22 +98,7 @@ struct sched_poll {
 	u64 timeout;
 };
 
-struct pvclock_vcpu_time_info {
-	u32   version;
-	u32   pad0;
-	u64   tsc_timestamp;
-	u64   system_time;
-	u32   tsc_to_system_mul;
-	s8    tsc_shift;
-	u8    flags;
-	u8    pad[2];
-} __attribute__((__packed__)); /* 32 bytes */
-
-struct pvclock_wall_clock {
-	u32   version;
-	u32   sec;
-	u32   nsec;
-} __attribute__((__packed__));
+#include <asm/pvclock-abi.h>
 
 struct vcpu_runstate_info {
 	u32 state;
@@ -987,12 +972,14 @@ int main(int argc, char *argv[])
 
 	if (verbose) {
 		printf("Wall clock (v %d) %d.%09d\n", wc->version, wc->sec, wc->nsec);
-		printf("Time info 1: v %u tsc %" PRIu64 " time %" PRIu64 " mul %u shift %u flags %x\n",
-		       ti->version, ti->tsc_timestamp, ti->system_time, ti->tsc_to_system_mul,
-		       ti->tsc_shift, ti->flags);
-		printf("Time info 2: v %u tsc %" PRIu64 " time %" PRIu64 " mul %u shift %u flags %x\n",
-		       ti2->version, ti2->tsc_timestamp, ti2->system_time, ti2->tsc_to_system_mul,
-		       ti2->tsc_shift, ti2->flags);
+		printf("Time info 1: v %u tsc %llu time %llu mul %u shift %u flags %x\n",
+		       ti->version, (unsigned long long)ti->tsc_timestamp,
+		       (unsigned long long)ti->system_time,
+		       ti->tsc_to_system_mul, ti->tsc_shift, ti->flags);
+		printf("Time info 2: v %u tsc %llu time %llu mul %u shift %u flags %x\n",
+		       ti2->version, (unsigned long long)ti2->tsc_timestamp,
+		       (unsigned long long)ti2->system_time,
+		       ti2->tsc_to_system_mul, ti2->tsc_shift, ti2->flags);
 	}
 
 	TEST_ASSERT(wc->version && !(wc->version & 1),
-- 
2.43.0


