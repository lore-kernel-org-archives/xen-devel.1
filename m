Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D9606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 14:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Zts0Lnzl
Received: from list by lists.xenproject.org with outflank-mailman.1459343.1671311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKG2p-0001c1-0D; Fri, 23 Oct 2026 14:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459343.1671311; Fri, 23 Oct 2026 14:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKG2o-0001bu-TI; Fri, 23 Oct 2026 14:14:54 +0000
Received: by outflank-mailman (input) for mailman id 1459343;
 Fri, 23 Oct 2026 14:14:54 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xKG2n-0001bo-Tj
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:14:54 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKG2n-00CzUs-AP
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 16:14:53 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb6bd2-bab6-0a2a0a5309dd-0a2a450c9ae0-12
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:14:53 +0200
Received: from [74.125.82.45] (helo=mail-dl1-f45.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb6bdb-f479-0a2a450c0019-4a7d522d907b-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:14:52 +0200
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-194d0c31715so11552c88.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 07:14:52 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792764891; cv=none;
        d=google.com; s=arc-20260327;
        b=Zh9Clv85s2+wwkxcA77xmuFjXSJqVpOiNMafutAz+LCR5qlaLCSqj2grCyprrg5s3L
         pm9azRkUuDOcnuikzHK2fX9aOW3+mvVBdW+zL4JDPsYHWSXJfauPvn99MyKwA2bZ6HeN
         yk5C9blylz62j1MGVQMWIPdeFwNW1tzG0Y9VcMIh4R+PSYd6GyGocZ4+kVJLftoOInpG
         uqFYKGYwGqhhwus89tg0wj3I0jo1YE52Vy6GGVcqFUSjxroJt8rgMcd0cY3vsFDHdxf8
         s5pVbkZr1pBlNRr+WIZhLQJPYRHcmefZuE0YzKIJqL19uKhl7sTf5LuYvpmlIx1mu0A2
         Pqaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UX9XiJ/sX7H9VN90F3Ajif8yPiFt/xrbd1p2Jnn+V8U=;
        fh=OJ9mylx2JBzyO2BEyMqgd7O+vtLXT4S2AdO6tIKHjWs=;
        b=oIQouZONqX12qZyFlemZnKWn5rduyx5MPx5AGqCGz+0Y4/9zAPkv8JkGYMZIH3DYFb
         A3w8+oqMwx/MdYhPC4sSRxwdXd4L9Kk+NG5bZS11YQuKEHJjUuDa+JTYWPP8ehxidJTn
         7TJ+X8KgYzk8Qy6V14ZwR7Yxr38cdVRP6gvyIQ78ow1Ld20d7XmPAF7vsLttyx5+EzjL
         pOtLS3UDlu12J/LQXh8UwO1Y7xtdGjP1/FCt7+3whISIi4bvePbOTSTLS8qzdM0Lt7o9
         vF+7Ks8bx8AWTelQAGZ9q6a1EQ7sga4R/DjCK3NTm1psVIzwqDWTy5MkeTGVf0+r8bs9
         1biQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792764891; x=1793369691; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UX9XiJ/sX7H9VN90F3Ajif8yPiFt/xrbd1p2Jnn+V8U=;
        b=Zts0LnzlQtdu+YpcqMZmrz0BtnIuaUs6P8lxvSVqIDNMpIHhnUb0AKOXTM8fjacxf5
         eX8LBLZIYGE4eTKQ7v2lf0ZuvcKVwUfGZsW6YTCxbftxrQj6+cbFH9TCctY/IR1ZK/T4
         ndm2gf5iAJpMn9dAaCGBUyD1MR/Rgj8gVoFzlrcMZWQUwjnnYOB/sfg2EmHeplfuGFUX
         4Hqh3hUEkKk9bCX5wIVpxVABI98j98jroBH6gZyRFby4fV98BD/F0keu7hFDEoQJNpxs
         6a8U5tP2q+zznORaKr09+vyD/W1eOWknCpBpEOTkL09hOUP2aM6fy7tIODe8Wov6W2h3
         nDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764891; x=1793369691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UX9XiJ/sX7H9VN90F3Ajif8yPiFt/xrbd1p2Jnn+V8U=;
        b=pZHRHvIAB8mbzB3sIYZDYw6rzSp23FVtgM2JGuFx1+0CbR92yH1fp5LEDoTVJJtcNj
         rVUR+ukCbZVwSi0IrQSeD3A78HBX0RiFw6PkKs1MNCxLU3othx1/vgpDv1kWXQwOWxfM
         2sMYjn/6iu9g+4vIBU3aebQ0/XEmkKruHmOCaGJ0HbhE2YfQY7XZdc8FRnajQYmfAEpg
         yPEuLQuT8KIF7cd3jYVTZ+JSQWv9d55uHX3dEnuJEvaHiaEmvVg/kaQ9X3R9gmX2IC3G
         ANbtNjn6FHIZiJnEGs6PE/fvO4fmu/VIEipxbW/FlAs/JmOFL9a18/Gb8noWlA3z0b7+
         FT3g==
X-Forwarded-Encrypted: i=1; AKwUvBwBlhq4MY00ztZgskLZPIqnJyNJ1QYN8UnngAz/LUsaBKcNWFr//IQsvMdc97cvpvOdoEv3oF6a1dY=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL6uJvZIjYiZcPZucAtZtFlTpUjRyS34NRbABCpgtfBl7wTUE49
	b3ND1iehEbbtw4Vv1opxSuSWxNTGh6JIQHl4lHEzNZlMK2eAWz1BGjH43g6z70UFEAzkqqWcQWT
	i0HiFtjcigVOzhftQwwzpS1lPMFVhZOh7ZQfs2mMZ
X-Gm-Gg: AYBFou1axiuhwdduldAZad14dcCEP3+kAvwAFQPnnoov5WbjXW3PuBdQuDHKWC2Yjzj
	4pIH60LVnnS0FX6GueGSR7S5vhPAns4aTxIuf0YiTUyaGNEo5Q/eOfP5OwAiDWW3ByHyvvroPkB
	gmDuMkv0Os1QRJxFza+Rs+kFD+ozglC6komxR+zFitV8Hb3dt+zgTWPd5MRRyHxUMloZZfEOlzK
	rXFda5CA81dvV90tq/j5XriV1LZigvG8j0uPK3/xyTzkMfd3Y1ubnXnYooZioqDjr5VVkEIc0lO
	Nv7xJW4ysZq7Oi95eVzgvBfaeVg0Nr93R+BrLMYAIvrLV3sUony2bf1oh1AEqiS0Q62NbiHFcCs
	2Mn5lCKQwv1CQjb9uQb3ZqYZA8/NeiGne0mYFE1Iq405UBkPy7UlHRWNDFsekR6mg5lU=
X-Received: by 2002:a05:701b:458d:b0:142:ef2c:c480 with SMTP id
 a92af1059eb24-195f01c4da6mr194592c88.17.1792764889782; Fri, 23 Oct 2026
 07:14:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-4-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-4-41dbef50b9f7@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 07:14:34 -0700
X-Gm-Features: AclHuK_2m3TNgrazOeFVO5X_G9cX4zSCYeyDyz_no9CuBf7VcXjYydnmobrYYP8
Message-ID: <CAHS8izPr7b3e6reYUwTKiLiSQLOUkVbxGRayEYQREWb=tC+c9A@mail.gmail.com>
Subject: Re: [PATCH net-next 04/15] net: skbuff: fail segmentation when a
 segment can't be checksummed
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1792764893-50F3BA5B-121F0844/0/0
X-purgate-type: clean
X-purgate-size: 2362
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 6:51=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> When the device can't checksum the protocol, skb_segment() computes
> each segment's checksum in software with skb_checksum().  With SG on,
> the segments share the original frags, and a devmem TCP skb keeps its
> whole payload in unreadable frags.  The devmem MSG_ZEROCOPY path never
> sets SKBFL_SHARED_FRAG, so the __skb_linearize() fallback is skipped
> too.  skb_checksum() then warns and returns 0, and tcp_gso_segment()
> writes a TCP checksum that doesn't cover the payload that goes out.
>
> That's reachable with tx-checksumming off and SG on: sk_setup_caps()
> still gives TCP SG and HW_CSUM, so the dmabuf send is accepted, and
> harmonize_features() strips the checksum features but keeps SG.
>
> Use skb_checksum_full() and fail the segmentation with -EFAULT when it
> can't checksum a segment, as skb_segment() already does when it can't
> copy one.
>
> Found by the Sashiko AI review of an earlier fix for the same path with
> SG off.
>
> Link: https://lore.kernel.org/all/20261009-b4-skb-segment-nosg-unreadable=
-v1-1-7e2334a55fe8@toxicpanda.com/
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  net/core/skbuff.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 40d2dd20d47d..88ed2dd99dc0 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -5239,9 +5239,13 @@ struct sk_buff *skb_segment(struct sk_buff *head_s=
kb,
>
>                         if (!nskb->remcsum_offload)
>                                 nskb->ip_summed =3D CHECKSUM_NONE;
> -                       SKB_GSO_CB(nskb)->csum =3D
> -                               skb_checksum(nskb, doffset,
> -                                            nskb->len - doffset, 0);
> +                       SKB_GSO_CB(nskb)->csum =3D 0;

So I wonder if this needs to be a generic thing to do insidk of
skb_checksum_full. It seems like the previous patch is complaining
some fields in the skb are no-longer set correctly if we fail
checksumming, like ip_summ. Maybe ->csum as well should not be left
set to non-zero if skb_checksum_full fails.

Anyway,

Reviewed-by: Mina Almasry <almasrymina@google.com>


--=20
Thanks,
Mina

