Return-Path: <SRS0=y3rP=FH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31324C64E7B
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 08:12:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA22C21741
	for <xen-devel@archiver.kernel.org>; Thu,  3 Dec 2020 08:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA22C21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.43152.77620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkjjE-0002oI-Bw; Thu, 03 Dec 2020 08:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43152.77620; Thu, 03 Dec 2020 08:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkjjE-0002oB-86; Thu, 03 Dec 2020 08:12:40 +0000
Received: by outflank-mailman (input) for mailman id 43152;
 Thu, 03 Dec 2020 08:12:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vSHx=FH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkjjC-0002o6-Np
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 08:12:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b4bf2e8-5497-49b1-9b38-f7362e97abcb;
 Thu, 03 Dec 2020 08:12:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 33349AE95;
 Thu,  3 Dec 2020 08:12:36 +0000 (UTC)
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
X-Inumbo-ID: 4b4bf2e8-5497-49b1-9b38-f7362e97abcb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606983156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LNIkhb3LvLaWFc4Cvk7s0fVDJExphp0lqT/VK6hAPps=;
	b=RmoVxP27qESIVuXTZa2aJd/1ZbAe8cv77gcDoMEvl0w9ET68CpV3YRzv+oEgX7mS8Cax5l
	8rBcHXFB6duNTcWwloL9igUthmyiFJ4Il0Whl0EewWQp+Vn/gdeG2BDGYkNr0LSl4LdNgo
	Sq8D+XKxrR5bNLGp0JlMewapGs2rzxs=
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
 <e8a876c9-b1bf-62a4-d30c-a2c646cb68f7@suse.com>
 <e2909e87-473f-dbf5-9e58-7c817ac59e3f@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d878f80d-d71d-93cd-8ee1-06fb860bf390@suse.com>
Date: Thu, 3 Dec 2020 09:12:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <e2909e87-473f-dbf5-9e58-7c817ac59e3f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02.12.2020 16:51, Jürgen Groß wrote:
> On 02.12.20 16:42, Jan Beulich wrote:
>> On 01.12.2020 09:21, Juergen Gross wrote:
>>> Add a getsize() function pointer to struct hypfs_funcs for being able
>>> to have dynamically filled entries without the need to take the hypfs
>>> lock each time the contents are being generated.
>>>
>>> For directories add a findentry callback to the vector and modify
>>> hypfs_get_entry_rel() to use it.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with maybe one further small adjustment:
>>
>>> @@ -176,15 +188,41 @@ static int hypfs_get_path_user(char *buf,
>>>       return 0;
>>>   }
>>>   
>>> +struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_dir *dir,
>>> +                                         const char *name,
>>> +                                         unsigned int name_len)
>>> +{
>>> +    return ERR_PTR(-ENOENT);
>>> +}
>>
>> ENOENT seems odd to me here. There looks to be no counterpart to
>> EISDIR, so maybe ENODATA, EACCES, or EPERM?
> 
> Hmm, why?
> 
> In case I have /a/b and I'm looking for /a/b/c ENOENT seems to be just
> fine?
> 
> Or I could add ENOTDIR.

Oh, there actually is supposed to be such an entry, but public/errno.h
is simply missing it. Yes - ENOTDIR is what I was thinking of when
saying "there looks to be no counterpart to EISDIR".

Jan

