Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A1CA5FDD
	for <xen-devel@archiver.kernel.org>; Sat,  3 Oct 2026 07:18:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1439698.1657922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCu0b-0000wh-D2; Sat, 03 Oct 2026 07:18:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1439698.1657922; Sat, 03 Oct 2026 07:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCu0b-0000wa-A4; Sat, 03 Oct 2026 07:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1439698;
 Sat, 03 Oct 2026 07:18:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@swg.vates.tech>)
 id 1xCu0Z-0000wU-L4
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2026 07:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCu0Y-006vYJ-Iw
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2026 09:18:10 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@swg.vates.tech>)
 id 6ac0abd6-8faa-0a2a0a5109dd-0a2a450a8582-46
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2026 09:18:10 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@swg.vates.tech>)
 id 6ac0ac31-f2d2-0a2a450a0019-b9ff1c228be9-3
 for <xen-devel@lists.xenproject.org>; Sat, 03 Oct 2026 09:18:10 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a100a0936a0003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 03 Oct 2026 07:18:05 +0000
Received: from Skynet-1 (lfbn-gre-1-317-75.w90-112.abo.wanadoo.fr
 [90.112.38.75]) (Authenticated sender: olivier.lambert@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id 80A7581DB5;
 Sat,  3 Oct 2026 09:18:04 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=kuhMXlzLQhzBkqyeUZIQiDM9y+82KwWx/ujm11Nry/8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=UNNRGC+/ZZWlHVpKtJBPEpIMlgw9tYXAeRReER31ZUYd9wgZ39gSush1Sk06Zb9twLuVcwXVd
 fyN9MbnPQuVaJipwfjBf+t3HuGSYSf4DHvL4DYBlvD50lKFBNodGqMbE7rGTqUnCexNC6yk0zoI
 lUIgwUm6Go1suvXmPyX2J7zPoXwj2u6ryxN3QyieubuRr/MH9JxVgooLZZkTlZg8WgJL+Hl5Oug
 eNbEUBsNTVjj1hvCM+xJL2y/tE2Kq6dv0a/fCA9gTgemhDbNZPjCx7HG/LZtMOt/S94Qa4uwMIG
 hTHfk/5Nx/SrVicqiAyZNt0WHEq7SD9A6AMzkPAq6/Dg==
X-Zone-Loop: ca38c5e183fd368921df6943f3ad47bbde0e5e836044
x-campaign-type: default
x-transaction-id: c06c0669-3c46-4e5f-bf3b-c9b2f401764b
x-swg-uid: 01-c9b4bd64-35ea-48d0-9d6d-542ce6be78d8
X-Mailer: Sweego
Message-ID:
 <1791011886.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66@vates.tech>
x-swg-bid: 1791011886.8631fc262581453bbf619ec5b2062170.1a100a0936a0003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Olivier Lambert <olivier.lambert@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxenstat: don't lose all VIFs when dom0 has no Linux bridge
Date: Sat,  3 Oct 2026 07:17:43 +0000
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.600.859a17acc0054a89.1a100a08e37.e03ae745e3f7e19f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791011884603
X-purgate-ID: tlsNG-4011c0/1791011890-593C4CFC-0C8114A7/0/0
X-purgate-type: clean
X-purgate-size: 2191

---=Part.600.859a17acc0054a89.1a100a08e37.e03ae745e3f7e19f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

xenstat_collect_networks() looks for a Linux bridge (a
/sys/class/net/*/bridge directory) so that, with bonding, dom0 can be
given the bridge's counters=2E When there is none, as on hosts using Open
vSwitch (the XCP-ng default), routed networking or only libvirt's
virbr0 (which is excluded on purpose), getBridge() leaves devBridge
empty=2E strstr(iface, "") then matches every interface, and devNoBridge
is just "p", so every VIF with a standard name (vifN=2EM, vifN=2EM-emu)
takes the bridge branch instead of being attached to its domain=2E Every
domain ends up with zero networks, and xentop shows NETS 0=2E

Only take the bridge branch when a bridge was actually found=2E

Fixes: 1fd93d4f8cb8 ("xenstat: Linux dom0 statistics for case we use netwo=
rk bonding")
Assisted-by: Claude-Code:claude-opus-5-5
Signed-off-by: Olivier Lambert <olivier=2Elambert@vates=2Etech>
---
 tools/libs/stat/xenstat_linux=2Ec | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/libs/stat/xenstat_linux=2Ec b/tools/libs/stat/xenstat_l=
inux=2Ec
index b60e3fdcab=2E=2E2a7d2f1a96 100644
--- a/tools/libs/stat/xenstat_linux=2Ec
+++ b/tools/libs/stat/xenstat_linux=2Ec
@@ -322,7 +322,8 @@ int xenstat_collect_networks(xenstat_node * node)
=20
 		/* If the device parsed is network bridge and both tx & rx packets are =
zero, we are most */
 		/* likely using bonding so we alter the configuration for dom0 to have =
bridge stats */
-		if ((strstr(iface, devBridge) !=3D NULL) &&
+		if ((devBridge[0] !=3D '\0') &&
+		    (strstr(iface, devBridge) !=3D NULL) &&
 		    (strstr(iface, devNoBridge) =3D=3D NULL) &&
 		    ((domain =3D xenstat_node_domain(node, 0)) !=3D NULL)) {
 			for (i =3D 0; i < domain->num_networks; i++) {
--=20
2=2E53=2E0



-- 
Olivier Lambert | Vates CEO

XCP-ng & Xen Orchestra - Vates solutions
=
Book a meeting with me: https://calrs=2Evates=2Etech/u/olivier-lambert
web:=
 https://vates=2Etech
---=Part.600.859a17acc0054a89.1a100a08e37.e03ae745e3f7e19f=---

