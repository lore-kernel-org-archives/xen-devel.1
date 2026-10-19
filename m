Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95F1CCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454377.1667946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlX-0006i5-BF; Mon, 19 Oct 2026 13:51:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454377.1667946; Mon, 19 Oct 2026 13:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlX-0006hw-7Y; Mon, 19 Oct 2026 13:51:03 +0000
Received: by outflank-mailman (input) for mailman id 1454377;
 Mon, 19 Oct 2026 13:51:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlV-0006er-Dd
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlU-009usr-Qc
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:00 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62044-8faa-0a2a0a5109dd-0a2a4509944e-0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:00 +0200
Received: from [209.85.222.177] (helo=mail-qk1-f177.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62042-be1a-0a2a45090019-d155deb1cc65-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:50:59 +0200
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-93f1cf92c9eso224759485a.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:50:59 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcba3d5a1sm97403096d6.8.2026.10.19.06.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:50:57 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417858; x=1793022658; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j9xcHh2wY++h6+R9ioq32anwJ7T1kqXqVTQttxnVock=;
        b=OD1qlKc8Rmz9yga4pK6YrfCksB6tZAO81b0koN4FZ87rN8nWx3R97knMtmIkVKn8tu
         G3JMySp2QqPhEAGUow7MKeNxo5A5ekZGade0hi27owWVrTA06foh8crkgfJgCWpQXuzO
         er1MIjOt4aFcS07jZna3TN+bXUiVB/wGne663U/D0/vYCxT1sV2/rRdmwpjtctR16/VN
         o3CPdAWgesyg42sCEdxWuOBOTFEgXUyhqmKauzZSsAgyw+SGa0jmsQe4ktZcX4G7Xf13
         asXRUD0g1zjKNJ8VK/HFFFmNfEjYQCHiXFTyCVMcDlZKysyZfGmR8y1HDllGBlfElLAB
         FESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417858; x=1793022658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j9xcHh2wY++h6+R9ioq32anwJ7T1kqXqVTQttxnVock=;
        b=XBounGFZ00ZQaKDsk2F2qdtfGCTD5iBiZ4KfwSY6c7LRWtjZb25p6AbDAPCpf5B9VP
         7Jav5pPqycJxJznxLZdQ77L4j6+SgO63eHwTGe+eBDL102YCPH5GUX3MwbzzR8312Rqo
         YS++mhsovkZUkVk5Ar0zPFuVA0Gvgb2gffkRt0v4VRlMZuteaWRpc4ZnHBA49qaxHD4c
         rJoR5+Bj25KdoIcz601Vuxn+HTcQB6RKImX2ki8tS9tZ4KqFuvceLSBs0U3CPRIGawOa
         2eoYwnd6Wdd2blzCO5Wd3BNZgtD3xWbHH6V21GIw9N1C8+2IHXAGx64Sn8gu5suhicPC
         kYUw==
X-Forwarded-Encrypted: i=1; AKwUvBxMLKpMZ/NWZ9RBwE1rsLuO7rXm/iLpLXkq64/w7MdVNdYsg09jtla0PqLjYyO1Qlvk6wEpWcbqFCU=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIx6scxYq2W/H/dna+lIecvS6JDmomqAJLpDKjCgDRgjTkzCrBo
	xkC97zm2BIpI7k6YYrRr+1hWRU71YseFMayBp0K6/JnuohfcMrtY7odLWKuIhYXoogk=
X-Gm-Gg: AYBFou3mwqSRQyEsU6JJY2BC2fhK3jedZXnPK+YZrtCZIBAXBySSsYI5SQDcDTuD70f
	oibc3Irm37E2gco6ZibrW51e9SgpmpvFW6V4d85eDbTjbEylwU3bsape6fF7XGqnXcDX+rcn8hQ
	rnU4SkVTiDJPk8EUzmk1CbT0iE4/G/XBdsBX5b+lkOd6MB61CpLjNuhXuXgpkunuNHVXHBcVYo1
	X5wOWlLSxd0s0VeRpQg31WP4lkkfcxVB05G96FFC+rcwwwaWnWD3Ne3rreMKIOYLiDEHyJTe5YT
	NbGFWB3/YlKdtwsP1Vba4NRKZ/T/ayhsSylJ91GeU92yhqvvSL80+7t6hAo+Qu0nxGbNRW3KNOV
	9EsGnMdt7QGjNoZDv84fkTbaZlJIa4zlDP0mr4yINplBvLuPFlBQPg80n9Om/rcg8RhF7Otrmjj
	Rug5IwSYrL292M9/pyNvJcYkkheRmZoDbApmtSK5LEfcw60TvRH6ocm+QhAT3FHWK+X0038cJ6f
	TA31byTlCKRxsi6
X-Received: by 2002:a05:620a:4095:b0:93e:6b9e:6167 with SMTP id af79cd13be357-93f29cee007mr1347508785a.16.1792417858142;
        Mon, 19 Oct 2026 06:50:58 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:36 +0000
Subject: [PATCH net-next 02/15] net: skbuff: add skb_checksum_full() that
 reports failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-2-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417848; l=5325;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=ZlvWwY4Y8lGqu2UhxWxy8P8g8HVcQXW7x438vujwS94=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNFaoaSkHTQ/kJoHxBw9tZmbGdrEQBXIlSmcmhx2hYL/udLBNhUXEeeONY2pepSid3GD1qdel1E
 VD02yM/ZF5Ao=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-bad1c0/1792417859-FCE14034-D3B0E2FC/0/0
X-purgate-type: clean
X-purgate-size: 5327

skb_checksum() can't fail.  When the range runs into unreadable frags
or past the end of the skb it returns 0, which is also a valid
checksum, so its callers can't tell the sum from a failure.  For the
receive-side validation helpers that means a packet whose payload was
never checksummed can pass, and commit 20ddd0fd2fcd ("net: skbuff:
don't BUG() on leftover length in skb_checksum() and friends") made the
past-the-end case one of those instead of a BUG().

Add skb_checksum_full(), which adds the range's sum to *@csump and
returns 0, or returns -EFAULT for unreadable frags or a range past the
end of the skb, and -EINVAL for a negative length, leaving *@csump
alone.  It's __must_check so a caller can't ignore the failure, and it
recurses into frag_list members through itself so a failure there
isn't lost either.

skb_checksum() becomes a wrapper around it that behaves as before for
the callers that haven't been converted: it returns 0 on failure and
warns once if that was because of unreadable frags.  The following
patches convert the core users, and the rest will follow per subsystem.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |  2 ++
 net/core/skbuff.c      | 56 +++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 48 insertions(+), 10 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 09db32f70b53..969b1c3269ec 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4279,6 +4279,8 @@ int skb_copy_bits(const struct sk_buff *skb, int offset, void *to, int len);
 int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len);
 int __must_check skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 					u8 *to, int len, __wsum *csum);
+int __must_check skb_checksum_full(const struct sk_buff *skb, int offset,
+				   int len, __wsum *csump);
 int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int offset,
 		    struct pipe_inode_info *pipe, unsigned int len,
 		    unsigned int flags);
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index a2b52a5a61a9..061c61422a38 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3545,12 +3545,31 @@ int skb_store_bits(struct sk_buff *skb, int offset, const void *from, int len)
 EXPORT_SYMBOL(skb_store_bits);
 
 /* Checksum skb data. */
-__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
+/**
+ *	skb_checksum_full - checksum a range of an skb
+ *	@skb: buffer to checksum
+ *	@offset: offset in @skb to start at
+ *	@len: number of bytes to checksum
+ *	@csump: the sum to add to; on success the range's sum is added to it
+ *
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	has unreadable frags in the range or runs out before @len does.  On
+ *	failure *@csump is not changed.
+ */
+int skb_checksum_full(const struct sk_buff *skb, int offset, int len,
+		      __wsum *csump)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
 	struct sk_buff *frag_iter;
+	__wsum csum = *csump;
 	int pos = 0;
+	int err;
+
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
 
 	/* Checksum header. */
 	if (copy > 0) {
@@ -3558,13 +3577,13 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 			copy = len;
 		csum = csum_partial(skb->data + offset, copy, csum);
 		if ((len -= copy) == 0)
-			return csum;
+			goto out;
 		offset += copy;
 		pos	= copy;
 	}
 
-	if (WARN_ON_ONCE(!skb_frags_readable(skb)))
-		return 0;
+	if (!skb_frags_readable(skb))
+		return -EFAULT;
 
 	for (i = 0; i < skb_shinfo(skb)->nr_frags; i++) {
 		int end;
@@ -3593,7 +3612,7 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 			}
 
 			if (!(len -= copy))
-				return csum;
+				goto out;
 			offset += copy;
 		}
 		start = end;
@@ -3606,14 +3625,17 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 
 		end = start + frag_iter->len;
 		if ((copy = end - offset) > 0) {
-			__wsum csum2;
+			__wsum csum2 = 0;
+
 			if (copy > len)
 				copy = len;
-			csum2 = skb_checksum(frag_iter, offset - start, copy,
-					     0);
+			err = skb_checksum_full(frag_iter, offset - start, copy,
+						&csum2);
+			if (err)
+				return err;
 			csum = csum_block_add(csum, csum2, pos);
 			if ((len -= copy) == 0)
-				return csum;
+				goto out;
 			offset += copy;
 			pos    += copy;
 		}
@@ -3621,9 +3643,23 @@ __wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
 	}
 	if (unlikely(len)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
-		return 0;
+		return -EFAULT;
 	}
+out:
+	*csump = csum;
+	return 0;
+}
+EXPORT_SYMBOL(skb_checksum_full);
 
+/* skb_checksum() has no way to report failure, so it returns 0, which is a
+ * valid checksum.  Use skb_checksum_full() in new code.
+ */
+__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __wsum csum)
+{
+	if (unlikely(skb_checksum_full(skb, offset, len, &csum))) {
+		WARN_ON_ONCE(!skb_frags_readable(skb));
+		return 0;
+	}
 	return csum;
 }
 EXPORT_SYMBOL(skb_checksum);

-- 
2.55.0


