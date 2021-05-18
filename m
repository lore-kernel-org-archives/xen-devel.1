Return-Path: <SRS0=1gSS=KN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53620C433ED
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 17:51:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0216960FE3
	for <xen-devel@archiver.kernel.org>; Tue, 18 May 2021 17:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0216960FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.129539.243136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj3sj-0000LU-7P; Tue, 18 May 2021 17:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129539.243136; Tue, 18 May 2021 17:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj3sj-0000LN-3Z; Tue, 18 May 2021 17:51:49 +0000
Received: by outflank-mailman (input) for mailman id 129539;
 Tue, 18 May 2021 17:51:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vJ9Y=KN=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lj3sh-0000LH-56
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 17:51:47 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0d4aa79-b83e-42ee-9e0a-0dd3ba73c248;
 Tue, 18 May 2021 17:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 4492A2181A;
 Tue, 18 May 2021 13:51:46 -0400 (EDT)
Received: from vps.thesusis.net ([IPv6:::1])
 by localhost (vps.thesusis.net [IPv6:::1]) (amavisd-new, port 10024)
 with ESMTP id lFpdzBQUarjJ; Tue, 18 May 2021 13:51:46 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 0BC992181E; Tue, 18 May 2021 13:51:46 -0400 (EDT)
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
X-Inumbo-ID: c0d4aa79-b83e-42ee-9e0a-0dd3ba73c248
References: <87o8dw52jc.fsf@vps.thesusis.net> <20210506143654.17924-1-phill@thesusis.net> <YJRRCEJrQOwVymdP@google.com> <871ra4yprd.fsf@vps.thesusis.net>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Xen Keyboard: don't advertise every key known to man
Date: Tue, 18 May 2021 13:13:45 -0400
In-reply-to: <871ra4yprd.fsf@vps.thesusis.net>
Message-ID: <87zgwsc4lp.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Phillip Susi writes:

> Dmitry Torokhov writes:
>
>> By doing this you are stopping delivery of all key events from this
>> device.

Hrm... I don't have very many "interesting" keys to test, but when I hit
the menu key, I see KEY_COMPOSE, which is > KEY_MIN_INTERESTING.  When I
press the button to have my vnc client send a windows key, I see
KEY_LEFTCTRL+KEY_ESC.  I also see KEY_PAUSE when I hit that key and it
is also "interesting".  I get the same thing with or without this patch,
so it does not appear to be breaking delivery of the keys that are no
longer being advertised.

Oddly though, libinput list-devices does not even show the Xen Virtual
Keyboard.  It's sysfs path is /sys/class/input/input1, but it also does
not have a device node in /dev/input so I can't even ask libinput to
only monitor that device.

Ok... this is really odd.. it does show the device without this patch,
and not with it.  The input events I was seeing were coming through the
"AT Translated Set 2 keyboard" and no events come though the Xen Virtual
Keyboard ( even without this patch ).  This makes me wonder why we have
this device at all?

