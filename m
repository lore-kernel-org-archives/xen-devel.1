Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A058606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=umich.edu header.i=@umich.edu header.a=rsa-sha256 header.s=relay-1 header.b=D58r4Zi4
Received: from list by lists.xenproject.org with outflank-mailman.1464712.1675586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQh9-00028S-KB; Thu, 29 Oct 2026 14:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464712.1675586; Thu, 29 Oct 2026 14:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQh9-00028L-Gd; Thu, 29 Oct 2026 14:01:31 +0000
Received: by outflank-mailman (input) for mailman id 1464712;
 Thu, 29 Oct 2026 14:01:29 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMQh7-00028F-Jd
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:01:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMQh6-00EaIW-IQ
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:01:28 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6ae351b0-8faa-0a2a0a5109dd-0a2a450be634-28
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:01:28 +0100
Received: from [18.217.159.240] (helo=ghoul.relay-egress.a.mail.umich.edu)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6ae351b7-b7e8-0a2a450b0019-12d99ff0bb74-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:01:28 +0100
Received: from decisive-ogre.authn-relay.a.mail.umich.edu
 (ip-10-0-74-246.us-east-2.compute.internal [10.0.74.246])
 by ghoul.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AE351B7.1DE87A9.24AD4C46.470894; Thu, 29 Oct 2026 10:01:27 -0400
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by decisive-ogre.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AE351B6.13F504AD.6F1516D9.381346; Thu, 29 Oct 2026 10:01:26 -0400
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-3ab27e45e7cso17601451fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:01:26 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-1 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-1; t=1793282486;
	bh=Sd1w4bHSdg3R4jiuILygJQGmcBR09WjXKUsgSFB9ebw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=D58r4Zi4gm+/Vb039WFtkeLQ7p4W1EASdJ7O7gyF/5qko9aGm+/F53dCpzOn9NGhp
	 wJiZ6otSEoQAPYGQ9FWzpU3Rp0OVbE7bVOj2FY1ru3/9MU5sEn6BhOTfGMQ/Gz3FtO
	 u8jXnt8I9m5FSgHGxfFGTYmEm24CH6DP0zqWEivURG0JQE+Nooeu1794sJC4Bq1Pb5
	 Yz4O/XMo2MnXmbleJ+n7IxwnSS5+kuRLAAXXO8GAAXRtESBsALQe1HjVL63VakXCSm
	 6vydwtvboWprii69kikcW5/rFq9lHO6+vDi6PvbwupebHLJ49aLaLlRuXbgFbUmaOL
	 E4vQKWF04fzwg==
Authentication-Results: decisive-ogre.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.173 (mail-lj1-f173.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvByy6xnkeaIRwVKFBD0comXal5wicX28T81se7RSv7l8zSe1soYSt3IzafSgiZ+0TW472ag6qis+V+o=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJNlg9tnd9kTRVPVC3OPgFVfcJOlbnY9LFssK7d0kqDgiy0BiMv
	KuVM7ebflziJlamE3P0o5VOkn7ilTHodXAqR5umswSI4Ud4cWjLyOTnElE12EV3LGuNmgElBlJN
	G+kZXAp08785/haxBxqCyc+V0JQV8HzU=
X-Received: by 2002:a05:651c:2101:b0:3ac:433c:6ab7 with SMTP id
 38308e7fff4ca-3ac9cf5d61bmr12688761fa.16.1793282484708; Thu, 29 Oct 2026
 07:01:24 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
 <f404f8fd-f1ec-476e-bc7b-b6ad8909501a@suse.com> <as4Ev_8NGq-dyK-2@Mac.lan>
 <9e587bff-7fb9-416e-a4b6-6cb13ec39a6a@suse.com> <CAFLBxZbfFp9gCp3wTPqb-WCxfhgao-Sr=WjzpcpXr=oBXp4u4A@mail.gmail.com>
In-Reply-To: <CAFLBxZbfFp9gCp3wTPqb-WCxfhgao-Sr=WjzpcpXr=oBXp4u4A@mail.gmail.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 29 Oct 2026 14:01:12 +0000
X-Gmail-Original-Message-ID: <CAFLBxZber6=tzWyhNMrYY7uZe4-pghkhH=6bG0zUPJ-kymiZuA@mail.gmail.com>
X-Gm-Features: AclHuK8DREOvbKJAs3FrxJ5Hb-yhXQ1KKnhm8erfiUaBoft96R_JT-SBUvWhnrw
Message-ID: <CAFLBxZber6=tzWyhNMrYY7uZe4-pghkhH=6bG0zUPJ-kymiZuA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86: replace this_cpu() uses in mapcache_current_vcpu()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1793282488-19CC79EA-11F1AF98/10/78276251493
X-purgate-type: spam
X-purgate-size: 3485
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 1:56=E2=80=AFPM George Dunlap <dunlapg@umich.edu> w=
rote:
>
> On Tue, Oct 13, 2026 at 12:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> =
wrote:
> > >> Like indicated in the earlier patch, this similarly leads to the fun=
ction
> > >> actually being inlined (and hence generated code size actually growi=
ng) in
> > >> gcc16 debug builds. In release builds (with older gcc) the function =
is
> > >> being inlined no matter what. Overall, having looked at generated co=
de
> > >> differences, I'm not quite sure anymore whether the earlier observed
> > >> inefficiency with repeated this_cpu() really is much of an issue (he=
re or
> > >> maybe even more generally).
> > >
> > > I think we sometimes focus too much on this kind of
> > > micro-optimizations when the cost of the operation itself is orders o=
f
> > > magnitude bigger than any performance difference the optimization
> > > might cause.
> >
> > Well, any improvement we can reasonably (and safely) make counts. Even
> > if not measurable performance-wise, it may still make a difference
> > (also in power consumption) when accumulated over long enough a period.
>
> If we had an infinite amount of developer and reviewer attention, this
> would be true; if for instance we could have LLMs just review and
> check in patches they were confident of.  But reviewer bandwidth is in
> fact a major bottleneck; the fact that Roger and I are looking at this
> patch now means we're not looking at some other patch.
>
> > > In this case I don't think the resulting code is bad or harder to
> > > read, so I don't mind adjusting the logic.  But that's a question of
> > > taste, if someone else has a preference for the original form I
> > > wouldn't change it.
> >
> > I'll give it some time for comments to that (or any other) effect.
>
> FWIW, having already looked at the patch, I don't mind either way.
> "this_cpu()" is slightly more readable; one could argue that
> per_cpu(foo, cpu) sort of implies that it could be a *different* cpu
> -- at very least someone reading the code has to go check at least
> once.  And again, human cognitive effort is the main bottleneck for a
> correct, feature-ful, and performant hypervisor.  But both the
> potential efficiency win, and the potential cognitive load, are so
> small that I don't feel like it's a clear win either way.
>
> So I would leave it off, but if you'd rather:
>
> Reviewed-by: George Dunlap <gwd@xenproject.org>

That said, Claude's analysis of the generated code doesn't give any
benefits.  Its take below.

 -George

It saves no work in the generated code (gcc 16.2.0, staging 41ddcfe808):

- Why: is_pv_vcpu() =E2=86=92 evaluate_nospec() is an asm volatile with a
"memory" clobber. So the per-CPU offset is reloaded after it either
way, whether it comes from cpu_info or from __per_cpu_offset[cpu].
Latching cpu only saves the %rsp arithmetic, and costs the
processor_id load.

- Release builds: the same number of loads on the common path, one
instruction fewer, and map_domain_page/unmap_domain_page grow by 16
and 21 bytes. In release builds this code runs only for frames above 5
TiB anyway, because of the NDEBUG shortcut.

- Debug builds: gcc inlines the function into both callers (.text +384
bytes, as Jan said), and the common path gains one load.

So, as Roger said, it=E2=80=99s a matter of taste; the generated code gives=
 no
reason to take it.

