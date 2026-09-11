Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2245DC88E50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2026 12:43:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1416552.1645514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50bC-0003YR-5n; Fri, 11 Sep 2026 12:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1416552.1645514; Fri, 11 Sep 2026 12:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x50bC-0003YK-1j; Fri, 11 Sep 2026 12:43:22 +0000
Received: by outflank-mailman (input) for mailman id 1416552;
 Fri, 11 Sep 2026 12:43:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@swg.vates.tech>)
 id 1x50b9-0003YC-Q0
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 12:43:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x50b9-00E74Q-3F
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2026 14:43:19 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@swg.vates.tech>)
 id 6aa3f760-bab6-0a2a0a5309dd-0a2a4502c906-16
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:43:18 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@swg.vates.tech>)
 id 6aa3f766-6ca4-0a2a45020019-b9ff1c22ac5f-3
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2026 14:43:18 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a0907e5286000c4f3.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 11 Sep 2026 12:43:12 +0000
Received: from julian.home (areims-651-1-80-194.w90-18.abo.wanadoo.fr
 [90.18.187.194]) (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id D3AF781CB6;
 Fri, 11 Sep 2026 14:43:11 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=Bu12jXMJm8GjZhPvCvfsajc4jUJsd07geW0o9wwP8fo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=bWQm3gUEYpSCVtEFrZFO5Rgx4ch13K97cjanQ5UkFGpsvRV8472LtTSJeuNJZwhIUv8bjLGAl
 mj5KU02AXzEaplaSQ7dyDueotYxoVpVsBu/6xP41Vq/VPTiQi1a3d9QsA3i/8A3Why/mhF7y0q3
 kmjNtA74CXP5NbYGKtSi/xfYBmKsrHUejDSGliutmXSjoD07yrQERIlftP6EO5Abg/XcWzaiDkL
 D7EiZS+SB9vtf86OYlVr3RRn1na78tarjfVDH2kubhG2NmCjqe3Te3j4Kt2Z/9subhCxmSr0KEh
 8w7bKYX1y+2mse1KQByFkigAImq4npAEZu4caezE876w==
X-Zone-Loop: 39f8d28d5a3727b069b3e51300e71da283f345cd7597
x-campaign-type: default
x-transaction-id: f0ed48fe-367a-4889-94f7-50655f004c95
x-swg-uid: 01-80eeb00b-d9b4-43b7-b510-7c615dd06609
X-Mailer: Sweego
Message-ID:
 <1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3@vates.tech>
x-swg-bid: 1789130592.8631fc262581453bbf619ec5b2062170.1a0907e5286000c4f3
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
Subject: [PATCH v5 0/6] Fix ARM domcreate
Date: Fri, 11 Sep 2026 14:43:03 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.b1.3fe94993bb994924.1a0907e4fb6.d40a429c810fd403=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1789130592183
X-purgate-ID: tlsNG-720697/1789130598-F30B02AC-52A0DA57/0/0
X-purgate-type: clean
X-purgate-size: 4121

---=Part.b1.3fe94993bb994924.1a0907e4fb6.d40a429c810fd403=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Michal and Andrew,
Thank you Michal for the very thorough review on v4! I have addressed
The GICv2-compat-mode handling in arch_sanitise_domain_config(), the
gic_domctl_hw_version() naming, the XEN_DOMCTL_INTERFACE_VERSION bump,
and signalling to libxl whether the timer frequency came from the host
DT=2E
In regards to your other comment Michal "what guarantees mask is a
single bit?", and the answer is "nothing"=2E You're right there is nothing
that prevents anyone trying to check multiple bits or passing a bitmask,
e=2Eg=2E, "XXX|YYY"=2E This is why I went back to the original implementat=
ion=2E
In know your previous comment Andrew and I fully agree, and it will
probably get worse in the future to have tons of small 3 line inline
functions like this to check all sorts of features=2E But after trying for
a bit, I believe fixing this in a proper way, is more complicated than I
initially thought and merits its own patch series=2E Because adding this
to this series would bloat it with more somehow "unrelated" changes=2E
I'd rather leave a proper arch_capabilities_arm_has() as a separate
cleanup for later=2E Sorry for the back-and-forth on this one and I hope
you both agree=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
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
 docs/man/xl=2Ecfg=2E5=2Epod=2Ein                      |  9 +--
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 31 +++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 66 +++++++++++++++++--
 tools/libs/light/libxl_types=2Eidl              |  5 +-
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/python/xen/lowlevel/xc/xc=2Ec             | 18 ++++-
 xen/arch/arm/dom0less-build=2Ec                 |  3 +-
 xen/arch/arm/domain=2Ec                         | 31 ++++-----
 xen/arch/arm/domain_build=2Ec                   |  3 +-
 xen/arch/arm/domctl=2Ec                         |  2 +
 xen/arch/arm/firmware/sci=2Ec                   |  2 +-
 xen/arch/arm/firmware/scmi-smc=2Ec              |  2 +-
 xen/arch/arm/gic=2Ec                            | 16 +++++
 xen/arch/arm/include/asm/firmware/sci=2Eh       |  6 +-
 xen/arch/arm/include/asm/gic=2Eh                |  6 ++
 xen/arch/arm/include/asm/time=2Eh               |  7 +-
 xen/arch/arm/include/asm/vgic=2Eh               |  6 ++
 xen/arch/arm/include/asm/vtimer=2Eh             |  3 +-
 xen/arch/arm/sysctl=2Ec                         | 39 +++++++++++
 xen/arch/arm/time=2Ec                           |  9 ++-
 xen/arch/arm/vgic-v2=2Ec                        |  5 ++
 xen/arch/arm/vgic/vgic-v2=2Ec                   |  5 ++
 xen/arch/arm/vtimer=2Ec                         |  4 +-
 xen/arch/ppc/stubs=2Ec                          |  2 +-
 xen/arch/riscv/domain=2Ec                       |  2 +-
 xen/arch/x86/domain=2Ec                         | 16 ++---
 xen/include/public/arch-arm=2Eh                 | 18 +----
 xen/include/public/domctl=2Eh                   |  4 +-
 xen/include/public/sysctl=2Eh                   | 22 ++++++-
 xen/include/xen/sched=2Eh                       |  5 +-
 33 files changed, 273 insertions(+), 81 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.b1.3fe94993bb994924.1a0907e4fb6.d40a429c810fd403=---

