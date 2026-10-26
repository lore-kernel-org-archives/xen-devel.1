Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0491B606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=QlrXhYgz
Received: from list by lists.xenproject.org with outflank-mailman.1461071.1672015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHwa-0005J9-65; Mon, 26 Oct 2026 10:28:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461071.1672015; Mon, 26 Oct 2026 10:28:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLHwa-0005J2-2y; Mon, 26 Oct 2026 10:28:44 +0000
Received: by outflank-mailman (input) for mailman id 1461071;
 Mon, 26 Oct 2026 10:28:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xLHwY-0005Iu-KV
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:28:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xLHwY-0000000EZ3z-3Bqj
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:28:42 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xLHwY-00000001srr-2v9J
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:28:42 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3ab28f3e4dcso31510091fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 03:28:42 -0700 (PDT)
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
	bh=dkW7G0VtuBqBdkVDSE4JuBU6fPDgpB58bfQi0jx+Tq8=; b=QlrXhYgz6mT7n3t9eAR7tPPGbU
	1G67lVIrX12UhF2X6C5+S2IyINFBBg9rU9OjVClQ1yhL/NxeZhoFRf5Cly0clJyng86f885IN90Zx
	YuOgarr/zDZnPW7Ka3dtlkAv8BQfmZCf2UYpSnmhDwfE2BD/iF+3yD8Gp9UHrLqKZYfo=;
X-Gm-Message-State: AFq9FYKWM58O/Ct2I/9kdru5tpZ3q4GVCAFXf2cs/JPVqLipzdrRVfoo
	FgI5y1TnoW37bNl4NTID+o9TV/9nV2li7wtHxa/pWVC491MkA7OldKhDPCzzJJ48fWKFfdeDOFZ
	qyU/yqR7OX4a2t5+kXSDetCGCB65tgyw=
X-Received: by 2002:a05:651c:1613:b0:3a9:89aa:618a with SMTP id
 38308e7fff4ca-3ac6fd095c8mr15239661fa.12.1793010521438; Mon, 26 Oct 2026
 03:28:41 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-asi-hvm-v4-0-b68b66652266@xenproject.org>
 <20261019-asi-hvm-v4-2-b68b66652266@xenproject.org> <atsHU5ywFeNb0TlZ@Mac.lan>
In-Reply-To: <atsHU5ywFeNb0TlZ@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Mon, 26 Oct 2026 10:28:29 +0000
X-Gmail-Original-Message-ID: <CAFLBxZbHj1wLeTUE8U4n5UXr74KK6DBndbgZ6cXT_af8AXJA3A@mail.gmail.com>
X-Gm-Features: AclHuK9gSrJt3oJl87YE5AYr1LbY7_3e_CNfbqbvI9lC1JYPM_mWEjaxWkI5AaA
Message-ID: <CAFLBxZbHj1wLeTUE8U4n5UXr74KK6DBndbgZ6cXT_af8AXJA3A@mail.gmail.com>
Subject: Re: [PATCH v4 02/30] x86/mm: refuse to promote an L4 while the domain
 has no vCPU
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 8:06=E2=80=AFAM Roger Pau Monn=C3=A9 <roger@xenproj=
ect.org> wrote:
>
> On Mon, Oct 19, 2026 at 08:42:33PM +0100, George Dunlap wrote:
> > init_xen_l4_slots() puts the domain's per-domain L3 in slot 260 of the
> > L4s it fills.  Since fcf91ce9de66 ("x86/pv: don't populate the GDT/LDT
> > L3 slot at domain creation") a PV domain gets that L3 with its first
> > vCPU (pv_create_gdt_ldt_l1tab()).  Only mapcache_domain_init() makes it
> > earlier, with the domain, and release builds skip that unless memory
> > hotplug is enabled or the host's memory reaches past the part of the
> > directmap PV guests can see.  So in release builds on most hosts, an L4
> > promoted before XEN_DOMCTL_max_vcpus has created the domain's vCPUs get=
s
> > a slot 260 entry made from a NULL page (0x803e900000000063), pointing
> > far beyond the host's memory.
>
> Won't it be more reliable long term to instead return an error from
> init_xen_l4_slots() when the per-domain L3 page is not present?
>
> It does seem like PV vCPU creation could change yet again in a way
> that the per-domain L3 is not allocated there, and then the check
> added in this patch will be moot.  If we need the per-domain
> page-table to be allocated by this point, let's test for that, not
> indirectly testing whether vCPU 0 has been created.
>
> I also wonder, this is for PV only, but I assume for correctness
> purposes we should do the same check for HVM monitor tables also?

Eventually we modify init_xen_l4_slots to take a `struct vcpu*`; if
there are no vcpus, we can't pass it anything.  For vcpu_pt domains,
that would technically be fine, I think, since the L3 is written in on
context switch anyway.  But we would still need some sort of fall-back
if d->vcpus[0] =3D=3D NULL but d->arch.perdomain_l3_pg !=3D NULL.  Is it
worth trying to figure out how to handle that case, just to save us
time in case we change the vCPU creation again?

We could change this patch to check `d->arch.perdomain_l3_pg` instead;
if we end up backporting this it certainly does make the check more
robust.  But we'd still have to add the vcpu check later.

 -George

