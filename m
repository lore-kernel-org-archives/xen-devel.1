Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371EFCCF2E8
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 13:51:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454400.1668022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm1-0001CF-Ou; Mon, 19 Oct 2026 13:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454400.1668022; Mon, 19 Oct 2026 13:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xInm1-0001Bw-KY; Mon, 19 Oct 2026 13:51:33 +0000
Received: by outflank-mailman (input) for mailman id 1454400;
 Mon, 19 Oct 2026 13:51:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xInm0-0000xs-70
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 13:51:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xInlz-00Eeji-JC
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:51:31 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad6205c-2eae-0a2a0a5409dd-0a2a45019992-14
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:31 +0200
Received: from [209.85.160.173] (helo=mail-qt1-f173.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6ad62062-5984-0a2a45010019-d155a0ada50f-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 15:51:31 +0200
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-5351d76e1baso27243231cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 06:51:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.249])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5367c3a016asm8422981cf.25.2026.10.19.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 06:51:28 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792417889; x=1793022689; darn=lists.xenproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NueD3KcSYkb8JdZSOJlKL8CiOB7BO395X3cXr1iZapo=;
        b=EVqfCMiXD1sTuugn6xQ4dcs9RsIkXJ3Gn9XIvA31AXkjEoyJu/rxk33oP78JkA1xok
         E/CoWh+06LF8BjNhw3fM5Ap1aGYdcV/Eq4tBaXRvcTufzKYMRuPrwZU6zBW9ee65hRGf
         8kfT3gpqi9ChRFAh387WXtktn/Q3ueS1Ji1wISERG8F6A1CPEgx2auG4Fsk9PVm61v52
         GDP61YlZcB6vEnjDb9/nXd5y1Apy09xPr9dhUlZKXugaJUDOZKAKNFlKtmTUrvHQKMsW
         QPX8cGJfZkiBJVbWNIBrSDh47/dX/z12beXRX4QC2LKCJ8XvzyRtG1ySSjAoI+nKqK6T
         q83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417889; x=1793022689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NueD3KcSYkb8JdZSOJlKL8CiOB7BO395X3cXr1iZapo=;
        b=tgISfSOvgLVGtROqAjxXW43F1YL/OFV26hbSq8t5rluqyNKe7hBhuv2T3F1Mnx0rMA
         2yGHADPMRs3ZrjikFf5TbuzFpiU3o29sR291sCx0sdH7bKFIEB5s8TXpwwYK8WeHS+Qy
         vO8brAcnXwjVZEO4glK/sBN/dctXJ4XZ/lryWBLIUHTrfLni2vnMgqDvCzbdR2kh8UhW
         PtFtT3smNx+FeM+zdzB7c6cEK0RBMss596bJND8/H0Jfs9/+eMxLUXSxpLZmKDO8r95X
         +fF5+ylR66GdZz99V40ayzi4l8O2O1hDLofMebnnWe9ms6lHPoKaZx8oI8BW5O4AYAQO
         bagQ==
X-Forwarded-Encrypted: i=1; AKwUvByJOriKkpZbxWgZLvfcxy1d1Fhb/KO/WK89OcfhjzEPtMD7kkBPYgL71WnzGrrjN9qdxb6vVewr4Rs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKLA1/VQQX/NuCcZEs39jCp54PizJioCn9eqDLHY0zk7X+v/GPy
	pL/Bjv1Xt2eQ+QXab17XvdqIhkn8nfRSRIUviDWYqVD8uH1jZNbBsirsLwXKaA64Lsw=
X-Gm-Gg: AYBFou0sjRxu1Wv/mFBjsPbWe4+56bAwsVbgoVJKl/6aQ8ddxvskG3qXkbtPciU1G3j
	JyyVw+iWxod4e1vTn+X84R5Ii+7nI+Ue3wfTLkF9n2oAkv1nGJh2q4rdC+h8Oxq8Ua850BtfVdP
	4fpeJyEfYK3yl4itkIsL+0uswAs5xjYd06joHvUhCzg+xFXjTwYDyvMwGZ5QbceyyMDkYyxWATN
	KZmhJPy7ZJDUJZfv/7cIQ0vnUo32hf6umPkK52ha/NYSKhe2DA0JkHCXuZAJ6C/JiYisSeS5PIb
	9aPWz/eqz4yLDVALnVsdlt6NFLzeOZblXXdZ8GMEkvcOlCie6iF1iJmC7rFVLv/9rwPRCY9qHnD
	H7GB+WZYl+IRSsV7Oum2HDhGqxE+G3hHhhyeALvlzTXKJCorvdjySqI8L2fCUuwPn6Atzcz60fF
	Lh8Xi9d/O9gshW7jehulcX1INOgFP6GqaRMfkLJnMnwYHGGVfM15bxp3gz4iWw3rZ5OADcWtZ9y
	rwg9q7GSYl7npQ=
X-Received: by 2002:a05:622a:120f:b0:535:1d5b:a7fa with SMTP id d75a77b69052e-53645fcfd95mr105600221cf.14.1792417889532;
        Mon, 19 Oct 2026 06:51:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 19 Oct 2026 13:50:44 +0000
Subject: [PATCH net-next 10/15] net: skbuff: reject a negative length in
 skb_copy_and_csum_bits()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-b4-skbuff-bug-on-followups-v1-10-41dbef50b9f7@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1792417849; l=2599;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=II/CP7Oe6pPmnThcZPqfbajOFeQVtnEAdIjZymwWmTI=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QLT77d+wO2aZJcnSaM7dE9IczO8S8pXOJ39O2d4Dqx9woYqiJPcR/OP7dZYvy9TOeJvXuBMsRjF
 HbZ69mG6gdAs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA
X-purgate-ID: tlsNG-d62444/1792417891-1DC79757-C005D083/0/0
X-purgate-type: clean
X-purgate-size: 2601

Commit 417261779eab ("net: skbuff: don't BUG() on leftover length in
skb_copy_and_csum_bits()") guards its zero-fill against a negative @len
from a broken caller, but such a @len never gets that far.  The head,
frag and frag_list copies all clamp their length to @len, so a negative
one has already turned into a huge copy, or an endless frag walk, by
then.

Reject a negative @len on entry with -EINVAL, with a
DEBUG_NET_WARN_ON_ONCE() for debug kernels, and drop the guard on the
zero-fill that can no longer be reached with one.  Every caller already
handles an error from skb_copy_and_csum_bits().

Found by the Sashiko AI review of v2 of the series that made the
change.

Fixes: 417261779eab ("net: skbuff: don't BUG() on leftover length in skb_copy_and_csum_bits()")
Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 net/core/skbuff.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 782a6bacd568..56cec58bccb7 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -3678,9 +3678,10 @@ EXPORT_SYMBOL(skb_checksum);
  *	@len: number of bytes to copy
  *	@csump: where to store the checksum of the copied bytes
  *
- *	Return: 0 on success, or -EFAULT if @skb has unreadable frags or runs
- *	out before @len does.  On failure *@csump is not set and the part of
- *	@to that couldn't be filled is zeroed.
+ *	Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if @skb
+ *	has unreadable frags or runs out before @len does.  On failure *@csump
+ *	is not set, and on -EFAULT the part of @to that couldn't be filled is
+ *	zeroed.
  */
 int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 			   u8 *to, int len, __wsum *csump)
@@ -3692,6 +3693,14 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 	__wsum csum = 0;
 	int err;
 
+	/* Everything below clamps copies to @len, so a negative one would
+	 * turn into a huge copy.
+	 */
+	if (unlikely(len < 0)) {
+		DEBUG_NET_WARN_ON_ONCE(1);
+		return -EINVAL;
+	}
+
 	/* Copy header. */
 	if (copy > 0) {
 		if (copy > len)
@@ -3777,8 +3786,7 @@ int skb_copy_and_csum_bits(const struct sk_buff *skb, int offset,
 	if (unlikely(len)) {
 		DEBUG_NET_WARN_ON_ONCE(1);
 		/* Don't hand the caller a buffer with stale bytes in it. */
-		if (len > 0)
-			memset(to, 0, len);
+		memset(to, 0, len);
 		return -EFAULT;
 	}
 out:

-- 
2.55.0


