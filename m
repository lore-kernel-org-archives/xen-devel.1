Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ACEAC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 11:04:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3241207BC
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 11:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3241207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=antioche.eu.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61127.107289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNeb-0004pR-D9; Mon, 04 Jan 2021 11:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61127.107289; Mon, 04 Jan 2021 11:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNeb-0004pK-9u; Mon, 04 Jan 2021 11:04:01 +0000
Received: by outflank-mailman (input) for mailman id 61127;
 Mon, 04 Jan 2021 11:04:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmHV=GH=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kwNea-0004pF-AJ
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 11:04:00 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10c4168c-9ad5-47d9-aef6-be9c07e4b25c;
 Mon, 04 Jan 2021 11:03:59 +0000 (UTC)
Received: from rochebonne.antioche.eu.org (rochebonne [10.0.0.1])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTP id 104B3tJT006474;
 Mon, 4 Jan 2021 12:03:55 +0100 (MET)
Received: by rochebonne.antioche.eu.org (Postfix, from userid 1210)
 id 0D3EC281D; Mon,  4 Jan 2021 12:03:55 +0100 (CET)
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
X-Inumbo-ID: 10c4168c-9ad5-47d9-aef6-be9c07e4b25c
Date: Mon, 4 Jan 2021 12:03:55 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH 20/24] If FILENAME_MAX is defined, use it instead of
 arbitrary value (fix format-truncation errors with GCC >= 7)
Message-ID: <20210104110355.GJ2005@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
 <20201214163623.2127-21-bouyer@netbsd.org>
 <20201229145155.5gwyyrb47p45ak3c@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201229145155.5gwyyrb47p45ak3c@Air-de-Roger>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Mon, 04 Jan 2021 12:03:55 +0100 (MET)

On Tue, Dec 29, 2020 at 03:51:55PM +0100, Roger Pau Monné wrote:
> I think it's dangerous to do this, specially on the stack, GNU libc
> manual states:
> 
> Usage Note: Don?t use FILENAME_MAX as the size of an array in which to
> store a file name! You can?t possibly make an array that big! Use
> dynamic allocation (see Memory Allocation) instead.
> 
> I think it would be better to replace the snprintf calls with asprintf
> and free the buffer afterwards.

I went this route, thanks

> Setting file_name to 284 should be
> fine however, as d_name is 256 max and the paths above are 26 maximum
> I think (27 with the nul character).

On NetBSD d_name is 512 ... I guess this is why gcc complains.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

