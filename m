Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70906606C5A6
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 20:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=qkbNCB/V
Received: from list by lists.xenproject.org with outflank-mailman.1472775.1680686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtx-0005br-La; Wed, 04 Nov 2026 20:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1472775.1680686; Wed, 04 Nov 2026 20:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOhtx-0005a9-21; Wed, 04 Nov 2026 20:48:09 +0000
Received: by outflank-mailman (input) for mailman id 1472775;
 Wed, 04 Nov 2026 20:48:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOhtv-0005FE-Jk
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 20:48:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOhtv-00FYc5-0I
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 21:48:07 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb99e8-bab6-0a2a0a5309dd-0a2a450c9a30-38
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:06 +0100
Received: from [209.85.160.169] (helo=mail-qt1-f169.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aeb9a06-f479-0a2a450c0019-d155a0a9d174-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 21:48:06 +0100
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-5363316fa0cso12558791cf.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 12:48:06 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-54b10c4dcddsm33675341cf.20.2026.11.04.12.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2026 12:48:04 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793825285; x=1794430085; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NVn21fMcy6xP3x95gJReWbvgO5dQmcWPIIyj1sSFlXQ=;
        b=qkbNCB/VjwjgzW2BZrXb7Ljh6ZRisp9nLEmgAHchvKVC53C/TdHcvKF80Cx8dgUBk9
         Bkw1pimbXpQvo+E8f5YrOJMHhQtED4b8BtjaTGg6TwudfZue/FRANTQoIhUXGQi0ta/x
         FzoGAjRIX6rLXtdMJSMd9wZBHEZ14kJjGijeuOqZ1KQVG9I8bYAyXJvU7eoTP8dOKYM8
         t2jYfBm1QVFu8qmQ5qVYErtjWzGCSobzM7zwn4Qo8j9KUlFm+5rP1DpynlMYNgA7e3OG
         1hG3kjKYpJI8u6jQ4uLf4pMP9bDDWiYwoI7yUSb4mJJXH25EwKAelj5qHMxNr0vR7Kjf
         4N6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793825285; x=1794430085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NVn21fMcy6xP3x95gJReWbvgO5dQmcWPIIyj1sSFlXQ=;
        b=I4p6lLGKAne+4PYgqWiGAV4LN7C9YimOT1mI49THpX8jP6nvryKhs2/SZLiPqIy917
         hv4hY0Q0xIAeEu1d03XfFYdwQpJExFKGvNzbxqGlZt/QitWrKFGdN+ATM5QR+r4brDcX
         r3t3J9v5pMUeFD6K1Dx9hwRylP7xnGYAHdpDpeh2/1Pxlu3lIonG1pa/KDlOGR5ed0Jc
         61Dksk+dMlL5EpdCMG6bog9YDd4Nbo7CYpnorMRpbRJw6OJwH8xyS3x8IqRTbx0DK8ny
         PeeFSHyoiNsozlhme0RxYhMk2MHJTA/Ob41DfioW6JH9buajKuJrWKbygMaj44M/b4/P
         2OXg==
X-Forwarded-Encrypted: i=1; AKwUvBxuR5PgjXLbjaYbIsOjLh4knnaTSurjBmkSsrOx+V8Ic8UfwFLCPAN1uM8aWyPo2q9lRK4VQN4OCNk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8niGa86vJAzZTHm0D6BrYr4ZIWRrK3c7jTYu0Sc4vhOPsznTsZ
	zQL6fF0xO4J/67MTgHkvlw6gcOqySKq7QW3t2eA8QCeEL+TXbQWtm8/0p4xizDTCvlo=
X-Gm-Gg: AYBFou0yjXXAl65rmKUAmkmUnRnnVvUWwpypqbUr9fYSIlIEKfd0mcmC9auqSvHSY+b
	/X1Ny7IhFI1zJ4/lJmxJURN4tshnSAAolYahAJ2P0+ATQfV4RyG7paSnK4fRNyRn/qR5vSgtkyM
	3m+VsSs2k70YrJuGj6o6DtrZVfLaO8cYjGgtkeAvAcf4warbQuNkI4nQ9csNxaF0v9oKgfX4vKd
	3KVQEFxLuE4e3zMXs9ILsGaMwIO69wm7w5SmK8Yb/K08dS5kXBAsExOETjLTDb+N/ziuCXb1ZI8
	Tnj7cGx8SxYP8kRmImeu3zqAWG3Oyu5gi6T5f5jX3HCvLRX/uT3LJ9xpLXtoO3goMQciZwD3iM1
	luV4IyJwpV8m7vyikWzDGgTh0dYqptXMkmpHExonn2GRJ4buICJG/zVxSxWOEpLn9utyqQ7Y/VV
	Ci/oRdVW4fCUO1ac0/0i/ofJDOkLWnAqMx5zPh5nYfVEtTV6h33Vldb5hjzH6WD45Ngvexh2otm
	OUOnkfBdyZpHCY8EI5POiWdnigiykHxxCZBCekjXcV0DMRZpa+KuOin+5jZXJLdUVMYPavxY3Bd
	l08ucLgw7kyxQfsC1WIqBSTIFRVmqySHdFIvVdZyJKc3Mg==
X-Received: by 2002:a05:622a:5919:b0:536:5ee8:cca9 with SMTP id d75a77b69052e-542b6780e91mr301127981cf.12.1793825285045;
        Wed, 04 Nov 2026 12:48:05 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 04 Nov 2026 20:47:25 +0000
Subject: [PATCH net-next v4 13/15] xen-netfront: don't BUG() when
 skb_copy_bits() fails in bounce_skb()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-b4-skbuff-bug-on-followups-v4-13-b7ffeb364f5d@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793825269; l=1259;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=zzsYthMv8IPVXjBtHviI0y09ueLAi8MeGKpMdcW0nP0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QPdw7QRLxn5IZHZCHDO5ZCwaqrEZRXxs42UXzWDr7r7WRHwPZva73HxZD3G3reol2INnyXLXU4W
 ViF0TlWuOfAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d25034/1793825286-5290EA5B-C37E0449/0/0
X-purgate-type: clean
X-purgate-size: 1261
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

bounce_skb() is an open-coded skb_copy() into a page-aligned buffer, and
it has the same BUG_ON(skb_copy_bits()).  skb_copy_bits() fails when the
skb's lengths don't add up or its frags are unreadable.

bounce_skb() already frees the new skb and returns NULL when the
allocation comes back misaligned, and xennet_start_xmit() drops the
packet in that case.  Take the same path, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels.

Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/xen-netfront.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
index fdcb91042f29..17811d81937c 100644
--- a/drivers/net/xen-netfront.c
+++ b/drivers/net/xen-netfront.c
@@ -695,7 +695,12 @@ static struct sk_buff *bounce_skb(const struct sk_buff *skb)
 	/* Set the tail pointer and length */
 	skb_put(n, skb->len);
 
-	BUG_ON(skb_copy_bits(skb, -headerlen, n->head, headerlen + skb->len));
+	if (unlikely(skb_copy_bits(skb, -headerlen, n->head,
+				   headerlen + skb->len))) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		kfree_skb(n);
+		return NULL;
+	}
 
 	skb_copy_header(n, skb);
 	return n;

-- 
2.55.0


