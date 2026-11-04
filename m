Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3026097336
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Zs1KVzpA
Received: from list by lists.xenproject.org with outflank-mailman.1472761.1680627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhto-0003og-Pb; Wed, 04 Nov 2026 20:48:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472761.1680627; Wed, 04 Nov 2026 20:48:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhto-0003nn-Ig; Wed, 04 Nov 2026 20:48:00 +0000
Received: by outflank-mailman (input) for mailman id 1472761;
 Wed, 04 Nov 2026 20:47:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtn-0003Yk-D0
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:47:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtm-000QZ3-Pp
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:58 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99a0-8faa-0a2a0a5109dd-0a2a4501dd76-46
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:58 +0100
Received: from [209.85.222.173] (helo=mail-qk1-f173.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99fd-5984-0a2a45010019-d155deada5ca-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:58 +0100
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-945ae2daa68so118183685a.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:58 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.255])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-945d4899dc6sm291976285a.43.2026.11.04.12.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:56 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825277; x=1794430077; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2iqbyIbqll56rZUjTWyhCsGjkAY8FnoBuOzACgDTjoA=;
        b=Zs1KVzpAla11JYbnEPduhouBUUPhE2/iTv8I2QsNcxPsYqCnCohWlqAXxIOnjp6iMK
         30b8RxswdEmFo8Z6n8MhgEHdqzzji6mHpNXQxacavAMS3gs2QNqlJuVcTeAo9dzBYmQG
         S1VLMJOcjqe6/QdO27s5tYr0Zfr6dxSr5yqM6NnqrF/5BDiOigu6qsRsXKD4Z5LZtEgK
         QeAWoUivNWgjd7ZmetFBn8Ebp2xJ5YZwh9IHvzWLDfQkPNMV31X+LDE2X+sFW0LAMBSa
         x/bUbcGwK1xLmapcKy+vYQbTWdHemdy1sjGMkXIQrymHqLkeYsxJSy1shILhTVvAk+dk
         JFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825277; x=1794430077;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iqbyIbqll56rZUjTWyhCsGjkAY8FnoBuOzACgDTjoA=;
        b=sOVKiRmLExLY3/2lslr1tuB9yqKcwnjTZOHFXPHQfZ7pbkW5dSmr/5vp00jfCc77LS
         d4RQmmFMPN6Cxri+0CAH21iiRPPMzIwBFk9MZQXLU5UnwLhyV3DjINmkTLX6/JqpbQKa
         6L1DQ/xPOrZhY81zUgQYMfB1KOb1LIttJgxlp/k0O7zxYOHWAq2P2RLHtnc2rkdF73eK
         5q0GCSjLIvbSznxLf4rVH6+AYk/gVQHrh65KcxBrJJrGDAGeTZxCpfyuIDgJX5p5P5nS
         yzNAl9DtX9QzsTzFOECVoOihOMSTz4EiFJOEQnGvFawTr8PeQEzi5jbobmgtlDEaF6U9
         fI5w==
X-Forwarded-Encrypted: i=1; AKwUvByCARWgxvQVFUyIQr/BKuD1CEngKn7jizT+CZ/yF2rYok5gwA/lWfbO0i1/3I5Xs3j1BSazB4ZYxIk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8ay5A7SjkRHbrRwE4/eqZk2cil0iJjgsdhGZnJJ6oku7sf7SDt
	j4fdHKFAl9aLeN/OzerOPfFnZCTA6OJmAcq13x0r5HUnfw9Noo/Bg+Bmogk8v0io/S8=
X-Gm-Gg: AYBFou2gjulltGmhcvzGML3pu31pb+IJAhCCfkpKjrHho8CC+ZwL1ufxYhE4wiDaceV
	J8kjtIyLL3s6RIgK5bySWYZiFozdbtxE/NfnbHJZkCviPCL0sI4G8A6UsLbcOxs4D8miuj6iO+i
	tce31n51O+dyX6iTVuN6dJmIt4iY4XL7i0vEsWE2IP03h7Is0Eeza417LaHZc+2cN1wAmh+VB09
	4nT4JH9ke4g2KcjsLRTifLSNillMFxKpeOfKfqRgcZrdajJZ7zL7eBSzxViJVY6TqfULd9s9NLU
	z6Au5314bKRzIU3DS3UkPrJ7cMhp+W8Gm6CyXN6w/i8i+l3/97av5J/g3LwkN3EW+s35knTnUt/
	TSCOVrj2Qvq2EkcRYSjcFgXTq4AiO8FJt+fV3TIiFtPjGeSITr1PAnXXSxQOReNeSR4Zo1FKJRC
	BWhoS8a0YaagjmJmGf/lMGrb/+IK19ZU43Nk9j0x1dG4cCl3CRMoYmYN+3dGwkx9rUGY8XHQWIv
	+YeXNYeLUE4tCbAVnU2msthARF6D88v7gtooeTr2I6NlSLmM9k5mPsa5sCpFC0EoAXuNmR+Hur8
	vxskKciGkPsrTxusb1vznUnNNzxREeBJwFm6LNTpUED+6w==
X-Received: by 2002:a05:620a:2788:b0:93f:3834:31f9 with SMTP id af79cd13be357-945e16aa3e7mr108928085a.12.1793825277204;
        Wed, 04 Nov 2026 12:47:57 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:18 +0000
Subject: [PATCH net-next v4 06/15] net: skbuff: add skb_crc32c_full() that
 reports failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-6-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825268; l=5927;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=DmjhWQ5DbJzFnm4Wwg1TpS3SDY+QYZAOw6lUp58u+o4=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBjRiNxwpgAKwONkFhB+BneqX78IwJRr+LyApr85bnefV3HRAkCkhFAn5Dl/gju2+QcLKWjlQoe
 FEZd97LNDlQ4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1793825278-1DA7E757-58C06D0E/0/0
X-purgate-type: clean
X-purgate-size: 5929
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_crc32c() has the same problem as skb_checksum().  When the range
runs into unreadable frags or past the end of the skb, skb_crc32c()
returns 0, which is also a valid CRC.  sctp_compute_cksum() and
skb_crc32c_csum_help() complement it, so a failed walk looks like a
checksum of 0xffffffff whatever the packet contains.

Add skb_crc32c_full(), which works like skb_checksum_full().
skb_crc32c() becomes a wrapper for the callers that aren't converted
yet.  The wrapper still returns 0 on failure, but it no longer warns
when only a frag_list member has unreadable frags.

Convert skb_crc32c_csum_help(), which can already return an error, so
that an SCTP packet that can't be checksummed is dropped on transmit.
The other callers will follow with the skb_checksum() callers.

Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_checksum() and friends")
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/skbuff.h |   2 +
 net/core/dev.c         |   7 +++-
 net/core/skbuff.c      | 100 +++++++++++++++++++++++++++++++++++++------------
 3 files changed, 83 insertions(+), 26 deletions(-)

diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 5a5354a6b6ba..5581ed3cbf47 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -4332,6 +4332,8 @@ static inline int memcpy_to_msg(struct msghdr *msg, void *data, int len)
 
 __wsum skb_checksum(const struct sk_buff *skb, int offset, int len,
 		    __wsum csum);
+int __must_check skb_crc32c_full(const struct sk_buff *skb, int offset,
+				 int len, u32 *crcp);
 u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc);
 
 static inline void * __must_check
diff --git a/net/core/dev.c b/net/core/dev.c
index 00a62c391056..f9878db781df 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -3752,8 +3752,11 @@ int skb_crc32c_csum_help(struct sk_buff *skb)
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
index 66ba9bfa8fc7..96c8835a262b 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3825,23 +3825,79 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 EXPORT_SYMBOL(skb_copy_and_csum_bits);
 
 #ifdef CONFIG_NET_CRC32C
-u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
+/* The frag_list part of skb_crc32c_full().  It's out of line so that taking
+ * the address of crc doesn't cost every caller a stack protector.
+ */
+static noinline int skb_crc32c_frag_list(const struct sk_buff *skb, int start,
+					 int offset, int len, u32 crc,
+					 u32 *crcp)
+{
+	struct sk_buff *frag_iter;
+	int copy, err;
+
+	skb_walk_frags(skb, frag_iter) {
+		int end;
+
+		WARN_ON(start > offset + len);
+
+		end = start + frag_iter->len;
+		copy = end - offset;
+		if (copy > 0) {
+			copy = min(copy, len);
+			err = skb_crc32c_full(frag_iter, offset - start, copy,
+					      &crc);
+			if (err)
+				return err;
+			len -= copy;
+			if (len == 0)
+				goto out;
+			offset += copy;
+		}
+		start = end;
+	}
+	if (unlikely(len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EFAULT;
+	}
+out:
+	*crcp = crc;
+	return 0;
+}
+
+/**
+ *	skb_crc32c_full - CRC32C a range of an skb
+ *	@skb: buffer to read
+ *	@offset: offset in @skb to start at
+ *	@len: number of bytes to include
+ *	@crcp: the CRC to continue from; on success, updated with the range
+ *
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	runs out before @len does, or if the range goes past the linear area
+ *	of an skb, @skb or one on its frag_list, that has unreadable frags.
+ *	On failure *@crcp is not changed.
+ */
+int skb_crc32c_full(const struct sk_buff *skb, int offset, int len, u32 *crcp)
 {
 	int start = skb_headlen(skb);
 	int i, copy = start - offset;
-	struct sk_buff *frag_iter;
+	u32 crc = *crcp;
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
@@ -3866,34 +3922,30 @@ u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
 			}
 			len -= copy;
 			if (len == 0)
-				return crc;
+				goto out;
 			offset += copy;
 		}
 		start = end;
 	}
 
-	skb_walk_frags(skb, frag_iter) {
-		int end;
+	return skb_crc32c_frag_list(skb, start, offset, len, crc, crcp);
+out:
+	*crcp = crc;
+	return 0;
+}
+EXPORT_SYMBOL(skb_crc32c_full);
 
-		WARN_ON(start > offset + len);
+/* skb_crc32c() has no way to report failure, so it returns 0, which is a
+ * valid CRC.  Use skb_crc32c_full() in new code.
+ */
+u32 skb_crc32c(const struct sk_buff *skb, int offset, int len, u32 crc)
+{
+	int err = skb_crc32c_full(skb, offset, len, &crc);
 
-		end = start + frag_iter->len;
-		copy = end - offset;
-		if (copy > 0) {
-			copy = min(copy, len);
-			crc = skb_crc32c(frag_iter, offset - start, copy, crc);
-			len -= copy;
-			if (len == 0)
-				return crc;
-			offset += copy;
-		}
-		start = end;
-	}
-	if (unlikely(len)) {
-		DEBUG_NET_WARN_ON_ONCE(1);
+	if (unlikely(err)) {
+		WARN_ON_ONCE(err == -EFAULT && !skb_frags_readable(skb));
 		return 0;
 	}
-
 	return crc;
 }
 EXPORT_SYMBOL(skb_crc32c);

-- 
2.55.0


