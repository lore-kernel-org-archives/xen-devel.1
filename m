Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E748C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:46:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17707208C7
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="V/4zcjY8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17707208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20911.46956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb3w0-0002sk-2Z; Fri, 06 Nov 2020 15:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20911.46956; Fri, 06 Nov 2020 15:45:52 +0000
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
	id 1kb3vz-0002sd-Uz; Fri, 06 Nov 2020 15:45:51 +0000
Received: by outflank-mailman (input) for mailman id 20911;
 Fri, 06 Nov 2020 15:45:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kb3vy-0002sY-SB
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:45:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a50d871-6b4a-416e-ad4c-002c80b8151e;
 Fri, 06 Nov 2020 15:45:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DBE58ABA2;
 Fri,  6 Nov 2020 15:45:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DqEO=EM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kb3vy-0002sY-SB
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:45:50 +0000
X-Inumbo-ID: 1a50d871-6b4a-416e-ad4c-002c80b8151e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1a50d871-6b4a-416e-ad4c-002c80b8151e;
	Fri, 06 Nov 2020 15:45:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604677549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baG0fcY2nKj2+z89jaqCJLZcP325tXsOE+uQ+OrJOEk=;
	b=V/4zcjY8hNf/woetkroqvx+gxwqRp1BiGXEgXWLQBrWturzvz+hF61MHn2Mf3VO36Mh5mO
	yrmHo0nLFupAzOYZHevZLKEPxx9s3+2PhoM7txSiiuGyPkPUU2ha0qjz67/sbuaSJ7h7wG
	rBxFteneT//ldEiM6moLtmVroYZJl4M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DBE58ABA2;
	Fri,  6 Nov 2020 15:45:48 +0000 (UTC)
Subject: Re: [PATCH] tools/libs/light: correct bitmap operations
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20201106140504.25488-1-jgross@suse.com>
 <61860ac6-133a-0393-e63c-8de9ea13e5f9@suse.com>
 <22a4dc50-4feb-a934-a58b-7ebcdcf9e3ab@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <908ab536-d5f3-2822-086d-a13c730e6c74@suse.com>
Date: Fri, 6 Nov 2020 16:45:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <22a4dc50-4feb-a934-a58b-7ebcdcf9e3ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.11.2020 15:36, Jürgen Groß wrote:
> On 06.11.20 15:35, Jan Beulich wrote:
>> On 06.11.2020 15:05, Juergen Gross wrote:
>>> Libxl bitmap operations for single bits (test, set, reset) take the bit
>>> number as a signed integer without testing the value to be larger than
>>> 0.
>>>
>>> Correct that by adding the appropriate tests.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Wouldn't it be better to convert the parameter types to unsigned int?
> 
> Those are official library interfaces. Can we just change them?

Oh, I didn't expect such helpers to be available to users of the
library.

Jan

