Return-Path: <SRS0=6W/h=IJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270AEC433E6
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 16:45:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C058C64FA7
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 16:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C058C64FA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96695.183235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKORN-00056B-25; Thu, 11 Mar 2021 16:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96695.183235; Thu, 11 Mar 2021 16:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKORM-000564-UZ; Thu, 11 Mar 2021 16:45:36 +0000
Received: by outflank-mailman (input) for mailman id 96695;
 Thu, 11 Mar 2021 16:45:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKORM-00055z-8q
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:45:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05979bf0-1b58-4b9e-a1ac-d651c3d61433;
 Thu, 11 Mar 2021 16:45:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5428AE89;
 Thu, 11 Mar 2021 16:45:33 +0000 (UTC)
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
X-Inumbo-ID: 05979bf0-1b58-4b9e-a1ac-d651c3d61433
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615481133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kWOIl8oLuAwGIDrlkjfHBd4+KSVj5o4ziFUBHJIRra0=;
	b=tuEe3I5juGDXWc1y6p4Faz4WSTuDWzPZBT/fDaoWbzKxvrBtsjL0r9YFqNUGr6QE9iD6uC
	XjwpYW2PWGNCpnj76JYG8/ffAHlLCGDguLaCAhG3zDpjAk7U+pqToD1ru1+WbxDvI1mjSE
	0g2EdriBFV+O4KxhffW79SbQBodNSeU=
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
To: Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Roger Pau Monne <roger.pau@citrix.com>
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
 <9cc6f3ff-f078-1657-7c5a-9f356a857cdb@suse.com>
 <fc6cf1a2e27fc2c62152e7772be01fac4e9acc50.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1d4c20c4-39e4-a05f-d4a4-c9a3ad56b64b@suse.com>
Date: Thu, 11 Mar 2021 17:45:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fc6cf1a2e27fc2c62152e7772be01fac4e9acc50.camel@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11.03.2021 17:21, Dario Faggioli wrote:
> On Thu, 2021-03-11 at 12:28 +0100, Jan Beulich wrote:
>> On 11.03.2021 10:40, Dario Faggioli wrote:
>>>
>>> Removing the special casing of NR_CPUS == 1 makes things work again.
>>>
>>> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
>>
>> Doesn't this want a Reported-by: Roger?
>>
> It definitely does! And I even forgot to Cc him... Sorry Roger :-(
> 
> Will you add it, or do you want me to resubmit with it?

No need to, I've taken note.

Jan

