Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4268460B90B0
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=nqYZXPQI
Received: from list by lists.xenproject.org with outflank-mailman.1472760.1680622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhto-0003kg-8f; Wed, 04 Nov 2026 20:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472760.1680622; Wed, 04 Nov 2026 20:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhto-0003kO-4j; Wed, 04 Nov 2026 20:48:00 +0000
Received: by outflank-mailman (input) for mailman id 1472760;
 Wed, 04 Nov 2026 20:47:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtm-0003Lw-7m
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:47:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtl-00FYWL-K6
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:57 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99e8-bab6-0a2a0a5309dd-0a2a450c9a30-22
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:57 +0100
Received: from [209.85.160.178] (helo=mail-qt1-f178.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99fc-f479-0a2a450c0019-d155a0b2d9a2-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:57 +0100
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-533778ab0bdso11880941cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:57 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-54b1086db63sm33603081cf.11.2026.11.04.12.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:55 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825276; x=1794430076; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=76u0opG5lCQGub1g5v24NFjQ04Vm85vyhWc2VR6fzD8=;
        b=nqYZXPQIbVE8MlPOwSsMgmbBKf6H8K7DShEFiBS4hvEnVH8PL1jQPPq9wb+eSRJVXa
         Bcezo0p8/lEuPF2ToBi6NSIv8wRyabdpGdifen0IBNN2WD/1qdYfXFaOGJe8ChNWZ+fk
         hogAu/2YJ722DgpIkCUndRQ78BVcTKskRG0VnVcSCdMFWFZU/D6zL47rkJNoio2EtD0c
         pxh845KqMzoytr53/u4rk/LLxmrnUJJxbivqKOq+dN+k9VlGAwdpk3EQNlwf5ht7Wa0L
         pHf3oKseuiOJFR5xl+Hn4fuy8BgeKhK8vfh9NUnsHRQOn52DKYulcA+8dArjV3b9R33x
         Omkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825276; x=1794430076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76u0opG5lCQGub1g5v24NFjQ04Vm85vyhWc2VR6fzD8=;
        b=exzmnWI/xL0ZQ+VUg3p/wVDnxh0iFYPfFXMEWOTgbmHHiizAEKoCBgsG7nalb3g8mB
         ycQmq16fTLlXPXxqpM+JRN+lLydCED2bVpHFIV1Szh9l7bZUnT2SeUfwfMRksXrQzM14
         gH6B/E0mFLEy4yUkvoz5MY6Qc4EEqn3GDdadODbGeYu6g5hiMj7a0z51koLOm7/UdFYB
         TiwdIamWxsnJkkxOS87jwo6sNbnTR+hzknqtTKnqYG26GlR02kFK71ZYWy0Kj69EeYZ8
         END0cg6LVyfSy092HFGHj7cusO3RbwCfMOfcXc/Xb0s/98sFIx5OD24cN8dIX+3SmkFT
         cxWw==
X-Forwarded-Encrypted: i=1; AKwUvBwdkPa0W9yUgFI2qebSYhQ+EaMiz3pt5u0uROtrTdwur4HFCZ04yNmkmDfSq3B1wOpE5MChZKJEQ1I=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8Lzk6kkdVpOPdDW7mjsa9qys0cHy/rkTstYzLCKJr7c3TvP+6e
	WmTkcgFOfja9ERqGcpEZi1ZIi6XVb+vO5w8Q6+my5fhOAU8YmHCi/7aCCg1no3kGRkM=
X-Gm-Gg: AYBFou34k0cuJLMyA3G0f/M6erh+R/WcKUbio+ESV4zp/Z25xEAprpFk/5ELx13K8xB
	mkA6kj/HOSTYms53iq8qW3P0nNEIBig+0ANQGm+E0wOAuBJIPNm2FSVwxsEInn6r7hakjU8CffW
	VnAiHHLXCNnU3FCyEoMfJXlJsr3FsGfEcKeYDQ+686nCxS3egzJk9V9RsoVnE8fn2INB1TS5axc
	1ddS/4utP1zPAQa/hNlauFBQEEDI13s6N8XmBzjhIa3RfLkGQW7LPDXoxzYZU0bGklyzbhNpLiX
	6rWjB5Qaj4wSvOzgdYkqab1IOshXGvP1Z4Xc6K95AUMiWiLyrOgWU8P/uCL44LeFriZuDwuWdCF
	soEkxD8loiiz58xaFOg0QFTnxuJ5n5Rz6DPXBKAY5YRHAHUtKWa5amWcwVKkWd8zn0QxJPwBZRC
	+3ncdho5EWTlPpf+vXUhT40wpwp64HvAXERfM8Dnq4BEKSNYvXheKSfUziZyLanUqPRLkrdADSs
	nKnB9ulSx3gyO1oLU3WGhcY4UwZY4CFshEsbB/XbgEisQsGbyOP0HE+dVeTuA8pLA+ca941QwVu
	9nKP5wP87xrEXK0U25ZMewn+bT00CZ+uL9oBEf6T+PWZRQ==
X-Received: by 2002:a05:622a:164a:b0:535:20ea:cefe with SMTP id d75a77b69052e-542b639cb3dmr296202871cf.18.1793825276187;
        Wed, 04 Nov 2026 12:47:56 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:17 +0000
Subject: [PATCH net-next v4 05/15] net: skbuff: drop hw csum if trim can't
 checksum tail
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-5-b7ffeb364f5d@toxicpanda.com>
References: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
In-Reply-To: <20261104-b4-skbuff-bug-on-followups-v4-0-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825268; l=2083;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=VhuNRWOW3RZfgkvn1rBlfP7PvQEEgt9QwL/nWscgVi0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEREoQ9M5gk5NXv0IYrsYL5d3xD0iqwQBzSWkwyENQ0s2oG9H/Gc4OPqk98ZP46iyupEQkfEnKm
 OaNK0sIyfUgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793825277-02EDAA5B-EAB0FD4E/0/0
X-purgate-type: clean
X-purgate-size: 2085
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For a CHECKSUM_COMPLETE skb, pskb_trim_rcsum() subtracts the checksum of
the trimmed bytes from skb->csum.  It gets that checksum from
skb_checksum(), which returns 0 if the trimmed range runs into an
unreadable frag_list member or past the end of the skb.  skb->csum then
still covers the trimmed bytes.

commit 2e357f002c61 ("net: Avoid checksumming unreadable skb tail on
trim") handles an skb that is itself unreadable, but not a readable head
with an unreadable frag_list member.

Use skb_checksum_full().  When it fails, do what pskb_trim_rcsum()
already does for an unreadable skb.  Set CHECKSUM_NONE if the remaining
packet can be read, so that software checksums it, and fail the trim
with -EFAULT if it can't.

The stale skb->csum was only reproduced with a hand-built skb in a test
module.

Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 43bfaa010db7..66ba9bfa8fc7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -2821,9 +2821,23 @@ static int pskb_trim_rcsum_complete(struct sk_buff *skb, unsigned int len)
 	int delta = skb->len - len;
 
 	if (skb_frags_readable(skb)) {
-		skb->csum = csum_block_sub(skb->csum,
-					   skb_checksum(skb, len, delta, 0),
-					   len);
+		__wsum csum = 0;
+		int err;
+
+		if (!skb_checksum_full(skb, len, delta, &csum)) {
+			skb->csum = csum_block_sub(skb->csum, csum, len);
+			return 0;
+		}
+
+		/* The trimmed bytes can't be checksummed, so skb->csum can't
+		 * be adjusted.  Software can checksum the remaining packet
+		 * after trimming, as long as it can read it.
+		 */
+		csum = 0;
+		err = skb_checksum_full(skb, 0, len, &csum);
+		if (err)
+			return err;
+		skb->ip_summed = CHECKSUM_NONE;
 		return 0;
 	}
 

-- 
2.55.0


