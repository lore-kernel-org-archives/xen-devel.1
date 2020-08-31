Return-Path: <SRS0=BfPI=CJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71547C433E2
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2020 05:51:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4022120719
	for <xen-devel@archiver.kernel.org>; Mon, 31 Aug 2020 05:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4022120719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kCciN-0003kf-6b; Mon, 31 Aug 2020 05:50:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mgtu=CJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kCciL-0003kZ-V6
 for xen-devel@lists.xenproject.org; Mon, 31 Aug 2020 05:50:45 +0000
X-Inumbo-ID: c78c5600-93e8-47eb-883f-ddb3dfbad5a4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c78c5600-93e8-47eb-883f-ddb3dfbad5a4;
 Mon, 31 Aug 2020 05:50:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A8C4AF17;
 Mon, 31 Aug 2020 05:51:18 +0000 (UTC)
Subject: Re: [PATCH v4 28/31] tools/libxl: move libxenlight to tools/libs/light
To: Wei Liu <wl@xen.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Shriram Rajagopalan <rshriram@cs.ubc.ca>, Yang Hongyang
 <imhy.yang@gmail.com>, Christian Lindig <christian.lindig@citrix.com>,
 David Scott <dave@recoil.org>
References: <20200828150747.25305-1-jgross@suse.com>
 <20200828150747.25305-29-jgross@suse.com>
 <20200828160532.q7f5opcits57xwjy@liuwe-devbox-debian-v2>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5d65901d-5729-fe17-3fb2-2a41867d726b@suse.com>
Date: Mon, 31 Aug 2020 07:50:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828160532.q7f5opcits57xwjy@liuwe-devbox-debian-v2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 28.08.20 18:05, Wei Liu wrote:
> On Fri, Aug 28, 2020 at 05:07:44PM +0200, Juergen Gross wrote:
>> Carve out all libxenlight related sources and move them to
>> tools/libs/light in order to use the generic library build environment.
>>
>> The closely related sources for libxl-save-helper and the libxl test
>> environment are being moved, too.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Acked-by: Wei Liu <wl@xen.org>
> 
> It occurs to me you may need to modify golang/xenlight/Makefile.
> 
> There is
> 
>      LIBXL_SRC_DIR = ../../libxl
> 
> in it.
> 
> I didn't hit any error perhaps due to I didn't have golang installed.

Me neither.

Thanks for noticing that.


Juergen

