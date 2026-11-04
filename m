Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23588609693A
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=eAh3+POK
Received: from list by lists.xenproject.org with outflank-mailman.1472764.1680654 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhts-0004WF-9Z; Wed, 04 Nov 2026 20:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472764.1680654; Wed, 04 Nov 2026 20:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtr-0004Ux-RM; Wed, 04 Nov 2026 20:48:03 +0000
Received: by outflank-mailman (input) for mailman id 1472764;
 Wed, 04 Nov 2026 20:48:02 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtq-0004Fh-JS
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtp-000QZ3-W3
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:02 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a01-8faa-0a2a0a5109dd-0a2a4501da4a-2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:01 +0100
Received: from [209.85.222.172] (helo=mail-qk1-f172.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a00-5984-0a2a45010019-d155deacb8de-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:01 +0100
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-93f3c89594cso103162685a.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:01 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.244])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91e896f09e3sm18368646d6.25.2026.11.04.12.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:47:59 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825280; x=1794430080; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=buSYjS3GdLDfaKyeptPicEQ91X+3t3GOSNONVwKle3Y=;
        b=eAh3+POKqMbgGG9K6tJUxKyNBKudRiMj2B6eaFazBfD/f1XRoqb03wlFd+ic2dmVfP
         FGgA/iKfGmClQ7haNQTpDQUWq7AwVcI92GJY2PZ3C4K3qxh0GScPf3J5Ey6psUqhfnju
         WgMk1ZUND/yHXn99gufQgMr4RL66fjs2fC2Si+7aVXiLzCX8bzzUkAo+Mx2R3bslUnjj
         TpGZm3xmPTCaVysTLTuRur5egmN1YQAk6tuakt9ZCwsBGB7rL7AHURJX/qix0tjCXd4D
         ASbFtOWMUG9GmIM+aocTdX3c32O/x4HmyYC3NylbAhbBdgKZJ5kG2T89SR0UOXbgrNyI
         n6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825280; x=1794430080;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=buSYjS3GdLDfaKyeptPicEQ91X+3t3GOSNONVwKle3Y=;
        b=L9Nm0+tNK2jvNGGR8oM8lXf1QIvPmPf6gscpk/z0e90AIo0JB6fNesw4mYRT5UvqwA
         slkOmS//jTfe5C1+M3p0gBOAYpOX6TZnxxsVSgAgfxtQxUUXMzaV5wCyz1cdOdnaU50T
         CCQW8+nn8MsJZOi9Hy4qIyexNNgZxDFvLe/qXC9Kq2TJqvpQ9F+gd587E3wiCPcopZc8
         vclj7Q+fh9sldMZW1CBcMBM5kDQ4s9YHeHF1k8KW/Se9qlEYYc3Z2WNLAVTu3Db6OEje
         s3r5rDePvvA1CBgLlnhUVxBF3gv81Jt9U66wbLF0+2OmC98MXX+fEm03y6ZwF5mGbaan
         RG2A==
X-Forwarded-Encrypted: i=1; AKwUvBwW9vEwQ5BFvcH2FXnwiJVurMBFe7sEJAt6L4GY4eLAsvQX6jRCaPhBgwH+Mu2FdwEh3C+F4JkwVVY=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+Bh5u9CTwChiJxy/Celeo72XbVbhRsREfhpUEAVowd/GgOsSdp
	RZjZpbWSgMWNtGVkdHEpB8bXd5NY+RSkqmtsa+wAuAUn5KpIQbikLny4DnsP7wF2miQ=
X-Gm-Gg: AYBFou0uYqqjahFySZCdfF270ORTFWSgiLtQ7P9jIL2CvVPbb0EFLrRkINxDSpmoDfz
	ffygUxOtH8YwpIblwiKhaojvvxFn5w3aYg/lcunJnhsiulJm03DaqXVyKMJaQZivSYmSWhGa64q
	EUnc9h++eIvIccLs4Jpo20yOQj1haf+YzhdtEUKY76HTovvbfJYIPnyZbXyt+VOUYQFV+ChZDGf
	e4r6m+ViaNjqs5AdQijtyzEB8dzNGqQi7Iqr550mXZdHlNVfeXmRqhc24FBXLmp44WUf2hzaBZq
	PhFtCGG5qR+5z5qSUAa2+TDZHN3TRcegL0vhAHJ4mchPwMctv/HXdNnAgE9BsQtUpmNfpSorYRu
	ZkfQRlc7qrE1z2J40xki7EFgtnnarXzSGZ8QNnhOuO0zAjjT9q2c8qmp3emL3UEfN8pyW4TjpXA
	WLvIPohqzmKtm1MqLFv+ooJoIbkxchb/+GT48Ylpe5xQg+8kKx7Rcan81eMfEVXz6VR06hoWuLV
	E/sviC1Pr68/y4DoADjA5E30de67gMOQRPDMMjEaa+mC22h+qqDNuN1oIbZ1+xrZ2ua2Y2G8sQf
	JDbC+rngy4mcb0bVm/u11XipVSWljsiSzgNcNYU1A0NlNg==
X-Received: by 2002:a05:620a:3181:b0:944:907:8f64 with SMTP id af79cd13be357-9442174703bmr2898691085a.67.1793825280424;
        Wed, 04 Nov 2026 12:48:00 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:21 +0000
Subject: [PATCH net-next v4 09/15] net: skbuff: reject data_len > len in
 copy_and_csum_dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-9-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=1669;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=3g9gWyq3LNSnz8GQIQ6Nd2kWG1X8iSKYPw0MOlaABeg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKwOCX5WX+o2z0CP94Bi0sfWoF2Js1lcQMZ0CTKZpHu/4B9z0ISKOPPwpZOGdR/7NPil22GR5Na
 aLXWG/bs0rA4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1793825281-BC75B757-09DC7915/0/0
X-purgate-type: clean
X-purgate-size: 1671
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

skb_headlen() is len - data_len in unsigned arithmetic, so it underflows
to about 4GB for an skb whose data_len is bigger than its len.
skb_copy_and_csum_dev() compares the checksum start against
skb_headlen(), so its checks don't catch such an skb:

 - Without CHECKSUM_PARTIAL the checksum start is skb_headlen() itself.
   On 64-bit the 4GB value becomes the length of the linear copy.
 - With CHECKSUM_PARTIAL any checksum start below len passes, whatever
   the linear area really holds.

The BUG_ON() that commit 56453199d28f ("net: skbuff: don't BUG() on a
bad csum_start in skb_copy_and_csum_dev()") replaced compared against
the same value, so this isn't new.  No path is known to build such an
skb.

Check for data_len > len before anything uses skb_headlen(), and zero
the frame.

Link: https://lore.kernel.org/all/179273112823.3134.12241973533522574538@kernel.org/
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 2c246f563555..b017c9f861fe 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -4165,6 +4165,15 @@ void skb_copy_and_csum_dev(const struct sk_buff *skb, u8 *to)
 	__wsum csum;
 	long csstart;
 
+	/* skb_headlen() underflows if data_len is bigger than len, and then
+	 * the checks below don't bound the copy from the linear area.
+	 */
+	if (unlikely(skb->data_len > skb->len)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		memset(to, 0, skb->len);
+		return;
+	}
+
 	if (skb->ip_summed == CHECKSUM_PARTIAL)
 		csstart = skb_checksum_start_offset(skb);
 	else

-- 
2.55.0


