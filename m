Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BA7606D801
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=nMO7wOwV
Received: from list by lists.xenproject.org with outflank-mailman.1468932.1677943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gc-0007Ll-PD; Tue, 03 Nov 2026 02:28:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468932.1677943; Tue, 03 Nov 2026 02:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gc-0007Le-L7; Tue, 03 Nov 2026 02:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1468932;
 Tue, 03 Nov 2026 02:28:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gb-000787-OY
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:28:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Ga-00143l-VC
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:28:52 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946b5-2eae-0a2a0a5409dd-0a2a4501bef4-16
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:52 +0100
Received: from [209.85.160.169] (helo=mail-qt1-f169.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946e3-5984-0a2a45010019-d155a0a9e4fe-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:28:52 +0100
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-53cd0c8614eso28049931cf.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:28:52 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498b49ce1dsm13809921cf.5.2026.11.02.18.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:50 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672931; x=1794277731; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+PueQRw3LXmq/KAZXUuB8w4RjwHTCemS7p7oseT8Jo=;
        b=nMO7wOwVEBQ28ZR4iEZBZHbwYWGnZNMCDintQGg4X98+nHeiCStxLW2eMAttBvsNsE
         t9h7XjH//uSJEMDyVbVayaxJMw9/TiH9AUffhGuKSuF46Dq30L9q635mR9JUaYQpW/pc
         OIjUSDPtD804GFu/Mcd7Ihwb1J0wWz/OI+pEUyWBf49gXTctZmydSBjMoHM2z59ZGRTy
         mD4G4uZEV8vRDtAftDZXz0O7ND7E/2Uk+NcG21P9pqr+MVcOlrNeoSU9Vi6W+/BR6gM3
         EvgEEVyq6iiTnZxC1GZIf5CTKu8Jv0zhJuU1liWs1AjaXjnxjJm0F0BSMskOWlY+Rzqw
         yXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672931; x=1794277731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E+PueQRw3LXmq/KAZXUuB8w4RjwHTCemS7p7oseT8Jo=;
        b=oLqKbM4PQx0qCgGeOtiAAz6eL40tsOnG3GxmpbwMWhPwlzYdcngzcFaOG3A5Wbz2Md
         tBW15yqP7WQ0u1d5fMXFEUPUPmrjQOOarcm04UyZFhajhOZu71tzmjsUpu/Pi+7BJ9Ar
         DVskmGq3G73vdcFi6VjIeT12Mz69sxrgEiYWz/lsMfEagn/eUCeoYx8oyOEdaNlyun1K
         Ye4Fi7Fkh9yKLJTgX/DTStcVBeN4vcg5M83GbUSHcLsMYehP+puqqE1Yq5otgBaYF6Q+
         3efr4xX5dfrqtzaPYMpouk2c9XMPJpP2idPzuBqnhrNqqlgX2LTUGQqtPClylLDtoGuw
         sb1w==
X-Forwarded-Encrypted: i=1; AKwUvBy1N0y4qDsTtzAsS5eEIckZPQDQkpOjmlzNLlG3eNRA5ZeVz8SFF8ayqbSMhER2tRdMYCw9tto1eKk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/HG97MJxROjLgmpoa6htO7mrUNZqCHXKGmczIC4HGYkOxJFx3F
	Ogblkli1kvLv9tC7zRIgjnjYQx9NTrjetXeBCByi+BJMYl886g4Oy5iRkQYzOu1n7lI=
X-Gm-Gg: AYBFou2UoIZL2GIZtyz9BCsliEOO1LBCnfdEORG4UJPMYwASs9vUmuvgfF6VwmopR28
	ELTMRcechiCl9PgOvLcezh2S2bQTFD2g8zbLEdIs2WJBSm0vyiyBuqG9Y/GNp3s+/8ISQjZOq2a
	Gb7zeoC289T0p73eXkjKnFSAPQ2/+PTme2I0xXoGWLGv3COikr6Tbyv+DxE1JZUA8dqZ47pWBjY
	rcU7LUTkaywjBAj0NhTsIdXF1V4W3D55uyuL/PddVoQRerIuwcA+G8Pno79dtm3hTnoGcOrH1Fh
	wHku9eJEuNkRiQq9eSxvnFvb2S3LrdOriSemQw/Bt5rvjPXABQGyMsFjEkYLZ1F1nRN/T0OBI6O
	qLTCSQE8s6ILKGm6C5tHdn/vcTwcrKqG41ANKPIa9Gkebr9mlkHymkWO9di3bqHdrGsPvoMgqxQ
	62Xe385aFvivO6hFPACt4VaLJ01DwsqykSLftdHQ3ynvRM6VatZpVUOT49ZfYVMyABVXOeyj/Gg
	GMiFF/5l6YoT7cgbzwCt6bDbcOk6AQuFTEZ4VX60lvfXWuPxS88j1+5DKOCY5GI2tTW9ZuOU1JK
	JqdFzsf3ZbX28ZP3lqRtnySCVY6nGI8hQbOryJVay6K/7A==
X-Received: by 2002:a05:622a:1c17:b0:536:622d:6932 with SMTP id d75a77b69052e-542b62a4588mr193623181cf.23.1793672931108;
        Mon, 02 Nov 2026 18:28:51 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:29 +0000
Subject: [PATCH net-next v3 03/15] net: skbuff: fail checksum validation
 when the skb can't be checksummed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-3-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=5641;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ljkKcEFWSleZcYbEYDqih3Hv4TBj+2u86MNLksCHbxQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QCMEGKf9eY/JjLBx3uBpM1AvSdEnm9af1QuiTOeZWeeXF3LjhcUUm3ZNvs0Y8u3YMijw2VBPR/Y
 U7NAKuRMA3AQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1793672932-BF262757-F1E2891A/0/0
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
index c5f8aca89221..0d3f0f09c7d1 100644
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


