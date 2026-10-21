Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9FA60A2627
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OOfaMOnq
Received: from list by lists.xenproject.org with outflank-mailman.1457177.1670073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWex-0003LS-Rh; Wed, 21 Oct 2026 13:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457177.1670073; Wed, 21 Oct 2026 13:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWex-0003LL-Oa; Wed, 21 Oct 2026 13:47:15 +0000
Received: by outflank-mailman (input) for mailman id 1457177;
 Wed, 21 Oct 2026 13:47:14 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWew-00037Y-G0
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWev-00AIAc-Sb
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:13 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c261-8faa-0a2a0a5109dd-0a2a45099ac4-2
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:13 +0200
Received: from [209.85.222.178] (helo=mail-qk1-f178.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c260-be1a-0a2a45090019-d155deb2dc74-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:13 +0200
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-93f2493c28bso55442785a.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:13 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f56e221fcsm254323085a.40.2026.10.21.06.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:11 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590432; x=1793195232; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPzcetTQubRCe4lOTpMna5FIDyGXRIDSoyAwtL9E3zo=;
        b=OOfaMOnqIk0W9HvPbm8JiXx8T7Fi0cfyG1qhMk04GyXhTqfumHyRuLWA1Y+D5R3H06
         7hg4L4MqqJDJbiF7trJGRuGT884XVWpvhcl7RUpWp7MHA8P91RQWmecXaqVGEnZ7Q0lJ
         FqoNYpvfyxSCVOEHCJ154U+zpWFp/YR+Fc9GMOhe+zZtbDpRye3YvG352SFE+Lsly+l/
         NalLkNnuJHg0b2z2CZtyThGjlb5jSpde969oCnc+xkPvH1aBGmDb0KjQrktBsZmnkUf5
         0emGdmNpoQ1zW0YS1tRfSzbO/KWEJKacjQQP0erIE9A8EwSi8+yyUBVGUcTvttMQfGMk
         LbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590432; x=1793195232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPzcetTQubRCe4lOTpMna5FIDyGXRIDSoyAwtL9E3zo=;
        b=ZqXihm+TKPiHfcHBtSHsqz/5mhQOpIEtbJ9znSPuH+cNaPlv3E4LwBnG6vnGwqViez
         iAOfs9f/siqM3Ho7O2OQq15xwXFemInIHqE8vcOrkQK1CJmcc2YxFfxdnXtaGnlBvyFB
         cTqM81jdFai4M9GaRipATNqp/FH8tFO4WY78KdyxUBV7L+oiZlbb/H3jGzIe0CKhAbLt
         fPoa5f7RWAiAQzeweVuZah5d5IB//mt7KFI06fbva9f6VCO1fU2JILeTMBBoI0iSOkHr
         HkcB+uXAo1prH9+40dSj2Krof+cibEH09dI98iOfrRhQEi0CeH3Kb4AuYjXRuTdLzIfi
         i3RA==
X-Forwarded-Encrypted: i=1; AKwUvBz7pekaNDiJqJFzfsaKwixz6cR6Vx5mSoTcEujfhzHxNmj1sBzaEYW6Rh9zNbTFUZTegxEzLo0RMhs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKwhshbvunUMLKhtedwyasCmyfjyMg9GquLKF1BC747Vux1aDUJ
	sns7kPg1CnA7IELbfI5qLRs0GDk4cZbRKBnI2XgpyeQt/n/BLsZ1JyLfYXE9sowekxg=
X-Gm-Gg: AYBFou3eaqFtQXqCM+sYQ+6+z2RiDdN7unbQi1Ax6ymnumBkVP0iZK9rUXqBrRIse8N
	GjC1WptJH1zeEjg1m4NpkS55ub9g4PNAkKwB+9KAFS2E91qBsoxU/ELOyyIP2ya+oEpAm1c6klt
	JFCJcJx60cawGGpfecz5Yu0HQ6ept9cpyehJqC69XDx0E7xMIJDk/OYBqO5XnMsA5yYKVPQfhiU
	12tYWAxsfR0S0fbMgn84DAHdAagc3xIC7JOMTWlk4/gTTykFf9s3wdz7Ika1ra0v0kD1TDXhhBl
	ChQqskD8CMN6XQcXl9d2RjGx6Y6EIPKMEP00wAiQH1rbVCIlxHf/B8W5xBbXaraca2/aBdBvBJM
	KyvGghcPCI3NPLIPG2id2ZX7vGfI5503ybWp9suCpl6n3KmOfMSDkPoNT7fODIfyg9gD1oW7RJB
	sSF5FDbhM7auyx9jLkk7OAnnuG+sppiSrsvKgx4M+2OHqT7i/iq669w21smdbncRUt+SKf/mBvB
	mlsuiagDNoNzFWYihU6kNerO6oQaeqkLzMddMMnvy0DxgP/mO3G3veb6IMp3KIK87tVNwOL
X-Received: by 2002:a05:620a:f04:b0:93e:4fac:9d31 with SMTP id af79cd13be357-93f57f2012cmr439406185a.26.1792590432356;
        Wed, 21 Oct 2026 06:47:12 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:47 +0000
Subject: [PATCH net-next v2 03/15] net: skbuff: fail checksum validation
 when the skb can't be checksummed
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-3-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590422; l=2860;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=prj+BQU7C60dBsXDxJX9jL8mklYfFucWwKvpS5MOuJ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB6W8Sr4kysX4RYVPQ/s/LIgV/tAxufFvsN3bU4kpLKDEj3qrHCW/VhTdVB4zPVL/3cqJoYEUrD
 0TwvTS8OOXQM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1792590433-BF6D2034-A3F13248/0/0
X-purgate-type: clean
X-purgate-size: 2862
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

__skb_checksum_complete() verifies a received packet with
skb_checksum(), which returns 0 when the range runs into unreadable
frags or past the end of the skb.  0 is a valid sum, so it's treated as
one: it adds skb->csum, the pseudo-header sum, and folds the result.
With a sum of 0 that's csum_fold(skb->csum), which is 0 whenever the
pseudo-header sum folds to 0xffff, so a packet whose payload was never
checksummed is accepted, marked csum_valid, and left with a wrong
CHECKSUM_COMPLETE value in skb->csum.

__skb_checksum_complete_head() passes skb->csum in as the seed, so a
failure there folds 0 and the packet fails validation, but only because
skb_checksum() happened to drop the seed.

Use skb_checksum_full() in both, and report a packet that can't be
checksummed as having a bad checksum, so callers drop it the way they
drop any other bad checksum.  Clear csum_valid, and leave skb->csum and
ip_summed alone, since there's no full packet checksum to store.

Found by the Sashiko AI review of the series that made skb_checksum()
return 0 for a range past the end of the skb.

Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 061c61422a38..40d2dd20d47d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3860,9 +3860,17 @@ EXPORT_SYMBOL(skb_crc32c);
 
 __sum16 __skb_checksum_complete_head(struct sk_buff *skb, int len)
 {
+	__wsum csum = skb->csum;
 	__sum16 sum;
 
-	sum = csum_fold(skb_checksum(skb, 0, len, skb->csum));
+	/* If the data can't be checksummed it can't be valid either. */
+	if (skb_checksum_full(skb, 0, len, &csum)) {
+		if (!skb_shared(skb))
+			skb->csum_valid = 0;
+		return (__force __sum16)1;
+	}
+
+	sum = csum_fold(csum);
 	/* See comments in __skb_checksum_complete(). */
 	if (likely(!sum)) {
 		if (unlikely(skb->ip_summed == CHECKSUM_COMPLETE) &&
@@ -3886,10 +3894,17 @@ EXPORT_SYMBOL(__skb_checksum_complete_head);
  */
 __sum16 __skb_checksum_complete(struct sk_buff *skb)
 {
-	__wsum csum;
+	__wsum csum = 0;
 	__sum16 sum;
 
-	csum = skb_checksum(skb, 0, skb->len, 0);
+	/* If the data can't be checksummed it can't be valid either.  Leave
+	 * skb->csum alone, it's not a full packet checksum.
+	 */
+	if (skb_checksum_full(skb, 0, skb->len, &csum)) {
+		if (!skb_shared(skb))
+			skb->csum_valid = 0;
+		return (__force __sum16)1;
+	}
 
 	sum = csum_fold(csum_add(skb->csum, csum));
 	/* This check is inverted, because we already knew the hardware

-- 
2.55.0


