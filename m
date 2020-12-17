Return-Path: <SRS0=ek7T=FV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B775EC4361B
	for <xen-devel@archiver.kernel.org>; Thu, 17 Dec 2020 23:55:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562F5235FD
	for <xen-devel@archiver.kernel.org>; Thu, 17 Dec 2020 23:55:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562F5235FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.56255.98386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq36e-00074S-MB; Thu, 17 Dec 2020 23:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56255.98386; Thu, 17 Dec 2020 23:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kq36e-00074L-J3; Thu, 17 Dec 2020 23:54:48 +0000
Received: by outflank-mailman (input) for mailman id 56255;
 Thu, 17 Dec 2020 23:54:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BHja=FV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kq36d-00074G-MW
 for xen-devel@lists.xenproject.org; Thu, 17 Dec 2020 23:54:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 107c4837-21a3-4778-8f39-94d815bf8c13;
 Thu, 17 Dec 2020 23:54:46 +0000 (UTC)
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
X-Inumbo-ID: 107c4837-21a3-4778-8f39-94d815bf8c13
Date: Thu, 17 Dec 2020 15:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608249286;
	bh=rWfARMVooBX7b7FOUc5CYcurwjdt6QhGoSb8STsLutc=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=EkYO7jElAhAiPdLi/xFO54X+XnEgy8dmeNdgtirsCVaHcBOiXxoQfVlw66CsbyB/S
	 nzmAlcwI/S4LrjTO4yUeSazKpZFxBZBLjrgbYasgaW7vcTvzuV4CF1Ot15g9dTZMR5
	 yFE+5Vw8seKmkk9tM3XgAd5dp0fI0h19ZNn5bFqTheQS+Oz9kyF/V6C87vJESL8RSB
	 iWtRRGS6O8tIUJJSaWC2++3uMuSDNeQ0YyOLI49OTuPyVHKIXQMiA7Uc0JuiwrlvIt
	 iFwJ/g0Frkn/UDN/opAFYOv3dWpOSVDfsFR4XLLkF+yFQR0OX/cfZGITPtT5u/7fsv
	 YbaxXyBcJ4JtQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com, 
    Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
In-Reply-To: <3f165cf8-88a4-590a-6e86-2435e8a7e554@suse.com>
Message-ID: <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
References: <20201215112610.1986-1-julien@xen.org> <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com> <04455739-f07f-3da8-f764-33600a9cab6f@xen.org> <3f165cf8-88a4-590a-6e86-2435e8a7e554@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Dec 2020, Jan Beulich wrote:
> On 15.12.2020 14:19, Julien Grall wrote:
> > On 15/12/2020 11:46, Jan Beulich wrote:
> >> On 15.12.2020 12:26, Julien Grall wrote:
> >>> --- a/xen/include/xen/lib.h
> >>> +++ b/xen/include/xen/lib.h
> >>> @@ -23,7 +23,13 @@
> >>>   #include <asm/bug.h>
> >>>   
> >>>   #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
> >>> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
> >>> +#define WARN_ON(p)  ({                  \
> >>> +    bool __ret_warn_on = (p);           \
> >>
> >> Please can you avoid leading underscores here?
> > 
> > I can.
> > 
> >>
> >>> +                                        \
> >>> +    if ( unlikely(__ret_warn_on) )      \
> >>> +        WARN();                         \
> >>> +    unlikely(__ret_warn_on);            \
> >>> +})
> >>
> >> Is this latter unlikely() having any effect? So far I thought it
> >> would need to be immediately inside a control construct or be an
> >> operand to && or ||.
> > 
> > The unlikely() is directly taken from the Linux implementation.
> > 
> > My guess is the compiler is still able to use the information for the 
> > branch prediction in the case of:
> > 
> > if ( WARN_ON(...) )
> 
> Maybe. Or maybe not. I don't suppose the Linux commit introducing
> it clarifies this?

I did a bit of digging but it looks like the unlikely has been there
forever. I'd just keep it as is.

