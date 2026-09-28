Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2119C9833F
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 12:17:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435954.1654703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBAIX-0000mK-CN; Mon, 28 Sep 2026 12:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435954.1654703; Mon, 28 Sep 2026 12:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBAIX-0000mD-9K; Mon, 28 Sep 2026 12:17:33 +0000
Received: by outflank-mailman (input) for mailman id 1435954;
 Mon, 28 Sep 2026 12:17:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@swg.vates.tech>)
 id 1xBAIW-0000m5-8t
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 12:17:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBAIV-005csb-CR
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 14:17:31 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@swg.vates.tech>)
 id 6aba5ad7-e002-0a2a0a5209dd-0a2a4507c446-32
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 14:17:31 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@swg.vates.tech>)
 id 6aba5adb-b4ea-0a2a45070019-b9ff1c239c5b-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 14:17:31 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0e7f2cff3000b504.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 28 Sep 2026 12:17:24 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B1CB78156D;
 Mon, 28 Sep 2026 14:17:23 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=qYWJQAjQOfMUFEoSk35dBVL7y/b8fW7q2i5fDN7R/QI=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=ePGyHJ8uYLZeCoQUBA6ptNPUcEHEWpQLV+0SXayt651EmZb9eefGHMswppxcoU9QzIFGjzr8e
 WHNBt7rJCLzNh86gg+BB+Hwdfwk4vzEasjEttR38y8luZuEmUCYI/yINIW3uV9yQB9lg79XFDP5
 ViISXcpZr30GDcKAO0CBin/iblkKXNK6Uybf/QsYvGzdatX8T8aT/dCki6av3J0CMtXk/GUTabo
 KVI+M1hF/1WGqP/GI746/QMcknhvINsafAYKSWbbrXMiACLivyUnQK9yRTCNNltQ9+V3hWlFfGB
 GCg7/5JDf5DV/khf2ajt0vsfaTy3n+6n91YFRy6AeHAw==
X-Zone-Loop: 3077789851229bbc4e89fc17d6bb6ffc58ee6a5b34b4
x-campaign-type: default
x-transaction-id: 515eae6b-76c3-4932-8f9a-d1c28b31db5d
x-swg-uid: 01-631c8fca-48a1-4128-92ae-a8e78584c5d2
X-Mailer: Sweego
Message-ID:
 <1790597845.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504@vates.tech>
x-swg-bid: 1790597845.8631fc262581453bbf619ec5b2062170.1a0e7f2cff3000b504
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
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksii Moisieiev <oleksii_moisieiev@epam.com>,
	Timothy Pearson <tpearson@raptorengineering.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v6 0/5] Fix ARM domcreate
Date: Mon, 28 Sep 2026 14:17:18 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.484.8c364cce9bfd1d44.1a0e7f2cd32.1ffded80ce842537=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1790597844279
X-purgate-ID: tlsNG-ef75cf/1790597851-A56C2AE4-1D839069/0/0
X-purgate-type: clean
X-purgate-size: 3314

---=Part.484.8c364cce9bfd1d44.1a0e7f2cd32.1ffded80ce842537=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Michal and Anthony,
thank you for your feedback=2E It's very appreciated! I have addressed all
open points=2E Michal, I have added your 'R-b' to the "xen/arm: report
clock_frequency via sysctl physinfo, not createdomain" commit, although
I have changed certain aspects of the commit after your review as per
Anthony's request=2E I have renamed arch_clock_frequency_hz to
arm_clock_frequency_hz and I have changed the
'libxl__arch_domain_save_config' to a single exit point=2E Please let me
know if your 'R-b' still stands=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Andrew Cooper (1):
  ARM/sysctl: Expose the supported guest GIC modes in physinfo

Julian Vetter (4):
  tools/arm: choose GIC version explicitly instead of relying on
    GIC_NATIVE
  xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
  xen/arm: report clock_frequency via sysctl physinfo, not createdomain
  xen: make config argument const

 CHANGELOG=2Emd                                  |  4 ++
 docs/man/xl=2Ecfg=2E5=2Epod=2Ein                      |  4 +-
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 31 ++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 72 +++++++++++++++++--
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/python/xen/lowlevel/xc/xc=2Ec             | 18 ++++-
 xen/arch/arm/dom0less-build=2Ec                 |  3 +-
 xen/arch/arm/domain=2Ec                         | 32 ++++-----
 xen/arch/arm/domain_build=2Ec                   |  3 +-
 xen/arch/arm/firmware/sci=2Ec                   |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec              |  2 +-
 xen/arch/arm/gic=2Ec                            | 15 ++++
 xen/arch/arm/include/asm/firmware/sci=2Eh       |  6 +-
 xen/arch/arm/include/asm/gic=2Eh                |  6 ++
 xen/arch/arm/include/asm/time=2Eh               |  7 +-
 xen/arch/arm/include/asm/vgic=2Eh               |  6 ++
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +-
 xen/arch/arm/sysctl=2Ec                         | 34 +++++++++
 xen/arch/arm/time=2Ec                           |  9 ++-
 xen/arch/arm/vgic-v2=2Ec                        |  5 ++
 xen/arch/arm/vgic/vgic-v2=2Ec                   |  5 ++
 xen/arch/arm/vtimer=2Ec                         |  4 +-
 xen/arch/ppc/stubs=2Ec                          |  2 +-
 xen/arch/riscv/domain=2Ec                       |  2 +-
 xen/arch/x86/domain=2Ec                         | 16 ++---
 xen/include/public/arch-arm=2Eh                 | 18 +----
 xen/include/public/domctl=2Eh                   |  4 +-
 xen/include/public/sysctl=2Eh                   | 22 +++++-
 xen/include/xen/sched=2Eh                       |  5 +-
 32 files changed, 265 insertions(+), 79 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.484.8c364cce9bfd1d44.1a0e7f2cd32.1ffded80ce842537=---

