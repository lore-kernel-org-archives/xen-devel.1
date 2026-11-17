Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C279606A32A
	for <xen-devel@archiver.kernel.org>; Tue, 17 Nov 2026 22:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IqGcYeIF
Received: from list by lists.xenproject.org with outflank-mailman.1493316.1693365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTRY1-0004nS-Te; Tue, 17 Nov 2026 22:21:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1493316.1693365; Tue, 17 Nov 2026 22:21:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTRY1-0004nL-Oy; Tue, 17 Nov 2026 22:21:05 +0000
Received: by outflank-mailman (input) for mailman id 1493316;
 Tue, 17 Nov 2026 22:21:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xTRXz-0004nE-Th
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 22:21:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTRXz-001LH8-AL
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2026 23:21:03 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afcd347-bab6-0a2a0a5309dd-0a2a4505e778-20
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:21:03 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6afcd34d-4cb1-0a2a45050019-ac6904fea778-3
 for <xen-devel@lists.xenproject.org>; Tue, 17 Nov 2026 23:21:02 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B9F361C69;
 Tue, 17 Nov 2026 22:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710591F000C4;
 Tue, 17 Nov 2026 22:20:59 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954061;
	bh=7QNQACG75i/AOq+RRY9HHZEzK05XPJl3/BxT6dKkgs4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=IqGcYeIFXjxTnQnw6evpVdVmZOuJMlPsFhO9i88vq7cTTRCXcBS+Wz+FJvcXakaYj
	 +Y3KzDXeR0pf5dDOmM1fO44v6uuIv4frBrwWGeOfaX8x5Rn9B/Op9lN2aGhJT9ReZu
	 ICi5dnnyrjX9tYx/qLPe31JEipJN6i9jx9TLcQdZ+4NyWmrxPKUe8lGhoKqEPzM/Ky
	 MUyOkpq4VfKXIspIMEZHVOworW+4jNFC6iwRirhF7qkpujxZB6f42MW8jdScOGcFad
	 +5vdl7S6bX6cKtUzVx6L/0A5W+/2DkZWwV8phReOfNseDxWK1EY3wnjCm4CzdooYYC
	 Hg0sY0YMyRSiQ==
Date: Tue, 17 Nov 2026 14:20:58 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.com>, 
    Community Manager <community.manager@xenproject.org>
Subject: Re: [PATCH] PCI: deviate MISRA R11.8 for the one-time SBDF
 initialization
In-Reply-To: <a6fb5fd1-4ae1-43cd-9be6-3ad367672b72@citrix.com>
Message-ID: <2021fe2b-346e-c3de-1da9-840ac566a456@kernel.org>
References: <ed06386df3f5ae485a409e8c0bed10b01d7fd33d.1794948091.git.dmytro_prokopchuk1@epam.com> <a6fb5fd1-4ae1-43cd-9be6-3ad367672b72@citrix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-c201ff/1794954063-F66B52A1-4B1C17E8/0/0
X-purgate-type: clean
X-purgate-size: 3707
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 17 Nov 2026, Andrew Cooper wrote:
> On 17/11/2026 8:55 pm, Dmytro Prokopchuk1 wrote:
> > MISRA C Rule 11.8 states: "A cast shall not remove any const or volatile
> > qualification from the type pointed to by a pointer".
> >
> > alloc_pdev() writes the device identity once. seg, bus and devfn are
> > members of a const union, so that write goes through a cast that removes
> > const. Three such casts performed the same initialization.
> >
> > Store the whole sbdf in one assignment and document that cast with
> > one-line SAF-15-safe comment.
> >
> > No functional changes.
> >
> > Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> > ---
> > Test CI pipeline:
> > https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/3081067362
> > ---
> >  docs/misra/safe.json          | 8 ++++++++
> >  xen/drivers/passthrough/pci.c | 5 ++---
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/docs/misra/safe.json b/docs/misra/safe.json
> > index 3584cb90c6..3503d2e808 100644
> > --- a/docs/misra/safe.json
> > +++ b/docs/misra/safe.json
> > @@ -124,6 +124,14 @@
> >          },
> >          {
> >              "id": "SAF-15-safe",
> > +            "analyser": {
> > +                "eclair": "MC3A2.R11.8"
> > +            },
> > +            "name": "Rule 11.8: one-time init of a const PCI identity",
> > +            "text": "The cast removes const only to initialize the const pci_dev identity fields (seg, bus, devfn). The const qualification prevents any later assignment, and this is the only write, performed before the device is published on alldevs_list."
> > +        },
> > +        {
> > +            "id": "SAF-16-safe",
> >              "analyser": {},
> >              "name": "Sentinel",
> >              "text": "Next ID to be used"
> > diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> > index 578472d068..14d59b1293 100644
> > --- a/xen/drivers/passthrough/pci.c
> > +++ b/xen/drivers/passthrough/pci.c
> > @@ -329,9 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
> >      if ( !pdev )
> >          return NULL;
> >  
> > -    *(u16*) &pdev->seg = pseg->nr;
> > -    *((u8*) &pdev->bus) = bus;
> > -    *((u8*) &pdev->devfn) = devfn;
> > +    /* SAF-15-safe R11.8 one-time init of the const PCI identity */
> > +    *(pci_sbdf_t *)&pdev->sbdf = PCI_SBDF(pseg->nr, bus, devfn);
> >      pdev->domain = NULL;
> >  
> >      INIT_LIST_HEAD(&pdev->vf_list);
> 
> Please just delete the const and make a plain SBDF assignment to drop
> the current casts.
> 

I agree. Dropping the const removes the violation instead of deviating
it, and makes the code simpler: one plain assignment, no casts.

Something like this?

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 578472d068..ca4d631d8d 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -329,9 +329,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     if ( !pdev )
         return NULL;
 
-    *(u16*) &pdev->seg = pseg->nr;
-    *((u8*) &pdev->bus) = bus;
-    *((u8*) &pdev->devfn) = devfn;
+    pdev->sbdf = PCI_SBDF(pseg->nr, bus, devfn);
     pdev->domain = NULL;
 
     INIT_LIST_HEAD(&pdev->vf_list);
diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
index b7a35371a7..83cbb96db1 100644
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -109,7 +109,7 @@ struct pci_dev {
 
     struct domain *domain;
 
-    const union {
+    union {
         struct {
             uint8_t devfn;
             uint8_t bus;

