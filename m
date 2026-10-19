Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83588606AAD8
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=P2GlWHT7
Received: from list by lists.xenproject.org with outflank-mailman.1454581.1668148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqD8-00035B-EK; Mon, 19 Oct 2026 16:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454581.1668148; Mon, 19 Oct 2026 16:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIqD8-000354-BQ; Mon, 19 Oct 2026 16:27:42 +0000
Received: by outflank-mailman (input) for mailman id 1454581;
 Mon, 19 Oct 2026 16:27:40 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xIqD6-00034w-PT
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 16:27:40 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIqD5-003tTm-Uk
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 18:27:39 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6ad644e5-bab6-0a2a0a5309dd-0a2a45099ba4-16
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:27:39 +0200
Received: from [209.85.208.49] (helo=mail-ed1-f49.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6ad644fb-be1a-0a2a45090019-d155d0319154-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 18:27:39 +0200
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-6afac79b3a3so17007a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 09:27:39 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792427259; cv=none;
        d=google.com; s=arc-20260327;
        b=cdrWEL0DacxN36iZehZzgosNWLLpVWvwUXp7yPNKc/U9B2KTGdWB1YGFbMOJb8mi++
         g0G1yWeLcNMxW/yiOhZOAI6dGEW+ep9AEa08WPtBQGmO3w+JD6qUagCZ+6uMYlI5QPaq
         99L0kMYj5IsDZoD5C3cuovS+bu8S7+W+Kt6V5nVY23IQSySbyiw2EfTs+0uOCST4gn7d
         XW972dvW8L6yFzlDT4hqLumOm8A0PgA3hqu//11fPWEF1WDUAtpRA/EQZz1SJqYYso3l
         a1VO4LdefeMkduJoFjUS2j9OJ8G2yFJU/5cmNbB/wjxjTbeezgaLjMKL40oeRRu0iiLu
         xsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jvYDp8Hgj7nrDsJX6hOppStmzsVdbwBuZBD84+051RI=;
        fh=lkB1jETwqzF5ls4xj6Ut4H3anCNEvkrGVOdtIp6ydo8=;
        b=HqpTBeQ8EiIacWF3aLmoAu2Jct5dA68H5koZ/MsACoay/GHrQFmAmAyn9Q4RPIpWbL
         BjeS5+7WWY4ncqkwDA7nzSP0B/t0vkeZlDMkSzaitKynGZzYlkwm7KuU7SGKAG7ldkCD
         EpFaA9FM5a/wcn0uTYhHS4PgGfxgDO52K5ITeH0F1NBw+R5Gjw/11mhag5BG1zehRtpt
         DMRhBoIBmzG6OqF5bgoXMtAO7OQJbF00DlVM8C+IorcJID9KFO1bCngKjiY2HUAkATco
         2cbU5LyvwP6gELLSBlv5vSO91ikZBjKyYO/Ysrs4lDUpFZbOL+XvjeQkXc9hvhvBAf4Q
         AVTw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792427259; x=1793032059; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jvYDp8Hgj7nrDsJX6hOppStmzsVdbwBuZBD84+051RI=;
        b=P2GlWHT7kwG0aSG/PlyJ/TYQl575swW4i402sAK7964pxSIvlY12+uQJ/Gf3XPTKy2
         zb7fcOTio21pOvr2CWR1t85YyZyNR8+ioRuN3K4iqNXrBqQa97i5lIa475bd75n6OrHK
         +yjnvIVMcP0ohx3oCctbUrhsVaiFXQyVO+nZqjq5RwFO57BuV5r3DDi1eaVrCBseNUxK
         t7uRcq9Bh4OpzaE/yyhaDKlgrbiP2XxcVZ5K1IlXXKBSRiiDFP6hmtSMEKdVUtMJbAD9
         HJJXy1fWSXCMXsVRRudROCupx9rIOojP3MuJHF2UnPP3HJ7IEypWA0PCSUmVFCl2dn7k
         zfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792427259; x=1793032059;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jvYDp8Hgj7nrDsJX6hOppStmzsVdbwBuZBD84+051RI=;
        b=JzvmzvUBcEmn1USiuXGBMsjKJcP+aETtkJS/qoUdAy1mZ/WRtXQ7x2mPnUMt57XFpZ
         nSQQlGqPOFtBRVZAW+JKOtQVbDR2w7jcqOOWSoOLsV96Cp8ylj+hKwEn/O0Uk8nLsOd1
         V5T4JKT2yDr7KRZJza8clJctrAYTsPJDy0xXfVuENGqAc+Ku9gWGIw7M9r/4+fME+CCi
         aPsKQu7nRU6Q07SVWZ2j8ySJht/QIw7KOUfFtzFqSPPAeojGnJ8D3ukJoo2KUNKPbHiH
         MxGSrzmo1ZnIffWcaZPaLMFDo7Blwux4VrrX7PFDLt4hisvGVXVZrfFZRBL4ZeAofNNS
         24XA==
X-Forwarded-Encrypted: i=1; AKwUvBzRk4Lek3XtuJZ8mpvG23mu4QroaWQLUiJyo5dd6GDYkr+R0vSREiDXZCpYLhnGLdi7TL+4EHNGwFQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKhE7pUoUEPz8dZDIUTMzmGhimIH3xJqkUO9JFESKwCPCTWZO/d
	z3KWKrBcZ/GILtKDvQpL9OHeQPO7DUZMC6AfVapLGsR2QA5sYX5eAJEfK1MdHjIMiiHhG3y7TQr
	aWI2ZbrCMwzOT4r4fxjZSbMGuHP38R+7cXele/j2E
X-Gm-Gg: AYBFou33ZUH5RuDy8imZAu+9Xjk6yVH2RYi1QO4xyO1i6uEkqIOBKImORyypjZfggEF
	4/RDtnXiYS+vPnKkuW8AEVcfZHn6oWgHBy/cv43h8uRTcP/QtWKgauwclCqETNxR7w6RecQwZMj
	k2ROaNOpi+BUAE5/FKhnGBpPDRkeKyQUjIt0joGeP4CsastGPM3860MKqA20leWj0eFwTFkU4nm
	ka2jFCQDyZG5Y4nZeStRHTuxPbwhtpecCmwCJRxXIfWyEO2Dx16Ose8iloBsK/VWa/s67tpe2Xs
	PCitUea3k+D1l4IPCHx2fUjAbgr8dzU6L33iXJEOAx5HxZ76tjDwYdEht0UG4OKAMCuc0u88M73
	YwN0/l2Ow+KYrqu/iDnTZ
X-Received: by 2002:a05:6402:4052:10b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b3ae336676mr18681a12.9.1792427258726; Mon, 19 Oct 2026
 09:27:38 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com>
 <CAHS8izP4qMy9MFxVrRAZR0sec-XmkuxShrPTe2XNvHSKdQh-ng@mail.gmail.com> <CAF=yD-JORWYaYZ5YvpXg46vxCPLoceh3AADe0XKD-P+rpZT5zw@mail.gmail.com>
In-Reply-To: <CAF=yD-JORWYaYZ5YvpXg46vxCPLoceh3AADe0XKD-P+rpZT5zw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 09:27:27 -0700
X-Gm-Features: AclHuK-UIC0HG6JOck2i4c0hPYtzFxPXwWW3DcSBGnG1oasbGjmvMuZRGvs17qg
Message-ID: <CAHS8izOA8S5GhPtpaD3EPWS_vBZZABrwqgd_bDKVm50VSuwS3g@mail.gmail.com>
Subject: Re: [PATCH net-next 14/15] net/tls: don't BUG() on leftover length in __skb_nsg()
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Josef Bacik <josef@toxicpanda.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1792427259-BF4D3034-69110AEC/0/0
X-purgate-type: clean
X-purgate-size: 2173
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 9:23=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:13=E2=80=AFAM Mina Almasry <almasrymina@google=
.com> wrote:
> >
> > On Mon, Oct 19, 2026 at 6:51=E2=80=AFAM Josef Bacik <josef@toxicpanda.c=
om> wrote:
> > >
> > > __skb_nsg() counts the scatterlist entries for a range of an skb with=
 a
> > > copy of the __skb_to_sgvec() walk, including its BUG_ON(len) when the
> > > skb runs out before the range does.  tls_decrypt_sg() calls it on the
> > > same range it then passes to skb_to_sgvec(), so a bad range would BUG=
()
> > > here before it got to skb_to_sgvec()'s error return.
> > >
> > > __skb_nsg() already returns -EMSGSIZE for a frag_list nested too deep=
,
> > > and tls_decrypt_sg() fails the record on any return below 1.  Return
> > > -EINVAL for the leftover length too, with a DEBUG_NET_WARN_ON_ONCE() =
for
> > > debug kernels.
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> > > ---
> > >  net/tls/tls_sw.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> > > index 312e51270f29..1c578ea47a1b 100644
> > > --- a/net/tls/tls_sw.c
> > > +++ b/net/tls/tls_sw.c
> > > @@ -142,7 +142,10 @@ static int __skb_nsg(struct sk_buff *skb, int of=
fset, int len,
> > >                          start =3D end;
> > >                  }
> > >          }
> > > -        BUG_ON(len);
> > > +       if (unlikely(len)) {
> > > +               DEBUG_NET_WARN_ON_ONCE(1);
> > > +               return -EINVAL;
> > > +       }
> >
> > Ugh, why DEBUG_NET_WARN...? Seems WARN_ON_ONCE() is more appropriate,
> > after all we're downgrading from a BUG_ON(). Another nice thing is
> > that it could have been done inline:
>
> Because that still triggers on systems with panic_on_warn. See also
>
> https://lore.kernel.org/all/willemdebruijn.kernel.140f4eac91ab3@gmail.com=
/

Heh, looks like we have the opposite instincts here and I missed the
initial conversation. DEBUG_NET_WARN_ is fine by me too. Thanks!

--=20
Thanks,
Mina

