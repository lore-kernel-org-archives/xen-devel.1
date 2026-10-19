Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ECECCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454391.1668004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlw-0000OC-3r; Mon, 19 Oct 2026 13:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454391.1668004; Mon, 19 Oct 2026 13:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlw-0000O3-0R; Mon, 19 Oct 2026 13:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1454391;
 Mon, 19 Oct 2026 13:51:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlu-0000Ej-Qz
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlu-00A1LW-70
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62054-bab6-0a2a0a5309dd-0a2a4504c640-40
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:26 +0200
Received: from [209.85.219.46] (helo=mail-qv1-f46.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6205d-b57f-0a2a45040019-d155db2ecdb0-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:25 +0200
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-917866225aaso19646276d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:25 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91be8f89b54sm60221436d6.7.2026.10.19.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:23 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792417884; x=1793022684; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wxt1Epm3k3rT9QE881oEaKsrBbXJoueUEmgjTPk70U=;
        b=DWDFzEeAqUHzKs3T5WdGItjZ2R9poP75fwZRob4g67B5JYSsbf0P+Y6UGcsRPwFVqP
         6nLRe7UOxSdNG4ecght6CtVbY7a6bFFwQdfWr02JOO0S9qK+ietx0R5TdNxc7C3uUZ91
         NQ5AVPw1TDVMDvdjPiW9UIlAvAWQtGo94adiMkLXqcuJxbcxiwcwa3PBvQanxZGtb4TB
         glX6IY2BZlKdLqXrTlMf/zqRi28WHAbbo75Feo4nngiyec5vQWw3JDxWNJMj/RLyGvoL
         iwZpU34R4PMk03HEBkrMdkU8t+K6f9R0/Yl95L8h157pN9WH77x2ertFLcSVTpDtdnsi
         w8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417884; x=1793022684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wxt1Epm3k3rT9QE881oEaKsrBbXJoueUEmgjTPk70U=;
        b=KEZfUDgTT8j0EHJtweZ5XW65UI1uRJJAsu8dENPmTG9Al9mTg9yjbpatcBXEFT1yNa
         jeSTtxuvmD6+/x/nH4De4CfYBn4Glxi45qYlv6VqJ6wGHGljNDNMpo9Jsp0krgj1KvFZ
         XQyi1SnXfrVJ53oJ8gQ7H10BVPtErRsxYhd6u5CHdy+5BtnxkxRZlKRFp6cNdrMDMGpZ
         f3+zckBlFeOpYcWhMIYm1NCDwuLpwSQFHeOoLglklaxUCrKwQLDa7J0WmtSPGBhHgTk1
         b+zOvarUXvW4IktRRUhflNbcTLgxOMG1X2kM++ahdxsFXUvVrLTPUiQgM6kOWH/UUzfT
         lZDA==
X-Forwarded-Encrypted: i=1; AKwUvBwNp5FdFAtaaFdX/R3BgYSCr5jyIrBr5Zq72dwfQdVZyq3OXfW24/rmAmYJ9wLHO5yhpv/DFy4565Q=@lists.xenproject.org
X-Gm-Message-State: AFq9FYITjSbc5qJR1n51RQiiGRFSD3+OAObDFdizmMwWbFjIRrhXjpos
	AymbB7hlEfqYcZbMgfOgSVfAZkAQcXNd4g0RxhGWDqXu8k2eC3SLhq6gwzm9ebzJ9sk=
X-Gm-Gg: AYBFou2lhbWlfaeEhdLXMcoaMLkNdUvFSc+7yGKyenzUJwmWN9vxn6CYadfe6Tv1/8u
	dw+V8ZGxxANe49ZuZx2MiB0a/aHKmHhpp7ARn1B/1QWvw5HFUrHyBeeGa4oHPozk3bSg9nDANjH
	Nb1NHrFeN7PTl6Fm3lJI+UcJFGq2ZYlwZ3JzOmC+6u+nPwlwVuy32pyxm9t+H/CT+tf39K/I57s
	oTiikpB6tGOUEJBRh1yQj+X8QcsJG0Tn00Al7m1xoPlv4CWyw898LSZJ2tqNUlRHdt6XlVC92Y+
	++dTJGw1fGjSR16OrblA1Yr8EsiUSNfDhGF4FvxQapilRISLAAsYlmPvGWpV4VIAW94M92/c5Ll
	rS9N6C6QVKpemBOBh0Do2xnG+s2lZf6hMhMTK02a339oob+CW3inxjakiKHZl9go1KbNFpZPePC
	yYg5htdJ9vXG3TbAVYtFbe9q3zIZtzbBkx1WzekXsHAZXVZxNX4c34EDFQ+jDncoygJblvpUspT
	6vZjS+zfoulH4w=
X-Received: by 2002:a05:6214:2022:b0:917:a5f1:1d45 with SMTP id 6a1803df08f44-91bdf165a4amr140313536d6.32.1792417884537;
        Mon, 19 Oct 2026 06:51:24 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:42 +0000
Subject: [PATCH net-next 08/15] net: skbuff: make skb_try_coalesce()'s len
 unsigned
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-8-41dbef50b9f7@toxicpanda.com>
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=2184;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=GLGsUKpELPU6q+dQsnPVRh/KHoYno5QlglXwcqwsDWs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNC9Sgvy7Z40iKvcRhA58lXebwfW6QGNAPE2IPZxOaOYraxtzaaXcB+Os+4BjcCqUxdgTwJlErN
 lVW88RefeTAY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792417886-C2ECEB50-00852B0E/0/0
X-purgate-type: clean
X-purgate-size: 2186

skb_try_coalesce() keeps from->len, which is unsigned, in an int.  A
corrupt from->len above INT_MAX turns negative and gets past the
len <= skb_tailroom(to) check.  Commit 279877d86c82 ("net: skbuff:
don't BUG() when skb_copy_bits() fails in copy helpers") moved the copy
into the tailroom ahead of skb_put(), so that check is now the only
thing left in the way: skb_copy_bits() clamps its copy to the negative
length, and memcpy() takes it as an unsigned int, so it becomes a ~2GB
write past the end of @to.  Before that commit skb_put() ran first,
and its overflow check caught such a length before anything was
copied.

Keep len unsigned, like from->len.  skb_tailroom() is never negative,
so the tailroom check then refuses such a length, and every other use
of len already takes an unsigned value.  The truesize sanity check
compares the int delta against len; spell out its delta < 0 case so a
negative delta still warns now that the comparison is unsigned.

Found by the Sashiko AI review of v2 of the series that made the
change.

Fixes: 279877d86c82 ("net: skbuff: don't BUG() when skb_copy_bits() fails in copy helpers")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 735dd25213bb..5c89c463f234 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -6392,7 +6392,8 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		      bool *fragstolen, int *delta_truesize)
 {
 	struct skb_shared_info *to_shinfo, *from_shinfo;
-	int i, delta, len = from->len;
+	unsigned int len = from->len;
+	int i, delta;
 
 	*fragstolen = false;
 
@@ -6463,7 +6464,7 @@ bool skb_try_coalesce(struct sk_buff *to, struct sk_buff *from,
 		delta = from->truesize - SKB_TRUESIZE(skb_end_offset(from));
 	}
 
-	WARN_ON_ONCE(delta < len);
+	WARN_ON_ONCE(delta < 0 || delta < len);
 
 	memcpy(to_shinfo->frags + to_shinfo->nr_frags,
 	       from_shinfo->frags,

-- 
2.55.0


