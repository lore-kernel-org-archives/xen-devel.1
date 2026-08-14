Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF2BC5CFCF
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 14:51:17 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391229.1631159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wutFE-00030l-C3; Fri, 14 Aug 2026 14:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391229.1631159; Fri, 14 Aug 2026 14:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wutFE-00030e-9V; Fri, 14 Aug 2026 14:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1391229;
 Fri, 14 Aug 2026 14:50:50 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wutFC-00030X-GB
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 14:50:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wutFB-00Cvij-Hn
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 16:50:49 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7f2b29-2eae-0a2a0a5409dd-0a2a450990d8-34
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 16:50:49 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7f2b48-be1a-0a2a45090019-d15580b6c125-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 16:50:49 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-80c5cb9a888so11315017b3.3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 07:50:49 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1786719048; cv=none;
        d=google.com; s=arc-20260327;
        b=FzH0G1BT+VXYGPqXKuAjUb0hvlaqowE6qxKV7goMjxqHOqjyHSWvjYk0+c2Qu4s3CT
         6hF4Ag5hII9YCEkCFCrisiCoOATfFGRZR9rPjf9HSN340VQrk8/v7h6YN44p/X7fdzDS
         tSaRgfw1R3yebrigma6SY86UbJK6z0AuoT+D7XKWMskw8W1GxIFc9cpyC/KWgo9VltER
         k+uXSCZPYiqP+ildSi4lkiaLZD3CO1o6515zM9o8qIZjzh2lFHc4dBn/Ku1RYqbHWnr/
         sPoK4wiBMd5LLtioTs0ZAO4EZH+OzvyU/UXT7Fe/eVqLIIXgvRy5wtXhlg300L7f8ts+
         yWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E/4yGc1GO/4xhyAkR/ReVly2tZXCtuDF0va2XZ3XnU0=;
        fh=+8uuvvAtGuYzkIe1S/eNSmuGQdVeF4D76F90SYKR0TE=;
        b=FPVB6n95kQL1X6UqQYu1sQjxA8ew7/qzZa7MmtqqFPz3AZcuucqxjaRvGTPslmj2RD
         RwYDHWsMKPdxXJM3ZlOlBvY89MjbwgaSnRRZp/gThXxjCeVBF/P8rpnQEPNKFurcmomm
         2FbMIOoPYF2dNyeTFIyEdb+LOrsdoR3SNrzbL3g9HiFCHUiTQ2XjpcMTtsE8qFpkZ+Vi
         hOqbWOu1xxjXqi+fTJAGUYfpUfTEQk6K/k0Timnze/CVl+n8JaniO4Nsmj+V23o5XsSy
         w7CHYJzj2116pTJIrhydS0hqm+3BSDI6a55NH8u6bwxZ6MC2BEhIEf6z3BdW06XPOCCI
         YxeA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786719048; x=1787323848; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/4yGc1GO/4xhyAkR/ReVly2tZXCtuDF0va2XZ3XnU0=;
        b=WsuJSwClN6yrCDxQa8IYxmmuIt1gZNBqR6WEYLfbWdrRoPJEqO7CB71DgFbldnAcqf
         gH7EdhOqKjf0RTusEMndEaaKm3+xL2KgOqo4Hz2710dAFLF3gJFeBL8lfjt/JEJD1af/
         tGRMQ4PrRul8GzbqyVxHv/B/TfXvdKHl8a9rIoFFHfAnNmO1IqcNEnYrp/onKffIoMrg
         ak8rl7iz4sWzDwJQC3gnO+nwn7UZy4N/Z1elNeMZ4z84ANtCFZ1Bh7SJv79SYeKlLqah
         FCv2NFWUGdPAGYZFASgitETIpB6kY3KAq/eHpsUBloZtKc2aVnZSSzbIFPtgSq8PKYiw
         j/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786719048; x=1787323848;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E/4yGc1GO/4xhyAkR/ReVly2tZXCtuDF0va2XZ3XnU0=;
        b=VgoURGPmadBacIikXbGfEd+DdYMgoOOQJRFNJ/s1k5ga1tJpyiWXWXu8UftM0OxBRC
         zropicdKseJA/ba6KwqaH/u04bbzhrOy0BvaIyca6XKhZ8k7zluO0OhAgBQRnhB3ghOz
         +ttq3hSdW8OUCkwsD/eJg9+bh8ze/SGhzpVGagoWDk6zPuQf+GuziK8XR9PbU0sd6km7
         bS90ePCVlPwOngZIJq9Abea1CeVqKiBaH4bY/kKPfjRAXGsciKx3LBAX1/2sZcGl+0/D
         qgwd/cbMrKPuZtdhSdMRBnRBhU44moR2thVv51oGWWcXtfpOQYcRqoH/DWgjwEIA3b4N
         YFIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFVjPbP+E/L7BuoAlvvlQs/klWfxrPf0I89XIP2LrNANCj8DV1ZNww4fyfJYBeJuttnIS+P3KXRzM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZNdt7XEmPDk+DXZqbN+wwvx/5bMnR/nubeFyGVEoKoslB9cSO
	QpDOxtj+R4gBLviY5iQsJJNADofw1FMytlKrpDLs9R9ji+aUj8Mso2VqVpURxRoHBGKoraRphe+
	KDC5poZNsm40gL+dxZ5etG77S0CcGfJ4=
X-Gm-Gg: AR+sD10Xn7SAOP134Cwb4jQStWAsigOnAcY1CEFOmLeP+aE7AYJA0CrVKf7gdSxK3UT
	LzebLgXsITmEWuxrAJW+crbg7O7MBmGboe10A/TATb6sHibnyJOM7LLmscaaL11k0/xdFcR7xwR
	/KkWWuLhQ1OeQPCMM/o08DLKocyLBjMlevozlFJwro1s9+Fo/9iK6InmwNG6zFwq7+nVLJDLqkl
	augoxvZiMLdw6wNmxIRBJwLFGZ0zrhiO+e1Xa869ey9LurwjwU3tBpFc+k+ZcUdxqJdSDz0ZLFo
	VkLERXU975FHSUuquENzvw6nfb/3JmF9+UCjeQ+HCqMpDKh67YX08YzWnxoYjkTe589Vw6VF4Go
	G
X-Received: by 2002:a05:690c:6f07:b0:81e:98d3:cac7 with SMTP id
 00721157ae682-8370e1a4f82mr30979037b3.12.1786719047751; Fri, 14 Aug 2026
 07:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com> <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
 <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com>
 <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com> <CAHt6W4dWQvSg1_XtkKowTcznUWs=-ApbvatV4YrQSKR8zJTA0A@mail.gmail.com>
 <e3d4f0a8-e95a-4dc3-8ca0-df857725d60d@suse.com>
In-Reply-To: <e3d4f0a8-e95a-4dc3-8ca0-df857725d60d@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 14 Aug 2026 15:50:36 +0100
X-Gm-Features: AUfX_mxvtpWf_8OU8VEG4jSe6KsYbHmTadYhbDzZVsnYQd6VOrBl-wQLjkmnRnk
Message-ID: <CAHt6W4ftLMsk41zdwYUXEwN_JzzXHQG01vhSqutkgk8PO6xAQw@mail.gmail.com>
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1786719049-FC212034-A753EA0D/0/0
X-purgate-type: clean
X-purgate-size: 8768

On Fri, 14 Aug 2026 at 15:13, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 14.08.2026 15:47, Frediano Ziglio wrote:
> > On Thu, 13 Aug 2026 at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 13.08.2026 16:03, Frediano Ziglio wrote:
> >>> On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 10.08.2026 12:30, Frediano Ziglio wrote:
> >>>>> ---
> >>>>>  xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
> >>>>>  xen/include/public/memory.h |  45 ++++++++++-
> >>>>>  xen/include/xsm/dummy.h     |  14 ++++
> >>>>>  xen/include/xsm/hooks.h     |   2 +
> >>>>>  xen/xsm/flask/hooks.c       |  10 +++
> >>>>>  5 files changed, 219 insertions(+), 1 deletion(-)
> >>>>
> >>>> As before: If you insist on not implementing the compat case, that decision
> >>>> wants justifying in the description. Without that it'll look like an
> >>>> oversight.
> >>>>
> >>>
> >>> Yes, I was just going to reply.
> >>> I spent multiple days trying to implement the compat case or simply
> >>> HVM support with an issue after the other:
> >>> - multiple distributions removed the 32 bit support so it was hard to
> >>> have a setup;
> >>> - the original hypercall this PR is trying to optimise is supported
> >>> only in PV (so no HVM or compat guests);
> >>> - migration and other operations can work only on PV (like dm_op
> >>> operation) due to the usage of userspace handles used.
> >>
> >> I don't understand how use of guest (not userspace) handles would get in
> >> the way of anything.
> >
> > In this case userspace is not a typo. For HVM
> > copy_from_user_hvm/copy_to_user_hvm are used and these functions
> > accept only kernel space pointers.
>
> I fear you've now completely lost me.
>

Try to pass a handle to a userspace page and the functions above will
fail because they won't accept userspace pages.

In guest_walk_tables you have:

    if ( walk & PFEC_user_mode ) /* Requested a user access. */
    {
        if ( !(ar & _PAGE_USER) )
            /* Got a supervisor walk?  Unconditional fail. */
            goto out;

        if ( (walk & PFEC_write_access) && !(ar & _PAGE_RW) )
            /* Requested a write and only got a read? Fail. */
            goto out;
    }
    else /* Requested a supervisor access. */
    {
        if ( ar & _PAGE_USER ) /* Got a user walk. */
        {
            if ( (walk & PFEC_insn_fetch) && guest_smep_enabled(v) )
                /* User insn fetch and smep? Fail. */
                goto out;

            if ( !(walk & PFEC_insn_fetch) && guest_smap_enabled(v) &&
                 ((walk & PFEC_implicit) ||
                  !(guest_cpu_user_regs()->eflags & X86_EFLAGS_AC)) )
                /* User data access and smap? Fail. */
                goto out;
        }

        if ( (walk & PFEC_write_access) && !(ar & _PAGE_RW) &&
             guest_wp_enabled(v) )
            /* Requested a write, got a read, and CR0.WP is set? Fail. */
            goto out;
    }

and we don't have a PFEC_user_mode set.

> >>>>> --- a/xen/common/memory.c
> >>>>> +++ b/xen/common/memory.c
> >>>>> @@ -1548,6 +1548,141 @@ static int acquire_resource(
> >>>>>      return rc;
> >>>>>  }
> >>>>>
> >>>>> +/*
> >>>>> + * The "noinline" qualifier avoids the compiler to create a large function
> >>>>> + * consuming quite a lot of stack.
> >>>>> + */
> >>>>> +static int noinline mem_foreigncopy(
> >>>>
> >>>> I'm wondering: Is the "mem" prefix really meaningful for a static function in
> >>>> a file named memory.c?
> >>>>
> >>>
> >>> Changed
> >>>
> >>>>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> >>>>> +{
> >>>>> +    struct domain *d, *const currd = current->domain;
> >>>>
> >>>> With the comment on the new XSM hooks (below) in mind: currd wants to be
> >>>> pointer-to-const.
> >>>>
> >>>
> >>> Just rebased on master, all XSM hooks accept no-const pointers to domains.
> >>> So the suggested change would create warnings.
> >>
> >> Well, as per below, I pointed you at a particular pending patch, a single
> >> hunk of which could be broken out.
> >
> > Yes, but my changes would have to have casts from const pointers to
> > no-const pointers to avoid warnings and the patch you are pointing to
> > would have to remove these casts. I find this less clean than having
> > one patch using the current code style (that is no-const pointers) and
> > another that changes the style entirely.
> > But obviously this is just my opinion.
>
> Such casts would be unacceptable. What instead I have been trying to convey:
> Your patch wants to gain a dependency on my patch. And if my patch would
> take too long to make it in, that one hunk could be broken out into a
> separate, easy to get in patch.
>

Okay, then the only choice that's left is the code producing warnings
as const pointers are passed to functions requiring no-const pointers.
Is this acceptable? Apparently as you are suggesting it it is.

> >>>>> +            foreign = map_domain_page(foreign_mfn);
> >>>>> +            if ( direction == XENMEM_foreigncopy_from )
> >>>>> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> >>>>> +            else
> >>>>> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
> >>>>
> >>>> What I continue to be missing prior to this is the obtaining of a writable
> >>>> page ref. That's, as previously said, imperative for PV guests and at the
> >>>> very least advisable for HVM ones. (I really wonder how many more times I
> >>>> need to comment on this.)
> >>>
> >>> Unfortunately that does not work.
> >>> The code is coherent with MMU_UPDATE.
> >>
> >> How's that relevant? That's operating on page tables, when here we want to
> >> _prevent_ to copy into page tables (or descriptor ones, for that matter).
> >
> > This new ABI is to better support migration.
> > We are migrating all the VM status including page tables... how can we
> > not be able to write them but migrate them from one  host to another ?
> > You are basically explaining why changing the check the migration fails.
>
> No, what I'm trying to explain is that without such a check, you introduce
> a security issue (of privilege escalation kind). I hope you agree that we
> cannot knowingly allow such code to be committed.
>

Then the security issue is already present in the code without my changes.

> To migrate-in page tables, you'd need to copy their contents before they
> obtain their PGT_l<N>_page_table type, so that upon being converted to page
> tables, they can be properly audited by the mm.c functions we have for that
> exact purpose.
>

That makes sense.

> >>>>> --- a/xen/include/public/memory.h
> >>>>> +++ b/xen/include/public/memory.h
> >>>>> @@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
> >>>>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >>>>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >>>>>
> >>>>> -/* Next available subop number is 29 */
> >>>>> +/*
> >>>>> + * Copy memory from/to a given domain.
> >>>>> + * This calls is meant to replace expensive operations during migration which
> >>>>
> >>>> Nit: "This call is ..." However, is ...
> >>>>
> >>>>> + * are only supported for PV guests.
> >>>>
> >>>> ... this entire sentence really worth to have here (it looks more like
> >>>> something to have in the description)? For it to be possible to find if
> >>>> someone considered using those "expensive operations", I think it would need
> >>>> to be less vague and name those operations. Furthermore, if those other
> >>>> operations were supported only for PV guests, how would migration work for
> >>>> non-PV ones?
> >>>>
> >>>
> >>> Maybe:
> >>>     This call is meant to replace expensive operations (mmap/copy/munmap) during
> >>>     migration which can only be issued from PV guests.
> >>>
> >>> You can migrate any domain. Just from a PV guest (this is not a regression).
> >>
> >> Both Andrew and Roger confirm that this is supposed to work also from PVH
> >> Dom0 (not sure why you keep saying "guest"), and also used to work. If it
> >> doesn't, it would be a regression, and it would help if you supplied more
> >> detail on the observed failure.
> >
> > Indeed I tested the migration of various domains (PV, HVM, PV-in-PVH),
> > but only access to added hypercall from PV and HVM. I should add a
> > test from a PVH guest.
> > I say guest because to test HVM I used a hack to allow all guests (not
> > only dom0).
>
> And why would testing from PVH Dom0 not do?
>

Just that it's easier for me testing from a different guest.

> Jan

Frediano

