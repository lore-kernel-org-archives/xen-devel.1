Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE548C56208
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383611.1626942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3Q-000328-Fb; Wed, 05 Aug 2026 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383611.1626942; Wed, 05 Aug 2026 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3Q-00031c-9d; Wed, 05 Aug 2026 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 1383611;
 Wed, 05 Aug 2026 14:57:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3O-0002sB-6t
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3N-000x73-JL
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:09 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f2b-5cb7-0a2a0a5109dd-0a2a450ab934-46
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:09 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f44-f2d2-0a2a450a0019-ca0c7c96c8a5-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:09 +0200
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.stl.internal (Postfix) with ESMTP id 2AB8D1D00112;
 Wed,  5 Aug 2026 10:57:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Wed, 05 Aug 2026 10:57:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:06 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941828; x=1786028228; bh=LtpC8kb3w5
	sylrY5i2rJ1VyunzmKl36EvEgXZscahng=; b=DOfBreqSzAaPHKanjVbGt761Tz
	+7I46fmizfbtYd/ipmbF23pZabm8ENCYjb8axvtz9za3FYMZbWc1DbEmls30jD7o
	wDEmk6wWfKLIuyT1Eqv1xNVupv2/ZDDh+nNfouU1q1d7XUt34nSjqB+mc/RCg90h
	QiJGW1BOi0gWZwgIjFdfTvtFXBEjaL6j0BhQif60z1zRFinYoKam4T2mlcvjH7bQ
	7wlEA8WUBtAUz/PfdYyzcNp3DIsna2Dv/pz0cW4nSDAKG53tk2ta998VPwL/yCMT
	ptmvm+OYNWvsRHlP1ilSzrEuX1Jr1ffDFYcV6RyFlQDttXt+NyxQ1lI2sV8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941828; x=
	1786028228; bh=LtpC8kb3w5sylrY5i2rJ1VyunzmKl36EvEgXZscahng=; b=G
	kew2zVCRVR1po7pqQgJZpxm4l2hwgtCtFk7tbQSODqKIxXSRxOCChY2ZMORaHOEv
	rk+EZyuPViReXZQ9v++AQ6H24tTvgwSYFjITtg4ZcpjLC5DQL4l3s0nxkKNOZiHx
	Tt/TAZ4tiy41CSZrj0Wpiosbg3bQ9kCthExShPFURv84Wz+k4ujA/6EiEDoCZKzC
	gT9Gs7V4MZaNVQu2Ar0yJ9sZI7mUZYUkF/qAchU194cKsYbtDwUsWwL/ti7rmuvS
	DKRntgx8DYr0NdFyQYy65jYrYKCYZnbe6XL7MdaECMSKZESo2Fm+PsfBl3K1xYHS
	0KSRopS8VsVzkj8Cqc+uA==
X-ME-Sender: <xms:Q09zarOn8K-ZHxm6KNrEuk7FuJco7C5a_GqnH52JDfg_cbgBYnyweg>
    <xme:Q09zas0fUw5SZFWO6HxZhoBx8bjYRgGrcw0tludqOMsz_wLmH0mwFISNM6QkXFRF0
    jd99RxpKImE0DbEHy-DMH6ak5FDuUiEksMaGbUdRxhlaPAsBdo>
X-ME-Received: <xmr:Q09zailLBYLQ6KgDKzhN7DwkCO7vm8VqUOAiyVbB6bUNZJC96wqzBW5_xXtH3YNSHTmr1J8k5rw1vRGRBz8wgGpCEqpdpnMRAYltXAUZfts>
X-ME-Proxy-Cause: dmFkZTEdkvLxT+7ERUoKSapa1INrusQu2FZX/o9rqRP1XBK15rAw70yPydcC3NfqbA6Lrf
    4puMmK5txEfuISPRuXWjpSCdsSeR+ufxTsazl6IC22b0hWJX0iKN7KSwQVuS2VSUUDH+Dj
    2vVw9VAwzNzcOOEo/3GzaHvePPom9QgwnkPOERV+gliyvt2NHofrpPdQOkhW49z8fC8cgn
    6kDdLCqxJkQ6dXm9LDBL8Zi+6SnAUc+9mUiuLRAzS1mwJNsan9xrkGOxbXhqopJIC+MZM1
    sAWmGCMwjHA49BcUskgsz4gguRIIl/ww8SE206Z0mStY/oUSsgfAxoS44sAUZllLWOs9ru
    v6SOT6ZGZq9hSagMNqMTFH8vdp6O/L5MrKzNDDi7nZLfVHJsioFEZTYyrXxjaY/AwAcAlk
    sXVAUjeaSNfQZbrzwtHrtgNuvYYSuP702NMIGsM/SNmdqTWhEkrct047Su+Bt5rTagGiiH
    gYUh30QkTBM+AxtRjABy1cfA/LferyWxei/VMJjU2wdPn1D6MkFvc0ewdrcPYb4+xgM4es
    RphFaJmrrBphLIWscDorA2sk5T7AlgsctwlQStyRrflabZGWm0q+dMBK0+/JZwY84IkGPG
    NrZ9G38eWZ3VJ2R4zC6vg4/QMeU4BIrD8fIg8DV4x2NNOlEVpFStkfN25FSQ
X-ME-Proxy: <xmx:Q09zarUANXvfAraOUM78xk_NsEaL4cuKcA1TmiPLpLfG4J7cNjl2VQ>
    <xmx:Q09zaguoJeZNdQtxZA4dRGohwykNGOV0K6i6bHWeOsrl75Llmlw4OQ>
    <xmx:Q09zambIIkvuctyQDfUR2suMibn8bVqga3NXEgXdOnEhWNVuQiVE1g>
    <xmx:Q09zanU_HMaGSLhiN7QnaAfwKYVnynD0XP-drBPW90CjwZGQElthHA>
    <xmx:RE9zajqNBx8f7Tfciy_o89m1NsZ01MbwghYxWy2fcRDM5ccwXV5IiSF_>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 10/13] CI: add oops=panic to smoke tests
Date: Wed,  5 Aug 2026 16:55:38 +0200
Message-ID: <c6b50a72b933ce2ee3e5c35e8fb808cb1496dd9a.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1785941829-59BC0CFC-9A336D88/0/0
X-purgate-type: clean
X-purgate-size: 783

Make it easier to detect failures.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/scripts/qemu-alpine-lib.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/scripts/qemu-alpine-lib.sh b/automation/scripts/qemu-alpine-lib.sh
index 5221b7dec1c6..2d306f384f6f 100755
--- a/automation/scripts/qemu-alpine-lib.sh
+++ b/automation/scripts/qemu-alpine-lib.sh
@@ -46,7 +46,7 @@ build_dom0() {
     vcpus=1
     kernel=\"/root/bzImage\"
     ramdisk=\"/root/domU-rootfs.cpio.gz\"
-    extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh\"
+    extra=\"console=hvc0 root=/dev/ram0 rdinit=/bin/sh oops=panic\"
     " > root/domU.cfg
     echo "#!/bin/bash
 
-- 
git-series 0.9.1

