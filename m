Return-Path: <SRS0=k7LG=6U=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76037C28CBC
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 05:12:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E75F206E6
	for <xen-devel@archiver.kernel.org>; Wed,  6 May 2020 05:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E75F206E6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWCM9-00026O-TE; Wed, 06 May 2020 05:12:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3H5S=6U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jWCM8-00026G-B6
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 05:12:28 +0000
X-Inumbo-ID: 2d595d52-8f58-11ea-9e1c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2d595d52-8f58-11ea-9e1c-12813bfff9fa;
 Wed, 06 May 2020 05:12:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E896DACD5;
 Wed,  6 May 2020 05:12:28 +0000 (UTC)
Subject: Re: [PATCH] xenbus: avoid stack overflow warning
To: Arnd Bergmann <arnd@arndb.de>
References: <20200505141546.824573-1-arnd@arndb.de>
 <30d49e6d-570b-f6fd-3a6f-628abcc8b127@suse.com>
 <CAK8P3a0mWH=Zcq180+cTRMpqOkGt05xDP1+kCTP6yc9grAg2VQ@mail.gmail.com>
 <48893239-dde9-4e94-040d-859f4348816d@suse.com>
 <CAK8P3a2_7+_a_cwDK1cwfrJX4azQJhd_Y0xB18cCUn6=p7fVsg@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2c6e4b36-6618-1889-55c4-16eeb1ef6f57@suse.com>
Date: Wed, 6 May 2020 07:12:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2_7+_a_cwDK1cwfrJX4azQJhd_Y0xB18cCUn6=p7fVsg@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Yan Yankovskyi <yyankovskyi@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.05.20 22:57, Arnd Bergmann wrote:
> On Tue, May 5, 2020 at 6:02 PM Jürgen Groß <jgross@suse.com> wrote:
>> On 05.05.20 17:01, Arnd Bergmann wrote:
>>> On Tue, May 5, 2020 at 4:34 PM Jürgen Groß <jgross@suse.com> wrote:
>>>> On 05.05.20 16:15, Arnd Bergmann wrote:
>>>
>>> I considered that as well, and don't really mind either way. I think it does
>>> get a bit ugly whatever we do. If you prefer the union, I can respin the
>>> patch that way.
>>
>> Hmm, thinking more about it I think the real clean solution would be to
>> extend struct map_ring_valloc_hvm to cover the pv case, too, to add the
>> map and unmap arrays (possibly as a union) to it and to allocate it
>> dynamically instead of having it on the stack.
>>
>> Would you be fine doing this?
> 
> This is a little more complex than I'd want to do without doing any testing
> (and no, I don't want to do the testing either) ;-)
> 
> It does sound like a better approach though.

I take this as you are fine with me writing the patch and adding you as
"Reported-by:"?


Juergen

