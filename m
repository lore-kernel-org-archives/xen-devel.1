Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D3B606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 00:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=IEQx/qjW
Received: from list by lists.xenproject.org with outflank-mailman.1458694.1670754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3No-00005u-8I; Fri, 23 Oct 2026 00:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458694.1670754; Fri, 23 Oct 2026 00:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3No-00005m-3U; Fri, 23 Oct 2026 00:43:44 +0000
Received: by outflank-mailman (input) for mailman id 1458694;
 Fri, 23 Oct 2026 00:43:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xK3Nn-00005d-6G
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 00:43:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK3Nm-004M93-JH
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 02:43:42 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6adaad6f-8faa-0a2a0a5109dd-0a2a45059a5c-20
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 02:43:42 +0200
Received: from [209.85.219.46] (helo=mail-qv1-f46.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6adaadbd-4cb1-0a2a45050019-d155db2ed900-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 02:43:42 +0200
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-91b813ac020so5926756d6.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 17:43:41 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.246])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c3971484dsm6287796d6.30.2026.10.22.17.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 17:43:40 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792716221; x=1793321021; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CA393/dbh3Z3YHwEnkYHgdANjZe1N8bA84W85qprnlw=;
        b=IEQx/qjWlHG2j5ERIxwAsOqyTzbe5wZoIOfYJfDpC8qeCQO8ZcuZ/JvU246bknj1i+
         CmggoXKrghp5XVgGw2uJF+E0vkeewah0+ENz5M/IU67qZv8m1dDM+dxN/w9BpDOsjMjM
         +L9dsIEzZ7fTxn+1zN8opRXWMHQucSP1vijmUB1uZKWlwU2etYZzVbDzSclbxv5Gnlzq
         2CxxzN6/cdbc9oS0APd3o1TX/hX00LsRWAII7ZmFdjrIV15h/mBFD85BIwZGqKUSJapt
         k1hwyLx2ALumWhXoeF5hTLu04C9rYIc3XAoXeUjWZLKxa36UpFBrOsiBFfxQQ84YgAAS
         NLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716221; x=1793321021;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CA393/dbh3Z3YHwEnkYHgdANjZe1N8bA84W85qprnlw=;
        b=lqPOm5eo1JkPwgnQRmTXFz2akj5nhbDe3zPsAXJWZIzzj4lSDUR10kT0MWPrVu1ReE
         /UV+hGvA+S6NFEe2k/nDEXc61LLUBE2DbY4fYoIeZSFBe5YpwLpdEk3stKxe9sEHwTok
         XZJOD7EiGh+w31yAOJFemYbT8BELVu0yfUsMdMVkBHZu3PMPlKTfvAb430HLE+QqPeyi
         tAd7k8jLyVpG+4yWYWGyPmL123pIx2KdrEx19aiPeFcgPKyrJJ1dFBRX5K1DE0/Aliwd
         8bcVH03vCH7jvXAPdwIt0NdbB5aOZqAgmfVwjeJS6zyfhypOBHYH5TkM+m91/ornSbsj
         FbwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3c68Npj3/MqlWWHViDEbI57ju1S5Z6slWRD7fxnRQixbZM+8TAg9fjBzoM5B6BoXEImsK6LD5zmQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIa3bMyd4EYFsUgONHWD1Mdt+kN9ZNyisr1i41di3g1zd68HN9s
	KlXTsvLiXhHlEO0pwC5k64WT7N8t6XauyX6KGHhZAgYLp4bK1SlgqPxWapsuV7M7wk4=
X-Gm-Gg: AYBFou1gl79NOKUIQpgc023sY9u9jd5k8sMacCUAy+Q12VdoHe2rwGMmHammfg+At5p
	6aNylJPe8AbzzSumbA0FECsHgoEZKnKZGuopERhaDipFy3U1IEmwc5nMt93hSi7F/DljJ7g032v
	AepQZSnqryd6tTxTOOFLJ8EExsQlLlN2p1b2DYxXq7Cgy0s6ZhumLy9nj/y6QwwfuWM4d7k5BFJ
	WeDhC15KRVllimx/i92j9f+CNUgxJEogdoRLdwvJrhVAQ+OnHcOm+SVwlNsgl+0DTZB1mk4YUKf
	xViY/cwqHzGNOSi5j5ombQhAc49a3V/OKtVXkJRixTfzxG7FHZscm3l9FGhiiUXxCkF6gFhbXzP
	s2/l+8SWyO2P769QCZpmr/DG4vxHDM2qmj+uySxNo3nRVipaOw6aYDB6i0F2U2bUywrw9OL7goT
	zO8nq0jr6cfI2EFWPmvNIczMyUeY/LsEFcAIG0bn4QWCLUSPEFvn0IMy336Z/TIvLCI+RZ3TYBP
	66mt9gPa7SEgACy2NenwliFiR77KlxeDh+XgNkWuxbayu1tBk4+msXcRmKQPXQRhZLX4Svjdeya
	j+7oHWL2CkybaVryjA==
X-Received: by 2002:a05:6214:d65:b0:91c:1fdc:467d with SMTP id 6a1803df08f44-91c3a9d3548mr7612716d6.29.1792716220553;
        Thu, 22 Oct 2026 17:43:40 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH net-next v2 01/15] net: skbuff: make skb_copy_and_csum_bits() report unreadable frags
Date: Thu, 22 Oct 2026 20:07:28 +0000
Message-ID: <179269964884897.2.9376562849077840876@toxicpanda.com>
In-Reply-To: <717ace2e-18b2-4df5-848d-5757c01ee5de@redhat.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
 <20261021-b4-skbuff-bug-on-followups-v2-1-2aa780a03524@toxicpanda.com>
 <717ace2e-18b2-4df5-848d-5757c01ee5de@redhat.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1792716222-245122A1-E37FDDC6/0/0
X-purgate-type: clean
X-purgate-size: 2834
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:21:26AM +0200, Paolo Abeni wrote:
> Recently Eric did some work to remove return arguments from the fast-path,
> as with some config it gives measurable overhead. See commit
> a02a765bd5c2ae7705144829b2911c96c29db6ba.
>
> S/W csum should not be the fastest path, but AFAICS the UDP output path
> could use it when building the aggregate segments.

I checked this on x86_64 defconfig (CONFIG_STACKPROTECTOR_STRONG=y,
gcc 13.3), looking at which functions call __stack_chk_fail before and
after patches 1-6.

The callers on the output path don't change.  __ip_append_data() and
__ip6_append_data() pass &skb->csum and skb_segment() passes
&SKB_GSO_CB(nskb)->csum, so no local has its address taken.  The two
append functions already have a stack protector today, and
skb_segment() doesn't have one before or after.

You're right about the helpers themselves though.
skb_copy_and_csum_bits() and skb_checksum_full() both gain a stack
protector, because of the &csum2 local in the frag_list recursion.
Moving that loop into a noinline function gets rid of it, and only an
skb with a frag_list pays for it:

                                 before  v2   frag_list loop split out
  skb_copy_and_csum_bits           no    yes  no
  skb_checksum / _full             no    yes  no
  __ip_append_data                 yes   yes  yes
  __ip6_append_data                yes   yes  yes
  skb_segment                      no    no   no

  skb_copy_and_csum_bits          774    905  666 bytes

I'll do that in v3.

These gain one and keep it, since they do pass a local:
__skb_checksum_complete(), __skb_checksum_complete_head(),
pskb_trim_rcsum_slow(), skb_copy_and_csum_dev(), icmp_glue_bits(),
icmpv6_getfrag() and xdr_skb_read_bits().  Each of them goes on to
checksum or copy the payload in software.  I haven't measured cycles.

bloat-o-meter for patches 1-6 with the split is +1177 bytes in total,
most of it the new error paths.

> I'm wondering using a 64 bit return value and encoding there both the csum
> and the error coudl make sense.

I'd like to keep the int return and the pointer.  It's __must_check, so
the compiler catches a caller that ignores the failure, and a packed
value needs every caller to know how to unpack it.  0 or ~0 as the error
doesn't work either, it changes the checksum on the wire for data that
sums to zero:

https://lore.kernel.org/all/179199883858343.2.17884063473154560573@toxicpanda.com/

> Also currently net-next is closed for the merge window, and a bunch of
> changes in this series looks more like cleanup than fixes. Cleanup will have
> to wait for the end of the merge window, fixes can land at any time.

There's no rush on any of it, so I'll resend the whole series when
net-next reopens.

Thanks,
Josef

