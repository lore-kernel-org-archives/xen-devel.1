Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19B606A333
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2026 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=4sZ2GZz8
Received: from list by lists.xenproject.org with outflank-mailman.1481999.1685887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnd4-0006fG-Tm; Tue, 10 Nov 2026 15:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1481999.1685887; Tue, 10 Nov 2026 15:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQnd4-0006f9-RB; Tue, 10 Nov 2026 15:19:22 +0000
Received: by outflank-mailman (input) for mailman id 1481999;
 Tue, 10 Nov 2026 15:19:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xQnd4-0006ez-3Z
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:19:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xQnd3-00000006DJZ-325s
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:19:22 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xQnd4-000000023DO-0ntL
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2026 15:19:22 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3ab4891fc73so16491131fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Nov 2026 07:19:21 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=qvdgV0YBklfaXaY6+l2EaOsoT04jeMwLH02IEtrYe1I=; b=4sZ2GZz855+/G8T+nfn+02GEFV
	Ql79IwQifeDLRkD+FrX32Z7FVWHjr3VGevNlzvIVb63bkrFpt/fMLZPp7BWpMLlY7lZPpCTAvLK3Z
	ftH3ICTYRXONaNpoeWQQIIq1p+sKDqRFtwC3sVuo6wwJ4sD2aPWQGJEI4vTUsI+j/DD4=;
X-Forwarded-Encrypted: i=1; AL+hErH3CrSHo9HuqxoYQbTPzsUPYZhZferSWEqYaCcmRWTBQ9kqx1e9CCIqhSKOc+OwqvcSDh16fH3Z9RM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z/wUOjfkzML9aPWWzUUOFDIt9+UNsFNbF0HPg96C+z/tDb/cLFi
	ctIvxgYRGlXzzYEQc4x3suY/68t5nfUICA0FYMpgkEg6fzLMmxKEB446QPYeddc2OxGcZkE0tOA
	UdxbWRKAfuzLuqFLGSs6AFuM43GsQaHA=
X-Received: by 2002:a05:651c:b14:b0:3ab:3bf3:1604 with SMTP id
 38308e7fff4ca-3ae09660bd8mr5605811fa.26.1794323960894; Tue, 10 Nov 2026
 07:19:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110110500.27221-1-gwd@xenproject.org> <ec93ec9a-2fd3-4dcc-94f8-35376cb03363@suse.com>
 <CAFLBxZbndoe49Zcurk6ZM04niye=jRsEcD_=mnSoKQUuXPRZew@mail.gmail.com>
 <8d2ecf68-6c34-4a59-9fbf-0e3f67a338d7@suse.com> <CAFLBxZZA0ZYrjHC5TCNt53HLuq-fDxkNyXdM1iOua8u2EaJnKg@mail.gmail.com>
 <f68f4464-1434-4314-bf3c-7eb367f0a1b9@suse.com>
In-Reply-To: <f68f4464-1434-4314-bf3c-7eb367f0a1b9@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 10 Nov 2026 15:19:08 +0000
X-Gmail-Original-Message-ID: <CAFLBxZaHFGbOV3XNrY+w0EK2vRZoN48z7QCJaYRnHFuNNMD3Jg@mail.gmail.com>
X-Gm-Features: AclHuK-bVlhLMP9ckf4fI1WbMmPg3jvtxWt1zhMiNQ49CvRvxbKDTtgiVWyiJyc
Message-ID: <CAFLBxZaHFGbOV3XNrY+w0EK2vRZoN48z7QCJaYRnHFuNNMD3Jg@mail.gmail.com>
Subject: Re: [PATCH] x86/pv: free the shared_info page switch_compat() replaces
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 10, 2026 at 2:05=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> > I suppose you'll say, sure, but this is a non-hot path, and if we ever
> > *do* free with an outstanding refcount it's a security issue, so why
> > not be safe?  You have to draw the line on internal consistency checks
> > *somewhere*; I'd leave the check off, but I can add it if you really
> > want.
>
> But is this only an _internal_ consistency check? Can't a toolstack or
> DM map a domain's shared-info page (as soon as it exists)? IOW I didn't
> think of the check as a consistency one at all, but rather as a guard
> towards e.g. toolstack behavior changing.

Oh, I see.  Actually, Claude thinks that ATM libxc has a bug in this
respect on the restore path: It reads and stores the frame number for
the shared info page *before* the switch; then maps the stale frame
number when it fills in the restored data.  If the page is moved, then
on staging the refcount will be zero, get_page() will return an error
and the restore operation should fail.

So I'll add a leak-if-nonzero-refcount check to this patch, and add a
second patch making sure we don't retain a shared_info frame number
across a switch.

 -George

