Return-Path: <SRS0=G/Cc=AT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB314C433E0
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 15:10:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5ABA206DF
	for <xen-devel@archiver.kernel.org>; Wed,  8 Jul 2020 15:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ubkCsteX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5ABA206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtBiS-0008OM-2x; Wed, 08 Jul 2020 15:10:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vA5+=AT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jtBiQ-0008OH-Mo
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 15:10:30 +0000
X-Inumbo-ID: 2881301e-c12d-11ea-b7bb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2881301e-c12d-11ea-b7bb-bc764e2007e4;
 Wed, 08 Jul 2020 15:10:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8B632064B;
 Wed,  8 Jul 2020 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594221028;
 bh=CkPT5VjDi6r3bKPhISgc9er9XvSARCVDrNHMl+ySW3o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ubkCsteX/VTNE20KBPjTYTTb1JfpuBiOGIF7b9LIMEgfUVjIFQqoEbR18bknG5zf7
 u9p5DN+LlW5ZEuOCLEE0q/+ruNdoOQ/BlDhwMwD5ZTEJm88dtLdiJtiXRyw8ZXx0Ux
 PWG5LKgx65XJm0ydemCy9rt+zhlhqx6UxXl72OXs=
Date: Wed, 8 Jul 2020 08:10:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Subject: Re: Xen and RISC-V Design Session
In-Reply-To: <20200708143420.GA8562@piano>
Message-ID: <alpine.DEB.2.21.2007080808420.4124@sstabellini-ThinkPad-T480s>
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
 <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
 <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
 <CAKmqyKP5j7tQLZ8ka=CoN93X87a1LQhnMTxSeYfFo0jviMzP-w@mail.gmail.com>
 <20200708143420.GA8562@piano>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Alistair Francis <alistair23@gmail.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, 8 Jul 2020, Bobby Eshleman wrote:
> On Wed, Jul 08, 2020 at 06:20:47AM -0700, Alistair Francis wrote:
> > 
> > Thanks! Just submitted the proposal.
> > 
> > It would be really great to have Bobby attend (on CC) as he has been
> > working on it. I'm not sure what timezone he is in though.
> > 
> 
> Hey Alistair,
> 
> I am on the west coast in the USA, so some of the later slots would work best
> for me too.

I'd love to attend this session. Realistically we have two sessions
tomorrow we could use, the 7:15AM and the 8:30AM California time, we
could use one for FuSa and the other for RISC-V.

