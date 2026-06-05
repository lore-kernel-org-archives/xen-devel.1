Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351ACCD6E75
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2026 01:00:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1328827.1593119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVIun-0001Ap-EQ; Fri, 05 Jun 2026 01:00:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328827.1593119; Fri, 05 Jun 2026 01:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVIun-0001A6-B4; Fri, 05 Jun 2026 01:00:01 +0000
Received: by outflank-mailman (input) for mailman id 1328827;
 Fri, 05 Jun 2026 01:00:00 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kuba@kernel.org>) id 1wVIum-00013g-Pf
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:00:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVIul-0091UY-W9
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 03:00:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kuba@kernel.org>)
 id 6a221f5b-2eae-0a2a0a5409dd-0a2a450aa222-44
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:59:59 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kuba@kernel.org>)
 id 6a221f8e-56b3-0a2a450a0019-ac6904feae1e-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 02:59:59 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 158FB6001A;
 Fri,  5 Jun 2026 00:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEDF1F00893;
 Fri,  5 Jun 2026 00:59:56 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780621197;
	bh=uvxQ8m/0FnjSq2hX2DJ7JY5O6ptuAhKyFcmM0+SqdDI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FV7UuTIA9nXYCTQdrZZfkYLPla7MfXoMk9JBQGXD8E6O3JeVZ8noXFwAiRTcGSkiG
	 W1E6UfVYL1zDmwogaVZj3DwZpjueen+dGCzKQo0ke5ZCdkt5y4s6jQvB3vcBr0q2k/
	 5zMUf1gXU4yYCb9VaqZ1FpKBYaxlJRzL8seAwf8I1EV3xbsR5RzcirVhuu+7mcYerp
	 2iHf8scUUAf0UGYnrFlhzWpP25WM1cMsSOLI91OeLkt8yMjFwVNEf8x7lNB0JkDCVX
	 FA7XptQIIQkiVR9RNrq6zyb+w3n9rtX2CXGMXtneI5zgxSgBjxNGwz6mh+H34odnWw
	 kP5OoFOiPLZYg==
Date: Thu, 4 Jun 2026 17:59:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <chleroy@kernel.org>, Mahesh J Salgaonkar
 <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Alex Williamson <alex@shazbot.org>, Kevin Tian
 <kevin.tian@intel.com>, Ankit Agrawal <ankita@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Keith Busch <kbusch@kernel.org>, Alexander
 Duyck <alexanderduyck@fb.com>, Dimitri Daskalakis <daskald@meta.com>,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [RFC 00/12] PCI: Add support for Scalable I/O Virtualization
Message-ID: <20260604175955.56ca1406@kernel.org>
In-Reply-To: <a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
References: <20260604150153.3619662-1-dimitri.daskalakis1@gmail.com>
	<20260604182031.GB2487554@ziepe.ca>
	<a07763e2-aff3-4468-83c2-d50a9e1605c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1780621199-7CA798B7-0C95DE28/0/0
X-purgate-type: clean
X-purgate-size: 441

On Thu, 4 Jun 2026 16:49:05 -0700 Dimitri Daskalakis wrote:
> Hey Jason, thanks for the feedback. We (at Meta) are definitely
> interested in SIOV-like capabilities for device passthrough to containers.

I think "definitely interested" is quite an exaggeration.
More importantly, which big company is interested in what
tech should be irrelevant upstream. Please don't make these
sort of arguments. The code has to stand on its own.

