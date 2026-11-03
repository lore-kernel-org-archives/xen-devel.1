Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2099F606A338
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OHeZKGKd
Received: from list by lists.xenproject.org with outflank-mailman.1468939.1677979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gl-0008OJ-1K; Tue, 03 Nov 2026 02:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468939.1677979; Tue, 03 Nov 2026 02:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Gk-0008O6-UF; Tue, 03 Nov 2026 02:29:02 +0000
Received: by outflank-mailman (input) for mailman id 1468939;
 Tue, 03 Nov 2026 02:29:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gj-0008A8-QB
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gj-00CYCC-6W
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:01 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae94690-e002-0a2a0a5209dd-0a2a450cec40-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:01 +0100
Received: from [209.85.160.175] (helo=mail-qt1-f175.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946eb-f479-0a2a450c0019-d155a0afc83b-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:00 +0100
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-5364042eecfso60665371cf.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:00 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5498cf4c174sm13684401cf.29.2026.11.02.18.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:28:58 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672939; x=1794277739; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcFo5FOvZmv6l4451K3/sYsoJxTuD/ptYd3JpfIB/vc=;
        b=OHeZKGKd0JsuKgsZKymYuxj4KPusK+K21lsvG7x3VyiBJM0JdnZ5OCTqnw1N//iERx
         CCBmlnk/VLQohQ81ai/6sLfb5HGT2RJpVRjNnnTsttaaT9Uwt0cX6paKO2pAnJbeb89Y
         Tyxt2BpomiGUPaKTGPrBmzk+mtac9jHwEyyCTZiqWerZs/I5yhBhSNvFDfzX6Avuspi3
         MnQcts3HYOvmWLXVBWToo6T0K2Xylm7QECqbto8SB6mXLTkCkSZKc9Pqwz0vz2ONQPLZ
         LJyUaVY3Vif/dwaj6qjJq0HFhLLkLFpxPZDWVA6DjQynzddX4CmhX8MdRKpri2+8oKDs
         XW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672939; x=1794277739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DcFo5FOvZmv6l4451K3/sYsoJxTuD/ptYd3JpfIB/vc=;
        b=N4M+4fsxEoklkAuJMpmd1qWTTEG2t64cdoB9OTCPdFagRG+yjBwRm0C+aPt24rlyqE
         /1NjS8ldDBm1RzABwRJcthQSG4h8zCmzBQkX/G1gF4BVpC70VGkgkOs3iPZmSYtmRWnd
         2SzAF1UuHjXYhPh6h842Mdbd834n46oxYcvhKEXjFLx7qAOa64Avtjhmq7sByk0tCflo
         om6cY8kTHGM+BmSFrEyJB2oxjBWV3uTOzuEh5ZYfwrExpnpUsLOlAqLoZ0YNCo0sME+8
         XkRq6lDEngsp7OgtIKFJ7KyIbJe3bU1CuUxVCnTzJ5EKdXdj+NnACHVpaEQqnVIRbtZw
         wTqg==
X-Forwarded-Encrypted: i=1; AKwUvByTQj3JE8dvx3vVWNeoCbXHWK1pRy1Bo2rqEyoeuITlUlBy7ZAt4MRRjYnTL0+yJopcZgG3PhTzU4A=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/rzZhmDxKLUKHpzBNPywOdp/SiqPwdZl8RPK9HIuNo3kiFq5AS
	rPwIOdvQNFs4Mm1xs99snUsj3QixinA+mrNDNVrlge2TBZc9uESiz6Rodad4FxwiEcI=
X-Gm-Gg: AYBFou1jdCJ4PiE4CHTd6ccVMdEs5ConEc6WOeNcVrUi1gYvWmZkiCPwEvLWmjB9uCG
	0Sea7IQIf8ZffjAiD1CB0juzqw0ywgDVl/oLSFv6/9Ql9pp5jUWYgSJvJXtfr/8Dw8OY9iqNJsU
	ekHTPpBsSQX+RIIHA5yPbSNM2uebZeA2N1d39hxvCA5fG0OO7oSp82X4x/wInTyZ/gZdKlmecly
	fvhNsEYJkuUYZRG6SIPP4ILf6ohu/K2gKZpx+uG6Wa70sGtYqoGBDEXSMuZ1zp1S2RJekKkJHcX
	VwHZ3QG8L/6NOiE8enwCYSw3At5hXGF16WieA5R5dtfz0GX98Pm8bz1mWPHIG9/bRQVbDYZjG4P
	0IF47jB0JgEKqmKUcBI/DlLopdyPxvR/eDI/dlhEoL2H1SDo1xzMILk8U+FDRqKzC/B828DU/PQ
	0jAH7zOEYlzZa62T15arGZQVxIwt3a/00sFxDoWLg16vzek91Wee1RxCv5JrUA/HhzickndncUN
	ibWfy+d7tWKrpcDeTY68uBSjn7xD1sMLlVAuqB5urjc2wFSENmlZZUBHc4FvlFXOFHz6xfdCpS+
	8A3daf51BwIQmiVfwt/QE2NtLFd3WX0QDS59QtBDIazSzA==
X-Received: by 2002:ac8:5f8c:0:b0:535:15a9:2516 with SMTP id d75a77b69052e-542b75248e1mr201824771cf.53.1793672939316;
        Mon, 02 Nov 2026 18:28:59 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:33 +0000
Subject: [PATCH net-next v3 07/15] net: skbuff: let skb_zerocopy() copy a
 short skb without head_frag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-7-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672922; l=3270;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=h0Wqrzd3xqr+PYqL1pPzooJBchVLWNZbZHd25h+Yqck=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM+Y4diaiiBY8eankmF9aAo6/WhJsaCKYztAziuHXrT++wyED3G5cAIsbBu9yfcjJg9jVGYbpO6
 rhMjmGXTK1wY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793672940-776D6A5B-D43AD7CB/0/0
X-purgate-type: clean
X-purgate-size: 3272
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_zerocopy() refuses an skb with no head_frag when the caller passes
hlen == 0, because it can't reference such a head as a page.  That check
sits ahead of the small-payload path, which copies everything with
skb_copy_bits() and never references the head.

Open vSwitch gets there with an ordinary request.
OVS_PACKET_CMD_EXECUTE allocates the packet with a kmalloc'd head, a
POP_ETH action on a 14 byte frame leaves it empty, and a USERSPACE
action calls skb_zerocopy(user_skb, skb, 0, 0).  The upcall fails, with
a WARN on CONFIG_DEBUG_NET kernels.  Before
commit 433380f5ab8f ("net: skbuff: don't BUG() on a missing head_frag in
skb_zerocopy()") it hit a BUG().  The request only needs CAP_NET_ADMIN
in the user namespace that owns the network namespace.

Move the check below the small-payload path and document the -EFAULT
case.  A genetlink reproducer run as an unprivileged user in its own
namespaces warns before this patch and doesn't after it.

The small-payload path hands @len to skb_put(), which panics on a
negative value, and nothing runs ahead of it now.  Reject a negative
@len or @hlen on entry with -EINVAL.  Neither caller passes one.

Found by the Sashiko AI review of the BUG_ON() series.

Fixes: 433380f5ab8f ("net: skbuff: don't BUG() on a missing head_frag in skb_zerocopy()")
Fixes: af2806f8f90a ("net: Export skb_zerocopy() to zerocopy from one skb to another")
Link: https://lore.kernel.org/all/179173804997.434549.4450793967361922984@kernel.org/
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 15d1f4142f29..d79d8463c44e 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4072,8 +4072,10 @@ EXPORT_SYMBOL_GPL(skb_zerocopy_headlen);
  *	Return value:
  *	0: everything is OK
  *	-ENOMEM: couldn't orphan frags of @from due to lack of memory
- *	-EFAULT: skb_copy_bits() found some problem with skb geometry, or readable head
- *      payload would be mixed with unreadable frags.
+ *	-EFAULT: skb_copy_bits() found some problem with skb geometry, @from has
+ *	no head_frag and @hlen is 0 while @len doesn't fit in @to's tailroom,
+ *	or readable head payload would be mixed with unreadable frags.
+ *	-EINVAL: @len or @hlen is negative
  */
 int
 skb_zerocopy(struct sk_buff *to, struct sk_buff *from, int len, int hlen)
@@ -4084,15 +4086,23 @@ skb_zerocopy(struct sk_buff *to, struct sk_buff *from, int len, int hlen)
 	struct page *page;
 	unsigned int offset;
 
-	if (unlikely(!from->head_frag && !hlen)) {
+	if (unlikely(len < 0 || hlen < 0)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
-		return -EFAULT;
+		return -EINVAL;
 	}
 
 	/* dont bother with small payloads */
 	if (len <= skb_tailroom(to))
 		return skb_copy_bits(from, 0, skb_put(to, len), len);
 
+	/* Without a head_frag the head can't be referenced as a page, so the
+	 * caller has to ask for it to be copied.
+	 */
+	if (unlikely(!from->head_frag && !hlen)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EFAULT;
+	}
+
 	to->pp_recycle = from->pp_recycle;
 	if (hlen) {
 		ret = skb_copy_bits(from, 0, skb_put(to, hlen), hlen);

-- 
2.55.0


