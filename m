Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6718CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 17:05:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452476.1667280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlMd-0005Ot-OV; Fri, 16 Oct 2026 17:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452476.1667280; Fri, 16 Oct 2026 17:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHlMd-0005Om-LJ; Fri, 16 Oct 2026 17:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1452476;
 Fri, 16 Oct 2026 17:05:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@swg.vates.tech>)
 id 1xHlMc-0005Og-P8
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:05:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHlMc-00D0TI-2a
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 19:05:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@swg.vates.tech>)
 id 6ad2592e-bab6-0a2a0a5309dd-0a2a450294c4-12
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:05:01 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@swg.vates.tech>)
 id 6ad2593d-6ca4-0a2a45020019-b9ff1c2383cb-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 19:05:01 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a145ac82530008425.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 17:04:55 +0000
Received: from bazzite.gpn.vates.fr (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 9CFFB823FE;
 Fri, 16 Oct 2026 19:04:54 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=bHID4gDnUBamWNl4leUplz6R8oxrYRCt+gxAc7a3dDE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=TS2e4iJrgRAk+raZd7pf7JwOhoYJpuTyMO3gs3TT2CLVFmSmU0lprfFABc0tJ2aaqSWoPa7cn
 9jjfELoW1Bu5NhzSITyCnS0V3iyTb9oizvsPuGyTynnbaAbTHGJBBKljtv5zHC9nXBWi6/OKy8Y
 g4hTqtm/28rPwOguSEceJ8U5dus1sig9JjF0ii1NtHIKnUJB1H/+sZ74tcErmCU6tG7+Zexhqo0
 u7orgtTLQ4PSDI1gY/nVH2G8/gYNmHS2HqdY5pG+QzSADBp9zlca58He1dIItigSF8Rav3jgifs
 GLE6ieNtJy58Mopc1potefVPDfdOaY7tkm7iOmxYI2BA==
X-Zone-Loop: 69385bc52ae0e64795bad7d389470e5847e614f9a5ab
x-campaign-type: default
x-transaction-id: dfa0857b-8b1b-47fe-81e5-8f3d282d7bec
x-swg-uid: 01-27e464c2-3b27-44ad-af42-6ea14d91da23
X-Mailer: Sweego
Message-ID:
 <1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425@vates.tech>
x-swg-bid: 1792170295.8631fc262581453bbf619ec5b2062170.1a145ac82530008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	David Woodhouse <dwmw2@infradead.org>,
	George Dunlap <gwd@xenproject.org>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [LINUX PATCH v2 0/8] Various improvements on runstate and vcpu_time areas + xen_features 
Date: Fri, 16 Oct 2026 19:04:41 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.2f4.56ede8a57b9a8d0b.1a145ac7e4a.348ce0130e5b2c4b=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792170294859
X-purgate-ID: tlsNG-720697/1792170301-66CB22AC-56F11A23/0/0
X-purgate-type: clean
X-purgate-size: 2357

---=Part.2f4.56ede8a57b9a8d0b.1a145ac7e4a.348ce0130e5b2c4b=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Originally worked on for AMD SEV support, but happens to be useful on its o=
wn=2E

From the hypervisor, updating runstate info (and pv timer area) from
virtual address is expensive=2E Moreoever, confidential computing (SEV)
can't rely on guest virtual addresses=2E

Xen 4=2E18 introduced VCPUOP_register_{runstate,vcpu_time}_phys_area
variants that use physical addresses instead of virtual one, which
can be persistenly mapped on the hypervisor instead of translated
each time=2E

Also refactor xen_features so that it uses a bitmap instead of one
u8 per feature bit=2E

CC: Juergen Gross <jgross@suse=2Ecom>
CC: Boris Ostrovsky <boris=2Eostrovsky@oracle=2Ecom>
CC: Stefano Stabellini <sstabellini@kernel=2Eorg>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam=2Ecom>
CC: David Woodhouse <dwmw2@infradead=2Eorg>
CC: George Dunlap <gwd@xenproject=2Eorg>
CC: x86@kernel=2Eorg
CC: linux-kernel@vger=2Ekernel=2Eorg

Teddy Astie (8):
  x86/xen/pv: Don't setup runstate area too early
  xen: Refactor xen/features{=2Ec,=2Eh}
  xen: Add gpa conversion helpers
  x86/xen/time: Correct xen_save_time_memory_area() failure message
  x86/xen/time: Clear xen_clock mapping later
  x86/xen/time: Mark xen_setup_vsyscall_time_info() __init
  x86/xen/time: Use VCPUOP_register_{runstate,vcpu_time}_phys_area when av=
ailable
  xen/sysfs: Honor cached xen_features instead

 arch/x86/include/asm/xen/page=2Eh  | 22 ++++++++++++++
 arch/x86/xen/enlighten_pv=2Ec      |  3 --
 arch/x86/xen/time=2Ec              | 52 +++++++++++++++++++-------------
 drivers/xen/features=2Ec           | 11 ++++---
 drivers/xen/sys-hypervisor=2Ec     | 12 +++-----
 drivers/xen/time=2Ec               | 24 +++++++++++----
 include/xen/arm/page=2Eh           | 21 +++++++++++++
 include/xen/features=2Eh           | 10 +++---
 include/xen/interface/features=2Eh |  9 ++++++
 include/xen/interface/vcpu=2Eh     | 17 +++++++++++
 10 files changed, 134 insertions(+), 47 deletions(-)

--=20
2=2E56=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.2f4.56ede8a57b9a8d0b.1a145ac7e4a.348ce0130e5b2c4b=---

