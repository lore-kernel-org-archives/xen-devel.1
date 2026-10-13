Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4B8CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 10:34:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1446947.1663080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZpi-0004n4-De; Tue, 13 Oct 2026 10:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1446947.1663080; Tue, 13 Oct 2026 10:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGZpi-0004mx-AI; Tue, 13 Oct 2026 10:34:10 +0000
Received: by outflank-mailman (input) for mailman id 1446947;
 Tue, 13 Oct 2026 10:34:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1xGZpg-0004mr-S8
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:34:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGZpg-00000003LIj-3y0N
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:34:08 +0000
Received: from mail-lf1-f42.google.com ([209.85.167.42])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98.2)
 (envelope-from <gwd@xenproject.org>) id 1xGZpg-0000000Bliq-0p4V
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 10:34:08 +0000
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5bad794b197so2910202e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 03:34:08 -0700 (PDT)
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
	bh=Mjvxz5NbzmCku9GWWXfGhHibEV2lIq5bV3BM5GmSTeY=; b=jH8gi1G3DIcRJFroZNLY+5sc2y
	x2WlyuJUdFfd9DHkZvWnsPI8eMuCDmJoph0ObYtS0OLwUSt+FS0vrfrulcJ6jQm2O7wMpJKP18vvR
	M2uKv1tpqjOONPH3zPy+TFlhl+8n3gYEZphWCJK3NIQ0qYhKpP0qluXwj6XLThGHW4Kg=;
X-Gm-Message-State: AFq9FYKoNY3ys5J9L6YbO2IiB/OOQyCjbeGg6s1Ifkayyyim/wjab9ux
	FIb2l16WTlnN0YXKS1NsYt8QbUMZBX8ZyDCKKvnXThl8PHLWGuajRxXknREAh6+N9kYuF9/0qOm
	+bLdSA6Z9/HSeoQZ/S+kLKa9xbVNta5s=
X-Received: by 2002:a05:6512:3e22:b0:5ba:36b8:ed2d with SMTP id
 2adb3069b0e04-5bcde6bb70bmr4389964e87.10.1791887647289; Tue, 13 Oct 2026
 03:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261007104051.48841-1-gwd@xenproject.org> <20261007104051.48841-11-gwd@xenproject.org>
 <asd4n82y4m8VPFAV@Mac.lan>
In-Reply-To: <asd4n82y4m8VPFAV@Mac.lan>
From: George Dunlap <gwd@xenproject.org>
Date: Tue, 13 Oct 2026 11:33:55 +0100
X-Gmail-Original-Message-ID: <CAFLBxZZ4sV_b6q2_GCaM03-5+EDsoqpmekooMZcrbSdOP5OhrQ@mail.gmail.com>
X-Gm-Features: AclHuK-702rMXUzl7qnOKhRgGOSrmAYT9E9ReW8hll88pGFCaKSNA4hyxFaRYVI
Message-ID: <CAFLBxZZ4sV_b6q2_GCaM03-5+EDsoqpmekooMZcrbSdOP5OhrQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/18] x86/domain_page: don't unmap a mapcache entry
 that is not present
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 12:04=E2=80=AFPM Roger Pau Monn=C3=A9 <roger@xenproj=
ect.org> wrote:
>
> On Wed, Oct 07, 2026 at 11:40:43AM +0100, George Dunlap wrote:
> > Mappings must be torn down by the vCPU that created them, and only
> > once.  Have unmap_domain_page() check that the entry it is handed is
> > present and bail out otherwise (ASSERT_UNREACHABLE()), rather than read
> > an MFN out of an empty PTE and act on it, as a second unmap of an entry
> > the first one zapped would.  (A second unmap of an entry the maphash
> > kept is caught, as before, only by the refcount ASSERT() in debug
> > builds.)
> >
> > Assisted-by: Claude Code:claude-opus-5-5
> > Signed-off-by: George Dunlap <gwd@xenproject.org>
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger@xenporject.org>
>
> > ---
> > Changes in v3:
> > - New in this version, split out of "x86/hvm: introduce per-vCPU
> >   mapcache for vCPU-PT domains" for review.
> > ---
> >  xen/arch/x86/domain_page.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> > index f91ec8a75a..708df90a00 100644
> > --- a/xen/arch/x86/domain_page.c
> > +++ b/xen/arch/x86/domain_page.c
> > @@ -230,6 +230,16 @@ void unmap_domain_page(const void *ptr)
> >      ASSERT(cache->inuse);
> >
> >      idx =3D PFN_DOWN(va - MAPCACHE_VIRT_START);
> > +    /*
> > +     * Mappings must be unmapped once, by the vCPU that created them. =
 With
> > +     * nothing present there is nothing to tear down: leave the hash a=
nd the
> > +     * bitmaps alone rather than act on a stale or foreign pointer.
>
> The comment makes more claims that what can be checked for: there's no
> check that the unmap is being done by the same vCPU that created it,
> neither is easy to add one.  Any mismatch like that would become more
> obvious once we switch to a per-vCPU mapcache.  I would possibly
> reduce the comment to:
>
> /* Ensure the entry to unmap is populated. */
>
> The commit message already have the lengthily details.

The problem is that now the comment just repeats the condition of the
if() statement, which an experienced developer can already read
without effort; it doesn't say *why* we're doing the check.  What
about something like the following?

    /*
     * Sanity check: an entry that isn't present means a double or stray
     * unmap.  Play it safe: don't act on the MFN in an empty PTE.
     */

Thanks,
 -George

