Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF9606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=aphyOUJD
Received: from list by lists.xenproject.org with outflank-mailman.1468268.1677368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNscs-0006wd-0j; Mon, 02 Nov 2026 14:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468268.1677368; Mon, 02 Nov 2026 14:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNscr-0006wW-T6; Mon, 02 Nov 2026 14:03:05 +0000
Received: by outflank-mailman (input) for mailman id 1468268;
 Mon, 02 Nov 2026 14:03:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xNscp-0006wQ-SZ
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:03:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xNscp-0000000AmNM-3YJj
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:03:03 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xNscp-0000000DCRs-3Hwm
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 14:03:03 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-3aca0bf7fd0so25180681fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 06:03:03 -0800 (PST)
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
	bh=wCXwL03Q1KbJgBXNr6Cbs3Vs/v9x3/QUWkx8s4hLcUQ=; b=aphyOUJDuj4ZcmFyk36aStoULb
	LDMv+/CHB6Gpf8ts9crAgZ4h0b/jirxZOkHWdbR0JOGA0JJU70xaTOY7OEuihXddMqS1pqIRX9bQo
	rq6DnQ04/DA6SmrEMVtcq4F+0d3vkFIv9/D63XhTQ+9gkVmKom4UmqZle/+H7qAZ1lIM=;
X-Forwarded-Encrypted: i=1; AKwUvByjVejrQ5fiIi+w5JAm934j7Q5prXuOv26K2noiVHoUi6wL8Z4XK7JEsiC/rjrQLfYsfT1aMtHFM18=@lists.xenproject.org
X-Gm-Message-State: APuU4Z86anCPYiREfv+TaPXQA4Ss/P/042DvcTe4SPbzA8ZJcI57NMLc
	LHW8+PPwsLpkWbWEXIIYcJimf8Qy+WSSrjGCHPjIM5yJTL+2wKSrf362x6WjLSVec85yF5ibVXZ
	EPB7Od56+E2soXTmpTk/BEQF5Tvi4F+g=
X-Received: by 2002:a2e:b896:0:b0:3ab:f43:a3ca with SMTP id
 38308e7fff4ca-3acb7a80dcbmr23174871fa.16.1793628182720; Mon, 02 Nov 2026
 06:03:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
 <20261028-asi-hvm-v5-2-13b908e0df0b@xenproject.org> <f29b4d27-650e-4463-a0bb-785ce507c644@suse.com>
 <CAFLBxZaXHuaMuHTPKgx-vw_AH8iX+jvh2t2BGsGYFR2z5hsPiQ@mail.gmail.com> <eb3c6304-f8af-4b93-be20-3db914e1ac6a@suse.com>
In-Reply-To: <eb3c6304-f8af-4b93-be20-3db914e1ac6a@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 2 Nov 2026 14:02:48 +0000
X-Gmail-Original-Message-ID: <CAFLBxZZ-oorO7vXHONK0b7Yq_ZwHXEpBh8jphb-GaU9C8rT11Q@mail.gmail.com>
X-Gm-Features: AclHuK8RnItcqa2VSedy3P4ENbj78xlLTRO4MSeS5WaHp9MM8cNy3411dj9I8ek
Message-ID: <CAFLBxZZ-oorO7vXHONK0b7Yq_ZwHXEpBh8jphb-GaU9C8rT11Q@mail.gmail.com>
Subject: Re: [PATCH v5 02/45] x86/mm: refuse to promote an L4 while the domain
 has no per-domain L3
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

On Mon, Nov 2, 2026 at 9:50=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 30.10.2026 18:11, George Dunlap wrote:
> > On Thu, Oct 29, 2026 at 7:47=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> Independent of that, how about pulling hvm_domain_initialise()'s
> >> create_perdomain_mapping() up into arch_domain_create() instead of the
> >> code additions you do?
> >
> > So, let's see if we can solve it "properly".  Constraints:
> >
> > - Eventually, not all domains will have a domain-wide L3; some will
> > only have per-vCPU L3s.
> >
> > - init_xen_l4_slots needs a domain always, but only needs a vcpu to
> > get the L3 of vcpu_pt domains.
> >
> > - PV vcpu_pt domains don't need an L3 installed after
> > init_xen_l4_slots; they need to run on a clone of the L4 anyway.
> >
> > So by the end of the series, we could arrange it like this:
> >
> > non-vcpu_pt domains always allocate d->arch.l3_perdomain in
> > arch_domain_create.  vcpu_pt domains always allocate
> > v->arch.l3_perdomain in arch_vcpu_create.
> >
> > Have __init_xen_l4_slots() take a domain and an L3; if the L3 is NULL,
> > leave the perdomain slot empty.
> >
> > Have init_xen_l4_slots() take a vcpu.  BUG_ON(is_hvm_vcpu(v) &&
> > v->arch.asi.vcpu_pt && !v->arch.l3_perdomain), then pass the
> > appropriate l3 into __init_xen_l4_slots().
> >
> > Have init_xen_l4_slots_pv() take a domain, and always pass the domain
> > and d->arch.l3_perdomain to __init_xen_l4_slots.  This will be NULL
> > for PV vcpu_pt domains, but that's fine.
> >
> > Then promote_l4_table() calls init_xen_l4_slots_pv() with a domain,
> > and loses both the checks at the top.
> >
> > There are corner cases to sort out, like how idle domains get an L3;
> > but overall I think this makes everything more robust.
> >
> > Thoughts?
>
> Sounds plausible to me.

This has beeen done.  It required some refactoring of later patches.
These have all been tested and skimmed, but haven't been over with a
fine-tooth comb again, so there's a risk of LLM quirks.  Do you mind
if I post what I have now, so people can look at it this week if the
chance affords?  Otherwise I won't be able to post it until next week
at the earliest.

 -George

