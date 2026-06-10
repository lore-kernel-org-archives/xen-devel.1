Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E07CD8CB9
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jun 2026 06:17:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1333972.1597072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXCFX-0008Uj-Vt; Wed, 10 Jun 2026 06:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333972.1597072; Wed, 10 Jun 2026 06:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXCFX-0008Uc-TD; Wed, 10 Jun 2026 06:17:15 +0000
Received: by outflank-mailman (input) for mailman id 1333972;
 Wed, 10 Jun 2026 06:17:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <BATV+081cf7365c78a3b9f81e+8326+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1wXCFW-0008UW-07
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 06:17:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXCFV-000yDq-9l
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 08:17:13 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <BATV+081cf7365c78a3b9f81e+8326+infradead.org+hch@bombadil.srs.infradead.org>)
 id 6a290167-2eae-0a2a0a5409dd-0a2a450bc9e6-2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:17:12 +0200
Received: from [198.137.202.133] (helo=bombadil.infradead.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <BATV+081cf7365c78a3b9f81e+8326+infradead.org+hch@bombadil.srs.infradead.org>)
 id 6a290167-212f-0a2a450b0019-c689ca85de04-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 08:17:12 +0200
Received: from hch by bombadil.infradead.org with local (Exim 4.99.1 #2 (Red
 Hat Linux)) id 1wXCCZ-00000006rUM-2is2;
 Wed, 10 Jun 2026 06:14:11 +0000
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
	bh=5fpuLCYTLSfZqoqCj1yrU/fpNj0jEx06J2udbdGke8E=; b=OFImmvbhxqzG81oeZG+qkLiWj/
	O+FoTgH6IsD9H6izBN+zbpqolbxqx+9PFaalE0ngf4ZPtIVhKG3FWNncNpUvassE+pMoxg7uJ1dlN
	o/1a+N0fBlbkrkKv2jfdrPPcrlf8nC1+BFWDS5uwfZXWKBQIW9aXC8ONxzWjN5GQqHnNRYbkZWGsc
	r9zOlolOC8eIVseUzidKJhPi3wTenh7FHIi9rxabyyO+h/40Pa5f3/VNUtd20iNePgabwc3S+cnjT
	Kd3X/a3mAFndB1a4zGa1uW8ACr+9Jp1LawQAr1tSl3VC1bdB13cQxeZxqMdPuJ1TIqqIwB6io6LeU
	cbljK5hw==;
Date: Tue, 9 Jun 2026 23:14:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Sumit Saxena <sumit.saxena@broadcom.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
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
Message-ID: <aikAs4X-2NWTuwCc@infradead.org>
References: <20260609121806.2121755-1-sumit.saxena@broadcom.com>
 <20260609121806.2121755-4-sumit.saxena@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609121806.2121755-4-sumit.saxena@broadcom.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-purgate-ID: tlsNG-42698a/1781072232-21581F3B-4C9B736D/0/0
X-purgate-type: clean
X-purgate-size: 917

Just dropping the fairness was rejected before and there is no
explanation here on why any of that has changed.

On Tue, Jun 09, 2026 at 05:48:02PM +0530, Sumit Saxena wrote:
> From: Bart Van Assche <bvanassche@acm.org>
> 
> Original patch [1] by Bart Van Assche; this version is rebased onto the
> current tree.  In testing it improves IOPS by roughly 16-18% by removing
> the fair-sharing throttle on shared tag queues.
> 
> This patch removes the following code and structure members:
> - The function hctx_may_queue().
> - blk_mq_hw_ctx.nr_active and request_queue.nr_active_requests_shared_tags
>   and also all the code that modifies these two member variables.

.. and besides that, this commit message is still entirely useless
as it doesn't explain any of the thoughts of why this change is safe
and desirable.  While the mechanics above are totally obvious from
the code change itself.


