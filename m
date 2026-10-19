Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3661760A4AF0
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mT0IWYfh
Received: from list by lists.xenproject.org with outflank-mailman.1454574.1668138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqBR-0002UQ-4F; Mon, 19 Oct 2026 16:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454574.1668138; Mon, 19 Oct 2026 16:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqBR-0002UJ-1T; Mon, 19 Oct 2026 16:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1454574;
 Mon, 19 Oct 2026 16:23:37 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xIq9A-0002M3-Tg
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:23:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIq99-0027g5-Vz
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 18:23:36 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad643e2-bab6-0a2a0a5309dd-0a2a450b922e-40
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:23:35 +0200
Received: from [209.85.210.171] (helo=mail-pf1-f171.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6ad64406-b7e8-0a2a450b0019-d155d2abb07a-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:23:35 +0200
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-89f85edd210so1043701b3a.2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 09:23:35 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792427014; cv=none;
        d=google.com; s=arc-20260327;
        b=QfqtTApkJDj2muIa0sVhieDxvFmlOp1ysb53on+xUOVGam3A08+68cc+7EyJPQwuNn
         nbomLr8PpwT+r1XQb1ke4FzALXdP/ragyyyApl8E5xAIGRlONT84usqmK1gQ4jophJpE
         j19AClpUaHMIpR/SLniVrxQBIm/EQjPqX7PsQMLJZa5GFpv1WyO5mEfBp+Tuo0X+30f8
         iO1TO1xVXhq6ArGdt1ofKj6z2oO+TehOvN8GxN+g/c6pY6LwnouNwPqU4Ssl3SmFdoDh
         z/SG2xlttooHvcVKc44rT5qmVOVEnr3LUhGcHqz0lT0hM/gLSDLHFH743ZTei0ywy3C/
         YmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTIxUhdK5WwE/ZvzqZ/orvmnDy6Zp8KzQx6MCWL0bYU=;
        fh=rFkbf97nRC+gtwLHBW2vGZt53i94TA0CqB43VrFLPzI=;
        b=p/StDDcG+vCtC02V0aS/di2vluCTO6SezBnaEZQ6zcP5cFu1bIrT+/y9BbR0Ww3yj8
         W/UdR+zh9BQ2+wcM642hjcfBd9v7UP35sjeZRRfjpIsFkesuu10Ievo23pGmA760jgXo
         /GRIbKzxwoQIJqzUv+aiqx3y7GlEGNLIi3fHyyZoV3LWxILjc1mcXyQh+gZsvEjdZhCW
         3hwheSVVWQlO1OEfaCWTTaY40lZ8LgYdQzrxsFQg+qiROmQktaUlyoc9n/lLn/KuuEmv
         RbXif6kIWX0JAH5SJJerJmvP7ZwfOkE+gzxmG/IXwtEgBDdlwKxfNuuCPNDpYd4WLVNx
         B+4g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792427014; x=1793031814; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTIxUhdK5WwE/ZvzqZ/orvmnDy6Zp8KzQx6MCWL0bYU=;
        b=mT0IWYfhT4UBmPCVNA1iVunOnGvAKbRyJ2Gu72q+pW0Z8IL5+UmxjOJh+9hJkfjKyl
         s0lfxVbFnWx4v0+DXbxnSncVaCf4eKr1GS9x1HQIqSOIm0jddwShTdQgd/FrzdsSYW/d
         Je425jEAChaPd3AlzhUQCo3feMRcNrCy/7gcO4nszGU3vBlcaKyRkYUE1fLc7s0HOVOE
         5R8OnTPadwtGYPfQQw5Jl6PWKThcG40Lg9FtzGtKDqXB8VzWwZpqlVsmPcchTIvYZ3Pz
         8wlCr0GFo2I0Hiko5eYBzVzvSv61F8csfdktgpeF8svaY37MliMRcX+oPwc6zs1/fY38
         aPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427014; x=1793031814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTIxUhdK5WwE/ZvzqZ/orvmnDy6Zp8KzQx6MCWL0bYU=;
        b=cxgfQfH+fePqFewjT/nRm/rWQ3aCQ9S2Yiu99F1P8c9fxVboYBpvvSqZeeEcX7LNXi
         o0zbfGQGw7Gd+IJZWXYGmAF0Z7Dwsh7bGFFksYLgUGoHNZU2U5SQrNQICnFOi/ZIMTk/
         2K3CBCgtZ0z5Y7kIi1Jf770fgtNS/uLon20xRmt46qrCThjYWW5SnKCrOMIu2wr0Ctfn
         foutD6TkBg6hRIX6hObQpoeusdk1L4Kb9ouvBjlKlOHD+ISh1whbz4Gp/27zUSYOp/Z/
         oIGsGw8dVwAI8SE6eKrctrQ2tqIV4h1AVqv8Ez9IvtCH89bzhguz00KgwG4k3ejUqXbw
         nnYg==
X-Forwarded-Encrypted: i=1; AKwUvBxu8itAP7h3HCHuiUxBfExqH39siojsAD58awr0wmXITxnUIhtiwwg5H+7aOYbrMH58TtVOTyDHIGk=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLeUF1wZRM4B4DUz4DbGzDx2fxmzf2C0jmIKGWKzGMaCvMbuE2K
	0KHj0y+8FWJ5RqkI8+SyWlzmFxYurpcrX39D6YiXIO+yrUdnx6A5b8Wy9taHh5hVbta+4PhIjDO
	2yVE++sIognNrzRdUg86ZGPbMVugLdus=
X-Gm-Gg: AYBFou0LGhnMVDMccF4q9McBoklJhRE6Xs9RJpEypNbWZuZ1bkT/m6QSgrOXhYgSJXm
	GdiSBxLfwtkX8TyAYATepePoAQPSQAqT4kKWYHmBBEpAdTKW0vt3zI5JZFzrAiOe96/n//s6/wr
	ZZprH2z6wnFn4XKQnn7SNFO9nRVIfRuIlyOFlngbA227FxiwPFK8fr2KRxJSmdgroVuPlLvoHSH
	7z/9ESWQZ3zz30dEJNYVPubGUn3yxzLxNgzSie8LtheeMd/cGMCvNurQjuk8Od77SOrNbTMZGTu
	fNCSHP5Ua8sSxMBgWTp8Cv2M3uwi0Ao9elLNQbRhi+3+xNQYg9DetK5QrENKzR2TyE/yMFy/MvG
	FOGRdG/YsQuFjANVcIzF6u5hszOr/6cd2ejpzSojxb5hH+02dgq3PKGrqDDGZhnsYFhZRqqISct
	rQ
X-Received: by 2002:a05:6a00:3316:b0:880:f278:6af1 with SMTP id
 d2e1a72fcca58-8a04a44afe5mr5370952b3a.7.1792427013773; Mon, 19 Oct 2026
 09:23:33 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com> <CAHS8izP4qMy9MFxVrRAZR0sec-XmkuxShrPTe2XNvHSKdQh-ng@mail.gmail.com>
In-Reply-To: <CAHS8izP4qMy9MFxVrRAZR0sec-XmkuxShrPTe2XNvHSKdQh-ng@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 19 Oct 2026 12:22:52 -0400
X-Gm-Features: AclHuK9ZHv_xyJSLtrCr1JvpLx2mRNJEtxy6hgM41LaZO6bj4mAjFn_L38w5UDA
Message-ID: <CAF=yD-JORWYaYZ5YvpXg46vxCPLoceh3AADe0XKD-P+rpZT5zw@mail.gmail.com>
Subject: Re: [PATCH net-next 14/15] net/tls: don't BUG() on leftover length in __skb_nsg()
To: Mina Almasry <almasrymina@google.com>
Cc: Josef Bacik <josef@toxicpanda.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1792427015-1BED69EA-D530D80E/0/0
X-purgate-type: clean
X-purgate-size: 1814
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 11:13=E2=80=AFAM Mina Almasry <almasrymina@google.c=
om> wrote:
>
> On Mon, Oct 19, 2026 at 6:51=E2=80=AFAM Josef Bacik <josef@toxicpanda.com=
> wrote:
> >
> > __skb_nsg() counts the scatterlist entries for a range of an skb with a
> > copy of the __skb_to_sgvec() walk, including its BUG_ON(len) when the
> > skb runs out before the range does.  tls_decrypt_sg() calls it on the
> > same range it then passes to skb_to_sgvec(), so a bad range would BUG()
> > here before it got to skb_to_sgvec()'s error return.
> >
> > __skb_nsg() already returns -EMSGSIZE for a frag_list nested too deep,
> > and tls_decrypt_sg() fails the record on any return below 1.  Return
> > -EINVAL for the leftover length too, with a DEBUG_NET_WARN_ON_ONCE() fo=
r
> > debug kernels.
> >
> > Assisted-by: LLM
> > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > ---
> >  net/tls/tls_sw.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> > index 312e51270f29..1c578ea47a1b 100644
> > --- a/net/tls/tls_sw.c
> > +++ b/net/tls/tls_sw.c
> > @@ -142,7 +142,10 @@ static int __skb_nsg(struct sk_buff *skb, int offs=
et, int len,
> >                          start =3D end;
> >                  }
> >          }
> > -        BUG_ON(len);
> > +       if (unlikely(len)) {
> > +               DEBUG_NET_WARN_ON_ONCE(1);
> > +               return -EINVAL;
> > +       }
>
> Ugh, why DEBUG_NET_WARN...? Seems WARN_ON_ONCE() is more appropriate,
> after all we're downgrading from a BUG_ON(). Another nice thing is
> that it could have been done inline:

Because that still triggers on systems with panic_on_warn. See also

https://lore.kernel.org/all/willemdebruijn.kernel.140f4eac91ab3@gmail.com/

