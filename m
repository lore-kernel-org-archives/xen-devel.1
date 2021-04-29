Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D204C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 11:40:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A57B561441
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 11:40:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A57B561441
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119911.226713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc51S-0008LC-I4; Thu, 29 Apr 2021 11:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119911.226713; Thu, 29 Apr 2021 11:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc51S-0008L5-Ez; Thu, 29 Apr 2021 11:39:58 +0000
Received: by outflank-mailman (input) for mailman id 119911;
 Thu, 29 Apr 2021 11:39:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc51R-0008Kz-I6
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 11:39:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc51Q-0003Fs-3X; Thu, 29 Apr 2021 11:39:56 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc51P-0001wU-Ro; Thu, 29 Apr 2021 11:39:55 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=YmLd22T4/0R5UNIjPLfJFoGiLZhaUFQk01l2lXTkOys=; b=pZA0PPaRa8V/A+NGwith9GgsbG
	cw8mKzTvVikdu3puISp33FtLPV4vPiiEsYFbX8HpMVEj8CDdWGVcwF5faYPhisCVw4hLCOJsXzmmt
	fqB0bfu62fq0P+dUNefT1HvAr6qDrQNfBX/OKQ3Pywol5HP/TcG/0AiJZ80BK8FejMoY=;
Subject: Re: [PATCH 2/5] tools/libfsimage: Fix PATH_MAX redefinition error
To: Costin Lupu <costin.lupu@cs.pub.ro>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <cover.1619524463.git.costin.lupu@cs.pub.ro>
 <e44209c8981a68604a34f3066d53989f84ce8f49.1619524463.git.costin.lupu@cs.pub.ro>
 <9ef85c5b-b757-bbaa-be23-4ceb1d45cddd@xen.org>
 <d29a7d0a-d83e-a437-d38f-d142a2f0d1a7@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <3a94e14d-9b4f-50b7-97bd-da6caedf250e@xen.org>
Date: Thu, 29 Apr 2021 12:39:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d29a7d0a-d83e-a437-d38f-d142a2f0d1a7@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Costin,

On 28/04/2021 19:35, Costin Lupu wrote:
> On 4/28/21 12:04 PM, Julien Grall wrote:
>>
>>
>> On 27/04/2021 13:05, Costin Lupu wrote:
>>> If PATH_MAX is already defined in the system (e.g. in
>>> /usr/include/limits.h
>>> header) then gcc will trigger a redefinition error because of -Werror.
>>>
>>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
>>> ---
>>>    tools/libfsimage/ext2fs/fsys_ext2fs.c     | 2 ++
>>>    tools/libfsimage/reiserfs/fsys_reiserfs.c | 2 ++
>>>    2 files changed, 4 insertions(+)
>>>
>>> diff --git a/tools/libfsimage/ext2fs/fsys_ext2fs.c
>>> b/tools/libfsimage/ext2fs/fsys_ext2fs.c
>>> index a4ed10419c..5ed8fce90e 100644
>>> --- a/tools/libfsimage/ext2fs/fsys_ext2fs.c
>>> +++ b/tools/libfsimage/ext2fs/fsys_ext2fs.c
>>> @@ -278,7 +278,9 @@ struct ext4_extent_header {
>>>      #define EXT2_SUPER_MAGIC      0xEF53    /* include/linux/ext2_fs.h */
>>>    #define EXT2_ROOT_INO              2    /* include/linux/ext2_fs.h */
>>> +#ifndef PATH_MAX
>>>    #define PATH_MAX                1024    /* include/linux/limits.h */
>>> +#endif
>>
>> Can we drop it completely and just rely on limits.h?
>>
> 
> One problem here is that the system limits.h header doesn't necessarily
> include linux/limits.h, which would mean we would have to include
> linux/limits.h. But this is problematic for other systems such as BSD.

That's annoying :).

> 
> I had a look on a FreeBSD source tree to see how this is done there. It
> seems that there are lots of submodules, apps and libs that redefine
> PATH_MAX in case it wasn't defined before so the changes introduced by
> the current patch seem to be very popular. Another clean approach I saw
> was for jemalloc [1] which includes unistd.h. They redefine PATH_MAX
> only for MS C compiler, but AFAIK we don't need that.

I am not aware of anyone using MS C compiler to build the tools.

> 
> So IMHO the current changes seem to be the most portable, but I'm open
> to any suggestions.

Right, this is the good thing of your approach. I can't see a better 
solution if the system limits.h doesn't always define PATH_MAX. So:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

