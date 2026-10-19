Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C98CCF2DE
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454389.1667995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlt-0008UR-Sn; Mon, 19 Oct 2026 13:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454389.1667995; Mon, 19 Oct 2026 13:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInlt-0008UH-OO; Mon, 19 Oct 2026 13:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1454389;
 Mon, 19 Oct 2026 13:51:25 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInlt-0008S1-13
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInls-00BvIM-71
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:24 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6204a-e002-0a2a0a5209dd-0a2a450bbf54-38
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:24 +0200
Received: from [209.85.219.42] (helo=mail-qv1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6205a-b7e8-0a2a450b0019-d155db2ac8ac-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:23 +0200
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-91b52ba422cso27720986d6.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:23 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bd276eec4sm88112796d6.2.2026.10.19.06.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:19 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417882; x=1793022682; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbXvQLGgZpsimSrfs+W8d8Jbr4mc/fISMihOBkAlu6E=;
        b=gNh0THi6i4S63sSBnXbJ+WIRxqTSmav0JyG7nia4l+GpvNsMDERIkJ4arHXIep1kG0
         5ktnBvG4whYaAfhoUXUWN7W+5XiHU6WbFMqwj1q5gBMXAth6/43VUgA4CP3t/39EBZt9
         VVtvrLVxOkrXhDeBvFIIB2sTsmg3ugnUo/6YSJwvr8kHI/ywQLUFihkfPXo6uHMazAj5
         ENo5XIvGpupr5CYfyO0og2+/ls5ZpkC6JNkmqSPk12qi1elfmQY54lM039dJDijGdh8O
         k4LGEIF5433NjfEGMb7WfP0SrLgwMHrb67u5g7U2OXHjoNV1EzefnTOAwicm1gpy3iCF
         UpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417882; x=1793022682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YbXvQLGgZpsimSrfs+W8d8Jbr4mc/fISMihOBkAlu6E=;
        b=TNFdd1Vlgx9657eBxpaUx1do82jd68x22jSv0EWvhL/uxLqaBa4jSuhRaN2K6vDTWU
         2NhPM70ClFs7YjeiJNijHPvQ+eTEYAf/R6M2p+fnNwfy6sTY8sjq7OQdsUQAdmOLn8Se
         eAXHHVL5J4+VbVu/MTP3QTS7xm0ie4VOdw9jcoOIBmwLvi6AMfq4Q53l2V/+/z1x6m0X
         8jRGbEEsDlrgPBZOZwyaASlS+kGdYyLc6suukvFD8egH/x8lTun6GuBHshyg8uq7CydF
         Nt4uomV5jbeO+6QzpeD+W0+9KPdsMsCuuhU58rXXpj6tpsTjlPlEHjCI30YI/pgPd/X6
         cMjw==
X-Forwarded-Encrypted: i=1; AKwUvBzrpLonaSEbpb09AgWM+T+iowp3p8Bl5IoZRJxwYlY/G0q9lHw4hBO4nctqxCMx+8txn7p0KAFFtOY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL7vN7A/D9kSUBCi9Y2+OugxbZlNT4oUeUS/MmiPvnw527Lb4yi
	eJTMrtv4dFngYbeOdAbR3cGffiFe3vgbMVyFJB0ecqygNFDTSv2c7LabLPgM8HvFqHY=
X-Gm-Gg: AYBFou1pZnDqVcnMyjhtaVpKenvJyNjsP0bno4NW82kXSoIsgM5BGr4X7AHcbnXF6ia
	NKJii0DqnkM+21MMYyqN01Ayfc8hLVac2b4h/RLXeh131ZOBnq1Ahc0d8DPGrUt0LvXTwETyGXB
	f+YIrcYFEo26x+43v+aDxyUQ0bjw2ZwrZ0GtAJujZLzj3OQE27ZiUaKOeTlS9+LkPDPue0Mytwj
	BhbB00dGMGnbhFPuX0Ue792C8SgSEyraZkTftZWmPk8TWZ+l+vMszJkisRSw5GbrCRIwi9GBDSR
	Y2Lo6faBBvE/cAUy06JXCRRI4U33r/UlDOEesky0a8v4R0WG0uAmoyM9MVYDLYcBYUd4hf3Rwbg
	/x8JraHNDHEb6ghpVUN4VWzDoBTQw0lO5bJ+hEiFfO0mAoJU0Fn03YlU95dvYfT915pqkwB1N6I
	cJ2FOAaJ2kGLp4zWasQjQo1Zs/9RhM/BsCQupozty0cyO8rxHB5ebx4/sCKbCDJMCRAaSUG4B4c
	X8iPMFLTbc9hds9QXo4J9vlzcjxdGEfPCNVtxuRabs93dXrfLoQa06p2dK25qVIFFEkkHLsEuov
	4QZ2iJrTdtwgAfYl0g==
X-Received: by 2002:a05:6214:29e1:b0:91b:5d39:e145 with SMTP id 6a1803df08f44-91bdf63bb40mr141562036d6.58.1792417880639;
        Mon, 19 Oct 2026 06:51:20 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:41 +0000
Subject: [PATCH net-next 07/15] net: skbuff: let skb_zerocopy() copy a
 short skb without head_frag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-7-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=3126;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=p1EJ3Mjc5nJGteUiFCelu7Pkg91i/fkjkkkh/ts8Tfs=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB3VQkhmVt4VPOky68kfBhcPE1aOMyFJILHR1dQhl/DSlceDdzD2F0Osxoak/AkI08GCT1eWZyg
 KcJIYQOtx0wY=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-42698a/1792417883-A88C99EA-F91AD503/0/0
X-purgate-type: clean
X-purgate-size: 3128

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


