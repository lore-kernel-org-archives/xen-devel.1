Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83421CD6E75
	for <xen-devel@archiver.kernel.org>; Thu,  4 Jun 2026 18:21:03 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328354.1592858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVCgH-0004iQ-On; Thu, 04 Jun 2026 18:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328354.1592858; Thu, 04 Jun 2026 18:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVCgH-0004iJ-It; Thu, 04 Jun 2026 18:20:37 +0000
Received: by outflank-mailman (input) for mailman id 1328354;
 Thu, 04 Jun 2026 18:20:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jgg@ziepe.ca>) id 1wVCgF-0004iD-BU
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 18:20:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVCgE-002iDj-OM
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 20:20:34 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jgg@ziepe.ca>)
 id 6a21c1e1-5cb7-0a2a0a5109dd-0a2a45048300-30
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:20:34 +0200
Received: from [209.85.222.177] (helo=mail-qk1-f177.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jgg@ziepe.ca>)
 id 6a21c1f1-1dec-0a2a45040019-d155deb1ecc3-3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 20:20:34 +0200
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-91563382bcfso124984485a.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jun 2026 11:20:34 -0700 (PDT)
Received: from ziepe.ca
 (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net.
 [47.54.130.67]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8cecd051d61sm58430626d6.29.2026.06.04.11.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2026 11:20:32 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1wVCgB-00000008erz-2jW4;
 Thu, 04 Jun 2026 15:20:31 -0300
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=ziepe.ca header.i="@ziepe.ca" header.h="In-Reply-To:Content-Disposition:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780597233; x=1781202033; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cznawapF5vO4PWrDdsZF/fc6qNY58JTcnmMkw1TddjY=;
        b=RIkbs3JlXWvNKahtggVwuLugifk325yJCv3HC09LzZA7G2nLFk4I/kxKm5npS+I+zn
         J+8SL686ba6b4NJGKao7HTyxFNpjCmK0xk3re6m/G31RzywpmTmJebtJarARZkG3jJi1
         jvQ7koo9WfUSfNwHV/6JL2UqTJlXU/OzhpnOfvEBROo0+4b2CZAABgSvum78WXc2D0R8
         +XdH6iQJcd3UivKroUbrhJOyHghxh8pXQbIoLtfLJy3X9kQJFtECG0ti94RnzZ1lxnEe
         E1GR8bNcQ4IH82HD8kdrDim6X+xGdXUy1GwY++aNint79PZQaEunH+TyHg+26CPW9dCB
         UqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780597233; x=1781202033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cznawapF5vO4PWrDdsZF/fc6qNY58JTcnmMkw1TddjY=;
        b=QB9q2vObIsApwAdc3bsTswKZTnzquR/l6Rmx13blUifcBh/WJM5u+796eh06dzEXBO
         tfqvyOt9dLFF9O9x3F78pHkkQ6pN0xWEeQsHuTOkN922jyFdwciYK1qdEmQtwEeC0g9Q
         Qn99NvBtwDGecyco/Gy7QXi1jBV9xHCcYsDow5Q81/aqP6GKEtkwnU+EKG9besnKxh+8
         krbsu/wEtdG8rGmYtcXxnW5LD0Sc4RXnaLriHwsoVAtOBmvaXA1ET0qnUvbhC4bFnnnm
         02XElf66RKQAED4pnrK9ppKew4/JeYbUsUT5sKELY6uDqHec/mHXmfpYrr/cgU4Op15S
         PjCw==
X-Forwarded-Encrypted: i=1; AFNElJ9Yi8RUANcQOWn5Bx7b1+fcWSKpRhKsy/BVJ+euYYfK2Kb4jvMgsxf7zBIBpg9J7WFqyaGCaOeSRow=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyUlKP+TVu7DInCqTMmp8eKlj24EJEqvy2guCKg+2BzjH5LdnRY
	JDGjnzcmVpwZVT2/ksKOBpqDJbROO2+OO1skTWP5rpAQq/kkg4pIjwQV9Mw+fCmOYAY=
X-Gm-Gg: Acq92OE267bFDiILvD1VLrVImC0QxQTHQajG42feIxoFuEFoKJf3qJSjcWEYJDx2Mdw
	GQWUmhbsUPEx6y2XkcHHxAnJmVm+q8zLdNPs3NBt+vwc/s2yq1E+dLMhL77WYKS/nmda9Fk/bb9
	+jnukd9oocPZXcWtqxGHSX4iaO9kEZHFH+BiH81++eiJphH/FsHCAMB4Nyx40M1tYxnY3hBjETR
	uWXe1u/N8q09/jvoH6UJIWZgMI5sOBOA674DRSWAR38cLFSJkBb8soigVVfLKK7O8Zaf9ipamv3
	BuamvBbPSK8LWgsA6VwzG+9DYHQMosIXOM9WAzWt2dgz7Y+uACDAtiM+8LWknsZRqqpa8akhy1f
	v6+WlVpNSSNYDAgh0hp/3PzfhiuaIAFui2c0nyjfqOiH/OnAi1cI2NvF8WiEjGiMG/2HLOllLvh
	aR+TVQrBEO5KTW4qJPung1/jnADNert7YHf+RuGuBDJIpty+s3gPyNh+OgpVMKYeg5PJkk4Xw/J
	HRQgW6LYq54f0eX
X-Received: by 2002:a05:620a:a414:20b0:914:afc1:c66d with SMTP id af79cd13be357-915a9c75c96mr40356185a.11.1780597232897;
        Thu, 04 Jun 2026 11:20:32 -0700 (PDT)
Date: Thu, 4 Jun 2026 15:20:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Alex Williamson <alex@shazbot.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Ankit Agrawal <ankita@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Keith Busch <kbusch@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Dimitri Daskalakis <daskald@meta.com>,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC 00/12] PCI: Add support for Scalable I/O Virtualization
Message-ID: <20260604182031.GB2487554@ziepe.ca>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
X-purgate-ID: tlsNG-ebf023/1780597234-411763FF-FF99618F/0/0
X-purgate-type: clean
X-purgate-size: 1273

On Thu, Jun 04, 2026 at 08:01:41AM -0700, Dimitri Daskalakis wrote:
> With this patchset core enumarates the SIOV capability and can identify
> SIOV PFs. But there is no central mechanism to allocate/manage SIOV VFs.
> To support device pass through, devices will need to add a vfio-mdev
> driver with IOMMUFD support (or something similar).

There is an enormous amount of missing work to do something useful
with the SIOVr2 stuff. IIRC there is even supposed to be BIOS
components in this plan and there are some missing PCI SIG topics too
IIRC.

So, I'm not sure how much value there is in merging just the cap
discovery without a roadmap for the missing parts..

Also, I'm quite surprised to see this out of the blue, there is an OCP
workstream that was building out a standard that outlines how all the
different components have to act to successfully implement it.  What
is in PCI SIG was just some minor foundational adjustments without any
context on how to form them into a solution.

I think it is extremely premature to merge anything related to SIOV to
the kernel. Join the OCP work stream if you are interested. I think
the general feeling was there is not sufficient interest in the
industry to do this and it has gone quiet.

Jason

