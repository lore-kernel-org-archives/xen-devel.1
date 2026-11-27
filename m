Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311DA606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=Bsp+wyUC
Received: from list by lists.xenproject.org with outflank-mailman.1505212.1700079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxGs-0006Ak-Q1; Fri, 27 Nov 2026 14:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505212.1700079; Fri, 27 Nov 2026 14:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWxGs-0006Ad-Md; Fri, 27 Nov 2026 14:49:54 +0000
Received: by outflank-mailman (input) for mailman id 1505212;
 Fri, 27 Nov 2026 14:49:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@swg.vates.tech>)
 id 1xWxGr-0006AX-FT
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 14:49:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWxGq-00Fv8R-Fw
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 15:49:52 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@swg.vates.tech>)
 id 6b099876-bab6-0a2a0a5309dd-0a2a4505e8aa-42
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:49:52 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@swg.vates.tech>)
 id 6b099890-4cb1-0a2a45050019-b9ff1c23b5b5-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 15:49:52 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d7be52c0004767.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 14:49:48 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id B09A68343E;
 Fri, 27 Nov 2026 15:49:47 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=DdXcrSNShR7saT7fFVfpGQD5MPKThPr//qB47O1fmFo=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=Bsp+wyUCujq8KOttegv1rzH5WOJ3DGuqyTgz60PGyXLQjU7hnyizNnvSMynXpQaOI8IzVfSbM
 NGy2cJ4j1Xh87YiDSdFjutVwSvMv+XYWVO24YtLXy4v66ToDG69eKN3UaAkYGJm8x53cMqZ30AR
 yiobBsZFpkIfg+P1wscA2Ai3ISVCxApZGD5JXNrRCkFuWA5e4oWUNbrRLPVBHBb5hWgsrPmWzwl
 vl5UPuRNg+yMjftNpyglS74MjGI1H596qw7OLzKOfS7Tlal2qo4fDd3SjPoKzLVf7lVeAmjKi0A
 WCsLNBpqt6hBIMl2dgMDj6FGkBR1qbDyHbVFPFE29WTQ==
X-Zone-Loop: 87bcf97092c11a8ba17122314a9729df3cd0daadb48e
x-campaign-type: default
x-transaction-id: 1e80b942-1d71-4369-b3ed-7dcee7579b95
x-swg-uid: 01-0b591b3d-e03b-4103-9142-3549d5004056
X-Mailer: Sweego
Message-ID:
 <1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767@vates.tech>
x-swg-bid: 1795790988.8631fc262581453bbf619ec5b2062170.1a21d7be52c0004767
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <andriy.sultanov@vates.tech>,
	Guillaume Thouvenin <guillaume.thouvenin@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 0/2] tools/ocaml: extend the bindings test
Date: Fri, 27 Nov 2026 15:49:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.207.ea02f559ba99fdc0.1a21d7be30a.6874a784e62f16e5=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795790988043
X-purgate-ID: tlsNG-c201ff/1795790992-F62AB2A1-D418E6C7/0/0
X-purgate-type: clean
X-purgate-size: 1665
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.207.ea02f559ba99fdc0.1a21d7be30a.6874a784e62f16e5=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Andrew,
based on your initial skeleton in commit d97847e858f17b4, I have added
tests to check the Xenctrl C stubs against the types in xenctrl=2Emli, so
a mismatch isn't caught at build time=2E

These patches extend test-ocaml-bindings to check the values returned by
physinfo() and domain_getinfolist(), and to create a domain with some
values and read them back=2E

The series depends on "tools/ocaml: Add misc_flags in the x86 domaininfo
arch_config", which I posted separately:
https://lore=2Ekernel=2Eorg/xen-devel/1794838886=2E8631fc262581453bbf619ec=
5b2062170=2E1a1e4bbf7cb0006d3f@vates=2Etech/
Without it, the x86 checks of arch_config fail=2E

On x86 the test runs in the existing tools-tests jobs=2E I tested the Arm
parts under QEMU, with GICv2 and GICv3 for now, since there is no Arm CI
job running tools/tests yet=2E I'll send that later once again, once the
discussion on the p2m pool is settled=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Julian Vetter (2):
  tools/ocaml: check physinfo and domain_getinfolist in the bindings
    test
  tools/ocaml: check domain_create in the bindings test

 tools/ocaml/tests/bindings/main=2Eml | 230 ++++++++++++++++++++++++++++-
 1 file changed, 229 insertions(+), 1 deletion(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.207.ea02f559ba99fdc0.1a21d7be30a.6874a784e62f16e5=---

