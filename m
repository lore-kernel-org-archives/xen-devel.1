Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25782C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 14:14:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFA64207F9
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFA64207F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=net-space.pl
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbPU4-0007PY-5U; Wed, 20 May 2020 14:14:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIPQ=7C=net-space.pl=dkiper@srs-us1.protection.inumbo.net>)
 id 1jbPU2-0007PP-AE
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 14:14:10 +0000
X-Inumbo-ID: 2b35deb9-9aa4-11ea-aa29-12813bfff9fa
Received: from dibed.net-space.pl (unknown [84.10.22.86])
 by us1-amaz-eas2.inumbo.com (Halon) with SMTP
 id 2b35deb9-9aa4-11ea-aa29-12813bfff9fa;
 Wed, 20 May 2020 14:14:09 +0000 (UTC)
Received: from router-fw.i.net-space.pl ([192.168.52.1]:38256 "EHLO
 tomti.i.net-space.pl") by router-fw-old.i.net-space.pl with ESMTP
 id S1953456AbgETNko (ORCPT <rfc822;xen-devel@lists.xenproject.org>);
 Wed, 20 May 2020 15:40:44 +0200
X-Comment: RFC 2476 MSA function at dibed.net-space.pl logged sender identity
 as: dkiper
Date: Wed, 20 May 2020 15:40:40 +0200
From: Daniel Kiper <dkiper@net-space.pl>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: Re: [GRUB PATCH 0/2] Better Xen support
Message-ID: <20200520134040.kwyugkbmel7y4i6q@tomti.i.net-space.pl>
References: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520121420.7965-1-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 20, 2020 at 01:14:18PM +0100, Ian Jackson wrote:
> Hi. As maintainer of the Xen Project upstream CI, I do testing of
> upstream Xen builds onto Debian systems.
>
> We use grub's 20_linux_xen to do the bootloader setup.  However, it is
> missing some features so we are carrying some patches.  Here they are
> for your consideration.
>
> Regards, Ian.
>
> Ian Jackson (2):
>   20_linux_xen: Ignore xenpolicy and config files too
>   20_linux_xen: Support Xen Security Modules (XSM/FLASK)

Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>

Daniel

