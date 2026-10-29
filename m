Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F0C606A329
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=umich.edu header.i=@umich.edu header.a=rsa-sha256 header.s=relay-1 header.b=VR9MHA3v
Received: from list by lists.xenproject.org with outflank-mailman.1464698.1675568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQcw-00089B-U4; Thu, 29 Oct 2026 13:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464698.1675568; Thu, 29 Oct 2026 13:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMQcw-000894-R5; Thu, 29 Oct 2026 13:57:10 +0000
Received: by outflank-mailman (input) for mailman id 1464698;
 Thu, 29 Oct 2026 13:57:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMQcv-00088s-0m
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 13:57:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMQct-006hLb-DP
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:57:08 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6ae350b1-2eae-0a2a0a5409dd-0a2a45059e4c-2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:57:05 +0100
Received: from [18.219.209.13] (helo=gorgon.relay-egress.a.mail.umich.edu)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6ae350af-4cb1-0a2a45050019-12dbd10dde22-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 14:57:04 +0100
Received: from truthful-redcap.authn-relay.a.mail.umich.edu
 (ip-10-0-73-72.us-east-2.compute.internal [10.0.73.72])
 by gorgon.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AE350AF.782D12D.52E9F640.1881737; Thu, 29 Oct 2026 09:57:03 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by truthful-redcap.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AE350AE.16D3188D.71A5AF08.3104888;
 Thu, 29 Oct 2026 09:57:02 -0400
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-3ab27e45e7cso17532241fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 06:57:02 -0700 (PDT)
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
	s=relay-1; t=1793282222;
	bh=t2D2sDXKQ7pTvv07EdWL5pfAbbyJ8r7Apbn+VFhH/8s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VR9MHA3vsSRWMzPxx2B8UTIvRCUHyqwLaTdoTlk+rDlBtV4oPpLp9wPhQd8s9jKSl
	 1nzF0Q5pgOM3Cvf94A+HmFg4E+9B+GC5A9KE/OyNGcekIlkTbMdXRDHazsorfCHPin
	 OL/ThspPHDgmTmK0ualzqXt9CLfO5kO8Gp8zROyFhq40TKQ879FO3g82hpEUmjhFzz
	 ENkQe0YrKvZKQlEv9NWey1VXCX5+O+yZrby2LHZ7RkmtCJUgItMSoSQ871TWwjMXuG
	 i5Ca5sLr1UwAnv07vjmtLxyTUnF8RASHgLl1PjquYn/rljmeZCL+bvoo+2pGe0T7Sj
	 yoHtKEIh0BeNQ==
Authentication-Results: truthful-redcap.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=209.85.208.175 (mail-lj1-f175.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvByg+DyvYcUw+/dNxPwW38GmbQ0jvGWJTXENMZSMAvMdraPZNqPGCN+d4XocDzeMM/SQaEErZXgboW0=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI2u/nGR9SECthm3Hkyxn1hs4lEe/GL3svFdzAHDU9VWjjFlV7k
	GG9GL37dI+yUMboImAEsA8qCCxzvgRkOlz++gCliVytrm9mBgnIN71nl/jUIvmUu6Os0GP57Bvf
	LGGkqdOdymDB6cIQSn+f04m9igH443Ko=
X-Received: by 2002:a2e:9a0f:0:b0:3a9:740d:51cb with SMTP id
 38308e7fff4ca-3ac9cf41afamr13635901fa.14.1793282220534; Thu, 29 Oct 2026
 06:57:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <942facb0-c42b-4f09-9081-6cfb006c7bfc@suse.com>
 <f404f8fd-f1ec-476e-bc7b-b6ad8909501a@suse.com> <as4Ev_8NGq-dyK-2@Mac.lan> <9e587bff-7fb9-416e-a4b6-6cb13ec39a6a@suse.com>
In-Reply-To: <9e587bff-7fb9-416e-a4b6-6cb13ec39a6a@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 29 Oct 2026 13:56:48 +0000
X-Gmail-Original-Message-ID: <CAFLBxZbfFp9gCp3wTPqb-WCxfhgao-Sr=WjzpcpXr=oBXp4u4A@mail.gmail.com>
X-Gm-Features: AclHuK-x4L2Ja3WMp7g9hGbNhdv3Ydefs7MYYmMen48nofFc2DGFRV60MZ5KVPU
Message-ID: <CAFLBxZbfFp9gCp3wTPqb-WCxfhgao-Sr=WjzpcpXr=oBXp4u4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86: replace this_cpu() uses in mapcache_current_vcpu()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c201ff/1793282225-728B62A1-55CCC43A/10/78276251493
X-purgate-type: spam
X-purgate-size: 3529
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 13, 2026 at 12:52=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wr=
ote:
> >> Like indicated in the earlier patch, this similarly leads to the funct=
ion
> >> actually being inlined (and hence generated code size actually growing=
) in
> >> gcc16 debug builds. In release builds (with older gcc) the function is
> >> being inlined no matter what. Overall, having looked at generated code
> >> differences, I'm not quite sure anymore whether the earlier observed
> >> inefficiency with repeated this_cpu() really is much of an issue (here=
 or
> >> maybe even more generally).
> >
> > I think we sometimes focus too much on this kind of
> > micro-optimizations when the cost of the operation itself is orders of
> > magnitude bigger than any performance difference the optimization
> > might cause.
>
> Well, any improvement we can reasonably (and safely) make counts. Even
> if not measurable performance-wise, it may still make a difference
> (also in power consumption) when accumulated over long enough a period.

If we had an infinite amount of developer and reviewer attention, this
would be true; if for instance we could have LLMs just review and
check in patches they were confident of.  But reviewer bandwidth is in
fact a major bottleneck; the fact that Roger and I are looking at this
patch now means we're not looking at some other patch.

> > In this case I don't think the resulting code is bad or harder to
> > read, so I don't mind adjusting the logic.  But that's a question of
> > taste, if someone else has a preference for the original form I
> > wouldn't change it.
>
> I'll give it some time for comments to that (or any other) effect.

FWIW, having already looked at the patch, I don't mind either way.
"this_cpu()" is slightly more readable; one could argue that
per_cpu(foo, cpu) sort of implies that it could be a *different* cpu
-- at very least someone reading the code has to go check at least
once.  And again, human cognitive effort is the main bottleneck for a
correct, feature-ful, and performant hypervisor.  But both the
potential efficiency win, and the potential cognitive load, are so
small that I don't feel like it's a clear win either way.

So I would leave it off, but if you'd rather:

Reviewed-by: George Dunlap <gwd@xenproject.org>

> >> --- a/xen/arch/x86/domain_page.c
> >> +++ b/xen/arch/x86/domain_page.c
> >> @@ -20,7 +20,8 @@
> >>
> >>  static inline struct vcpu *mapcache_current_vcpu(void)
> >>  {
> >> -    const struct vcpu *v =3D this_cpu(pgtable_vcpu);
> >> +    unsigned int cpu =3D smp_processor_id();
> >> +    const struct vcpu *v =3D per_cpu(pgtable_vcpu, cpu);
> >>      const struct vcpu *curr =3D current;
> >
> > Maybe you can reorder the variables here:
> >
> > const struct vcpu *curr =3D current;
> > unsigned int cpu =3D curr->processor;
> > const struct vcpu *v =3D per_cpu(pgtable_vcpu, cpu);
>
> The use of curr->processor in the remark in patch 1 was safe afaict.
> I'm not fully sure the one here would be safe: It would require
> thorough auditing of scheduler code to be sure, I think. (I don't
> _think_ ->processor would be altered from a remote CPU, but I'm not
> entirely certain.)

Claude points out that curr is never dereferenced, only compared; so
the code as it is works before `current` is set.  The first
map_domain_page() comes long before `current` is set in
init_idle_domain(), so Roger's version crashes during boot (Claude
verified this).

 -George

