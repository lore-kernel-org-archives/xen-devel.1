Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9718ECCA462
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 08:13:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451358.1666424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHd40-0003Fe-Tr; Fri, 16 Oct 2026 08:13:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451358.1666424; Fri, 16 Oct 2026 08:13:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHd40-0003FW-QS; Fri, 16 Oct 2026 08:13:16 +0000
Received: by outflank-mailman (input) for mailman id 1451358;
 Fri, 16 Oct 2026 08:13:15 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@swg.vates.tech>)
 id 1xHd3y-0003EL-VR
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 08:13:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHd3y-00BUkZ-94
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 10:13:14 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@swg.vates.tech>)
 id 6ad1dc90-2eae-0a2a0a5409dd-0a2a45059392-18
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:13:14 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@swg.vates.tech>)
 id 6ad1dc99-4cb1-0a2a45050019-b9ff1c12898d-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 10:13:13 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a143c59b630008425.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 16 Oct 2026 08:13:06 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2620981F66;
 Fri, 16 Oct 2026 10:13:05 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=9FCW1ovmsuh4LQMziM4l8rX0n2bWAlb24SYEhSIzF4o=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=ozEX/Jv/eK15Rc6oJTBYnwzHkr3sQrs+AO6nZG+/2DTlq/pQI6cWrZKRHnhL8vvt71TuuM53f
 6zrFqMaKdK/9pUQCjFTvf10YkK9xnTTrak3g5oCe08T3hyGFzt7h08p0BW81rvPPhef0dPz9m2g
 sz0B9yKrMRHojGhGigHnNvoSQqNNyf/qaD4ep9dqRuhRm9veAXaSLKXtqMCce0HenqoAcAfUHJz
 jbjr9WlR5kin9I1P/ub77E/pLvlIRGQOZM7C9jRYrWVooNaJlyu9ENMWy2RRbOx1FeogfhApuqA
 cPI2HlFys7OCAnYKGRCI87iDz1NhfDt6p4U3wZdgoZLA==
X-Zone-Loop: 35ac006f04dbba7b25dee3612280b9204ade4af64f79
x-campaign-type: default
x-transaction-id: b693572a-8234-42ee-9be8-317a5f8d3b7a
x-swg-uid: 01-be1080bd-1de7-4074-a487-f667f0288d83
X-Mailer: Sweego
Message-ID:
 <1792138386.8631fc262581453bbf619ec5b2062170.1a143c59b630008425@vates.tech>
x-swg-bid: 1792138386.8631fc262581453bbf619ec5b2062170.1a143c59b630008425
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH 0/1] xem/arm: populate a default P2M pool for new domains
Date: Fri, 16 Oct 2026 10:12:59 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.27f.7d2f308c011a6a90.1a143c598c9.3a48100d0bacd573=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792138385614
X-purgate-ID: tlsNG-c201ff/1792138394-718AE2A1-40810A81/0/0
X-purgate-type: clean
X-purgate-size: 972

---=Part.27f.7d2f308c011a6a90.1a143c598c9.3a48100d0bacd573=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Andrew and Michal,
this is a small fix on XEN side to initialize the p2m page pool when a
domain is created=2E Then the call in the tests goes away again, and we
"match" the behaviour of x86 (which also inits the page pool, although
with more pages)=2E I only restored the call that was removed in
9c962e07fb, with the same 16 pages=2E What do you think?

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>
---
Julian Vetter (1):
  xen/arm: populate a default P2M pool for new domains

 xen/arch/arm/mmu/p2m=2Ec | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.27f.7d2f308c011a6a90.1a143c598c9.3a48100d0bacd573=---

