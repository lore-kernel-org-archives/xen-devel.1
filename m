Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8D2606A33B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 02:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k4b4lkwx
Received: from list by lists.xenproject.org with outflank-mailman.1471199.1679760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOR8E-0008Sa-DO; Wed, 04 Nov 2026 02:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471199.1679760; Wed, 04 Nov 2026 02:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOR8E-0008ST-8l; Wed, 04 Nov 2026 02:53:46 +0000
Received: by outflank-mailman (input) for mailman id 1471199;
 Wed, 04 Nov 2026 02:53:44 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xOR8C-0008SN-Nh
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 02:53:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOR8B-00ARY1-TB
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 03:53:43 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6aea9d74-2eae-0a2a0a5409dd-0a2a450bea06-46
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:53:43 +0100
Received: from [209.85.221.175] (helo=mail-vk1-f175.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6aea9e36-b7e8-0a2a450b0019-d155ddafb8ec-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 03:53:43 +0100
Received: by mail-vk1-f175.google.com with SMTP id
 71dfb90a1353d-5eadadf23e5so117822e0c.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:53:43 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com.
 [34.150.230.223]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5eca8d9fe6dsm681849e0c.9.2026.11.03.18.53.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 18:53:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793760822; x=1794365622; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pzzn/OZqyWunDAXh2LnA7PjhOwzn2ho40vKo9gOv0hI=;
        b=k4b4lkwx9e9izxVyut3JoMOfBKQkHFASxTwTAdj/PacYUIbgaco2qb6J+Q84Nxmw1x
         LRCPAlMj883EHgomw1LJZP9oqwrnOnR1ZNR5ZzfBdxUaU9A+2cPyKlg4UfIc8f2CfJQ5
         r2fvOVVPKHKFJkBJ8uJQi2SJKDiQB4UfA1VTNQp8PVGPZEc6Q+q1ffa+TK1RPM9wa2Zg
         7/kYa7/6Vyy/XsdJwWotEOFZL3yT0SrWZkicWZ2Aq6wxxHVTQ92Is2ljTXGuudGtHwzz
         1J2RV40jzsCY2F59N1/yei/rVD7kX5fUAd6sFFZPbgp/XfWAVrLPbWc7QfL/TqKaXTSG
         cDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793760822; x=1794365622;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pzzn/OZqyWunDAXh2LnA7PjhOwzn2ho40vKo9gOv0hI=;
        b=FLkiwDssFLBV8KDxVDlwhojGxIDFcU8qnof67GREJ1TnnXvd63XqiTupnn8i4WsGID
         pi+tNS/ZqRHreJqyqIyi3AUJZYLWnsIHkNHMpUXvrlIoVvn4fd2hzZGWapMAgTDa3JPH
         KVmg0uNo6yjFn88O5DKxBi5Z1Rfpth7ejStvjg4TM/drfXRfQchNOUBOtjUqS6yA+HXO
         +/1lVIXrK2/63x3+6geawuT8jpR9xUqhzckXt3+59daMUEB4QDaRJUlGCBEeAf9muRUx
         Z6MgbJsQeZqPydh7M5XDdTus4CyKkFwlQ/gOhSEYc6z04Gbcmx+cRWCKpUJ15kJfSGD2
         ameg==
X-Forwarded-Encrypted: i=1; AKwUvBx4xkiA49eYNb1k0CjDwaEIYB0soUn29HPCx+SfLnX+Tl/TaHruSJX/Qq3/ksOmrguy6bWyAEHyE/U=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8574qIcDFuN+u+tZMg0N2Gt4X9Nds06KGrBGY2WzNImFZFsavb
	uJeypFZwMAr6kRIfFCgRsfXsC0QxsOivHVrW7E+TqOjZ5LS/BtRbwg8+
X-Gm-Gg: AYBFou3jjVGSEUTpxBLIEMH4RpbkkoNNSVMWAlFTgnaDvQc9l0efm4eNdu5a1Hh+VsM
	bEeI/4SSWmbL0808iCEg9curlz6F2jYwdlq0nwVZ//Ztz0slPkDMFfo3woEfKOk5pCzxCxmdwI5
	v1ZukUb67QCWF/kfPe6FFppHQ/tAawRxRQiOcjI8CKCeOVZlLVF4tXkCWUopr0n4TbxeBZlbX5T
	H/TlSQPBpQjG8beWztKgASI0NqtCh/cUU5sJ5ALX8cW0nSfeIrPEQVfn+9J2jk6EOtqzkODIhau
	x3sje50lpPXO0078MZUh3vaskunYE8csF3aEoGK6eYiO3NxgATIEQVwWF7A5exmh5zMbNMjxMNA
	MCnoCBmwf5EpXkq4d2Y/xvRD2iPcM3HTaAJdxhJI9P5lH0QiMxyp+pct8HMya1/Iki+LW+102zY
	JykuEguQyIzpsUd/APllMrwWHGh8DKtsvpap4lXmcJnwXya8lXLFwpaTIwN3HnoqyXPIAj2bSN5
	seIitWTXblIQwD7kANKEVuZK1Y405/cMUanmP0rwtQNuz5BLDVTRc7DlPyzKTNeGNV29ksfLnTz
	msqxyvGEl73eGMHcNLW2REGwhv7pvH40w+AgRu2OGwZVfMQ7+isnLb4sq/T0BAWQRAFxBL4+2RN
	NPpJNUNjDDzlplkxcvzsKhZj2s76d6zEzHZ5KnkdsDxnhqkhMK8uBWg57j0AMVlVeu3CGgfP3
X-Received: by 2002:a05:6122:398b:b0:5ea:ddfd:3e99 with SMTP id 71dfb90a1353d-5ec68976e2amr6444630e0c.10.1793760822398;
        Tue, 03 Nov 2026 18:53:42 -0800 (PST)
Date: Tue, 03 Nov 2026 21:53:41 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Josef Bacik <josef@toxicpanda.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Juergen Gross <jgross@suse.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Fernando Fernandez Mancera <fmancera@suse.de>, 
 Mina Almasry <almasrymina@google.com>, 
 David Laight <david.laight.linux@gmail.com>, 
 netdev@vger.kernel.org, 
 xen-devel@lists.xenproject.org, 
 Josef Bacik <josef@toxicpanda.com>
Message-ID: <willemdebruijn.kernel.6099d613565@gmail.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-11-54ad0ab57614@toxicpanda.com>
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-11-54ad0ab57614@toxicpanda.com>
Subject: Re: [PATCH net-next v3 11/15] net: skbuff: don't run off frag_list in
 skb_segment()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1793760823-1A2C49EA-C5692D0F/0/0
X-purgate-type: clean
X-purgate-size: 1592
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Josef Bacik wrote:
> skb_segment() keeps going until it has segmented head_skb->len bytes.
> It takes the data from head_skb and then from each member of the
> frag_list.  If head_skb->len counts data that this walk can't find, the
> walk runs out of members while it still owes data and dereferences a
> NULL list_skb.  There are two ways to get there:
> 
>  - head_skb->len is bigger than what head_skb and its frag_list hold.
>  - A member has a frag_list of its own.  head_skb->len counts those
>    bytes, but for each member the walk only looks at the linear part and
>    frags[].
> 
> No path in the tree is known to build a GSO skb like either.  GRO
> flushes instead of chaining an skb that already has a frag_list.  IP
> reassembly does nest frag_lists, but a reassembled skb isn't GSO.
> 
> Check list_skb in the three places where the walk moves on to it, and
> fail the segmentation with -EINVAL.  The KUnit cases in the next patch
> hit the NULL pointer dereference without this patch, and at least one of
> them hits it again with any one of the three checks taken out.
> 
> Without SG the payload is copied by helpers that check the length
> themselves and recurse into a nested frag_list.  That path still fails
> for a len that is too big, and still segments a nested frag_list.
> 
> Found by the Sashiko AI review of the BUG_ON() series.
> 
> Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732895b@toxicpanda.com/
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>

