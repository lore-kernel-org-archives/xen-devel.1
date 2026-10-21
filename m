Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56506606A332
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=NSXq2rx1
Received: from list by lists.xenproject.org with outflank-mailman.1457182.1670100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf3-00045d-OR; Wed, 21 Oct 2026 13:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457182.1670100; Wed, 21 Oct 2026 13:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf3-00045R-KQ; Wed, 21 Oct 2026 13:47:21 +0000
Received: by outflank-mailman (input) for mailman id 1457182;
 Wed, 21 Oct 2026 13:47:20 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWf2-000436-QB
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWf2-0082fY-6Y
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c265-bab6-0a2a0a5309dd-0a2a4501bb8a-8
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:20 +0200
Received: from [209.85.219.50] (helo=mail-qv1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c267-5984-0a2a45010019-d155db32ac48-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:20 +0200
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-91b834592afso8922016d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:19 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c10b736adsm24541966d6.7.2026.10.21.06.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:17 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590439; x=1793195239; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ydoWrUsryFQCXy0qk0+H+VOsHqxoYPyCdAWJE4iSCqQ=;
        b=NSXq2rx1o+rfp7k4E9hljUPF1uVXW3l+4EH5hntGX96e6bBdb9gmUBUvm1ayDGEuU2
         3kEW1Dg0D9sZ6G5lq4+QSUiURMaYmP3JDqkvfpx6+yGgxhkXXxUvzCapUxCiEi4TPrFa
         MwB0EBQGByvSk6Cto7jHO1C3DMEopNf8+BDrzkFdggHg7HJByBtxhI+uUK3qrIgAuSC2
         jlQN/354OHlXCRUkm49Vi9q9DoJngXRGCTAtiGuCgI/Tf7GDx0fK4Z8traOiOgB6YXtw
         Q3kfYN6FrkgpXBYbmaB9iV7XUc0jb5EbvsXpnD5qDcC5zO7hl3jYtWJhW5ZwRlx11gAd
         HCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590439; x=1793195239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ydoWrUsryFQCXy0qk0+H+VOsHqxoYPyCdAWJE4iSCqQ=;
        b=Bht3GeqvsfZ52rGlLQJGp8mBltH8zGYrlmsf+M1wNmQoxq4dftG3MXOqMBPxG1ICzl
         Z230zR2pFFr0YPxvzXt6Y2CPVMk2n79CTfxifquP39vBLlnnU65ov56eaDJAXsxcarx1
         odnKRi88j+NvaF58EBtzx+VLTQVhsmEeFD2pzUCTHz4Ji5vERMfHX1zXwIlvywSBlbZi
         DSYpcF9NP7LbFd+g3GRwlA7RVcxO8kG9CchXLKEwGAIpWHkvfEQTsvsz8eQwfGoiQs0Z
         XKKje3hPfyrkWpHMXmFueqvw5sp13+b5oq70R5R32Qmz46Ygaex+XCIT1g6pBC4VOy1f
         7NFg==
X-Forwarded-Encrypted: i=1; AKwUvByy1WqzJhZZC+gz9FOWQ3h/s4qOwjIFtdolgzIKFQ/OjNLdQb/xJWS84DA3kGS7UDIPTnj3N/8utlc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIpQTR9LJa8XmH65ATYxlbor5fNh+myaF0MDeANXpcqtVNS12tQ
	mYEnBSI/aCMhP1/mzLbiMW2r82ErMIR072dEMk5zsKmhAKsze//Y2rOjf4bHIbfFSlo=
X-Gm-Gg: AYBFou0DmKPhkH0Y2F3yuio4y8NkWJSBBF8KA/rDXg896FULdCj2w5eY8PxLfI+HTZJ
	9MkMje7zWOz7pVxVsRq/Drql9EFqx+zOpwZB+ubw/HMIQkUaoKEziHWjB54rHOIB3SK8KK+ZbUY
	BH80gTw1l14dFYK8SkUO40NIagbs/ikkaHU+UU8U36wJCwnk9Nlt2pRRBIW2ui5NZ4Gbelrh64h
	de+7ZgnXsfWYlHecOpfsBY1QJcG6zMy/UQZGZpaDriickv2JSpjP3xD0vkbURMbKX2AWWwCLVD9
	tWDxLjmcjg0DN9vsRW0O0qlHkZns5V1kaIONgANkhacvLP7EPa6dsRKlPbE30WTokac7pWVLvHH
	6jWHMu571uVYdyTBcY3q+oA0LyxqaPoEuJQwSuirZAxjL8CRRBRR9Vi3cfCtCWgX5QqwsJ4HVTu
	a/W0difOXCGLjhY3mZjbLiZauWpo08hvfoBMoXa/4l3u5dj4kZGAzpKizhO1qALaV2Bp0eT1+od
	o2WX1QpWk81/siOFwB5Dsmit5JsLa2KtUFcptS6nW0LclL5DN+XsDCqrwIHZE+2lrvCI7wA
X-Received: by 2002:a05:6214:3c8e:b0:914:7df6:ca52 with SMTP id 6a1803df08f44-91c12edf334mr35650786d6.9.1792590438463;
        Wed, 21 Oct 2026 06:47:18 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:50 +0000
Subject: [PATCH net-next v2 06/15] net: skbuff: add skb_crc32c_full() that
 reports failure
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-6-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=5122;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=4gDL1d1n3xZ9vhvHuHh+fxzaWH1kti0hEf02jn3aBlw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGFH6qByESWgbyznzi7Yaz/CoAWhQfAOqIbi/BhB5oBR1rY2fhlWIxIK8c81xGv75bwiI8TG6yn
 I+0cEu9/8yQc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1792590440-1F66C757-1EF61EA9/0/0
X-purgate-type: clean
X-purgate-size: 5124
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


