Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6F2CA9EC5
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 13:37:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446344.1662455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGCu-00074e-36; Mon, 12 Oct 2026 13:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446344.1662455; Mon, 12 Oct 2026 13:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGGCu-00074X-0G; Mon, 12 Oct 2026 13:36:48 +0000
Received: by outflank-mailman (input) for mailman id 1446344;
 Mon, 12 Oct 2026 13:36:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@swg.vates.tech>)
 id 1xGGCs-00074N-Ix
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 13:36:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGGCr-005hPv-Kr
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 15:36:45 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@swg.vates.tech>)
 id 6acce266-8faa-0a2a0a5109dd-0a2a45059436-28
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:36:45 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@swg.vates.tech>)
 id 6acce26d-4cb1-0a2a45050019-b9ff1c23a931-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 15:36:45 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a13054627300080d7.00a for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 12 Oct 2026 13:36:39 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4959682A40;
 Mon, 12 Oct 2026 15:36:37 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=50Mgym9OX6V13CDIzVYNCyk8IJEkPQKAgU4UfPE2DeQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=haI4p/0/lD7Z23V+98CJaMnCpPfMQURKf9eslfe1OTePCXmcJkEhsNiHHgDyLltzeSVpd8uGY
 v0D8xup6bnUFqLboXsoetmsv5qNUazP7mRqMgEmSme9M5Z9xe/UnILIFj9M95sCsYO6x88O3Lnp
 e13svS2iJgiVLrsjHcwxGCwO/7WxUEtv/0L00adDJ3GKf78OYI8te5bBQ/+zXEyrvmwhxrJqpEN
 ZuvRaBiLRfaxXxn+LUHnNT9AvcKDJlbgaHWX4BkQqGmZf/sNFK27UrnrhYvJzTQGCZAL3umreCQ
 tMbXlqBpaExTj0C+1rrr6kM3WXEwcU7hVpED8Z/ntrYA==
X-Zone-Loop: 7ba81f3a49fa356b68fda4f0157d80d9facdd97fd540
x-campaign-type: default
x-transaction-id: d82ce4e0-6a47-42a0-8869-9cf0a87faf8f
x-swg-uid: 01-3cae287e-f71e-4278-b57f-f080bc2f5f39
X-Mailer: Sweego
Message-ID:
 <1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7@vates.tech>
x-swg-bid: 1791812199.8631fc262581453bbf619ec5b2062170.1a13054627300080d7
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
Subject: [PATCH v7 0/5] Fix ARM domcreate
Date: Mon, 12 Oct 2026 15:36:30 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.ff.847a8b894d3f4814.1a130545f9f.35a900a5b2e69665=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791812198308
X-purgate-ID: tlsNG-c201ff/1791812205-F58AE2A1-26720C8B/0/0
X-purgate-type: clean
X-purgate-size: 3384

---=Part.ff.847a8b894d3f4814.1a130545f9f.35a900a5b2e69665=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Michal and Anthony,
thank you for the reviews and acks! Michal, I have addressed your
remaining remarks on the "xen/arm: report clock_frequency via sysctl
physinfo, not createdomain" patch=2E The golang bindings are regenerated
for the new arm_clock_frequency_hz physinfo field, and
alloc_domaininfo() no longer references the removed clock_frequency
field=2E Apart from that I have collected the Acked-by/Reviewed-by tags=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

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
 tools/golang/xenlight/helpers=2Egen=2Ego          |  2 +
 tools/golang/xenlight/types=2Egen=2Ego            |  1 +
 =2E=2E=2E/include/xen-tools/arm-arch-capabilities=2Eh | 31 ++++++++
 tools/libs/light/libxl=2Ec                      |  1 +
 tools/libs/light/libxl_arm=2Ec                  | 72 +++++++++++++++++--
 tools/libs/light/libxl_types=2Eidl              |  1 +
 tools/ocaml/libs/xc/xenctrl=2Eml                |  1 -
 tools/ocaml/libs/xc/xenctrl=2Emli               |  1 -
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec           |  5 +-
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
 35 files changed, 269 insertions(+), 83 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.ff.847a8b894d3f4814.1a130545f9f.35a900a5b2e69665=---

