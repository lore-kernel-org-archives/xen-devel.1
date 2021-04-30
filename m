Return-Path: <SRS0=vACI=J3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8A4C433B4
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 00:59:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D647F61418
	for <xen-devel@archiver.kernel.org>; Fri, 30 Apr 2021 00:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D647F61418
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thesusis.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120274.227479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcHUo-0006DC-Vn; Fri, 30 Apr 2021 00:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120274.227479; Fri, 30 Apr 2021 00:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lcHUo-0006D5-Rl; Fri, 30 Apr 2021 00:59:06 +0000
Received: by outflank-mailman (input) for mailman id 120274;
 Fri, 30 Apr 2021 00:59:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=963z=J3=vps.thesusis.net=psusi@srs-us1.protection.inumbo.net>)
 id 1lcHUn-0006D0-86
 for xen-devel@lists.xenproject.org; Fri, 30 Apr 2021 00:59:05 +0000
Received: from vps.thesusis.net (unknown [34.202.238.73])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce33088b-ec33-49b0-b83a-54855628fb60;
 Fri, 30 Apr 2021 00:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by vps.thesusis.net (Postfix) with ESMTP id 849F72ECDB;
 Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
Received: from vps.thesusis.net ([127.0.0.1])
 by localhost (vps.thesusis.net [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUoBqIdkD_Xa; Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
Received: by vps.thesusis.net (Postfix, from userid 1000)
 id 3F4522ECDA; Thu, 29 Apr 2021 20:59:04 -0400 (EDT)
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
X-Inumbo-ID: ce33088b-ec33-49b0-b83a-54855628fb60
References: <87o8dw52jc.fsf@vps.thesusis.net> <87fsz84zn1.fsf@vps.thesusis.net> <YIszOwADJ8jdBov8@google.com> <87o8dw8vyg.fsf@vps.thesusis.net> <YItQ72UkqyKuHEk4@google.com>
User-agent: mu4e 1.5.7; emacs 26.3
From: Phillip Susi <phill@thesusis.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: xen-devel@lists.xenproject.org, linux-input@vger.kernel.org
Subject: Re: Xen Virtual Keyboard modalias breaking uevents
Date: Thu, 29 Apr 2021 20:57:38 -0400
In-reply-to: <YItQ72UkqyKuHEk4@google.com>
Message-ID: <87im448u5j.fsf@vps.thesusis.net>
MIME-Version: 1.0
Content-Type: text/plain


Dmitry Torokhov writes:

> Userspace may or may not have access to sysfs (it does not have to be
> mounted)

How would userspace even enumerate the input devices and read their
modalias without sysfs?

