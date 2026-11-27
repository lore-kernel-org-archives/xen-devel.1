Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB30606A31E
	for <xen-devel@archiver.kernel.org>; Fri, 27 Nov 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=nkDjq41H
Received: from list by lists.xenproject.org with outflank-mailman.1505019.1699999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvQn-0002tb-67; Fri, 27 Nov 2026 12:52:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1505019.1699999; Fri, 27 Nov 2026 12:52:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWvQn-0002tU-2g; Fri, 27 Nov 2026 12:52:01 +0000
Received: by outflank-mailman (input) for mailman id 1505019;
 Fri, 27 Nov 2026 12:51:59 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@swg.vates.tech>)
 id 1xWvQk-0002tO-Lw
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 12:51:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWvQj-00ES9X-GW
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2026 13:51:57 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@swg.vates.tech>)
 id 6b097cd9-2eae-0a2a0a5409dd-0a2a4501a384-30
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:51:57 +0100
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@swg.vates.tech>)
 id 6b097cec-5bcc-0a2a45010019-b9ff1c12957b-3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Nov 2026 13:51:57 +0100
Received: from localhost
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a21d0ffa91000bb85.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 27 Nov 2026 12:51:56 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 29CEC82092;
 Fri, 27 Nov 2026 13:51:55 +0100 (CET)
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
 q=dns/txt; s=selector1; bh=eX9KLmTcrHEXQlMKP3JVxJL6L9WD2E+xT80KkjNPDkE=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=nkDjq41HibDYKzNXB7bzln5uqpW0zF6ruuR/OcNBbQqBR68AGebFzkVbdEgfPuXHeHgDOYP4R
 uQBZcw6808p9Gb08NBiwUIGKBf7Rn2GPa7LFA6BLxYG4WNNbPgMiKHKMO2Ra6ysXe1yFKQPKjYW
 j1pFHyRKnAOj6IcEf1L9+m86rhMK7MqGtYmu0unMibB9U8MQVLcFHByLpJgEm1W1kXu6SRRF2ix
 iSv75k3evfig7Piv4S9694ilul5TRft/sDvLI6dCbnKC3UAl1SNSmqECODcvDVcYl41pMRaMYHE
 YW9DWbeYpp8YSsiGUbd4uz0w/aIlF1ta5F3Xl5SPRAAQ==
X-Zone-Loop: a523d91f95a05c69d543b491195f6df045d1789fe227
x-campaign-type: default
x-transaction-id: 7c63deb1-4aad-4888-bdce-477610c73f14
x-swg-uid: 01-3c45b8b4-0b6c-4f2e-9280-fcb87a6904cd
X-Mailer: Sweego
Message-ID:
 <1795783916.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85@vates.tech>
x-swg-bid: 1795783916.8631fc262581453bbf619ec5b2062170.1a21d0ffa91000bb85
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 0/1] tools/tests: pick a GIC version for ARM test domains
Date: Fri, 27 Nov 2026 13:51:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.1ef.1faee466c4371fd7.1a21d0ff812.4bd0e6b93f8a281=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795783915538
X-purgate-ID: tlsNG-d62444/1795783917-4F94F5FD-25B19742/0/0
X-purgate-type: clean
X-purgate-size: 1012
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.1ef.1faee466c4371fd7.1a21d0ff812.4bd0e6b93f8a281=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you Andrew for your feedback! As you suggested I have split the
patch in two=2E Since, the P2M pool allocation isn't decided yet, I'm just
sending the GIC fix on its own first and will follow up on the P2M stuff
once that's settled=2E

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Julian Vetter (1):
  tools/tests: pick a GIC version for ARM test domains

 tools/tests/mem-claim/test-mem-claim=2Ec        |  8 ++++++++
 =2E=2E=2E/paging-mempool/test-paging-mempool=2Ec      | 19 ++++++++++++++=
+++++
 tools/tests/resource/test-resource=2Ec          | 11 +++++++++++
 3 files changed, 38 insertions(+)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.1ef.1faee466c4371fd7.1a21d0ff812.4bd0e6b93f8a281=---

