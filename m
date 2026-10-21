Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37312606A323
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=AFSJRYlk
Received: from list by lists.xenproject.org with outflank-mailman.1457188.1670127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf9-0004uz-NB; Wed, 21 Oct 2026 13:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457188.1670127; Wed, 21 Oct 2026 13:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf9-0004tx-Hj; Wed, 21 Oct 2026 13:47:27 +0000
Received: by outflank-mailman (input) for mailman id 1457188;
 Wed, 21 Oct 2026 13:47:26 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWf8-0004jK-QC
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWf8-0065O0-6r
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:26 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c269-2eae-0a2a0a5409dd-0a2a4502dad4-20
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:26 +0200
Received: from [209.85.128.179] (helo=mail-yw1-f179.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c26d-6ca4-0a2a45020019-d15580b3d5f7-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:26 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-8b10ac6ab7bso7014097b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:25 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b1300c85c9sm11376607b3.23.2026.10.21.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:23 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590444; x=1793195244; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i59cwFpnwV4ZWelO27hAghlfIgiy6O8zXnZ0ftvy/nk=;
        b=AFSJRYlkxA9bwg1z1aVODNAMPx1P/r81DrySWCFC21j+/ayftiAUfZ5QszzmcyR9w0
         zkxv5/c59BJ5jX8FXdp0QbRM9PQm62jOtA8TR13hI2gnaObq0A0ugVIpFQ37O8jk5nV7
         UApyYq3xbv++NmE9CuOYFUncluJNy4KpiXpOeZfrO5OGfRvwBodI2j+v1UTXV/97Em1p
         PbxR7+72IgvkJ/GqmQSLJWG4u686NJL7Ej2JbXccVes6dLpz54sH1G3p9g2gnb27v7Mo
         LZpenyMx6uagZ5kuE8VpSen7TMDrjX5+gXr2CYvKNFlpeZcSJXvSTIq1Mxmq9PZa6abF
         q9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590444; x=1793195244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i59cwFpnwV4ZWelO27hAghlfIgiy6O8zXnZ0ftvy/nk=;
        b=RNEOKM4wbWZ2Wk6irQ3J4/dAcoOmbfHnF45mgWLiZBHgGRpDG0C6NDPUt0+N7FomDf
         kpwbRjxaElNhVor77mVcarLu43GgZ/2NG/XXZq+3O42XZX+Q/KTSZbTnNpk1yzJ+1yc6
         ma4PUyRpASEw+9jNCXk+u/QaKLfcqcZD3reqcIJs1L1jGVwWIWCAjd0yggQZnrQJuQ0d
         sSwXEDHDJGpc3Ozc9cgH4LawMp8bEI3Nw5+4FiF2PDnrIsvheI9CiEmTZXWpoDBDTeQl
         pCoJ9lfpvGfElUKN+JMQqYZCHX7z6cbibUgwdiMdpsXvRswJT1rLzuDT/yj3bM4S7OmB
         2qNA==
X-Forwarded-Encrypted: i=1; AKwUvBxOvprTMXI91k0OdhUuWkhREJvt/LfCY6YTG8YX3P5d8JYeN4DS3G5nha+xBSoP1bS0t5SRFBMqIqQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJztPqYfaJH6izdEL89oub1yPu33jOWtOtQg6fxe5n6Lom2VWEC
	w4NWzaeLajfdNhn3ZU3TgU5mtCkyhxii4GqCgRF6wHUdAMGgNczxHqyJZcYCAhSP3Qk=
X-Gm-Gg: AYBFou10a6NwBUjsHYXN4LIzqvvwFHN/CseLaHRN8dIlslQMMuYB9So1k/2XN+CxP3N
	t8UiQZ9K/9pIOB0YnwzL9GgQ3cWNZF92IlGRdcHw1E2p6VPrMuhb9dmY3GzkPNzO0J7uUBOyHGd
	7ly82iPZpng1JT4Z2Th2rVJYnts7vQjSW9knY2plfJiCWzI+bKWyhBdT809S09hMOfZGw1AtbO7
	46QuAFrJMF25zuZ3DNdWKgwgVvA2h73bWw1svgbnTgXRyKSLVesGZy6ibkjgIS3UPaIOVzfaKR+
	zl1SjZNNZg5YDltkveEzAXdSXIWER+qExiZiIPAJDv3OCGxc38HCd31TB5TCAbwmEzLbhEApIKp
	8m7r1YzscOQqD0Ffuy/Xs06PIvlZGgu3xTsCjZRcl/0nb8uPDjUFnd5TgLHUXi6VwGqiv8PYAnX
	R6Y10sNy5/TQyvPHi9/SoJ7gt2qhRAL/qKCTxCKBW8HNLv+WFBXIbvVEEkIU4tauzSjuoFLUhqw
	6fkrkA/kPgJ62pHHT479j3bi3X9gnLrwnQt0hRe79jXJkTGHpVMxBJYstUoHN5heLZz99cWxFI5
	SIrRsLXX24DMHidioA==
X-Received: by 2002:a53:b651:0:b0:676:a43e:ea5d with SMTP id 956f58d0204a3-67a0e53f355mr566093d50.94.1792590444386;
        Wed, 21 Oct 2026 06:47:24 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:53 +0000
Subject: [PATCH net-next v2 09/15] net: skbuff: check csum_start against
 len in skb_copy_and_csum_dev()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-9-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=1647;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=sxMOxEm7hnqJ4JHjLlLYqgrWX5cOQpVgaNwl3bOsGCc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJ5DZXQlsw5+XJkbUArUHkgGRU3eEEoiu+2jmTppSATvScEPdtV2sfsGUnIAGlonU/HYjZGtwF3
 0pwcvexSMIwc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1792590446-309C32AC-27F8C5FC/0/0
X-purgate-type: clean
X-purgate-size: 1649
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 56453199d28f ("net: skbuff: don't BUG() on a bad csum_start in
skb_copy_and_csum_dev()") checks the checksum start against both ends
of the linear area before copying up to it.  For an skb that isn't
CHECKSUM_PARTIAL, though, the checksum start is skb_headlen() itself,
so the check compares it to itself and can't fail.  If data_len is
bigger than len, skb_headlen() underflows to about 4GB, and that
becomes the length skb_copy_from_linear_data() copies into the
driver's bounce buffer.

The old BUG_ON() had the same blind spot.  Also check the checksum
start against skb->len, so such an skb takes the existing fallback,
which copies at most skb->len bytes without filling in the checksum.

Found by LLM review after the series that made the change was applied.

Fixes: 56453199d28f ("net: skbuff: don't BUG() on a bad csum_start in skb_copy_and_csum_dev()")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 5c89c463f234..782a6bacd568 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4103,7 +4103,11 @@ void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to)
 	else
 		csstart = skb_headlen(skb);
 
+	/* skb_headlen() underflows if data_len is bigger than len, so check
+	 * csstart against len as well.
+	 */
 	if (unlikely(csstart < 0 || csstart > skb_headlen(skb) ||
+		     csstart > skb->len ||
 		     (skb->ip_summed == CHECKSUM_PARTIAL &&
 		      csstart + skb->csum_offset + sizeof(__sum16) >
 		      skb->len))) {

-- 
2.55.0


