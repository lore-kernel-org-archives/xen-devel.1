Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCACCCF2E6
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454385.1667986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlq-00087t-Jl; Mon, 19 Oct 2026 13:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454385.1667986; Mon, 19 Oct 2026 13:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlq-00087Z-FH; Mon, 19 Oct 2026 13:51:22 +0000
Received: by outflank-mailman (input) for mailman id 1454385;
 Mon, 19 Oct 2026 13:51:21 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlo-00083x-Ub
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlo-00EegS-3f
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:20 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62052-2eae-0a2a0a5409dd-0a2a4509bbaa-10
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:20 +0200
Received: from [209.85.222.176] (helo=mail-qk1-f176.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62057-be1a-0a2a45090019-d155deb0cd5f-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:19 +0200
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-93e503815adso194261685a.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:19 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f23eb7ba5sm842774385a.27.2026.10.19.06.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:17 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417878; x=1793022678; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydoWrUsryFQCXy0qk0+H+VOsHqxoYPyCdAWJE4iSCqQ=;
        b=Lz27IJ4+i6Lb/GcZKjHjW8bh8IiJ6ctkSRMZhGRHtGpXFYXKAwJYKoDpv4roQnPsC4
         Qq8UxyQrFXr874GXuXgV+ci/brwGaO3PC4HyAFztrxwq4O5MmmVq0dPnCX5BABWN1ZSv
         VBqGWIB8C8VBLYyCl8SKEPSH+G3t8dWSfXtZAC41dIdz83bcag2Gvd1k3vbF5dFLUbV9
         84rdH4FroNKHsD6TZxIP5QHtZw/0+4ifKaNEiN4gNBRn5BotTeGHvRTiR8DYUTc/ySCp
         4To5/POC4geZ8bSadjZ1iiouQdYpSkkcvaAxA/CZfp3LlpIkukYQ/cyiaaF5NNfosqgq
         ymrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417878; x=1793022678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydoWrUsryFQCXy0qk0+H+VOsHqxoYPyCdAWJE4iSCqQ=;
        b=C0p34dWBuGVXQuGyz4XIaVH7gmrRWVBd3aTa7kNeUBWz+WfzEpiJyMpSbicY29pkS0
         R8v+019ETCA0nCP0J9cOh3ejtG/dHvXOwkYIv1dUPb9HdlWWwexZT2B06OkclbRMuQyK
         HxtI8dw4E8VxfniagcXllaoThhhgWiRf5DfGXcchwVBfm9magTTFzxJ7fR2ZKQCD0Wir
         GTYE8AIXq8rdoVQNHVZhbyHMOEihxRfOXdvIe4K1iviyiC68HmEpW7GKab9mg2xwbESH
         nm6V62wvKU+OPk9NqS3zeRYiK55vV39sBA0s3xzR87vfIiH/TSZnxsf93hSm7zLTJWFX
         /N4g==
X-Forwarded-Encrypted: i=1; AKwUvBx1FuO5HAcbgk5Gaif+utjC3pslrb0+zyG7S979IA57SmAVqSzphbmEXWaADxQSgA+OIj9DP0s8E0k=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLgDkkCkg76dx+R4sdyqb9ObzhPE4bSlOksp1EkbGglbM9Jx6RR
	IhRLVrTn6pfS1sO9/h02ed0lp9fbCneIMPiBPbbe9eG9ssjf5CmumG/0ijsR2MKoGcM=
X-Gm-Gg: AYBFou1zbKQqOFyMS4rcGCOudO/AGr7OQj2R+w6nrX+4DlSrbRSRAO0WWx0f7oCoOzX
	LTQwdHMnO1aY/7V5xxehSwtU/U6YLCg0CYQgEiygTHIm9RaJZyTW9gQSCg7o66zETdW5mJT/2Gr
	q66yHi9qFS5oBnU0ZxJRQ0Nyb2PsLjDf16l2N1lkADGzC56OXyBq3SjnSkByEiS6iEadAZelfxb
	jqgIdptP8Ri7VRnwEqM4zwhAA4rWIBcTekwxfRpeGGT/lnuY6mcmPJr/y0U4C2ny20F1eMHK1nB
	hDFjV9lwTCDAJG2l7XQfL2OC691V9mVimkO4jaGjF8hMVavB3ON/lCmAi5eEiqEUZeCtwFuauVA
	9n9gIKCZ+y3Hw3BKZhjBSUk2nvWm6iGnZLgGDEWS1n1mlm/IUrJhmv2VuUFRpLz90aeLN9vcypW
	A98CVvn6NULu3xTZnhvneLxYeo3ngU0NVxxJw8CJ0zVTK7FxL5c8maQ+4YD90NcrdOglWPwQ5RR
	wUoWHwsvioT/bk=
X-Received: by 2002:a05:620a:31a8:b0:93f:2957:39e with SMTP id af79cd13be357-93f29df1566mr1298617785a.71.1792417878389;
        Mon, 19 Oct 2026 06:51:18 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:40 +0000
Subject: [PATCH net-next 06/15] net: skbuff: add skb_crc32c_full() that
 reports failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-6-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417848; l=5122;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4gDL1d1n3xZ9vhvHuHh+fxzaWH1kti0hEf02jn3aBlw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNQsoPXudgIBCQ4amU4Ot8wGr4uN4l6ll3DjM3OCKkakLx6NEe8pB0UhGAzuQHiV90XwzqMDHE4
 OA5x0AeiNWQI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1792417880-FCA16034-FA3C0552/0/0
X-purgate-type: clean
X-purgate-size: 5124

skb_crc32c() has the same problem as skb_checksum(): when the range runs
into unreadable frags or past the end of the skb it returns 0, which is
also a valid CRC.  sctp_compute_cksum() complements it, so a failed
walk looks like a checksum of 0xffffffff whatever the packet contains,
and the packet is accepted whenever its checksum field holds that.

Add skb_crc32c_full(), which updates *@crcp and returns 0, or returns
-EFAULT or -EINVAL and leaves *@crcp alone, like skb_checksum_full().
skb_crc32c() becomes a wrapper that behaves as before for the callers
that haven't been converted.

Convert skb_crc32c_csum_help(), which already returns an error when it
can't fill in the CRC, so a transmitted SCTP packet that can't be
checksummed is dropped instead of going out with a CRC of 0xffffffff.
The SCTP and other callers will follow with the skb_checksum() callers.

Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |  2 ++
 net/core/dev.c         |  7 +++++--
 net/core/skbuff.c      | 51 ++++++++++++++++++++++++++++++++++++++++++--------
 3 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 969b1c3269ec..327a01a5d6d0 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4329,6 +4329,8 @@ static inline int memcpy_to_msg(struct msghdr *msg, void *data, int len)
 
 __wsum skb_checksum(const struct sk_buff *skb, int offset, int len,
 		    __wsum csum);
+int __must_check skb_crc32c_full(const struct sk_buff *skb, int offset,
+				 int len, u32 *crcp);
 u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc);
 
 static inline void * __must_check
diff --git a/net/core/dev.c b/net/core/dev.c
index 8eb9bf1ff9eb..1d34fa4544a2 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3738,8 +3738,11 @@ int skb_crc32c_csum_help(struct sk_buff *skb)
 	if (ret)
 		goto out;
 
-	crc = ~skb_crc32c(skb, start, skb->len - start, ~0);
-	*(__le32 *)(skb->data + offset) = cpu_to_le32(crc);
+	crc = ~0;
+	ret = skb_crc32c_full(skb, start, skb->len - start, &crc);
+	if (ret)
+		goto out;
+	*(__le32 *)(skb->data + offset) = cpu_to_le32(~crc);
 	skb_reset_csum_not_inet(skb);
 out:
 	return ret;
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index de433d452939..3b2a3747f009 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3788,23 +3788,41 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 EXPORT_SYMBOL(skb_copy_and_csum_bits);
 
 #ifdef CONFIG_NET_CRC32C
-u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
+/**
+ *	skb_crc32c_full - CRC32C a range of an skb
+ *	@skb: buffer to read
+ *	@offset: offset in @skb to start at
+ *	@len: number of bytes to include
+ *	@crcp: the CRC to continue from; on success, updated with the range
+ *
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	has unreadable frags in the range or runs out before @len does.  On
+ *	failure *@crcp is not changed.
+ */
+int skb_crc32c_full(const struct sk_buff *skb, int offset, int len, u32 *crcp)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
 	struct sk_buff *frag_iter;
+	u32 crc = *crcp;
+	int err;
+
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
 	if (copy > 0) {
 		copy = min(copy, len);
 		crc = crc32c(crc, skb->data + offset, copy);
 		len -= copy;
 		if (len == 0)
-			return crc;
+			goto out;
 		offset += copy;
 	}
 
-	if (WARN_ON_ONCE(!skb_frags_readable(skb)))
-		return 0;
+	if (!skb_frags_readable(skb))
+		return -EFAULT;
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
@@ -3829,7 +3847,7 @@ u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
 			}
 			len -= copy;
 			if (len == 0)
-				return crc;
+				goto out;
 			offset += copy;
 		}
 		start = end;
@@ -3844,19 +3862,36 @@ u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
 		copy = end - offset;
 		if (copy > 0) {
 			copy = min(copy, len);
-			crc = skb_crc32c(frag_iter, offset - start, copy, crc);
+			err = skb_crc32c_full(frag_iter, offset - start, copy,
+					      &crc);
+			if (err)
+				return err;
 			len -= copy;
 			if (len == 0)
-				return crc;
+				goto out;
 			offset += copy;
 		}
 		start = end;
 	}
 	if (unlikely(len)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
-		return 0;
+		return -EFAULT;
 	}
+out:
+	*crcp = crc;
+	return 0;
+}
+EXPORT_SYMBOL(skb_crc32c_full);
 
+/* skb_crc32c() has no way to report failure, so it returns 0, which is a
+ * valid CRC.  Use skb_crc32c_full() in new code.
+ */
+u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
+{
+	if (unlikely(skb_crc32c_full(skb, offset, len, &crc))) {
+		WARN_ON_ONCE(!skb_frags_readable(skb));
+		return 0;
+	}
 	return crc;
 }
 EXPORT_SYMBOL(skb_crc32c);

-- 
2.55.0


