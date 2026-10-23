Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB65E606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=YJdEIuzH
Received: from list by lists.xenproject.org with outflank-mailman.1459377.1671320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKGOo-0004lK-OM; Fri, 23 Oct 2026 14:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459377.1671320; Fri, 23 Oct 2026 14:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKGOo-0004lD-Lc; Fri, 23 Oct 2026 14:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1459377;
 Fri, 23 Oct 2026 14:37:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xKGOm-0004l7-R2
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKGOm-005xL1-7v
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 16:37:36 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb7128-2eae-0a2a0a5409dd-0a2a450a9a5c-8
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:37:36 +0200
Received: from [209.85.208.46] (helo=mail-ed1-f46.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb7130-f2d2-0a2a450a0019-d155d02e8ce6-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:37:36 +0200
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6b1b12de661so12175a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 07:37:36 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792766256; cv=none;
        d=google.com; s=arc-20260327;
        b=OfuFDZHYGvbNtbmpUaGLSHkKkWvAROh4hlZFivW9w+O/ZnYEq1DtgvrzlbRxxtmVlc
         oXmEAV4a2f47yEuwdPJQMYuHmGu5XYlf0Fi0DWTLYtllOzXW1NyOHgP5aCG79IMr2ZX+
         jq3jJmabGErAhLbRWXkIwrReDpQegJOiDQ16Ezw4xo9JO3qWIu0mHGqqnGjTsU9LX2JK
         Xcc7bw5qmFS0jSarTXKgpimyxHKMa7/aqyPElI2pdDGZ6uzfxoh1xaol3i0mB6rZB10r
         RCgjZka+q3oCRIZXvRPMWcnL1+wCSQsDGQsFOWyfj56VW6Z14ZuOhG0esjYtSkM5JHDH
         ofdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TbyyQ/cVBjURwEkpwzvfBfCIIo+L2tVbdO6SgJnUJTQ=;
        fh=SW+8ZejeTBE2+9JuXfQboCoaPlVZgeA720cesd9C3AE=;
        b=Xz7nm5S94qyjf3r5XXyK8uCJhNLZS1k5rRgF5TtjG8Syamo8PkVAmBQKvkj9J7ucGI
         Hww1K8bE649duhf97M9TYgmgO0p2XwAkw8KOZp8CfxwX92FWyMTtmZ270fvPeKiC0zKr
         qovE1QCGvCi93rfbJPxywUf38d/T+KGjyb5pRFcl23mKb77xd5bcNS/QZvJuJk4tWR0I
         rkgmzponD1kSOLYfz95qvuNlcgJurQXqtSap9vZ5JfuYG3qXkKqzXDtPxf9q7GaolxMc
         pG/nxWoRMLW3cqjo26iO0T5zio+/PiauVjgcJ7xRIVzTciuar4dIdOGwV55ZiSzruvFs
         5zxA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792766256; x=1793371056; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TbyyQ/cVBjURwEkpwzvfBfCIIo+L2tVbdO6SgJnUJTQ=;
        b=YJdEIuzHXkpSMr754Gj/KLggzDhY9/AwTPVGt9k8SVu9qlTrv6PrTj+soLxCpoo599
         Z53QyDQ9DpPXJsuk6ER+fyz6b0pjipa1EedDoEWVQP/K+nK76sHSrSYX11CWfq8j5zin
         vrXY5H6SojVSSur0McTGmhHLQ6YL8iluWEESQN5B4DCYq/008VhJ40PjX2Jcv9a7R0dp
         CCel1Zl4jsVAf4cM+RTnXIxi3MXBr+vzv0n49FdL3rveRJblEWnsqn19p7sH1bJNQvpZ
         our1t4iaKLHmkv7rIrZRnCASjSmXsB74ih4xqfwcTGWAmNkYX+K9SJoE7TtRduY3ZqQH
         P5Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792766256; x=1793371056;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbyyQ/cVBjURwEkpwzvfBfCIIo+L2tVbdO6SgJnUJTQ=;
        b=s0mid5p3ffAEzKomn9qUz8+pYcxXy7Y5OkhwQ8eroXwu//+z/dFO4/SXXZY5lOc00m
         m1qVk4vKXBWdbg6KTYSSYcoLaGYG742Xq6UwB0sWehxrsigwbackU16zeSBVJ/4tC5j4
         uo5KQ6ptpK7SMlNJvTH8UJ3Pnq5BPQxHyrVw/HPdQ+OoyDZCDPiQDke9A6Uzfli5iLmv
         VPTYPIP54Eb/BQhxjLiM5jiwMBFlPdJN3YTuDxPYR9FQ6pVgMIeqa3y/Op6FwLlVOvux
         ecT2916hf16pZX+9LXJTPUBiTRNl1Rx1E0wR5Y1GWnnA1zjGq8hTj7ryyIehjNudwM2p
         wf4w==
X-Forwarded-Encrypted: i=1; AKwUvBxNzTlPGIQlN23TUm3qWbrbJwpFKFRNbMsJpd2rTxXGVp5t1iXaPE1MxfeQzTVBsm+S/4i43P8Yr4M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKBUNVzbnmRG5HzPsxso57bXgeTl4JB+1lrMheqPwNyL1dAklWw
	ESc/bjSXbuEMeed/ou4Q5qLnwIzXNaqygvSQKLhdjGXyM4gdsJaYbX1zLml2lZQ5QcGsdw/f/hJ
	Kn/8+/8UbKLzhZersNqOLWLv0jxqXV1qzVa9Sc0D+
X-Gm-Gg: AYBFou3MWXZo6hRABmcrga96Y7JghG/XjAFp/k7N4BBI6iFDJSGrY/ykMXBgApW3p9q
	/k45fVQ7KxfM10w0l4hN2rOhnWNDht5YzqGSHuyKN0uRdYHOpKI3xxyWZcQAjYAynt9Ciq2xo9Y
	xnNgPyJR5hhdygPjeLL3cpgBfp9949oa2DPls/rXnrE6AB7XZ9wiWnkdMzgrBb9jIfhAHqkjHoE
	afTR3ZAqY5t+PodUObO9rA2BmYY/MIvCKGFf6FIrkmgGWvh9ejmVmQ+6mQgKpoIUtPlZY66PAQ3
	8WEy/mnOU0TsBq22yRQpUs3Hmd4vmyFqP5eROMSsHGQ/iNRspKM3WBa9AXFOcMxnR43P34/y6Pm
	++VUHLWsXy0nOV2P0M/l8HiAdGvAu18iOJzPLUUbtnA4bmZ39Y0+L9m5NXk4I2oBXEiU=
X-Received: by 2002:aa7:d74a:0:b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b43503ae79mr48860a12.11.1792766255144; Fri, 23 Oct 2026
 07:37:35 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-3-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-3-41dbef50b9f7@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 07:37:23 -0700
X-Gm-Features: AclHuK955ZVILJAXSd5ooCPOgIzdBikAhRIkvruYzZknz6V5xNQiHJHo5To2igs
Message-ID: <CAHS8izOEYnqfNz_57u-JNiEC4OCB8MT5Gvuhi52rXkN6aQ18OQ@mail.gmail.com>
Subject: Re: [PATCH net-next 03/15] net: skbuff: fail checksum validation when
 the skb can't be checksummed
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-4011c0/1792766256-512C8CFC-46F06BE9/0/0
X-purgate-type: clean
X-purgate-size: 3641
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
> __skb_checksum_complete() verifies a received packet with
> skb_checksum(), which returns 0 when the range runs into unreadable
> frags or past the end of the skb.  0 is a valid sum, so it's treated as
> one: it adds skb->csum, the pseudo-header sum, and folds the result.
> With a sum of 0 that's csum_fold(skb->csum), which is 0 whenever the
> pseudo-header sum folds to 0xffff, so a packet whose payload was never
> checksummed is accepted, marked csum_valid, and left with a wrong
> CHECKSUM_COMPLETE value in skb->csum.
>
> __skb_checksum_complete_head() passes skb->csum in as the seed, so a
> failure there folds 0 and the packet fails validation, but only because
> skb_checksum() happened to drop the seed.
>
> Use skb_checksum_full() in both, and report a packet that can't be
> checksummed as having a bad checksum, so callers drop it the way they
> drop any other bad checksum.  Clear csum_valid, and leave skb->csum and
> ip_summed alone, since there's no full packet checksum to store.
>
> Found by the Sashiko AI review of the series that made skb_checksum()
> return 0 for a range past the end of the skb.
>
> Fixes: 20ddd0fd2fcd ("net: skbuff: don't BUG() on leftover length in skb_=
checksum() and friends")
> Link: https://lore.kernel.org/all/20261007-b4-skbuff-bug-on-v2-0-b9a5f732=
895b@toxicpanda.com/
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  net/core/skbuff.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 061c61422a38..40d2dd20d47d 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -3860,9 +3860,17 @@ EXPORT_SYMBOL(skb_crc32c);
>
>  __sum16 __skb_checksum_complete_head(struct sk_buff *skb, int len)
>  {
> +       __wsum csum =3D skb->csum;
>         __sum16 sum;
>
> -       sum =3D csum_fold(skb_checksum(skb, 0, len, skb->csum));
> +       /* If the data can't be checksummed it can't be valid either. */
> +       if (skb_checksum_full(skb, 0, len, &csum)) {
> +               if (!skb_shared(skb))
> +                       skb->csum_valid =3D 0;
> +               return (__force __sum16)1;
> +       }
> +
> +       sum =3D csum_fold(csum);
>         /* See comments in __skb_checksum_complete(). */
>         if (likely(!sum)) {
>                 if (unlikely(skb->ip_summed =3D=3D CHECKSUM_COMPLETE) &&
> @@ -3886,10 +3894,17 @@ EXPORT_SYMBOL(__skb_checksum_complete_head);
>   */
>  __sum16 __skb_checksum_complete(struct sk_buff *skb)
>  {
> -       __wsum csum;
> +       __wsum csum =3D 0;
>         __sum16 sum;
>
> -       csum =3D skb_checksum(skb, 0, skb->len, 0);
> +       /* If the data can't be checksummed it can't be valid either.  Le=
ave
> +        * skb->csum alone, it's not a full packet checksum.
> +        */
> +       if (skb_checksum_full(skb, 0, skb->len, &csum)) {
> +               if (!skb_shared(skb))
> +                       skb->csum_valid =3D 0;
> +               return (__force __sum16)1;
> +       }

I think maybe we need to be careful here which are all the skb flags
that we need to touch to indicate that the checksum failed.

My LLM is recommending:

        if (!skb_shared(skb)) {
            skb->ip_summed =3D CHECKSUM_NONE;
            skb->csum_complete_sw =3D 0;
            skb->csum_valid =3D 0;
        }

Seems ip_summed =3D *_NONE was caught elsewhere, but also maybe
csum_complete_sw=3D0 makes sense.

--=20
Thanks,
Mina

