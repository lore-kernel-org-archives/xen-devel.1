Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49F960B90B0
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ln+AOLUM
Received: from list by lists.xenproject.org with outflank-mailman.1472762.1680639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtq-0004Be-97; Wed, 04 Nov 2026 20:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472762.1680639; Wed, 04 Nov 2026 20:48:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtq-0004Ax-0T; Wed, 04 Nov 2026 20:48:02 +0000
Received: by outflank-mailman (input) for mailman id 1472762;
 Wed, 04 Nov 2026 20:48:00 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhto-0003lk-Hi
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtn-00DUt0-Ud
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:47:59 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99fc-2eae-0a2a0a5409dd-0a2a4505a2d4-4
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:59 +0100
Received: from [209.85.219.47] (helo=mail-qv1-f47.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99fe-4cb1-0a2a45050019-d155db2fa983-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:47:59 +0100
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-91c7a706b1fso28851516d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:47:59 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e7e008399sm28523796d6.23.2026.11.04.12.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:57 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825278; x=1794430078; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umuQbJBZ+T+/ul5GPlAUT8hdRrJpMBpkwqdC6QE4K5Q=;
        b=ln+AOLUMDhKMIQcKf8z/wVpD4VzPzaL1ahG6thz/Q8BfPcZ7ZBedH1+emN9Ebmos69
         h5+duzJn7gq++P78hdnyWPZQbk5NirC/O+f9rbMsvGzCFZ8L5eEh/+ctBbzPeAdfoWmu
         6qFCY0+VM1YGmsU2QIL/aexycsR4/sEMpKqcDWF31BHKeQIvJG5BAPc3dxrK4ucY8OLn
         ab5CIKFwVNc3WZK4Mvw8x2DRWojVwGcE+KDCAlCZFcnsLnqBhGk5PYF4rkHqIoSdckwq
         fFq5OEx1KDAKudEzucUMBcPrkrZGdgL3aVha+tGqB4hIcO3rF4YXb3yiYvZC7wn7IVmK
         4zBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825278; x=1794430078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umuQbJBZ+T+/ul5GPlAUT8hdRrJpMBpkwqdC6QE4K5Q=;
        b=rsiXCYeJCbTaFbHFA6IR9hiaCD7W1XBA1Thjl1llcX8csuUZdcasjuSp0/sDUq2IEn
         HU8ekVAaJY9qCpO4yo3mvHkQXgELRKjk1iX8Qwf+bM9wtqyI1Z7IlfF6spY7NTWf7Osa
         hJHmNy7C4dFk/4RdzvGIkI+azQmlOfviSSkM0SFweTFy5zVLNYuCfwQOJaUIhyACle7X
         RQz8eiaVBfzJFpa6OBUcbU7+Yfc4YUhcMCicgAhmUERPLLePjqYzPa7gduVY40r0pfpW
         Xvix+iaYOqUDBktPjF3UiFZnnktx2fmp1zTSExBfzj+qbdSsDft5jAveUFcXpeAOt5Na
         poyA==
X-Forwarded-Encrypted: i=1; AKwUvBzF/vXRnBfYCakMepYncDrtycuU71JS5/PZgTfHxMgZKHe/itiLAiztoSAmAlEO9lu2YMRQ235JLDU=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9wIleogyPatUKaimDV7oUeCU6+yZhkQo9rJCC3qw/fzBndqPtY
	i5YlfWklrqHHhr2oPUAW/n89xujVGZ/7yxXpQBKubBq0akKlhnTnezB61rISWFxtodc=
X-Gm-Gg: AYBFou32PA4lUcFXoacoFiflm6jjJrCupNZxCY5E2TIOiISeNTpPQJOt/jmqnMkhdL7
	u+7UqWHeWOflC2YhZhNOss/Yk32GjyOBtnbL1SFvcWzAyZ9uGiaTihulcibiocFoK9tY/TfKVR1
	gkrwIaK5zN1/+x1bGL4rSNkkRg5SdICNikww6geOCXS1L+ZRQHjqv9EweB12ChQb8MoA8PGhCyF
	RmLQyYEJwRfeaESH3XrfAw4YPyBZhGLB/yWHixI3YdhlFzoKPdnk97wHgtBgERUtJUC6bqAmAn6
	9Qu4ztKeYy0PwQAG1QQSp9UO2t1/lKe4TyhMR+Q3JJ5zzfEziPnpreJYM+ZNGx0KTPZ8tYPodSu
	2R8lHAL1CROOCiZ+88X8UcxO//yw/SzP+CbeKYvSR7LYK9eUdiZnF12rT3aVbBllYdJR4gmhg1n
	qxsf1vuKnD7lHC2+d7x/wrMc0nmX/QeaDMW7FlHnZfuteTOw9novKXkuCZIMD+sqs4hVcIWXoqj
	RB292xYTE8//MnkOHwakGCW7GSfz7zSI4S7IAM1DBlJR+a88x2riv+8krzE+rKiAFl6U6j4a8Kv
	AXFKGxovTwx0qPJ4i03X5yuVGotJqgGYTsCKkSEH+Lsgmg==
X-Received: by 2002:a05:6214:62b:b0:914:3120:b7c3 with SMTP id 6a1803df08f44-91e942fb275mr13978456d6.7.1793825278319;
        Wed, 04 Nov 2026 12:47:58 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:19 +0000
Subject: [PATCH net-next v4 07/15] net: skbuff: let skb_zerocopy() copy a
 short skb without head_frag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-7-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=3270;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=313gSpe/OEgGmNrXVMk6Bxzm48vCKWeKxx/RzkLjq2I=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QHgvwpS66JnChP5h4nxV7iE4T6sQFYhC59dUOgap4jvS9EDZJ7F4fJ80RgGphM7ipwgq23QtCp8
 fwTiLMJkDtAI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-c201ff/1793825279-24F1F2A1-ACB7C31F/0/0
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
index 96c8835a262b..fd4689cea94b 100644
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


