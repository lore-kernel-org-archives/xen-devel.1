Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A354606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=MIVy3/0s
Received: from list by lists.xenproject.org with outflank-mailman.1468947.1678014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gs-00016b-KH; Tue, 03 Nov 2026 02:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468947.1678014; Tue, 03 Nov 2026 02:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gs-00015y-Ee; Tue, 03 Nov 2026 02:29:10 +0000
Received: by outflank-mailman (input) for mailman id 1468947;
 Tue, 03 Nov 2026 02:29:08 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gq-0000os-P6
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gq-00BP11-5y
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:08 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946df-bab6-0a2a0a5309dd-0a2a4502d736-24
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:08 +0100
Received: from [209.85.222.173] (helo=mail-qk1-f173.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946f3-6ca4-0a2a45020019-d155deadc0b4-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:08 +0100
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-93f22a8515eso350685085a.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:07 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94425ac5322sm974378785a.39.2026.11.02.18.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:05 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672947; x=1794277747; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beA32Wl5uGeVdDRquUg9onzNEjLmSlivsd983Tz/Vmc=;
        b=MIVy3/0sBd1CCo+yd20XI3EDIHDtOeHsAt9I3WRZjR6qRIKFoVQbVHc4uQUmse5rU6
         vpT09fpdavPkLlzyFTY/b0FqA1DhV0HfW/uIldt+0/azSKTddXZBYiLqYY9O/gBlYhe/
         ewFkizTnzGK6GMOMQXOarmQfa1IjLJL5sahxyy94MBdy5WMhACHxYBf4/7DkrO+SmRtj
         M2ghZeM9rLnLmC3LIizqm4g6D9dQ6/aERPd+jtIA6dwkpIFmzlpeQ7YYGeCrHz0aV/KF
         XAgosV3F1kWG467TbHmGr6tSyd+cP51mQ/ynjaA8naVqi+F4YnOUWqfUIZS/mqUoRCXK
         ekUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672947; x=1794277747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beA32Wl5uGeVdDRquUg9onzNEjLmSlivsd983Tz/Vmc=;
        b=lBvoRlpIsX96pfnJP2QI55hojGMrhd9+Os7xJhe1q8OcaIQ81QtZeSUMm26SRZlgNg
         axQohsPn+5CqyC190cghh//7Tjrg/wlOjB5YmeN+tEVhxKDcY+5jXsYXtXSFf3+T2rFN
         VKBPTEOP6SmfnDsD/uLmhZgDv5T4RvjNDxZqqzzCb5hGkQ4qEvoZJFDgh9+ViGIeefQb
         SE6pxMiqHdybTjYiU5zMEHv8qiJA1xN+Yj/3EPXypDTJWLcp1sMO8+iQXZF5G15+mTLc
         M166AFU48LDY3Uopw246ScrdxfH0BjpWqLWjnaP5Y1VhXGXKiusABJsAv0isd40kKNf8
         BVLA==
X-Forwarded-Encrypted: i=1; AKwUvBy+9F/W8+zlyBRu20ABmYruvES1SQwhcBMm5UT5GDkOLurON20XSFArz4LTf/EPu1hF6lhd4i4bsfQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYImJsSLEIOXASdemLk0XFXUzkbCuRyu1fYDkmVW9XbwyafbZVca
	bTFUnZqqlxm9Qkp6DYELtEN7C72bM0+LBW8uwkk1IJOt7SzsC2qNaC851Alce9BXBwg=
X-Gm-Gg: AYBFou09tXr85cOsgdoARSwfvbLxWItThftVKzpF6AAMw4bvPLFpY2cZT37gSciKpEq
	KabFMeYEPHUPRgtNgzitZZegebk4CD1y2l4eiCsY+uptrkFRPxKrN2Nna7PbWDSENTsAK6zHts2
	+dfU0TxHKqW33+BxPWOOQBJyRK+T66SXiFZ2H/tOi43seeOcvioB++FC/eny8RyBfLolz4bkcR3
	7loAnhncJFvaNmXuAdFtyZzUi0x6HYMSaYiHg2uRXGEanKbNyQ3+3J1Kj+qAsEDMWagjRt4Tb/1
	lE7ugdwtHJhKX9IeGepVoV3cg/il01P+V+7L+M7bfUj4VOpZTKoIbhc3U+kP2ZliV+9HGdXtQ5+
	04rf9i4QqNW/CDL9aD8hW9A7ZkWmI6o2GjBArFxaqfmbxQ8T4fgX4LPbo9iMoM9iJ0oMhO3QXQg
	BaHkJyqMKO+BkoUpSBx7SZqsLY61gv2xV1sME7/GiGKYDP3+cmsEa9KAITKN6lkesxb/9jNa5yw
	B0YvWRT//xHk2yaU81jrYQbpqkQYNDdPP5SGicU1Lv/sjJGUtrOb8gVHuXFsUM8tIXCe/cBq9TY
	Qe/9zAaayfgZL2IAck5HQ624s8Dm/JrfZJ2xRUWl8Z+fKw==
X-Received: by 2002:a05:620a:2b43:b0:93d:92a9:1a5e with SMTP id af79cd13be357-94421799683mr2059957985a.37.1793672946476;
        Mon, 02 Nov 2026 18:29:06 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:37 +0000
Subject: [PATCH net-next v3 11/15] net: skbuff: don't run off frag_list in
 skb_segment()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-11-54ad0ab57614@toxicpanda.com>
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=3043;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ZFtZ+wZ1/BRwvrFDewd6GJQ8sWu7jAVgTMehQH1Him4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QF1JASk2FaQ2hzp9j2Mg5ifJ5XQ/M7YFkqH/XBR1KN5aCYeKq0yVaHYAgZGVZBKc6lSw+ESgzWk
 7uQyVrofUxQU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-720697/1793672948-31BC82AC-DCA57C44/0/0
X-purgate-type: clean
X-purgate-size: 3045
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_segment() keeps going until it has segmented head_skb->len bytes.
It takes the data from head_skb and then from each member of the
frag_list.  If head_skb->len counts data that this walk can't find, the
walk runs out of members while it still owes data and dereferences a
NULL list_skb.  There are two ways to get there:

 - head_skb->len is bigger than what head_skb and its frag_list hold.
 - A member has a frag_list of its own.  head_skb->len counts those
   bytes, but for each member the walk only looks at the linear part and
   frags[].

No path in the tree is known to build a GSO skb like either.  GRO
flushes instead of chaining an skb that already has a frag_list.  IP
reassembly does nest frag_lists, but a reassembled skb isn't GSO.

Check list_skb in the three places where the walk moves on to it, and
fail the segmentation with -EINVAL.  The KUnit cases in the next patch
hit the NULL pointer dereference without this patch, and at least one of
them hits it again with any one of the three checks taken out.

Without SG the payload is copied by helpers that check the length
themselves and recurse into a nested frag_list.  That path still fails
for a len that is too big, and still segments a nested frag_list.

Found by the Sashiko AI review of the BUG_ON() series.

Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index e3fc6291d223..b2c44a58db23 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5164,7 +5164,16 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 		int hsize;
 		int size;
 
+		/* list_skb runs out early if head_skb->len counts data that
+		 * this walk can't find: bytes that aren't there, or a member's
+		 * own frag_list, which the walk never looks inside.
+		 */
 		if (unlikely(gso_by_frags)) {
+			if (unlikely(!list_skb)) {
+				DEBUG_NET_WARN_ON_ONCE(1);
+				err = -EINVAL;
+				goto err;
+			}
 			len = list_skb->len;
 		} else {
 			len = head_skb->len - offset;
@@ -5174,7 +5183,8 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		hsize = skb_headlen(head_skb) - offset;
 
-		if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
+		if (hsize <= 0 && i >= nfrags && list_skb &&
+		    skb_headlen(list_skb) &&
 		    (skb_headlen(list_skb) == len || sg)) {
 			if (unlikely(skb_headlen(list_skb) > len)) {
 				DEBUG_NET_WARN_ON_ONCE(1);
@@ -5294,6 +5304,12 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		while (pos < offset + len) {
 			if (i >= nfrags) {
+				if (unlikely(!list_skb)) {
+					DEBUG_NET_WARN_ON_ONCE(1);
+					err = -EINVAL;
+					goto err;
+				}
+
 				if (skb_shinfo(nskb)->nr_frags &&
 				    nskb->pp_recycle != list_skb->pp_recycle) {
 					nskb->data_len = pos - offset - hsize;

-- 
2.55.0


