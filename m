Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04E609693A
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=kr0H6+XK
Received: from list by lists.xenproject.org with outflank-mailman.1472759.1680613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtn-0003W7-21; Wed, 04 Nov 2026 20:47:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472759.1680613; Wed, 04 Nov 2026 20:47:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtm-0003Vz-TR; Wed, 04 Nov 2026 20:47:58 +0000
Received: by outflank-mailman (input) for mailman id 1472759;
 Wed, 04 Nov 2026 20:47:57 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtl-00037q-ID
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:47:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtk-00DUt0-Nq
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:56 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99da-2eae-0a2a0a5409dd-0a2a4508964c-44
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:56 +0100
Received: from [209.85.160.177] (helo=mail-qt1-f177.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99fb-f659-0a2a45080019-d155a0b1dc8f-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:56 +0100
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-53634b8328eso9650621cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:56 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e7e728f87sm28503726d6.36.2026.11.04.12.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:54 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825275; x=1794430075; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0ofG8i+5G3+D6Lky4QQ+QewxWtJgEdu+4PNn/sRjok=;
        b=kr0H6+XKXUvBB2A5SCmhTrbHwCLJhC4CcSo4QA4uX9M7rcDpK3s39jUQHEEhfZM1F7
         BBbIA2meHQHICMjoe0+WLNimrc74eP+pBm8YVUWzVcPcDhtFeKnaLnaLjbFGiy8buyVW
         EwTMH5cfvc7l4rPTcUISC+7AIIm70TqIwCA0K2gZQPvfpGq6cQZGUmpkx5hP7QlFtnU+
         VzQqdpApNxBYgyOFx+N+9t83tcL/Jv477Ru1EVIKFCvas70ZWOxTiUug37L5T3oseQq1
         SxSEmlsWCRPoRCdvpgFS94C8fACcr/V0qfN9WXYEWNI10q53puxt5wfaMNJaQMjukh1Q
         f5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825275; x=1794430075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0ofG8i+5G3+D6Lky4QQ+QewxWtJgEdu+4PNn/sRjok=;
        b=KM19QDiaqw1hSNa3FEv8Hsn+kHXJjyhkUTH1p+uP4pfQpJeycNrut+Wv6tDAC9hrlF
         R+2zNsgrGvqEphfK3jnA/ale/J6kLlyNwu0ygFFtW+FJzVdPv5sfZORMQRUugFwrEKht
         0/5v55Hq2Y9xA2iWG8B9k7l7/YILpobNlXo4ynNQr9n+AZ8hymrXNsjWZ9RNjNy6Q2rN
         DbxRoZllRvbB1H97UJS90oFuYsBN0KYvV9Lxj9TSgt9xr2P2SxP5O1JaPdiTXePGCYKO
         ShQlZ+nLgsHaqIqnBaGjxMdhbzR5Inp0NbYCK1epYoxsl6zT+rD2jsnr6sH30MNepz3l
         bhfg==
X-Forwarded-Encrypted: i=1; AKwUvBz+JiBt3e6boRMxN7aQk3vWWFAj/5weXS+B0QEodhBpC2JvtwnsvzzjEMRWy+Cz5DlaOOhdawgrXdE=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/rUgg5PCN0yxxfYf1WV5en0yJ6ODVLyxjR2u7rTHc+xhDLxMzr
	BQGCrPlcbevLJRE81pGC5ZDqho5FRdFCz7SilrVDEsIfwEFB/mtFA0h4AkimJYhZv0o=
X-Gm-Gg: AYBFou0uQSAJ17PJJy1WX5d7VLiJnpoSR0GaazvDi84ixUbOk5TO/ATMjLxf7fqncKG
	ZHdK1DKVROIMecfDNYPC9MqoxPmp+e7ojURLZUhxTRRIIvhrTJWe4F8Pii8TBMRLYvjyJ1i8DYT
	hvOiu2vJ8MlgqSmw4VK7veX1F/uST4O8gsi7JytJmbRj2mW9qVvhYhp2EmINcspUva8B8gTFh6N
	/Vtlm5jt1ssZeRvJjkTmYNFlS3qsanKNa3T2pdqTDwlHSYGGHpxr2p8c6EDo8hqzL16cfbc7+g/
	JAl9iBuCn52Cr1zbluWxZ/1XhFY02vH2njCDN84LbOVB2da8bBHEo00lvWWsy3UZWmssGuncs7g
	GRNFaZ8eqveIaZjGUDEBpoawuQo8SAk8w5EF7HCEjoZvBHT/mo1NIA+udq45yXHpBePQIIgic8G
	eJ2Bo9tn4hRytYDm8GGRKm6NZ2kL1ZWLEUbH0x+dmA0cU7KBz++0VBvIlGnPd2tSO1+XgOivLeB
	SJ+IWe5fo2Cpm/8FxGYUQN63n4I3TCbgxH3PAEl3Z/lmH2XTOU0+gek0brZC6OasLWEh4lSSvCd
	X8N+qMUhcEPapr32FxSEo1RJQ6NrfsHO2uxzUkqQNiZQTmRFkxS3rpB5XCONgCz+MRc=
X-Received: by 2002:a05:622a:5b88:b0:53f:a444:dc7c with SMTP id d75a77b69052e-5489bf4ed8dmr148147081cf.56.1793825275132;
        Wed, 04 Nov 2026 12:47:55 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:16 +0000
Subject: [PATCH net-next v4 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-4-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825268; l=1797;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=wq7jmBov95d1ubPFIBwmfjjLdm8phK81PlxkHkS1v7k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QC+K6YoFA8/X2w62wsZpb6RlJydDVfMR0awgE6H/Srw2FuCPuHi1hJdV2my2TnKDRzcBlXa3JFb
 7M90ontNv/wM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c1860d/1793825276-CD34D87B-35A2638F/0/0
X-purgate-type: clean
X-purgate-size: 1799
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When the device can't checksum the protocol, skb_segment() checksums
each segment with skb_checksum().  If the segment has unreadable frags,
or its lengths don't add up, skb_checksum() returns 0 and the segment
goes out with a checksum that doesn't cover its payload.

Devmem TCP doesn't get that far today.  Its skbs take SKBFL_SHARED_FRAG
from the zerocopy uarg, so skb_segment() tries to linearize the segment
first, and that fails with -ENOMEM for unreadable frags.  No other path
is known to bring an unreadable segment here either.

Use skb_checksum_full() and fail the segmentation with -EFAULT, so that
the checksum doesn't depend on that flag.

Found by the Sashiko AI review of an earlier fix for the same path with
SG off.

Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/
Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
Acked-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 0082b12544cf..43bfaa010db7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5294,9 +5294,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 			if (!nskb->remcsum_offload)
 				nskb->ip_summed = CHECKSUM_NONE;
-			SKB_GSO_CB(nskb)->csum =
-				skb_checksum(nskb, doffset,
-					     nskb->len - doffset, 0);
+			SKB_GSO_CB(nskb)->csum = 0;
+			if (skb_checksum_full(nskb, doffset,
+					      nskb->len - doffset,
+					      &SKB_GSO_CB(nskb)->csum)) {
+				err = -EFAULT;
+				goto err;
+			}
 			SKB_GSO_CB(nskb)->csum_start =
 				skb_headroom(nskb) + doffset;
 		}

-- 
2.55.0


