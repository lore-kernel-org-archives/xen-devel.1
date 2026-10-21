Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4F606A31E
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fMChHudT
Received: from list by lists.xenproject.org with outflank-mailman.1457189.1670136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfC-0005II-C1; Wed, 21 Oct 2026 13:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457189.1670136; Wed, 21 Oct 2026 13:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWfC-0005Hh-7N; Wed, 21 Oct 2026 13:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1457189;
 Wed, 21 Oct 2026 13:47:28 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWfA-00053x-DH
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWf9-00AIK2-QL
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:27 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c265-bab6-0a2a0a5309dd-0a2a4501bb8a-40
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:27 +0200
Received: from [74.125.224.48] (helo=mail-yx1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c26e-5984-0a2a45010019-4a7de030b10c-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:27 +0200
Received: by mail-yx1-f48.google.com with SMTP id
 956f58d0204a3-675617e81f9so628253d50.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:27 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-67a0e185441sm1078051d50.3.2026.10.21.06.47.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:25 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590446; x=1793195246; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NueD3KcSYkb8JdZSOJlKL8CiOB7BO395X3cXr1iZapo=;
        b=fMChHudTgr9flx+XRJ+qRCzp0jQVf7BlG0ySn4MzcudkteKxEpP/G8nN//QCG1qsUp
         tJM/yrwGqfSkMKDJKbE6aeCqWt7G24it2CyGwTsWHbEPqKtl3AduGaYzba2xIJxet2W/
         S0XBzil3uaiizuqJ12FFxdFOcDaGcSEHwc1xeA2hqiwQkXzCJfF3tjWZETuaskinF3P+
         QC/WY/UR5240nD+kdB+1eiuKXgQwOXLwKwlSImDcs+ikeiqGb/663nwc2nW70N+2cGHS
         6zN9paLzDxL6KaOe9FRkLAgxSZRfUnoicKohpyuRxoszuqFRLaG1szWakLpQ+JxwwjgS
         vYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590446; x=1793195246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NueD3KcSYkb8JdZSOJlKL8CiOB7BO395X3cXr1iZapo=;
        b=mJDQfIju0WmxgreMTNqwz/G01H3dcejZrEap4SLjMb7M7q/rAvRDFNKYpcvMG09ybQ
         VKqESUW59M3Zm5QUET8glqz2rVN1/rJdu1eyXOQiiX6Y2F4tLeJTi5F9eF66+rVGhxM0
         cYC79cNhJv7PXJongqBKrPP1fRJhAqhIb9dh7XJS/SPUCJu0ofCg9eiNNJXp3Inl28PI
         /xs8QCQfCZXkhIuL+XkkgFohYd8A6mqzVtwS3zARwF3XB9035JqMc+AMg2qnRcVopKRP
         pmcxU4tZSTJCuAwayuMgYPuC+VlmwI1wOmrVjnnwTzpEcciIarZa2j9ZWJU33LXujMWQ
         s9GQ==
X-Forwarded-Encrypted: i=1; AKwUvBw54r3i361UF7s0NkCeQyJpFvSXllR+fri+/4/Abenr8b8+RjbWUce/n9Z4FalPpd7vvr4OYo2ctVE=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ3QHISrAkBQhwmdnVNADHROeOOeLWVT5K2MVzZjXboi5Kfo/fi
	81JF2VLH0/sDaMNYvgB27d3xNWS11GNfYKiOjYhxzZ+3q2qVYNw6VlspRyiH2PTgE6o=
X-Gm-Gg: AYBFou1MeUCSzW525YKvt+OmNyRsX3g1/E0MlOQfyHfd9/G5TFL2ywCbiIjg3djHFDz
	enDRzpCrLMhtWseMlHVLux3TU0mwXci1RpAKbQjfv31+2mgxL/HxIWnL5QJukyX/KbLk1gucqVR
	URzxOpwV+pU2wyNNjorG664jXcVTOA79F8f68Ecg1l9at7WEgisgfbrYivThpUErc0grdY+VgH1
	G9Je6uiTWLWBrEpNU9tBjldCMwDexjeoD8dX2ooGCfSG59SJLShutnat1ZeVt3jUCMWrcUhOA37
	GLSB+H8pmzJmwMDlvVP6Udh9UNJVj8l4NDlB1SJRw3nk+K4AQD6v7DDWuAAo3nu8wn3cQmE6uC0
	BuqfVFVyJrnvOYsZ28rSnBTHdNHfpA9A/GsA8b0HELxknMs02N44ul6zz2sf7BJfixE9DSQvRQw
	B6LXm0eGGUgzsQIaP8Q3NZ7BYQkicP9YkCa5Wnjqchp41nQ5x9rSTEUzgmv5UewCyO0ZwzddKyk
	JVM4id+ecfoScNEyhXRUh55ESvC5u2RMfw69YwKplg4fipswKIHR5AECUQmh4xX/PYeHrJA
X-Received: by 2002:a05:690e:4853:b0:675:617e:6c2d with SMTP id 956f58d0204a3-67a0e4b66b2mr896013d50.25.1792590446255;
        Wed, 21 Oct 2026 06:47:26 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:54 +0000
Subject: [PATCH net-next v2 10/15] net: skbuff: reject a negative length in
 skb_copy_and_csum_bits()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-10-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=2599;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=II/CP7Oe6pPmnThcZPqfbajOFeQVtnEAdIjZymwWmTI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBCv/T4tuugSwX2rkOLKSCWrxmAA7LyX/rWbZaGf+yX4wPBG8KKxQ/YtsGe6jDvfA44EL7VQpSI
 8w8aIZgV/RQE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1792590447-1E07B757-510F8D62/0/0
X-purgate-type: clean
X-purgate-size: 2601
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 417261779eab ("net: skbuff: don't BUG() on leftover length in
skb_copy_and_csum_bits()") guards its zero-fill against a negative @len
from a broken caller, but such a @len never gets that far.  The head,
frag and frag_list copies all clamp their length to @len, so a negative
one has already turned into a huge copy, or an endless frag walk, by
then.

Reject a negative @len on entry with -EINVAL, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels, and drop the guard on the
zero-fill that can no longer be reached with one.  Every caller already
handles an error from skb_copy_and_csum_bits().

Found by the Sashiko AI review of v2 of the series that made the
change.

Fixes: 417261779eab ("net: skbuff: don't BUG() on leftover length in skb_copy_and_csum_bits()")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 782a6bacd568..56cec58bccb7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3678,9 +3678,10 @@ EXPORT_SYMBOL(skb_checksum);
  *	@len: number of bytes to copy
  *	@csump: where to store the checksum of the copied bytes
  *
- *	Return: 0 on success, or -EFAULT if @skb has unreadable frags or runs
- *	out before @len does.  On failure *@csump is not set and the part of
- *	@to that couldn't be filled is zeroed.
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	has unreadable frags or runs out before @len does.  On failure *@csump
+ *	is not set, and on -EFAULT the part of @to that couldn't be filled is
+ *	zeroed.
  */
 int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 			   u8 *to, int len, __wsum *csump)
@@ -3692,6 +3693,14 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 	__wsum csum = 0;
 	int err;
 
+	/* Everything below clamps copies to @len, so a negative one would
+	 * turn into a huge copy.
+	 */
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
 	/* Copy header. */
 	if (copy > 0) {
 		if (copy > len)
@@ -3777,8 +3786,7 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 	if (unlikely(len)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
 		/* Don't hand the caller a buffer with stale bytes in it. */
-		if (len > 0)
-			memset(to, 0, len);
+		memset(to, 0, len);
 		return -EFAULT;
 	}
 out:

-- 
2.55.0


