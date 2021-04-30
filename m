Return-Path: <SRS0=vACI=J3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E8BC433B4
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 13:26:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD4CB6147E
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 13:26:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD4CB6147E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120543.227955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcT9h-0003lf-GL; Fri, 30 Apr 2021 13:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120543.227955; Fri, 30 Apr 2021 13:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcT9h-0003lY-Cn; Fri, 30 Apr 2021 13:26:05 +0000
Received: by outflank-mailman (input) for mailman id 120543;
 Fri, 30 Apr 2021 13:26:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=963z=J3=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lcT9f-0003lT-QJ
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 13:26:03 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba49aaa2-4e07-4d07-9943-3ba45d313928;
 Fri, 30 Apr 2021 13:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id DE4482ED16;
 Fri, 30 Apr 2021 09:26:02 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFHONqrJWNCf; Fri, 30 Apr 2021 09:26:02 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 6F1D82ED15; Fri, 30 Apr 2021 09:26:02 -0400 (EDT)
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
X-Inumbo-ID: ba49aaa2-4e07-4d07-9943-3ba45d313928
References: <87o8dw52jc.fsf@vps.thesusis.net> <87fsz84zn1.fsf@vps.thesusis.net> <YIszOwADJ8jdBov8@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date: Fri, 30 Apr 2021 09:16:57 -0400
In-reply-to: <YIszOwADJ8jdBov8@google.com>
Message-ID: <87bl9vaoph.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Dmitry Torokhov writes:

> I don't know why Xen keyboard exports that many keycodes ;) In general,
> my recommendation is to mirror the physical device when possible, and
> instantiate several devices so there is 1:1 relationship between virtual
> and physical devices.

I'm still trying to wrap my head around why keys are even declared in
the first place.  PS/2 ports have no idea what keys are on the keyboard
plugged into them, so I guess they don't declare any?  And that doesn't
stop them from emitting any of the scan codes, so what is the use in
declaring them in the first place?

A lot of "interesting" buttons don't seem very interesting to me, such
as left and right parenthesis.  Is a user space mail program really
going to bypass X11/wayland and open input devices directly to look for
someone to press the "send mail" key?  Even if it did, why would it only
want to open a keyboard that advertises that it has such a key instead
of listening to all keyboards?  Even if all USB keyboards report all of
their special keys, the fact that you could still have a PS/2 keyboard
that has a "send mail" key on it means that the reporting function can
not be relied on and so you just have to listen on all keyboards anyhow.

I guess as long as not reporting keys doesn't stop you from using them,
then the Xen Virtual Keyboard driver should just report none, like the
PS/2 keyboard driver.

