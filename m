Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068F8C5DF87
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2026 12:38:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1396447.1634276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx22F-0001Tl-Mz; Thu, 20 Aug 2026 12:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1396447.1634276; Thu, 20 Aug 2026 12:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wx22F-0001Te-K8; Thu, 20 Aug 2026 12:38:19 +0000
Received: by outflank-mailman (input) for mailman id 1396447;
 Thu, 20 Aug 2026 12:38:19 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2dd31e000c4f3@swg.vates.tech>)
 id 1wx22F-0001TY-5M
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 12:38:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wx22E-00FHVh-Az
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2026 14:38:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2dd31e000c4f3@swg.vates.tech>)
 id 6a86f527-bab6-0a2a0a5309dd-0a2a450b86e2-4
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:38:18 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a01f2dd31e000c4f3@swg.vates.tech>)
 id 6a86f539-b7e8-0a2a450b0019-b9ff1c239655-3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2026 14:38:18 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a01f2dd31e000c4f3.00b for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Aug 2026 12:38:12 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id E8E0081FCD;
 Thu, 20 Aug 2026 14:38:10 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=SGjtsp1ym7OEP7diKsb4KcHKVUBAe62Kw5T/tQHyg5Y=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=S6UKXWkAxqssYnY30I3yv5+uaFJ1FSOWJkjx1cRKq7C5GRB1JwB2o4azvto9w/4ni1rhsgO27
 y7k5jI1XnSCcZ8+3dQFPWOEzhes2G+T5qxyoUWcb40Fcjqt2hQR7DSUkswYxCdxxqNuv/BvC3Rr
 qNuV8dAWrw5OoQkWeZl3/iVaMNJY9dbW6ryiVjZ3sidQm6YVJXR82pRMiztX1SePoMxJEyR/RGZ
 BvUWGkbwK/fPSl+ki799vJCR7+4203k+BT9SInZo8Sh9i0depJiX1YDPKgKIAo8xTKmiYxhcDI3
 q6ISrWxano13aVXqEkrccl4FctlwR4jVjXoZ4MExuOWQ==
X-Zone-Loop: 79a7dde3c40c3e0428b2f6fc7d3df27ab4779ff74899
x-campaign-type: default
x-transaction-id: 7a412ec2-d0d9-439a-9a2e-650fd5b56cc4
x-swg-uid: 01-9684f1d7-ef38-4704-a518-393b9272745c
X-Mailer: Sweego
Message-ID:
 <1787229492.8631fc262581453bbf619ec5b2062170.1a01f2dd31e000c4f3@vates.tech>
x-swg-bid: 1787229492.8631fc262581453bbf619ec5b2062170.1a01f2dd31e000c4f3
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
Subject: [PATCH v4 0/6] Fix ARM domcreate
Date: Thu, 20 Aug 2026 14:38:05 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.266d.bc76990160a75c3c.1a01f2dd034.2918ccc90bcf40f9=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1787229491257
X-purgate-ID: tlsNG-42698a/1787229498-1BED69EA-11D86C43/0/0
X-purgate-type: clean
X-purgate-size: 3759

---=Part.266d.bc76990160a75c3c.1a01f2dd034.2918ccc90bcf40f9=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Michal, Andrew and Jan,
thank you for your reviews! I have addressed your feedback, i=2Ee=2E, GICv=
2
compatibility-mode reporting, ASSERT_UNREACHABLE() for the invalid case,
and the comment typo=2E I also changed patch 4 to no longer bump
XEN_DOMCTL_INTERFACE_VERSION for the XEN_DOMCTL_CONFIG_GIC_NATIVE
removal and I have also updated the timer frequency reporting=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Changes in v4:
- Patch 1: Added Reviewed-by
- Patch 2: Also report GICv2 support when a GICv3 host has the vGICv2
  compatibility mode enabled
- Patch 3: Fix the missing closing bracket in arch_capabilities_arm_has()
- Patch 4: Don't bump XEN_DOMCTL_INTERFACE_VERSION for the removal of
  XEN_DOMCTL_CONFIG_GIC_NATIVE and report the requested GIC version in
  the "Unsupported GIC version" print
- Patch 5: Always populate the reported timer frequency, including in
  the CNTFRQ_EL0 path, so ACPI guests get a real value instead
  of 0 (previously only reported when booting via DT)
- Patch 6: Shorten the arch_sanitise_domain_config() comment
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

 CHANGELOG=2Emd                                  |  4 ++
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 17 +++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 30 +++++++++++++--
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/python/xen/lowlevel/xc/xc=2Ec             | 20 +++++++++-
 xen/arch/arm/dom0less-build=2Ec                 |  3 +-
 xen/arch/arm/domain=2Ec                         | 28 +++++---------
 xen/arch/arm/domain_build=2Ec                   |  3 +-
 xen/arch/arm/domctl=2Ec                         |  2 +
 xen/arch/arm/firmware/sci=2Ec                   |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec              |  2 +-
 xen/arch/arm/gic=2Ec                            | 16 ++++++++
 xen/arch/arm/include/asm/firmware/sci=2Eh       |  6 +--
 xen/arch/arm/include/asm/gic=2Eh                |  6 +++
 xen/arch/arm/include/asm/time=2Eh               |  6 +--
 xen/arch/arm/include/asm/vgic=2Eh               |  6 +++
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +-
 xen/arch/arm/sysctl=2Ec                         | 37 +++++++++++++++++++
 xen/arch/arm/time=2Ec                           |  7 ++--
 xen/arch/arm/vgic-v2=2Ec                        |  5 +++
 xen/arch/arm/vtimer=2Ec                         |  4 +-
 xen/arch/ppc/stubs=2Ec                          |  2 +-
 xen/arch/riscv/domain=2Ec                       |  2 +-
 xen/arch/x86/domain=2Ec                         | 16 ++++----
 xen/include/public/arch-arm=2Eh                 | 18 +--------
 xen/include/public/sysctl=2Eh                   | 14 ++++++-
 xen/include/xen/sched=2Eh                       |  5 +--
 30 files changed, 195 insertions(+), 73 deletions(-)

--=20
2=2E53=2E0



-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.266d.bc76990160a75c3c.1a01f2dd034.2918ccc90bcf40f9=---

