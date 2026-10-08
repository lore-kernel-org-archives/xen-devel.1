Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5168CA600B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2026 11:10:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1443197.1660600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEm0e-0003K7-Vb; Thu, 08 Oct 2026 11:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1443197.1660600; Thu, 08 Oct 2026 11:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xEm0e-0003K0-Sh; Thu, 08 Oct 2026 11:10:00 +0000
Received: by outflank-mailman (input) for mailman id 1443197;
 Thu, 08 Oct 2026 11:09:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xEm0d-0003Ju-Rs
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:09:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEm0d-003BcX-1X
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:09:59 +0000
Received: from mail-lj1-f169.google.com ([209.85.208.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1xEm0d-009qdD-1O
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2026 11:09:59 +0000
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-3a76ac0bdafso4588481fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2026 04:09:59 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=XXwEq2jkEw3cHBn/lYvFEYcp02xt6GrgrRtn3to52sg=; b=B0M2CbRZCcued7RS2dhpT4mPoJ
	6ITX4rBBI6QjTtiKgjJffNGUeLxvrJ48Kyhw/vJPo3PdIAORDkdgNNxQWFTfjrJB1MkZvemOIA5XN
	mQqulKc+2bzysRW8B8UPKiXCNGl2/nHbWI3i+bJOewdXlTiYZMShaMLfmmM5VtxplUVg=;
X-Gm-Message-State: AFq9FYJsJCDn6EE9OPkbmHnv+7khwBvMsTGQm9KEfkXii+BhKPucWyBl
	C1GSMVvYY0y3MfckPbawmTQDTfy1xCKvjydUdU0/f1B4+A8yoHIJy5hTP7JX0wZKNupgODTiNQy
	XkJCEgcxb98xv+fGvC3/h2nJ0ccq22fI=
X-Received: by 2002:a2e:8b8e:0:b0:3a6:6e61:2887 with SMTP id
 38308e7fff4ca-3a9ae46553bmr4296861fa.1.1791457798346; Thu, 08 Oct 2026
 04:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-2-gwd@xenproject.org>
 <cb2a5856-e3de-4ea6-8a3a-00f2999eef92@citrix.com>
In-Reply-To: <cb2a5856-e3de-4ea6-8a3a-00f2999eef92@citrix.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 8 Oct 2026 12:09:45 +0100
X-Gmail-Original-Message-ID: <CAFLBxZa9CH6AT=cVLPrcqe2X1WkWFkUXP+acLvRMMKkX+Ry-TQ@mail.gmail.com>
X-Gm-Features: AclHuK8JkFHQBCJhfFEW2qfskbg9BL7uxifZZaRbUZ0VUf7FQe6olxlBwR3FO38
Message-ID: <CAFLBxZa9CH6AT=cVLPrcqe2X1WkWFkUXP+acLvRMMKkX+Ry-TQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/18] x86/PoD: map one page at a time in p2m_pod_zero_check()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:38=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 07/10/2026 11:40 am, George Dunlap wrote:
> > diff --git a/xen/arch/x86/mm/p2m-pod.c b/xen/arch/x86/mm/p2m-pod.c
> > index 4602c32cff..0b0beca15a 100644
> > --- a/xen/arch/x86/mm/p2m-pod.c
> > +++ b/xen/arch/x86/mm/p2m-pod.c
> > @@ -911,7 +912,12 @@ p2m_pod_zero_check(struct p2m_domain *p2m, const g=
fn_t *gfns, unsigned int count
> >      if ( paging_mode_shadow(d) )
> >          max_ref++;
> >
> > -    /* First, get the gfn list, translate to mfns, and map the pages. =
*/
> > +    /*
> > +     * First, get the gfn list, translate to mfns, and pick the pages =
to
> > +     * check.  They are mapped one at a time below, as in
> > +     * p2m_pod_zero_check_superpage(): a vCPU can hold only a few tran=
sient
> > +     * mappings at once, and the p2m lookups and updates here need som=
e too.
> > +     */
>
> Actually, I think this wants almost entirely dropping.   Yes, "and maps
> the pages." needs editing, and should probably say "and check for being
> a plausible candidate" or so, which was missing previously.
>
> The rest is a justification of why we do mapping in the same way we do
> it generally, and not useful to have in the source code.

Yes, sorry about the verbose comment, I forgot to go back and give
this a more detailed review.  I'll trim back the comment.

Re the bool array: I assumed the compiler would turn that into a
bitmask.  That not being the case, I'll switch to bitops.

Thanks,
 -George

