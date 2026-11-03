Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAD1606A326
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=OwCpMaId
Received: from list by lists.xenproject.org with outflank-mailman.1468943.1677997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Go-0000WA-MA; Tue, 03 Nov 2026 02:29:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468943.1677997; Tue, 03 Nov 2026 02:29:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4Go-0000Vy-Gb; Tue, 03 Nov 2026 02:29:06 +0000
Received: by outflank-mailman (input) for mailman id 1468943;
 Tue, 03 Nov 2026 02:29:04 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xO4Gm-0000Ip-Sc
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:29:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4Gm-009OZN-9J
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:29:04 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946a8-bab6-0a2a0a5309dd-0a2a4506a9a4-20
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:04 +0100
Received: from [209.85.160.181] (helo=mail-qt1-f181.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ae946ef-195a-0a2a45060019-d155a0b5e9b2-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:29:04 +0100
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-537548b811aso30168381cf.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:29:03 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.253])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-549893ec3e3sm14050831cf.3.2026.11.02.18.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 18:29:02 -0800 (PST)
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
        d=toxicpanda.com; s=google; t=1793672943; x=1794277743; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMQaM+kfeGbudokxSYshH02k0TvoZ+jUfxqiHHa4FNU=;
        b=OwCpMaId3UzkGFGKA4XhO1paemYGX19iFiQRjzr+HDH3hpcrPnJB9gN/JBlAXXwNqe
         IvbQaEIvPRogAKn/eqCbt2apNFWuJl/+Xm8E+F6lBg5HgcZtEJi4QPidVwFTFyy9JKt1
         vgbh7TX+KSP/A5P6oeV0Qv4D2KOENphCLI2edI9wdGkH2M9biwsCJFq76HrWT3sB294h
         72bEAy6mDirXaKdpuj96WaHSWQObBHEkWSLY5dz+eoW7pjjh7CzSYumGK59kyJ+KS+F4
         1ub7rRgfyklNe0IQKcXsC4X4OHTue2+yKgq9svnUu6TdltE9l77nXWq+jYz8sJvIh45o
         WIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672943; x=1794277743;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMQaM+kfeGbudokxSYshH02k0TvoZ+jUfxqiHHa4FNU=;
        b=uTbxiYZ/sVC0ldD8i17AOvRWC0KfOdKnkD0l8qET4ButAu3A1eOBg/FCz+PNIbcfkI
         U4dWezteSl7YrvZBDCXYhn3wLNJLBUrWVZk/OLswX/HiUGZGtS32NtKbc1c9QZ6MYmL4
         zvqdPe6NcLEhG93PcQASOjB+t9MJydUhcW5k6+0l9alZ4XD3+JpBZiJTcfa4k/4GMdeh
         8CaaegUxry8/4NAFhouGtI4xwYLh/Nrgr3JGx8CFAYousnnZou2NYRpVLy1+Ts6hMLxS
         81sIU7OBmvNpZ1Zs05NPVNz3CiORmWGdm9Bd4REmw9nqshRqVncrZKIP0NBN+DhCSy9e
         lSyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZE2xZRuzotGLNKyMO4kCXiNRKKGR4foW2j4pO+9SOyLqotkxtLmsDIIMxTUrsceEsjKz17drbS/4=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+69ad975gbst9G7PO3c820hfRJdPFLMXCSH4WoL3AvP/vmtSmW
	ylx/mTXb4Jmq1UgK3+drdaE8o8H/VXLv0gFQSkNJQCfpIkUTGJ/3s1hU/xw8nJg82Pw=
X-Gm-Gg: AYBFou02v26BJmzrdpJ1XSBMW73oPTKX8ERphcaSNvHjtv5x/goRd8LTKdKsYUC9KcX
	2jGZBF2cACqjwZ7bGs18vHeYJitFmPqSaAYLfgsgR8YgLI/OtpYE/+J3NCMBu+2+nuP5frXeage
	2i3mve0iJAihmmaNyVgmHnBRBZfQt7gmwjKFWzXgoeYHkrXglaIgmZ+WDm2587Jca18f3l5GjqV
	gw/+9gOwgyDULB0Zd5IlpXpV2UveSxRK0V2a7Zy7ZswgvkEJ2B3O58b1Mj3ZLAvyoA8zE8gMX7M
	XjX3BGnXQUc4WsW4oV8gTO6U0ikRVQsFrZJrmOPMpMw6hBOE4IH8FO/IQEkhtbMOY77JyZM7ZgT
	sdIEmKyqdpdo5ZBajNCYWNPSIRfObLcTaI9asgN/A8Vk45Tyk+kbmMVEHepxuH5aeG6yPtgsUmX
	k6ZO4RRfH0YUAv+Un8kF5H3WDyp+0DLw+j6UVd5KYj76HW1RRIjsiz6aYt1dmtJUtDSuyLR98kF
	cQwpaW4y9XygyG+5hrGG+ryM/iyX/VSi80mn88DnAsltFevtF3E0DN+JLv7Nlc5753vZ8yLGEMk
	GbWVrtEftfskHVdtyW53qtIcT8zlMQr/YJS6VSO1yVuixyo=
X-Received: by 2002:a05:622a:1c17:b0:536:622d:6932 with SMTP id d75a77b69052e-542b62a4588mr193626811cf.23.1793672942811;
        Mon, 02 Nov 2026 18:29:02 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 02:28:35 +0000
Subject: [PATCH net-next v3 09/15] net: skbuff: reject data_len > len in
 copy_and_csum_dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-b4-skbuff-bug-on-followups-v3-9-54ad0ab57614@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793672923; l=1669;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=BXekQ+0ZZcw4R6M9C7rnaESTyK2ZJqIQSa++cyygjWo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNn8OCjsMCbSYh7N8mCbl9Otj5ltaFziZ7io28rIRlQmVoNauFULhcxK6cWv8CNZSqiLp0sSE2u
 sJ/9L7jVi1w4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-16d1c6/1793672944-F580D77B-D389F653/0/0
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
index e400990595f8..b74d8a6ef0f9 100644
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


