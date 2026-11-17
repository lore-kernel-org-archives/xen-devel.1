Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5A606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xenproject.org header.i=@xenproject.org header.a=rsa-sha256 header.s=20200302mail header.b=p2nWy1sm
Received: from list by lists.xenproject.org with outflank-mailman.1492114.1692808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGRm-0002Ac-JZ; Tue, 17 Nov 2026 10:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1492114.1692808; Tue, 17 Nov 2026 10:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTGRm-0002AV-GE; Tue, 17 Nov 2026 10:29:54 +0000
Received: by outflank-mailman (input) for mailman id 1492114;
 Tue, 17 Nov 2026 10:29:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xenproject.org>) id 1xTGRl-0002AO-T1
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 10:29:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGRl-00000002skd-1HDb;
 Tue, 17 Nov 2026 10:29:53 +0000
Received: from 224.pool85-54-217.dynamic.orange.es ([85.54.217.224]
 helo=localhost) by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <roger@xenproject.org>) id 1xTGRl-0000000AI5Z-27vi;
 Tue, 17 Nov 2026 10:29:53 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=ZWs50JnEEuEVSD/gfFi9VpLDcHgrmE7SqfYjbn+uVn4=; b=p2nWy1smWrtCJWSJQzNOsCb2lA
	uvbDrk/rgVrQw9PZjrDh8LfL2s8O35oUoQFlmH0wvUFX7vA/ymAVuitEggGVvZz/otOklaYDxOPU4
	QIGZz1gsgyOlepQ9A68dxJGea74O6Chv8bNLo6O/qPyrbxHsVUy1DIodTDsoail+5Z68=;
Date: Tue, 17 Nov 2026 11:29:44 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [PATCH 1/4] x86/physdev: use less heavy locking in
 physdev_unmap_pirq()
Message-ID: <avwsmDrigjFrE6RT@Mac.lan>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
 <7dc9e911-73f7-4efb-8132-b9f6a5fafc0a@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7dc9e911-73f7-4efb-8132-b9f6a5fafc0a@suse.com>
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:23:56PM +0100, Jan Beulich wrote:
> Like its mapping counterpart, in the GSI case no (PCI-related) lock would
> be needed at all, while in the MSI cases the domain's PCI lock is
> sufficient to hold.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/physdev.c
> +++ b/xen/arch/x86/physdev.c
> @@ -156,11 +156,11 @@ int physdev_unmap_pirq(struct domain *d,
>              return ret;
>      }
>  
> -    pcidevs_lock();
> +    read_lock(&d->pci_lock);
>      write_lock(&d->event_lock);
>      ret = unmap_domain_pirq(d, pirq);
>      write_unlock(&d->event_lock);
> -    pcidevs_unlock();
> +    read_unlock(&d->pci_lock);

I think there's possibly one pre-patch that would be needed before
making this change.  Callers of pci_restore_msi_state() only hold the
pcidevs lock, dropping pcidevs lock here we would be allowing changes
to the list while there's possibly a concurrent access by
pci_restore_msi_state().

I think pci_restore_msi_state() (or its callers) need to hold the
d->event_lock, and this likely wants to be a pre-patch.  Not holding
d->event_lock while iterating over pdev->msi_list in
pci_restore_msi_state() seems like a pre-existing issue that would be
uncovered by this patch, albeit it's not clear what d->event_lock is
supposed to protect exactly.

Thanks, Roger.

