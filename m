Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA380C433FE
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 14:56:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E8E323406
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 14:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E8E323406
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48377.85534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0tL-0002kL-7L; Wed, 09 Dec 2020 14:56:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48377.85534; Wed, 09 Dec 2020 14:56:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0tL-0002kE-4B; Wed, 09 Dec 2020 14:56:31 +0000
Received: by outflank-mailman (input) for mailman id 48377;
 Wed, 09 Dec 2020 14:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDNN=FN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kn0tK-0002k8-BB
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:56:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30da2f88-ee82-421f-8f21-80c8a4dc4632;
 Wed, 09 Dec 2020 14:56:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DC0E8AC9A;
 Wed,  9 Dec 2020 14:56:28 +0000 (UTC)
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
X-Inumbo-ID: 30da2f88-ee82-421f-8f21-80c8a4dc4632
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607525789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZ9X8tPyiBYCjlpfW2dYi3z3C5S4jPnmYJ28bKkFqHA=;
	b=LIo2qftjZUUwlM5R0bbGTiGu92mxPxVqD5EhWikq+ZvbnD+kZQncvrBnGRK2qwnbQ3Akq5
	9AlquJrlOSsOajteWnMvRxPdS1E9LCA8MXwbt+oPIZPbxvB9YtUshyviE04yLrarVBtFwP
	4T1Hiursnv0KGB5mdSIs9H74t4AoXWQ=
Subject: Re: [PATCH v3 0/8] xen: beginnings of moving library-like code into
 an archive
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <509B2BDB-A226-4328-A75E-33AAF74BE45B@arm.com>
 <41587b00-2899-65a6-3867-97664529fdab@suse.com>
 <6d56c227-2828-22fc-61a9-ae836ada805a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d2fe1ea-a3b1-1d24-9e8e-3fba16a5f294@suse.com>
Date: Wed, 9 Dec 2020 15:56:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <6d56c227-2828-22fc-61a9-ae836ada805a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 15:51, Julien Grall wrote:
> On 09/12/2020 14:47, Jan Beulich wrote:
>> On 09.12.2020 12:33, Bertrand Marquis wrote:
>>> I will review this today, sorry for the delay.
>>
>> Thanks for the reviews, and no problem at all. Since iirc it was
>> you who asked on the last community call, I wanted to point out
>> that despite your reviews and despite Wei's acks the series
>> still won't be able to go in, because patches 2 and 3 are still
>> lacking Arm maintainer acks.
> 
> I am waiting on Anthony's input before giving my ack on patch 2.

Well, okay. I'll continue to wait then. What about patch 3 though?

Jan

