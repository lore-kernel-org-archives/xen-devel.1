Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DBF606A31B
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 00:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=WobsS8ar
Received: from list by lists.xenproject.org with outflank-mailman.1458698.1670763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3OW-0000V8-F9; Fri, 23 Oct 2026 00:44:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458698.1670763; Fri, 23 Oct 2026 00:44:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK3OW-0000V1-C0; Fri, 23 Oct 2026 00:44:28 +0000
Received: by outflank-mailman (input) for mailman id 1458698;
 Fri, 23 Oct 2026 00:44:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <josef@toxicpanda.com>) id 1xK3OV-0000Ut-TU
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 00:44:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK3OV-004MI4-AP
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 02:44:27 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6adaadd5-8faa-0a2a0a5109dd-0a2a4504d262-24
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 02:44:27 +0200
Received: from [209.85.219.42] (helo=mail-qv1-f42.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <josef@toxicpanda.com>)
 id 6adaade9-b57f-0a2a45040019-d155db2abc71-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 02:44:26 +0200
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-917a707f37eso5035466d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 17:44:26 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.242])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93f70e81a80sm54979785a.1.2026.10.22.17.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 17:44:24 -0700 (PDT)
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
        d=toxicpanda.com; s=google; t=1792716265; x=1793321065; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jfhyo87AY7L5DeyPwopI2784pYBnvPIRPDiBBG8hjuE=;
        b=WobsS8arxF3f2eMWACVmf/O2A5CIlrxwYk/OFkFn+eFVBzpFfEhxAA9FzA25kxQ24T
         WJe49AyjK/DPWhpAEDSw6MtpxwoO4o7qoQb5iwPo/APakJDLSaDxOGZK6PXnozfpBf2H
         +AaSU1eJxLFMrg2wxER3zpQkvo6pdOtRaDlQwJdW8shLUK7Mzza/5cnYWYou53/q0BuO
         +sV5cauGHOwhdA5n9+UTj3HgyD+7S7GQeoH5Qxn5fLch/WW2JkA2paENxTms4G/E0jFl
         zagwoEBSJlrfU2xj7bP1mek0wcZxA20BB5IGm0VOJ5XDEFidixk0A2F/BNlZXmZJ20Re
         Bt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792716265; x=1793321065;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfhyo87AY7L5DeyPwopI2784pYBnvPIRPDiBBG8hjuE=;
        b=ZuhWgaU+sgcpTZ4KHkztAvCY7GDfe83cpTffj4NZD7qgnH1wryFmsZHQwqzreAix6y
         IU2EirUcthXU3+Ke49KxuSxyUtaS0/rRuKp0gFsg1KXYnyDJOmUu/Ni8lc5PfcrJMWCg
         wLiRpoTaeKDsPkTYRtKV+CImEWOrBiMCLeYpq0JnzQF1afl6fd6oRxY4berzgbcSCzga
         Nw8vUZfQRXXotEp5rsphkqcHieylYPCc1lJvSpSzJbrtwhkhvbshgHWKHPfcNeWOPY7k
         t1x8b4/5uQ6Z17LDCkRqNDvauBFSCNyfg9CDPNTGrBYFt7Nb/8r3Ysf2DScmwn1MRF0W
         GY8A==
X-Forwarded-Encrypted: i=1; AKwUvByAHYPhJPzTH21/fvOEeeiAl81j7i2DJRxJk/8c92/bpH/cX6gaCSKe7CpOaDTvMM+FuwRNgL+MCe0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLtTu620WJYGBX1krjcDKPF9AonOHy0tQMGU8SP+H2d5haudWob
	2ybNVgp486z7Z1CG/RRHK69kxB8q3HB3mHC3DODauU54dO1pOj9LMeQZrhvfAK6QXZM=
X-Gm-Gg: AYBFou0itgyL1weZFeAki1eh3erlvSMer2JW2pnQIwHv66+CiAJncGpN4JuHqzIIWZF
	349BmjQxkc77awPhR8G8i7PHl0QFxLjSEugSSPUTSXxLlWfIqYI9v/EYehQSb/oygnv7aje4tNw
	ewkWdSfRcbTkhLfQNdGYAO1sULmzLLb3iaHzIgyo7EmJ0ntgv8LO5fUYV8/RxitQF0c/cHYSDHH
	w4p5LahsE8JXqb2CTNWfeNTLkqczTLJyX/7bCPo4O9YVt6RFXGqetRiNO7NbTKUvT7XFKRUvpt3
	zgAP3mXj1KflbXgsxXX8SkI7rJLgq/SpKlAkEMFXOYNMpWhq3W2gNDEPB26mtlnpbkNNQAjwaGG
	+WJcy5y+EwPoSh2Zh0ZqSYbt+3PbROkfic9uULglzAzmkzIunPX36P+PBF2pdI8roj50R+/0FlX
	0afePtELELEkYjTUgtl8jLgCCP2JIAvrgRn7jGKteWtiEDNcEW9vrp30u+gXIftVo1Ce5gAdeeu
	r2RPTpe3pxxVHye1tkf2VGXLQBHiSLnGuTMo2TSdMZR9OUmI5mdWExQ1PZIsxEMm9wIE/u9meez
	1ImQsalCHdx0eQfwRg==
X-Received: by 2002:a05:620a:6188:b0:93e:a8c5:132f with SMTP id af79cd13be357-93f6f788f5cmr211153385a.29.1792716265323;
        Thu, 22 Oct 2026 17:44:25 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org,
 xen-devel@lists.xenproject.org, Willem de Bruijn <willemb@google.com>
Subject: Re: [PATCH net-next v2 11/15] net: skbuff: refuse to segment a nested frag_list
Date: Thu, 22 Oct 2026 19:58:29 +0000
Message-ID: <179269910950894.2.12425346173477603662@toxicpanda.com>
In-Reply-To: <willemdebruijn.kernel.11bad1f39601b@gmail.com>
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
 <20261021-b4-skbuff-bug-on-followups-v2-11-2aa780a03524@toxicpanda.com>
 <willemdebruijn.kernel.11bad1f39601b@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1792716267-C06DAB50-F0418DBD/0/0
X-purgate-type: clean
X-purgate-size: 2062
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:47:15PM -0400, Willem de Bruijn wrote:
> This patch became quite a bit more complex because of my request.
> More than I anticipated.
>
> Are you sure this first block is needed?

No, it isn't.  I took it out and ran three KUnit cases with a nested
frag_list under GSO_BY_FRAGS: a linear first member with the nested
bytes counted in its len, the same without them counted, and a paged
first member.  They all still get -EINVAL, from the check in the clone
branch or the one in the frag walk.

> this test for list_skb != NULL is new. Previously this code already
> tested skb_headlen(list_skb) without it. Likely not needed for
> anything new in this patch?

Same answer, the cases above pass without it too.  With every member
checked as it's taken, list_skb can only run out if head_skb->len is
wrong for some other reason, which isn't what this patch is about.

So done this way the patch comes down to the check you suggested in the
frag walk, plus skb_has_frag_list(list_skb) added to the existing
headlen check in the clone branch.  The second one is needed: with only
the frag walk check, the frag_list_nested KUnit case still hits a NULL
pointer dereference in skb_segment(), because the linear member is
cloned, list_skb becomes NULL, and the next pass reads its headlen.

The other option is to go back to the single walk up front from v1.
It's an extra pass over the frag_list, but it's one check in one place.
The difference in behaviour is without SG: there a nested frag_list
whose member doesn't match gso_size goes through the copy path, which
recurses, and a KUnit case for that gets correctly sized segments
today.  The in-walk checks leave that alone and the up front walk would
refuse it.  Nothing in the tree builds a nested frag_list either way.

I lean towards the walk up front for v3 because it's simpler to read.
Would you be ok with that, or do you prefer the two in-walk checks?

net-next is closed, so I'll resend the whole series once it reopens.

Thanks,
Josef

