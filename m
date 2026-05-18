Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0304ECD4F49
	for <xen-devel@archiver.kernel.org>; Mon, 18 May 2026 15:22:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1312030.1582202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznp-0002Ts-Fb; Mon, 18 May 2026 15:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312030.1582202; Mon, 18 May 2026 15:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wOznp-0002Tk-BC; Mon, 18 May 2026 15:22:45 +0000
Received: by outflank-mailman (input) for mailman id 1312030;
 Mon, 18 May 2026 15:22:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3bae951e000f373@swg.vates.tech>)
 id 1wOznn-0002SL-SU
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 15:22:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wOznn-00AUfW-8R
 for xen-devel@lists.xenproject.org; Mon, 18 May 2026 17:22:43 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3bae951e000f373@swg.vates.tech>)
 id 6a0b2eb3-2eae-0a2a0a5409dd-0a2a4509b9ec-48
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e3bae951e000f373@swg.vates.tech>)
 id 6a0b2ec2-2497-0a2a45090019-b9ff1c229311-3
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2026 17:22:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e3bae951e000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 May 2026 15:22:37 +0000
Received: from localhost.localdomain (88-175-170-134.subs.proxad.net
 [88.175.170.134]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 0AC5F8661A;
 Mon, 18 May 2026 17:22:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=eY2fdw+gmvQcsbHIwQEVTX0BWf+Umr3H4vi3FSP+vPs=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=mrZSNL15/2otbQ+Cc7U2CURUdyavKWBFjvCttg6Yy9el0TJGzG15c8jgzq4DIY4+pIXqMamHp
 CPAIPzNqxtdAuc1b+XY/5Xr5Zpk2HPEXJaPSS49p0oFhdDAAFRCOQOQiXjPeopC21u1vRsYNGKa
 HtMBYfR2OZzPCy9Q/PtiRNLoT1CjVpKDZFcn0XVYOXJLAjFvhdlnGNltHRlacEflTWZCAf9DMAl
 FDvu9mUD5Eag5Oqh5FI6RttRWaD8yOt6Tc88RpCXKpvPXrtFC6pq1jEhXnXK552wl+PLsik8g9K
 c+Zbn/4Pd6Cg6dH8/XCnEWFRPKJ4fn+eL9rO8AivMaGw==
X-Zone-Loop: f7968938d8e7a305757c45ce51c9015bfb0ad428f836
x-campaign-type: default
x-transaction-id: 7dda9839-6225-433d-a97f-942a0b3ee0e7
x-swg-uid: 01-cd6c7802-fc5a-42ff-be83-ccce10616db6
X-Mailer: Sweego
Message-ID:
 <1779117757.8631fc262581453bbf619ec5b2062170.19e3bae951e000f373@vates.tech>
x-swg-bid: 1779117757.8631fc262581453bbf619ec5b2062170.19e3bae951e000f373
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
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 0/5] Small PCI refactoring
Date: Mon, 18 May 2026 17:21:24 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e0f.e56d5032f9a0f31f.19e3bae9324.438d1bb93da6ab6f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779117757225
X-purgate-ID: tlsNG-bad1c0/1779117763-89D85A53-CA40CAD9/0/0
X-purgate-type: clean
X-purgate-size: 4492

---=Part.e0f.e56d5032f9a0f31f.19e3bae9324.438d1bb93da6ab6f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The goal of this series is to make some refactoring of some
pci primitives to improve codegen and make code less verbose=2E

A big chunk of it is converting many places where (seg, bus, dev, fn)
is split into multiples variables and convert it into being just
pci_sbdf_t, in particular in some PCI function parameters to reduce
parameter count which usually translate into less registers to pass
to the function=2E Moreover, we also avoid translating back and forth
between pci_sbdf_t and individual (seg, bus, dev, fn)=2E

Latest patch attempts to improve codegen of pci_conf_{read,write}N()
by making them inline specialized variants of pci_mmcfg_{read,write}()
in order to eliminate a particular `switch (len)` at compile time=2E

No intended functional change, aside some parts of the codebase that will
now correctly handle PCI segment when parsed while it was previously
ignored (e=2Eg dbgp)=2E

Bloat-o-meter is pretty telling

add/remove: 4/2 grow/shrink: 11/14 up/down: 529/-1470 (-941)
Function                                     old     new   delta
pci_mmcfg_base                                 -     106    +106
parse_pci_sbdf_seg                             -      88     +88
parse_pci_sbdf                                 -      85     +85
pci_dev_base                                   -      56     +56
pci_conf_read16                               92     118     +26
pci_conf_read8                                92     117     +25
ehci_dbgp_init                               629     652     +23
pci_conf_read32                               94     116     +22
pci_conf_write32                              88     109     +21
symbols_names                             106435  106452     +17
symbols_sorted_offsets                     59672   59688     +16
pci_conf_write16                              94     109     +15
pci_conf_write8                               94     108     +14
reserve_unity_map_for_device                 434     445     +11
symbols_offsets                            31920   31924      +4
mmcfg_intercept_write                        194     193      -1
add_one_user_rmrr                            653     644      -9
__find_dbgp                                   87      60     -27
pci_device_detect                             89      55     -34
pci_mmcfg_write                              197     152     -45
_scan_pci_devices                            286     241     -45
parse_ivrs_ioapic                            292     235     -57
parse_rmrr_param                             484     420     -64
register_one_rmrr                            389     324     -65
parse_ivrs_hpet                              249     184     -65
parse_ivmd_param                             651     570     -81
acpi_parse_dmar                             2625    2520    -105
get_virt                                     106       -    -106
pci_mmcfg_read                               189       -    -189
ns16550_init                                3205    3002    -203
acpi_parse_dev_scope                        1465    1091    -374

Teddy Astie (5):
  pci: Introduce parse_pci_sbdf{_seg}()
  vtd: Use pci_sbdf_t in acpi_parse_dev_scope()
  pci: Use pci_sbdf_t in pci_device_detect()
  pci: Parse into pci_sbdf_t directly
  RFC: pci: Migrate pci_mmcfg_{read,write}() to pci=2Ec

 xen/arch/x86/pv/ro-page-fault=2Ec          |   3 +-
 xen/arch/x86/x86_64/mmconfig=2Eh           |  43 --------
 xen/arch/x86/x86_64/mmconfig_64=2Ec        | 106 ++++----------------
 xen/arch/x86/x86_64/pci=2Ec                | 122 +++++++++++++++++++++--
 xen/drivers/char/ehci-dbgp=2Ec             |  35 +++----
 xen/drivers/char/ns16550=2Ec               |  24 ++---
 xen/drivers/char/xhci-dbc=2Ec              |   6 +-
 xen/drivers/passthrough/amd/iommu_acpi=2Ec |  26 ++---
 xen/drivers/passthrough/pci=2Ec            |  16 +--
 xen/drivers/passthrough/vtd/dmar=2Ec       |  80 ++++++---------
 xen/drivers/pci/pci=2Ec                    |  18 ++++
 xen/include/xen/pci=2Eh                    |  11 +-
 12 files changed, 243 insertions(+), 247 deletions(-)

--=20
2=2E52=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.e0f.e56d5032f9a0f31f.19e3bae9324.438d1bb93da6ab6f=---

