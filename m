Return-Path: <SRS0=2Mj5=G6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03990C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 15:48:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88EC3207B7
	for <xen-devel@archiver.kernel.org>; Wed, 27 Jan 2021 15:48:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88EC3207B7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.76191.137375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n3O-0003Wp-F3; Wed, 27 Jan 2021 15:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76191.137375; Wed, 27 Jan 2021 15:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4n3O-0003Wi-BR; Wed, 27 Jan 2021 15:48:22 +0000
Received: by outflank-mailman (input) for mailman id 76191;
 Wed, 27 Jan 2021 15:48:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n3M-0003WW-SR
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:48:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n3M-0000kE-Qr
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:48:20 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l4n3M-00022v-Q9
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 15:48:20 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l4n3I-0001e3-6A; Wed, 27 Jan 2021 15:48:16 +0000
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
	bh=PI+hG9NVN+A7MAXc/JCmbOhIAVsEMucd6F4dZzcaxa8=; b=Yw1T7KULfEHO7S/8Z8bbZ0yIib
	KDU/upKqi8nl2thpZEeFZieg6ZVW4M2JtiQ6BL/czluJyTd+v6oSwGBtE5Y0K3Pxw7nUqlPjIKlro
	ggn+Umgil0FxZrSy19EiZ2/5OhBjWwZJpFkcJNtOwFY5PfwfQaL22HWldh399oOOei2w=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24593.35647.975254.988331@mariner.uk.xensource.com>
Date: Wed, 27 Jan 2021 15:48:15 +0000
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>,
    "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: MAINTAINERS vs libxl
In-Reply-To: <c427c7f7-05ed-e537-76c2-c900a753755d@suse.com>
References: <c427c7f7-05ed-e537-76c2-c900a753755d@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Jan Beulich writes ("MAINTAINERS vs libxl"):
> In commit 032a96e5ef38 tools/libxl/ was split into
> tools/libs/light/ and tools/libs/guest/. Wasn't the latter
> rather meant to be tools/libs/util/, as that's the other part
> of what had previously resided under tools/libxl/?

I think so, yes.

Ian.

