Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA30606C5A6
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=MgCtR2BW
Received: from list by lists.xenproject.org with outflank-mailman.1472767.1680664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtt-0004tM-M8; Wed, 04 Nov 2026 20:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472767.1680664; Wed, 04 Nov 2026 20:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtt-0004rq-C2; Wed, 04 Nov 2026 20:48:05 +0000
Received: by outflank-mailman (input) for mailman id 1472767;
 Wed, 04 Nov 2026 20:48:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtr-0004SD-Ko
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtr-00BcE3-0l
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:03 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a01-e002-0a2a0a5209dd-0a2a45038e4e-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:03 +0100
Received: from [209.85.222.181] (helo=mail-qk1-f181.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a02-fae8-0a2a45030019-d155deb5c020-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:02 +0100
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-93f22a8515eso113948285a.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:02 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-945d468f69asm294179385a.1.2026.11.04.12.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:48:01 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825281; x=1794430081; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PP/fidHZYkfblatQP/IijP74GKPYKHpT3ch7DoXcS4E=;
        b=MgCtR2BWB5A5mxpH0Rac4lDPz0ake9pFy6Z12iO5Gn8VXDX3AkYKAjt0i9xsrMF63c
         WZL5FLk1YG0mQRpXoxHFbYwW7A7jAdgkqNtrgal0iDYeVuZqyGV2snJKcL1gY0w0dQNY
         PSvwvM8SUv2lrT0F03uq3HDi1ZVjUbyjdLtfQbEj4eQfFApnvYY/iFrEnOQehIyBbh2Z
         ETU6FNay+PCrYZSD1N3C3Xm2BjwP+apRRn5wJJF3OSOPQpyBH6uoMlnvfIpLdUI4N4hN
         MuUNJie+rnr8s1V76i8wA+2rOJVZTb9PihRL3Ql4DSb+gy3qWPP/k/jpgizMzGplJbI5
         2x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825281; x=1794430081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PP/fidHZYkfblatQP/IijP74GKPYKHpT3ch7DoXcS4E=;
        b=18GrjvBDfUTfcl07XkrXIlffSwQra3GO9NQX3D5tC7JIPq+6AVJmHWNUa4sH8/jYQo
         uAimljbEPXzw+GVRz2JO3eQHh+B/m/jcZQMS/NeAoI5EhuCpJATGtpxixLzgPK2pLzot
         PhqGXxo1iuJ1q/Hj17Ntc7F/5zihPufaQsvnoJVk8hz4GAPRFGHbjt976JPTFLgAd3Gs
         eSN3MC+osy/fmHNwlIuXIrALj78aTj+AxiirEbZYP7/e60XBOFfP+Owbgkcc+9mzhvMe
         YzIWi3KK4XjbpWZqk0sbpMsD1rgs4TMdeDc13uW6bPjX92B2/W1vR4byYCZNS6KVaDHi
         nofg==
X-Forwarded-Encrypted: i=1; AKwUvBxTsFH3SJoA3A00st0R1fOfsb0ng/ji3mPS74JVOX7vF6hmL74xIKmGKw2z8h7en44ggLKWopfq9Zc=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9djqmlQyqgS9uj5WvovG0TorO48618VrnCKfxqyKFCvU48T9S9
	IykcD8JG2fA6qkMgP6SOchk6cqab7RsV8C7W3G2gdgNktHMzWzj81P4F98IAbPSkH2Y=
X-Gm-Gg: AYBFou3zTOlj/fc6LJR959ij08vpye697VnRfx1Ql5LucPFM9A8EiLQXRsXvhn626ad
	dtxWuzfAn7B6YgzJcLlRgoRLv+Ta5iyZ1EUf6eKhlZzeOhv6vtlV0/Yz8aB6EPydN9Dk72uGGlZ
	KlWt8fov7wH1ZDDj21sJ0azQODj5KlA8GIBG1JkNergeUKPVRiUNITN1Pv9DCS80Q54AKhu8nuz
	SRIttgLYiQ2JQV+N03e9U6SXsyMB2xTE26V4mn6DmJZJLiLgOKHbM0jYUVDIl5GICjcyXdJD/t1
	kvVrs8jAOt9KCVdEcLcHwJOQBX0bWg0Q+hi01GfeQyZaDybHFStjlZaMlUwccyu5fJqX8BC5oRP
	+f09SUxzFKXKkSZt6l8Yrc8Qi1yao2WsXlz4r+pvV6Ou2tyJo4eoLoA5LWzGoVTwf+J7MXKKylk
	ZMA+W7BZS9M31RTkQmO48JSkYNzydRIfiJMltNk8jIARBzsakWxG4eNOx3HtIBVrbB62FhdFFCr
	j1bS62IpJKuTpR72RbembtsfTuT/q0G2bceONAePM5baS2yrM/xag+jnSe6BbyEiuqXyFDoNCYZ
	CXBBpL0Wt490VdUCClsWgwrxJnhtjDkjEgY1f/5fBs2ukg==
X-Received: by 2002:a05:620a:2b8b:b0:93f:2941:6b8d with SMTP id af79cd13be357-94421581808mr2833471185a.6.1793825281522;
        Wed, 04 Nov 2026 12:48:01 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:22 +0000
Subject: [PATCH net-next v4 10/15] net: skbuff: reject a negative length in
 skb_copy_and_csum_bits()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-10-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=2784;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=wThWIHnCxUs0o2n1wKVOZp8MJH+DkfwjLDuEZ2TxA3k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QFsB+WUd2uViaXOb0v3E8Fyx/YypTY3hkcuEnhwIIaLSj1kGnyibicHErE4iRl1Wqf0Tvo/bwuX
 fykUuqyoPQgk=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-33051d/1793825282-6F8C54E9-A1D9DCAF/0/0
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
index b017c9f861fe..7ecf6701f68c 100644
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


