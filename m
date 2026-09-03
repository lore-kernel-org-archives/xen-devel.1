Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70747C61DD3
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 14:10:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1407249.1640327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x288p-0004Pp-VU; Thu, 03 Sep 2026 14:10:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1407249.1640327; Thu, 03 Sep 2026 14:10:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x288p-0004Pi-Sj; Thu, 03 Sep 2026 14:10:11 +0000
Received: by outflank-mailman (input) for mailman id 1407249;
 Thu, 03 Sep 2026 14:10:11 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@swg.vates.tech>)
 id 1x288p-0004O8-39
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 14:10:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x288o-001Fy7-Br
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 16:10:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@swg.vates.tech>)
 id 6a997fba-e002-0a2a0a5209dd-0a2a450ae676-36
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:10:10 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@swg.vates.tech>)
 id 6a997fc1-f2d2-0a2a450a0019-b9ff1c22b52b-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 16:10:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0679afc0d000c4f3.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 03 Sep 2026 14:10:05 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 505C180F82;
 Thu,  3 Sep 2026 16:10:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bs7jvPMFI3pd3P8FsMzJgn8tGXG26d0b6D7BLNmVifc=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=WFsI+IzfECYBafEq3ZaAGAjoUUJsX/reMxNcYT2cwa0KMJYL2MH5Sz6HfbMjENQ/iNUYAxw3i
 IbTP6FQ0zRI5hNHGKYqYVuZsjibiVL/WL2XTxFtkpXP/dd4zRD2GngrwlSyFxmfKRRm90sqrwaK
 hvns3NSg9Pe1W8gxHA6prt8TXtv2EoIY1DTpko4ObBBI0B2NeNKdv4KdMxrLj833MtlV6lz9xiq
 10Qwn8tsAXiWUnwT+y81zOVyzLgDg45MPWyJ4KARd/sv2QqNEVCOs42tWwZHXbtu/BXApi8x0IM
 ethdOHOpiFkLMECvW2GQGF5b8OrSx5yP96Xkz1Yav85w==
X-Zone-Loop: a5141be8ea305617ea39ca29801c57f8cc586623a0c1
x-campaign-type: default
x-transaction-id: a25a2874-d280-4151-8865-bb89925a7961
x-swg-uid: 01-e681f7da-1ed3-418c-82e4-b6ba181c8a56
X-Mailer: Sweego
Message-ID:
 <1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3@vates.tech>
x-swg-bid: 1788444605.8631fc262581453bbf619ec5b2062170.1a0679afc0d000c4f3
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v5 00/11] x86/hvm: Add Extended MSI destination ID support
Date: Thu,  3 Sep 2026 16:09:59 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.359e.6926871dec21afe8.1a0679af91a.a27d7a411bf599d4=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1788444604699
X-purgate-ID: tlsNG-4011c0/1788444610-526DECFC-A4F0F090/0/0
X-purgate-type: clean
X-purgate-size: 8308

---=Part.359e.6926871dec21afe8.1a0679af91a.a27d7a411bf599d4=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you Teddy and Jan for the detailed review on v4! Jan you're right,
When recently asking I didn't understand the issue with only having a
ENABLED/DISABLED for the ext_dest_id flag=2E Now it's clear why we need a
tri-state, but also why a tri-state is sufficient=2E I have converted it
to UNSET, DISABLED, or ENABLED=2E So, after a migration we know that if
it's still UNSET the domain is unaware of the feature and we will not
announce it no matter how many ioreq servers have opt'ed in on the new
host=2E

I have also split the parts that "just" move code around with no
functional changes into smaller chunks so each of them is easier to
diff:
Patch 1  x86/vioapic: check of the IOAPIC save record=2E
Path 2-6 Refactor pt_irq_create_bind(): brace the retry block, turn
         "goto restart" into a loop, extract pt_irq_dpci_setup(),
         extract the PT_IRQ_TYPE_MSI body into pt_irq_bind_msi() as just
         a code move, then re-indent=2E No functional change=2E
Patch 7  Switch pt_irq_bind_msi() and struct hvm_gmsi_info to the raw
         MSI address/data words, add MSI_ADDR_DEST(), reject a stored
         address that is not in 0xfeexxxxx MSI format=2E domctl callers
         keep working via a gflags -> message rebuild=2E No functional
         change for existing 8-bit-destination guests=2E
Patch 8  Add the tri-state d->arch=2Ehvm=2Eext_dest_id and fold the extend=
ed
         bits into every call site, guarded by hvmext_dest_id_active()=2E
         Still never enabled, so still no functional change=2E
Patch 9  Add XEN_DMOP_{,un}bind_pt_msi_irq (raw address/data) and remove
         PT_IRQ_TYPE_MSI from XEN_DOMCTL_{,un}bind_pt_irq=2E This is an
         incompatible hypercall-ABI change, recorded in CHANGELOG=2Emd and
         public/domctl=2Eh=2E
Patch 10 Negotiate the feature per ioreq server (a flags byte on
         XEN_DMOP_create_ioreq_server), level it across all servers,
         latch it at arch_domain_creation_finished(), and migrate it in
         a new HVM_SAVE_TYPE(EXT_DEST_ID) record=2E
Patch 11 Advertise XEN_HVM_CPUID_EXT_DEST_ID from the latched value=2E

I only have two remaining questions:
- As pointed out by Jan: The new DM ops now only relies on xsm_dm_op()
  for access control=2E Daniel Smith can you comment on, whether a
  xsm_bind_pt_irq hook is also wanted here?
- In dm=2Ec we still use the read_lock(&d->pci_lock) around the
  bind/unbind calls, as was the case in v4=2E Jan you suspected no lock is
  needed there, but for now I left it as-is=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v5:
- The domctl MSI path is no longer rejected (that broke older DMs and
  left dead code)=2E PT_IRQ_TYPE_MSI keeps working until patch 9 removes
  it alltogether, with the now-dead pt_irq_create_bind() case deleted in
  the same step=2E
- pt_irq_bind_msi() rejects an address not in MSI format (0xfeexxxxx),
  so every caller storing into gmsi=2Eaddr is guaranteed a well-formed
  message=2E
- The ext_dest_id "bool" state is now a tri-state (UNSET / DISABLED /
  ENABLED)=2E Every decode site folds in the extended bits only when the
  feature is active and treats them as reserved otherwise, rather than
  rejecting a guest that left values there=2E Removed the ioapic_check()
  extended-bit rejection loop=2E
- The creation_finished latch only fires while the state is UNSET, so a
  migrated value wins=2E
- hvm_load() resolves a record-less stream (from an "old" Xen) to
  DISABLED=2E
- v4's single "extract pt_irq_bind_msi()" patch is split into
  - The goto -> loop conversion is its own patch (Patch 3) and does a
    "for ( ; ; )" instead of do/while
  - A code move (Patch 4)
  - A re-indent (Patches 5, 6)
- Moved hvm_ext_dest_id_enabled() into common/ioreq=2Ec as a function that
  iterates over ARRAY_SIZE(d->ioreq_server=2Eserver)=2E Flag-bit validatio=
n
  is now arch specific=2E The Arm stub rejects any non-zero flag=2E Added =
a
  check handler for the EXT_DEST_ID save record=2E
- Fixed a bug in _hvm_dpci_msi_eoi()=2E Function tested
  XEN_DOMCTL_VMSI_X86_DM_MASK against a raw address and not against
  MSI_ADDR_DESTMODE_MASK=2E
- Added the missing libxendevicemodel=2Emap VERS_1=2E5 entry and Makefile
  MINOR bump=2E The new parameter for xendevicemodel_create_ioreq_server()
  is a compatibility break for DMs, now mentioned in CHANGELOG=2Emd=2E
- ioapic_check() validates base_address alignment, hap_paddr_bits and
  bounds the APIC ID by the IO_APIC_reg_02 field and the ioregsel check
  is gone, since vioapic_write() has no such restriction=2E
- Addressed general feedback from Jan:
  - machine_irq / gflags and the flags parameters are unsigned int
  - MSI_ADDR_DEST() derives its shift from a new MSI_ADDR_DEST_ID_WIDTH
    and leaves the existing MSI_ADDR_DEST_ID_* lines alone
  - Removed the "Intel convention" in a comment
  - MASK_EXTR / MASK_INSR used consistently
  - Removed redundant nr_pirqs check and "!!"
  - DM op debug print shortened to "%pd: fn() failed: %ld"
  - DM op struct fields are pirq / msg_addr / msg_data, the flag
    is XEN_DMOP_MSI_BIND_UNMASKED
  - gtable is documented as a guest-physical address
  - x86-specific wording is out of the public header
  - needless typedefs / blank line removed
  - The unbind op no longer requires current-domain IRQ permission=2E
---
Julian Vetter (11):
  x86/vioapic: Add ioapic_check() to validate IO-APIC state before
    restore
  x86/passthrough: Wrap pt_irq_create_bind() restart block in braces
  x86/passthrough: Replace pt_irq_create_bind() goto restart with a loop
  x86/passthrough: Extract pt_irq_dpci_setup() from pt_irq_create_bind()
  x86/passthrough: Extract PT_IRQ_TYPE_MSI body into pt_irq_bind_msi()
  x86/passthrough: Re-indent pt_irq_bind_msi() body
  x86/passthrough: Switch pt_irq_bind_msi() to raw MSI address/data
  x86/hvm: Decode extended MSI / IO-APIC destination IDs when opted in
  x86/dmop: Add XEN_DMOP_{,un}bind_pt_msi_irq
  hvm/ioreq: Negotiate extended destination ID support per ioreq server
  x86/cpuid: Advertise XEN_HVM_CPUID_EXT_DEST_ID

 CHANGELOG=2Emd                                 |   6 +
 tools/include/xendevicemodel=2Eh               |  33 +-
 tools/libs/ctrl/xc_devicemodel_compat=2Ec      |   2 +-
 tools/libs/ctrl/xc_domain=2Ec                  |  51 ++-
 tools/libs/devicemodel/Makefile              |   2 +-
 tools/libs/devicemodel/core=2Ec                |  41 ++-
 tools/libs/devicemodel/libxendevicemodel=2Emap |   6 +
 xen/arch/arm/ioreq=2Ec                         |   6 +
 xen/arch/x86/cpuid=2Ec                         |   8 +
 xen/arch/x86/domain=2Ec                        |  13 +
 xen/arch/x86/domctl=2Ec                        |  11 +-
 xen/arch/x86/hvm/dm=2Ec                        |  66 ++++
 xen/arch/x86/hvm/ioreq=2Ec                     |  57 +++
 xen/arch/x86/hvm/irq=2Ec                       |   6 +-
 xen/arch/x86/hvm/save=2Ec                      |   9 +
 xen/arch/x86/hvm/vioapic=2Ec                   |  49 ++-
 xen/arch/x86/hvm/vmsi=2Ec                      |  59 ++-
 xen/arch/x86/include/asm/hvm/domain=2Eh        |  13 +
 xen/arch/x86/include/asm/hvm/hvm=2Eh           |  12 +-
 xen/arch/x86/include/asm/hvm/irq=2Eh           |   4 +-
 xen/arch/x86/include/asm/hvm/vioapic=2Eh       |  10 +
 xen/arch/x86/include/asm/msi=2Eh               |  19 +
 xen/common/ioreq=2Ec                           |  31 +-
 xen/drivers/passthrough/x86/hvm=2Ec            | 366 +++++++++++--------
 xen/include/public/arch-x86/hvm/save=2Eh       |  20 +-
 xen/include/public/hvm/dm_op=2Eh               |  51 ++-
 xen/include/xen/iommu=2Eh                      |   3 +
 xen/include/xen/ioreq=2Eh                      |  11 +
 xen/include/xlat=2Elst                         |   2 +
 29 files changed, 723 insertions(+), 244 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.359e.6926871dec21afe8.1a0679af91a.a27d7a411bf599d4=---

