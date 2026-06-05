Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22535CD6E5D
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 04:15:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328907.1593137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVLxJ-0007Ga-0i; Fri, 05 Jun 2026 04:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328907.1593137; Fri, 05 Jun 2026 04:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVLxI-0007GT-Te; Fri, 05 Jun 2026 04:14:48 +0000
Received: by outflank-mailman (input) for mailman id 1328907;
 Fri, 05 Jun 2026 04:14:47 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+25760b9178a0880d3e7d+8321+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wVLxF-0007GN-Fx
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 04:14:47 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVLxE-00CPB1-3B
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 06:14:44 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+25760b9178a0880d3e7d+8321+infradead.org+hch@bombadil.srs.infradead.org>)
 id 6a224cfa-5cb7-0a2a0a5109dd-0a2a4508e4d8-32
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 06:14:43 +0200
Received: from [198.137.202.133] (helo=bombadil.infradead.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+25760b9178a0880d3e7d+8321+infradead.org+hch@bombadil.srs.infradead.org>)
 id 6a224d31-63b5-0a2a45080019-c689ca85a07c-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 06:14:42 +0200
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wVLx1-000000004Gb-1FHI;
 Fri, 05 Jun 2026 04:14:31 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=bombadil.20210309 header.d=infradead.org header.i="@infradead.org" header.h="In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LJ7z4fiMTAZ7fAzEyfiZAHwdxVS2Jyf7F7sA34zhgfk=; b=SA0RTFbtw7++xeqM4/TBi2XyHl
	OsNHxj9gdfi0UgM2EebSZZ5pP6ZD20zBkoA1aRnOH1iKaGBpFvTFyAA6LA9t4HDaVEdA7kTTbx1N3
	UC9hF8blJBELprFrQ3F0S6pjYGlbCpJnJERQ5XapS7co2zJQCzPJZukheGd7mSzvM+9W2g1fNkurp
	s9n+QHKcf2b02WissFhhCZMd8QUsS4UOjeN/RYUWc1PPTNQF2fENqoiFet+BZXyy+T5KAY5KkP7ix
	Sy0Jy0Z9FTKpx0xD56IQ30IR1Y43bLhYMCck7lQouY6AJ7p8xjxiJ1odiPKjhItw8K+cdyeNIydU8
	epqVkWfQ==;
Date: Thu, 4 Jun 2026 21:14:31 -0700
From: Christoph Hellwig <hch@infradead.org>
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
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@ziepe.ca>,
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
Message-ID: <aiJNJ0zP5BocG-Yy@infradead.org>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-c1860d/1780632883-BFF7ADB1-27899243/0/0
X-purgate-type: clean
X-purgate-size: 268

On Thu, Jun 04, 2026 at 08:01:41AM -0700, Dimitri Daskalakis wrote:
> From: Dimitri Daskalakis <daskald@meta.com>
> 
> Scalable I/O Virtualization (SIOV) is the next-generation alternative
> to SR-IOV.

It's not.  It is a yet another very different technology.

