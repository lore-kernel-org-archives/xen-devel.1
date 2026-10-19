Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494A7CCF2E3
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454381.1667967 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlj-0007WU-VY; Mon, 19 Oct 2026 13:51:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454381.1667967; Mon, 19 Oct 2026 13:51:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlj-0007WL-Se; Mon, 19 Oct 2026 13:51:15 +0000
Received: by outflank-mailman (input) for mailman id 1454381;
 Mon, 19 Oct 2026 13:51:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInli-0007Tu-P5
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInli-009uw8-5s
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:14 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6203e-8faa-0a2a0a5109dd-0a2a4504d8e6-38
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:14 +0200
Received: from [209.85.222.174] (helo=mail-qk1-f174.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62050-b57f-0a2a45040019-d155deaea41d-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:13 +0200
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-93f2ed2541aso165362485a.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:13 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f332739d7sm575249785a.28.2026.10.19.06.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:01 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417872; x=1793022672; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aRCuku2oKEDF0Op1/pBMZnZUn6snlu290Nklz94qvM=;
        b=nFQDfc98Zx0rxPble0Rr2HynSduZ4Q339uVr5Dq45zQOQuHCE8/NWakmwX/ZG7VqWZ
         ViP2DrZUjjLnB2OD/ZmLJptzf7HJXo9P+diG27+6uD/yjAOtwbsz/Yh/gBxlb+QfKqgV
         l34+XKHH08HdfxbjWeAQz+/ZY5YFTraKUbvM4VsWXgap312Vjl2EOKCD1EeJ1zBSeZMn
         FCAFt4e5ujH+s98L8Xk5tROXVzs1qWcj+ek18MMs8d8/iRyx8NzxFiDDJIptEaUVqXNd
         5qMMmzIk1UaDNlUdvqj9sC0aoBYCIZoUM7mhBRwi7g3vnbsz9nfNmyZZunAYkPG+nJSb
         Hv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417872; x=1793022672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2aRCuku2oKEDF0Op1/pBMZnZUn6snlu290Nklz94qvM=;
        b=zuj7cfDXlwexzRbsth3rxh6PaECzVT9LP0LY3yDsy7Yo7ym2CuSzCJdZYOEAkbf/WK
         FreC82M3DFFynD6gule/9Pv1ambgs7EV72hd3HfvZgh7iKsaqrr4biNQrXbYXS6q0ikj
         /Ex74270op4qLPfkAz+rEvW5SmaLQn5VrwYzxTiceJMEkLasZyoS4tAfUpTyY2nKkss+
         1GoMZiu1OZtA+PsO5pyym+wjUoZRjR3mLdQ1qP2iBiBAACTQg7gaTRQ97m1YtEwN8Xi5
         3lOi6dl22/zeaD4AFSTlbL1aemObV6J9y0d7wLZ4UhZSutSgK33aN+W3ZfXxNM4pQo92
         lgDw==
X-Forwarded-Encrypted: i=1; AKwUvBz4/DaYn4RXONjEHAnCBH5FDxMQvCaMKsRu8EojLE9MXmD/h3r3RfcjTk04sDErgrdmmvXbBbJ/jPQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLsrkO7bbdAWjuLRdJXUyFyNfPv4/j3pIq851fSYUSeKjwDUMkR
	VMDjo4hsdHjY3RgGP/G+GDOZE0q84CNTw5i+CvoeRArO3++eCo/Y9WgbFPtTXJKDAjg=
X-Gm-Gg: AYBFou0MieoM9mrP0qgJbLNPnesLSkl30CI8YcfjM9/0tONJJxyuEEoxGrzj9oldg8T
	+UZdM3wxH2Dtk1REq9LodknoFu82XvrwcBNAJSFYHx0Op6n/iz4HL6yJwTL2NUyhnRi5M3Zix0+
	SQ4RHs1ImR7zlHzxezw8HlUJIT2GXvJ/3+6IMy5BDyQnLeJssm7ypy1D55XrkGxMbpOULAajh91
	CGxVhrm/eke4hdZ2BMDGrjRU368lFSoUL+YKA8kZN4YhwxFXvU663EhlmQUDOOXU8NeJ+/MkH3x
	PbglixYdmnq62UANi9/+7zuO2NjT/PmhswxicCwFklS+t1vT9gFunesseOQD5Vd3zj64pGrBvO1
	2tte3R67Ur4GyVWthKl/E+AMm1yKXhc/GozuThjObheMWw47KWCbjVpw/9jO21Vfq3Ktce71ZY1
	uMWsQ8Y4d7JGYP1QVi/V3yAUJ5uppvyfihnXQ3wO2REL8p52tL2cNcvNAUD1tvsHdBffqu/mt7k
	xxHVNRQV+7OqAw=
X-Received: by 2002:a05:620a:4608:b0:93e:fcac:a91f with SMTP id af79cd13be357-93f17f9f371mr1747377785a.37.1792417872286;
        Mon, 19 Oct 2026 06:51:12 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:38 +0000
Subject: [PATCH net-next 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-4-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417848; l=1895;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=wii8wzXlG4ePvSd6K5rd8H498XoB8iUyEaQEAS7r5bk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFNR28egIht/ZoRyU32fPc4iNKinzI14ufAnhDAIIBXEpJO58NOkbKAc331mB1ZlQKPGaXOwjPS
 ler9rEAlgTAU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1792417873-C30CDB50-9953B032/0/0
X-purgate-type: clean
X-purgate-size: 1897

When the device can't checksum the protocol, skb_segment() computes
each segment's checksum in software with skb_checksum().  With SG on,
the segments share the original frags, and a devmem TCP skb keeps its
whole payload in unreadable frags.  The devmem MSG_ZEROCOPY path never
sets SKBFL_SHARED_FRAG, so the __skb_linearize() fallback is skipped
too.  skb_checksum() then warns and returns 0, and tcp_gso_segment()
writes a TCP checksum that doesn't cover the payload that goes out.

That's reachable with tx-checksumming off and SG on: sk_setup_caps()
still gives TCP SG and HW_CSUM, so the dmabuf send is accepted, and
harmonize_features() strips the checksum features but keeps SG.

Use skb_checksum_full() and fail the segmentation with -EFAULT when it
can't checksum a segment, as skb_segment() already does when it can't
copy one.

Found by the Sashiko AI review of an earlier fix for the same path with
SG off.

Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable-v1-1-7e2334a55fe8@toxicpanda.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 40d2dd20d47d..88ed2dd99dc0 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5239,9 +5239,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
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


