Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B549CCF2E3
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454378.1667953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlX-0006rD-Pt; Mon, 19 Oct 2026 13:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454378.1667953; Mon, 19 Oct 2026 13:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlX-0006p5-Ka; Mon, 19 Oct 2026 13:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1454378;
 Mon, 19 Oct 2026 13:51:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlW-0006f9-95
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlV-00EZHA-MJ
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:01 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62035-bab6-0a2a0a5309dd-0a2a45039eb4-30
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:01 +0200
Received: from [209.85.160.174] (helo=mail-qt1-f174.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62044-fae8-0a2a45030019-d155a0aed1fc-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:01 +0200
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-5363316fa0cso28487541cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:01 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcbb27839sm98396566d6.35.2026.10.19.06.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:50:59 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417860; x=1793022660; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPzcetTQubRCe4lOTpMna5FIDyGXRIDSoyAwtL9E3zo=;
        b=XsSTGl1K4GYN+PDY3oQjjdJsMv3LQN11FpIdqnYLLdsat1sBjBdmM7c7tChEWyHzTL
         dA4Wi3ZS2ytcIVnTokQvZGhh0N4nT8y2uA3Xg3r8psqAdp2TT3rfAANFVhBwLTVAAu6s
         0mqJlNumQBsOL+eiCpRM//X/PuYb0ycdQoedzAZSbRA8TGuBlDmG93VmLqfoQZY5K5+M
         yLYLN96WRezVqHmFq+/8X6tlBDCIArlD0RbUxsY7mzhEF9T/V7xT+lUzfrfRgCx0lh9B
         UNXtIvyCmpD7qYLgBYXCQ9y1WBCcmwcAtYtFo67xNmjN1HgsUpKCmm5/S8utyDDQJCMo
         dFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417860; x=1793022660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPzcetTQubRCe4lOTpMna5FIDyGXRIDSoyAwtL9E3zo=;
        b=yE8Ig18QOmHvLn7JDwL0I9RvgEz4nevdzF715+kufVRPmU23XYBmRGh/XKxR/uG+IV
         mMB/Nmd9G5L1ugBCJ89R8Ow46xEXizrhotimunOU+zxUmdvxTVxpEK/aR1VjrY7w0PSD
         EW4nMkaITQxKHt1jH36MlKOAzXrAwPCt5FLoBh3pATc1pX9j0MLHdy1N31gzXffv7817
         qyzKKPakeSvuJiU1SQYvgL4OqUehBrMCkqG/qScrwVERd77h6CNK6CZZNn5mrM2QtnyC
         F7+6odwic58GWnazkNftSNtUmNOo10UsImSGebq3w12in/cbNTOjFYU8bUBmhPbiYkkw
         oQkg==
X-Forwarded-Encrypted: i=1; AKwUvBwGStJf3RtJsg0+HdYHVvCbwoVNMxCqqUtxZEfvWwY265atHjZfBn1JU1OLqKoIf8d7I37pSaQgMCE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIfkyvCMDIEJ/7bOmdN9mowdxeqkJHFw3UA007YeJlkSqNSuWUJ
	3ZCIQ6XwCmxmPRkXrlKA5e3Ht5N3uhkbbk/vAggRLQgT+S2A4w6dbehyUaFnHBKhy7w=
X-Gm-Gg: AYBFou31hXo0+9wxnswpEoOL84hzAZ4fMhcsrB3zzD2sDiZ8fAId86QxAbEzn+v42Cv
	Qgyp/UaY/VKOiDUCSFCUfNwtBtqANCwORp5WABRGc8aM7G0KH7L7cYaXiWtfLyHxP+rqvHXaKyr
	cgY83QCCPdZARobt3nLKZBDZWIowIDpvWLvsPz8uVBBgbWSJ5uKpI1T0ndwLjF0AJPheoOjoHcs
	0Hb96HQZKhrOjH1tqGOm5kEvh9ddgOXuUKTN/4jAFpvYdmHVSnmiG7+vf6UyhyZi37BSqBKpsvY
	q4O9D7Gbycq7+I/ebQF0Tj7/+1UGM9pq/l3A3Gi5N5MiSCZnJTgJ/tZuUFYqjWGZ8lSlLGSY+kr
	T2+HCxPkMfud6MYIoBIfOetIkfLODF99ccgpdMnHvCjgBwU+B59XQTOrBtIKD3HaLr9ahLK2Bzn
	mds05kHLJ4dpFH6eQvcRL+RAfbVAFB1++3Fr2xj/vgr9Hl5bdSDciepmUFUyvHPVOE5b4nlaW8L
	bjtEhfidh7DWi4=
X-Received: by 2002:ac8:5745:0:b0:532:abc9:8f4f with SMTP id d75a77b69052e-53645ff0043mr114359591cf.37.1792417860150;
        Mon, 19 Oct 2026 06:51:00 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:37 +0000
Subject: [PATCH net-next 03/15] net: skbuff: fail checksum validation when
 the skb can't be checksummed
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-3-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417848; l=2860;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=prj+BQU7C60dBsXDxJX9jL8mklYfFucWwKvpS5MOuJ4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QORYeqwwHo+WYErVqZ8QYEvyduUuJE0wPwwChX6fbXgz7Urjug8C88v1GDgpgDsaWL42fgGzxt7
 mVAv6CTaYGQk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1792417861-6F8C54E9-700B187B/0/0
X-purgate-type: clean
X-purgate-size: 2862

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


