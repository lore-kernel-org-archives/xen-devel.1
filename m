Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89323CD8CB9
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 16:36:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1334599.1597553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLuT-0006W7-83; Wed, 10 Jun 2026 16:36:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1334599.1597553; Wed, 10 Jun 2026 16:36:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXLuT-0006W0-45; Wed, 10 Jun 2026 16:36:09 +0000
Received: by outflank-mailman (input) for mailman id 1334599;
 Wed, 10 Jun 2026 16:36:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kbusch@kernel.org>) id 1wXLuR-0006Vu-Un
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 16:36:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXLuR-00389q-A7
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 18:36:07 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kbusch@kernel.org>)
 id 6a299269-2eae-0a2a0a5409dd-0a2a4508a4d4-26
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 18:36:07 +0200
Received: from [172.234.252.31] (helo=sea.source.kernel.org)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <kbusch@kernel.org>)
 id 6a299275-63b5-0a2a45080019-aceafc1fe91c-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 18:36:06 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6EF3743DF2;
 Wed, 10 Jun 2026 16:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E40111F00893;
 Wed, 10 Jun 2026 16:36:00 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109364;
	bh=nh8wY943fEj9O68DsnnpwY2/V+toQvePmwkX7p5hMSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dYINVrSZftHL1+14yqMRRxzqdHQ5Aru2hX4Xj5usxEkwHzPmZX+0xwOsW6Dztp5wP
	 buvP2PuA+QV5xPj78OletWBvmwhb43jqvV5GFsrZnuZuAMghgSwQoh0S8sgN+S9BTm
	 ixgW2hKOY1IFxC79EBrsQJFmBJhTgHzktayoDV1vYQ6PUatVZ8z/Tcr6XFUKU/a9/Z
	 pheURjB4DZFygToELeoT3p6Kl+8pJ6zz/rbZLD4ZtWjHEo3RFM2sDUxPLErYC7D1UE
	 E752J6xO3yZ8ppjwDDHNoD60M4V39r80G3RPynl7+S0nx3QFq8NW+mgS9cg+pAi3HA
	 Rq8MlrT88sswQ==
Date: Wed, 10 Jun 2026 10:35:59 -0600
From: Keith Busch <kbusch@kernel.org>
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Jens Axboe <axboe@kernel.dk>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Adam Radford <aradford@gmail.com>,
	Khalid Aziz <khalid@gonehiking.org>,
	Adaptec OEM Raid Solutions <aacraid@microsemi.com>,
	Matthew Wilcox <willy@infradead.org>,
	Hannes Reinecke <hare@suse.com>,
	"Juergen E . Fischer" <fischer@norbit.de>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Finn Thain <fthain@linux-m68k.org>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>,
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>,
	Oliver Neukum <oliver@neukum.org>, Ali Akcaagac <aliakc@web.de>,
	Jamie Lenehan <lenehan@twibble.org>,
	Ram Vegesna <ram.vegesna@broadcom.com>,
	target-devel@vger.kernel.org,
	Bradley Grove <linuxdrivers@attotech.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Yihang Li <liyihang9@h-partners.com>,
	Don Brace <don.brace@microchip.com>, storagedev@microchip.com,
	HighPoint Linux Team <linux@highpoint-tech.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org, Brian King <brking@us.ibm.com>,
	Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	open-iscsi@googlegroups.com, Justin Tee <justin.tee@broadcom.com>,
	Paul Ely <paul.ely@broadcom.com>,
	Kashyap Desai <kashyap.desai@broadcom.com>,
	Shivasharan S <shivasharan.srikanteshwara@broadcom.com>,
	Chandrakanth Patil <chandrakanth.patil@broadcom.com>,
	megaraidlinux.pdl@broadcom.com,
	Sathya Prakash Veerichetty <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	mpi3mr-linuxdrv.pdl@broadcom.com,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	MPT-FusionLinux.pdl@broadcom.com, Daniel Palmer <daniel@thingy.jp>,
	GOTO Masanori <gotom@debian.or.jp>,
	YOKOTA Hiroshi <yokota@netlab.is.tsukuba.ac.jp>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Geoff Levand <geoff@infradead.org>, Michael Reed <mdr@sgi.com>,
	Nilesh Javali <njavali@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	Narsimhulu Musini <nmusini@cisco.com>,
	"K . Y . Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Long Li <longli@microsoft.com>, linux-hyperv@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev,
	Vishal Bhakta <vishal.bhakta@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	xen-devel@lists.xenproject.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH v3 3/4] block: drop shared-tag fairness throttling
Message-ID: <aimSb9I0Vl-68hy9@kbusch-mbp>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
 <20260609121806.2121755-4-sumit.saxena@broadcom.com>
 <aikAs4X-2NWTuwCc@infradead.org>
 <CAL2rwxr1uGshb1o=jvP2OnBffNz2cKXj8tHuAUCN5HFuy2vB_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL2rwxr1uGshb1o=jvP2OnBffNz2cKXj8tHuAUCN5HFuy2vB_g@mail.gmail.com>
X-purgate-ID: tlsNG-c1860d/1781109366-BC567DB1-2770D79F/0/0
X-purgate-type: clean
X-purgate-size: 1026

On Wed, Jun 10, 2026 at 09:16:11PM +0530, Sumit Saxena wrote:
> The motivation for this change stems from performance issue we
> encountered due to false sharing of the 'nr_active_requests_shared_tags'
> counter
> on certain CPU architectures. I initially submitted a patch to move that
> counter to
> its own cache line to avoid conflicts with 'nr_requests' and other hot
> fields
> (see:
> https://patchwork.kernel.org/project/linux-scsi/patch/20260402074637.92417-3-sumit.saxena@broadcom.com/
> ).
> 
> During the review, Bart shared his work, which eliminates the
> counter entirely by removing the fairness throttling. My testing confirmed
> that
> this approach resolved the performance issues and improved IOPS.
> This patch is part of a larger set, and I have reported the cumulative
> performance
> improvements in the cover letter.

So the problem is just the atomic operation accounting overhead? I
previously thought the device just really needed to consume all the tags
to hit performance.

