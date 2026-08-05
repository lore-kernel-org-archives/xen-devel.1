Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD457C5AC6F
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383610.1626940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3Q-0002ya-3b; Wed, 05 Aug 2026 14:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383610.1626940; Wed, 05 Aug 2026 14:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3P-0002yN-WD; Wed, 05 Aug 2026 14:57:12 +0000
Received: by outflank-mailman (input) for mailman id 1383610;
 Wed, 05 Aug 2026 14:57:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3O-0002rq-2b
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3N-000x73-Eu
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:57:09 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f3c-5cb7-0a2a0a5109dd-0a2a45039e98-28
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:09 +0200
Received: from [202.12.124.150] (helo=fout-b7-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f42-fae8-0a2a45030019-ca0c7c96e627-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:57:07 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfout.stl.internal (Postfix) with ESMTP id 4AC921D00189;
 Wed,  5 Aug 2026 10:57:06 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 10:57:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:57:05 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941826; x=1786028226; bh=Tk4FR3C+E8
	hj+04G0aqKUyY5BojG7M7wHi0BRJd3Wo8=; b=G6krjpI5q0lTW24JoT4zzJ3MLZ
	RMuG55LpdTKldC13FOHL9wy9RlCsDGBa9XfgwKDX4GhLVIySMXp8K0kwsc9x66Vx
	4Qovm83h3h3UaUyyGWSCdfkPM2/x+f34qUMgd+Gj1WK56ms/JVPDXhJB4MtFuv/w
	+pyUKrtKKfksjwhZmGQ4pDdWPSWcjHydoIisRs+OBAfmIHjs5ijSaN9UG3/7BIR1
	HlAZ3z/fK4wjwCjqgb3XVYeJHd7lNSq/ikY72AA7WWIyJnfU0SljMGT92gxAQ0qG
	aH6cJSY7AYtf5yTK45PocUDvUFn6jf7WGm2zbG7xcrGn30t08xfyKXSQw2+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941826; x=
	1786028226; bh=Tk4FR3C+E8hj+04G0aqKUyY5BojG7M7wHi0BRJd3Wo8=; b=k
	SHS+j/4qg/4/oH+J3qjJIBKwahI+Dn132DNHzhYvh4XvcKIJOAYYanbzPaNr7R82
	V9d4avt94PdTj9CaEMjnSrVH2B9SQsqIcyzU+yuBGHTCYly/SG5l0lUn5cXSEFy7
	bXx+R1bk1OmXKoCIKX1/iOa9PSX4hCycBieGZOamOFH9g5jxOUV+bN0sCvpVGiNb
	yWNmgP4rTRD05FG0LCkdAKj9uN2awxazvyYvFteA+AuibL1Ug/9YER9vSXG1x1BP
	DKJpHt0y8sdJIzS6LerfZMOKYzXjmlWc5jUxyg/X/U3nMicZurq1la3i175m6Xu/
	6Ki7cgj537Cf6ikyKRNoA==
X-ME-Sender: <xms:Qk9zapaaJ_k-kjYs4ORQ420YH7_gQHI2eZPzPOY7MaH8wWRZbNfNpg>
    <xme:Qk9zanR8NFwAjx4jvGEbmeBuOelHDv0k282uxgg0qv4iwEa2YJ9_fSxkzH4LKKrRV
    eeaF4JLIUHkehkgsb34uv5EILnAmzGyYNi7254ocZHRg1SM5kw>
X-ME-Received: <xmr:Qk9zakTIK2DxGyeH_4jWn06olPxIFdfItbyqDFid7_BRGo4SJWzf_3JeaVQNteR9T4VFV2CvEqzqls9Ywuf2hKyBaEefz0fuE-Q6lpXbqz4>
X-ME-Proxy-Cause: dmFkZTEdkvLxT+7ERUoKSapa1INrusQu2FZX/o9rqRP1XBK15rAw70yPydcC3NfqbA6Lrf
    4puMmK5txEfuISPRuXWjpSCdsSeR+ufxTsazl6IC22b0hWJX0iKN7KSwQVuS2VSUUDH+Dj
    2vVw9VAwzNzcOOEo/3GzaHvePPom9QgwnkPOERV+gliyvt2NHofrpPdQOkhW49z8fC8cgn
    6kDdLCqxJkQ6dXm9LDBL8Zi+6SnAUc+9mUiuLRAzS1mwJNsan9xrkGOxbXhqopJIC+MZM1
    sAWmGCMwjHA49BcUskgsz4gguRIIl/ww8SE206Z0mStY/oUSsgfAxoS44sAUZllLWOs9kz
    M+2EhVPXnm463WsVTR7vt8wtFsLTgkuGJDU3ThGsfCB1pIk58dNk2MnZTWkzV+0r6EyUid
    3cFDm8u+tw2qUoPfO2e2N5u2Qw9aNSNkAAPwTL+5/cpnqmIUxBSN/wNVqyEFM3dw3lYWxf
    ugbBPhIk5pay1bOoEMkySjQGW7G0pfq64fSYYFhMj+B/TphviwAtYZU2A7H4JrXOGI3X5K
    4r4H4cVIF6zKxDT2JTPWoa1dSnjrX26d7LCYUHQL5hu+aQOvDIQcp8gMJDdtogbbWF7DeL
    ms67pWOxQyuVP2bd8952TxbN9PukkDImsreqa/7F19phu12IrgywSonlJCxw
X-ME-Proxy: <xmx:Qk9zajSH4mRuk5_hC9i9ZccNvu0cP55xf82GaNLLQwDbjLwCjERoCg>
    <xmx:Qk9zah4G8mqFG1jXHAy3dp4YFP-0eJTnzrIHhSRHESIgfWTGmSopmA>
    <xmx:Qk9zan3oL6YkgS6bQMhDkkk82MIn5oDJE5b7uGx8M9t0traKFkASGQ>
    <xmx:Qk9zakCTu9wgymh0Hyx9CdpyYs3ey6VQmhJIM5rbTw5mtY1gJNVNXA>
    <xmx:Qk9zanEMSvriwlQ5KCkcVWuiG2YqPcFiS-Mn8IJV8jBC9tIxZXoPpsJK>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 09/13] CI: enable xenconsoled logging in alpine tests
Date: Wed,  5 Aug 2026 16:55:37 +0200
Message-ID: <4a2974f971922780bf571547f137f2cf7cb102cf.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785941827-74A894E9-94074D3F/0/0
X-purgate-type: clean
X-purgate-size: 741

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/scripts/qemu-alpine-lib.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/qemu-alpine-lib.sh b/automation/scripts/qemu-alpine-lib.sh
index 29fdff4f562a..5221b7dec1c6 100755
--- a/automation/scripts/qemu-alpine-lib.sh
+++ b/automation/scripts/qemu-alpine-lib.sh
@@ -38,6 +38,9 @@ build_dom0() {
     mkdir -p root etc/local.d
     mv ../domU-rootfs.cpio.gz ./root
     cp ../bzImage ./root
+    mkdir -p etc/default
+    echo "XENCONSOLED_TRACE=all" >> etc/default/xencommons
+    mkdir -p var/log/xen/console
     echo "name=\"domU\"
     memory=512
     vcpus=1
-- 
git-series 0.9.1

