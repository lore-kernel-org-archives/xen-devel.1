Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C185D606A319
	for <xen-devel@archiver.kernel.org>; Fri, 23 Oct 2026 03:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=drgHK5Y2
Received: from list by lists.xenproject.org with outflank-mailman.1458793.1670835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK5dN-0004Mf-0r; Fri, 23 Oct 2026 03:07:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1458793.1670835; Fri, 23 Oct 2026 03:07:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xK5dM-0004MY-UK; Fri, 23 Oct 2026 03:07:56 +0000
Received: by outflank-mailman (input) for mailman id 1458793;
 Fri, 23 Oct 2026 03:07:56 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <willemdebruijn.kernel@gmail.com>) id 1xK5dM-0004MS-Cf
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 03:07:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xK5dL-00FHW9-PK
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2026 05:07:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6adacf85-2eae-0a2a0a5409dd-0a2a450796b2-2
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 05:07:55 +0200
Received: from [74.125.224.44] (helo=mail-yx1-f44.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <willemdebruijn.kernel@gmail.com>)
 id 6adacf8a-b4ea-0a2a45070019-4a7de02cb183-3
 for <xen-devel@lists.xenproject.org>; Fri, 23 Oct 2026 05:07:55 +0200
Received: by mail-yx1-f44.google.com with SMTP id
 956f58d0204a3-675617e81f9so483465d50.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Oct 2026 20:07:55 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792724874; cv=none;
        d=google.com; s=arc-20260327;
        b=VsSgvb4DhumzRLcEeC5k7Aat3QePoxsFvcpBhlNKR89w0f7Ufnuai46D4NfGDJPhYl
         qC+PAd3TwGXDxb9rud2H7FwHByRdg1iP/Du4BRSahZlF2b+TfAw6n0z+IRR2/scVdMvS
         ZC0C7I3zvKAoVDuENkxMEvFRfuLvnTD2UDLgdRF4wzahVfDhzZx9xwvM48RPPwPpTIel
         ez1+MK2OlHVLpjfbe6rcR7M2QjtHUINi3rCrImOMbjfvtY6/VWdNAmoBX6Jy5JwFLE2K
         YVAagSQDEY8aQTcbItEp8CdcglMiukgy5gwHL5w6b7cIy1zxUzlnToRK5wI9g6PykSe9
         6B1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgV4FpDL0VDAwuHx+GSLC+BPtqKn4ASJs6Viz9YKJlE=;
        fh=3CKQEljtludsAruFLrms6jIE/S6hEszVJBxpFWIkCPM=;
        b=gihe/4EZySI+qvd3ZWHhzUBJWY/NUrHk8UJftn3s/oIqUu1eOThnRWupv9Qn3itskg
         ScpSNFSd+Ax6J/xh5/fWwifaE2MW0PlkdDAlRgLLdXcdZEn5R+RiyUUNFgiwjdMITRc1
         JHHadPPGSzFWhD94qmZSvdkqOj7fMisByVDY3v1UPx1qBehDQeOvcX/6CiMJaceM2wky
         7tec+hGQfZaG/37xHh1iHhb1OY+y7Dl/h5E7MjhSes/deG7JzTMpHYhxd0hbN2lMPtpu
         P8PimewbGXtXpM+v1K2D6XywaOTutXDhTfWqHNrK6wE+UJBVWdPTyzxh7uOcgbU994t3
         fKlg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792724874; x=1793329674; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hgV4FpDL0VDAwuHx+GSLC+BPtqKn4ASJs6Viz9YKJlE=;
        b=drgHK5Y2fBRJSz3wKyGMcZAtCD+ljD3VprpDb+OkkIPwPr52XrHJY6RoTp8leRZPR5
         shgYVFXgWP2L4g8IR13ZayZU1cVVbfuJVRDlHKHl4D9BB000nctKsSz2ObMrqp4SbPwm
         3EYMEPqBacsgqTp0MWTfqyALDGB8nIoJcP+Tz7m2CHxwdpigJkWEjNic8H9+drb7nzxT
         M0cLSJ7jp8EaSljMguBCfq0GXqW6z/ia6LVcY/jSBzLPHuLY2WPKYrYvZFkmFKq7+8Uu
         9PSfewLIwKPzHX//B8H4rtV3qrDok97gObXUK0Tl9otYJ4LJO7OTdwze9k9manS49KBE
         ldUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792724874; x=1793329674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgV4FpDL0VDAwuHx+GSLC+BPtqKn4ASJs6Viz9YKJlE=;
        b=tPL5dNoftxqZXjNMoDQ8Thifj6+ybNIfiiW93WVKZp8m09SDwol5S1ftY7Ejuc8PSu
         qzQ6lTIVScfNhQeqRsPFIU2pwFbjietJoUYol+OxJf6zwmZ3Vle4bL41w9qHaJLUH/1J
         0Ate/Uekw0fnUJsqRKID8n4M4ZdsPev3lqf6qFeYQ2QPXoz1tbaeEWG8lEWm923zG1oq
         Ihpr/Z30go6dSck7zgFbj8tlBqkrg5lAa7Q5GnNix72Fd/dtjQ6VZPO7t/tI2xe/1OYz
         2FMXTXfCGlg4ox6yo/zWwVNaWr+dND3KkVy1TAG9F3T/Wh3myeWJ/m/1AQpOVKYFROd+
         cCnw==
X-Forwarded-Encrypted: i=1; AKwUvBxAN20bgWT8jYfFNp9ZRXK//6OPpQYGoyHLtWPYh/ZSEtCULIJNwj58lmGZbON8/7OdJM7Cafp6Ii8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKkNYPWSZakX1l2gRwBtSM1MnzXKcjD8C+l0EU1DVnNmPY5wi83
	9F20YBooisj/dY2lfLRWWAsls/hkiCBK0m99kYmt+Vp/0V1K4H1O5P8PH0tptuplfWyVaEiUPt/
	hJU7fXF7Ev7yOFafN+VUp6IIOI/dkUBs=
X-Gm-Gg: AYBFou0oVWsGCmNYgWbxZCA7ITJtZBwDTjJJZgkzbmbdrThErlJxDvideqB6/C6KCyj
	wxPNnoA+H+SO2esdJCkcYK4Uw9kN5YLIW8/XWCiXrQxtBl68jkqCNNN5GLLirlS06N2xBvhqbML
	2XtuQufopa6H+3sMvJ4LtEyurIhrAib7ip0Up7IAZQvyX6Px7TZfBUKQNHPLDqIP6Jj2QRaxWyb
	xX5WdNgYNK0LpVIG6FbT/6GcbEyYHl05/keboRXxHe/d4CsahoO7DAFZiwuDN5IfSW+CNydHyyQ
	uK/XRSvH/UwO0nEvsJoBjLvn6YXtexQv1ygwVIV+ggKNaMK//MffMdmwCmIukKNiuySnsG73KFy
	wRV5m10n1J5HIECDvODv+iWhShXboH3qlC1NJw+f81NlPJhifY+G8rWGqhPzDMrLzEfd1SAl3mY
	gEyjokFzQufCs6SzU2wVT4NkaE1APMNRuH0BodcAA1J+L1oIqaFfOuuso=
X-Received: by 2002:a05:690e:458a:10b0:679:ad95:8ef8 with SMTP id
 956f58d0204a3-67a35c2885bmr500156d50.62.1792724874233; Thu, 22 Oct 2026
 20:07:54 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261021-b4-skbuff-bug-on-followups-v2-0-2aa780a03524@toxicpanda.com>
 <20261021-b4-skbuff-bug-on-followups-v2-11-2aa780a03524@toxicpanda.com>
 <willemdebruijn.kernel.11bad1f39601b@gmail.com> <179269910950894.2.12425346173477603662@toxicpanda.com>
In-Reply-To: <179269910950894.2.12425346173477603662@toxicpanda.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Thu, 22 Oct 2026 23:07:16 -0400
X-Gm-Features: AclHuK-kPKdrZO6IqfAWEst6DHPn5D-__xAfjpDX0uBuJFbspUZGaComuYzzAUg
Message-ID: <CAF=yD-+1YNpOpKF+E2kk+W4PtKovfk=mXgLP6hw9811Ez6DXKA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 11/15] net: skbuff: refuse to segment a nested frag_list
To: Josef Bacik <josef@toxicpanda.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Fernando Fernandez Mancera <fmancera@suse.de>, 
	Mina Almasry <almasrymina@google.com>, David Laight <david.laight.linux@gmail.com>, 
	netdev@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Willem de Bruijn <willemb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ef75cf/1792724875-3C817AE4-E68EFB52/0/0
X-purgate-type: clean
X-purgate-size: 2395
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 8:44=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> =
wrote:
>
> On Wed, Oct 21, 2026 at 09:47:15PM -0400, Willem de Bruijn wrote:
> > This patch became quite a bit more complex because of my request.
> > More than I anticipated.
> >
> > Are you sure this first block is needed?
>
> No, it isn't.  I took it out and ran three KUnit cases with a nested
> frag_list under GSO_BY_FRAGS: a linear first member with the nested
> bytes counted in its len, the same without them counted, and a paged
> first member.  They all still get -EINVAL, from the check in the clone
> branch or the one in the frag walk.
>
> > this test for list_skb !=3D NULL is new. Previously this code already
> > tested skb_headlen(list_skb) without it. Likely not needed for
> > anything new in this patch?
>
> Same answer, the cases above pass without it too.  With every member
> checked as it's taken, list_skb can only run out if head_skb->len is
> wrong for some other reason, which isn't what this patch is about.
>
> So done this way the patch comes down to the check you suggested in the
> frag walk, plus skb_has_frag_list(list_skb) added to the existing
> headlen check in the clone branch.  The second one is needed: with only
> the frag walk check, the frag_list_nested KUnit case still hits a NULL
> pointer dereference in skb_segment(), because the linear member is
> cloned, list_skb becomes NULL, and the next pass reads its headlen.
>
> The other option is to go back to the single walk up front from v1.
> It's an extra pass over the frag_list, but it's one check in one place.
> The difference in behaviour is without SG: there a nested frag_list
> whose member doesn't match gso_size goes through the copy path, which
> recurses, and a KUnit case for that gets correctly sized segments
> today.  The in-walk checks leave that alone and the up front walk would
> refuse it.  Nothing in the tree builds a nested frag_list either way.
>
> I lean towards the walk up front for v3 because it's simpler to read.
> Would you be ok with that, or do you prefer the two in-walk checks?

Given the complexity of skb_segment already, and how non-trivial
the added inline checks are, I'm also okay with the up front walk.

It only adds cost for GSO skbs that use a frag_list. Though that
may include some relatively common cases, such as BIG TCP.

