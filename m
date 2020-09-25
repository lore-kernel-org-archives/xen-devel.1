Return-Path: <SRS0=eoLF=DC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB920C4363D
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 05:16:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FE57208B6
	for <xen-devel@archiver.kernel.org>; Fri, 25 Sep 2020 05:16:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="oWGJxcNm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FE57208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLg5b-0000DQ-1O; Fri, 25 Sep 2020 05:16:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ocWZ=DC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kLg5Z-0000DL-TB
 for xen-devel@lists.xenproject.org; Fri, 25 Sep 2020 05:16:09 +0000
X-Inumbo-ID: 7819cb5f-b878-4dfa-9226-3c5e24a3f0c3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7819cb5f-b878-4dfa-9226-3c5e24a3f0c3;
 Fri, 25 Sep 2020 05:16:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1601010965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M55FTbIxOs1KOGHCmIpr+jALCmsKDvaxk4KIQYSRyws=;
 b=oWGJxcNmYxZn2YzIdvyxms+LA42nMrPST96GlbSzEWUx4wzSlkyjB0F5WPN3zqqBEUbwFH
 2k+z1FJucNmGhC2Djt1z4BMb1FXF8w9IxfcZ99WFdRZAF8dgED8jZql+ftEBa4V3Vqy5ey
 dlcL0j7GvQkyapHn3Ye5JlBqCrt3aEs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACFBBAB5C;
 Fri, 25 Sep 2020 05:16:05 +0000 (UTC)
Subject: Re: [PATCH] tools/libs/guest: fix out of tree builds of libxenguest
 users
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20200923052401.24917-1-jgross@suse.com>
 <a99b7ed3-cd1c-a63d-cc9b-66749ac94ce4@citrix.com>
 <1a17f926-c08b-97db-e5a4-bdfcc36bca03@suse.com>
Message-ID: <0fb90e4c-ae49-d3a1-6055-84300d37638d@suse.com>
Date: Fri, 25 Sep 2020 07:16:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1a17f926-c08b-97db-e5a4-bdfcc36bca03@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.09.20 06:59, Jürgen Groß wrote:
> On 24.09.20 22:23, Andrew Cooper wrote:
>> On 23/09/2020 06:24, Juergen Gross wrote:
>>> xenguest.h includes xenctrl_dom.h, which is including the Xen internal
>>> xen/libelf/libelf.h. This results in build failures for components
>>> using libxenguest when being built outside the Xen build environment.
>>>
>>> Fix that by guarding the include of xenctrl_dom.h with
>>> "#ifdef __XEN_TOOLS_".
>>>
>>> Fixes: 7e0165c19387 ("tools/libxc: untangle libxenctrl from 
>>> libxenguest")
>>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/libs/guest/include/xenguest.h | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/tools/libs/guest/include/xenguest.h 
>>> b/tools/libs/guest/include/xenguest.h
>>> index 4643384790..5cd502f644 100644
>>> --- a/tools/libs/guest/include/xenguest.h
>>> +++ b/tools/libs/guest/include/xenguest.h
>>> @@ -22,7 +22,9 @@
>>>   #ifndef XENGUEST_H
>>>   #define XENGUEST_H
>>> +#ifdef __XEN_TOOLS__
>>>   #include <xenctrl_dom.h>
>>> +#endif
>>
>> I have to admit that this doesn't feel right to put into a public header.
>>
>> Can't we split xenctrl_dom in half and merge the relevant subsets into
>> xen{ctrl,guest}.h ?
> 
> Yes, but the xenctrl.h half will be empty :-) (see my patch from Sep
> 9th).
> 
> The #ifdef will remain, though.
> 
> Another solution would be to make xenctrl_dom.h an internal header
> again which has to be included by every user needing the domain loader
> stuff. Question then is why all of this is part of libxenguest.
> 
> Or we could remove the prototype of xc_dom_register_loader() and the
> definition of struct xc_dom_loader from the header and make it private
> to libxenguest, and modify struct xc_dom_image to hold an opaque pointer
> to struct elf_dom_parms instead of having it as a sub-structure. This
> would remove the need to include xen/libelf/libelf.h from xenctrl_dom.h.
> The question would then be how usable the whole stuff is for someone not
> having the layout of struct elf_dom_parms.

I just discovered that currently only 5 elements of struct elf_dom_parms
are being used by libxenguest users in Xen. We could add accessors for
those to libxenguest.

This would be my favorite solution (including the merge of xenctrl_dom.h
into xenguest.h).

> 
> And finally we could split libxenguest and have a libxendomload which
> will be usable Xen internal only.
> 
> Any preference?


Juergen

