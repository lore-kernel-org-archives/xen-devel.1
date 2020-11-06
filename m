Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C0CC2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 23:01:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 054052067C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 23:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/sHCxT5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 054052067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.21168.47443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbAit-00034c-VK; Fri, 06 Nov 2020 23:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21168.47443; Fri, 06 Nov 2020 23:00:47 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbAit-00034V-S0; Fri, 06 Nov 2020 23:00:47 +0000
Received: by outflank-mailman (input) for mailman id 21168;
 Fri, 06 Nov 2020 23:00:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6QlO=EM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kbAir-00034Q-T3
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 23:00:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f253cf5-1259-4378-902e-0b3bcb88ca41;
 Fri, 06 Nov 2020 23:00:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A09B0208C7;
 Fri,  6 Nov 2020 23:00:42 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=6QlO=EM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kbAir-00034Q-T3
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 23:00:46 +0000
X-Inumbo-ID: 0f253cf5-1259-4378-902e-0b3bcb88ca41
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0f253cf5-1259-4378-902e-0b3bcb88ca41;
	Fri, 06 Nov 2020 23:00:44 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A09B0208C7;
	Fri,  6 Nov 2020 23:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604703643;
	bh=aB37nOeqQHWmUkfsWTfJ/37tF0GHcQXoLIg2M5HqFCE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=h/sHCxT5tvHTke/HWm1JTLlRAxJvRyRuodr0YaYMinZ4mxKBmKu7bqRNgXlmVzNJa
	 DJ8PGV1sSwH7qMahGHWaiKat81hd0mJWpjQekWQq2QiTYQTzzPR3D3CILft3Ss+MPr
	 QYgquDXHOMeAF1covGpYJJ54DM14wtAEHCPd9+bo=
Date: Fri, 6 Nov 2020 15:00:41 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    George Dunlap <george.dunlap@citrix.com>, 
    Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.14.1
In-Reply-To: <e12e32ca-8d2e-7314-e942-4de77d72ba4a@suse.com>
Message-ID: <alpine.DEB.2.21.2011061459550.2323@sstabellini-ThinkPad-T480s>
References: <5aa0791a-db56-8f5a-51a1-5863748ce7f1@suse.com> <alpine.DEB.2.21.2011051753580.2323@sstabellini-ThinkPad-T480s> <e12e32ca-8d2e-7314-e942-4de77d72ba4a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 Nov 2020, Jan Beulich wrote:
> On 06.11.2020 02:58, Stefano Stabellini wrote:
> > On Wed, 4 Nov 2020, Jan Beulich wrote:
> >> the release is due in a couple of weeks time. Please point out
> >> backports you find missing from the respective staging branch,
> >> but which you consider relevant. (Ian: Please double check
> >> there are indeed no tools side backports needed here.)
> >>
> >> Julien, Stefano, on the Arm side I'd like to ask for
> >>
> >> 5d45ecabe3c0 xen/arm64: force gcc 10+ to always inline generic atomics helpers
> >>
> >> just like I did when sending the respective 4.13.2 / 4.12.4
> >> mail. Is there a particular reason it wasn't put in?
> > 
> > No, I have just backported 5d45ecabe3c0 and a couple of other fixes.
> 
> Thanks.
> 
> > Jan, do you think we should backport the following also?
> > 
> > 8856a914b build: also check for empty .bss.* in .o -> .init.o conversion
> 
> Not having it wasn't causing active problems afaict, so it
> was more to prevent future issues to put it in place. Did
> we gain dependencies on this change which want backporting?

No that's OK. I was just wondering if it was fixing something important
enough to backport. I think we are good on my side then.

