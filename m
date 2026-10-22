Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCE606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 14:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=VVyLSrLY
Received: from list by lists.xenproject.org with outflank-mailman.1458265.1670638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJti9-0005Wv-AS; Thu, 22 Oct 2026 14:24:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458265.1670638; Thu, 22 Oct 2026 14:24:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJti9-0005Wo-7X; Thu, 22 Oct 2026 14:24:05 +0000
Received: by outflank-mailman (input) for mailman id 1458265;
 Thu, 22 Oct 2026 14:24:04 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@swg.vates.tech>)
 id 1xJti8-0005Wi-AQ
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:24:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJti7-007H4r-Na
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 16:24:03 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@swg.vates.tech>)
 id 6ada1c83-e002-0a2a0a5209dd-0a2a4505e58e-0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:24:03 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@swg.vates.tech>)
 id 6ada1c82-4cb1-0a2a45050019-b9ff1c23b5bb-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:24:02 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a163ff5306000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 14:23:59 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id AC65882AFC;
 Thu, 22 Oct 2026 16:23:58 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=vlWKZj/gYCSs7h+Jw/HshG+LXbNuQBcp1pR5RSaWgW0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=VVyLSrLYnNfXKaiaMsX3SJDxQ+r07OmDFOjR7CSd05lmHd6CPmGf0Zp984RkSUWYBZmsPsbxT
 BtiaFCfNV7isDmiV+JV7aas5Hh8Eoyu697q2DmJdIkw2ib/WiY4C/sekXVmky1+nczhCRS5xQzy
 TQHcOTpaTUpIWF74hSB9HxL5GP/nonGfSVsTEzP6KzVIIAKhC5vkFYmYXo6K5sxWLlGmijlxzkI
 hjom4cSjhlug848Mna2WE6lh9AC5+I+Xm5ez/vtgZzA0a6WKG/fuLsVRxVjsWnnhvZMNf6U5AHk
 Bix/cRN6iKpojQtUuOuQz+wffEBIv9z8vzZaD3Mitddw==
X-Zone-Loop: f7bd0419009f5549d7deb07481233154afa9fa16117a
x-campaign-type: default
x-transaction-id: fe0a471e-dcaa-4907-8f92-b05ee1e232d6
x-swg-uid: 01-dbd07b85-caf4-4b62-adb5-ad1830cc5431
X-Mailer: Sweego
Message-ID:
 <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
x-swg-bid: 1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 0/2] tools/ocaml: bindings needed to build ARM domains
Date: Thu, 22 Oct 2026 16:23:53 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.132.3cf5113902c4bef7.1a163ff503d.9c62f99227416224=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792679039037
X-purgate-ID: tlsNG-c201ff/1792679042-243112A1-0B0DF697/0/0
X-purgate-type: clean
X-purgate-size: 1859
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.132.3cf5113902c4bef7.1a163ff503d.9c62f99227416224=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
this series adds two bindings that are still missing for an OCaml
toolstack, to create and build ARM domains=2E

Patch 1 exposes the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 bits of
XEN_SYSCTL_physinfo in arm_physinfo_caps=2E Since
XEN_DOMCTL_CONFIG_GIC_NATIVE was removed, the toolstack has to pick a
concrete GIC version itself=2E The OCaml physinfo stub only reports the
SVE vector length on ARM, so OCaml toolstacks currently can't select a
GIC version=2E

Patch 2 adds bindings for XEN_DOMCTL_{get,set}_paging_mempool_size=2E The
existing shadow_allocation_{get,set} bindings use
XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION, which are x86-only and fail
with -ENOSYS on ARM, so there is no way to size the P2M pool of an ARM
domain from OCaml, as libxl does=2E

Even though I'm sending these patches as a series, they are somewhat
independent from each other=2E But together with the patch I sent earlier
today "tools/ocaml: implement stub_xc_domain_create() for ARM", they are
what xenopsd needs to create ARM domains=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Julian Vetter (2):
  tools/ocaml: expose the supported guest GIC versions in physinfo
  tools/ocaml: add bindings for the paging mempool size

 tools/ocaml/libs/xc/xenctrl=2Eml      |  7 +++++
 tools/ocaml/libs/xc/xenctrl=2Emli     |  6 +++++
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 40 ++++++++++++++++++++++++++++-
 3 files changed, 52 insertions(+), 1 deletion(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.132.3cf5113902c4bef7.1a163ff503d.9c62f99227416224=---

