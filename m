Return-Path: <SRS0=XnGw=MZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FDC4C4338F
	for <xen-devel@archiver.kernel.org>; Mon,  2 Aug 2021 13:30:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED84260F11
	for <xen-devel@archiver.kernel.org>; Mon,  2 Aug 2021 13:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED84260F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.163082.298833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAY1W-0005EC-GF; Mon, 02 Aug 2021 13:30:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163082.298833; Mon, 02 Aug 2021 13:30:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAY1W-0005E5-DD; Mon, 02 Aug 2021 13:30:30 +0000
Received: by outflank-mailman (input) for mailman id 163082;
 Mon, 02 Aug 2021 13:30:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zvSH=MZ=8bytes.org=joro@srs-us1.protection.inumbo.net>)
 id 1mAY1V-0005Dz-LO
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 13:30:29 +0000
Received: from theia.8bytes.org (unknown
 [2a01:238:4383:600:38bc:a715:4b6d:a889])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a615b2f9-02ff-4c77-b98b-cff12c7fda44;
 Mon, 02 Aug 2021 13:30:28 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0AFF0379; Mon,  2 Aug 2021 15:30:25 +0200 (CEST)
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
X-Inumbo-ID: a615b2f9-02ff-4c77-b98b-cff12c7fda44
Date: Mon, 2 Aug 2021 15:30:10 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Juergen Gross <jgross@suse.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Tianyu Lan <ltykernel@gmail.com>,
	kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
	konrad.wilk@oracle.com, boris.ostrovsky@oracle.com,
	sstabellini@kernel.org, will@kernel.org, davem@davemloft.net,
	kuba@kernel.org, jejb@linux.ibm.com, martin.petersen@oracle.com,
	arnd@arndb.de, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com, thomas.lendacky@amd.com,
	brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
	rientjes@google.com, martin.b.radev@gmail.com,
	akpm@linux-foundation.org, rppt@kernel.org,
	kirill.shutemov@linux.intel.com, aneesh.kumar@linux.ibm.com,
	krish.sadhukhan@oracle.com, saravanand@fb.com,
	xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
	keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
	michael.h.kelley@microsoft.com, iommu@lists.linux-foundation.org,
	linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	netdev@vger.kernel.org, vkuznets@redhat.com, anparri@microsoft.com
Subject: Re: [PATCH 03/13] x86/HV: Add new hvcall guest address host
 visibility support
Message-ID: <YQfzYl5N5iXv4ZFH@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-4-ltykernel@gmail.com>
 <c00e269c-da4c-c703-0182-0221c73a76cc@intel.com>
 <YQfepYTC4n6agq9z@8bytes.org>
 <5badc0cb-3038-2eff-a4bf-022ce8fc51d7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5badc0cb-3038-2eff-a4bf-022ce8fc51d7@suse.com>

On Mon, Aug 02, 2021 at 03:11:40PM +0200, Juergen Gross wrote:
> As those cases are all mutually exclusive, wouldn't a static_call() be
> the appropriate solution?

Right, static_call() is even better, thanks.

