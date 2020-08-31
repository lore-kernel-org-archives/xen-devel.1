Return-Path: <SRS0=BfPI=CJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA80C433E6
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2020 19:21:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D58B520EDD
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2020 19:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+M2tjvU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D58B520EDD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCpMN-0001mM-5Q; Mon, 31 Aug 2020 19:20:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNzp=CJ=linux-foundation.org=akpm@srs-us1.protection.inumbo.net>)
 id 1kCpMM-0001mH-Mw
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 19:20:54 +0000
X-Inumbo-ID: cf4a30ce-7f97-464e-8952-adaf3e4ba08f
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf4a30ce-7f97-464e-8952-adaf3e4ba08f;
 Mon, 31 Aug 2020 19:20:54 +0000 (UTC)
Received: from X1 (unknown [65.49.58.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9D99820FC3;
 Mon, 31 Aug 2020 19:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598901653;
 bh=gZtRElBlIkTkKjny9lAT11wYTcgum1ipgdXOa4pL5qs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p+M2tjvUfpO4dqGrGR52PplNvObL9ffg8gJg7MwjRXELO08GhxSMd/4ZUX8kYu537
 sFR/OUH3w/KoqAWwoXV6UJUToA/rmoiGdfPVSX+Kiw6PHdIdBd1OqfdeyFV+NfmgFs
 OcsDSbXnXGcKzKpbxk+MZFgOCSABTpoUdIRCdv9Y=
Date: Mon, 31 Aug 2020 12:20:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, "Dave Jiang"
 <dave.jiang@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ira Weiny
 <ira.weiny@intel.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Johannes Thumshirn <jthumshirn@suse.de>, Logan Gunthorpe
 <logang@deltatee.com>, <linux-nvdimm@lists.01.org>,
 <xen-devel@lists.xenproject.org>, <linux-mm@kvack.org>
Subject: Re: [PATCH v4 1/2] memremap: rename MEMORY_DEVICE_DEVDAX to
 MEMORY_DEVICE_GENERIC
Message-Id: <20200831122051.95d3e558477024819672f4f9@linux-foundation.org>
In-Reply-To: <20200811094447.31208-2-roger.pau@citrix.com>
References: <20200811094447.31208-1-roger.pau@citrix.com>
 <20200811094447.31208-2-roger.pau@citrix.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 11 Aug 2020 11:44:46 +0200 Roger Pau Monne <roger.pau@citrix.com> wrote:

> This is in preparation for the logic behind MEMORY_DEVICE_DEVDAX also
> being used by non DAX devices.

Acked-by: Andrew Morton <akpm@linux-foundation.org>.

Please add it to the Xen tree when appropriate.

(I'm not sure what David means by "separate type", but we can do that
later if desired.  Dan is taking a taking a bit of downtime).

