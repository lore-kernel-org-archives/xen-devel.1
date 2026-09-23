Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFECC98304
	for <xen-devel@archiver.kernel.org>; Thu, 24 Sep 2026 05:27:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1431283.1653539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9byj-0000Cu-7e; Thu, 24 Sep 2026 05:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1431283.1653539; Thu, 24 Sep 2026 05:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x9byj-0000Cn-4b; Thu, 24 Sep 2026 05:26:41 +0000
Received: by outflank-mailman (input) for mailman id 1431283;
 Wed, 23 Sep 2026 19:36:32 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <shreshth.srivastava@intel.com>) id 1x9Slb-0004fR-V7
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 19:36:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x9Sla-00EA01-9u
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2026 21:36:30 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <shreshth.srivastava@intel.com>)
 id 6ab429de-2eae-0a2a0a5409dd-0a2a4507bf78-46
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 21:36:28 +0200
Received: from [192.198.163.12] (helo=mgamail.intel.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <shreshth.srivastava@intel.com>)
 id 6ab42a39-b4ea-0a2a45070019-c0c6a30cb7dc-3
 for <xen-devel@lists.xenproject.org>; Wed, 23 Sep 2026 21:36:27 +0200
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 12:36:25 -0700
Received: from smtp.ostc.intel.com ([10.54.69.131])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 12:36:24 -0700
Received: from cwf-2s5.sh.intel.com (cwf-2s5.sh.intel.com [10.239.48.132])
 by smtp.ostc.intel.com (Postfix) with ESMTP id 813186393;
 Wed, 23 Sep 2026 12:36:20 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=Intel header.d=intel.com header.i="@intel.com" header.h="From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790192187; x=1821728187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qbyegVfPVisMftvM9w19I2vmSLxDxgBL+oYOVHk7UT8=;
  b=GY1YK3YZYi2/5TJqhAUTrbd1Bf8XOMpbuPPU0qDYrLGRFtMLUhweXo13
   FvipGI6X2freitqdiSfAUYTjLnmPeKOvx254soGOVsuIogSwszq6Y87xE
   PG/2LqYvwR8YHOEh+6z2CujWfEumxuwGxzwxEv1esuy8npBQ0jKewr2oe
   /Yx4C3KHwnQB48UM5KWFPxL3V8VyKbWgXkMDoxuh+F2QpQUrvRtiM/4F3
   Y+QKgKBv+ArW8wqW2ed/hJzJ+PfweI4AbmO59SWCRzmIix2bjpusiOeDy
   emBW5Yrudsh5ufoTWsDogtZs+R2LKSTH2/Odfu4nxWlej4RkLpBu3pPrQ
   Q==;
X-CSE-ConnectionGUID: OebOIXcRQ+yn219iRNNcPA==
X-CSE-MsgGUID: IG0letZISoGw4wNpYE1UzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="94745873"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="94745873"
X-CSE-ConnectionGUID: V7WQAby/SG+8UCxdRYJ8CA==
X-CSE-MsgGUID: rL2ba/rySBKoESyRt8MCQQ==
X-ExtLoop1: 1
From: Shreshth Srivastava <shreshth.srivastava@intel.com>
To: Juergen Gross <jgross@suse.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	virtualization@lists.linux.dev,
	llvm@lists.linux.dev
Cc: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	xin@zytor.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 00/17] x86/msr: Inline rdmsr/wrmsr instructions
Date: Wed, 23 Sep 2026 15:36:17 -0400
Message-ID: <20260923193619.1408940-1-shreshth.srivastava@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260911084211.3149957-1-jgross@suse.com>
References: <20260911084211.3149957-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1790192188-A66DAAE4-502E9D87/0/0
X-purgate-type: clean
X-purgate-size: 2994

On 11.09.26 10:41, Juergen Gross wrote:
> When building a kernel with CONFIG_PARAVIRT_XXL the paravirt
> infrastructure will always use functions for reading or writing MSRs,
> even when running on bare metal.

Hi Juergen,

This doesn't build with CONFIG_PARAVIRT_XXL=y. 16/17 and 17/17 are where
it breaks, but the cause is the .byte fallbacks: ASM_WRMSRNS_IMM from
08/17 and ASM_RDMSR_IMM from 10/17 don't end in a separator, unlike the
.insn variants above them.

  #define ASM_RDMSR_IMM				\
	" .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"

That worked while they were only ever the last argument of an
ALTERNATIVE(), which appends its own newline. 16/17 concatenates them
with ASM_CLRERR:

	ASM_RDMSR_IMM ASM_CLRERR, X86_FEATURE_MSR_IMM,	\

so the .long operand runs into the xor. From
make arch/x86/kernel/cpu/common.s:

	.byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long 266xor %rdx,%rdx

  paravirt-msr.h:165: Error: junk at end of line, first unrecognized character is `x'

clang reports "error: unexpected token" in the same place. 71 objects
fail, the same 71 either way, no vmlinux.

msr.h chooses between the .insn form and the .byte fallback with:

	#if defined(CONFIG_AS_IS_GNU) && CONFIG_AS_VERSION >= 24100

Two kinds of toolchain end up on the .byte side of that test:

  - GNU as older than 2.41. RHEL 9 and CentOS Stream 9 ship 2.35, and
    Documentation/process/changes.rst sets the minimum at 2.30, so this
    is a supported configuration rather than an old outlier.
  - clang, any version. CONFIG_AS_IS_GNU is never set for clang, so the
    && short-circuits and the version comparison is never reached. Your
    08/17 comment already notes that clang has no .insn support.

gcc with binutils 2.41 or newer takes the .insn path, where both macros
do end in a separator, and is unaffected.

Reproduced on v7.3-rc2 with your v3 00/13, v2 0/5 and v5 00/17 applied in
that order, x86_64 defconfig plus HYPERVISOR_GUEST, PARAVIRT, XEN and
XEN_PV. gcc 11.5.0 with GNU as 2.35.2, and clang 21.1.7.

Terminating both fallbacks fixes it, and both toolchains then build
vmlinux with no errors or warnings:

diff --git a/arch/x86/include/asm/msr.h b/arch/x86/include/asm/msr.h
index eba325ecfe4c..529c13553c63 100644
--- a/arch/x86/include/asm/msr.h
+++ b/arch/x86/include/asm/msr.h
@@ -78,9 +78,9 @@ static inline void do_trace_rdpmc(u32 msr, u64 val, int failed) {}
  * form MSR access instructions reference %rax as the register operand.
  */
 #define ASM_RDMSR_IMM				\
-	" .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]"
+	" .byte 0xc4,0xe7,0x7b,0xf6,0xc0; .long %c[msr]\n\t"
 #define ASM_WRMSRNS_IMM				\
-	" .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]"
+	" .byte 0xc4,0xe7,0x7a,0xf6,0xc0; .long %c[msr]\n\t"
 #endif

 #define RDMSR_AND_SAVE_RESULT			\

ASM_WRMSRNS needs no change, _ASM_BYTES() already emits a semicolon.

The WRMSRNS line belongs in 08/17 and the RDMSR line in 10/17.

Thanks,
Shreshth

