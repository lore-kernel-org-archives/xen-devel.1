Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7ABC79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 19:30:32 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413638.1643744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Nzs-00015U-Od; Wed, 09 Sep 2026 19:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413638.1643744; Wed, 09 Sep 2026 19:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Nzs-00015N-Lr; Wed, 09 Sep 2026 19:30:16 +0000
Received: by outflank-mailman (input) for mailman id 1413638;
 Wed, 09 Sep 2026 19:30:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dunlapg@umich.edu>) id 1x4Nzr-00015F-Cd
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 19:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Nzq-008d9S-Kz
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 21:30:14 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aa1b3c4-2eae-0a2a0a5409dd-0a2a4501d4c2-0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 21:30:12 +0200
Received: from [18.216.144.57] (helo=yurei.relay-egress.a.mail.umich.edu)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <dunlapg@umich.edu>)
 id 6aa1b3c2-5984-0a2a45010019-12d89039b882-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 21:30:11 +0200
Received: from cordial-tupilaq.authn-relay.a.mail.umich.edu
 (ip-10-0-73-96.us-east-2.compute.internal [10.0.73.96])
 by yurei.relay-egress.a.mail.umich.edu with ESMTPS
 id 6AA1B3C2.133EE0D3.3FA85465.863495; Wed, 09 Sep 2026 15:30:10 -0400
Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com
 [74.125.230.76])
 by cordial-tupilaq.authn-relay.a.mail.umich.edu with ESMTPSA
 id 6AA1B3C1.1D89F1BC.69C29CAE.2253200;
 Wed, 09 Sep 2026 15:30:09 -0400
Received: by mail-lr2-f12.google.com with SMTP id
 38308e7fff4ca-3a2ff16c0e6so5486881fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 12:30:09 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=relay-2 header.d=umich.edu header.i="@umich.edu" header.h="References:In-Reply-To:From:Date:Subject:To:Cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umich.edu;
	s=relay-2; t=1788982210;
	bh=3qD7oKjtga1WJ5C1IefDKa3vD1bZ+h2/LGmahRIrgXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bq4nzcS4+2Blo9xL7PrBoPvqc9yyz1vMBSDaer2qa0m5eDa8xfE/K/ZsE8aXlV5Ug
	 lym5HGJk0vxZLLoKJFssHc+bt2jR/3FY9OBiNQhLmDke6egEq/hSktrAi5cvIyZYUa
	 aq4ooFm31HU6XFuXy9oUwW3eCWqolhpTR6tJvRUq/NsHxVLf4uawIzzZLBMV7ZBbGN
	 YA7khTmYJVzU8tlpkobbE0ncjsNnutJ9Kxh5JL1Zk1EpTVxWBJULzEUzdVDPQbjPxQ
	 +IPp0a90ntIO+ANLU1nIjZCzHdLGFIBn9z5VVYaJdEJuWWp7dgBaM64SLvoSin2jhX
	 icUUVinACpYwg==
Authentication-Results: cordial-tupilaq.authn-relay.a.mail.umich.edu; 
	iprev=pass policy.iprev=74.125.230.76 (mail-lr2-f12.google.com);
	auth=pass smtp.auth=dunlapg
X-Forwarded-Encrypted: i=1; AKwUvBypSZGbC0Ma/ZTHbijOIoLE1m9XXifHnyfHcYaSPn4xGSYOwWd80dPVk2Kj3rGAuBHAOQodOKEVTR4=@lists.xenproject.org
X-Gm-Message-State: AFuF++nqVMWQRsxSnCrAlhmREnjxZBIMPydIcZH7aY9hxx3gg39qZtqP
	YeDSAt9EcNvmw1Cn55YTZRsbCqKlOBf7jpVE2ZKn9Fq6QmE7JFN2Ns+MOsVGHnL3GrWA/jrF83R
	e7hHkambOFCmgQxVuE9suvwGDIIzitzM=
X-Received: by 2002:a05:651c:2121:b0:3a3:63a:bb06 with SMTP id
 38308e7fff4ca-3a58d516346mr3673451fa.13.1788982207312; Wed, 09 Sep 2026
 12:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-asi-part2-0-ecc269f268b7@xenproject.org>
 <20260901-asi-part2-5-ecc269f268b7@xenproject.org> <99a68a9d-79f0-4090-b0ed-3afdddb57fd6@suse.com>
In-Reply-To: <99a68a9d-79f0-4090-b0ed-3afdddb57fd6@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Wed, 9 Sep 2026 20:29:54 +0100
X-Gmail-Original-Message-ID: <CAFLBxZbJYJu4u8X9HYo61kiKZc3jQq0gG9t7M8t9_8F+x7zgLA@mail.gmail.com>
X-Gm-Features: AcwNN1XAVmO1-fFBfTxrYUyBqNyuO2Xjj88aughFA6ydXdhdZgdpTzeKlmyngPY
Message-ID: <CAFLBxZbJYJu4u8X9HYo61kiKZc3jQq0gG9t7M8t9_8F+x7zgLA@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] x86/pv: update guest LDT mappings using {populate,destroy}_perdomain_mapping()
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Alejandro Vallejo <agarciav@amd.com>, Teddy Astie <teddy.astie@vates.tech>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d62444/1788982212-1D47D757-B5783638/0/0
X-purgate-type: clean
X-purgate-size: 3684

On Mon, Sep 7, 2026 at 5:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 02.09.2026 11:43, George Dunlap wrote:
> > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Until two patches ago, update_xen_slot_in_full_gdt() used the stashed
>
> With wording at the start here and ...
>
> > pointer in d->arch.pv.gdt_ldt_l1tab to update the incoming vCPU's page
> > tables with Xen's GDT; this was previously necessary because
> > map_domain_page() couldn't be called in a context switch.  Having a
> > handy pointer to an always-mapped version of the GDT/LDT L1 table,
> > other sites which modify the table started using it for convenience,
> > even if they weren't called from within a context switch.  These
> > include pv_map_ldt_shadow_page() and pv_destroy_ldt().
> >
> > Continue the process of switching users of the stashed reference to use
> > populate_perdomain_mapping() instead.
> >
> > pv_map_ldt_shadow_page() is, by definition, always modifying the
> > currently-running vCPU: it runs from the #PF handler for a descriptor
> > fetch on the guest's behalf, and running the guest implies its page
> > tables are loaded.  So it could simply write the linear recursive
> > mappings directly.  Go through populate_perdomain_mapping() anyway, to
> > keep a single writer for the per-domain area.
> >
> > For pv_destroy_ldt(), use destroy_perdomain_mapping().
> >
> > Previously, pv_destroy_ldt() used the L1 LDT entries themselves to
> > determine which MFNs to drop type and count references to.  Rather
> > than reading from the stashed L1, keep the MFNs corresponding to L1
> > slots in an array in the vCPU structure, as we do in the GDT case.
> > (Note that unlike the GDT case, these are not part of a public ABI, so
> > can be mfn_t, avoiding a recast-and-copy.)
> >
> > Note that mappings_dropped (the return value of pv_destroy_ldt()) now
> > reflects the *number of valid MFNs in this array*, not *the number of
> > non-empty L1 entries*.  This introduces an invariant we must maintain:
> > pv_map_ldt_shadow_page() writes both the array entry and the mapping,
> > and pv_destroy_ldt() clears both, so the two stay in lockstep.
> >
> > Also note that, unlike pv_destroy_gdt() from the previous patch,
>
> ... here adjusted as per the comment on the earlier patch, ...
>
> > pv_destroy_ldt() doesn't fill in the values with zero_l1e (see
> > 61031e64d3), so there's no change here.
> >
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > Assisted-by: Claude Code:claude-fable-5, Claude Code:claude-opus-4-8
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
> On the basis that ...
>
> > --- a/xen/arch/x86/include/asm/domain.h
> > +++ b/xen/arch/x86/include/asm/domain.h
> > @@ -541,6 +541,8 @@ struct pv_vcpu
> >      struct trap_info *trap_ctxt;
> >
> >      unsigned long gdt_frames[FIRST_RESERVED_GDT_PAGE];
> > +    /* Max LDT entries is 8192, so 8192 * 8 =3D 64KiB (16 pages). */
> > +    mfn_t ldt_frames[16];
> >      unsigned long ldt_base;
> >      unsigned int gdt_ents, ldt_ents;
>
> ... this not really insignificant size increase is okay-ish as long as
> struct hvm_vcpu is about three times the size (i.e. is still more than
> double the size after this change).

FYI it looks like by the end of the whole series struct pv_vcpu has
net zero change: we add this array, but then move the mapcache
structure out into arch_vcpu.  In turn arch_vcpu by the end is an
extra 256 bytes, but with some rearrangement, we can reduce padding
and increase struct vcpu by only 192 bytes.

 -George

