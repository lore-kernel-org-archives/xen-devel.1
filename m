Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A697606A31C
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=1xqR+xbl
Received: from list by lists.xenproject.org with outflank-mailman.1492986.1693200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTN1v-0001Ho-2t; Tue, 17 Nov 2026 17:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492986.1693200; Tue, 17 Nov 2026 17:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTN1u-0001Hh-VX; Tue, 17 Nov 2026 17:31:38 +0000
Received: by outflank-mailman (input) for mailman id 1492986;
 Tue, 17 Nov 2026 17:31:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xTN1t-0001Hb-MF
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:31:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xTN1t-0000000328S-1EaF
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:31:37 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xTN1t-0000000Dmbu-2Lps
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 17:31:37 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3ab3b29a298so1403051fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 09:31:37 -0800 (PST)
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
	bh=9A3o91/W49+jsFwxeZ+Z7XUIW+EsgUzPM0sxNKWkFA8=; b=1xqR+xblAWnC/jGqtlso20cIM7
	N/rqNxZRm17v/zZ0fOiHkL3riGlnCZ/QcMOUmAkS6Gt8cmc59NlMqRGucjnzFFEa+sD6/lhUBUQC1
	17NxMIP8XmHZdPWhpCr62khc+/PyvgaVF89TBLZoWx4vRe/ypp5ruQKBXzYFI6gcBnro=;
X-Gm-Message-State: APuU4Z8lqyXzufNeMLi7a5yvLOZVFMAe0fz+U4Tml9+BJgAmRXCl3QDr
	ZTWSvs2jAmax5ZMO/9vI/ooAPTZqnK/FNH+6+y9YbrWtZCsbw7wcJA7Fd19PkQgAbte3BBxEY29
	JPq/3gbTc8QKU47ujyaKFIDS9zcfoK0o=
X-Received: by 2002:a05:651c:1608:b0:3a6:7094:b41d with SMTP id
 38308e7fff4ca-3ae2b5581efmr40887701fa.10.1794936696408; Tue, 17 Nov 2026
 09:31:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <b3b1f23e-a430-4772-af29-13e59cfeb640@suse.com>
 <CAFLBxZb_V0LM69OKPKabXnepH2nVYLN3tAMqpj9PbGsmoi5nPA@mail.gmail.com> <0a15b164-08c4-4275-a765-6b56e8c842fa@suse.com>
In-Reply-To: <0a15b164-08c4-4275-a765-6b56e8c842fa@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 17 Nov 2026 17:31:24 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZx=ke4DTduVmmWusoCH0AmD5MxWERjWMb8TiLGPBs5zw@mail.gmail.com>
X-Gm-Features: AclHuK9Y1hnqartqCaGuRamxwA4OyCfgU7gILxVywmk3q9dWk_TndNCmnIUd7hg
Message-ID: <CAFLBxZZx=ke4DTduVmmWusoCH0AmD5MxWERjWMb8TiLGPBs5zw@mail.gmail.com>
Subject: Re: [PATCH v2] memory: check incoming GFNs
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
	Community Manager <community.manager@xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 17, 2026 at 2:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
> > OK, so to begin with, this commit message hardly tells me anything I
> > need to know.  "At best undefined", ok, but is that a problem?
>
> Maybe I've done / looked at too many UB patches over the last so many
> years: To me it is out of question that UB is bad.

Our code isn't a hard-to-change standard.  If we want to define what
something means, we can just do it.  It's only a problem if (as seems
the case) code is written which assumes it's going to be aligned.

> >  "For
> > non-translated domains the same isn't true" -- sorry, does that mean
> > behavior is worse than "at best undefined", or better?
>
> It's different. I'm not sure I'd call it "better" or "worse". Hence the
> mere fact being stated.

But you're saying what it isn't, not what it is.  "For non-translated
domains, it isn't true that unaligned accesses are at best undefined."
 What does that even mean?  I mean, now I know that you probably mean,
"For translated domains, unaligned accesses are problematic due to the
P2M's inherent tree structure.  On non-translated domains, gpfns are
just a jumble of numbers, so unaligned accesses aren't as
problematic."  That's not any longer than what you wrote, but it
actually makes it clear which is a problem and points you in the
direction of why.

> > "...and domains
> > may possibly be able to leverage present behavior" --   Is this
> > attackers leveraging the present behavior to do evil, or clever OS
> > writers leveraging the present behavior for good?
>
> Or careless OS writers adjusting their code only until it works, not
> until it matches the (largely unwritten) spec.

"Leverage" implies gaining some advantage.  I wouldn't say that people
who wrote non-spec-compliant code that accidentally works to be
"leveraging" the behavior.

> >  "[I]n fact,
> > XENMEM_memory_exchange is known to be used in such ways" -- who's
> > using it in what ways?  Are we talking about attacks in the wild, and
> > if so, why is this not an XSA?
>
> Does it really matter here who exactly is using the interfaces this
> way? Or whether all such uses are gone (of which I'm not sure)? Okay,
> I've added "(e.g. by Linux, at least up to a certain point)".
>
> >  If not, who's using it how, and is that a good thing or not?
>
> Can doing things not the way they're specified by a good thing?

It's totally legit to say, "We originally envisioned it to be used in
manner X, with restriction Y.  But it turns out, restriction Y was
superfluous, and people discovered that it can be used in manner Z
instead.  And Z is cool!  So, we've decided to bless Z as an approved
use, and officially remove restriction Y."

> And is "how" relevant here at all?

"Who and how" is part of whether it's something we should explicitly
bless, something we should remove immediately, or something we have to
accommodate for backwards compatibility reasons.  It also sets
parameters for how best to bless it, or how best to accommodate it.

> Claude's description, while - as you say - helpful for you, isn't how
> I'd like to see patch descriptions written. Many of your recent
> descriptions resemble that style, and I'm only not opposing to that
> because it's not wrong to do it like this. Still I, as a maintainer,
> am not happy with such overly verbose descriptions. They remove focus
> from the actual change / problem.

Your description made clear neither the change nor the problem.

The following facts need to be known to evaluate the patch properly:

- The public headers of XENMEM_{populate,decrease,exchange} say that
gpfns must be order-aligned, but the code has never enforced it.

- This is particularly problematic for translated domains [because of
how the P2M works?].  There's already been an XSA relating to the
above.

- Linux, up until 5.15, passed unaligned entries to XENMEM_exchange,
so we have to accommodate this for backwards compatibility.

Neither reviewers, nor maintainers, nor developers years hence, should
be expected to have those facts at the forefront of their mind; nor
should they be expected to spend hours digging around to discover
them.  They should be in the commit message.  You can have my R-b when
you have a commit message that includes them.  Everything else I'm
easy about.

> >> @@ -903,6 +923,18 @@ static long memory_exchange(XEN_GUEST_HA
> >>                  continue;
> >>              }
> >>
> >> +            /*
> >> +             * PV domains are known to pass arbitrary PFNs into this =
hypercall.
> >> +             * Therefore we cannot apply the alignment check there.
> >> +             */
> >
> > Worth being explicit here, so that in 20 years' time, someone can
> > consider whether we can drop the exception?
>
> Explicit about what? That some use in Linux has gone away at some point,
> but it's unclear where else uses may still exist? I'd rather not.

Yes, being explicit about what versions of Linux are known to need
this accommodation.  Probably we'll keep the exception around forever.
But maybe there will come a time when keeping the exception is more
painful than dropping support for versions of Linux pre-5.15.  We
shouldn't assume we know enough to tell those future developers they
must never get rid of this exception; we should give those future
developers the information they need to make the decision for
themselves.

 -George

