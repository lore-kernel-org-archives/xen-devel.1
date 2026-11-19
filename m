Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091E606A320
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 06:13:14 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1495739.1694520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvOG-0006RF-5q; Thu, 19 Nov 2026 06:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1495739.1694520; Thu, 19 Nov 2026 06:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTvOG-0006R7-2m; Thu, 19 Nov 2026 06:13:00 +0000
Received: by outflank-mailman (input) for mailman id 1495739;
 Thu, 19 Nov 2026 06:12:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xTvOF-0006Qx-A8
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 06:12:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTvOC-00AsYg-Kb
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 07:12:56 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afe9360-8faa-0a2a0a5109dd-0a2a4508baa8-6
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:12:56 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6afe9366-f659-0a2a45080019-a0658309c68a-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 07:12:54 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 7FC20852A6EF;
 Thu, 19 Nov 2026 01:11:23 -0500 (EST)
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
To: jgross@suse.com,
	ross.lagerwall@citrix.com
Cc: sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com,
	andrew.cooper3@citrix.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen/swiotlb: Check the segment boundary in range_straddles_page_boundary()
Date: Thu, 19 Nov 2026 06:12:48 +0000
Message-ID: <20261119061248.2016804-1-lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <8262d7e0-75e8-4bc0-932d-1d4e40b716de@suse.com>
References: <807c3b040b02d7d89f1cac76eb137afbee91015d.1794573814.git.lin.liu01@citrix.com> <75f37608-f3ef-48db-8e7b-4a1ba13a9ee0@citrix.com> <8a57f3f6-c649-4be0-8e14-2cc16dd41f8f@suse.com> <20261119043504.2013850-1-lin.liu01@citrix.com> <8262d7e0-75e8-4bc0-932d-1d4e40b716de@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1795068775-CF35D87B-ED671211/0/0
X-purgate-type: clean
X-purgate-size: 227
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/11/2026 05:59, Jürgen Groß wrote:
> Could you please add a comment to the alloc_coherent path that the check
> isn't needed there due to the alignment guaranteed by __get_free_pages()?

Sure, will do in v2.

Lin

