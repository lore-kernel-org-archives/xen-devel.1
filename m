Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A1E60B90B2
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ER7WJ2Kx
Received: from list by lists.xenproject.org with outflank-mailman.1472758.1680604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtl-0003Hs-Qh; Wed, 04 Nov 2026 20:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472758.1680604; Wed, 04 Nov 2026 20:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtl-0003Hj-Lo; Wed, 04 Nov 2026 20:47:57 +0000
Received: by outflank-mailman (input) for mailman id 1472758;
 Wed, 04 Nov 2026 20:47:56 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtk-0002la-AY
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:47:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtj-00BcE3-NR
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:55 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99ea-e002-0a2a0a5209dd-0a2a4507c1e0-14
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:55 +0100
Received: from [209.85.160.178] (helo=mail-qt1-f178.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99fa-b4ea-0a2a45070019-d155a0b2d40a-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:55 +0100
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-53c4b82919fso14039711cf.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:55 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-54b10a7006asm33796401cf.17.2026.11.04.12.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:53 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825274; x=1794430074; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VmZ/3gC03rOFS4IvFRf+urbZu7mk8uManzJKXnUZilo=;
        b=ER7WJ2KxQWtLg8ehy0NfGsVeGwsog8MGdRF3EP8g08Jy2JS8G+gfrch38webm5p2Sv
         QxjHPk8i7+/m9bHXUt3yHMwC1StY6fqmzapJrJUrcMCp9rikF7a227SqWmaSEyTjzTTB
         0olHFJP7Cr+1DDbt3ZU9vp72TR6Wc0saunwqmUTHvDfiF1oWbx36Yms359/gPrkhFPPa
         /eJozkvX++34c0FinZXJOTpmQs9K6AeMhr52vbSTejOBd1G/3Kpot79awyyM3zGnaW4D
         Lg/zWDBYq+JOLTbX6ClxpJllUF0UO3/GXIwiSYODW/TsBMCy4A6nshfZumdwujoQMbZp
         fUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825274; x=1794430074;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VmZ/3gC03rOFS4IvFRf+urbZu7mk8uManzJKXnUZilo=;
        b=FWEcPHOTUdmuefWrEVuA2RGi4JLXrEivBwcTK3kyF3T57EoNRxwBOc8zZqhalPWxaJ
         bQS743wEv7vsaTo10cb8bA2KLXeIZwmQoypcO/Z+1FxCOPCpVFzSaT+/mt/xI6+AehX1
         HwrL3rkUhW9mIIvz7q1dnRC27zY5ClrqRD5xcwSoiOJY7n+kOUZelaXVwNMYK2qCZjL6
         L7aAQ791mXmEgGESAcTkdZdETqwy5GiiehXGpIUt2RAmYSWQbeu/ugnVTKh6EWB+rtbi
         XRgOW+ApKo69dKHAPQHylx+l5CUORGx5PfRh0TaFR1sPSKExwuaIYNoGkXUjJtKSzsSj
         chDw==
X-Forwarded-Encrypted: i=1; AKwUvByXYOeK6BwB+Ecb0x0z+l/pWYD9cArbBcgSlNVU7PSHp7DIAxKXGMpJZq0lWRkj4Wjk3qFktwOXTB4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/cGCX88rtqeGcV/Q6Ze8hNZXk0p08LdSPoPV6NxLSz/6ufcMep
	tkgpff3O4XmBdh7+41BBk5peMvsxH3FkszsOvx1gY63qtr9/4dufsFkCdoqINFP1WLA=
X-Gm-Gg: AYBFou1qXZnUYSNuykV3FyU54Drh7FspFgBYMa4N20ydS6A2O9rSZtTehp/OgiORHJ2
	dZxphz9RwNdL651KGSIkZY5z2hqmJalidhDE6b7nmQKzt4ylp2NypHqL03WLmh1X/Z3QII6YoHY
	KRqeGnkPb77iLPAbVW4DgmIPgpiX4mEUskE4HFZ/9/ZNRYMylSFOQb0QqdklcToMZ9Oa+05r8oi
	0/JyERlEMJUePWinnwRQIQnW5gYeZevkJZ9z9zFBAFpa1RS41BiRsP1dinhe+DPaZ/HynFYuB3Q
	MJrRIMIH9qynKT+GarMh27XiNeuYdi9Pv29JLuvGpIyq1OYOhvUI49YF3402BNBCj5uDvq8pWd3
	x5Zux5ez8tBHsnTgTYpdsmGeleKN0NuufaKJyHvxn4Qy/574LmvDS97qL41lrp/Ufar3ePicT5D
	yq+DtJHfsNlASEdOqzH/J9fw4kWQK1htuFKZLkSVVed150J9pktvvK7Iu6zSy772/m32yqrkWph
	0u2M53ZDhnOvv6tjKHItjLmwPkLNeZuGmaKqSFqEuBFjfFV8CHmeWwGzawZ16LI39a9p0dRa+2D
	/po91z80Yuaa6AeLzCo7mCoRINsDdP+5S5RTZPn6BprUlg==
X-Received: by 2002:ac8:59d3:0:b0:536:3a49:f76 with SMTP id d75a77b69052e-542b62a60f2mr301290451cf.27.1793825274007;
        Wed, 04 Nov 2026 12:47:54 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:15 +0000
Subject: [PATCH net-next v4 03/15] net: skbuff: fail checksum validation
 when the skb can't be checksummed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-3-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825268; l=5641;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Lx+sg563Gwi7/eqkbjWaelHQ+u2/rBUxkXNgf6ZDN3A=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIBEqqq3ka7HmeaWWRJD2T+myoIbf+nMkpwdF2b0vlJsA0tYmEFfRvaeCBuvlGjyE/GzzQk+iqN
 3kCfR/y6KEwc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ef75cf/1793825275-A6EDEAE4-9DED2C98/0/0
X-purgate-type: clean
X-purgate-size: 5643
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__skb_checksum_complete() and __skb_gro_checksum_complete() verify a
packet with skb_checksum(), which returns 0 when the payload is in
unreadable frags or the skb's lengths don't add up.  Both add that 0 to
the pseudo-header sum, so they accept the packet whenever the
pseudo-header sum folds to 0xffff.  The sender controls that sum through
the addresses and the length.

Use skb_checksum_full() in both, and in __skb_checksum_complete_head(),
and report an skb that can't be checksummed as having a bad checksum.

Also take the skb off CHECKSUM_COMPLETE on that path.  nf_ip_checksum()
stores the pseudo-header sum in skb->csum before it calls
__skb_checksum_complete(), and conntrack doesn't drop a packet with a
bad checksum.  If the skb stayed CHECKSUM_COMPLETE,
__skb_checksum_validate_complete() would add the same pseudo-header sum
to skb->csum and accept the packet under the same condition.

A test module builds an skb that claims 50 more bytes than it holds,
with a pseudo-header sum of 0xffff.  Both functions accept that skb
before this patch and reject it after.

Found by the Sashiko AI review of the BUG_ON() series.

Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Fixes: 65249feb6b3d ("net: add support for skbs with unreadable frags")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Link: https://lore.kernel.org/all/179273111951.3134.3452028799437573017@kernel.org/
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |  4 ++--
 net/core/gro.c         | 11 +++++++++--
 net/core/skbuff.c      | 27 +++++++++++++++++++++++----
 3 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 608c1491597e..5a5354a6b6ba 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4892,7 +4892,7 @@ static inline void skb_checksum_complete_unset(struct sk_buff *skb)
  *   0: checksum is validated or try to in skb_checksum_complete. In the latter
  *	case the ip_summed will not be CHECKSUM_UNNECESSARY and the pseudo
  *	checksum is stored in skb->csum for use in __skb_checksum_complete
- *   non-zero: value of invalid checksum
+ *   non-zero: value of invalid checksum, or 1 if the skb can't be checksummed
  *
  */
 static inline __sum16 __skb_checksum_validate_complete(struct sk_buff *skb,
@@ -4932,7 +4932,7 @@ static inline __wsum null_compute_pseudo(struct sk_buff *skb, int proto)
  *
  * Return values:
  *   0: checksum is validated or try to in skb_checksum_complete
- *   non-zero: value of invalid checksum
+ *   non-zero: value of invalid checksum, or 1 if the skb can't be checksummed
  */
 #define __skb_checksum_validate(skb, proto, complete,			\
 				zero_okay, check, compute_pseudo)	\
diff --git a/net/core/gro.c b/net/core/gro.c
index 1b033855a20d..e2e847c95270 100644
--- a/net/core/gro.c
+++ b/net/core/gro.c
@@ -798,10 +798,17 @@ EXPORT_SYMBOL(napi_gro_frags);
  */
 __sum16 __skb_gro_checksum_complete(struct sk_buff *skb)
 {
-	__wsum wsum;
+	__wsum wsum = 0;
 	__sum16 sum;
 
-	wsum = skb_checksum(skb, skb_gro_offset(skb), skb_gro_len(skb), 0);
+	/* If the data can't be checksummed it can't be valid either, and
+	 * NAPI_GRO_CB(skb)->csum only holds the pseudo checksum.
+	 */
+	if (skb_checksum_full(skb, skb_gro_offset(skb), skb_gro_len(skb),
+			      &wsum)) {
+		NAPI_GRO_CB(skb)->csum_valid = 0;
+		return (__force __sum16)1;
+	}
 
 	/* NAPI_GRO_CB(skb)->csum holds pseudo checksum */
 	sum = csum_fold(csum_add(NAPI_GRO_CB(skb)->csum, wsum));
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index d51fdcb3e016..0082b12544cf 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3885,11 +3885,28 @@ u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
 EXPORT_SYMBOL(skb_crc32c);
 #endif /* CONFIG_NET_CRC32C */
 
+/* The data can't be checksummed, so it can't be valid either.  The caller has
+ * put the pseudo header's checksum in skb->csum, so don't leave the skb
+ * CHECKSUM_COMPLETE for a later validator to take that for the packet's.
+ */
+static __sum16 skb_checksum_complete_failed(struct sk_buff *skb)
+{
+	if (!skb_shared(skb)) {
+		skb_checksum_complete_unset(skb);
+		skb->csum_valid = 0;
+	}
+	return (__force __sum16)1;
+}
+
 __sum16 __skb_checksum_complete_head(struct sk_buff *skb, int len)
 {
+	__wsum csum = skb->csum;
 	__sum16 sum;
 
-	sum = csum_fold(skb_checksum(skb, 0, len, skb->csum));
+	if (skb_checksum_full(skb, 0, len, &csum))
+		return skb_checksum_complete_failed(skb);
+
+	sum = csum_fold(csum);
 	/* See comments in __skb_checksum_complete(). */
 	if (likely(!sum)) {
 		if (unlikely(skb->ip_summed == CHECKSUM_COMPLETE) &&
@@ -3909,14 +3926,16 @@ EXPORT_SYMBOL(__skb_checksum_complete_head);
  *
  * It returns non-zero if the recomputed checksum is still invalid, otherwise
  * zero. The new checksum is stored back into skb->csum unless the skb is
- * shared.
+ * shared. If the skb can't be checksummed it returns non-zero, skb->csum is
+ * left alone, and the skb is no longer CHECKSUM_COMPLETE unless it's shared.
  */
 __sum16 __skb_checksum_complete(struct sk_buff *skb)
 {
-	__wsum csum;
+	__wsum csum = 0;
 	__sum16 sum;
 
-	csum = skb_checksum(skb, 0, skb->len, 0);
+	if (skb_checksum_full(skb, 0, skb->len, &csum))
+		return skb_checksum_complete_failed(skb);
 
 	sum = csum_fold(csum_add(skb->csum, csum));
 	/* This check is inverted, because we already knew the hardware

-- 
2.55.0


