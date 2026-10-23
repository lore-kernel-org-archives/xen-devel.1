Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919AC606A31D
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 14:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=jO+u3Vyf
Received: from list by lists.xenproject.org with outflank-mailman.1459318.1671283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFqA-0007CU-Gh; Fri, 23 Oct 2026 14:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1459318.1671283; Fri, 23 Oct 2026 14:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xKFqA-0007CM-Cq; Fri, 23 Oct 2026 14:01:50 +0000
Received: by outflank-mailman (input) for mailman id 1459318;
 Fri, 23 Oct 2026 14:01:49 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xKFq9-0007CG-Gg
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 14:01:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xKFq8-00FQCg-Ml
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 16:01:48 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb68c9-bab6-0a2a0a5309dd-0a2a450bee26-10
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:01:48 +0200
Received: from [74.125.82.47] (helo=mail-dl1-f47.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6adb68cb-b7e8-0a2a450b0019-4a7d522f8dd7-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 16:01:48 +0200
Received: by mail-dl1-f47.google.com with SMTP id
 a92af1059eb24-150ef97e790so6553c88.1
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 07:01:48 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792764106; cv=none;
        d=google.com; s=arc-20260327;
        b=EVjj2+Pso3r5G8ZLOwDqJOZeYXOpatPRRVXp7XWqoPPIJeMHpihQlor8k+lAa7miAX
         T5zsyrwdHZi2cypOwdfgPk2WQYnQnBxkSveQ3X+bgBKfSDxTTN8nsQOYXna7eBCABTQ2
         m56cy6whtNkNyY4XXmTLZvR0YupreuVAcRt4wmraeUG9kN9rkKGxcyXN8VZ33qvBJ/30
         r4n5uCz7aICXYFi4qmWv4eBFg9cp8FNMQOQ/jbJrQqfXiLnzqcx1j8pqpv9vV+Afq5X5
         G/gWHKjFgA5RSGvbr6nf87EMjBSdR0AKTVaIBL8yGVswi1f5bS0kh+X4Kr2puoeHhaD/
         FjmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AZ5unzVtyr6CfHrWvwZoGwosTQWFch4ButYqGt7D1j8=;
        fh=CdJwY7vLhaFeJUBnTIHxDpUghPGlWfwnlZvJ6LkRZqE=;
        b=V7GD+emnK1hEjXVqAMaFNKgzqiNU8/zRNVO4bHeYJFmSaXteEHXk8fPbzjR2Og29Ya
         NLc15IvBd8SRffm82iXTYr56c747I7zjXHg2R7wGhuuJf+wfngHuyY8/2jmppLrRaSqe
         lldSkKlxFZsLy9DDLrdXXclX05upNvYW88bzxzJDvlud0GCT1iYtUGRlfYZSV7Dq0Z8B
         JbL/y66Ab98uKfHfW1Xal5dQzbHfZl132434u16qJDMvs+KsQJQI02b6buJM6US8kOkF
         6xpcghDoxMiRgG5Lf/kg1ELqKPCOggub6DUok6mFdTSXZSimXIH+sYKXh33aprKMqrga
         ylxA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792764106; x=1793368906; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZ5unzVtyr6CfHrWvwZoGwosTQWFch4ButYqGt7D1j8=;
        b=jO+u3VyfKQAvwpo9Vx8oDxA6slD0fpgjPZNVGJeV2caiGysWf4ugIfYIe5eyz53GEq
         NShww1G3w7mgZ0hoPoBfw3/gK7eYb8VtFBB+V/Z+RaOvgjLz4AT59g5U+7mgjHFKysYA
         Gu+eAZA9GJTkj1aUo/6JBQsHPLL4dMCWRBijiOoufaTA+Ax6kbaJKWTYDZ8H1AOHGSrU
         dBfGN0En8EShcZ2lFzlF9AvZ0CD+p8Z4KS4sG8RcldNOq51xYhoCqecEG98QBlrqI3Qm
         EHyd1J3m66QlCIbf11jHOyMYsutTImtTKjjWs320qT+PEkpKYBr49iKJTq33EkJaESrV
         z45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792764106; x=1793368906;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZ5unzVtyr6CfHrWvwZoGwosTQWFch4ButYqGt7D1j8=;
        b=UH5Kf80sYPduAyxBdcqCDfZKlpYpWx7EhuYvy939X63XKe3s4lbpXppI6dSBQvjy8A
         dc6YUsAARMgiMbG7sVaLEfgAoQt25yJAxWXaip5ukDrT/GArJ3ERU32/GE/72GbCZTS5
         +eY1iYsL2SiJOGEawGdr2WGEHODbDIhFsRWchBUocRl4ylm+AqrQq+4uRRg8Qgj7DYT1
         BYf1R+egg2qSqbpRRShVFs3oP0/jF3dXPHLiFzVJ+3LEJPt4DL/bPnfstPMt9D+ktPWI
         yLJxjydFrwGoozb/Vd89XVdIIOilU2nB42tWofRtUQ/Baq4Lv5H3PNGVVoDO4ZS2D1QI
         B32g==
X-Forwarded-Encrypted: i=1; AKwUvBzygxUgHBLtoeZpamWPae4+Plp+tcwseZ8dxe1naJIAP60XSvuhgLQt7CJvUIWF0uc33vbEuWeHtEQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLH+y0Tva+887+p3cyjh44mNraOZ9MH2hZHs/96k3y+MRYDZfZz
	YhKSrNAzQLY+k1gjreUgpctMuNUMF2DNNp3BErstshlertcQu2/IDeFGETGnKAPUrRUYixa79Vx
	bjkbCgs+TqDQSoATsRNr4sU+qtHPFaQynKOP7Js3b
X-Gm-Gg: AYBFou1zJdVTPVwJAdL7iXHT8M9f2PESRZuKgWX3CD3E0cYP3Zb75507tfWwzb/YbYO
	7ssiTJ0I2VNMDj0vwFkjs2/J13xI0vYgCV4QBvcE94ZAT/dowz9sLrO4LnQFFXnGi08kvjz+fci
	gEc5za6vdlspTKCrGAoI8Mzfzy7HRbm5KSdUDTy44eRfvnu0YM/nI7syIJxSHo/l07D5tpyRx66
	RhZeedGw9uowlPNwT0hJBr7iU0Dafeo663BRrKi8fagcqPyLgrxejyvXrQkVZuhSryjif7pKuCS
	8g3/8Z9pQJJlOH8G2+QJAoO4uJbDDOS39JU4ehtvLC9z5+uqfrVEZe+Az+Te4+6zzJLRyXoWt+R
	FjCE8r5QCfRuxZ0wnAWrrIMv5CzytRoAY1jbdgNOOogPWtCO0QxKBFt2vYVCgRQeNoERz
X-Received: by 2002:a05:701b:4189:20b0:186:2ed4:45e1 with SMTP id
 a92af1059eb24-195f75291c4mr269263c88.7.1792764104890; Fri, 23 Oct 2026
 07:01:44 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-skbuff-bug-on-followups-v1-0-41dbef50b9f7@toxicpanda.com>
 <20261019-b4-skbuff-bug-on-followups-v1-2-41dbef50b9f7@toxicpanda.com>
In-Reply-To: <20261019-b4-skbuff-bug-on-followups-v1-2-41dbef50b9f7@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 23 Oct 2026 07:01:30 -0700
X-Gm-Features: AclHuK_0I1BOQb_enDLqQZci6PJ1fSRcgVvjvJoI-HqZD9AWV_ZZ1S_9BLYGvcw
Message-ID: <CAHS8izMH4KHksqAYfo6csvhZx5ja+ghmfK07=PQAcF0Uzk940w@mail.gmail.com>
Subject: Re: [PATCH net-next 02/15] net: skbuff: add skb_checksum_full() that
 reports failure
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1792764108-AA0C59EA-C1AA57B6/0/0
X-purgate-type: clean
X-purgate-size: 4052
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 6:50=E2=80=AFAM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> skb_checksum() can't fail.  When the range runs into unreadable frags
> or past the end of the skb it returns 0, which is also a valid
> checksum, so its callers can't tell the sum from a failure.  For the
> receive-side validation helpers that means a packet whose payload was
> never checksummed can pass, and commit 20ddd0fd2fcd ("net: skbuff:
> don't BUG() on leftover length in skb_checksum() and friends") made the
> past-the-end case one of those instead of a BUG().
>
> Add skb_checksum_full(), which adds the range's sum to *@csump and
> returns 0, or returns -EFAULT for unreadable frags or a range past the
> end of the skb, and -EINVAL for a negative length, leaving *@csump
> alone.  It's __must_check so a caller can't ignore the failure, and it
> recurses into frag_list members through itself so a failure there
> isn't lost either.
>
> skb_checksum() becomes a wrapper around it that behaves as before for
> the callers that haven't been converted: it returns 0 on failure and
> warns once if that was because of unreadable frags.  The following
> patches convert the core users, and the rest will follow per subsystem.
>

Is it possible to stop sending 1 large series where some patches are
related and some patches are not? Are the changes for segmentation in
this series related to checksumming?

> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> ---
>  include/linux/skbuff.h |  2 ++
>  net/core/skbuff.c      | 56 +++++++++++++++++++++++++++++++++++++++++---=
------
>  2 files changed, 48 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 09db32f70b53..969b1c3269ec 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -4279,6 +4279,8 @@ int skb_copy_bits(const struct sk_buff *skb, int of=
fset, void *to, int len);
>  int skb_store_bits(struct sk_buff *skb, int offset, const void *from, in=
t len);
>  int __must_check skb_copy_and_csum_bits(const struct sk_buff *skb, int o=
ffset,
>                                         u8 *to, int len, __wsum *csum);
> +int __must_check skb_checksum_full(const struct sk_buff *skb, int offset=
,
> +                                  int len, __wsum *csump);
>  int skb_splice_bits(struct sk_buff *skb, struct sock *sk, unsigned int o=
ffset,
>                     struct pipe_inode_info *pipe, unsigned int len,
>                     unsigned int flags);
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index a2b52a5a61a9..061c61422a38 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -3545,12 +3545,31 @@ int skb_store_bits(struct sk_buff *skb, int offse=
t, const void *from, int len)
>  EXPORT_SYMBOL(skb_store_bits);
>
>  /* Checksum skb data. */
> -__wsum skb_checksum(const struct sk_buff *skb, int offset, int len, __ws=
um csum)
> +/**
> + *     skb_checksum_full - checksum a range of an skb
> + *     @skb: buffer to checksum
> + *     @offset: offset in @skb to start at
> + *     @len: number of bytes to checksum
> + *     @csump: the sum to add to; on success the range's sum is added to=
 it
> + *
> + *     Return: 0 on success, -EINVAL if @len is negative, or -EFAULT if =
@skb
> + *     has unreadable frags in the range or runs out before @len does.  =
On
> + *     failure *@csump is not changed.
> + */
> +int skb_checksum_full(const struct sk_buff *skb, int offset, int len,
> +                     __wsum *csump)
>  {
>         int start =3D skb_headlen(skb);
>         int i, copy =3D start - offset;
>         struct sk_buff *frag_iter;
> +       __wsum csum =3D *csump;

Check for reverse christmas tree.

>         int pos =3D 0;
> +       int err;
> +
> +       if (unlikely(len < 0)) {
> +               DEBUG_NET_WARN_ON_ONCE(1);
> +               return -EINVAL;
> +       }

We don't normally go for these defensive checks.

--=20
Thanks,
Mina

