Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0069606AFAD
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ENMuMszr
Received: from list by lists.xenproject.org with outflank-mailman.1454516.1668127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIprn-0006aC-J2; Mon, 19 Oct 2026 16:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454516.1668127; Mon, 19 Oct 2026 16:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIprn-0006a2-D5; Mon, 19 Oct 2026 16:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1454516;
 Mon, 19 Oct 2026 15:13:06 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xIp2w-0005t3-RI
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 15:13:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIp2w-00Ensd-7t
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 17:13:06 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6ad63382-bab6-0a2a0a5309dd-0a2a4502bb6e-0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 17:13:06 +0200
Received: from [209.85.208.52] (helo=mail-ed1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6ad63382-6ca4-0a2a45020019-d155d03490c0-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 17:13:06 +0200
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa36fc0eso17968a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 08:13:06 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792422786; cv=none;
        d=google.com; s=arc-20260327;
        b=oD0+etEaXy/sl5TrFDPZIG/8u1LWOq6l8ZLg6+yvGc8dSk2i/jhfPsc/cxT9NfZgVJ
         c7tFRPDtvq4Acq1/bvTUR0LqNQhZPg98dPW5I9urvjsLhX/tpdpeND3e8zzpjbywavZr
         jGDuDr0jXM/VL46dNly9tQpHZfvQW5xxfUrNJUOp4ePKfw+Z4/dsXJ12QbnVzwHYMgoW
         gY1w6tumQcW/ljUxMrGj+IdvOLkIUIinh8WyCQlzKFbnuJToZvNH3Vvn4IGey4/IsHLo
         5GO5u4+CDfXqHDGIKfdY9XJjNDGqg0yzu6LyJ1EeyyXXfIKKQAGhpLQz4JlIuOJbLk85
         SCNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/p9kG3mVIwDhglO8V3Ucme+ROyhYkCFN2qn2+pS+V4w=;
        fh=zXfrAGZcPAH1H+H6X6WdpvYLADKlg3K8IW6L8vxQKSk=;
        b=ia6rHut/lA6t0/AAFvXFRG9rTcd+nAa1rdzNoDs3Y2Mym0E8hMI2nswgwChq54E6ka
         8AZZecm3aKNM2mpZTrb5FHHBR1152NC+2oCJ0cbelkBwMVuO+xW4aWcq5ZdVkqHCkgCt
         cdrO1e+BvRMtVQbhqwLL5lfqp+IbfGyFJSTwk7YCMENiAOegkN62BMIn5i+L+Chsw0ZZ
         aYeVATVMrBiTIN4NboOWlJ1iFKSwfPmwKTbmE+sU2pJs1KcTYUvySZU6trl3rX9GQZks
         t88xWj6MVEyrQ0T+R6qvWNq1v8M3nL3DzwW+yDFuXugeyeI5bJNNXNtIi1iE3aGoL+eH
         I5eg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792422786; x=1793027586; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/p9kG3mVIwDhglO8V3Ucme+ROyhYkCFN2qn2+pS+V4w=;
        b=ENMuMszr6rbPuzvDP6sXtX7rLWX8n8RLMEUqaFIIsD7dcPi1TGBkRln65As7DCK9sF
         j1HBTXticshUNsIBvVE+/XRzIlQVC3rxqxIUkQjwk+OnWqHMM9WNdZQD0v3YAmi+kjhr
         vp03FNz8mRLivTkcd4ct34MCf6acdmg7OznKiA9TEPtRaFZwey9MJzzu0htlbxERqUDI
         nNV3iv4XUAElQw9wY6tlP9w6G9Of9YVAOFXzT/hyQaUfHCR8j0LoIA/p5YjeX7eEjA9f
         I1ddoRn160ISjXnpFmadmvDbaf4mw+EGdoX4/vB+SmGHvFu1dkKgrkY7e+DdMxcfR3mM
         qU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792422786; x=1793027586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p9kG3mVIwDhglO8V3Ucme+ROyhYkCFN2qn2+pS+V4w=;
        b=tIrGlUm81LUcvbH4juEouUDWwX/pj/3BZcnXWZsQodyiaDe3rFCGGYJMYIm3WxKv/J
         nVl755O+ffwSHo+dlE3VsL5owUHvGLc4iZSJJM6nRFZin2V1CF8Xh+AjawwAgoasUUH+
         WVIN/KM83ZEd9E2brlM2B1kfLsiMT4W0Q9LDnB08S3piv0gh5h3mFYHA4Fhh1gDHC6qM
         g4D7Zxapr5DtgYg0NQfZ1K1mnAPUgJgwFcIWEM50t3Dckq2VZs2BqrorOgTuMHh7f6XJ
         6che/zGQZkK6QBdnijybtFR9k2s/f7hDBQmppwY5evfw0gHX0618QF3cstf2agsqgKEY
         jwSA==
X-Forwarded-Encrypted: i=1; AKwUvBwdUbrbT5DYttDfZg3hUh921SKFpBX84zQbTrbO8QbncvoF31VswW/rdGZ1po+BiqWhPDGTH3/YBIo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLpAynQ+3gy8BjI+L1Ceu/SGUXtTuU8uXE5y5wqPoo8EZ4gqYMs
	hbB3RmmdAzn2pziJjfa+aWuBEA8eK5o8IT1sa6zEcLsPSKo6qbIAqCIHwLPetaDutRlFfVaszkV
	nV0dwmyAgI08y5+jexYp2KaMEFJiM2/+dyj+v9rqD
X-Gm-Gg: AYBFou0XpgGaGtNctLNKdHVt3k629YlsP8ZrlT2xLQKZ5b9toZiYWK7LtBKJ2QpcSOu
	WEG59Yk+ZL2ORcklJyZP73t4jZ71lP2XTnl4l+VdKL2bZBOK/W9ZGx+uV/v1BqAU9RLTYC7Xq4p
	eXkMb6vrvYC4WOB7xfkN+QcW2EWHovZA9sNLUWoo8ssRIwGp52/DoAe6UHTnfdZhbDUusc4WaUh
	fFD/wAT/Jd2FMYh4UCypc2H5W/HEFEnnYO7tRGFMyFcnJQ7QcwVrsk8Uj+DMpJSRHW3JZgvX/9s
	szIe7+KRAPwaL6gAUv50gFXuqalGf3jI/SihZM2PmmsEcljTYGDa4yKll4XJqf9B3vI3xIP2UYB
	d5U2aeKYmqPBviHQfZ2fq
X-Received: by 2002:a05:6402:a550:10b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b3ae3367f7mr84098a12.8.1792422784990; Mon, 19 Oct 2026
 08:13:04 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-14-41dbef50b9f7@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 19 Oct 2026 08:12:53 -0700
X-Gm-Features: AclHuK9fMz77o2Ok6xnWRqmNEA6022u8uZTWFFEyJX4uvm-C0Gim7Z2E1QlIWY0
Message-ID: <CAHS8izP4qMy9MFxVrRAZR0sec-XmkuxShrPTe2XNvHSKdQh-ng@mail.gmail.com>
Subject: Re: [PATCH net-next 14/15] net/tls: don't BUG() on leftover length in __skb_nsg()
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1792422786-F02992AC-C7AFC2E9/0/0
X-purgate-type: clean
X-purgate-size: 1668
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 6:51=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> __skb_nsg() counts the scatterlist entries for a range of an skb with a
> copy of the __skb_to_sgvec() walk, including its BUG_ON(len) when the
> skb runs out before the range does.  tls_decrypt_sg() calls it on the
> same range it then passes to skb_to_sgvec(), so a bad range would BUG()
> here before it got to skb_to_sgvec()'s error return.
>
> __skb_nsg() already returns -EMSGSIZE for a frag_list nested too deep,
> and tls_decrypt_sg() fails the record on any return below 1.  Return
> -EINVAL for the leftover length too, with a DEBUG_NET_WARN_ON_ONCE() for
> debug kernels.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  net/tls/tls_sw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/net/tls/tls_sw.c b/net/tls/tls_sw.c
> index 312e51270f29..1c578ea47a1b 100644
> --- a/net/tls/tls_sw.c
> +++ b/net/tls/tls_sw.c
> @@ -142,7 +142,10 @@ static int __skb_nsg(struct sk_buff *skb, int offset=
, int len,
>                          start =3D end;
>                  }
>          }
> -        BUG_ON(len);
> +       if (unlikely(len)) {
> +               DEBUG_NET_WARN_ON_ONCE(1);
> +               return -EINVAL;
> +       }

Ugh, why DEBUG_NET_WARN...? Seems WARN_ON_ONCE() is more appropriate,
after all we're downgrading from a BUG_ON(). Another nice thing is
that it could have been done inline:

if (unlikely(WARN_ON_ONCE(len)))
  return -EINVAL;

But I suppose it doesn't matter much

Acked-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina

