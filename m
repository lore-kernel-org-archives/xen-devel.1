Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6678F606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 17:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=grf4hBMU
Received: from list by lists.xenproject.org with outflank-mailman.1465968.1676390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMq8X-00023z-AG; Fri, 30 Oct 2026 17:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465968.1676390; Fri, 30 Oct 2026 17:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMq8X-00023s-6Q; Fri, 30 Oct 2026 17:11:29 +0000
Received: by outflank-mailman (input) for mailman id 1465968;
 Fri, 30 Oct 2026 17:11:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xMq8W-00023m-Jj
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:11:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMq8W-00000004LGc-35Li
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:11:28 +0000
Received: from mail-lj1-f178.google.com ([209.85.208.178])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xMq8W-0000000AdeW-24gW
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 17:11:28 +0000
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-3a9a1ed66b9so7529701fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 10:11:28 -0700 (PDT)
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
	bh=ojwmC1CtCGl63LXHg46furfXlUtUxiNwRTaT+n4Vspk=; b=grf4hBMU7vt9mhaaMIREndKq6s
	1Z8hsFFwugvssRIsdtnL1H6bunuJbZKm2LuPKQtZmCkpKrAMPItSMjiiLXy1osuXbSqMpZquwCc6n
	DLfq5hW1oISwdmFUVVsfStTNNUGxQTetthRG62z4yPEqxLE9clsdmtIwn3aD7JJerWPI=;
X-Forwarded-Encrypted: i=1; AKwUvBzzA3soRtyp8CZImG1UJjA4TdjWQMkYGiMLRI9+1TqT8e7he2zZAC7JrryPmFHPLwVBoAxXE3QdJHM=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK1kPVJJo/Buj2PB+o3cHEQRn7xOSKryOFLNjD5Yw7XtaBBhH26
	8gnlwVEERMKWYsWu5f15fZ6ICMEoTYO/NDNAZUuPhFhpVdIUAmuw6EM9pMzGhN9+N6uE/kqcVjU
	SgtjHUk8VsKit8nv2/dIwIRBB93U44YA=
X-Received: by 2002:a05:651c:31c3:b0:3a9:7711:1cd7 with SMTP id
 38308e7fff4ca-3acb7aa5547mr8899741fa.23.1793380287440; Fri, 30 Oct 2026
 10:11:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-asi-hvm-v5-0-13b908e0df0b@xenproject.org>
 <20261028-asi-hvm-v5-2-13b908e0df0b@xenproject.org> <f29b4d27-650e-4463-a0bb-785ce507c644@suse.com>
In-Reply-To: <f29b4d27-650e-4463-a0bb-785ce507c644@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Fri, 30 Oct 2026 17:11:14 +0000
X-Gmail-Original-Message-ID: <CAFLBxZaXHuaMuHTPKgx-vw_AH8iX+jvh2t2BGsGYFR2z5hsPiQ@mail.gmail.com>
X-Gm-Features: AclHuK_lib56J4m9UWxE3kg9SyoBxwNIOSzB34YuLg-Wltkoi-Dsk9S2jhoD4Zg
Message-ID: <CAFLBxZaXHuaMuHTPKgx-vw_AH8iX+jvh2t2BGsGYFR2z5hsPiQ@mail.gmail.com>
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

On Thu, Oct 29, 2026 at 7:47=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 29.10.2026 00:05, George Dunlap wrote:
> > init_xen_l4_slots() puts the domain's per-domain L3 in slot 260 of the
> > L4s it fills.  Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT
> > L3 slot at domain creation") a PV domain gets that L3 with its first
> > vCPU (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
> > earlier, with the domain, and release builds skip that unless memory
> > hotplug is enabled or the host's memory reaches past the part of the
> > directmap PV guests can see.  So in release builds on most hosts, an L4
> > that is promoted before XEN_DOMCTL_max_vcpus has created the domain's
> > vCPUs gets a slot 260 entry made from a NULL page (0x803e900000000063),
> > pointing far beyond the host's memory.
> >
> > Have promote_l4_table() return -EINVAL while the domain has no
> > per-domain L3, before taking any reference.  The other callers of
> > init_xen_l4_slots() all run once the L3 exists; have init_xen_l4_slots(=
)
> > check that with a BUG_ON().  An ASSERT() would not do: the case above
> > arises only in release builds.  libxl is unaffected: it creates the
> > vCPUs before it builds or restores a domain.
>
> Isn't setup_compat_l4() similarly affected? XEN_DOMCTL_set_address_size
> may (in principle) be issued ahead of the domain having any vCPU-s.

setup_compat_l4() is called in a for_each_vcpu loop, so can't be run
if there are no vCPUs.

> Independent of that, how about pulling hvm_domain_initialise()'s
> create_perdomain_mapping() up into arch_domain_create() instead of the
> code additions you do?

So, let's see if we can solve it "properly".  Constraints:

- Eventually, not all domains will have a domain-wide L3; some will
only have per-vCPU L3s.

- init_xen_l4_slots needs a domain always, but only needs a vcpu to
get the L3 of vcpu_pt domains.

- PV vcpu_pt domains don't need an L3 installed after
init_xen_l4_slots; they need to run on a clone of the L4 anyway.

So by the end of the series, we could arrange it like this:

non-vcpu_pt domains always allocate d->arch.l3_perdomain in
arch_domain_create.  vcpu_pt domains always allocate
v->arch.l3_perdomain in arch_vcpu_create.

Have __init_xen_l4_slots() take a domain and an L3; if the L3 is NULL,
leave the perdomain slot empty.

Have init_xen_l4_slots() take a vcpu.  BUG_ON(is_hvm_vcpu(v) &&
v->arch.asi.vcpu_pt && !v->arch.l3_perdomain), then pass the
appropriate l3 into __init_xen_l4_slots().

Have init_xen_l4_slots_pv() take a domain, and always pass the domain
and d->arch.l3_perdomain to __init_xen_l4_slots.  This will be NULL
for PV vcpu_pt domains, but that's fine.

Then promote_l4_table() calls init_xen_l4_slots_pv() with a domain,
and loses both the checks at the top.

There are corner cases to sort out, like how idle domains get an L3;
but overall I think this makes everything more robust.

Thoughts?

 -George

