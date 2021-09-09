Return-Path: <SRS0=yIgx=N7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F4D9C433F5
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 13:23:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0649261101
	for <xen-devel@archiver.kernel.org>; Thu,  9 Sep 2021 13:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0649261101
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.183263.331334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOK1n-0004au-Vj; Thu, 09 Sep 2021 13:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183263.331334; Thu, 09 Sep 2021 13:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOK1n-0004an-SY; Thu, 09 Sep 2021 13:23:43 +0000
Received: by outflank-mailman (input) for mailman id 183263;
 Thu, 09 Sep 2021 13:23:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOK1m-0004ah-FF
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:23:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOK1m-0006Zw-Dk
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:23:42 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mOK1m-0001No-CZ
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 13:23:42 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mOK1j-0006S7-30; Thu, 09 Sep 2021 14:23:39 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=6mn2J4fCktS3gK9y9aI9Ib+3/dFLwQ5S1oqkz03U5iY=; b=3EwW3eeIaUTdIdwcjcWaC1LYKA
	KsCvmlk3OIx+undqBYTiIDmLmF3nr1rXk8h7J3v3Bn3Rf6vvvs29n/vR/f/9bYpiaLKFMsunpXlqY
	YTI17ERgV0WVcWi+51LnIGZBbAHg+T1bVG9tEgRkVsifsjMPyjb22pU6GCh6XqlwlAOs=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24890.2778.780247.724651@mariner.uk.xensource.com>
Date: Thu, 9 Sep 2021 14:23:38 +0100
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Ian Jackson <iwj@xenproject.org>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>,
    Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
In-Reply-To: <20210909124924.1698-2-jgross@suse.com>
References: <20210909124924.1698-1-jgross@suse.com>
	<20210909124924.1698-2-jgross@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("[PATCH v2 1/3] stubdom: fix build with disabled pv-grub"):
> Today the build will fail if --disable-pv-grub as a parameter of
> configure, as the main Makefile will unconditionally try to build a
> 32-bit pv-grub stubdom.
> 
> Fix that by introducing a pv-grub32 target in stubdom/Makefile taking
> care of this situation.

I approve of this whole series, with one resrvation:

I think the name "pv-grub32" for this target is confusing.  It's not
really specifically 32-bit.  The difference between the targets
"pv-grub32" and "pv-grub" is that "pv-grub32" is unconditionally
built but might mean nothing; it has a conditional dependency on
"pv-grub" which is conditionally built but always implies the actual
build.

I don't think the suffix "32" really conveys this :-).

How about "pv-grub-maybe" ?  Or something.

You can put my ack on patches 2 and 3 right away.

Thanks,
Ian.

