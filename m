Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F050606A32A
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Ov4ZpWZH
Received: from list by lists.xenproject.org with outflank-mailman.1457197.1670164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfI-0006Nd-MH; Wed, 21 Oct 2026 13:47:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457197.1670164; Wed, 21 Oct 2026 13:47:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfI-0006NL-F3; Wed, 21 Oct 2026 13:47:36 +0000
Received: by outflank-mailman (input) for mailman id 1457197;
 Wed, 21 Oct 2026 13:47:34 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWfG-0005zU-M9
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWfG-00AIKh-1b
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c26c-e002-0a2a0a5209dd-0a2a4505b806-46
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:34 +0200
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c275-4cb1-0a2a45050019-4a7de02ae978-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:33 +0200
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-67489c8202cso627712d50.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:33 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67a0e5779ddsm1061588d50.20.2026.10.21.06.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:31 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590452; x=1793195252; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2su03NSLDI+QURR7+Op6WIlpfTiC3EObk5mJFR1rWs=;
        b=Ov4ZpWZHnDcgAZrqkLwPLI57kM7mivdeBjqemIQ6qVJsWPn833Few8ZL4VsrAqXUdy
         t0q7MNuaScy9QwHdYz3LTUVnRiqQr5UvwjnTBqvzm+DKLsvqq1ULdTCrVmRvRDuBo1jt
         sfDAF0cx8WTrQAekwmcvP9dcJBD//O2BCDgj9D/A/Xi5SQ4DadGabk2Iv5egCs9uu7yl
         HUm9pWPUgU6szR/shRVQSZP3qlrRzaroAgJrrWoPSxL+GSccFOWEJXdFYMVhyDZ+FEsN
         aLd6H0ktVLKQaSWG0HlE4weAFqt1NxBIv2DT4WChxIOQlnBI+b2bxGt5EzMoDO9pD86Z
         +y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590452; x=1793195252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l2su03NSLDI+QURR7+Op6WIlpfTiC3EObk5mJFR1rWs=;
        b=tJVyhzgLyMGUJiUn6vrb4HOm64rCRfz/D/t0dXqkT2VecSmQqVmnz1nW62Vyh8T34F
         cI94q50YcbgBgIG1Ztl57hxmdEp9q/PXY2zYHzzzXhv6CxckZ92jsPXooK/pXR/LFMKg
         vdxw3zWYUeXPfo7Rzy5RJNthUIM4TS/9V+eeCcVtxF90blk8EkU+Kc/xjiV2mmOqeZut
         kCMc44/PV1ISymqoeUxkmfRY/Etq1rNM0Bbodqt7AtwnUZBqt0pN0OcbhuoklpSPICnY
         LXdV2WU3ky+q2uhyPiAvbJtlgmxe8aHGLuZTiEF6Cq5gXIZoIlTd+a7zumYL9m2QAayk
         fGEw==
X-Forwarded-Encrypted: i=1; AKwUvBxMy0Os/BrkZHtillkPUL3eBAx6cZfG8hBNi0XfMXdZ7WfeRgRiR2lP4rxx9tudlTTTmnq+u2g84O0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI92mX26ZyvVxALw1gequkaRl5jyitF8TG4cWR8gylIUXPlMJpx
	8JbsKayrLn5RlyFHvvSLPbvzo3d3qkZGaYPy5WFsUohsp+Jswh9+k/q3TpJixYliDmI=
X-Gm-Gg: AYBFou0EhjIEUJs+00NRrBLOtqb2Zo6trRrg60a2jqc/SD5oLCPo4/cVWTUj/P+0Qp9
	66GZbxTXpcvU+Qr9gWABHMvtigNG3YzDAAR8Hq0so1vk1LoMcXxpY4G3j4E4C59NNFk9V2sGBk6
	IXpD8Xh3TxUAohFPdjkZoi/f0CCSNVwsjK9v+jsjOKnxZFXBSmh52YOwo41TIzOtfhRotsKXsCA
	X++pFIrLpCqLuK6ipYlCWqQAbOuz0vEbNFHA6dfxc2qWjxQTo2Z2H2Xh+VPwNhaolK/fck1RFcP
	YMTlmKCWhkPSG8Dk3V7gSElC9i1K0Lbbjj0nqtii+HV9POgzSZBJazOv4vA+n8Tesq7AXtRgq2l
	ghilVRuRc7uc2qV8pdYQU+CqXfgmIn9LPWA3jvVzUstOYdJcYViUhjYfDZDpkxySE/+S8582mSx
	v4qRaxPMnTO5Qq/HReCSi38MemHBCJ9oUyKIU20A4JId5HEPV+t8FWfXoANKlUYMAAYYKebKVxN
	0bdgcd/tNjLbB0iYW3zsBQpMByatcWSmwbgxrAHqtunIF5yxwsOGZlrTlqTSeH9ozBwKXSK
X-Received: by 2002:a05:690e:1406:b0:679:b98d:9b88 with SMTP id 956f58d0204a3-67a0e0331e3mr1078570d50.3.1792590452506;
        Wed, 21 Oct 2026 06:47:32 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:57 +0000
Subject: [PATCH net-next v2 13/15] xen-netfront: don't BUG() when
 skb_copy_bits() fails in bounce_skb()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-13-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=1219;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=9EvzAU9EO5dyvCGQMaA1nd2saqGuALWIDCXk9Xn6dMo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAQjp9kFMKs5+2pU2zx7IwIuaWfR/3YW8oytDjzI4+zZ1wUKMLjTsMaA+PjAnDttJOXuOtpmibb
 u+dc+qRy2bgg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1792590454-722AB2A1-06B00963/0/0
X-purgate-type: clean
X-purgate-size: 1221
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bounce_skb() is an open-coded skb_copy() for skbs whose data isn't
page-aligned, and it has the same BUG_ON(skb_copy_bits()).
skb_copy_bits() only fails when the skb's lengths don't add up.

bounce_skb() already frees the new skb and returns NULL when the
allocation comes back misaligned, and xennet_start_xmit() drops the
packet in that case.  Take the same path, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/xen-netfront.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index fdcb91042f29..17811d81937c 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -695,7 +695,12 @@ static struct sk_buff *bounce_skb(const struct sk_buff *skb)
 	/* Set the tail pointer and length */
 	skb_put(n, skb->len);
 
-	BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
+	if (unlikely(skb_copy_bits(skb, -headerlen, n->head,
+				   headerlen + skb->len))) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		kfree_skb(n);
+		return NULL;
+	}
 
 	skb_copy_header(n, skb);
 	return n;

-- 
2.55.0


