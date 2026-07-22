Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4170EC4453A
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 09:30:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368261.1617711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmTHY-00079u-Mk; Wed, 22 Jul 2026 09:30:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368261.1617711; Wed, 22 Jul 2026 09:30:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmTHY-00079n-JJ; Wed, 22 Jul 2026 09:30:28 +0000
Received: by outflank-mailman (input) for mailman id 1368261;
 Wed, 22 Jul 2026 09:30:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f89297b37000edb5@swg.vates.tech>)
 id 1wmTHY-00079h-0k
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 09:30:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmTHW-0000h2-RA
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 11:30:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f89297b37000edb5@swg.vates.tech>)
 id 6a608dab-e002-0a2a0a5209dd-0a2a450bd4ea-40
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 11:30:26 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f89297b37000edb5@swg.vates.tech>)
 id 6a608db2-b7e8-0a2a450b0019-b9ff1c23995d-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 11:30:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f89297b37000edb5.004 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 22 Jul 2026 09:30:24 +0000
Received: from localhost.localdomain (155.223.66.37.rev.sfr.net
 [37.66.223.155]) (Authenticated sender: ngoc-tu.dinh@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2E9DC80FAC;
 Wed, 22 Jul 2026 11:30:24 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=BRqeZwjijEP4OcHTI411PO7Zn+FWK1XqABSJ6Q9FL1Q=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=qdPWZhHLvaGBwcCnBk6B5tLXxcJlWoaYxoOz3/XqzGTl0YgClbci0aotbgZg+VWGglXJd9ia1
 Zszm/baQGChpd5+OVMX+4phthkSMnOHssM6tPyo7b145Rt1C/nDkXXwfyyFNxqDqmffSU//Rjcg
 O43WbCIAlLEtTvvGoh9/X3mysyJkqIT6ziMYCrxW6wgyusl5YW0xMIQL1AxFZTjWw2r5T4whxLm
 TI9O9nk1zd9dc+hX1qmZ+Pwk96CbVITJpwa99SwC8S7O3iLCx5sZ3yLv43usk8Z5nnkm89joEBt
 NVeC1jC2C7FHEoSejhmPZA+Q/V5fq0CHGgfVxDkv4kEQ==
X-Zone-Loop: 0db72ed56aad6e2f2f7a0c9c357257fb24133df3d1e9
x-campaign-type: default
x-transaction-id: 4d28996d-f53f-45bd-a47d-d1f8a5aa23e9
x-swg-uid: 01-be8a2c96-c43a-4387-b907-c35a97bbaa42
X-Mailer: Sweego
Message-ID:
 <1784712625.8631fc262581453bbf619ec5b2062170.19f89297b37000edb5@vates.tech>
x-swg-bid: 1784712625.8631fc262581453bbf619ec5b2062170.19f89297b37000edb5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Tu Dinh <ngoc-tu.dinh@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	Tu Dinh <ngoc-tu.dinh@vates.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xenstore-paths: Specify ipvX/$INDEX/prefix
Date: Wed, 22 Jul 2026 09:30:06 +0000
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.ffd.4692c8deda396797.19f892978fe.3017f5dc57e3707c=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1784712624383
X-purgate-ID: tlsNG-42698a/1784712626-ABCD79EA-11E83321/0/0
X-purgate-type: clean
X-purgate-size: 1624

---=Part.ffd.4692c8deda396797.19f892978fe.3017f5dc57e3707c=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In the guest-reported IP address in xenstore, it's useful to know which
subnet it belongs to=2E

Add a specification for a subkey of each IP address, containing that
address's subnet prefix=2E

Signed-off-by: Tu Dinh <ngoc-tu=2Edinh@vates=2Etech>
---
 docs/misc/xenstore-paths=2Epandoc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/misc/xenstore-paths=2Epandoc b/docs/misc/xenstore-paths=
=2Epandoc
index 4994194e2b=2E=2Eb8b02e007a 100644
--- a/docs/misc/xenstore-paths=2Epandoc
+++ b/docs/misc/xenstore-paths=2Epandoc
@@ -564,6 +564,16 @@ address written in one of these paths to, for example=
, establish a VNC
 session to the guest (although clearly some level of trust is placed
 in the value supplied by the guest in this case)=2E
=20
+#### ~/attr/vif/$DEVID/ipv4/$INDEX/prefix =3D INTEGER [w]
+#### ~/attr/vif/$DEVID/ipv6/$INDEX/prefix =3D INTEGER [w]
+
+Paths of this form may be written by the guest to indicate the network
+prefix length of the IP address at the corresponding $INDEX=2E
+
+An IPv4 prefix value can be in the range of 0 to 32=2E
+
+An IPv6 prefix value can be in the range of 0 to 128=2E
+
 #### ~/error [w]
=20
 A domain writable path used by some PV drivers to pass error messages
--=20
2=2E55=2E0



-- 
Ngoc Tu Dinh | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates =
solutions

web: https://vates=2Etech
---=Part.ffd.4692c8deda396797.19f892978fe.3017f5dc57e3707c=---

