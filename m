Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CCEC5516D
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 14:46:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379220.1623958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoVJ-0006Q6-Cv; Fri, 31 Jul 2026 14:46:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379220.1623958; Fri, 31 Jul 2026 14:46:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpoVJ-0006Pz-AF; Fri, 31 Jul 2026 14:46:29 +0000
Received: by outflank-mailman (input) for mailman id 1379220;
 Fri, 31 Jul 2026 14:46:27 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@swg.vates.tech>)
 id 1wpoVH-0006Pr-6S
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 14:46:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpoVG-009enR-JU
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 16:46:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@swg.vates.tech>)
 id 6a6cb52b-bab6-0a2a0a5309dd-0a2a450bd2b6-20
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:46:26 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@swg.vates.tech>)
 id 6a6cb541-b7e8-0a2a450b0019-b9ff1c239663-3
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:46:25 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fb8a3efe8000e099.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 31 Jul 2026 14:46:19 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 7D2BF81F53;
 Fri, 31 Jul 2026 16:46:18 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=FdEEHXEwEp9GauUSnrbeP1nRZtiv7EadWHOhtK/7Cns=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=Wg0sKZhmUe0Juh71O6JElta9u9eEy7++QuL9Bpq6urO2vLISEz8XKkYyf3qtavsiyabOWGx/o
 b9RKBMqj2pP8efvipcE2FgfmWM0bjrqRz+ByZNCNtvjyP843igBY5/zueT9ARlqYTBGqZruEeNu
 sjXLjalQgv/WnSkehZFSs76x+ZImniJ+cNaO5EArUCphsRrWS0OtiSNrC/MUK6k6VdjRNTEVJzj
 wNXQmHs5ijkCzo23oa9p8zsYWKd4B1dwFMExCgrLoafCQ25vr9aM842hFbRHlKjwTH101lqnQtH
 6c5/jIWf3xqXY2xQOZYKXmRyLZqDdEwwXQSvTITjZ6gQ==
X-Zone-Loop: e51c7ab60ecbde8f34239a0082bfd5054d892b336314
x-campaign-type: default
x-transaction-id: f67949aa-7a8e-4b4d-b488-60e30dfa40a4
x-swg-uid: 01-e7a6bca7-e85b-4bf7-bea5-ec5baffb132a
X-Mailer: Sweego
Message-ID:
 <1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099@vates.tech>
x-swg-bid: 1785509179.8631fc262581453bbf619ec5b2062170.19fb8a3efe8000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Tim Deegan <tim@xen.org>
Subject: [RFC PATCH v2 0/5] x86: Use a single fixed ASID per domain
Date: Fri, 31 Jul 2026 16:19:56 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.18fe.15b9ae96df1ee42d.19fb8a3ed88.3a0074c82c1a8b75=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785509178760
X-purgate-ID: tlsNG-42698a/1785509186-194C39EA-56AF8FE8/0/0
X-purgate-type: clean
X-purgate-size: 4829

---=Part.18fe.15b9ae96df1ee42d.19fb8a3ed88.3a0074c82c1a8b75=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(ASID can be replaced with VPID for Intel)

Currently in Xen=2E In order to perform a TLB flush for a guest, we just i=
ncrement
the ASID, which has the same effect as flushing the TLB=2E When we run out=
 of ASID,
we flush the entire TLB and start over=2E
This is done per pCPU, thus the ASID management is done on a per-pCPU basi=
s=2E

However, AMD SEV requires the ASID to be configured in advance and be uniq=
ue per
domain as it bound to the encryption key used for the domain=2E

This patch series propose a new ASID model where a fixed single ASID is at=
tributed
to the domain, thus all vCPU share such ASID=2E Moreover, the TLB for a vC=
PU needs to
be flushed in these conditions :
* the vCPU is migrated to another pCPU
(remote pCPU TLB may be out of sync or lack flushes made previously)
* a different vCPU of the same domain previously ran on this pCPU
(TLB entries comes from the previous vCPU, which may have a different CR3)

Albeit related to a SEV vulnerability, [1] gives more justifications on th=
e needs
of these rules for correctness=2E

It is also important for making hypervisor-side guest broadcast TLB flushi=
ng
realistic, as a single fixed ASID per domain allows a broacast TLB flush t=
o use
such ASID as target=2E

Moreover, AMD programmer manual also explicitely require this for correctl=
y virtualizing
INVLPGB in guests (through 090h:7 ("Enable INVLPGB/TLBSYNC=2E") in VMCB) :
> A guest that executes a legal INVLPGB that is not intercepted will have =
the requested
> ASID field replaced by the current ASID and the valid ASID bit set befor=
e doing the
> broadcast invalidation=2E  Because of its broadcast nature, the ASID fie=
ld must be global
> and all processors must allocate the same ASID to the same Guest for pro=
per operation=2E
> Hypervisors that do not support a global ASID must intercept the Guest u=
sage of INVLPGB,
> if enabled, for proper behavior=2E

In order to avoid making ASID management too complex, transition to only u=
sing a fixed ASID
per domain=2E If no ASID is available (e=2Eg out of ASID or ASID usage is =
diabled), we use ASID=3D1
as a placeholder (which is still a valid ASID), and always flush the TLB o=
n context switch
if the vcpu is using ASID=3D1=2E

Also add a way to specify a prefered minimum ASID, it is meant to be used =
later on to avoid
clobbering the low ASID space of SEV-ES and favor allocating ASIDs over th=
at space=2E

[1] TLB Poisoning Attacks on AMD Secure Encrypted Virtualization
https://dl=2Eacm=2Eorg/doi/epdf/10=2E1145/3485832=2E3485876

v1: https://lore=2Ekernel=2Eorg/xen-devel/cover=2E1776259594=2Egit=2Eteddy=
=2Eastie@vates=2Etech/

Teddy Astie (5):
  vmx: Refactor vpid_sync_vcpu_gva()
  vmx: Introduce vcpu single context VPID invalidation
  x86: Track vcpu context switches and introduce needs_tlb_flush field
  x86/hvm: Transition to needs_tlb_flush logic, use per-domain ASID
  hvm: Allow specifying a prefered asid minimum

 docs/misc/xen-command-line=2Epandoc      |   2 +-
 xen/arch/x86/domain=2Ec                  |  26 ++++
 xen/arch/x86/flushtlb=2Ec                |  22 +--
 xen/arch/x86/hvm/asid=2Ec                | 177 +++++++++++--------------
 xen/arch/x86/hvm/emulate=2Ec             |   2 +-
 xen/arch/x86/hvm/hvm=2Ec                 |  14 +-
 xen/arch/x86/hvm/nestedhvm=2Ec           |   7 +-
 xen/arch/x86/hvm/svm/asid=2Ec            |  67 +++++++---
 xen/arch/x86/hvm/svm/nestedsvm=2Ec       |   2 +-
 xen/arch/x86/hvm/svm/svm=2Ec             |  35 +++--
 xen/arch/x86/hvm/svm/svm=2Eh             |   4 -
 xen/arch/x86/hvm/vmx/vmcs=2Ec            |   6 +-
 xen/arch/x86/hvm/vmx/vmx=2Ec             |  66 ++++-----
 xen/arch/x86/hvm/vmx/vvmx=2Ec            |   4 +-
 xen/arch/x86/include/asm/domain=2Eh      |   6 +
 xen/arch/x86/include/asm/flushtlb=2Eh    |   7 -
 xen/arch/x86/include/asm/hvm/asid=2Eh    |  39 +++---
 xen/arch/x86/include/asm/hvm/domain=2Eh  |   1 +
 xen/arch/x86/include/asm/hvm/hvm=2Eh     |  15 +--
 xen/arch/x86/include/asm/hvm/svm=2Eh     |   5 +
 xen/arch/x86/include/asm/hvm/vcpu=2Eh    |  10 +-
 xen/arch/x86/include/asm/hvm/vmx/vmx=2Eh |  25 +++-
 xen/arch/x86/mm/hap/hap=2Ec              |   9 +-
 xen/arch/x86/mm/p2m=2Ec                  |   6 +-
 xen/arch/x86/mm/paging=2Ec               |   2 +-
 xen/arch/x86/mm/shadow/multi=2Ec         |  12 +-
 26 files changed, 302 insertions(+), 269 deletions(-)

--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.18fe.15b9ae96df1ee42d.19fb8a3ed88.3a0074c82c1a8b75=---

