Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C3BD606A31C
	for <xen-devel@archiver.kernel.org>; Wed, 18 Nov 2026 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VOsiEcP6
Received: from list by lists.xenproject.org with outflank-mailman.1494217.1693847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcoT-00058d-UF; Wed, 18 Nov 2026 10:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1494217.1693847; Wed, 18 Nov 2026 10:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTcoT-00058W-QM; Wed, 18 Nov 2026 10:22:49 +0000
Received: by outflank-mailman (input) for mailman id 1494217;
 Wed, 18 Nov 2026 10:22:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1xTcoS-00058P-M7
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 10:22:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTcoS-00FJO4-2T
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2026 11:22:48 +0100
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afd7c72-2eae-0a2a0a5409dd-0a2a45018058-22
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:22:48 +0100
Received: from [209.85.208.179] (helo=mail-lj1-f179.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 6afd7c77-5bcc-0a2a45010019-d155d0b3d8e3-3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 11:22:48 +0100
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3ad5529ae64so6948881fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Nov 2026 02:22:47 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1794997367; cv=none;
        d=google.com; s=arc-20260327;
        b=jCsyPp/WEmW5d0ufmQTrdDGqb6T//DIrkRweZ+B3A72fMf/qHwIaai4HDBJlKjcJ0+
         BRCgu8xBvS2FcX9kiy7p1kvMCa9UIg8rcbO58CEEceBr7IPrprFHkPo4bP0C5tPTVHLu
         R/8DcLftwPvQD+arGwDowsGr+qMR4LnRsLKkvAcwvFqPIKBa2RF6swMCjJVTXuXI7PCe
         p6W4ZWteB4kHI8pqFdp0ViIxwM3A9L0KzoYWJltzGd9gdQYZw10hx4aCkt0H5bZRLoWL
         18WMRbxSocz0QEvmZyHD9CRrCJ+VoUjjRWLxp44z5Rb4c5Cd82jVFvSJ1rMI3yHMo71M
         hCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1KAdteGyk2P92pTlx2NZGvjIuBeTZJzSA8OkPI18uI=;
        fh=DTLkauBK2JweO7DZXonqTvyBZL7CpVQ4HldXABfhCxU=;
        b=Eh+mAgv55g/bxyvzgiqSeNIZ6FUK1hrBkTW6Zd3wtvCN0jhfToCydusysRnVQXmLrs
         fizR4T/pFW8Y5fua/j1z5MX0xlvfUNTfXDiB8sv12rCMwjAJoQjbzzApSbWUN9lmulTv
         SxSFruAI8s0MxuCpXGKJ0SxA8oPABlQ9YW0OVbi+0ohx/FafQdqf13bGFrNjQvEpPhN1
         xLh6DvZiWZaN6nU8Pujoxnl3q70bAd3CArVZnDmJd65Y70/QCDU+ImePEUxfWRmhKLDP
         pWiepNM0HObrHBXIZsxZj3rY9BEP0PNLn+/HAcbbANvAD6yk0eHyER29pXpw9AAcbCoB
         G3Ag==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794997367; x=1795602167; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c1KAdteGyk2P92pTlx2NZGvjIuBeTZJzSA8OkPI18uI=;
        b=VOsiEcP6qkXDEJVxeV5rDaZbIMf8Z69HVqHtR2p3vGLBo1lBotFhPUHX21Ji4ZT/W7
         MCTM0KksUmQon+ZelJiKvAITQri8r6i+42MpZEoBw0bhzlIUx2ORz9R/CWZfQZXnjOEj
         asNUV5qJXFW6wBJAlp32u8Xh5oAZZKkDAFBKBV3cWdeCgVsnKPWefwzdZ5e8gIT3oApx
         ULLqbg31MZPGGDcALelEDXa42u8yeIDwH55XRH7I7rxSq2gcvONF777XgYg+DVyB9Af0
         hsJaXZQmmjk3xxZtOP5JM+B7GM35oKS75Lu36eRaMqY+LT6DKnfECHifu6GAVuxTfD4Y
         +HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794997367; x=1795602167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1KAdteGyk2P92pTlx2NZGvjIuBeTZJzSA8OkPI18uI=;
        b=Y60TUJSfRHnCg8DDO9232kL9B/b9jUQDFHFsgikdoPGaftqNQQsMjT9QLloZ/tj8LJ
         GUeYm49sZNcN/jIxgYRZOb6wEbEygk1Jd60uboED4wUEhkcokiMv+3ee45ltniMFZXkc
         OEbNgJ6oDQ/2YmElQVjJrJHO6fcqPGOwgqsE+3NW+w/gBOcZ/nXYbixyLBVBNj2m4/nL
         1YuOu0YLZlCJVum+gGLTBXWCEJgM5COj4865/5acJX6AqOJ/yx/wWiUZURAlF02j8O1p
         r9NZyxTDvt2mJ0zDWnXscZ6Q2sCsG8f6otHfoX6/VWGRxcT2pMo/f1071AbQXpxryoGO
         GEWw==
X-Forwarded-Encrypted: i=1; AL+hErE2Pp+OOzGHSSy775+NPhmAZ/8vUBC5oCyVh5KB7eSQoOaldrcgfnONAdFtuFUGOEsnRa84unjPMnk=@lists.xenproject.org
X-Gm-Message-State: APuU4Z86eoffejXiKNaIjUDvDDyO+Yqxp86SEp6/hXOhVQAIZtPuBrP9
	zYFmrZFfBsR7m3G5ZGUkHTvRGHi1chATonOc5C4u+yhodnQY0WTOjFNInTLmtRH83n46FHAEoum
	eBh/h+SypgMvXnlk3fEWnv0yK7koMmi0=
X-Gm-Gg: AYBFou3fYWyj9/iZmHrxQwpZpiqCmfRfuWkI9eWW/0wGcWHW2s8yAps3DCrIecqC9m4
	lqdfOyP8lhNc3deh2FinCRwYrBAZyxttvuVb4yMRcBYpKgBQtOvRrmr0TmLi3gkLGpJtdsceVhI
	hG2110l6NYVHz95cW8trcG9IHKFB0JpOFVpM50cFUVRSvuf1759oa8bvPIsKswgkbQrZa+S/n2l
	ZwsvtDoHiVox1Q10fxOnk6ee1wsdG69qlYP9OEjYTPbkQeYOSMw+VjwTNdLLZ6Jd15EoIJqHzE0
	G4aMVfoXftZy3K0tCNSLzrgzJ4zEwpfFjIrAbr/64nbKWJHzXowcm7Zi3ehhHYRfCWTl84uANja
	+XwblU9GvP+nnoXqPcEjZLLUpcCco1PsNle0=
X-Received: by 2002:a2e:ab81:0:b0:3ac:cfdc:d79e with SMTP id
 38308e7fff4ca-3ae670bd4eamr5852711fa.13.1794997366998; Wed, 18 Nov 2026
 02:22:46 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1794873792.git.mykola_kvach@epam.com> <3b0a92602e8cbc2f4df6b376876903e93850be3f.1794873792.git.mykola_kvach@epam.com>
 <87cxs2oqjc.fsf@epam.com>
In-Reply-To: <87cxs2oqjc.fsf@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 18 Nov 2026 12:22:35 +0200
X-Gm-Features: Aa3M54q0mQVkhbCRjeFf265iv1WtaWFGGTcKp1OglS98HM9He1iRU9qb_3UdSuE
Message-ID: <CAGeoDV9csCpnH1ASkL-ytFju1YuSLGUf8NNuMwF-gd8vVZ0s0g@mail.gmail.com>
Subject: Re: [PATCH v14 04/15] xen/percpu: defer freeing per-CPU areas after
 resume failures
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Mykola Kvach <Mykola_Kvach@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1794997368-4F74C5FD-2CEE52EE/0/0
X-purgate-type: clean
X-purgate-size: 4136
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Volodymyr,

Thank you for the review.

On Wed, Nov 18, 2026 at 3:52=E2=80=AFAM Volodymyr Babchuk
<Volodymyr_Babchuk@epam.com> wrote:
>
> Hi,
>
> CC'ed Juergen, because I have a question about cpupools.
>
> Mykola Kvach <Mykola_Kvach@epam.com> writes:
>
> > When a CPU fails to come back during system resume, cpu_up() sends
> > CPU_UP_CANCELED. After trying the other CPUs, enable_nonboot_cpus()
> > sends CPU_RESUME_FAILED for the same CPU.
> >
> > On architectures which do not park offline CPUs, both notifications
> > queue free_percpu_area(). The release metadata, including the rcu_head,
> > is stored in that CPU's per-CPU area. The first callback may already
> > have freed the area when the second notification arrives, or the same
> > rcu_head may be queued twice. The CPU_RESUME_FAILED callbacks also need
> > the area to clean up timers and CPU-pool state.
>
> A bit convoluted. As I see, problem is caused by the fact
> CPU_UP_CANCELED is a terminal state in a "simple" CPU up sequence, but
> is a transient state in a system resume sequence.

Agreed, I'll make this clearer in the description. If no other changes
are needed, could we update the commit message when applying the patch,
without rerolling the series?

> As such, theoretically
> other per_cpu callbacks might have a similar issue when they don't
> expect one more "CPU state is bad" callback. I can see that
> common/timer.c also tries to handle both callbacks as terminal
> ones. Probably, you need a similar fix there as well.

I checked timer.c. free_percpu_timers() sets ts->heap to dummy_heap
after freeing it, so the second call does not free the same allocation
again. The per-CPU area itself must remain valid, which this patch
ensures. I don't see a need for the same fix there.

>
> Actually, I am not sure why do we need CPU_RESUME_FAILED in the first
> place. As I can see, only cpupool handles it in a sensible way. Which
> begs a question: why cpupool can't call cpupool_cpu_remove_forced() on
> CPU_UP_CANCELED instead?

CPU_RESUME_FAILED runs after all CPUs have been tried, when the available
resources are known. This was the reason for adding it in commit
51c79e943fb3. Removing a CPU from its pool can require migrating vCPUs or
moving domains to pool0.

Also, if CPU_UP_PREPARE fails early, CPU_UP_CANCELED only unwinds part of
the notifier chain, so cpupool may not receive it. CPU_RESUME_FAILED runs
the full chain.

But let's wait for Juergen's input on the cpupool part.

Best regards,
Mykola


>
>
>
> >
> > Skip the per-CPU release for CPU_UP_CANCELED during resume. Let
> > CPU_RESUME_FAILED release the area after the other cleanup callbacks.
> >
> > This prepares the common code for Arm system suspend. x86 parks offline
> > CPUs, so the per-CPU notifier does not call free_percpu_area() for eith=
er
> > CPU_UP_CANCELED or CPU_RESUME_FAILED.
> >
> > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> > ---
> > Changes in V14:
> > - Clarify that x86 skips free_percpu_area() for CPU_UP_CANCELED and
> >   CPU_RESUME_FAILED.
> > - Remove the blank line after fallthrough. No functional change.
> >
> > Changes in v13:
> > - New patch.
> > ---
> >  xen/common/percpu.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/xen/common/percpu.c b/xen/common/percpu.c
> > index f180f37253..757de111db 100644
> > --- a/xen/common/percpu.c
> > +++ b/xen/common/percpu.c
> > @@ -82,6 +82,14 @@ static int cf_check cpu_percpu_callback(
> >          break;
> >
> >      case CPU_UP_CANCELED:
> > +        /*
> > +         * On resume, CPU_RESUME_FAILED is sent after all CPUs have be=
en
> > +         * tried. Keep the area alive for its cleanup callbacks and le=
t
> > +         * that notification release it.
> > +         */
> > +        if ( system_state =3D=3D SYS_STATE_resume )
> > +            break;
> > +        fallthrough;
> >      case CPU_DEAD:
> >      case CPU_RESUME_FAILED:
> >          if ( !park_offline_cpus && system_state !=3D SYS_STATE_suspend=
 )
>
> --
> WBR, Volodymyr

