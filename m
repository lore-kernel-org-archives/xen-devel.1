Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3E6606A319
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2026 08:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=G/4GDtcL
Received: from list by lists.xenproject.org with outflank-mailman.1457863.1670369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJoIn-00074K-Gb; Thu, 22 Oct 2026 08:37:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457863.1670369; Thu, 22 Oct 2026 08:37:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJoIn-00074D-DB; Thu, 22 Oct 2026 08:37:33 +0000
Received: by outflank-mailman (input) for mailman id 1457863;
 Thu, 22 Oct 2026 08:37:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@swg.vates.tech>)
 id 1xJoIm-000747-9P
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 08:37:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJoIk-008Yj1-EX
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2026 10:37:30 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@swg.vates.tech>)
 id 6ad9cb47-e002-0a2a0a5209dd-0a2a4503da74-18
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 10:37:30 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@swg.vates.tech>)
 id 6ad9cb49-fae8-0a2a45030019-b9ff1c23ae47-3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 10:37:30 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a162c2110b000f79f.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 22 Oct 2026 08:37:27 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C38AA81AD1;
 Thu, 22 Oct 2026 10:37:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+704xng93SrmmfWhH0hFBiVyGpntHRf6eEGQOSEeYno=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=G/4GDtcLcNOAIHp2MdQrPOYQnAmOVRmIdjt3OvycSRxapEUOBW+PNHTfgUEyrzF018QPWeqSt
 qQaKs6IEIEE6/MLCF380KkY9pPPnFlGy6kzubuHqVC+KcHH/YIfWQNzdEiKDDy6MdQLH8ZRsQRJ
 S3DXOBC7IOiNp4tLcPWhRoB5nc6r7rOkEBMwaC8eG2v46IjDiviDWykKmqUPi5lz6E9HCcXGYkS
 lpp6QjwrQF2vOqxwDaaJM6HHig42d+OL2Ii0XEmv1a+Tu5rsPTPUckFfIM20zdqEU3lcYPrGlsP
 0rmKNvKdeoVW+3a81fFjRo54JQuzhZMt+Zfdcb7sieaw==
X-Zone-Loop: 2f1f84e66bf37622d31664c0a06eb0f193a3bf29d8f7
x-campaign-type: default
x-transaction-id: be42124a-acd3-4fef-9e54-bc1fcc079db6
x-swg-uid: 01-a3722898-8a08-4085-ba51-b4e43c3a2e7e
X-Mailer: Sweego
Message-ID:
 <1792658248.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f@vates.tech>
x-swg-bid: 1792658248.8631fc262581453bbf619ec5b2062170.1a162c2110b000f79f
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
Subject: [PATCH v2 0/1] tools/ocaml: implement stub_xc_domain_create() for ARM
Date: Thu, 22 Oct 2026 10:37:20 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e9.f888f7cddc1920eb.1a162c20de0.d05f59c1a13ac16d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792658247140
X-purgate-ID: tlsNG-33051d/1792658250-6C6DE4E9-5C76269A/0/0
X-purgate-type: clean
X-purgate-size: 1388
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.e9.f888f7cddc1920eb.1a162c20de0.d05f59c1a13ac16d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Andrew,
thank you for your feedback! I have addressed your two comments about
the OCaml types=2E

> type xen_arm_arch_domainconfig contains clock_frequency: int32; but
> you've just removed that from the hypercall=2E
>
> I suggest that we use the fact that this hypercall doesn't work on ARM
> at all to allow a minor breakage to remove that too=2E It will want to b=
e
> a prerequisite to this patch=2E

I'm not sure I fully understand what you mean here=2E The removal of the
clock_frequency from the hypercall (and from the OCaml side) is already
in staging with my earlier patch series (commit: baaa185201 "xen/arm:
report clock_frequency via sysctl physinfo, not createdomain")=2E So,
xen_arm_arch_domainconfig already only has gic_version and nr_spis=2E Is
this what you mean?

Andrii Sultanov (1):
  tools/ocaml: implement stub_xc_domain_create() for ARM

 tools/ocaml/libs/xc/xenctrl_stubs=2Ec | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.e9.f888f7cddc1920eb.1a162c20de0.d05f59c1a13ac16d=---

