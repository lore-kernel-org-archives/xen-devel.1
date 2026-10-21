Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C1E60A2634
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pLNb3Cez
Received: from list by lists.xenproject.org with outflank-mailman.1457185.1670118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf8-0004gF-DO; Wed, 21 Oct 2026 13:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457185.1670118; Wed, 21 Oct 2026 13:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf8-0004fo-8F; Wed, 21 Oct 2026 13:47:26 +0000
Received: by outflank-mailman (input) for mailman id 1457185;
 Wed, 21 Oct 2026 13:47:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWf6-0004Ps-E1
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWf5-0065O0-Qi
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c269-2eae-0a2a0a5409dd-0a2a4502dad4-10
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:23 +0200
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c26a-6ca4-0a2a45020019-4a7de02ad4d0-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:23 +0200
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-677bc4704cbso661451d50.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:23 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67a0e501bf6sm1068068d50.14.2026.10.21.06.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:21 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1792590442; x=1793195242; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wxt1Epm3k3rT9QE881oEaKsrBbXJoueUEmgjTPk70U=;
        b=pLNb3CezOhCRkdIm+KZ/s3uNcq4wTjgUXY6G0lz+uea1B91sVvISZSO5HhV8EpmyNM
         a14oCsJFkluDNIQv0L2Miuu6eKOEdv7Z7FnV7nXMp8LXT4D5rYBLuVIiYcKHwlof6qJx
         HxbF/zxOXXehGKfppNDqgl7mNl10GgYZYICOKlnj1lEgt4/wMgtTFr4ZRyd2pelJb/8H
         Oo19uXEkDGSsIeG7IgqrE0/JBDQQlquXyrdNFE1VMGwjbLV5lvoK9UHKV3mhPhbcNGW0
         WDg8mNNTbt9yTW/CfrqT78NT3zUd71cWamgm36rG2yCWsbXaJjhgvC9YytSmWLvTYvA/
         wSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590442; x=1793195242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wxt1Epm3k3rT9QE881oEaKsrBbXJoueUEmgjTPk70U=;
        b=CUt1gzq/NCzRoh85ZagSzW+Pc+7bio8u0mg/ANKpop5sBIa8AUjmb0ZLwqxgrh5Fxm
         n0XWyzR688d5m5kYPiz7JBeohEkEazqaHE2WwBtNMRXEbKkH48RljP6V1URo5HjAcaAP
         LPi8qPP6D+giBP9M5DjZWjasTE9ZXUJsWB/uMPeeruFKE/jdLiQLOgk8mzuPaSLjE+c/
         Z1k+gVfzK3FRee2nqlqzG3YSqlPQxB3myRh24CvXLh22Xew450Caut8ZtYZDmim20ttG
         2H/U2Dm6HuMRnZAl9fo1YFxZh23p68k4vcyNWZ3pbhN0v/e8YGspFK8X76G6JWP2hsNM
         YH/w==
X-Forwarded-Encrypted: i=1; AKwUvBynTUKcr2pl6yb+I/ieXLQ3+BVSVr/khehYUm9t8+4JBTHunVOUAhLO6HjPuyNnLG+Pqgzs4acINoY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIsYaIT3cRfdoq1e2my5gFn2R7f+CmATbs9EGVnhfGSQ19zaDVJ
	gMvejoJXeb6pplnfV03YnaPHBpE1P7gC5njfzh6ITya38Ojma2hCb7Oc8T7aHB4vZwk=
X-Gm-Gg: AYBFou2Lfd+ISD7oKvBbwLVvadOz1+kpxpJMCsKeD81jO60+M2GpwEbweRTIvyt9Nd6
	3P1c3az+3guvkoc7VDRfjd8+8W78mD4jbVNPK8v4MKc0PTTxoYJl8+GeQIcYJWxtlYErbUokVAT
	BXFRfYmpZ5jS4SPeuVCFC+Yoqik4Ye0ZsB1epjv2V9ZUEbn/6U5xroHviIETaWLSpxLe1o/Xxyo
	GEBX5toe/yHWW45FbOb4ItLWlRmfSu4KsiTXEUVSTlNX/d2STHO7/sE5DOe2pZJgXLGPZDTZnAK
	aIAvWCACKh8YT2lDNFbbpEaOKoMlgjG4Nm9HgDJeLIiztD/1qXkVjpDyTePs73G+a8BbapQvMQm
	6OQL+kowSf4Fs5wFg/7LFSqXgyED/bnJkXuXe+L1+Z1AEOxhrWKvR0ROBJYUvXO2Wxjm5JpRPMT
	qG1PgaDrOBmY0H2a7zUvRvOA52qzUIWracoJTCTc1xp08H7LuPPIp8cjHrxTbAiLxqZAhn0DGt6
	Q8eRF1w2ayB/Mvsscq+b5xBLDCYVhsKThKlAmqjQmT7mqn6aryAAzX61p/CXwpR9ZuzpF+l
X-Received: by 2002:a05:690e:140e:b0:679:9942:8977 with SMTP id 956f58d0204a3-67a0e034ce2mr861218d50.7.1792590442281;
        Wed, 21 Oct 2026 06:47:22 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:52 +0000
Subject: [PATCH net-next v2 08/15] net: skbuff: make skb_try_coalesce()'s
 len unsigned
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-8-2aa780a03524@toxicpanda.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
In-Reply-To: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=2184;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=GLGsUKpELPU6q+dQsnPVRh/KHoYno5QlglXwcqwsDWs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHtIQpXIZEHUiTOUwL7sUcXUNd8TtVIN+/3dZDmNgDJuDjg0ASyNkhneJ5Ri6l2qmlypziQED+1
 55FOiTpYFJwc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1792590443-660A82AC-4DEF8A2B/0/0
X-purgate-type: clean
X-purgate-size: 2186
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


