Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9710C55174
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383601.1626877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3D-00016E-2u; Wed, 05 Aug 2026 14:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383601.1626877; Wed, 05 Aug 2026 14:56:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3C-000163-Tk; Wed, 05 Aug 2026 14:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1383601;
 Wed, 05 Aug 2026 14:56:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3B-0000oe-Dq
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:56:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3A-00CQKb-CY
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:56:56 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f34-2eae-0a2a0a5409dd-0a2a4506baa6-22
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:56 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f37-195a-0a2a45060019-ca0c7c98a5ef-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:56 +0200
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E012B7A00D4;
 Wed,  5 Aug 2026 10:56:54 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Wed, 05 Aug 2026 10:56:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:56:53 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941814; x=1786028214; bh=6TXF8NBknI
	pzz7v8cLxu16DA3612q9rG5557ATJiwak=; b=Sb3H46GsSvOXvjLFOyX29JlQU4
	ZWXRgpaqy4poyVxgoCf1giiPzFWlLouA9i0u69wmMVCudibDySNaPNrulk6qIBlw
	EqIMFyFcf/lZ/O/6S9x6MxwIrjT5M2m2uoqVnSO2ztc16z28mSX0uyQvI6jxdaDp
	KFmEKywQKk1YbKWp0kS0q8a+xUW1PaHGb52QOnLsdGPrN5Vy28oanLNRqYbOLOEZ
	yEikl78FBNyGEv/CLc9sxd+tutbPGjy97a84W/8chgNPC95HMWg3oK63gVNyDkAl
	mHD4yz9UIr1xtdr39R1mOdF+tF4IooGwuEBKG638uCnBHIy6pj0FxsX5JE8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941814; x=
	1786028214; bh=6TXF8NBknIpzz7v8cLxu16DA3612q9rG5557ATJiwak=; b=E
	fRk2NPg0l8ET21oYuUJYmm2qib4u0HSEYV4VfbjipkYv2nKlXNVtjlf6kBc9+fpj
	JlKo2zzp5yvm+joVfBhoheI/KY0XZDTVCkgd/APvw0vvnr71f5b/s5FPhcMbuYI2
	l9BvCfUxSOXWTIbWoOoDqHtIBXSQslvdtqXQTJQ82hBWEtScg4Z/HHYlJO3WbWnA
	YHG6lxUJtcD8eKOzkPesihBUi+zUAwoXN6wu4i+5tP3ybT+guCEnCpqUU/Hh1RMw
	r5UqgoDL99S3QSgA+OqnjTLEgG+YYTwDAcNzANdyS2RR1mj4ML7VUsdNcb6k8+Op
	PaKghpNffJ13OXFrMl8+g==
X-ME-Sender: <xms:Nk9zavH771BruQAWtN6_X-1LVCaflknDIJm-42cjDDKCcoEpQrx-9g>
    <xme:Nk9zajOy4W2TfApTJ43LcldY6ksEQ5YFuS5nFT7AbGmc9uMIk71bLQj06KzJi0ded
    9aAqDogC1dJCLe0ZMnE6t_cF-58mEjvf7RipYYa1AlNI2Ngs3I>
X-ME-Received: <xmr:Nk9zapdESbN_wwHMyq0iSHP54XhTR99TDsXgKm4TAXS0An9znGweOT_R18Rps9X0QZZTBHc-kVT2PJw40B4DdPLvkxSyxFUNTTqTU5iLTrU>
X-ME-Proxy-Cause: dmFkZTEdkvLxT+7ERUoKSapa1INrusQu2FZX/o9rqRP1XBK15rAw70yPydcC3NfqbA6Lrf
    4puMmK5txEfuISPRuXWjpSCdsSeR+ufxTsazl6IC22b0hWJX0iKN7KSwQVuS2VSUUDH+Dj
    2vVw9VAwzNzcOOEo/3GzaHvePPom9QgwnkPOERV+gliyvt2NHofrpPdQOkhW49z8fC8cgn
    6kDdLCqxJkQ6dXm9LDBL8Zi+6SnAUc+9mUiuLRAzS1mwJNsan9xrkGOxbXhqopJIC+MZM1
    sAWmGCMwjHA49BcUskgsz4gguRIIl/ww8SE206Z0mStY/oUSsgfAxoS44sAUZllLWOs9UM
    PUROGKfl1JuD7sVMVMUTtvEWjbrSP8wRxo1QtPYztct2Zd1WxPDkYL0LtWoaQCsIsvl6cd
    ZQEnFSWOR/CWxpbdxMm+pinEgdd+1wUB566ulqsvWis+MMlKid9QAUyIkIP2kVvEcnCt1d
    7MjzIfSOWcXg9dbsIZoc4Pl/PY7L2cUAe6YPDB+0aL/Zx6biqAXw6FtDbV8EmHfjqyz7xl
    J6W21Nflen2Z7QeueBJBHrbJWTDVpFs78CjL7EEFactwScrmXpliOwBhVj+X/KSdWbnH4j
    dK8VVEJP0AGePaDhut8pji95e0QWjnlE0gu5kKMEThRLwxi7wXj0UWQ6MXAA
X-ME-Proxy: <xmx:Nk9zaosIp9xnMxZjWSuZpYKVtlHKKtPS3MtQb6fXfy7R2U0ZUM4sBQ>
    <xmx:Nk9zailCBaSlXeaqVRRvrQDTjeQxAnJ-liw5HVoISSILhOO12DuRfg>
    <xmx:Nk9zaixbdh_D9_eYwmV-E6gLsCt3IfiVVhwMoYkbhiRrfyTB6wEMsA>
    <xmx:Nk9zasOhF0b_u3hntbVlOW3sm9SSXUx5WKnma_3s8FGtepxll8FR0w>
    <xmx:Nk9zakDbBMykPr7VjR0HdarW5M141sQIptpcQFx-SmJYNSrI8SREwDEH>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v5 02/13] CI: Reduce timeout on test failure
Date: Wed,  5 Aug 2026 16:55:30 +0200
Message-ID: <a61efbd50844b2c3084182faa73d629d45250575.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1785941816-1FCCD77B-1F28CA92/0/0
X-purgate-type: clean
X-purgate-size: 1357

Tests can specify two expressions to look for:
- PASSED variable: what to look for in a successful test
- LOG_MSG variable: what marks end of test execution (regardless of the
  result)

If the latter is found, do not wait full timeout for the former one
(which will never be found in a failed test), but check for it with a
short timeout instead. In a successful test it's supposed to be in the
expect's buffer already, and in a failed test it will never arrive.

This should reduce waiting time in case of a failed test.

Note the other case (when PASSED is found first), the timeout should not
be reduced, as test may execute some more after determining the result
(for example it may collect logs for uploading).

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
New in v5
---
 automation/scripts/console.exp | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/console.exp b/automation/scripts/console.exp
index e27886bbef23..d65f840a315e 100755
--- a/automation/scripts/console.exp
+++ b/automation/scripts/console.exp
@@ -65,6 +65,7 @@ if {[info exists env(LOG_MSG)]} {
             exit 0
         }
         -notransfer -re "$env(LOG_MSG)" {
+            set timeout 10
             expect -re "$env(PASSED)"
             exit 0
         }
-- 
git-series 0.9.1

