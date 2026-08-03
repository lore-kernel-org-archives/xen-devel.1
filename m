Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DD9C55162
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 03:09:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381075.1624645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqj35-0005Rc-T1; Mon, 03 Aug 2026 03:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381075.1624645; Mon, 03 Aug 2026 03:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqj35-0005RV-QO; Mon, 03 Aug 2026 03:09:07 +0000
Received: by outflank-mailman (input) for mailman id 1381075;
 Mon, 03 Aug 2026 03:09:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wqj34-0005R7-Fq
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 03:09:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqj33-00D8Rb-PG
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:09:05 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a700643-5cb7-0a2a0a5109dd-0a2a4502d598-10
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:09:05 +0200
Received: from [202.12.124.155] (helo=fhigh-b4-smtp.messagingengine.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a70064c-6ca4-0a2a45020019-ca0c7c9bcf03-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:09:01 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E0F677A0019;
 Sun,  2 Aug 2026 23:08:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sun, 02 Aug 2026 23:09:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 23:08:58 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1785726539; x=1785812939; bh=AIC4GBmoae
	3FANeCYGGjXR4JXRqPhRLZ84Tvuc7wIyc=; b=qADUq64WMQ6gOVvlQdtk46guUw
	v0PecpGJCe3nkB3nFGQgFPz+QiJJZM0O7/2s3KoUBKcSto0fveiOROO0EyM42SSv
	NdgC2ZlGSZ0MSEXSKBBzZ+TDaDZGHfGOqxtD4yH0tM7fuiBRWCS+7t+Tho/GIMFK
	KZ/5oK/zPKLBWNgRxxAhxt5upwJmEhXzt4CvyrdxtqHkPzIbsow/tDltMZ1uiWan
	3Zu96q5dTVh9eZHuT22sl4eeyPIYwbWYiHZz+53mNdtMeGEDi9i4rQiVZcf7eII+
	Tb4PwB1pi5jo2CyHDjj5kIttGlp2tdyr6/6bCTkkAlsqeFUOL9meU9I8sNvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785726539; x=
	1785812939; bh=AIC4GBmoae3FANeCYGGjXR4JXRqPhRLZ84Tvuc7wIyc=; b=N
	TXgAljfpkzLzcsvsNA4Lu6G31VOi9xdy7uz7UHl0uGl1ZBbeDBgdb5GbkfCnWjou
	rPfvxp/sLYtQSTCETk8p7euz9EcdDpiQxoDRrX7uKPXXtIutQL8PlTN9ECy54VuU
	/pkuLs2sguLFYI67yXxXd025Ob4/sV3JpDjGiNazl7soJspz7pEQxxxnmKOAnf1T
	3ivRZ/I6swvGlWhaw+R4E5zxOTpWII9LXjYzl8oXWGOOUa3z7CLCJXNeEGE+bwHz
	iJ6RTc7WXwlUe5Jd81sh3rTIF1UWZyxIUQ4mFp0eTFsv03DrTBn3Old80FS+k9n9
	hpXakhMKTVTX8RCDfca5Q==
X-ME-Sender: <xms:SwZwakASJ0v1LtvRlN90wrzwAYmS62AhnfKKYvBTaCRv4U7_Rpe2hg>
    <xme:SwZwarf6lHqbogcLX8ObeBznwHKOBdg9mZZOG81APkO4XPr-weRjLqFYi-zon1_oE
    6hYxLEA0tnLfBW3XEEBAP6hKCTLGUFiXOqnH_aGUOBa5Hr7WkI>
X-ME-Received: <xmr:SwZwar1Z414lLLUVQxyQoQkXXAw87Zm_5hQKUF6W3GETGbPOGvXXWlAOGN-pHlVvQXjLXfyzly7_vz0a-E-pWxKqaZ1hLeg8pfSVDnCyBUc>
X-ME-Proxy-Cause: dmFkZTEwpDv/j60enwUL1UJovK5tXTOpuP+SK+CoSIq7LCkDblI6JGegUQoofHbAEAnGvT
    2WgLVckyPV5XFdyrVGVi3zRzttftvmTIpNXgwaCsmZQyy1Wq7AB80KuvWdz3HtjWBznKRO
    YqTXcyPTyrHDVVGYGYghLb9BlPINpgvfXxzBZdPROfUvA73iNoabD243iDQ2cJWJDYfwKf
    cs0XhU98QyiD/M/DY4Hz5Qiy7lZbhW3z8Ghs5pp3buJQxpFWdXvrT6ihLuxgnW4MXHWeZp
    Iwb8mvIC+LpEp990itYR+WCOpa25DzleigSNBpi7g4oWNLjklt/yhTSI+TyFh5I71gvcmk
    cp1Er+LY2bnKbm+qs7+wYqoMRneVGehuZ98opHpijgTvP+pCAhSw/EQF+QQSQP1wUS7Yt/
    iS6nS5GOwroOq/D9PBp7gj5axk3u0qIp/R9c6nWq0AkStvabjylE6Q7yANzBUxlQyM3vPY
    Al2c0QpMZ4e5Mj4Sj2QhFM0wJy5NMEbhuf9i648MpFv5nsGOwG6f76VZMH0ICRW4m7i+Ve
    h86JsDfdI3eEpvK959vJWqNOs1IDPfhx8Pd1kpDJmGaQQo/JEvNKk3ZPEg1ht48yqGaHxu
    DIKXsY1ZVX0h6V80SBOGxYXyGmNIzK5VI28oKxLJ1R9+ZW6oApulf1tyCH8w
X-ME-Proxy: <xmx:SwZwaqi5Slvuhh4CLrh2idc0Jcl8lIa_kttR42Q_n_HyeX1bvV3AVw>
    <xmx:SwZwasn4hKHJaZ20zppsI2cK4MioKTrgpcc9yj6qKf6r3FB5xWG7Tw>
    <xmx:SwZwaoZqOlwHpq345LhfOOC2yWMJT74tjUzMcfxnsT0qtechvVxHKQ>
    <xmx:SwZwavH3wZuzZlfs8I-S9fqrSBEiHnGWB_UcTZ3WHdFv2P4veotDSg>
    <xmx:SwZwalE1BjGN0WpDpAqSLALWrFJ16HH5Hyoe3WuIopffelWnQIL9wOgv>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
Subject: [PATCH 2/2] xen/xenbus: check otherend_id only after it has been initialized
Date: Mon,  3 Aug 2026 05:08:02 +0200
Message-ID: <20260803030822.4104093-2-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
References: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1785726541-30DC12AC-AA6F7039/0/0
X-purgate-type: clean
X-purgate-size: 1641

When device just got initialized (for example on module load), the
otherend_id field is initialized only after
xenbus_read_otherend_details() gets called. If xenstore watch triggers
xenbus_dev_changed() before that, it might consider still zeroed
otherend_id field (not matching actual xenstore content) as a sign of
device state reset. It can happen because xenstore watch are handled in
another thread (xenwatch), which can run in parallel to the initial
device probe running at module load. In that case, it would call
device_unregister(), which would deadlock against device probe from
module init.

Fix this by considering dev->otherend_id change only after dev->otherend
is set (which happen after otherend_id is initialized).

Fixes: e2dcf9065536 "xen/xenbus: better handle backend crash"
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index a259c8f0fff4..b42d8d2e5a33 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -680,7 +680,8 @@ void xenbus_dev_changed(const char *node, struct xen_bus_type *bus)
 							    dev->otherend_id);
 
 		if (state == XenbusStateInitialising &&
-		    (state != dev->state || backend != dev->otherend_id)) {
+		    (state != dev->state ||
+		     (dev->otherend && backend != dev->otherend_id))) {
 			/*
 			 * State has been reset, assume the old one vanished
 			 * and new one needs to be probed.
-- 
2.54.0


