Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E47C4361B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 10:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E1A523F36
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 10:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E1A523F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50285.88879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfDq-00045B-DX; Fri, 11 Dec 2020 10:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50285.88879; Fri, 11 Dec 2020 10:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knfDq-000454-AT; Fri, 11 Dec 2020 10:00:22 +0000
Received: by outflank-mailman (input) for mailman id 50285;
 Fri, 11 Dec 2020 10:00:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9HZb=FP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1knfDp-00044z-BX
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 10:00:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16ee8f74-13de-448a-ae1b-8a0c953f4ab0;
 Fri, 11 Dec 2020 10:00:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9BD5EACF1;
 Fri, 11 Dec 2020 10:00:19 +0000 (UTC)
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
X-Inumbo-ID: 16ee8f74-13de-448a-ae1b-8a0c953f4ab0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607680819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JKr0IU1OHPnTj92qY4obtwJ5XOYnO0ZBGpisAWTb8pU=;
	b=GQS6a5T2PJwKxC88/EptTmt84koBd3kSBG9w2c9LN6wld1KHhjEEgNzM0oSR140o2jBC0B
	FkKrXsHPGvDT6vPyVZVSWsF7WD7M3mZx2+b3ZNYC+0wKSEvPfV4YUiaCGjSGVtOXXDPVvD
	hxkCZTVR8lWMOQt05wYRPf8kbQSxKC0=
Subject: Re: [PATCH v3 2/8] lib: collect library files in an archive
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <1a6bac6a-7d83-f5b6-c5b9-8b3b39824d40@suse.com>
 <21714b83-8619-5aa9-be5b-3015d05a26a4@suse.com>
 <X9I1GCAM2nn8W8eN@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65b94fd1-c840-cb1b-51f7-c9a5b158cc1e@suse.com>
Date: Fri, 11 Dec 2020 11:00:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <X9I1GCAM2nn8W8eN@perard.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.12.2020 15:47, Anthony PERARD wrote:
> On Mon, Nov 23, 2020 at 04:21:19PM +0100, Jan Beulich wrote:
>> --- a/xen/Rules.mk
>> +++ b/xen/Rules.mk
>> @@ -60,7 +64,14 @@ include Makefile
>>  # ---------------------------------------------------------------------------
>>  
>>  quiet_cmd_ld = LD      $@
>> -cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(real-prereqs)
>> +cmd_ld = $(LD) $(XEN_LDFLAGS) -r -o $@ $(filter-out %.a,$(real-prereqs)) \
>> +               --start-group $(filter %.a,$(real-prereqs)) --end-group
> 
> It might be a bit weird to modify the generic LD command for the benefit
> of only prelink.o objects but it's probably fine as long as we only use
> archives for lib.a. libelf and libfdt will just have --start/end-group
> added to there ld command line. So I guess the change is fine.

I'm afraid I don't understand what the concern is. Neither libelf
nor libfdt use any %.a right now. Or are you referring to them
merely because it's just them which have got converted to using
$(call if-changed ...), and your remark would eventually apply to
e.g. built_in.o as well? And then further is all you're worried
about the fact that there may be "--start-group  --end-group" on
the command line, i.e. with nothing inbetween? If so, besides
possibly looking a little odd if someone inspected the command
lines closely, what possible issue do you see? (If there is one,
making the addition of both options conditional upon there being
any/multiple %.a in the first place wouldn't be a big problem,
albeit Linux also doesn't care whether ${KBUILD_VMLINUX_LIBS} is
empty.)

> The rest looks good,
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks, but I'd prefer the above clarified.

Jan

