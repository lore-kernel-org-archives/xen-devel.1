Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A78606A333
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 02:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dic3O/vK
Received: from list by lists.xenproject.org with outflank-mailman.1469093.1678069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4WB-0002E8-Vo; Tue, 03 Nov 2026 02:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469093.1678069; Tue, 03 Nov 2026 02:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xO4WB-0002E1-T1; Tue, 03 Nov 2026 02:44:59 +0000
Received: by outflank-mailman (input) for mailman id 1469093;
 Tue, 03 Nov 2026 02:44:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <almasrymina@google.com>) id 1xO4WB-0002Dv-Fj
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 02:44:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xO4WA-001j7I-Ss
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 03:44:58 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <almasrymina@google.com>)
 id 6ae94a71-2eae-0a2a0a5409dd-0a2a45098bb0-14
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:44:58 +0100
Received: from [209.85.208.53] (helo=mail-ed1-f53.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <almasrymina@google.com>)
 id 6ae94aaa-be1a-0a2a45090019-d155d0359007-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 03:44:58 +0100
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6b1aa36fc0eso5220a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 18:44:58 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793673898; cv=none;
        d=google.com; s=arc-20260327;
        b=MSmtkckGjT2xhwopyfKk6km5Zh6lZsVquu4WtirCMQrE+KwoQ6t9dcjB/6ryCwpdxe
         pACryxFieZ+yVwLtu+ZTnCAOmkQjh+W+HM+QB/IfpjLpKFzv9ZmBeJo7/Jj0HAfLW0Yw
         qEbEMvputhYFPUnlqTUOVBLdlan+cNLuOvSylasbzK3ss/RCu3RKb2/vq5A0IpKb4dwv
         ZRilxp0gb5g07lW3kb63iPHxwBarNIeNTNzomM5p9fTCbGyqJs0mc3/xOC4VaxgbBQRn
         84shX++eyeQZR0jC6Xc1ViFFqtC7xAi5z5atFJ7j1lO28GQ7YRQGKNeqnLKMr2DIyujz
         zpvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=89u8IRsq+x1BWnVnaXXxXmgEHUj3lM/X6xy8lftQEfg=;
        fh=B9/BLIodQZGFYGLWq1hKAuTm9BXycMn7R1ZbSwKN4y0=;
        b=j7YtjbmRuAId+wDnMenyoxPglUE8azV4Ism6PNHQXJ6g0btMPiLTtV4G5YMO2YownF
         6RqwLRdZmmFoiA+fUK0pL9INHmlJxs/Deyjv2EcJuhAT164uvUfp6izxWfrkQgVewM68
         EaFSzP4gemGHsQ3eSb0DzL92cDjKQMH4ypdLez6D3vubj38ZOJ8x5HOR5j0SrirlJTl7
         UUoEumK+NzZ/UDEwZToPeGpbPu2jVbECjT90LbD9eHMl6nzIZwymQYtJ1USpnx/wls5z
         a0iA2neOtOvW7uVdsvV/jOwnbBFN1Kq1drC2y9w0gO95otlAl9ryAS9D02PsDBxLdfpM
         wmqA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793673898; x=1794278698; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89u8IRsq+x1BWnVnaXXxXmgEHUj3lM/X6xy8lftQEfg=;
        b=dic3O/vKtmGdd90aOyYYRse7DV4aovwMCEff9H9fGJGYlDHYmVwgUFVHteNemv0Qzq
         2uwrjNKq8ajnO0Q3QzzNZe1urNAIOA9tnu6m6LpnxKlI5l59dL7dj9pdcLKxGnL/j2iH
         JEOJGyTT3MFBo0g/fqAh4zHhNCV5m3jNb4gLecwB8XG57mecHqe0SwTA+Mv3IerlQbyo
         sPXPDSOwp6JSAiv8uA/sGFvKytb42A3LHNgc3TSo7ooG4bX2AVVqeXaM7fk0UVsusH0m
         04mx5AG09jo1xhZCdMU/VgLo7jGt0NlnnND1DUwEGs+EM3SMQbnvmMfyBtMjvdGDfk5r
         2dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793673898; x=1794278698;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89u8IRsq+x1BWnVnaXXxXmgEHUj3lM/X6xy8lftQEfg=;
        b=p80CbV80VqgZhGcitkYgTeDqOXVteBdowx/9qY1v+5GYfYmG1MYKjelEXLmemkGQBM
         fVoFURtb4OxuYCz8AeR1jn88RbDdCK7e22Wa4RckXooX17sVw1ohCywBJIQyF0Q+pFVD
         /7PDhQm+k+cYe6RVYNdnqqORfp2JIKs42FJrUNZBVGPiYq2t9mhfi+zmmhX3XXiHIXOP
         mPoX9zMhgN3Yp+rAIP35D7nUD6PhyW3u/5TzBesA1HVJQP0HOYYC/UPwFQ7UQYzudg0L
         1E74rdsSBtUW7zNAFEM7QNCdcN2xzTjsO5mbe7c2lQb+qDCkirRmz3W0BSjDNa0vE8n6
         ZZYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHsN7WCVQBRkaHjxs1ONDq0wGe0ViOxohZkpYtiF6hMKHrn/dBhpaBwYo8wIIRW2+dn6jF2Dg8/Oo=@lists.xenproject.org
X-Gm-Message-State: APuU4Z8OASh/a4/99L1Q5gtQ4551kYl8PeAUui68CpMhgSuNiuHdR+It
	C/UAxpvSn0YjzLjjT1yXonhYwuNM5Gzbqfkc1p0PAzOCWaWfCch3BbM4ScvWioIHeHNkWrPlFcW
	4SMhNcJ7sgeadpdmn9SrTiQKgBc5uCiWWg984yxsD
X-Gm-Gg: AYBFou3uBzgkyqiaDfW8jTwG1VYkBT+jIKrc/PJCBPvpLKF2gwAPtceF6l+4bGPncEo
	ipNk0O3ir76yiSnHgXOfB0Thl8d7lyM5GETYlXjU/PQU/FNNxgBU5vapkcyzukjgvn2NKZk5E2S
	pnXyr6jcEIn4C5wJRoxubSaTJQxCohHzlQ60HewO0jQHkaH8sYdSBCRX3fzkbfGu95ihJ/71DiK
	ddaWrQIwGn+g3yrFXwBO6VSWYSHnevbY0RmmtGOL86/zxjo5bbxAupCB9fwLpjaqJOGPGErFDW6
	k56zNgKSO1LUcakzWKOj3l8lZDXiSiyC3Ov6QaPg6mM5KyujEFN9BC9ximLTaAlg/4KEazAS8ov
	jlSEFbMuicRMQp0dmjcuOx7YefVS0DQUT7x+CBuc=
X-Received: by 2002:a05:6402:c503:10b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b53e77d7dfmr15648a12.8.1793673897842; Mon, 02 Nov 2026
 18:44:57 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-b4-skbuff-bug-on-followups-v3-0-54ad0ab57614@toxicpanda.com>
 <20261103-b4-skbuff-bug-on-followups-v3-2-54ad0ab57614@toxicpanda.com>
In-Reply-To: <20261103-b4-skbuff-bug-on-followups-v3-2-54ad0ab57614@toxicpanda.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 18:44:46 -0800
X-Gm-Features: AclHuK_1VZQHRWxizHvXi3YYj2JpXFP0z-SUn-xp8uKayImpXDLfb9CCDHak1Q4
Message-ID: <CAHS8izMK8nrYny_jc-aTbjwP8tsDkY0a1ed7F=GfwzfXWm8o=A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 02/15] net: skbuff: add skb_checksum_full()
 that reports failure
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1793673898-FCA16034-4C319E61/0/0
X-purgate-type: clean
X-purgate-size: 983
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 6:28=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> skb_checksum() can't fail.  When the range runs into unreadable frags or
> past the end of the skb, skb_checksum() returns 0, which is also a valid
> checksum, so its callers can't tell a sum from a failure.
>
> Add skb_checksum_full(), which adds the range's sum to *@csump and
> returns 0.  On failure it leaves *@csump alone and returns -EFAULT, or
> -EINVAL for a negative length.  It is __must_check.  Its frag_list loop
> sits in a noinline function so that taking the address of a local
> doesn't give skb_checksum_full() a stack protector.
>
> skb_checksum() becomes a wrapper for the callers that aren't converted
> yet, and still returns 0 on failure.  Three things change for them:
>

Hmm, but do we really want this intermediate state where skb_checksum
and skb_checksum_full exist? Why not fix it in one go rather than
little by little?


--=20
Thanks,
Mina

