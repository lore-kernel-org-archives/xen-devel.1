Return-Path: <SRS0=Mf7K=FL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E533C433FE
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 23:18:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17CD723A1C
	for <xen-devel@archiver.kernel.org>; Mon,  7 Dec 2020 23:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17CD723A1C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.47060.83298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmPlT-0003oh-0y; Mon, 07 Dec 2020 23:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47060.83298; Mon, 07 Dec 2020 23:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmPlS-0003oa-U4; Mon, 07 Dec 2020 23:17:54 +0000
Received: by outflank-mailman (input) for mailman id 47060;
 Mon, 07 Dec 2020 23:17:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KVsS=FL=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kmPlR-0003oV-B5
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 23:17:53 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7992ddc3-6dcd-4f93-9877-0ca8d506d2fa;
 Mon, 07 Dec 2020 23:17:52 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0B7NHdhB034943
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 7 Dec 2020 18:17:45 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0B7NHcpJ034942;
 Mon, 7 Dec 2020 15:17:38 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 7992ddc3-6dcd-4f93-9877-0ca8d506d2fa
Date: Mon, 7 Dec 2020 15:17:38 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH] xen/arm: domain_build: Ignore empty memory bank
Message-ID: <X864Ep+tA609svay@mattapan.m5p.com>
References: <202012071807.0B7I7TJq033563@m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202012071807.0B7I7TJq033563@m5p.com>

On Mon, Dec 07, 2020 at 07:36:11AM -0800, Elliott Mitchell wrote:
> Commit 5a37207df52066efefe419c677b089a654d37afc changed this behavior to
> ignore such banks.  Unfortunately this means these empty nodes are
> visible to code which accesses the device trees.  Have domain_build also
> ignore these entries.

It is implicit, but I discovered 7d2b21fd36c2a47799eed71c67bae7faa1ec4272
actually broke Xen for me.  As such I believe this should get into
stable-4.14 as a bugfix.

Taking a second look, that error message is bad.  The preliminary fix I
came up with was:   if(!addr) continue;

As I thought the 0 it was reporting was an address of 0.  Perhaps
"Unable to retrieve address for index %u of %s\n"?

(I opted for testing size after finding the source of the bug and decided
duplicating behavior was better)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



