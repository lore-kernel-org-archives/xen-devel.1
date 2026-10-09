Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44481CA601E
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 13:36:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444401.1661264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAlt-0004gu-U8; Fri, 09 Oct 2026 13:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444401.1661264; Fri, 09 Oct 2026 13:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xFAlt-0004gn-RQ; Fri, 09 Oct 2026 13:36:25 +0000
Received: by outflank-mailman (input) for mailman id 1444401;
 Fri, 09 Oct 2026 13:36:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xFAls-0004ge-5I
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 13:36:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xFAlr-00G9ik-Hx
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 15:36:23 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ac8edb6-e002-0a2a0a5209dd-0a2a4506aa7a-30
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:36:23 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ac8edd5-195a-0a2a45060019-67a8ac90948f-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 15:36:22 +0200
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id BB13EEC0011
 for <xen-devel@lists.xenproject.org>; Fri,  9 Oct 2026 09:36:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 09 Oct 2026 09:36:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Oct 2026 09:36:19 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm1 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:From:Message-ID:MIME-Version:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Transfer-Encoding:Content-Type:Date:Feedback-ID:From:Message-ID:MIME-Version:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm1;
	 t=1791552981; x=1791639381; bh=eXX7bS2mbjbkizKF4zKhStCw3lsDydTB
	T7bx3WXvOA4=; b=nNJy7JmXICst/tn1L87d54gMmNGltMpbqOTxCaHouqEc9KKv
	ik6PnofFZU+FhSTAmL7ank2P22X/nDyKjAwkgKFNtsyuBhd59VRMD68mElhhvfQj
	Pj2Nh9R2RBJEaXN9SzYL0395tsM/SHM1JDOSO8swFbvjYaCRv5qP+OBrJGjFXl/x
	FaXOrNlvJLDXkeOkWJKv8Is3DgrvTmTpnrl6qh2ihffxoRkS27eLpm2d7Vr1LJqK
	xgMMRjwAZUmYw4QK4KPXt07xB0chdN/K0J3e+K5tb3IltWJPolZjjERs6Zb0GkA4
	hADQNnpqlRDMD4LxITbHdzEyBfqsq4sHjkKvSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791552981; x=1791639381; bh=eXX7bS2mbjbkizKF4zKhStCw3lsD
	ydTBT7bx3WXvOA4=; b=NQIpbmCvYF2XegLyjdjvPOkj5y0P8vc/rVaWf3XB7rNQ
	Ki325tsZ9zv2/DQjcIDOxZNkwhm5/qTNP/sLYPJk/OJdAvYWjpsLFmHaXb2NOgJI
	AlO9TXJYrAerHJ5Ert1sIoza73dq3QhjLXK36rO6WDf/DsZlR7o0fBCj/AS0cKUX
	5kO+7/rK4kAkpu4L4NJ6d+py9Mzx9Ddrr54ESX7kn2t34QThXV/fd1sjBxZQeNxG
	ePvIobT7wrOMJLguhlQ/49jOLCvC7S7SdEQRLk3RQMMuSfiaQv6ulh5at7sSqcev
	8nOPE7/xkkot04afy8KykPROhOI9KU84wG/D383Yog==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791552981; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm1:rsa-sha256:NVftbXvxRFoIm41IVip0BxiQM4f2h0E+GtzS72B+FqE9eEr
	GnPNSjrTu4XXOHmU1s7WXjFAIIadJRRaoeRTtEv+XQXZQJcn5DLCQgq22W+CkMq1
	CYn0OJQHi4Vzns83ZHiZB14HgkZ/bqut/2dC2fjyeZwf+Xw5LQ+FYd2KZbRg+Z+b
	0DjusDZB3UbYlivP+99W5BJv4Cowf9Xp4fdeCLF5hm2i2PhNICyWyW8NnUYZ0dCS
	SGVz4ikuNVBi4wQxY3cFrkYUVLaWjGecjHJS/gSmngkeySjGOSfZY504lpK59NGw
	OYUYZkBTFcgPiAeeSMDWFbYibJzeYxkMENKtt0A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:7uwuMWbTpbHUAfMaQVF36ZGVCwEwIZ2gjszEZTuPovo=:PpZLmPaIJnAfjiy/T1yKfWLq73e3pYLK+GJXD1hQdoM=;
X-ME-Sender: <xms:1e3IamHVfHzS50Wg38LX-OGbSSIy3mtK1vRotlfg1Wj_yGd7epANEw>
    <xme:1e3Iap7g-y5zft5HX5KeayzsqQHQR1ef5gYcTR6aeyBjV_QTcxstoLYxmItSwxTYD
    Kbc817-32bz94Zx8mRJdp59OifeKeYsqUpiCtd1rFSu11XYNg>
X-ME-Received: <xmr:1e3Iajxs0unxzwEcu-1CK01yTBDiRkWRi6rRxtWYWQS1pjs7O-WjYHVnoYB0MinG4vTHZzNw9s9cm4VCPIzwKM7Vg8ExFJqPSeJu6S7Hs7o6j0SEKoU>
X-ME-Proxy-Cause: dmFkZTGlrcD0Gt8OPHBnJoYu0c5vrj1VXyOadjJd/B0SotCdtEJeJKOcxmTCBOJ8jYevPz
    nfRpRYAQMyP9BfRZxXnYeRAtcy4tAYVR/Um/W0RXo3lXQjgc94YyT7Drgzt0RUe+BlS1Yu
    e592xh2497B1+GEus7HXoFClW6h26UwGadJ7gpc6r8+MCDb0ad5zU/JtTKir0WfFUZ8IPv
    rmkr7bhOkA9YryVTjR+FdJ4jMpfsodE9+m9D1S5bKLQvRe/X7t96JDTz/QMMckgs0iKmlB
    c5PgGFV3k3c50pLaNrCZcEVI/Pb840fydYflRK5s0iRC5QrAG9TXacR45qJQMRd6ESESq0
    6ku12fveDAnLAn/pKTs2Ofbu9vIJ+XO1TM/eJqeiduXnTp8mzvFtUwPedWL6uP8fsdRpVL
    BwtYF2v2DaTEHNeqj5DJKJDnByz401wzC3i+ap63Oc7zpeIEnrK/Ir5mCKSBOwL+T6Hd1x
    ViKZAjWtQNIbn1T0eO+zyass1IlLNs/74g4/AqXj40/S0lOM+mXoZUGG677nsnSbzI+QBw
    8C62DWHjdYxO23pRSyC3/imXYSf5XEZNYeXjmUY75SQT85faL7hMpf2LWEedD9Shg0boDr
    +TLe6ww/Fn5mXF0yJQCI2nkG+hTldYkQ/+XBCjDdyridIFlujNJWNzteBzlA
X-ME-Proxy: <xmx:1e3IagOzsnjKegK1fXqZ8hl8OW1YwdgXyJlXxpCX5XwisUzHiRiVmA>
    <xmx:1e3IahkaLxMEOpTwwazJJQzPrd2jEPNxbLlXzcawd-v3TiRxNXal2g>
    <xmx:1e3IatRILktzabX3yjasyKcIKwS6ip26LedaHJicX427-KXemaLgHg>
    <xmx:1e3IaoV2mlx04Xdb2mwBZQrOCsbfvOL8axcUf6i8N8kRV8IdRMES4w>
    <xmx:1e3Iald1YsVGi9rfiByC9RhWxUDgrvqbUR6u4aV55gp4xCsg6FbZyyyW>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] drivers/char: add timeout for XHCI console cable
Date: Fri,  9 Oct 2026 15:35:59 +0200
Message-ID: <20261009133608.364312-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791552983-F7ACA77B-9D273087/0/0
X-purgate-type: clean
X-purgate-size: 3851

Do not wait indefinitely for XHCI to configure console connection. If
the cable is not plugged in, timeout after about 1s and continue boot.
If the cable is plugged in later, the console will be activated then
(see final part of dbc_ensure_running()). When timeout occurs, print a
warning message - it will be saved in the console ring buffer, to be
later retrieved from dom0, or possibly later printed when the cable is
finally connected. But, do not print the warning when waiting after
controller reset, as that may have been called from from console
dbc_putc() and printing here would result in (possibly infinite)
recursion.

Try the timeout to be about 1s, which is way above time needed for
configuring already connected cable. But, since this part runs very
early in the Xen startup, time is not calibrated yet, and functions like
NOW() do not work yet. Use raw TSC and estimate needed time to be at
least 1s on a fast CPU (5GHz), and possibly longer on a slower one. This
is not very accurate method, but fortunately it doesn't need to be.

This also helps with similar situation on resuming from suspend - if
cable got unplugged in the meantime, system will not hang waiting for
the console anymore. And finally, on some systems, when dom0 is also
allowed to access the USB controller, it may put the device into low
power mode that in some older controllers (for example Kaby Lake)
disables also debug capability. In such a case, adding a timeout allows
the system to resume, then dom0 can wake up the controller and Xen will
resume XHCI console.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
- use get_cycles() and cycles_t type (Jan)
---
 xen/drivers/char/xhci-dbc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index d85c8cd6c36a..ddb1051b0832 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -851,9 +851,15 @@ static void dbc_reset_debug_port(struct dbc *dbc)
     }
 }
 
-static void dbc_enable_dbc(struct dbc *dbc)
+static bool dbc_enable_dbc(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
+    cycles_t start;
+    /*
+     * Too early for proper time calibration, assume a 5GHz CPU and let it wait
+     * about 1s, with still reasonable timeout on a slower CPU.
+     */
+    cycles_t timeout_ticks = 5UL * 1000 * 1000 * 1000;
 
     wmb();
     writel(readl(&reg->ctrl) | (1U << DBC_CTRL_DCE), &reg->ctrl);
@@ -870,8 +876,12 @@ static void dbc_enable_dbc(struct dbc *dbc)
     writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
     wmb();
 
-    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
+    start = get_cycles();
+    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 &&
+            get_cycles() - start < timeout_ticks )
         cpu_relax();
+
+    return readl(&reg->ctrl) & (1U << DBC_CTRL_DCR);
 }
 
 static void dbc_disable_dbc(struct dbc *dbc)
@@ -970,7 +980,8 @@ static bool __init dbc_open(struct dbc *dbc)
 
     dbc_init_work_ring(dbc, &dbc->dbc_owork);
     dbc_init_work_ring(dbc, &dbc->dbc_iwork);
-    dbc_enable_dbc(dbc);
+    if ( !dbc_enable_dbc(dbc) )
+        printk(XENLOG_WARNING "Timeout waiting for XHCI console cable\n");
     dbc->open = true;
 
     return true;
@@ -1307,7 +1318,8 @@ static void cf_check dbc_uart_resume(struct serial_port *port)
         return;
     }
 
-    dbc_enable_dbc(dbc);
+    if ( !dbc_enable_dbc(dbc) )
+        printk(XENLOG_WARNING "Timeout waiting for XHCI console cable\n");
     dbc->suspended = false;
     dbc_flush(dbc, &dbc->dbc_oring, &dbc->dbc_owork);
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
-- 
2.54.0


