Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14776C53200
	for <xen-devel@archiver.kernel.org>; Wed, 29 Jul 2026 10:01:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1375394.1622547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp15i-0004I2-Hp; Wed, 29 Jul 2026 10:00:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1375394.1622547; Wed, 29 Jul 2026 10:00:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wp15i-0004Hv-FC; Wed, 29 Jul 2026 10:00:46 +0000
Received: by outflank-mailman (input) for mailman id 1375394;
 Wed, 29 Jul 2026 10:00:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@swg.vates.tech>)
 id 1wp15g-0004Hn-SH
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 10:00:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wp15e-0078Xn-RU
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2026 12:00:42 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@swg.vates.tech>)
 id 6a69cf47-5cb7-0a2a0a5109dd-0a2a45029cb6-0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:00:39 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@swg.vates.tech>)
 id 6a69cf47-6ca4-0a2a45020019-b9ff1c23833f-3
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jul 2026 12:00:39 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19fad51a4be000e099.002 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 29 Jul 2026 10:00:36 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 07185832EE;
 Wed, 29 Jul 2026 12:00:32 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=O11NltHSfcI8sQnwgKyFoWUyCAF70PHUYiJe/o4K/no=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=SCCT+QBn/DrJsZSrjqk1qjAcWFuclXHNCdGp61T9u70jA99yrdQubnd/2y8IMhmfVK3jQsCOs
 liHk/cgdA0OegD0oG6I5R6CALk0v0UsWT+mxtUdzJZXocGL8Fm79hBta97CHTyZ/egaz88PiuRV
 huOk7q+HwWwahRlwJ8PIOQc8BvGSQLfPdc4YohkCbtVIAVWgf1425nh5GgwJExcFSNrXJRyiyZF
 Podw2dbnB4AV0VxIgIGXvHT1V2ke4TRDPBfc56xaXqJSwaCwF8SAiSv7vTh1lQjnwe/jeKjgXK/
 U3GldD9y4ddGKh77ySJLx3rfPnjQx7Bll6jRekPPGldg==
X-Zone-Loop: d652f5f009a5a4c2bc19ae79119898ac2cd2f128ab0a
x-campaign-type: default
x-transaction-id: 1d30ced3-8500-437c-9d8c-c1712c6ce556
x-swg-uid: 01-eab46b4d-7804-40d8-a54e-cf32ad9e552f
X-Mailer: Sweego
Message-ID:
 <1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099@vates.tech>
x-swg-bid: 1785319236.8631fc262581453bbf619ec5b2062170.19fad51a4be000e099
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>
Subject: [PATCH 0/5] Misc VT-d changes
Date: Wed, 29 Jul 2026 11:59:42 +0200
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.165c.edaf8452c0df9be8.19fad5192a9.295bae906c642e63=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1785319232170
X-purgate-ID: tlsNG-720697/1785319239-30BC02AC-7E16310A/0/0
X-purgate-type: clean
X-purgate-size: 1723

---=Part.165c.edaf8452c0df9be8.19fad5192a9.295bae906c642e63=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A small series of misc VT-d changes=2E

The first two sound like a potential security issue (compiler-related),
but not occuring in practice (discussed in security mailing list and
asked to be sent to public)=2E

The 3rd one displays from which IOMMU orginated a fault to help debugging=
=2E

The 4th one is a bugfix for machines with unhandled SAGAW (e=2Eg 5-level
pagetable support) to avoid "disabling passthrough" while we were errorneo=
usly
disabling the ability to configure Dom0 devices in "passthrough mode"=2E

Last patch moves the intremap table to xenheap to simplify the logic to ac=
cess
the entries and make it less error-prone=2E

No intended functionnal changes=2E

CI: https://gitlab=2Ecom/xen-project/people/tsnake41/xen/-/pipelines/27148=
30581

Teddy Astie (5):
  vtd: Ensure root entry is updated consistently
  vtd: Ensure context entry is cleared properly
  vtd: Print originating iommu on faults
  vtd: Don't disable hwdom passthrough on unhandled SAGAW bits
  vtd: Move intremap table to xenheap

 xen/drivers/passthrough/vtd/intremap=2Ec | 61 +++++++++-----------------
 xen/drivers/passthrough/vtd/iommu=2Ec    | 38 ++++++++--------
 xen/drivers/passthrough/vtd/iommu=2Eh    | 16 +------
 xen/drivers/passthrough/vtd/utils=2Ec    | 22 +++-------
 4 files changed, 45 insertions(+), 92 deletions(-)

--=20
2=2E54=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.165c.edaf8452c0df9be8.19fad5192a9.295bae906c642e63=---

