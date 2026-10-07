Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6C8CA5FFC
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 18:16:58 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442678.1660272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWCA-0001Vs-Jw; Wed, 07 Oct 2026 18:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442678.1660272; Wed, 07 Oct 2026 18:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEWCA-0001VZ-Fe; Wed, 07 Oct 2026 18:16:50 +0000
Received: by outflank-mailman (input) for mailman id 1442678;
 Wed, 07 Oct 2026 18:16:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xEWC8-0001Ds-H6
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 18:16:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xEWC7-00GBp9-T5
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 20:16:47 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c68-e002-0a2a0a5209dd-0a2a4504b38e-30
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:47 +0200
Received: from [209.85.160.178] (helo=mail-qt1-f178.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ac68c8e-b57f-0a2a45040019-d155a0b2e537-3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 20:16:47 +0200
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-5351748222cso34596061cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 11:16:47 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-53572103ae6sm26011521cf.15.2026.10.07.11.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 11:16:45 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1791397006; x=1792001806; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlPhbKKLwkJ8jfy0wR1jO0OPJAX2t4fwgDWWxi6hd3M=;
        b=gwJNpiayR9qjcJ8E7j/M60zn7pM1oyOWHoImbq6U2PIbEErFBmdJcLXof0itK35sD1
         7ihqZpUan2j8IzSYUzzQ/zC+cmjzaT3/mkitwWYOGb0JmQIBawf0zJiLmdSZpOfM962b
         XP533ZrdZOk/guKz3PP7Y4MW2tFxaR2cFgk/9NAvv9ego6ibKqsXh2kfAvyQag9SG0D8
         4rXWyONtj+o8UJW9Byv3uDH4kcpJdAm/EYBTQ1UTHTbxBuQXKkGyT+x6ECQ4HsvhHCJK
         LR+D1lDbCFgh0OAX+HPZr1sA4OzDOoz7uObvG2lrVjr9SKvbk4gEwpBlDde1VhM1i3NS
         YpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791397006; x=1792001806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HlPhbKKLwkJ8jfy0wR1jO0OPJAX2t4fwgDWWxi6hd3M=;
        b=GIh80iU9dXxb2Mp/QsRhFB+slkSCsp/HJLxpjV9Q8ah/3WjU/L6WPGRiUTv873IMUA
         1Zl+piMmQNZ3AIhI9GF+NyMsJFRO5zdbrSMfTmdzDbbCtMqfH5czdagv8FlVBA7asI4j
         TiOYAT9l9hY+DHkITcCMv+14F1blhfj5AaJeckt/dwpTfaLTNOpJs/EKCsazFAfciiSr
         4xGRle9p2M2+riVT/Kp3D0q1tKau7YXrPLpXZg8eOtISJZ8pFYA6dERFhdMHLd8/gNTv
         kOQxQUAxIUuXHSIyOBIZsiXskslDLQQPlnAYnw4ZBXL6I7lUUvnkr2nQSTOs7eWvRqeZ
         lQAA==
X-Forwarded-Encrypted: i=1; AKwUvByO6HkiIpGORS+3BwmYDJ02R6+uAWnCr7JujcrkgOHGJiFUDDrgn1dHo62Vvq4Si7aYtZXUIkD/u6g=@lists.xenproject.org
X-Gm-Message-State: AFuF++l7DSEwGyf52oercrJ8eNBf+VcwzmhSRSN2YkUqsqsJP1hg313s
	KZeGpI5Epme/UhjeybDvU8USvGVQbaoEfvB356kD11Y1eX6IKJwiaChYv3fWNoehTYd1OYeznQ1
	uNt84gr0jtA==
X-Gm-Gg: AYBFou3C7SZfr7KNWlHBulK0BEj4w/wlCgYyq/ElCiRawuOGtq2JA0L1MmgLy/5caKQ
	BnLxutT/6wmqMG1JnkRS4CJxCGFeVZolHgK8pY/HFQcVj5u1UC0hGEjWxI5yOMWi0I671Kq4P9Y
	YlImVNWZ4m88ql4y1A9A9MwQZQSzIXSKIkoWQXGJ1WpPtJ/h0DjwgR1IQj508gA1Q9Ryb/Vn2Qe
	zaEP/00aYzwcxKn79hgmSVYAcy2ayLZ1Oya//0IZsXhVZu6z3R9+YVCC5imTKhPDt6aNVPRrCF3
	5JIP+aZNGVlWPKNeGGIgM1WRqmgDeiwUxDgPc089IBV3htm6TtaN+qUb9dVeJi+9p5VUC37NAOW
	fi/NDTq13o0sZ49ypuhAnsUE2bQ7T2qF8JW1Denq4M/3QH2ICZw8ydN09QIghRjZ4V8/G759KCs
	J/8lgiawFXLWJNoU7j9IJb9xEqnQr0Y1hl8F5zHn3YYEIzPftK83w+Qxv4KjQqHNICSsisKcxlY
	UECuzhT9D81avM=
X-Received: by 2002:a05:622a:4106:b0:533:3d48:37f0 with SMTP id d75a77b69052e-53575555c86mr50817771cf.47.1791397006325;
        Wed, 07 Oct 2026 11:16:46 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Wed, 07 Oct 2026 18:16:20 +0000
Subject: [PATCH net-next 7/9] netxen: use pskb_may_pull() to pull excess TX
 frags into the head
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-b4-pskb-pull-tail-drivers-v1-7-9512b0fb977b@toxicpanda.com>
References: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
In-Reply-To: <20261007-b4-pskb-pull-tail-drivers-v1-0-9512b0fb977b@toxicpanda.com>
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Manish Chopra <manishc@marvell.com>, Rahul Verma <rahulv@marvell.com>, 
 GR-Linux-NIC-Dev@marvell.com, Shahed Shaikh <shshaikh@marvell.com>, 
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 xen-devel@lists.xenproject.org, intel-wired-lan@lists.osuosl.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1791396985; l=1110;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=McO8YjXlypOeoX4QkYeNrhdO3XuQh8G3BcccmslsJYQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEER6Cf6YiSeQas1SDvrXyD48BT2JMKt5v+EgNKlM2X9W7DYLscC2uLR/v/alcS1X9KdG7G/jh6
 TE0kjRM5PRAc=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-ebf023/1791397007-512DCB50-5877B80D/0/0
X-purgate-type: clean
X-purgate-size: 1112

netxen_nic_xmit_frame() pulls the frags that don't fit in a TX
descriptor into the head with __pskb_pull_tail().  It already checks
the result.  Switch to pskb_may_pull(), which takes the length the head
should end up with and checks it against the skb, so this driver no
longer calls __pskb_pull_tail() directly.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
index 67d9bf69f8f2..202deb64ddef 100644
--- a/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
+++ b/drivers/net/ethernet/qlogic/netxen/netxen_nic_main.c
@@ -2045,7 +2045,7 @@ netxen_nic_xmit_frame(struct sk_buff *skb, struct net_device *netdev)
 			delta += skb_frag_size(frag);
 		}
 
-		if (!__pskb_pull_tail(skb, delta))
+		if (!pskb_may_pull(skb, skb_headlen(skb) + delta))
 			goto drop_packet;
 
 		frag_count = 1 + skb_shinfo(skb)->nr_frags;

-- 
2.55.0


