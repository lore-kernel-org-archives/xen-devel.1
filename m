Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31015EF99E3
	for <xen-devel@archiver.kernel.org>; Fri, 13 Feb 2026 22:48:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1231979.1536887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1xZ-00075V-65; Fri, 13 Feb 2026 22:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231979.1536887; Fri, 13 Feb 2026 22:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr1xZ-00075O-3V; Fri, 13 Feb 2026 22:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1231979;
 Fri, 13 Feb 2026 22:48:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHiT=AR=citrix.com=abdelkareem.abdelsaamad@srs-se1.protection.inumbo.net>)
 id 1vr1xY-00075I-IH
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:48:24 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.corp.cloud.com
 [160.101.131.8]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 194cf051-092e-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 23:48:23 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id CE55D4280D5B;
 Fri, 13 Feb 2026 17:48:07 -0500 (EST)
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
X-Inumbo-ID: 194cf051-092e-11f1-b163-2bf370ae4941
From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>
Subject: [PATCH v2 0/2] Virtual NMI 
Date: Fri, 13 Feb 2026 22:44:44 +0000
Message-ID: <cover.1771016301.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Xen hypervisor delivers NMIs to the guests using the Event
Injection mechanism. The Event Injection mechanism does not block the delivery
of subsequent NMIs. So the Xen Hypervisor tracks the NMI delivery and its
completion (by intercepting the IRET instruction) before sending a new NMI.

With the 4th generation AMD EPYC, a hardware NMI virtualization support,
Virtual NMI (VNMI), is introduced.  The vNMI allows the hypervisor to inject
the NMI into the guest w/o using Event Injection mechanism. No need to track
the guest NMI and intercepting the IRET instruction.

NMI Virtualization support is indicated by CPUID Fn8000_000A_EDX[VNMI] = 1.[1]

NMI Virtualization is enabled by setting V_NMI_ENABLE (bit 26 in offset 60h
of the VMCB). Enabling NMI Virtualization requires the NMI intercept bit to
be set. An attempt to run a guest with V_NMI_ENABLE without the NMI intercept
bit set results in #VMEXIT(INVALID) [1]

Three new bits are added to the VMCB field at offset 60h to provide NMI
virtualization hardware support:

V_NMI(11): Indicates whether a virtual NMI is pending in the guest. The
processor will clear V_NMI once it takes the virtual NMI.
V_NMI_MASK(12): Indicates whether virtual NMIs are masked. The processor will
set V_NMI_MASK once it takes the virtual NMI. V_NMI_MASK is cleared when the
guest successfully completes an IRET instruction or #VMEXIT occurs while
delivering the virtual NMI.
V_NMI_ENABLE(26): Enables NMI virtualization. [1]

[1] https://docs.amd.com/v/u/en-US/24593_3.43

---
Changes in v2:
 - Merge the patches for
   "svm/vnmi: introduce the vnmi bit support in the cpuid feature set"
   and
   "svm/vnmi: add the definitions for the svm vnmi management bits in the VMCB"
   into the one patch
   "x86/svm: Add Enumerations for the SVM virtual NMI".
 - Change the patch subject "svm/vnmi: Add support for the SVM Virtual NMI" to
   "x86/svm: Use virtual NMI when available"
 - Move the print out of the VNMI capability to the patch
   "x86/svm: Use virtual NMI when available" when it is being used.
 - Remove the hvm_intblk_vnmi enumeration that was introduced for the separate
   masked vNMI handling.
 - Introduce the hvm_function_table's is_vnmi_enabled callback to allow for the
   SVM implementation to verify that the VNMI is enabled by checking the VMCB
   bits in addition to the CPUID reported support.
 - Change the the name of the hvm_function_table's callback is_vnmi_pending to
   is_vnmi_masked.
 - The svm_inject_nmi function gains a check for the distinct NMI injection
   handling when the VNMI is enabled.
 - Simplify the check of AMD SVM Hardware support for the VNMI. The check
   cpu_has_svm_vnmi is performed unconditionally.
 - Simplify the introduced changes diff for the vintr_t union for the VNMI bits
   support.
 - Adopt the Xen formatting guidelines for the control structures.
 - CI tests:
https://gitlab.com/xen-project/people/aabdelsa/xen/-/pipelines/2325298577
---

Abdelkareem Abdelsaamad (2):
  x86/svm: Add Enumerations for the SVM virtual NMI
  x86/svm: Use the virtual NMI when available

 xen/arch/x86/hvm/svm/intr.c        | 13 ++++++++++--
 xen/arch/x86/hvm/svm/svm.c         | 34 ++++++++++++++++++++++++++++--
 xen/arch/x86/hvm/svm/vmcb.c        |  2 ++
 xen/arch/x86/hvm/svm/vmcb.h        |  8 +++++--
 xen/arch/x86/include/asm/hvm/hvm.h | 13 +++++++++++-
 xen/arch/x86/include/asm/hvm/svm.h |  2 ++
 6 files changed, 65 insertions(+), 7 deletions(-)

-- 
2.52.0


