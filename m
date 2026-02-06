Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CD5EE20B3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Feb 2026 15:56:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1223375.1530904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOBx-0000NY-JP; Fri, 06 Feb 2026 15:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223375.1530904; Fri, 06 Feb 2026 15:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voOBx-0000NR-GT; Fri, 06 Feb 2026 15:56:21 +0000
Received: by outflank-mailman (input) for mailman id 1223375;
 Fri, 06 Feb 2026 15:56:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) id 1voOBw-0000M4-HS
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 15:56:20 +0000
Received: from na1pdmzitismtp01.tibco.com (na1pdmzitismtp01.tibco.com
 [160.101.131.8]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f8e64f2-0374-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 16:56:18 +0100 (CET)
Received: from fedora.eng.citrite.net (unknown [10.113.40.46])
 by na1pdmzitismtp01.tibco.com (Postfix) with ESMTP id 9DAC142B8E1C;
 Fri,  6 Feb 2026 10:56:06 -0500 (EST)
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
X-Inumbo-ID: 5f8e64f2-0374-11f1-9ccf-f158ae23cfc8
From: Abdelkareem@tibco.com, Abdelsaamad@tibco.com,
	abdelkareem.abdelsaamad@citrix.com
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 0/3] Virtual NMI
Date: Fri,  6 Feb 2026 15:53:14 +0000
Message-ID: <cover.1770389605.git.abdelkareem.abdelsaamad@citrix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Abdelkareem Abdelsaamad <abdelkareem.abdelsaamad@citrix.com>

Currently, the Xen hypervisor delivers NMIs to the guests using the Event
Injection mechanism. The Event Injection mechanism does not block the
delivery of subsequent NMIs. So the Xen Hypervisor tracks the NMI delivery
and its completion (by intercepting the IRET instruction) before sending
a new NMI.

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

--Abdelkareem Abdelsaamad
[1] https://docs.amd.com/v/u/en-US/24593_3.43

Abdelkareem Abdelsaamad (3):
  svm/vnmi: introduce the vnmi bit support in the cpuid feature set
  svm/vnmi: add the definitions for the svm vnmi management bits in the
    VMCB
  svm/vnmi: Add support for the SVM Virtual NMI

 xen/arch/x86/hvm/hvm.c             | 29 +++++++++++++++++++++--------
 xen/arch/x86/hvm/svm/intr.c        | 16 ++++++++++++++--
 xen/arch/x86/hvm/svm/svm.c         | 25 ++++++++++++++++++++++++-
 xen/arch/x86/hvm/svm/vmcb.c        |  3 +++
 xen/arch/x86/hvm/svm/vmcb.h        | 12 ++++++++----
 xen/arch/x86/include/asm/hvm/hvm.h | 12 +++++++++++-
 xen/arch/x86/include/asm/hvm/svm.h |  2 ++
 7 files changed, 83 insertions(+), 16 deletions(-)

-- 
2.52.0


