Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FAB3C55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 14:57:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383603.1626895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3F-0001XK-IH; Wed, 05 Aug 2026 14:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383603.1626895; Wed, 05 Aug 2026 14:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrd3F-0001XD-Ee; Wed, 05 Aug 2026 14:57:01 +0000
Received: by outflank-mailman (input) for mailman id 1383603;
 Wed, 05 Aug 2026 14:57:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wrd3E-0001JE-BI
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 14:57:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrd3D-004zD5-OO
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 16:56:59 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f20-e002-0a2a0a5209dd-0a2a4503d7c8-44
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:59 +0200
Received: from [202.12.124.152] (helo=fhigh-b1-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a734f3a-fae8-0a2a45030019-ca0c7c98b99b-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 16:56:59 +0200
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 566847A0036;
 Wed,  5 Aug 2026 10:56:58 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 05 Aug 2026 10:56:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Aug 2026 10:56:57 -0400 (EDT)
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
	:subject:to:to; s=fm2; t=1785941818; x=1786028218; bh=NSW54GHtEO
	i9vl/a/xrx8zk65+87yD71z/uJn8Y/c8o=; b=kfGpXYhitUAtm/97ggczMUjKHR
	cgK1XTo6Z6e4pal2s0rAge7tokSNEkEkrtnJnW+5LRx1GWkcBRvnKDT/pMfXdYIZ
	69qYIQ8M2prpIbXdKYkc3DxT8ZW7QLkhMpo2TiUc7487EV1q98mS0B2t2TH8qcZh
	CQU6kyf0IMhiGcJbML3SmLHxuQT2Fm2P//4y0m7AfvOIrWv1H1FF4bCNCWUdkeqp
	IKXU7zcV0IVa3H5xndaus7KrNj8TDBWCewQ95McrT8BfPsm3Lm2uAjJyCkkWMsVe
	d5e3ZUvULGQvb+FV4k769EsGKNAbW2Lg9Ktjlnt4G97/o4vG0BNYh6tN/vpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785941818; x=
	1786028218; bh=NSW54GHtEOi9vl/a/xrx8zk65+87yD71z/uJn8Y/c8o=; b=C
	Ba/F9bnraC1AP1UnFxXLMQKuEzKuMnYM6J7Vr0nFUu6HeErboBGiSjFTqKBEtQaI
	Rhqa/Z6PgJAy7r6BYzt+vmFlEOp4dXdn5KA6sWvd2Cuyn2RJ+reNpche5oksZiyD
	5WOK991pl55bHe9UYvh01N4SODZ0Yndwg6+rOPB2CpKFAoITpvOZhuQEMNRVNlyX
	/rnxz65q3AIzRguLcvIELeEFaLEsCuan7+ih30XYnUpLNVEPLnwFNlpDAxnYX+A3
	OzS1s4F4YD8j70q+se3R3eJhWRGFUaNTuEJroUXSjxmAYU2gI7TtlazbRzYC2SVb
	0W3yA5PRnwuODrespeQWQ==
X-ME-Sender: <xms:Ok9zauMV3JtiHCGDozRbfo-vEWVHTFwWrTQ5QRYH09ykAGsN3YZllA>
    <xme:Ok9zaj0q0DqmnJ-AH9wfFHgn4A60QuFAm7nzcenmPpeeO0zNZAj77UqWjcaVjD-62
    jS6LLHDY2ohQFnMMyrD1TeVM7sNa16CwQ8-faaYhAwxKTIWNYY>
X-ME-Received: <xmr:Ok9zatlc44myDWJCmomaAzVWxcLJP0NH3h_9bqBYQQXnggWOB-HiJwWQsVYW4md3Sm_rk82Fs-GN79OmNINIF5Yz9UvyYiz-45vy6Yaej0Q>
X-ME-Proxy-Cause: dmFkZTEdkvLxT+7ERUoKSapa1INrusQu2FZX/o9rqRP1XBK15rAw70yPydcC3NfqbA6Lrf
    4puMmK5txEfuISPRuXWjpSCdsSeR+ufxTsazl6IC22b0hWJX0iKN7KSwQVuS2VSUUDH+Dj
    2vVw9VAwzNzcOOEo/3GzaHvePPom9QgwnkPOERV+gliyvt2NHofrpPdQOkhW49z8fC8cgn
    6kDdLCqxJkQ6dXm9LDBL8Zi+6SnAUc+9mUiuLRAzS1mwJNsan9xrkGOxbXhqopJIC+MZM1
    sAWmGCMwjHA49BcUskgsz4gguRIIl/ww8SE206Z0mStY/oUSsgfAxoS44sAUZllLWOs9dw
    TEDio0/XVTjbPYzt9Hux7zQESi9grPIq2OpQ0g+s41ZnxOnsEwBHOkjLzSSH8KYVzrLtNs
    QHgkT1s8qVUet1Kh70b40AQ5DhcwrtIYchkPCaZ2fDCIXDfV7ktrcFAkpSseEOvzTTb8F7
    u+CMpnE1HWGjtzIrFhoiTgJ6rsGLOPkOklpm5SrTMQwSx3l3l2W12/Nh0G1EYeaN6yTeux
    T0iyTBqwSBlVzHNXnNH0N2f37Sk9cnwvBowhLnmsf7ytoIxwsR1TFrd6meSVvb+hRMFAGm
    o48p8yXGwFJF8gGJAkLFmrXnExpfJU4Mce1TEXFi2SBH80uc00zZGFUZU7wg
X-ME-Proxy: <xmx:Ok9zaqWo5kbErH66I0uTPNPrnNQcWfFFjEE9xa1bfGAiSWfQGhkrkA>
    <xmx:Ok9zajvJ6y4RI3b4qZT9DBoh86pPqEHq2D-xJPLvEhPbXAbFTBKg7A>
    <xmx:Ok9zatYJkIH9Q1Rk2pgOQZylsKB4Bya9gzq3pZ9WZWzrmkkNB7ZpXA>
    <xmx:Ok9zaiW8q47IZjbKDMpFwCl1uycia2n_bViHwfMuRCKVXkF-WLtIhw>
    <xmx:Ok9zaqrA4voqnuvbp2jm_v-OILw77FpjTaj5yyaGkEMn47vEbaGWZSN7>
Feedback-ID: i1568416f:Fastmail
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v5 04/13] CI: Add configure --enable-systemd for full build
Date: Wed,  5 Aug 2026 16:55:32 +0200
Message-ID: <b1ef91e0b72c83b0f5567a57c991d61ebd846f2c.1785941707.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
References: <cover.099eede8b72ebc9acb07545472d72abceed1c8b7.1785941707.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1785941819-6E6CE4E9-A4A274D6/0/0
X-purgate-type: clean
X-purgate-size: 889

This doesn't exclude sysvinit scripts, but allows testing systemd too.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
--
Changes in v4:
- drop systemd-dev, add --enable-systemd always
Changes in v3:
- switch to trixie

New in v2.
---
 automation/scripts/build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/automation/scripts/build b/automation/scripts/build
index bdaab11c3722..33de967c4b9b 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -59,6 +59,7 @@ else
     # Full build.  Figure out our ./configure options
     cfgargs=("--prefix=/usr")
     cfgargs+=("--enable-docs")
+    cfgargs+=("--enable-systemd")
 
     # booleans for which compiler is in use
     cc_is_gcc="$($cc --version | grep -q gcc && echo "y" || :)"
-- 
git-series 0.9.1

