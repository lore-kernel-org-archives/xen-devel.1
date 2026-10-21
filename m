Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6990F606A326
	for <xen-devel@archiver.kernel.org>; Wed, 21 Oct 2026 14:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=c/agvLJW
Received: from list by lists.xenproject.org with outflank-mailman.1457283.1670190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWu2-0005uX-UV; Wed, 21 Oct 2026 14:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1457283.1670190; Wed, 21 Oct 2026 14:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJWu2-0005uQ-Rq; Wed, 21 Oct 2026 14:02:50 +0000
Received: by outflank-mailman (input) for mailman id 1457283;
 Wed, 21 Oct 2026 14:02:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xJWu1-0005uK-Ce
 for xen-devel@lists.xenproject.org; Wed, 21 Oct 2026 14:02:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xJWu1-00000005aPq-1UJz;
 Wed, 21 Oct 2026 14:02:49 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xJWu0-00000003eQ5-43fA;
 Wed, 21 Oct 2026 14:02:49 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date;
	bh=/paedUJtUfe1GU0V4D9BXctReHAWlvWbxprmJFB3qqQ=; b=c/agvLJWj8W0scKf93UtipV/ij
	pmZgCw+T4GsqIbF/DlTJmoyRASLe8Dyf5VoaiRt76xCpYEbkvDGR0MkgwNqZ9k7A15Co2T+Qnasbk
	Pzdz/OuM49At8IGT8l/0ndgIzIkVAOnDTJDQdT8bBtBKnZWvSSXIvS1GYm9DUdy1GZpg=;
Date: Wed, 21 Oct 2026 16:02:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
	xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, jason.andryuk@amd.com,
	teddy.astie@vates.tech
Subject: Re: [PATCH] xen/x86/hvm: Propagate emulated CR2 writes to the VMCB
Message-ID: <atjGBp1T6UjPfx59@Mac.lan>
References: <20261020213315.3641133-1-stefano.stabellini@amd.com>
 <ath1oW-R2OlWy60f@Mac.lan>
 <26141f92-f6cf-459d-ae56-e010db9062db@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26141f92-f6cf-459d-ae56-e010db9062db@citrix.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 02:11:30PM +0100, Ross Lagerwall wrote:
> On 10/21/26 9:19 AM, Roger Pau Monné wrote:
> > On Tue, Oct 20, 2026 at 02:33:15PM -0700, Stefano Stabellini wrote:
> > > hvmemul_write_cr() updates guest_cr[2] but, unlike every other writer of
> > > it, doesn't call hvm_update_guest_cr(). On SVM, CR2 is loaded from
> > > the VMCB, so the emulated write never reaches the guest, and the next
> > > VMExit overwrites guest_cr[2] with the stale VMCB value.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > 
> > Acked-by: Roger Pau Monné <roger@xenproject.org>
> > 
> > I wonder whether there's more missing here, see below.
> > 
> > > ---
> > >   xen/arch/x86/hvm/emulate.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/xen/arch/x86/hvm/emulate.c b/xen/arch/x86/hvm/emulate.c
> > > index c09ea002ec..cd2831d34b 100644
> > > --- a/xen/arch/x86/hvm/emulate.c
> > > +++ b/xen/arch/x86/hvm/emulate.c
> > > @@ -2350,6 +2350,7 @@ static int cf_check hvmemul_write_cr(
> > >       case 2:
> > >           curr->arch.hvm.guest_cr[2] = val;
> > > +        hvm_update_guest_cr(curr, 2);
> > 
> > Looking at hvm_update_cr(), is this possibly also missing a call to
> > nestedhvm_set_cr()?
> 
> AFAIK the values set by nestedhvm_set_cr() are not used at all with nested SVM
> and from a brief look may only be used for CR0 and CR4 for VVMX. So maybe it is
> not needed, though for consistency I think it would make sense to replace both
> lines with a single call to hvm_update_cr().

Yes, however at the time being hvm_update_cr() is static to hvm.c.
It would mean exporting the function, which maybe we should have done
in the first place instead of exporting hvm_update_guest_cr()?

Thanks, Roger.

