Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE2360A382B
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 14:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=OFwAh8xz
Received: from list by lists.xenproject.org with outflank-mailman.1458275.1670647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtlt-0006JE-Nx; Thu, 22 Oct 2026 14:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458275.1670647; Thu, 22 Oct 2026 14:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJtlt-0006J7-LE; Thu, 22 Oct 2026 14:27:57 +0000
Received: by outflank-mailman (input) for mailman id 1458275;
 Thu, 22 Oct 2026 14:27:56 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402dab1000f79f@swg.vates.tech>)
 id 1xJtls-0006Ip-Mg
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 14:27:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJtls-007EK4-0R
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 16:27:56 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402dab1000f79f@swg.vates.tech>)
 id 6ada1d60-8faa-0a2a0a5109dd-0a2a450382b0-38
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:27:55 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a16402dab1000f79f@swg.vates.tech>)
 id 6ada1d6b-fae8-0a2a45030019-b9ff1c128807-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 16:27:55 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a16402dab1000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 14:27:51 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 1179281F99;
 Thu, 22 Oct 2026 16:27:50 +0200 (CEST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=STba8BPhO18lctrNM4b/bVk5Yg4GFlOvgQptyFrgR8I=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=OFwAh8xz9d+Ir+phxkUd0U1Kc+3z8gFZqK1by0xXP15PVKTHiHImo89QZKi5m9C2K7/3xZg3u
 RD3aSUaFbpZvHASN888AjSYk6ZT7r7EDsZLjKgsUsGeGi8wKDgOSKqoLTiecrb6PL0tC8VNV16o
 NN6fT3eR2CxsXMvkHAKIvwtRNdm6GG+1XNXyqIyXXanrGHapDMmV66peUqIoLEGLj2kCoym9rqN
 DoqY7j80l6LiGZQR+wkyDuz1bz7tbDNScft8cbkZIYiQFSGVnVC5vkQSsHYUwng6jvkP1cLb1w5
 MCda4BQbdvUTAZ5SsXSih7XbjkMRM5LL6qAfyBJ3eScw==
X-Zone-Loop: 1c30074f350a1d778bc0123968c8dcddd671aae73271
x-campaign-type: default
x-transaction-id: 21b912bf-b9fe-4a62-9f7e-36c6ac59efe7
x-swg-uid: 01-e47c4b2b-104e-4855-b470-403bda12b39c
X-Mailer: Sweego
Message-ID:
 <1792679271.8631fc262581453bbf619ec5b2062170.1a16402dab1000f79f@vates.tech>
x-swg-bid: 1792679271.8631fc262581453bbf619ec5b2062170.1a16402dab1000f79f
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
Date: Thu, 22 Oct 2026 16:27:42 +0200
In-Reply-To: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
References: <1792679039.8631fc262581453bbf619ec5b2062170.1a163ff5306000f79f@vates.tech>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.134.35419e23abad15a7.1a16402d803.b4b42fc80b2cf2b1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792679270404
X-purgate-ID: tlsNG-33051d/1792679275-6DED24E9-E1DCED2C/0/0
X-purgate-type: clean
X-purgate-size: 1906
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.134.35419e23abad15a7.1a16402d803.b4b42fc80b2cf2b1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,
this series adds two OCaml bindings that are still missing for an OCaml
toolstack, such as xenopsd, to create and build ARM domains=2E

Patch 1 exposes the XEN_SYSCTL_PHYSCAP_ARM_GIC_V2/V3 bits of
XEN_SYSCTL_physinfo in arm_physinfo_caps=2E Since
XEN_DOMCTL_CONFIG_GIC_NATIVE was removed, the toolstack has to pick a
concrete GIC version itself, which libxl and the Python bindings
already do=2E The OCaml physinfo stub only reports the SVE vector length
on ARM, so OCaml toolstacks currently can't make that choice=2E

Patch 2 adds bindings for XEN_DOMCTL_{get,set}_paging_mempool_size=2E The
existing shadow_allocation_{get,set} bindings use
XEN_DOMCTL_SHADOW_OP_{GET,SET}_ALLOCATION, which are x86-only and fail
with -ENOSYS on ARM, so there is no way to size the P2M pool of an ARM
domain from OCaml, as libxl does=2E

The two patches are independent of each other and each applies on its
own to staging=2E Together with "tools/ocaml: implement
stub_xc_domain_create() for ARM" (currently under review), they are
what xenopsd needs to create ARM domains=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Julian Vetter (2):
  tools/ocaml: expose the supported guest GIC versions in physinfo
  tools/ocaml: add bindings for the paging mempool size

 tools/ocaml/libs/xc/xenctrl=2Eml      |  7 +++++
 tools/ocaml/libs/xc/xenctrl=2Emli     |  9 +++++++
 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 40 ++++++++++++++++++++++++++++-
 3 files changed, 55 insertions(+), 1 deletion(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.134.35419e23abad15a7.1a16402d803.b4b42fc80b2cf2b1=---

