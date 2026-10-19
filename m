Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F99607885E
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=irSSBwch
Received: from list by lists.xenproject.org with outflank-mailman.1454513.1668120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIprn-0006Xp-9y; Mon, 19 Oct 2026 16:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454513.1668120; Mon, 19 Oct 2026 16:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIprn-0006Xi-7J; Mon, 19 Oct 2026 16:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1454513;
 Mon, 19 Oct 2026 15:09:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xIozu-0004pX-OU
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:09:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIozt-00En7u-8P
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 17:09:57 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6ad632c0-bab6-0a2a0a5309dd-0a2a4502bee8-4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 17:09:57 +0200
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6ad632c5-6ca4-0a2a45020019-d155d0338da9-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 17:09:57 +0200
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6ae14cdc63aso15867a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 08:09:57 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792422597; cv=none;
        d=google.com; s=arc-20260327;
        b=kZuQUrZ2AwFms4xAcIdBntRPYfpHZHvjOVh5khkOalI/eO9EfJalWOd6b5O4o3S3sB
         hgeiDsGoPKmDVUEsdWZvzOW+xUDiWOFnjzaQsOMxNJkxrHfs2gQo7fZZgaL9YlOMN+9F
         +RLducZfalPqlF5Y6Rh9tpuF9tVBSfH/L6L9HOKm8Y4jAi/yp39Hg1CL4uTri0+OdsUj
         Rr7hxcU/P0rTUVR+0CdBwtP319xcfsWJlw33hg3OSmOHGMsGDi4xeEm5gf6sT15kE1Wu
         1ALg7Qr+f+rS/vXt1P5+aZ3kwhYv8Ypsu0ZJ2QcyXj1yOvFSq91Ju5eFaXlZN6xfVbxZ
         jSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AWZK7vcabRIRlNI5I0Qlo1HJVZRHgTLgm0d3t+p60UQ=;
        fh=j7KtDfAVZ0xCKnedpo/AfKr/BVAFGsqOgyOvKdv95/8=;
        b=EWXZ7qU4X+V5+wxB1ApFMNEEFupM5ZGo7z02ZU+JjhhMd7mkv/l181vKiDE5//1MdR
         pxKKnDlLwlr1qfvvqc1q6eWyeuEDWijSgqTOQY6EGRiU6F0tkSI9enrDABiPBL6vTWkR
         3SzA8ZHAueN9CJQcIfxePFTM4owNHOmvvZRYNdVVc+5WNBbGZm6zeEaksZP21B3g+XUl
         9A6eaLtFDWN9+te3Ay1hQeg/FzG6gJvBrlZZbbFaDbUqtell3phz5zskOGUj2Wtdcu/9
         hna0UiA4fjE7Ofkp7/cFdEzZ0bpgXUH3jVNiHLT/wvqOfZRcZhQ2Dol32W8gt+chmSTa
         PN8Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792422597; x=1793027397; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AWZK7vcabRIRlNI5I0Qlo1HJVZRHgTLgm0d3t+p60UQ=;
        b=irSSBwchgGpyHSPNhIboTFJ8A5TNdrVidaxhq8N9ZPjiXG1shGKCRMJhVaxFWE+P7k
         ox75FBeDev5RrR8uziwR9SDjjB8LrDS1BwB8J/FaRsz2/KuyjCSYRCSY99hWshcKxRln
         +GEL1fEmr8Pu3NjCW4DVPulQPbMbDMoz9C3tpln5VKI0NWBdueiLJPke3tGRdtw1Py38
         so0c4JRe5MnPPNm5acQtyNQeAxW1n6X7ixqldnLDylGkYNzRsXSmCK4nIg260xt2GWpm
         AW5RLGoWklguzzlnUUovivQ/ZIXXol3jC02QdGxz5UKtcfObofnSYLuvfTZ0D32eN+kd
         ybaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422597; x=1793027397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWZK7vcabRIRlNI5I0Qlo1HJVZRHgTLgm0d3t+p60UQ=;
        b=nzBKL5RWCM4vOqBwq00UbgMp0SE6DXu2uOnYHthe50LnckCynhsRi7mjplphZZf3w9
         BDdnDy71lhQ3nqytNADKKJdFOb7NeLMZy64ACEz1SwXJWgCbJZMxv7J0M4GMyruWlrXE
         IgkEY06DcxmXJoXiw3s2dQ2HUQ21iY9Qjsr9T9tKyg4oIE10MEYGgLOFyRKK2XMOZuzP
         aRpyvPA3V8FpMBkBZlm0lsI8dn6cOWY7S0RTZ+BTfDdtpb9H1kHtYGg39Cab9AQaz/H1
         9AMmTe3yFITaXB0UlHfH4aWvn7+jz5x7q2fWnIoXHwSXmkapHIxRIn7SuyJYCb/4cZN4
         1lWA==
X-Forwarded-Encrypted: i=1; AKwUvBzeGH/9QaUcpQCOo3rTAq0uJycD8ksU7OhLKudG2yj+Y+bUsS6zvgcg/8o7htHKtCSKl1IopoPDvwk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLolrqn+m7WEymhjTay7Nz+MF3T/IHS6jLkK/mbhAXT3kc8bvI1
	bQUbEQgywD2wWEOy9w4s2akalwVUda3GbLeAkj3/YorNcDOPILhAF2k9DTbjl3ChjIwCoJ5k8/K
	EfoAfjtdNcfAvNOoUSPwZ5Ioi9x90nEGh6Lw2ShLb
X-Gm-Gg: AYBFou3P3QqLeF6L3tbsR3tktA3NbATHz8FR8nF+KigBqBjDB2adswIUMLAUrq+aQ+t
	ruWYhhCvMOz1VsYAsMx8D/FKafZ+WTrSOMGU3WixiEaBdCqaINQ/rSYWvvODzL2YgN0oJ3pKX6q
	3yJlPc7GCv8LZhpA/a1xL/DymV3s8lUeScXhZCiuE4vIAHDpE4m3Q7VSTstPu3gWWnyxISFWaxT
	ReKDzn5HAoMbx9R+GfZQVOiTFILMelx5grctEHrPIUvTBFz1WOjgdzhG7JVTmbNsvLOflkM8v3O
	fgZs0I0J6nr0Hfy7nUqVsH8W9DXkG7jSFYrq4jMVAVDMVGwD/LKn0N7xpyYbOVnO5K+V/sq4ZT0
	9FKO8bVLasQ==
X-Received: by 2002:aa7:c0da:0:b0:6af:afce:184f with SMTP id
 4fb4d7f45d1cf-6b3d47d2378mr37599a12.3.1792422596059; Mon, 19 Oct 2026
 08:09:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-15-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-15-41dbef50b9f7@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 08:09:44 -0700
X-Gm-Features: AclHuK-dz-bSuEIE90POvdnsCfCUclg7akbJCTc6RZqWm9wZlCW3Q22i8toaMP0
Message-ID: <CAHS8izO__8Vqw4_ReEkbgn5UmncveREuwM-q9Mub5CGy-d5c5w@mail.gmail.com>
Subject: Re: [PATCH net-next 15/15] net: update comments that still describe
 the skb BUG_ON()s
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1792422597-30DC12AC-D9FA3D89/0/0
X-purgate-type: clean
X-purgate-size: 948
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 6:51=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> The skbuff BUG_ON() conversions left a few comments behind:
>
>  - bpf_skb_net_grow() says skb_segment() BUG()s on a frag_list with
>    head_frag set at the downgraded MSS.  It fails the segmentation and
>    the packet is dropped, which is still why the skb gets linearized.
>  - The GSO KUnit test says the non-uniform frag_list case would hit
>    BUG_ON(i >=3D nfrags) with SG.  That check now fails with -EINVAL.
>  - The skb_to_sgvec() kernel-doc doesn't list the -EINVAL that
>    __skb_to_sgvec() returns when @offset and @len run past the end of
>    the skb.
>
> No functional change.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

I would have preferred this change is squashed with the code change;
if you re-spin for another reason maybe do that.

Acked-by: Mina Almasry <almasrymina@google.com>

