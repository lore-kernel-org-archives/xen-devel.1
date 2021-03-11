Return-Path: <SRS0=6W/h=IJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64BDC433E0
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 16:00:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700FB64F37
	for <xen-devel@archiver.kernel.org>; Thu, 11 Mar 2021 16:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700FB64F37
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.96672.183151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNjV-0000HV-OR; Thu, 11 Mar 2021 16:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96672.183151; Thu, 11 Mar 2021 16:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKNjV-0000HO-L3; Thu, 11 Mar 2021 16:00:17 +0000
Received: by outflank-mailman (input) for mailman id 96672;
 Thu, 11 Mar 2021 16:00:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QJ7d=IJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKNjU-0000HJ-FD
 for xen-devel@lists.xenproject.org; Thu, 11 Mar 2021 16:00:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a87cd76-f322-43a4-95e0-f0284fcf9f04;
 Thu, 11 Mar 2021 16:00:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF743AE42;
 Thu, 11 Mar 2021 16:00:12 +0000 (UTC)
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
X-Inumbo-ID: 4a87cd76-f322-43a4-95e0-f0284fcf9f04
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615478413; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2AMgF2g8QQqIRmOc1OaUPevEQnhToTdQO7MfNVOmchE=;
	b=DK12Gw8wCYpXO3iegHzJ1EquXqu6rMCZZODSfSOBuE+RNo6l0s2Rt/zjNcFoYTQLw/VoiE
	HOk1IBC5gM215ecrV+NEzN+KKMYQTx2G7PgUc2bQQPlK6b+gMN6+ZKPP8G9K3Vrz4hDnsA
	3uHkN4Zn74dO8xKi3QsRefxUyFOoou4=
Subject: Re: [PATCH v2 1/2][4.15] tools/x86: don't rebuild cpuid-autogen.h
 every time
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>
References: <1365013b-1e90-aeb2-3c80-7a5c6284c46a@suse.com>
 <1b8aee19-9194-153c-8dbb-0aec3412e255@suse.com>
 <YEo3VzlTRTaBUkqw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bb055af8-f69b-f87a-fc35-4d8b8d3ce1a9@suse.com>
Date: Thu, 11 Mar 2021 17:00:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YEo3VzlTRTaBUkqw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.03.2021 16:29, Roger Pau Monné wrote:
> On Thu, Mar 11, 2021 at 03:40:05PM +0100, Jan Beulich wrote:
>> The first thing the "xen-dir" rule does is delete the entire xen/
>> subtree. Obviously this includes deleting xen/lib/x86/*autogen.h. As a
>> result there's no original version for $(move-if-changed ...) to compare
>> against, and hence the file and all its consumers would get rebuilt
>> every time. Instead only find and delete all the symlinks.
>>
>> Fixes: eddf9559c977 ("libx86: generate cpuid-autogen.h in the libx86 include dir")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Different approach.
>> ---
>> Ian did suggest to pass -0r to xargs (and -print0 to find), but I
>> couldn't convince myself that these are standard compliant options. We
>> don't use any special characters in file names, so -print0 / -0
>> shouldn't be necessary at all. The stray rm invocation when there is no
>> output from find can be taken care of by passing -f to it.
> 
> Why not use `-exec rm -f {} +` instead? That seems to be part of
> POSIX and is likely nicer than piping to xargs?

Hmm, I avoided it because I was under the impression that there
are (compatibility) issues with it, and Ian suggesting xargs
seemed to support that. I'd be more than happy to avoid xargs,
of which I've never been a friend.

>> --- a/tools/include/Makefile
>> +++ b/tools/include/Makefile
>> @@ -19,7 +19,7 @@ xen-foreign:
>>  	$(MAKE) -C xen-foreign
>>  
>>  xen-dir:
>> -	@rm -rf xen acpi
>> +	find xen/ acpi/ -type l 2>/dev/null | xargs rm -f --
> 
> Do we care about leaving an empty xen/libelf directory behind?

Why would we? It'll get created immediately afterwards if it's
not there, and it'll initially be empty (not for long of course).

Jan

