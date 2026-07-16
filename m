Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A74EC4450A
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2026 14:07:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1364085.1615432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMk3-00022l-D4; Thu, 16 Jul 2026 14:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1364085.1615432; Thu, 16 Jul 2026 14:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wkMk3-00022e-9t; Thu, 16 Jul 2026 14:07:11 +0000
Received: by outflank-mailman (input) for mailman id 1364085;
 Thu, 16 Jul 2026 14:07:10 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@swg.vates.tech>)
 id 1wkMk1-00022Y-W7
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 14:07:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wkMk1-00HaGC-Cn
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2026 16:07:09 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@swg.vates.tech>)
 id 6a58e58b-e002-0a2a0a5209dd-0a2a450b9bc2-8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:07:09 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@swg.vates.tech>)
 id 6a58e58c-b7e8-0a2a450b0019-b9ff1c2396c3-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Jul 2026 16:07:09 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f6b408bba000edb5.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 16 Jul 2026 14:07:00 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 27111815FF;
 Thu, 16 Jul 2026 16:06:59 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Vre36dgL4UE0Uzr9gPi/lZEbu7xbNbhHZidry/6L+M0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=V0BTjqRuNZt96MmexYXGmNveNgBIpMw27xcTjIa9BCkGrM+U63W5yduujbYMhN7ISuk0lAF5P
 WWdw6oT+KyVUnxMlRDs9x9HpVAbSIehQfakovEamqUX60J//28Emhe3D9FcPS835674GoEg5Akd
 zOS1NWRyDABjFILQ8et9qBTHOg4aW59SHhj2/GvSy/XQkK7SvAf64LrdGIQ+bzzyDIm4mEx/yS8
 1HebqZZvRfH5zmjeqDeyhCEMMB6yaztz2gkU+xCAOJ61jcVSxxApY8GhmuWdthMWHJNYaBsd+Ti
 jEWOHa611NpJgG7QGPvoK7YXIqTXARQ3gQVVUJgcvXWQ==
X-Zone-Loop: 0d2fefb24e799f2e41498e5b6b3fb3d748ebc889a79b
x-campaign-type: default
x-transaction-id: d01d579d-b162-4db2-9a93-09d76c3738e4
x-swg-uid: 01-6ccdf912-8940-48bf-a117-b1471084d4a8
X-Mailer: Sweego
Message-ID:
 <1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5@vates.tech>
x-swg-bid: 1784210820.8631fc262581453bbf619ec5b2062170.19f6b408bba000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
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
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v3 0/6] Fix ARM domcreate
Date: Thu, 16 Jul 2026 16:06:53 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.a03.1a725c01134c3243.19f6b408989.d6c2c6858942c0a5=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784210819466
X-purgate-ID: tlsNG-42698a/1784210829-190CD9EA-C3CB8D1B/0/0
X-purgate-type: clean
X-purgate-size: 3568

---=Part.a03.1a725c01134c3243.19f6b408989.d6c2c6858942c0a5=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jan and Andrew,
thank you for your feedback! And sorry for the mess with the patches
somee being send twice=2E I'm still fighting against our mailserver=2E
As you suggested Andrew, I have taken ownership of the 2 patches, and I
have split the changes to the tools part and the changes to Xen into 2
separate patches=2E
Jan, I have added a _hz to the frequency to make it clear that this is
in Hz=2E Also, I have updated the comment, that the actual field in the DT
is also only a single cell of 32 bit=2E So, for now there is no need to
widen this in the ABI=2E I have also added how/if this value is used when
the system boots via ACPI=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v3:
- Added Reviewed-by to patch 1 and 6
- Changed ownership of patches 3 and 4
- Split patch 3 into two patches as suggested by Andrew
- Updated CHANGELOG=2Emd to report the changes to the ABI
- Addressed Jan's comments in regards to the clock_frequency property
  and ACPI booting
---
Andrew Cooper (1):
  ARM/sysctl: Expose the supported guest GIC modes in physinfo

Julian Vetter (5):
  xen/arm: report proper GIC version via XEN_DOMCTL_getdomaininfo
  tools/arm: choose GIC version explicitly instead of relying on
    GIC_NATIVE
  xen/arm: remove XEN_DOMCTL_CONFIG_GIC_NATIVE from the ABI
  xen/arm: report clock_frequency via sysctl physinfo, not createdomain
  xen: make config argument const

 CHANGELOG=2Emd                                  |  3 ++
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 16 ++++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 30 ++++++++++++++++---
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/python/xen/lowlevel/xc/xc=2Ec             | 20 ++++++++++++-
 xen/arch/arm/dom0less-build=2Ec                 |  3 +-
 xen/arch/arm/domain=2Ec                         | 29 +++++++-----------
 xen/arch/arm/domain_build=2Ec                   |  3 +-
 xen/arch/arm/domctl=2Ec                         |  2 ++
 xen/arch/arm/firmware/sci=2Ec                   |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec              |  2 +-
 xen/arch/arm/gic=2Ec                            | 16 ++++++++++
 xen/arch/arm/include/asm/firmware/sci=2Eh       |  6 ++--
 xen/arch/arm/include/asm/gic=2Eh                |  6 ++++
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +-
 xen/arch/arm/sysctl=2Ec                         | 29 ++++++++++++++++++
 xen/arch/arm/vtimer=2Ec                         |  4 +--
 xen/arch/ppc/stubs=2Ec                          |  2 +-
 xen/arch/riscv/domain=2Ec                       |  2 +-
 xen/arch/x86/domain=2Ec                         | 16 +++++-----
 xen/include/public/arch-arm=2Eh                 | 17 +----------
 xen/include/public/domctl=2Eh                   |  4 +--
 xen/include/public/sysctl=2Eh                   | 23 +++++++++++++-
 xen/include/xen/sched=2Eh                       |  6 ++--
 27 files changed, 180 insertions(+), 68 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.a03.1a725c01134c3243.19f6b408989.d6c2c6858942c0a5=---

