Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217FD606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 17:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=CJBPWsAw
Received: from list by lists.xenproject.org with outflank-mailman.1470506.1679264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIMM-0001U1-Bi; Tue, 03 Nov 2026 17:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1470506.1679264; Tue, 03 Nov 2026 17:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOIMM-0001Tu-8W; Tue, 03 Nov 2026 17:31:46 +0000
Received: by outflank-mailman (input) for mailman id 1470506;
 Tue, 03 Nov 2026 17:31:45 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xOIMK-0001SV-QR
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 17:31:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOIMK-003aOy-1X
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 18:31:44 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aea1a7e-bab6-0a2a0a5309dd-0a2a450ca908-6
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:31:44 +0100
Received: from [209.85.219.53] (helo=mail-qv1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6aea1a7e-f479-0a2a450c0019-d155db35d4bf-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 18:31:43 +0100
Received: by mail-qv1-f53.google.com with SMTP id
 6a1803df08f44-91c7a0c1617so71371146d6.0
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 09:31:43 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ca7f254a1sm120862756d6.7.2026.11.03.09.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 09:31:41 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=toxicpanda.com header.i="@toxicpanda.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793727102; x=1794331902; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eegksxV28ioEtuerGVBp7CC0Yc83uWN1TXj01mx1N9o=;
        b=CJBPWsAwTaAQs0Faam86OpRMGlXwbd1K1jAahg4JwfN35BOHcLNb9QCHcgwDahubp4
         coYB3npzDAz9eKUqnjiTVfNyagCbd6JI8DvaxrOONFb83MlJY1bk44rt4bppKsJ41Cc6
         n11+Mh1oRv97/7ZDmrBLVtm5MpMUWj7kWrAOXsqxUnFLuMOZh0lqkShh7KQYlQuDEP/Z
         nCI97o8VU6qsXUrkuRlTd0gaUG+FbfKKjdA47quKamIBIk0d9ESSoMU1iD2v9vfc4uEI
         +eaAnU2qAdBUNf10VIeuXi8of3l0TV9wVrkKMnVsoGlMX4ZC5Xe880bJJ+3/SIFgUG37
         i5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727102; x=1794331902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eegksxV28ioEtuerGVBp7CC0Yc83uWN1TXj01mx1N9o=;
        b=re9fY5oCTzmikBk8Vu2h+eekLRGUV8So59qmBmRTYcORQrCQ/KueRnDfzbvrYvhryJ
         WZkcASZdvPCi9x1UJcKs87JVOW0RWo9f34bImkMuZF6BEsqK4kTvV6DKI/UkWddaEXBf
         SpuvhVVtmWxJpUdCWbX/xOD/ua9gDgewGz/RzvRYlwf7UZInc7KJiJb73e7jSlxP/tf/
         Ka9SAC0aZa3eXVU1xMeJAOUZ+LJJLCYb/QoXI42uijDaAPGX0hgVFfnRAiUsBwxA/J2u
         TvjysSPet/ME2lKOY8SaPJiLQR/91HxeRWcN0q0uUbhnNjk1of/FzgkkxA6GwAT9tawe
         OYpA==
X-Forwarded-Encrypted: i=1; AKwUvBxOohV/uC+HVJ5+pu09BzFQn+LbBjRjVll+enccRAIyXFCe6gy/wfFzIenadMWdQeQyTJPBDfO9YSs=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9Sg+QDQzhseKTK1gIEMjITs9Z7+z2ahTLzh4/AV6kMxNonPVrM
	5aWcMOpefLjkp0MwGcdv/ZhbmcGgeA7oye31JA12O2NxRbveJCQGSUJUc6qxj7K4vF0=
X-Gm-Gg: AYBFou24vEfxcSpctQcjMRcEs14ucxzmmCcO2Gm4OnwMRZPyTpm3F1wVRSirPTUirIj
	f1zdFjcRLV+jl8ACwaMq/Z9WU1PU2tXlyjWapZWLQNznmwqSLA+2NpxUFCWv/qeJzTN5z+VPiKp
	+zYLL26eZpqDzPpDDMM1U55fpJMPfEB3kTsZdnNi5RlNA31bpUCZfsnVrwKcwLvpGksAziDyrRc
	++6WKTs7YjaAGJQluLbq9TIjBPToDKPPEfPyuhcj3Odx4/tim0SELX62+dv4MHYfcHhy4vF4YVP
	1EJAQS2Wq1yDK7R7c7VUTGOnRD2wX2zvKPuaPs9BKoKVa9EcrRXhaeYD27YoBmvU7dDy63spvGU
	i3GgUsqy5jdpjYFShsTsmeqYxPm1eU7HPxHzRJZbYsCMtZYIiCNJFljPUZnFJBp1t7P30MOgHIL
	x6ewFhCMacXYGMMaiX2eNvxQ9ok9yDnrb4/QB03pEL/+I0ekyBSQ0sGNnl2bQ44FYYTjRyQBRJ7
	lQ2bDbUvYUz7LRR7wZ3fzgJyLy3OQDFI3JV9ApeLRhNFY8Egh7lYNOAuCnZmkbO3x7vX8/VWdLC
	DPQO58STXJdRVpvikSUhCOz+W9w1aPHV/zp7mSTYE4ilpsSyvz8HJWUqxeT3N+6dlGs=
X-Received: by 2002:a05:6214:f09:b0:912:517b:40f6 with SMTP id 6a1803df08f44-91ca4b4d439mr219929456d6.40.1793727102334;
        Tue, 03 Nov 2026 09:31:42 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
To: Mina Almasry <almasrymina@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH net-next v3 02/15] net: skbuff: add skb_checksum_full() that reports failure
Date: Tue, 03 Nov 2026 17:28:00 -0000
Message-ID: <179372688053858.2.9209483466693222021@toxicpanda.com>
In-Reply-To: <CAHS8izMK8nrYny_jc-aTbjwP8tsDkY0a1ed7F=GfwzfXWm8o=A@mail.gmail.com>
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-2-54ad0ab57614@toxicpanda.com>
 <CAHS8izMK8nrYny_jc-aTbjwP8tsDkY0a1ed7F=GfwzfXWm8o=A@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1793727103-50B3DA5B-D3E3B7D5/0/0
X-purgate-type: clean
X-purgate-size: 1958
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 06:44:46PM -0800, Mina Almasry wrote:
> Hmm, but do we really want this intermediate state where skb_checksum
> and skb_checksum_full exist? Why not fix it in one go rather than
> little by little?

I don't want to keep it, the wrappers go away once the last caller is
converted.  I just can't get there in one go.

After this series skb_checksum() still has 44 call sites in 28 files:
11 in netfilter and ipvs, 13 in ipv4 and ipv6, 13 in six drivers, 2 each
in mptcp, bpf and pktgen, and 1 in xfrm.  Changing the prototype means
converting all of them in the same patch, and that one patch would go
through netfilter, ipsec, mptcp, bpf and the drivers at once.

It isn't a mechanical change either.  Each caller has to do something
with the error, and 17 of the 44 are in functions that return void, for
example udp4_hwcsum(), ip_cmsg_recv_checksum(),
mptcp_update_data_checksum() and nft_payload_set_eval().  Those need
their own callers looked at first.

skb_crc32c() looks smaller with three callers left, but one of them is
sctp_compute_cksum(), which has 11 callers of its own in sctp,
netfilter, openvswitch and act_csum.  The other two are siw and
batman-adv.

So this series converts the core users, because patch 3 closes a hole
where a packet that couldn't be checksummed passes validation and I
didn't want that to wait for the rest.  After that it's one small series
per subsystem, and the last one removes the wrapper.

This is my plan for everything, in response to your cover letter. I've
got a 15 patch limit and a one series per net/net-next. I'm trying to
make this as easy as possible so that they can be spot checked and
merged quickly. I started with core and I'm slowly working my way out.
I'm purposely avoiding "change all the callers" style patches because
that's harder to review. This is slower but easier for everybody, at
least I think it's easier.

Thanks,
Josef

