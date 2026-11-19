Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C1606A32C
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 04:35:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1495517.1694368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTtrd-0007bS-7z; Thu, 19 Nov 2026 04:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495517.1694368; Thu, 19 Nov 2026 04:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTtrd-0007bK-2O; Thu, 19 Nov 2026 04:35:13 +0000
Received: by outflank-mailman (input) for mailman id 1495517;
 Thu, 19 Nov 2026 04:35:11 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xTtrb-0007bB-Or
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 04:35:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTtrb-007kF4-5O
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 05:35:11 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afe7c5d-8faa-0a2a0a5109dd-0a2a450396ea-16
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 05:35:11 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afe7c7e-fae8-0a2a45030019-a06583099228-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 05:35:11 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id E413D8521FB1;
 Wed, 18 Nov 2026 23:33:39 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: ross.lagerwall@citrix.com,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in range_straddles_page_boundary()
Date: Thu, 19 Nov 2026 04:35:04 +0000
Message-ID: <20261119043504.2013850-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com> <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com> <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1795062911-766FB4E9-E3AE2522/0/0
X-purgate-type: clean
X-purgate-size: 1855
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 12:24, Jürgen Groß wrote:
> On 18.11.26 12:25, Ross Lagerwall wrote:
>> Is the change actually needed for alloc_coherent / free_coherent?
>> The allocation from __get_free_pages() is naturally aligned and
>> range_requires_alignment() requires it has the same alignment so it is
>> naturally aligned in bus space. I don't think that it can cross a
>> segment boundary then.
>
> Hmm, agreed.

Thanks both.  Agreed, the check is unnecessary for the coherent paths.
I had noted this in the commit message ("coherent allocations are already
naturally aligned via range_requires_alignment()"), but the code still
changed them.

For v2 I plan to leave range_straddles_page_boundary() and the coherent
paths untouched, and check only streaming mappings, with a small helper
next to range_straddles_page_boundary():

/* Bus-contiguous, but may still cross the device's segment boundary */
static inline bool range_crosses_seg_boundary(struct device *dev,
					      dma_addr_t dma, size_t size)
{
	unsigned long mask = dma_get_seg_boundary(dev);

	return size && ((dma ^ (dma + size - 1)) & ~mask);
}

used in xen_swiotlb_map_phys():

	if (dma_capable(dev, dev_addr, size, true, attrs) &&
	    !dma_kmalloc_needs_bounce(dev, size, dir) &&
	    !range_straddles_page_boundary(phys, size) &&
	    !range_crosses_seg_boundary(dev, dev_addr, size) &&
		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
		!is_swiotlb_force_bounce(dev))
		goto done;

A mapping larger than the boundary window also takes the bounce path:
swiotlb cannot find slots that do not span the boundary, so the mapping
fails instead of the device being handed a crossing range.

This is the shape of the version Jürgen first looked at, before the check
was moved into the helper.

I'll send v2 if you are both happy with that.

Lin

