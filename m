Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC25AF419B9
	for <xen-devel@archiver.kernel.org>; Wed, 15 Apr 2026 13:54:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1282509.1565075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0hL-0005mS-B3; Wed, 15 Apr 2026 13:54:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282509.1565075; Wed, 15 Apr 2026 13:54:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wD0hL-0005mK-7b; Wed, 15 Apr 2026 13:54:31 +0000
Received: by outflank-mailman (input) for mailman id 1282509;
 Wed, 15 Apr 2026 13:54:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69df935d.v1-7a1d26ad580a45489050d865f5dd3455@bounce.vates.tech>)
 id 1wD0hK-0005m8-3y
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 13:54:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wD0hJ-002UaC-Gn
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2026 15:54:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69df935d.v1-7a1d26ad580a45489050d865f5dd3455@bounce.vates.tech>)
 id 69df988c-2eae-0a2a0a5409dd-0a2a4506a5c2-38
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:54:29 +0200
Received: from [198.2.187.1] (helo=mail187-1.suw11.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from
 <bounce-md_30504962.69df935d.v1-7a1d26ad580a45489050d865f5dd3455@bounce.vates.tech>)
 id 69df9894-0df0-0a2a45060019-c602bb019b01-3
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 15:54:29 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-1.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4fwhrs2rTkzBsbNWF
 for <xen-devel@lists.xenproject.org>; Wed, 15 Apr 2026 13:32:13 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 7a1d26ad580a45489050d865f5dd3455; Wed, 15 Apr 2026 13:32:13 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="teddy.astie@vates.tech" header.h="From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776259933; x=1776529933;
	bh=eaNab+1rc2BcfVbepkQ2ytNtOfdi2ILkULRqAk1y38E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=0LSKHwi5OD/KFEMho3TAYLAo49v4xNxE/gGa3VppnR90vwVIeycGZGR+8KJYv41cW
	 7KeSIY1OtAqkmMW8ReaACNmZPoSX6EOT7xIiC2q4aFBy9iPDbm+a6fkn3sTP+lU7TI
	 8SnihsnQI3VSAvGeyQDdgOKs0NHZtolSmP+K869hyC/z9VuErqJse1xoTwsmFzA/du
	 thjaeh/JFR6f4pIYiHTNGCvxWzf7Y07PmGKt4T5lxHYebgdip1kzZmBjT1KKloPZBK
	 PNQmizKyO6iRWDd35REv8sIVSuEzllndjCtIfR6WCHowUlOWJrXE4glR0o34Jvjnhm
	 cV2ExtaCBGIgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776259933; x=1776520433; i=teddy.astie@vates.tech;
	bh=eaNab+1rc2BcfVbepkQ2ytNtOfdi2ILkULRqAk1y38E=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=PnmTODKgc//LggMKpqMw7iWTR+myzszTu9LlC5KJMvO5XDNPczQVz/NPFPmBM97Ba
	 S2XIWqVyYx/EIboX9hEEWxE9vkHLx5liJUQxSa/ZDGE1vFsXYW34f3Hgu2MszunPeF
	 Edai2/ZYM8PELE5eDpO0hDmhCYCusgSGyjTLSDDzEzZZhkkMBPBOTx/wRsCvLyqUXC
	 UdkGtNBtbEpx0pT2ERzKJiDxdvV3xinsbGlWp3E1sbHJ0Pr+dBWpnZdY9c5ceweT8H
	 a8xuG3xbqIH+b0bkVZwL+zWfw31VyCgIY+xI4vVR6VsLfPP3+AeX2iBvkGa0AEj/+7
	 9voKYG15MGCuw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=200/7]=20x86:=20Use=20a=20single=20fixed=20ASID=20per=20domain?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776259931711
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Dario Faggioli" <dfaggioli@suse.com>, "Juergen Gross" <jgross@suse.com>, "George Dunlap" <gwd@xenproject.org>, "Tim Deegan" <tim@xen.org>
Message-Id: <cover.1776259594.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.7a1d26ad580a45489050d865f5dd3455?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260415:md
Date: Wed, 15 Apr 2026 13:32:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1776261269-5E12E3D8-65004FE7/0/0
X-purgate-type: clean
X-purgate-size: 4934

(ASID can be replaced with VPID for Intel)

This patch series is a reorganized version of [1] though, it share the same goal.
Not a lot of logic remain from v1/v2 [2] and the patch series is structured quite
differently to v3 [1].

Currently in Xen. In order to perform a TLB flush for a guest, we just increment
the ASID, which has the same effect as flushing the TLB. When we run out of ASID,
we flush the entire TLB and start over.
This is done per pCPU, thus the ASID management is done on a per-pCPU basis.

However, AMD SEV requires the ASID to be configured in advance and be unique per
domain as it bound to the encryption key used for the domain.

This patch series propose a new ASID model where a fixed single ASID is attributed
to the domain, thus all vCPU share such ASID. Moreover, the TLB for a vCPU is always
flushed in these conditions :
* the vCPU is migrated to another pCPU
(remote pCPU TLB may be out of sync or lack flushes made previously)
* a different vCPU of the same domain previously ran on this pCPU
(TLB entries comes from the previous vCPU, which may have a different CR3)

Albeit related to a SEV vulnerability, [4] gives more justifications on the needs
of these rules for correctness.

It is also important for making hypervisor-side guest broadcast TLB flushing
realistic, as a single fixed ASID per domain allows a broacast TLB flush to use
such ASID as target.

Moreover, AMD programmer manual also explicitely require this for correctly virtualizing
INVLPGB in guests (through 090h:7 ("Enable INVLPGB/TLBSYNC.") in VMCB) :
> A guest that executes a legal INVLPGB that is not intercepted will have the requested
> ASID field replaced by the current ASID and the valid ASID bit set before doing the
> broadcast invalidation.  Because of its broadcast nature, the ASID field must be global
> and all processors must allocate the same ASID to the same Guest for proper operation.
> Hypervisors that do not support a global ASID must intercept the Guest usage of INVLPGB,
> if enabled, for proper behavior.

In order to avoid making ASID management too complex, transition to only using a fixed ASID
per domain. If no ASID is available (e.g out of ASID or ASID usage is diabled), we use ASID=1
as a placeholder (which is still a valid ASID), and always flush the TLB on context switch
if the vcpu is using ASID=1.

Also add a way to specify a prefered minimum ASID, it is meant to be used later on to avoid
clobbering the low ASID space of SEV-ES and favor allocating ASIDs over that space.

[1] x86/hvm: Introduce Xen-wide ASID allocator
https://lore.kernel.org/xen-devel/cover.1750770621.git.teddy.astie@vates.tech/

[2] x86/hvm: Introduce Xen-wide ASID allocator
https://lore.kernel.org/xen-devel/cover.1723574652.git.vaishali.thakkar@vates.tech/

[4] TLB Poisoning Attacks on AMD Secure Encrypted Virtualization
https://dl.acm.org/doi/epdf/10.1145/3485832.3485876

Teddy Astie (7):
  vmx: Introduce vcpu single context VPID invalidation
  common: Track latest pCPU that ran the vCPU
  common: Introduce needs_tlb_flush vcpu field
  x86: Set v->needs_tlb_flush when needed
  x86/hvm: Flush TLB on vCPU overlaps on the same pCPU
  x86/hvm: Transition to needs_tlb_flush logic, use per-domain ASID
  hvm: Allow specifying a prefered asid minimum

 docs/misc/xen-command-line.pandoc      |   2 +-
 xen/arch/x86/flushtlb.c                |  22 +--
 xen/arch/x86/hvm/asid.c                | 177 +++++++++++--------------
 xen/arch/x86/hvm/emulate.c             |   2 +-
 xen/arch/x86/hvm/hvm.c                 |  25 +++-
 xen/arch/x86/hvm/nestedhvm.c           |   7 +-
 xen/arch/x86/hvm/svm/asid.c            |  67 +++++++---
 xen/arch/x86/hvm/svm/nestedsvm.c       |   2 +-
 xen/arch/x86/hvm/svm/svm.c             |  47 +++++--
 xen/arch/x86/hvm/svm/svm.h             |   4 -
 xen/arch/x86/hvm/vmx/vmcs.c            |   6 +-
 xen/arch/x86/hvm/vmx/vmx.c             |  77 ++++++-----
 xen/arch/x86/hvm/vmx/vvmx.c            |   4 +-
 xen/arch/x86/include/asm/flushtlb.h    |   7 -
 xen/arch/x86/include/asm/hvm/asid.h    |  27 ++--
 xen/arch/x86/include/asm/hvm/domain.h  |   1 +
 xen/arch/x86/include/asm/hvm/hvm.h     |  15 +--
 xen/arch/x86/include/asm/hvm/svm.h     |   5 +
 xen/arch/x86/include/asm/hvm/vcpu.h    |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx.h |  23 +++-
 xen/arch/x86/mm/hap/hap.c              |   9 +-
 xen/arch/x86/mm/p2m.c                  |   7 +-
 xen/arch/x86/mm/paging.c               |   2 +-
 xen/arch/x86/mm/shadow/multi.c         |  12 +-
 xen/common/domain.c                    |   8 ++
 xen/common/sched/core.c                |   5 +
 xen/include/xen/sched.h                |   6 +
 27 files changed, 319 insertions(+), 260 deletions(-)

-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


