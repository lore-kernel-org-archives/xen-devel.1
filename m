Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C9CA6007
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 15:06:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443481.1660793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpgu-0002pF-Qu; Thu, 08 Oct 2026 15:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443481.1660793; Thu, 08 Oct 2026 15:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEpgu-0002p8-OC; Thu, 08 Oct 2026 15:05:52 +0000
Received: by outflank-mailman (input) for mailman id 1443481;
 Thu, 08 Oct 2026 15:05:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1xEpgt-0002p2-NS
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 15:05:51 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEpgt-001cUA-40
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 17:05:51 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ac7b135-e002-0a2a0a5209dd-0a2a4508cd50-48
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 17:05:51 +0200
Received: from [103.168.172.153] (helo=fhigh-a2-smtp.messagingengine.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6ac7b149-f659-0a2a45080019-67a8ac9982a3-3
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 17:05:45 +0200
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id BD5631400080
 for <xen-devel@lists.xenproject.org>; Thu,  8 Oct 2026 11:05:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 08 Oct 2026 11:05:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 11:05:42 -0400 (EDT)
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
	 t=1791471944; x=1791558344; bh=V7CVtt8UjAOTc+v6GmcQPc4AI8cyfV3U
	gzoL9yePEMg=; b=eK28EMs8cB0BSu0aik+tOGTKqVwmxQj48O5qttOZr53Akeu0
	GoOthPAmIzVttrqus+n2h1hz2TOScVfddSgUQg4GvpPk7xVF3SeS0wfbyNBqbllt
	aid5M8O/laGQgn9olfbSvNiJZpkFu2cB9K71EPXGuHxme9Rp0PT3FWiUry5Tl31G
	M8asKIp9UFCeG2epyxifzPUcyQO6BasCHohmbDoek2q05e71i9mbZEgkvWuqBBFm
	9SMN15aqJlVUbPR5JRm21pX/7oWyv0lFCfrInR3TyQ0UmNn+X5JAGmR+0FQUYLF9
	vwhYl3+q95RDaiWjWg26Wf3i3kV1py7mLvxfDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791471944; x=1791558344; bh=V7CVtt8UjAOTc+v6GmcQPc4AI8cy
	fV3UgzoL9yePEMg=; b=r8zguwPgNaQ1oQrgOd/ALhu67Poq7HTBmCjOWFCgOmjC
	Ephlye3vaQ0UuW2VVqmqXzFfMoJwu3QrCdLdk4NfX/wYrsxJcxWnrL3pPoqckGAT
	sYK0EUME5qqR273q0W8YNeyow6PeGCKX98qvrBJSAiuA78Pejs4775UgFTKqVcdC
	qpGvRi+tgD1GVI8TqmlL9NKl6ByYC18E1xthW+deg0f10lkV5+o2di5elFkaa0q5
	ZU94kVRw5Bm7wtsTkhQwXGUQzvbcbPRMfkmr8ki6Mj5If1B4vwerG03Hp2FcPBOv
	PPCfBLr2UMGhvbElf/h2YhSnNQ5II87MC0Ef8CIwLg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=invisiblethingslab.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791471944; d=invisiblethingslab.com;
	mf=PG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+;
	rt=PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4=;
	s=fm1:rsa-sha256:YiZ5dU+E03SLJZi/NJKsQUoe5J80dRbS35q13e05YO+La9b
	yz/bR4nDiR773e661hJGJEYykm52Z6GcxLh2YlZ49OsyEi7+KlywRiooLzvIhO17
	NuzBdN7Z4bFvkV1aJLCw7uB1WcUvDuaaffOaUbWdal0SBUkcJu5S5s035m5GbVId
	lFZS/u5AnfO818AdjqDjNlbtQTehrCs1p4mQpNPDx/8o7XijaqzIaT2m6kayvYr1
	STmV2PeEglIb+p8JKxeFtrIkFAFtanW7U2nien8Op3y1EQ1DXfdfKIucqqog9fcC
	HCSQ8ZjN3LVOY4+BecpvycX6igGCBSX8iKZkAmA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:5mRXosrnGBEgCGXLFIEwNEa/+95B04CyOWenoFub1a0=:A6V6pYOhtSaPvokUUGE+GBYBUZa/rWHEUCzv3sjz8GE=;
X-ME-Sender: <xms:SLHHavG-DIwPBzttzsDS-MsJvzkkzZd1YBq7jNqF_I1SEI1fXUZ6DA>
    <xme:SLHHapOnQ6BKmgvO8NSQs1WCVJZ9PsVV2mQ_cJK-Y2rLST1iMGvQaG4EsjVNcgG3-
    XpPqY3qDGq49QQdKctgLq0N9O7_7GO1QT7zwIl7L7hiwQJdLGQ>
X-ME-Received: <xmr:SLHHag4hbQiNSXZ-nbDNDCsj8EnGJFSFzzptdo--Q4RxF3FnAr5bqX16Deab4KQP8zp-4wqJIHuljO2fKWj2YrbjL4o-jATtCchHaiRe9VsA0M4Xbhw>
X-ME-Proxy-Cause: dmFkZTEfqnYsk68pL9AE/ZkNtT8L3YnI3ip+ay8ekXGsMGpEkygu+is92NCH1vJY4KQvy4
    wnL7A7s8n64FXFwHqoGBwZE1oPuUWImnL2kgM7ijPxze1ZKNVdhMqb4b8ctCA4Xy7zBaaZ
    xBCyctcF+cbYwWot/AG8Q68Wm8rANUGyhIci8IKoLYLRAYhKtoWpKBDv7UJHr2WMs6+hQ9
    VwJNXNWry5wZm2HmY53KbtziPv2tiQ0dwGX5sG2eEFyH4HrwBhOKZjBTKHHmoxxac/IB3A
    H6g90xkY9Lo8kyv4QdhKOuB8tZjXF2qs137eiJlR3Cetb9mQNgsAvub1rdQcSU2GweFcP1
    8G3Wafr84DYgNASXAH2lMdOHyhnAOsX+2ow+dpAusUBBnGGeAKcudT8Y2xBOnjNGcYwNF1
    EUF7MPg7zltGgnb2TNW1AqIvthsqad2gMXYWAfHlOCpnLTkwvV2zK7AscjxoRdUxRuXA1k
    folLvvIM41Us1I9Goj13p6d0N7LM5D/ougDOWfvs7SUqubEdfZEY8MTzA06q+kAhrB5V3L
    3r7G5nHaNsPeWTbWFf8JGEpKFrLgzmBsN8f7qpLFoi5yTGcmY5/wy76/1I5TBDk4yukoTA
    RjDcgdJbRN3tAo1muh4NZUu8y1LVRYZ8MKFejXWB7dHJp6O3ouzN0stzZGIQ
X-ME-Proxy: <xmx:SLHHasjWkcBY7vC-2kRsxjKtSg0o9JlSdvCMWaY9DtTRe2aw_ZF_jQ>
    <xmx:SLHHalfZEYcLUgNZmodhsOHkbSdK1TRb6ag4JlpdkkoviGc4nLcMmQ>
    <xmx:SLHHakywGCMZfDWyZUR0z1UYy8dbZ2rv4tDqX0qYVqKhDtkSdG0gXg>
    <xmx:SLHHak0_wwU7MFMbcAIiuPqKn6pum2SsL51ZPuZbQcV3-fBfZeab8g>
    <xmx:SLHHakazgNNiITYF3i15JbYq-OAhyGjw3R15QygKRpmiTDc1Qpc82iyr>
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
Subject: [PATCH] drivers/char: add timeout for XHCI console cable
Date: Thu,  8 Oct 2026 17:05:23 +0200
Message-ID: <20261008150528.359731-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1791471951-D6F5F87B-69FEACE9/0/0
X-purgate-type: clean
X-purgate-size: 3791

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
 xen/drivers/char/xhci-dbc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index d85c8cd6c36a..3d02bda97999 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -851,9 +851,15 @@ static void dbc_reset_debug_port(struct dbc *dbc)
     }
 }
 
-static void dbc_enable_dbc(struct dbc *dbc)
+static bool dbc_enable_dbc(struct dbc *dbc)
 {
     struct dbc_reg *reg = dbc->dbc_reg;
+    s_time_t start;
+    /*
+     * Too early for proper time calibration, assume a 5GHz CPU and let it wait
+     * about 1s, with still reasonable timeout on a slower CPU.
+     */
+    unsigned long timeout_ticks = 5UL*1000*1000*1000;
 
     wmb();
     writel(readl(&reg->ctrl) | (1U << DBC_CTRL_DCE), &reg->ctrl);
@@ -870,8 +876,12 @@ static void dbc_enable_dbc(struct dbc *dbc)
     writel(readl(&reg->portsc) | (1U << DBC_PSC_PED), &reg->portsc);
     wmb();
 
-    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 )
+    start = rdtsc_ordered();
+    while ( (readl(&reg->ctrl) & (1U << DBC_CTRL_DCR)) == 0 &&
+            rdtsc_ordered() - start < timeout_ticks )
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


