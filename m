Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECF4606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=jr8VmSdM
Received: from list by lists.xenproject.org with outflank-mailman.1459257.1671247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFFO-0008O8-PC; Fri, 23 Oct 2026 13:23:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459257.1671247; Fri, 23 Oct 2026 13:23:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFFO-0008O1-Mc; Fri, 23 Oct 2026 13:23:50 +0000
Received: by outflank-mailman (input) for mailman id 1459257;
 Fri, 23 Oct 2026 13:23:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@swg.vates.tech>)
 id 1xKFFN-0008Nu-D4
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 13:23:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKFFM-00CqC0-Fa
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 15:23:48 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@swg.vates.tech>)
 id 6adb5fcc-e002-0a2a0a5209dd-0a2a4503cfbe-44
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 15:23:48 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@swg.vates.tech>)
 id 6adb5fe3-fae8-0a2a45030019-b9ff1c22ab73-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 15:23:48 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a168ee7993000f79f.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 23 Oct 2026 13:23:41 +0000
Received: from julian.home (82-67-211-29.subs.proxad.net [82.67.211.29])
 (Authenticated sender: julian.vetter@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 3A76A82A2E;
 Fri, 23 Oct 2026 15:23:40 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=+SB/8PrlB5OHIfE2Th+a8El9zCc4eoccXAwR9P9AS0Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=jr8VmSdMxV1I/IMr/8kjOQvQW1kylRvl41C3zhYyWj+eCK8F09Pgl291F+CGLjB4rpU+xAzkP
 YYQtd9i3ofQtrIdd9EjgIg5e4edJ/Z3rtZz/t2aGM6vCPC4p/Pkv1OPXG6jj4vlp5q3hoJznCuv
 b3QeCu5DVT0/D/fIvErwqZ7VXf6Pm7Dcj03f8ZfjNTFs8Vb5KA3l9xRseNXG3kTaABPjk/mMbC6
 Bjfu07HanAVLTgV6Cb5tpQZBBN4g9MiBFDcwkvyInMNgRrV0YvMdx6n4ZLnmWcDZwnlGRoTGPzL
 pvtHuVlwjDUzx+mvoGwiuqrOWd2eqG7AzFZ/b38zHNDw==
X-Zone-Loop: 9dda9f9242799d940dc150160b969d67b9782caa3ed5
x-campaign-type: default
x-transaction-id: 333836d4-744e-4141-aad1-80e4bd6cbcb5
x-swg-uid: 01-66f12a99-64fd-4812-828b-b7c000cfce1f
X-Mailer: Sweego
Message-ID:
 <1792761821.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f@vates.tech>
x-swg-bid: 1792761821.8631fc262581453bbf619ec5b2062170.1a168ee7993000f79f
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Julian Vetter <julian.vetter@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Julian Vetter <julian.vetter@vates.tech>
Subject: [PATCH v2 0/1] xen/arm: populate a default P2M pool for new domains
Date: Fri, 23 Oct 2026 15:23:34 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.182.1e3669d161aca86a.1a168ee7663.7593fa291705f890=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1792761820777
X-purgate-ID: tlsNG-33051d/1792761828-6DED24E9-E1B867EE/0/0
X-purgate-type: clean
X-purgate-size: 1791
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.182.1e3669d161aca86a.1a168ee7663.7593fa291705f890=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michal,
thanks a lot for your review=2E I agree that in my previous patch I did
neither explain the default pool, nor the 16 pages=2E I have refined the
commit message and explained that on x86 a domain is "usable" directly
after the XEN_DOMCTL_createdomain call, whereas on Arm there is an extra
(mandatory) step to do that the toolstack needs to know about=2E Andrew's
view was that this should be fixed in Xen, rather then in the tests (by
calling p2m_set_allocation() there)=2E

And you're also right that 16 is kind of meaningless, since, as far as I
understand was just for the minimal GICv2 mapping=2E But, yeah,
unfortunately, I couldn't use the formula from domain_p2m_pages()
directly, because the RAM size of the domain isn't yet known in
p2m_init()=2E I still use that formula but the RAM of the domain assumed
to be 0=2E For small domains, I guess this is enough to hold all the
stage-2 tables, but for bigger domains this needs tuning later by the
toolstack=2E Not sure if this is acceptable?

Signed-off-by: Julian Vetter <julian=2Evetter@vates=2Etech>

Julian Vetter (1):
  xen/arm: populate a default P2M pool for new domains

 xen/arch/arm/mmu/p2m=2Ec                  | 24 ++++++++++++++++++++++++
 xen/common/device-tree/dom0less-build=2Ec |  7 +------
 xen/include/xen/domain=2Eh                | 13 +++++++++++++
 3 files changed, 38 insertions(+), 6 deletions(-)

--=20
2=2E53=2E0



-- 
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orch=
estra - Vates solutions

web: https://vates=2Etech
---=Part.182.1e3669d161aca86a.1a168ee7663.7593fa291705f890=---

