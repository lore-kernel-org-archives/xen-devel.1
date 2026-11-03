Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72093606D80D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=TQGRsVfW
Received: from list by lists.xenproject.org with outflank-mailman.1468944.1678005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gr-0000q5-0o; Tue, 03 Nov 2026 02:29:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468944.1678005; Tue, 03 Nov 2026 02:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gq-0000ph-Sh; Tue, 03 Nov 2026 02:29:08 +0000
Received: by outflank-mailman (input) for mailman id 1468944;
 Tue, 03 Nov 2026 02:29:07 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Go-0000WY-RJ
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Go-00CYCC-81
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:06 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae94690-e002-0a2a0a5209dd-0a2a450cec40-24
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:06 +0100
Received: from [209.85.219.52] (helo=mail-qv1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946f1-f479-0a2a450c0019-d155db34ad6c-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:06 +0100
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-91befe703c4so35781176d6.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:05 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7f25fb7sm106263956d6.12.2026.11.02.18.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:04 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672945; x=1794277745; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVitIrAzmZ42ioJp40YLaoRa+dPpR6cnKnn2NFUMG3c=;
        b=TQGRsVfW61VePD3w4SItIxDX1ZECispDhhGtAdwSc3UePCBEoMnwIs4DWczGkwmRHT
         MaDP2JIr9B5HURL5SHfsRf8asF2vKY6F1krOPMqZ51cP7rj1GtnvsDFNXHwTU8PSLndw
         potpjwS7t6m2DMGjTA2Y5ormLZQTEPRxcdhFgdPk1ZX4R3BxVJ6wg8pV/z8NyzqXtSjW
         yC+jaJBakckGbwfB1pLL/jpSpf3Wuy/lAa1TX3mCjI9/LessfXSe0c8YdTPt5xHAbCdo
         F39mnAaNwLfXnG5TxmIZhn8HXwVfhzbfEiIvW/CoD3J/V/HUC7MKdtFvloHIhuEwFr5S
         ljcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672945; x=1794277745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVitIrAzmZ42ioJp40YLaoRa+dPpR6cnKnn2NFUMG3c=;
        b=PkeB/xqICjKKn0A0P3+YHtjaaEJrj0YUFObi6AAuVVXaYMpS8kow/XvuG3iqoNgDzX
         +SSqP8goHC/FOjtDFQ6OhZdMR/HD1FegCSwAJudBnHdB//oBVUlqL0rhxXP1hF2kEnXq
         I6E31NFYHVhdiiVnqZJE9aCvjeTkjsxEUx193xkRKU0j7n+CFed0gx5Ww4zMrkgNijsp
         QDucPWX/jbg2T6k0lXXkL058dlDoxFfLv9l2jGaF2Idvf+tnOhgUwv3DpdMVqdtafRhj
         B0DlmwipwZBa7ueBPF5Lo7Yaecy38tp4womqztzCTLbG8mSHRMrWUeLXdxEssZQFB6L9
         VSjg==
X-Forwarded-Encrypted: i=1; AKwUvByX2FYcsddqHKuZwmZco+YS76z8M/hyV5LtWafi+q8FfeRXg5QwO743SOkaocaBJZa/6NW/Jx5Ze7w=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+P1oEUHNKSooNveYPhVQP+vSRLa/ctmlinEBTsx2cA54e2Al++
	gBCP6Wld/gHC/1RQjWe1HNAOKppVgHL/K9EYZotzryTdSBizLTnzLDGSguj2fnU74qE=
X-Gm-Gg: AYBFou2oaWWao2AE7iWohRAPMPLgOutF814NmhOk9wZtuSmesEVO/Gwz9BgqHEbYFo/
	Ep62sOEHatZmFAPBTQ9eLjbEeqt+pgpT9LvRQ434Mo6ypgUspuUC5wXdSjCKVql1LNSFLrBpjiP
	+wnUaxjBt1Mgv0rs/MVuy0GHUxmGn7xpWNK42oEAOYRhwCtDrd0Hl9kgRMSgpDxK3sRP/ho92wX
	FHcBKTKgj4huDZV7EJt2PK9SqEPdZoIzf9smhs8TtbyhVYAsE/xMJ0+kgq7liVYmiSw++/QmxoS
	Wqe3hXtG9joChb//zlnT1NRU7I2K11eAA0B7XAcsqpgJmhFW8d68A1cwFaS8kvWApAdpvQV7IW7
	piFF73aqz6SKlQiO14Yvdqirgwfk5DYutzhcA6Ac0KEM9QV/kDrCzl6o/0QuMjXBGAb7WgHqjEa
	iu+s3/mC981BRrRY/EElyLr6OvSjnTv1pGSp/T2AhX7qWtFcwdHoqhl6olhU+F1Vn/qC9AnPg1C
	o0pH7ZZo/rG4IKoJCe5y+PZ7nSfOQSLO/p8vDXvz6TxCGCT7ro2AhA8m/a2cb6KZy0a5XDAs7Af
	23Bf8fqWo3J1ia0m3q6bulJXQjtxx9MpU3luzNkhJw+hYQ==
X-Received: by 2002:a05:6214:d65:b0:91c:8fa6:1789 with SMTP id 6a1803df08f44-91ca4b92fdcmr194775386d6.28.1793672944680;
        Mon, 02 Nov 2026 18:29:04 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:36 +0000
Subject: [PATCH net-next v3 10/15] net: skbuff: reject a negative length in
 skb_copy_and_csum_bits()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-10-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=2784;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=PruTOHBwv5dTjTwNqILcr1QH0bLKSEEDfj9BCJzaYZc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QN22JQgoXgrJiR5yAYHNf+ITF3NfM8ygPUQ+LdAZK32fRjNubeEAAV9Ib7v/7F/D7ljAdUlHQzF
 J2Sm3nsf4Vgw=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793672946-03ED2A5B-1BF45C0D/0/0
X-purgate-type: clean
X-purgate-size: 2786
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The head, frag and frag_list copies in skb_copy_and_csum_bits() each
clamp their length to @len.  A negative @len from a broken caller
therefore becomes the copy length, and the copy takes it as a huge
unsigned value.  The two len > 0 tests around the zero-fills only
protect the zero-fills.

Reject a negative @len on entry with -EINVAL and drop the two tests.
@to isn't touched in that case.  Every caller already handles an error,
and skb_copy_and_csum_dev() zeroes its whole frame on one.  No caller is
known to pass a negative length.

Found by the Sashiko AI review of the BUG_ON() series.

Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index b74d8a6ef0f9..e3fc6291d223 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3731,8 +3731,7 @@ static noinline int skb_copy_and_csum_frag_list(const struct sk_buff *skb,
 	if (unlikely(len)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
 		/* Don't hand the caller a buffer with stale bytes in it. */
-		if (len > 0)
-			memset(to, 0, len);
+		memset(to, 0, len);
 		return -EFAULT;
 	}
 out:
@@ -3748,9 +3747,10 @@ static noinline int skb_copy_and_csum_frag_list(const struct sk_buff *skb,
  *	@len: number of bytes to copy
  *	@csump: where to store the checksum of the copied bytes
  *
- *	Return: 0 on success, or -EFAULT if @skb has unreadable frags or runs
- *	out before @len does.  On failure *@csump is not set and the part of
- *	@to that couldn't be filled is zeroed.
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	has unreadable frags or runs out before @len does.  On failure *@csump
+ *	is not set.  On -EFAULT the part of @to that couldn't be filled is
+ *	zeroed, and on -EINVAL @to is not touched.
  */
 int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 			   u8 *to, int len, __wsum *csump)
@@ -3760,6 +3760,14 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 	int pos = 0;
 	__wsum csum = 0;
 
+	/* Everything below clamps its copy to @len, so a negative one would
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
@@ -3775,8 +3783,7 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 
 	if (!skb_frags_readable(skb)) {
 		/* Don't hand the caller a buffer with stale bytes in it. */
-		if (len > 0)
-			memset(to, 0, len);
+		memset(to, 0, len);
 		return -EFAULT;
 	}
 

-- 
2.55.0


