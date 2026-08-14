Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF7BC5CFDB
	for <xen-devel@archiver.kernel.org>; Fri, 14 Aug 2026 13:47:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1391171.1631137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wusGB-0001QW-H3; Fri, 14 Aug 2026 13:47:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1391171.1631137; Fri, 14 Aug 2026 13:47:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wusGB-0001QP-EO; Fri, 14 Aug 2026 13:47:47 +0000
Received: by outflank-mailman (input) for mailman id 1391171;
 Fri, 14 Aug 2026 13:47:47 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wusGA-0001QH-QQ
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 13:47:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wusGA-004CpO-7L
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2026 15:47:46 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7f1c4f-8faa-0a2a0a5109dd-0a2a450a9788-38
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 15:47:46 +0200
Received: from [209.85.128.173] (helo=mail-yw1-f173.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a7f1c81-f2d2-0a2a450a0019-d15580adb8cb-3
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 15:47:46 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-836cd7310f4so14792377b3.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Aug 2026 06:47:45 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1786715264; cv=none;
        d=google.com; s=arc-20260327;
        b=ekF/Wjy8/9BcJBtpbrhmYgd6eOcqlsgwwr2i6GiIvdXFrtpqRZ8k8Ol1JeX2Onpl1A
         T2//6Nkx3NZat9PQR/Ivkzc4x07LYeTsJ9QzkRTQa2i+LoKff2Afu4YkFtW97UiwmhEk
         VMW+OX1KQ7LwpUE+CMKRvEQm4YsT0DVZn1YT6iW2/iI6IL9kdrqbBusYyH9f0hy0lOtr
         D3oV90zJm2TQIZwcPt+ZCEhrgSw2lsC1dl0Yfzmv2a+uWSR9bFO2nikwoAISz15XuBfv
         gp0hQCc497fAc6x1NUHafIvI/rw/QijuMKpwW8wWm43IaLrqsogIUNvWNQ4hTrKFEs0q
         KHSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=W2YadiQYSzgyYJ9IK/rYVW4O2YXcHVheqwPBtyy4/vE=;
        fh=XLNOpo6s19qwRxdIwryUTiROZT17MZF7LmKEa/QUxms=;
        b=mvYosD1o5VJW0a1YzjdoDyxTTj1Vjf52fAMoQBMVQEo0E3d+JRmhw3CZo+OdCjAzUd
         Qgwf9njh7y97FGrWtCLhHq9odH551LRGweNZ/WScAXivsTbIHwTOroKWkUJEMavwi7j7
         apHGKiQoiSxgAY0A2JFkzpRH292f+kC4PkXZbQhjZ/Dx0qAI5amw8RfJNAFmUm7g5j2W
         hSVQd0uCOy4d7tUv5tWgwiz8zok136geJfe11/J5IswrF3Vmf2wXZudipRbFZnbv5RNB
         tp77x0/vp23bOu+KuSrFu+oq7p2eZmABhG/epvOI4jZBM3eCMKluc5huIecPbN3Xg8Wx
         72Wg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786715264; x=1787320064; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W2YadiQYSzgyYJ9IK/rYVW4O2YXcHVheqwPBtyy4/vE=;
        b=Tbgq3naGbGK0YgkVd796wUlZxilMl/N5ALNipsozNs30kyrGWKRIx/5oAoretBXKML
         WTVD3qLjP88cy/wwL3GbohPjclTm6oBpZTZcPmJ8Y207+R1RDvLRAGKMR3ITnJg6s3/t
         80n3Lmj1+O5Pq05xPBoYW9RpVHtE8/71pmIwzrxHR72XfkZNVrdZteAUbIGTg43OSyVF
         jOBqE6J6fO982NSneauHz70FvVpP+8c0pVDgY9/zwX6c5BN24wWcPZveWvZFUMnjLyYa
         JjQ5pEbo7h72ilZTj/QKhhWHqAk55jHoKEixWARdXVANQHOi52A3qk8k6yLxd/GJ5pn+
         0yBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786715264; x=1787320064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W2YadiQYSzgyYJ9IK/rYVW4O2YXcHVheqwPBtyy4/vE=;
        b=oDYlOdjRoOI+nEZiHk9MtHg3lQVyhkLw6Avmxrb0SaF8/eg3ofSWhzJM/zRDqac//M
         5to5PK1wMgTZFWllrpWVLD54FsWBuiZE/t8KRxl/kJBHI6/DI5+/H30CqXiF3xK/HY/A
         kPE9cUapOEfCTH2c+DlrWEjBShdJEwaWfuAXKV8bZaC85HUcA5cWC40nAPpT31R2mQyn
         1BUVxyImtB/KTQyj7sAc6EIikj21LU8qEN67ocDBYLW3Kmt9dM/efQ0pjIWs8NQrKSSE
         DX+/NMdN/IPNVsWl8rx9UkMGjNRvrZGrGJXNDp+EEop6PR21ocXhtrsVk5UmMjfGVvMA
         3CkA==
X-Forwarded-Encrypted: i=1; AHgh+RrvVUPXfR+AVEuOsoGv4YVMALWYIcjHx5GVKo94o9psC6YjFt00tFdKUUVzrD9ti2ev27XyRCvnqX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxEsOzVmYzgasb+IHvaLsIonU0hYcIp/irUAMQEtW4rNS/av3O/
	fZzZ9JKmP5IF2RzYqXfWcliFyPsiJA6z2oc4cu8uoCISR0f7yt5T+iwMoYYW3Itkv0KPMGbPXni
	dbgKyDpQDups4HqrSCo9JdYC03DcA9AY=
X-Gm-Gg: AR+sD10YkBvQqUVxLlBEtkXkFVl+BaZkXVSiPHItyGtxfpzfdHWrtLaBu3+B/EDDcuD
	A2QF54pt1cMBfA90s4lM3KXKkUIuYPouCtCJxAgp3nkdDuVTMCfGD2pcIZBDg4o/fMMlVXCbh/1
	tyUe/uQW8JZGUgoQxG3DASWqsVjgJaL29dhYs/W4Hz6IYo23fp7KozLEBBU6C0J9DwAlGmGz9/p
	+o911p4kIj07HlIhNkcmJRuZ+iCxvoYWFkcEFq04H8YXvQNP9VUSWvphQSQhbxVM1Masa5Ddq39
	PfktU/rXSOFL7nwuJyJ5AqPNixTkZa1eLqgli3CxVFELGgT77AIaenrV1URlaZdSpaPh7vOOFHy
	+
X-Received: by 2002:a05:690c:6201:b0:81f:64cf:2c44 with SMTP id
 00721157ae682-8370e7827d3mr25159547b3.14.1786715264344; Fri, 14 Aug 2026
 06:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260810103018.54564-1-frediano.ziglio@citrix.com>
 <20260810103018.54564-8-frediano.ziglio@citrix.com> <43d1ce4a-3a49-42c9-b277-47a89698513f@suse.com>
 <CAHt6W4enamC9rVMK98+q=pWCuXQL1DPgNTCGWMVR-Q2NvX8uTw@mail.gmail.com> <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com>
In-Reply-To: <b10dbef6-a467-49d0-858e-d88f268e2dfd@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Fri, 14 Aug 2026 14:47:32 +0100
X-Gm-Features: AUfX_mzzgD4tkUt6nS94v_gjfxJ98h07eQZao88M1BbKnnnC7DbMDEyB-JgKkds
Message-ID: <CAHt6W4dWQvSg1_XtkKowTcznUWs=-ApbvatV4YrQSKR8zJTA0A@mail.gmail.com>
Subject: Re: [PATCH v10 7/10] xen: implement new foreign copy hypercall
To: Jan Beulich <jbeulich@suse.com>
Cc: "Daniel P . Smith" <dpsmith@apertussolutions.com>, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1786715266-52EDACFC-576CCCCA/0/0
X-purgate-type: clean
X-purgate-size: 11688

On Thu, 13 Aug 2026 at 15:22, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 13.08.2026 16:03, Frediano Ziglio wrote:
> > On Thu, 13 Aug 2026 at 10:41, Jan Beulich <jbeulich@suse.com> wrote:
> >> On 10.08.2026 12:30, Frediano Ziglio wrote:
> >>> Add a sub hypercall to __HYPERVISOR_memory_op to allow to read/write
> >>> memory from/to a foreign domain.
> >>>
> >>> Extending MMUEXT_COPY_PAGE seems better on first sight but considering
> >>> that MMUEXT is meant for PV only and trying to change that sub-op this
> >>> solution is better.
> >>>
> >>> Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
> >>
> >> First: Can you please update your recipient list before sending a new version?
> >> Roger's move pre-dates this submission by quite a few days.
> >>
> >
> > Yes, updated, I realized it after sending it.
> >
> >> Then: The asymmetry of the new sub-op also continues to have no justification
> >> at all. If you insist on not using two (domid,list-of-gfns) tuples to describe
> >> the buffers, despite multiple maintainers having asked you to do so, please
> >> put down a word explaining that decision.
> >
> > All other maintainers, after replying to their comments didn't
> > disagree with me, and this was different versions before, so stop
> > counting them, it's only you that don't like this at the moment.
>
> None of this happened in public, though? In which case, how would I know?
>

The discussion with Terry happened in public. The ones with Roger
probably not, but as you knew it means that whoever reported to you
reported only half of it (or maybe at the time it was reported he
didn't know).

> >>> ---
> >>>  xen/common/memory.c         | 149 ++++++++++++++++++++++++++++++++++++
> >>>  xen/include/public/memory.h |  45 ++++++++++-
> >>>  xen/include/xsm/dummy.h     |  14 ++++
> >>>  xen/include/xsm/hooks.h     |   2 +
> >>>  xen/xsm/flask/hooks.c       |  10 +++
> >>>  5 files changed, 219 insertions(+), 1 deletion(-)
> >>
> >> As before: If you insist on not implementing the compat case, that decision
> >> wants justifying in the description. Without that it'll look like an
> >> oversight.
> >>
> >
> > Yes, I was just going to reply.
> > I spent multiple days trying to implement the compat case or simply
> > HVM support with an issue after the other:
> > - multiple distributions removed the 32 bit support so it was hard to
> > have a setup;
> > - the original hypercall this PR is trying to optimise is supported
> > only in PV (so no HVM or compat guests);
> > - migration and other operations can work only on PV (like dm_op
> > operation) due to the usage of userspace handles used.
>
> I don't understand how use of guest (not userspace) handles would get in
> the way of anything.
>

In this case userspace is not a typo. For HVM
copy_from_user_hvm/copy_to_user_hvm are used and these functions
accept only kernel space pointers.

> > I tried to bypass the above limitations to have the new hypercall
> > tested and I manage to have 64 bit HVM working but the result is a
> > collection of nasty hacks and supporting them properly is a different
> > bigger task.
> > Surely a comment in the commit message on this is worth it.
>
> Thanks.
>
> >>> --- a/xen/common/memory.c
> >>> +++ b/xen/common/memory.c
> >>> @@ -1548,6 +1548,141 @@ static int acquire_resource(
> >>>      return rc;
> >>>  }
> >>>
> >>> +/*
> >>> + * The "noinline" qualifier avoids the compiler to create a large function
> >>> + * consuming quite a lot of stack.
> >>> + */
> >>> +static int noinline mem_foreigncopy(
> >>
> >> I'm wondering: Is the "mem" prefix really meaningful for a static function in
> >> a file named memory.c?
> >>
> >
> > Changed
> >
> >>> +    XEN_GUEST_HANDLE_PARAM(xen_foreigncopy_t) arg)
> >>> +{
> >>> +    struct domain *d, *const currd = current->domain;
> >>
> >> With the comment on the new XSM hooks (below) in mind: currd wants to be
> >> pointer-to-const.
> >>
> >
> > Just rebased on master, all XSM hooks accept no-const pointers to domains.
> > So the suggested change would create warnings.
>
> Well, as per below, I pointed you at a particular pending patch, a single
> hunk of which could be broken out.
>

Yes, but my changes would have to have casts from const pointers to
no-const pointers to avoid warnings and the patch you are pointing to
would have to remove these casts. I find this less clean than having
one patch using the current code style (that is no-const pointers) and
another that changes the style entirely.
But obviously this is just my opinion.

> >>> +    xen_foreigncopy_t copy;
> >>> +    int rc, direction;
> >>
> >> Plain int for rc is fine of course, but direction can't go negative, can it?
> >
> > No, but the default type for constants is int and "flags" is promoted to int.
>
> Doesn't really matter. Unsigned types want using for values which can only
> be non-negative. IF nothing else, then for consistency and doc purposes.
>

Changed.

> >>> +            foreign = map_domain_page(foreign_mfn);
> >>> +            if ( direction == XENMEM_foreigncopy_from )
> >>> +                rc = copy_to_guest(copy.buffer, foreign, PAGE_SIZE);
> >>> +            else
> >>> +                rc = copy_from_guest(foreign, copy.buffer, PAGE_SIZE);
> >>
> >> What I continue to be missing prior to this is the obtaining of a writable
> >> page ref. That's, as previously said, imperative for PV guests and at the
> >> very least advisable for HVM ones. (I really wonder how many more times I
> >> need to comment on this.)
> >
> > Unfortunately that does not work.
> > The code is coherent with MMU_UPDATE.
>
> How's that relevant? That's operating on page tables, when here we want to
> _prevent_ to copy into page tables (or descriptor ones, for that matter).
>

This new ABI is to better support migration.
We are migrating all the VM status including page tables... how can we
not be able to write them but migrate them from one  host to another ?
You are basically explaining why changing the check the migration fails.

> >>> --- a/xen/include/public/memory.h
> >>> +++ b/xen/include/public/memory.h
> >>> @@ -740,7 +740,50 @@ struct xen_vnuma_topology_info {
> >>>  typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
> >>>  DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
> >>>
> >>> -/* Next available subop number is 29 */
> >>> +/*
> >>> + * Copy memory from/to a given domain.
> >>> + * This calls is meant to replace expensive operations during migration which
> >>
> >> Nit: "This call is ..." However, is ...
> >>
> >>> + * are only supported for PV guests.
> >>
> >> ... this entire sentence really worth to have here (it looks more like
> >> something to have in the description)? For it to be possible to find if
> >> someone considered using those "expensive operations", I think it would need
> >> to be less vague and name those operations. Furthermore, if those other
> >> operations were supported only for PV guests, how would migration work for
> >> non-PV ones?
> >>
> >
> > Maybe:
> >     This call is meant to replace expensive operations (mmap/copy/munmap) during
> >     migration which can only be issued from PV guests.
> >
> > You can migrate any domain. Just from a PV guest (this is not a regression).
>
> Both Andrew and Roger confirm that this is supposed to work also from PVH
> Dom0 (not sure why you keep saying "guest"), and also used to work. If it
> doesn't, it would be a regression, and it would help if you supplied more
> detail on the observed failure.
>

Indeed I tested the migration of various domains (PV, HVM, PV-in-PVH),
but only access to added hypercall from PV and HVM. I should add a
test from a PVH guest.
I say guest because to test HVM I used a hack to allow all guests (not
only dom0).

> >>> + */
> >>> +#define XENMEM_foreigncopy 29
> >>> +struct xen_foreigncopy {
> >>> +    /* IN - The domain whose memory is to be copied. */
> >>> +    domid_t domid;
> >>> +
> >>> +    /* IN - Flags. */
> >>> +#define XENMEM_foreigncopy_from 0
> >>> +#define XENMEM_foreigncopy_to 1
> >>> +#define XENMEM_foreigncopy_direction 1
> >>> +    uint16_t flags;
> >>> +
> >>> +    /*
> >>> +     * IN/OUT
> >>> +     *
> >>> +     * As an IN parameter number of frames of the domain to be copied.
> >>
> >> I think there's a comma wanted after "parameter".
> >>
> >>> +     * On output updated number of frames left (0 if success).
> >>
> >> I further think that adding "to" after "updated" would help here.
> >>
> >
> > Updated to
> >
> >     /*
> >      * IN/OUT
> >      *
> >      * As an IN parameter, number of frames of the domain to be copied.
> >      * On output updated to the number of frames left (0 if successful).
> >      */
> >     uint32_t nr_frames;
> >
> >     /*
> >      * IN/OUT
> >      *
> >      * Frames to be copied.
> >      * On output updated to the point to the first frame unhandled, if any.
>
> Nit: There's now a stray "the".
>

Removed, thanks

> >>> --- a/xen/include/xsm/dummy.h
> >>> +++ b/xen/include/xsm/dummy.h
> >>> @@ -569,6 +569,20 @@ static XSM_INLINE int cf_check xsm_map_gmfn_foreign(
> >>>      return xsm_default_action(action, d, t);
> >>>  }
> >>>
> >>> +static XSM_INLINE int cf_check xsm_foreigncopy_from(
> >>> +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
> >>
> >> I think these and ...
> >>
> >>> +{
> >>> +    XSM_ASSERT_ACTION(XSM_TARGET);
> >>> +    return xsm_default_action(action, d, t);
> >>> +}
> >>> +
> >>> +static XSM_INLINE int cf_check xsm_foreigncopy_to(
> >>> +    XSM_DEFAULT_ARG struct domain *d, struct domain *t)
> >>
> >> ... want to be pointer-to-const right away, requiring to re-base over "XSM:
> >> make Argo hooks well-formed ones" (or alternatively requiring to split out
> >> the change there to xsm_default_action()). We really should avoid gaining
> >> ...
> >>
> >>> --- a/xen/include/xsm/hooks.h
> >>> +++ b/xen/include/xsm/hooks.h
> >>> @@ -58,6 +58,8 @@ XSM_HOOK(int, add_to_physmap, struct domain *, struct domain *)
> >>>  XSM_HOOK(int, remove_from_physmap, struct domain *, struct domain *)
> >>>  XSM_HOOK(int, map_gmfn_foreign, struct domain *, struct domain *)
> >>>  XSM_HOOK(int, claim_pages, struct domain *)
> >>> +XSM_HOOK(int, foreigncopy_from, struct domain *, struct domain *);
> >>> +XSM_HOOK(int, foreigncopy_to, struct domain *, struct domain *);
> >>
> >> ... new hooks with non-const-correct parameters.
> >
> > It would honestly make sense if they were all const.
> > However at the moment this would not be coherent with the current code.
> > For instance these functions call "xsm_default_action" which does not
> > accept constant domains (xen/include/xsm/dummy.h).
> > I think the most clean thing would be first to change xsm arguments to
> > const first.
> > But it looks a bit out of scope with this PR.
>
> I'm not asking that you tidy up other hooks. What I'm asking is that new
> hooks please be const-correct. Yet of course I'm not a maintainer of XSM,
> so Daniel may tell you otherwise.
>
> >> Further: Why two new hooks? See e.g. "XSM: fold xsm_{,un}map_domain_pirq()
> >> hooks", "XSM: fold xsm_{,un}map_domain_irq() hooks", or "XSM: fold
> >> xsm_{,un}bind_pt_irq() hooks": We'd like to reduce the number of hooks, to
> >> reduce (when non-dummy XSM is in use) the number of cf_check entry points.
> >
> > It was a comment from Daniel.
>
> Daniel, can you clarify this please?
>
> Jan

Frediano

