Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D79C55174
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 03:09:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381074.1624637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqj2y-0005EM-Nd; Mon, 03 Aug 2026 03:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381074.1624637; Mon, 03 Aug 2026 03:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqj2y-0005EB-JT; Mon, 03 Aug 2026 03:09:00 +0000
Received: by outflank-mailman (input) for mailman id 1381074;
 Mon, 03 Aug 2026 03:09:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wqj2x-0005E5-Tm
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 03:09:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqj2w-00D8Rb-V0
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 05:08:59 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a700618-5cb7-0a2a0a5109dd-0a2a450181ca-24
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:08:58 +0200
Received: from [202.12.124.155] (helo=fhigh-b4-smtp.messagingengine.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a700649-5984-0a2a45010019-ca0c7c9baba9-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 05:08:58 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id DC1E47A0069;
 Sun,  2 Aug 2026 23:08:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sun, 02 Aug 2026 23:08:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 23:08:54 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm3 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1785726536; x=1785812936; bh=8Y5zAgxEseAiRyIU5rtwLgzJrStxXeP9
	ashJGawv7H0=; b=cwrN4W3qSRGAz02qkHf106xji4HXsY+mJ11SnCpqTkQr9Jy2
	ia+Uzp1M76hvgJc6tQq6lGcEbuMJ7/tmPh+/tZ6PTfkjTSfcFM6jGXjVozR19Spb
	fNVM86f2Yuk9LCwaSEllQybZBuVVlPePBbedmzbFTt6Mlne8zbrN9610ya2gTa8W
	UvMBWG7+B1bBAiE38/VkfN/DDKPw/bWwQ3M4DGBxZWdA7w/0b7V95FFKirwm+A+a
	uYpfvdMrnRF2xJ9Kdkk5xwBhjdCToAxWQ40PWNxj8wtu2PuhHvRo8ccytUVrkoJ/
	X3GvI3lsHiPTJkFD5RLDTm2YJevJQMb3HotH3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1785726536; x=1785812936; bh=8Y5zAgxEseAiRyIU5rtwLgzJrStx
	XeP9ashJGawv7H0=; b=W+x+6oHjtmnxSqC6fy0cGeFuYANhlnZvW4gGOwhZE8xW
	yeWr/IhWZhrktMTJnvWUTue0ATJ/Olg5qsAhklfnSQW8ow985bisgXHPgnMFIaJr
	+KTlrFQUg5TBxIszm93t5bcAceg+GZBFG/nPYs05gOpZH0rtO69Ah93l1eqBNJuz
	e+xYR+fIxn3JLba1nO4RGRagDC69hHCxzBUaYrlZhFBdMTBmnqGPo6Jtegb37rEW
	sxU4ZH4a03qqvS0kXIial2kLxk9xVJ/SlG9f9mO4x6HCykfDz+rTFDW3JXWoHTYt
	mEqJnfnae6rPCLPSgB/CVf5fcAGFRLGaXsQw5iKBCg==
X-ME-Sender: <xms:SAZwaiPtZBcdMRc1ZsSKm8WA3Mi2YZLP0mryzWv7QnOvDhCay6gaaA>
    <xme:SAZwal4f16ZkW771hswkno4821dFVwzsvVL6OFjkN7FKH5b_7lFjonUH2ttm2TI0v
    ikXdChO6sW2GA9WvU9n1YAF5KhEAyaGo0Z1d5DSVmBKgfwwKxM>
X-ME-Received: <xmr:SAZwatj-7j-5ZofF-m4NpkceNVU4mLPNm82gpTuzcOzjbMsqRpzlopiaLeziwEEC7uSsQF6oWLmfpR2lvU5UfSgGf_I8rQezE3ekQUBssfk>
X-ME-Proxy-Cause: dmFkZTEFiahVVmp40OOwjwusbdef2xUVvLhYW9x1MdKYU/g1FneGLwTqoe+iWVZNousYSB
    QeW1rFANIP0uiYR5no31tqR+Qrhe4OBqGcoAmgZ6bpVK02LmGHYiUJhTlNsGgb+7HvGr8F
    9x7ntapEphoghzsjaBvY++MRaQ60rOQ+pX/demLbBt8Jh20rMqojqse1WPeutn/PMC2DNb
    LfennEkKTRolsDMx6QQd1tZr1pa1L6r31pPNHg3GQnpnn467R5VE1qNrmjSWrQpCw0JtdZ
    0QjxpcHGItqsJLJcVsZUWVGtIZG1elGeW1G3m8pnXGp2Y2PDALndgoplbX6JkvQd6/OBrR
    V0yjyiSbeM1Y1vrrCe3mSZM3p82eNt9ZU321CKJCvqAbdKuEmbylSzNU7oDFnoaQU+sTfb
    VpMNI+LfvklywtexxgVCqcV/NzYfmoAoq0eSAoulg3ozQvrZBsKfZirHQYorJovRz11n+2
    o7cPh9iSJWWAkYdAGrYVtr006wgH7qAYnoKvEyhDv8GXd7ZR6rVIBuKZQEdMahTyh/0EwF
    5nrZst20hm9LrQ2gcBclrFV3jrbzs+37VHgaioNDXxUa7nhO+xtM1FtGj33CVcqhheiMOE
    /bpoUFaB+B0WeQphy100c2jtdZntrMUXjeit500SdSTjLbYGak0TIuJGmttA
X-ME-Proxy: <xmx:SAZwaidIekINY9yRkJGQj2ZI_M0zCBif10x6Alk7_jkuPKKTuGNGsg>
    <xmx:SAZwaty-3kkg0M4w-hy6QbJbcaeB8HRTyWagZO0oruBdAoAwLbnyxA>
    <xmx:SAZwap3S7MXccM__kLtMoEuJb42g1fr8OUNfbRWtotf9b6SaCTmTsg>
    <xmx:SAZwarzzcM1nHUZ9IQ4TdctWJ6W8YnTtwzRT7jsOmgVNhOYa9oB7eA>
    <xmx:SAZwallPxEMdIM-byb-E77FlDR8toO9MpHvakYVwdr46R0ryx6VcxkUm>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Jakub Kicinski <kuba@kernel.org>,
	xen-devel@lists.xenproject.org (moderated list:XEN HYPERVISOR INTERFACE)
Subject: [PATCH 1/2] xen/xenbus: log more information when device state got reset
Date: Mon,  3 Aug 2026 05:08:01 +0200
Message-ID: <20260803030822.4104093-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785726538-C5341757-6C0E60A0/0/0
X-purgate-type: clean
X-purgate-size: 887

Ease diagnosing what actually changed.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
 drivers/xen/xenbus/xenbus_probe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index eb260eceb4d2..a259c8f0fff4 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -686,7 +686,8 @@ void xenbus_dev_changed(const char *node, struct xen_bus_type *bus)
 			 * and new one needs to be probed.
 			 */
 			dev_warn(&dev->dev,
-				 "state reset occurred, reconnecting\n");
+				 "state reset occurred (xenstore state %u, local state %u, xenstore backend %u, local backend %u), reconnecting\n",
+				 state, dev->state, backend, dev->otherend_id);
 			dev->vanished = true;
 		}
 		if (dev->vanished) {
-- 
2.54.0


