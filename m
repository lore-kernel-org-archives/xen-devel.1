Return-Path: <SRS0=dPyG=IK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89435C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 13:08:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EBAD64FA7
	for <xen-devel@archiver.kernel.org>; Fri, 12 Mar 2021 13:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EBAD64FA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.97094.184234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhWy-0008Uw-QM; Fri, 12 Mar 2021 13:08:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97094.184234; Fri, 12 Mar 2021 13:08:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKhWy-0008Up-NT; Fri, 12 Mar 2021 13:08:40 +0000
Received: by outflank-mailman (input) for mailman id 97094;
 Fri, 12 Mar 2021 13:08:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKhWx-0008UR-MD
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 13:08:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 094ff024-4a92-4b7c-a87f-1b7901358e96;
 Fri, 12 Mar 2021 13:08:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 36451B0D2;
 Fri, 12 Mar 2021 13:08:37 +0000 (UTC)
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
X-Inumbo-ID: 094ff024-4a92-4b7c-a87f-1b7901358e96
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615554517; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qNkz0+Qb+1pUFJPyd9GrRxqT8lH+5z8lWkV51uiM+KU=;
	b=BCR+fGZjcX+Ni9v3mEXm9beOrtnIYyT0zu8B0SQavaJsrcq8LOACG+Otrq76RMf4hwx4gj
	El81fspNkjkXMh+XTgrZ0sZe8ph7yuU8PBI7VSodibYKIbmxeeRECHMauGaflU87tRr5eP
	YvsHBsFtc/D27ZYalPbfiR4hUukbkss=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81539e7d-6b3c-8261-6959-67ef1dc136bf@suse.com>
Date: Fri, 12 Mar 2021 14:08:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <1642726c-0134-fb90-164a-e49672f613ff@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.03.2021 12:32, Andrew Cooper wrote:
> On 10/03/2021 10:13, Jan Beulich wrote:
>> Sadly I was wrong to suggest dropping vaddrs' initializer during review
>> of v2 of the patch introducing this code. gcc 4.3 can't cope.
>>
>> Fixes: 52531c734ea1 ("xen/gnttab: Rework resource acquisition")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>>      struct grant_table *gt = d->grant_table;
>>      unsigned int i, final_frame;
>>      mfn_t tmp;
>> -    void **vaddrs;
>> +    void **vaddrs = NULL;
>>      int rc = -EINVAL;
>>  
>>      if ( !nr_frames )
> 
> in v1, there was a companion check.
> 
> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
> index f937c1d350..2bb07f129f 100644
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -4059,6 +4059,16 @@ int gnttab_acquire_resource(
>      if ( rc )
>          goto out;
>  
> +    /*
> +     * Some older toolchains can't spot that vaddrs is non-NULL on
> non-error
> +     * paths.  Leave some runtime safety.
> +     */
> +    if ( !vaddrs )
> +    {
> +        ASSERT_UNREACHABLE();
> +        goto out;
> +    }
> +
>      for ( i = 0; i < nr_frames; ++i )
>          mfn_list[i] = virt_to_mfn(vaddrs[frame + i]);

Oh, I didn't realize this. Will add, but did you really mean to
have the function return success in this case (on a release
build)? I'd be inclined to put it ahead of if "if ( rc )" and
set rc (to e.g. -ENODATA) in this case.

> With this reinstated, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

