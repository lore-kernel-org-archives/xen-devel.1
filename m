Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C60606A324
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=AuNp0eeB
Received: from list by lists.xenproject.org with outflank-mailman.1457184.1670108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf6-0004NN-1L; Wed, 21 Oct 2026 13:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457184.1670108; Wed, 21 Oct 2026 13:47:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWf5-0004N3-Th; Wed, 21 Oct 2026 13:47:23 +0000
Received: by outflank-mailman (input) for mailman id 1457184;
 Wed, 21 Oct 2026 13:47:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xJWf4-0004Gc-OE
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 13:47:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJWf4-0082fY-4s
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 15:47:22 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c265-bab6-0a2a0a5309dd-0a2a4501bb8a-18
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:22 +0200
Received: from [209.85.160.174] (helo=mail-qt1-f174.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad8c269-5984-0a2a45010019-d155a0aeb91f-3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 15:47:21 +0200
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-5361e313e63so7844711cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Oct 2026 06:47:21 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-536ab6f1cd7sm99741cf.10.2026.10.21.06.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2026 06:47:19 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792590440; x=1793195240; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbXvQLGgZpsimSrfs+W8d8Jbr4mc/fISMihOBkAlu6E=;
        b=AuNp0eeBSQhvNs1v7mk60klD9nA3B04VLWN8Iz5/iqRbUdXUpYJ0XSq7OlNAV/yKvA
         UV6RtmGl3gTJ4+r6X0WCa938gLdsavR0olM5P3ydCFjlahGsmVmiKCg1rqiMqBhGeZv1
         wxGng3PFBMLYIc5MVQg5a9AN+Z2ISa2J3kGgb6aei2dsvvKvkFTCDJTsoNotXsZF44ps
         YUy8YRv01A7hDNz/ocVYZY2/gc9jGRPNV7dYNQzi87Wcwy0ZgahvYOD8qHAAYOjiL20c
         NRo227ZYAO+W8YKbnCtTkdEjOK2wdPHP4bloig1xGkU8wGMW5nyztOtGnuYm76n4blrj
         2ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590440; x=1793195240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbXvQLGgZpsimSrfs+W8d8Jbr4mc/fISMihOBkAlu6E=;
        b=Gatdm10E2CcMlmL4rRxrzYZW5Nhf9TXiz6EfyFgoaB0OBTznjV0KsrhHHEaV7Dvk4/
         6nx4OpmWl7y9cbWqGdV3Yv+5Q2m1lLgAq6KHaNjR8Gp3YCIpxc8XMt4YRwRteJkKbHwv
         UcAoHlN6RAorWD1Ux0EPRTXOvy2AnM8HU6T7l758hLr1/HvBsEYXjF9wZXUi0HzeX+QX
         wruekm7CYoRRQ3cxbnE+OKXfCRwh2rZfFDOP7ERT2B9Kjktlte/gAgkwZcE+1EiKgoH3
         adEOKtOK/F9TX86xNWDdupfkE2YYW0IFTq0XTS2uq1y2Vy1VVOL8tTY6ssN11KEB9PXM
         Foqw==
X-Forwarded-Encrypted: i=1; AKwUvBxCJIn+M2IwYk1GPsrLhb9VEs4Bp2+iLiYoBvcVktpLccuMN9j24mwqgoTtlnxOqMMP65whQ22dn78=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIvVaEVr4YmDhusOVvpFEAFLO0+aRI5EzOtapV2OZaVEJPY5HFy
	LVctBTdTJHq4Hjz6Xba4tbvs3f8LRt4XLKI6ySXiANXKAMOt+KeNIflWPfnDM5EnF9U=
X-Gm-Gg: AYBFou0MpjjfFYoqK1dW2PbTYPNiWQDXaAbic6Mi9K86SVmrANg/UfDoOV5yptH+Fqk
	9wQ04GFWBtzBzSELqfUjsQhUoVzvRSii2EhK/U3IVbkXNZJulqldI4dcvD0YVpyLSLqND0MvCRM
	mQ1kANH8WmmCAFmVlRO1Gj72A1/sVbMWouK6HrPVciLxfX/0HKemYKcXLDwypldlZOnlw99NJeL
	yZhNBk56mxk3uCsGrtRHV4Ds8QJ4bYoOukO/cXaJ3t8kktpI9kFFdJLj8cywmY8TlB1//wKyxQf
	Ga79+KKTJUGUd8Ph1GeQ9VxgAsXq0szScegaJ87s2rgQcPeuX1Re8PTh1OH6IqzB4X+gYTVe8nI
	A6Pu2jIDQ8Dvl6FBk058NvRAslqA1f+q4UGICDQPwldzFqvVcIYz1Bv3lfy5Q0n5NQwTxz6XgO5
	yrSOJNslY9BW/kl7YdFMSV7+4sldMOGjigIygP6MihdxAx9eSS+1ZnQqcixZtAR1P8+lJkLzIdU
	DDUuXGWcgnXP7fhgzyLYcLse1Q+K1c+lXh7F8THK5XFOp+61JbWd6RcxnucAjqGy1np3Vyf
X-Received: by 2002:ac8:59c9:0:b0:535:1a91:1d24 with SMTP id d75a77b69052e-5369b7f388fmr31766751cf.43.1792590440431;
        Wed, 21 Oct 2026 06:47:20 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 21 Oct 2026 13:46:51 +0000
Subject: [PATCH net-next v2 07/15] net: skbuff: let skb_zerocopy() copy a
 short skb without head_frag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-b4-skbuff-bug-on-followups-v2-7-2aa780a03524@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792590423; l=3126;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=p1EJ3Mjc5nJGteUiFCelu7Pkg91i/fkjkkkh/ts8Tfs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNjL87kVYWUrnftY9mKgbby2CAWEAfeQsOPkOxYJxwdVe1tb8PkhdyoBdSvFLiY/y+B7u4uFDoJ
 YD3tF1Z8SYAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1792590442-1DE78757-F2D6B848/0/0
X-purgate-type: clean
X-purgate-size: 3128
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit 433380f5ab8f ("net: skbuff: don't BUG() on a missing head_frag in
skb_zerocopy()") turned the BUG_ON(!from->head_frag && !hlen) into an
-EFAULT return, but left it ahead of the small-payload path.  That path
copies everything with skb_copy_bits() and never references the head
as a page, so the check doesn't apply to it.

Open vSwitch gets there with an ordinary request.
OVS_PACKET_CMD_EXECUTE allocates the packet with __dev_alloc_skb(...,
GFP_KERNEL), which gives it a kmalloc'd head without head_frag.  A
POP_ETH action on a 14 byte frame leaves it empty, and a USERSPACE
action then queues it with queue_userspace_packet(), which calls
skb_zerocopy(user_skb, skb, 0, 0).  That used to BUG(), and now the
upcall fails and the packet is counted as lost, with a WARN on
CONFIG_DEBUG_NET kernels.  OVS_PACKET_CMD_EXECUTE only needs
CAP_NET_ADMIN in the user namespace that owns the network namespace,
so with the openvswitch module loaded any user can do this from their
own namespace.

Move the check below the small-payload path, so a zero-length copy
succeeds the same way it does for an skb with a head_frag, and document
the -EFAULT case.

Found by the Sashiko AI review of v2 of the series that made the
change.

Fixes: 433380f5ab8f ("net: skbuff: don't BUG() on a missing head_frag in skb_zerocopy()")
Link: https://lore.kernel.org/all/179173804997.434549.4450793967361922984@kernel.org/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 3b2a3747f009..735dd25213bb 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4014,8 +4014,9 @@ EXPORT_SYMBOL_GPL(skb_zerocopy_headlen);
  *	Return value:
  *	0: everything is OK
  *	-ENOMEM: couldn't orphan frags of @from due to lack of memory
- *	-EFAULT: skb_copy_bits() found some problem with skb geometry, or readable head
- *      payload would be mixed with unreadable frags.
+ *	-EFAULT: skb_copy_bits() found some problem with skb geometry, @from has
+ *	no head_frag and @hlen is 0 while @len doesn't fit in @to's tailroom,
+ *	or readable head payload would be mixed with unreadable frags.
  */
 int
 skb_zerocopy(struct sk_buff *to, struct sk_buff *from, int len, int hlen)
@@ -4026,15 +4027,18 @@ skb_zerocopy(struct sk_buff *to, struct sk_buff *from, int len, int hlen)
 	struct page *page;
 	unsigned int offset;
 
+	/* dont bother with small payloads */
+	if (len <= skb_tailroom(to))
+		return skb_copy_bits(from, 0, skb_put(to, len), len);
+
+	/* Without a head_frag the head can't be referenced as a page, so the
+	 * caller has to ask for it to be copied.
+	 */
 	if (unlikely(!from->head_frag && !hlen)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
 		return -EFAULT;
 	}
 
-	/* dont bother with small payloads */
-	if (len <= skb_tailroom(to))
-		return skb_copy_bits(from, 0, skb_put(to, len), len);
-
 	if (hlen) {
 		ret = skb_copy_bits(from, 0, skb_put(to, hlen), hlen);
 		if (unlikely(ret))

-- 
2.55.0


