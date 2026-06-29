Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509B8C43638
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2026 17:23:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1347808.1605655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhn-0008JJ-EQ; Mon, 29 Jun 2026 17:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1347808.1605655; Mon, 29 Jun 2026 17:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weFhn-0008JB-BK; Mon, 29 Jun 2026 17:23:35 +0000
Received: by outflank-mailman (input) for mailman id 1347808;
 Mon, 29 Jun 2026 17:23:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@swg.vates.tech>)
 id 1weFhj-0008J5-4X
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 17:23:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weFhh-002otI-7E
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2026 19:23:29 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@swg.vates.tech>)
 id 6a42a9f1-e002-0a2a0a5209dd-0a2a4506b514-30
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:28 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@swg.vates.tech>)
 id 6a42aa10-08de-0a2a45060019-b9ff1c1290b9-3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jun 2026 19:23:28 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f14683b82000701b.007 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 29 Jun 2026 17:23:23 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 43A0A86BC4;
 Mon, 29 Jun 2026 19:23:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=TCRx2abjzOGs1wE8gw3MUM2KF63HTKhUm72XCmxtvoM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=QNey4V1clzVu9rzmVBXdFNskjd/0CNS05AfD8gkfi1vc80Tlqe5/AtjOGjJ4UYal9ocx+njIw
 87/Y1KC0ghm2IKMy/BXN3omYGYKWRPArbGnJlVrM/nR8sMKkukPm55Uk7uGyJHoeBGnTZm+5BjP
 T4HVw11wTwKfN2WKQm/q1Icm2TKj3YSneth5GN1CXVA5BU8yZY3Lp5xnDiutLwszKA6syecTvny
 gEs/2GMIZD/jdto+e6iZB2df6A0nptSvN6A4oiBDaXkitcThh4/e8fQR5RF8Eih5T5IrHQd4y2S
 asM2wrHmJ1VfdzwxBpBoSuMZeGBAufCAa+rzev2/Gkew==
X-Zone-Loop: ebfa3c5e26a2324405ddc12d8ec01e32dc2d918800e4
x-campaign-type: default
x-transaction-id: 241d6599-a984-46e8-9a95-899688411533
x-swg-uid: 01-5de99b1e-c79a-438a-a84d-b7e24817014a
X-Mailer: Sweego
Message-ID:
 <1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b@vates.tech>
x-swg-bid: 1782753803.8631fc262581453bbf619ec5b2062170.19f14683b82000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH v3 00/18] PCI SBDF Refactoring
Date: Mon, 29 Jun 2026 19:21:18 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.80b.e9d2684260afd7c1.19f1468391e.7b832c4321343074=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782753802530
X-purgate-ID: tlsNG-16d1c6/1782753808-C6F2468D-665758C2/0/0
X-purgate-type: clean
X-purgate-size: 3954

---=Part.80b.e9d2684260afd7c1.19f1468391e.7b832c4321343074=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The goal of this series is to make some refactoring of some
pci primitives to improve codegen and make code less verbose=2E

A big chunk of it is converting many places where (seg, bus, dev, fn)
is split into multiples variables and into being just pci_sbdf_t,
in particular in some PCI function parameters to reduce parameter count
which usually translate into less registers to pass to the function=2E
Moreover, we also avoid translating back and forth between pci_sbdf_t
and individual (seg, bus, dev, fn)=2E

No major functional change, aside some parts of the codebase that will
now correctly handle PCI segment when parsed while it was previously
ignored (e=2Eg dbgp)=2E

---
CI: https://gitlab=2Ecom/xen-project/people/tsnake41/xen/-/pipelines/26373=
43578

v3:
 * addressed review comments
 * Split "use pci_sbdf_t in *" with surrounding changes

v2:
 * Dropped "Migrate pci_mmcfg_{read,write}() to pci=2Ec", to be moved in
   a separate series
 * fixed dev_sbdf calculation in acpi_parse_dev_scope()=20
 * Updated documentation on ehci_dbgp now accepting segment parameter
   (but I'm not sure it suffice to allow this interface to use non-0 segme=
nts)
 * Introduced similar changes for pci_prepare_msix(), pci_ro_device(),
   pci_hide_device(), pci_remove_device(), pci_add_device()
   and pci_check_disable_device()
 * Use pci_sbdf_t in struct ehci_dbgp
 * Introduced "vtd: Rewrite igd device check in acpi_parse_dev_scope()"
 * Introduced docs change (RFC)

Teddy Astie (18):
  pci: Use pci_sbdf_t in pci_device_detect()
  pci: Use pci_sbdf_t in pci_add_device()
  pci: Use pci_sbdf_t in pci_prepare_msix()
  pci: Use pci_sbdf_t in pci_remove_device()
  pci: Use pci_sbdf_t in pci_ro_device()
  pci: Use pci_sbdf_t in pci_hide_device()
  pci: Use pci_sbdf_t pci_check_disable_device()
  pci: Introduce parse_pci_sbdf{_seg}()
  amd/iommu: Parse into pci_sbdf_t directly
  vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
  drivers/char/xhci: Parse into pci_sbdf_t directly
  ns16550: Parse into pci_sbdf_t directly
  vtd: Rename acpi_ioapic_unit=2Eioapic=2Einfo to acpi_ioapic_unit=2Ebdf
  pci: Use pci_sbdf_t in _scan_pci_devices
  pci: Allow ommiting func when parsing with parse_pci_sbdf()
  ehci-dbgp: Use pci_sbdf_t instead of (bus, slot, func)
  pci: Drop parse_pci_split{_seg}()
  RFC: docs: Document support for PCI segment in dbgp and comN parameter

 docs/misc/xen-command-line=2Epandoc          |  16 ++--
 xen/arch/x86/include/asm/msi=2Eh             |   2 +-
 xen/arch/x86/msi=2Ec                         |   4 +-
 xen/arch/x86/physdev=2Ec                     |  26 +++---
 xen/drivers/char/ehci-dbgp=2Ec               | 100 ++++++++-------------
 xen/drivers/char/ns16550=2Ec                 |  27 +++---
 xen/drivers/char/xhci-dbc=2Ec                |  12 +--
 xen/drivers/passthrough/amd/iommu_acpi=2Ec   |  26 +++---
 xen/drivers/passthrough/amd/iommu_detect=2Ec |   7 +-
 xen/drivers/passthrough/amd/iommu_init=2Ec   |   3 +-
 xen/drivers/passthrough/pci=2Ec              |  89 +++++++++---------
 xen/drivers/passthrough/vtd/dmar=2Ec         |  89 ++++++++----------
 xen/drivers/passthrough/vtd/dmar=2Eh         |   6 +-
 xen/drivers/passthrough/vtd/intremap=2Ec     |   2 +-
 xen/drivers/passthrough/vtd/iommu=2Ec        |   3 +-
 xen/drivers/pci/pci=2Ec                      |  41 +++------
 xen/drivers/pci/physdev=2Ec                  |   5 +-
 xen/drivers/video/vga=2Ec                    |   2 +-
 xen/include/xen/pci=2Eh                      |  21 ++---
 19 files changed, 207 insertions(+), 274 deletions(-)

--=20
2=2E54=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.80b.e9d2684260afd7c1.19f1468391e.7b832c4321343074=---

