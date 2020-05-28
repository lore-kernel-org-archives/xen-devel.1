Return-Path: <SRS0=RRgd=7K=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C190DC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 15:45:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A4F520888
	for <xen-devel@archiver.kernel.org>; Thu, 28 May 2020 15:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A4F520888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeKiJ-0004lf-7I; Thu, 28 May 2020 15:44:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WTQv=7K=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jeKiH-0004l9-QE
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 15:44:57 +0000
X-Inumbo-ID: 2e2e98ba-a0fa-11ea-a7f8-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e2e98ba-a0fa-11ea-a7f8-12813bfff9fa;
 Thu, 28 May 2020 15:44:57 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ql4oFMY44/0+izGe6sI3DPS766VWivHK7e+UQht1ienJumBBxINCvVrusNF/csgnzzoAXeugyh
 RkwXKFIBD86Pkjuj2I1aG9zb1zEiLiKk/BMNTWG/85+cXJhRlZQpqWajrLRoeSeVu6r9Xef0FV
 B4ldKXFF8GnjPuSq9+xelkfZFV39bwLlVzWP4Gzqc6+wKArRHm0CE4IfmDAe4zFfciS9oABf8h
 qpZSY4udpoySoWKrMRFmh4z29UUZ1QoZQUEtSS3znqL7frOEwE6e5YdNRFxGVH1XZaNtZD5RXr
 dIk=
X-SBRS: 2.7
X-MesageID: 19028051
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="19028051"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24271.56435.782626.994907@mariner.uk.xensource.com>
Date: Thu, 28 May 2020 16:44:51 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2] libxl: stop libxl_domain_info() consuming massive
 amounts of stack
In-Reply-To: <20200528151330.20964-1-paul@xen.org>
References: <20200528151330.20964-1-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v2] libxl: stop libxl_domain_info() consuming massive amounts of stack"):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> Currently an array of 1024 xc_domaininfo_t is declared on stack. That alone
> consumes ~112k. Since libxl_domain_info() creates a new gc this patch simply
> uses it to allocate the array instead.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <ian.jackson@eu.citrix.com>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> 
> This is small and IMO it would be nice to have this in 4.14 but I'd like an
> opinion from a maintainer too.

Reviewed-by: Ian Jackson <ian.jackson@eu.citrix.com>

I agree that this is 4.14 material.

Ian.

