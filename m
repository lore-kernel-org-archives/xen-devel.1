Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97360A3804
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=cRexcqVw
Received: from list by lists.xenproject.org with outflank-mailman.1457190.1670143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfD-0005YL-PA; Wed, 21 Oct 2026 13:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457190.1670143; Wed, 21 Oct 2026 13:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfD-0005Xa-Kt; Wed, 21 Oct 2026 13:47:31 +0000
Received: by outflank-mailman (input) for mailman id 1457190;
 Wed, 21 Oct 2026 13:47:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWfC-0005Ke-Nx
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWfC-00AIKh-4e
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:30 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c26c-e002-0a2a0a5209dd-0a2a4505b806-32
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:30 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c271-4cb1-0a2a45050019-d15580acbd92-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:29 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8b0db268bd8so4644947b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:29 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 00721157ae682-8b1300715cfsm11333607b3.14.2026.10.21.06.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:27 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590448; x=1793195248; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KWwlh/hCg0SMpmIsRqC2+1Lcm/oFCtvXzTkdFFgQUQ=;
        b=cRexcqVwq2TgMJKWPGrFBijzh26jWGKVqRwZtVeSGdPObAKLku5b9crhqx7ZHPNWcB
         ztrDn78DB2q7PlVnZ8CjHfOcOxVN8/zDc6KvMsLHYMl4NcIzyrqTJQQAQyr+GDku6oY2
         nVFqXTVrPb9CIQ6OpAgoqfDXo8Xd/1M1tH5tv3Y5WveVnBJvDqDLiswXEoWyuNkWhAiD
         g20gQOD7mGYLvqKRL0bcspVxxZAO/8yOKdt+Bj71Iv2TdKOqCiynUM+f3QyXo4cN8ZbP
         aFpLPrONwBbCWGRt4/UaKDt1ksEcWhOTzxaWLjdPcZ/3EaYPy2FjZNpivKRq0O/K58/j
         AwVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590448; x=1793195248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KWwlh/hCg0SMpmIsRqC2+1Lcm/oFCtvXzTkdFFgQUQ=;
        b=1R4VhZ7n6+uPXr4IGQLmmMHKuq38lu3A8YwMli8ZngUBgTC4//xOLPde/kztfQjMDz
         EN7NKhPJAPPVxjCfFzLhIM22jOuTkwyFq1hWkt1kvAg/twk1rfYk+jLmr700DTk2HzZy
         0tHc+QCJfPHH9/Wxujq+JN+IvgcMDBe0sIokV7N7eyr2yCpFD961pY65jb2u8986nTtL
         sEVeLZS5dzqacOep3kUQvF/SeiSSF98KNflzPRQ7TPP2HUm4M+G8xkm7i1wjtmGZVPXx
         x+6VRmKyx+5vQDTR//+OkHXBVKXD/NfSFC5anZuhg19D+Y/kdrlN8uoaITJ//kjER8OA
         2GzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3RwuXj7nLWGo121JjvuMlYx6P2UWtmnEr1fDgKhn663u6jhUUTFlGFGH4um0g3L3G361nvqAZrGM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLwSMcIlHA227rDrjnC71juxwqInLPjO/HK4d5CCT+0w17jG5tN
	LR6tBVZq89Wusrw+SkvHOfWmSJh31itBpm27jmj8zokjHcuKt1gpyGMu1EG3VAQvXTZ5M9KfH9i
	QSQ3g
X-Gm-Gg: AYBFou0mfcOlIDUd2rZ+LjLSQBkyMKEorBtZ2UK+TElWBg0ZYPrFVvQ29ffGXSuyJLX
	DQDWreF6Degxilo8xGDZlY2dOPRjAkKJouqZecBLf1nncv2VXmDNVgB0HUdZ7h4Tj/VIWA2dxOV
	XPih/gb8dP+OoyEwnN6QKFc7WbfV77RXkv3IRbA0aOOQV7GXn2LipqNjJDTeItkd8gSKSznAMHt
	siVQqw0kyXvgHCmB+WqE5SVUNF4ZDwVTK6zP11qDEkHhYqOMkKbsmueUNTM7eR7s0ZXSZbWYd8n
	/JqB7r0e4v9uwCIneBBBaOiGucUi62u3LKTZToA3KOA3GmWyDutcQI8pjvnAiDaOT2Pi03VliZj
	URqatO51rLp2uMSQeY/bQQTMdIVh1F+l8rrGWH0a34D/rAWMs+n9w/7Esf7YFPcp8GzLtYufrL3
	jG+2cdutsnIJWYkXScdthgDFndLfm3Ca8T3uVpyPUMjGnDfx21I+ZEDuGKXpKGRxVO8XlyXxG+e
	wDDW5hQgkDCLnv1Mhc4DjpKDmpO1lEjTtqKU8hwdIrjn3P13by2zwuwFibu5QjO8pkaP5fy
X-Received: by 2002:a05:690c:d87:b0:873:5bd1:98b7 with SMTP id 00721157ae682-8b13403e9b6mr12177067b3.41.1792590448219;
        Wed, 21 Oct 2026 06:47:28 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:55 +0000
Subject: [PATCH net-next v2 11/15] net: skbuff: refuse to segment a nested
 frag_list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-11-2aa780a03524@toxicpanda.com>
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
 xen-devel@lists.xenproject.org, Willem de Bruijn <willemb@google.com>, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=2884;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=bYC4uz0w4NZKAYryGVW9UUHYf9kR1dL3ZNzRUgIMFMM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB/boFORXWtYqGQkg0oKg7TLwyvigi4nOkir+rQFpE7KoN+Aub774BEuZtAZae7bNyllztx+HmX
 8eAIEPekArQE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1792590450-72CB02A1-614AFCFC/0/0
X-purgate-type: clean
X-purgate-size: 2886
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_segment() walks head_skb's frag_list, but for each member it only
looks at the linear part and frags[], never at the member's own
frag_list.  head_skb->len still counts those bytes, so with a nested
frag_list the walk runs out of members while it still owes data, sets
list_skb to NULL, and dereferences it on a later pass, before any of
the layout checks get a chance to catch it.  When the member is taken
whole with skb_clone(), the pskb_trim() that follows also drops its
nested data.

Nothing in the tree is known to build such an skb; GRO flushes instead
of chaining an skb that already has a frag_list.  Check each member as
the walk takes it, in the GSO_BY_FRAGS, clone and frag paths, and fail
the segmentation with -EINVAL if there's no member left or it has its
own frag_list, with a DEBUG_NET_WARN_ON_ONCE() for debug kernels, like
the other frag_list layout checks.  Without SG the payload is copied
with helpers that do recurse into nested frag_lists, so that path is
left alone.

Suggested-by: Willem de Bruijn <willemb@google.com>
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 56cec58bccb7..c5e28a52114b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5087,6 +5087,15 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 		int size;
 
 		if (unlikely(gso_by_frags)) {
+			/* The walk only goes one level deep: running out of
+			 * members, or finding one with its own frag_list, means
+			 * a nested frag_list that head_skb->len counts.
+			 */
+			if (unlikely(!list_skb || skb_has_frag_list(list_skb))) {
+				DEBUG_NET_WARN_ON_ONCE(1);
+				err = -EINVAL;
+				goto err;
+			}
 			len = list_skb->len;
 		} else {
 			len = head_skb->len - offset;
@@ -5096,9 +5105,11 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		hsize = skb_headlen(head_skb) - offset;
 
-		if (hsize <= 0 && i >= nfrags && skb_headlen(list_skb) &&
+		if (hsize <= 0 && i >= nfrags && list_skb &&
+		    skb_headlen(list_skb) &&
 		    (skb_headlen(list_skb) == len || sg)) {
-			if (unlikely(skb_headlen(list_skb) > len)) {
+			if (unlikely(skb_headlen(list_skb) > len ||
+				     skb_has_frag_list(list_skb))) {
 				DEBUG_NET_WARN_ON_ONCE(1);
 				err = -EINVAL;
 				goto err;
@@ -5216,6 +5227,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_skb,
 
 		while (pos < offset + len) {
 			if (i >= nfrags) {
+				if (unlikely(!list_skb ||
+					     skb_has_frag_list(list_skb))) {
+					DEBUG_NET_WARN_ON_ONCE(1);
+					err = -EINVAL;
+					goto err;
+				}
+
 				if (skb_orphan_frags(list_skb, GFP_ATOMIC) ||
 				    skb_zerocopy_clone(nskb, list_skb,
 						       GFP_ATOMIC))

-- 
2.55.0


