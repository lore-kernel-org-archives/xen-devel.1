Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F38C5AD5A
	for <xen-devel@archiver.kernel.org>; Sun,  9 Aug 2026 22:39:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387167.1628474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtC9z-0007eK-3i; Sun, 09 Aug 2026 22:38:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387167.1628474; Sun, 09 Aug 2026 22:38:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtC9y-0007e9-V5; Sun, 09 Aug 2026 22:38:26 +0000
Received: by outflank-mailman (input) for mailman id 1387167;
 Sun, 09 Aug 2026 22:38:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hoepf@cit.tum.de>) id 1wtC9w-0007e3-Ga
 for xen-devel@lists.xenproject.org; Sun, 09 Aug 2026 22:38:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtC9u-00CROE-KE
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 00:38:22 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hoepf@cit.tum.de>)
 id 6a790098-2eae-0a2a0a5409dd-0a2a4502bc58-30
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 00:38:22 +0200
Received: from [131.159.0.202] (helo=mailout2.rbg.tum.de)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hoepf@cit.tum.de>)
 id 6a79015d-6ca4-0a2a45020019-839f00cab431-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 00:38:21 +0200
Received: from mailrelay1n.ito.cit.tum.de (mailrelay1.in.tum.de
 [IPv6:2a09:80c0:254::14])
 by mailout2.rbg.tum.de (Postfix) with ESMTPS id 8515E4C0240;
 Mon, 10 Aug 2026 00:38:21 +0200 (CEST)
Received: from mail.in.tum.de (mailproxy.in.tum.de [IPv6:2a09:80c0::78])
 by mailrelay1n.ito.cit.tum.de (Postfix) with ESMTPS id 4hJCTT2g9qz2xRH;
 Mon, 10 Aug 2026 00:38:21 +0200 (CEST)
Received: by mail.in.tum.de (Postfix, from userid 112)
 id 55F894A03EE; Mon, 10 Aug 2026 00:38:21 +0200 (CEST)
Received: (Authenticated sender: hoepf)
 by mail.in.tum.de (Postfix) with ESMTPSA id 030B74A008B;
 Mon, 10 Aug 2026 00:38:20 +0200 (CEST)
 (Extended-Queue-bit xtech_zn@fff.in.tum.de)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20220209 header.d=cit.tum.de header.i="@cit.tum.de" header.h="Date:From:To:Cc:Subject"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cit.tum.de;
	s=20220209; t=1786315101;
	bh=eWB0xF/Ua9gI7/dD9vLvBWcZzJ0BdDJBvA6sapEdlxU=;
	h=Date:From:To:Cc:Subject:From;
	b=TnMpww/Ilp+dvn2ZFWEpI6LGQ7bm0TCzfDvwr/HVki05fz/S1zXUx98gQCm5DQdaY
	 4tUq2wZA2y2h85+lrfQ6KjxDd9UhyCswyYqazCS5SxeMrzGVMmGcEDK7xj0lASBpAM
	 /hL/aSEhbWoOOWDUd/6seLBfq3I4ukHttLCRqtSFzfk+U3qqwYa+kb34D3pF1p7/VO
	 CX75jC47tMsxiBTAXAjMcU0/2YAGMDDaFtgeixVgb5H/mBckbk/UFS3GK6IOMD9w4x
	 cUt9wG9kMZJsKfHUi1l4skAzFuZS/ARSZXG8OJYYmglTo5b35+bq7BK9ZKMok5FEFV
	 IYl19WyXcJ96A==
Date: Mon, 10 Aug 2026 00:38:19 +0200
From: Johann =?utf-8?Q?H=C3=B6pfner?= <hoepf@cit.tum.de>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/domctl: Fix unitialized copyback in XEN_DOMCTL_PSR_GET_*
Message-ID: <anWrDspbnvRYCwGZ@cit.tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 1.5.3 at itovm121
X-Virus-Status: Clean
X-purgate-ID: tlsNG-720697/1786315102-F12A12AC-150EB9B3/0/0
X-purgate-type: clean
X-purgate-size: 1148

domctl_psr_get_val() copies unitialized stack space back if psr_get_val
fails. Fix by zero-initializing v_.

Fixes: 03f30dc193c8 ("x86: refactor psr: L3 CAT: implement get value flow.")
Signed-off-by: Johann Höpfner <hoepf@cit.tum.de>
---

Consider instead removing the local variable indirection introduced by
03f30dc193c8 and passing &(domctl)->u.psr_alloc.data to psr_get_val
instead or only conditionally setting copyback true.

 xen/arch/x86/domctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index f26990208d..6e42fa383c 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -1347,7 +1347,7 @@ long arch_do_domctl(
             break;
 
 #define domctl_psr_get_val(d, domctl, type, copyback) ({    \
-    uint32_t v_;                                            \
+    uint32_t v_ = 0;                                        \
     int r_ = psr_get_val((d), (domctl)->u.psr_alloc.target, \
                          &v_, (type));                      \
                                                             \
-- 
2.53.0


