Return-Path: <SRS0=mH2p=GR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104C2C433DB
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 10:53:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B089323A3B
	for <xen-devel@archiver.kernel.org>; Thu, 14 Jan 2021 10:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B089323A3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.66931.119082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l00Fo-0004YM-T2; Thu, 14 Jan 2021 10:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66931.119082; Thu, 14 Jan 2021 10:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l00Fo-0004YF-Q9; Thu, 14 Jan 2021 10:53:24 +0000
Received: by outflank-mailman (input) for mailman id 66931;
 Thu, 14 Jan 2021 10:53:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l00Fn-0004Y9-JT
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 10:53:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0fe90c0-820e-4290-9fe4-01b78c1fd382;
 Thu, 14 Jan 2021 10:53:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 665C4AB7A;
 Thu, 14 Jan 2021 10:53:21 +0000 (UTC)
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
X-Inumbo-ID: a0fe90c0-820e-4290-9fe4-01b78c1fd382
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610621601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDqTXQXdmk4fsIDpSS9BG+0sNkjlWcAvgR0KCm1vQ3I=;
	b=O/JntxaI6jEXhx+dFxcDkfw1GTuZrtGf2UPiKNlHKXQbIc1a/Gjw74M3LNhHq6/W9ZzROB
	GXw9rfQGNhzU+t4kStM6VvkvMlqP8l0Um4VjUXc21SCKVBQcECy6BtNw8aqVwrq7gONUXe
	KUy3seTU5rbJ/UWDyWPyhag74LZq8wY=
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Manuel Bouyer <bouyer@netbsd.org>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
Date: Thu, 14 Jan 2021 11:53:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112181242.1570-1-bouyer@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 19:12, Manuel Bouyer wrote:
> From: Manuel Bouyer <bouyer@netbsd.org>
> 
> Use unsigned char variable, or cast to (unsigned char), for
> tolower()/islower() and friends. Fix compiler error
> array subscript has type 'char' [-Werror=char-subscripts]

Isn't this something that wants changing in your ctype.h instead?
the functions (or macros), as per the C standard, ought to accept
plain char aiui, and if they use the input as an array subscript,
it should be their implementation suitably converting type first.

Jan

