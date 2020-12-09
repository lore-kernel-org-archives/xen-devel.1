Return-Path: <SRS0=Zv5g=FN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B2CC4361B
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 14:43:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE84B2332A
	for <xen-devel@archiver.kernel.org>; Wed,  9 Dec 2020 14:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE84B2332A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.48337.85454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0g6-000103-50; Wed, 09 Dec 2020 14:42:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48337.85454; Wed, 09 Dec 2020 14:42:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn0g6-0000zw-1t; Wed, 09 Dec 2020 14:42:50 +0000
Received: by outflank-mailman (input) for mailman id 48337;
 Wed, 09 Dec 2020 14:42:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uDNN=FN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kn0g4-0000zq-C5
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:42:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99beeb13-f007-472b-93f3-fa9d58141815;
 Wed, 09 Dec 2020 14:42:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8B056AD2B;
 Wed,  9 Dec 2020 14:42:46 +0000 (UTC)
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
X-Inumbo-ID: 99beeb13-f007-472b-93f3-fa9d58141815
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607524966; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VCqA7fbJ0LAudNU8V/slBuJvIHhpFqzfocQYAr+T5E4=;
	b=Fw4uq9bR9WITgtkGIEDNQ5Glt/ma4ic89NLNXCslwnbpd3hR1TtoMWVg4RVzc5U8x1MmBy
	eEbyxpwi9Z/OLHqZSXZz+WZjE1RK0wv+3nk9uAp27Rqb4yo48kJHPWlRFbLhbJFFqGL1Zl
	8Hbw1lzoJuFznGNN3EdQsF4woHqcoWE=
Subject: Re: [PATCH v3 2/8] lib: collect library files in an archive
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
 <E7B41B4F-98F9-4C52-8549-F407D6FB8251@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <742e504a-02f7-2132-c631-6a31c03959e4@suse.com>
Date: Wed, 9 Dec 2020 15:42:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <E7B41B4F-98F9-4C52-8549-F407D6FB8251@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.12.2020 12:37, Bertrand Marquis wrote:
>> On 23 Nov 2020, at 15:21, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
>> just to avoid bloating binaries when only some arch-es and/or
>> configurations need generic library routines, combine objects under lib/
>> into an archive, which the linker then can pick the necessary objects
>> out of.
>>
>> Note that we can't use thin archives just yet, until we've raised the
>> minimum required binutils version suitably.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks.

>> @@ -60,7 +64,14 @@ include Makefile
>> # ---------------------------------------------------------------------------
>>
>> quiet_cmd_ld = LD      $@
>> -cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
>> +cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
>> +               --start-group $(filter %.a,$(real-prereqs)) --end-group
> 
> This might be a good idea to add a comment to explain why the start/end-group
> is needed so that someone does not change this back in the future.

Since we're trying to inherit Linux'es build system, I did look
there and iirc there was no comment, so I didn't see a basis for
us to have one.

> Something like: put libraries between start/end group to have unused symbols removed.

Now that's not the reason - why you describe is the default
behavior for archives, and there is something like a "whole
archive" option iirc to change to a mode where all objects
get pulled out. Instead this is a symbol resolution thing
aiui - by default earlier archives can't resolve undefined
symbols first referenced by objects pulled out of later
archives.

Jan

