Return-Path: <SRS0=VfOS=5W=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03082C2BA19
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 11:03:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEFDF206F5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Apr 2020 11:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEFDF206F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLPXR-0001WX-B3; Mon, 06 Apr 2020 11:03:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=leFb=5W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jLPXQ-0001WR-Cy
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 11:03:32 +0000
X-Inumbo-ID: 405b27e2-77f6-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 405b27e2-77f6-11ea-83d8-bc764e2007e4;
 Mon, 06 Apr 2020 11:03:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A3078AD4B;
 Mon,  6 Apr 2020 11:03:30 +0000 (UTC)
Subject: Re: [PATCH v2] tools/libxl: make default of max event channels
 dependant on vcpus [and 1 more messages]
To: Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>
References: <20200406082704.13994-1-jgross@suse.com>
 <afc7e988-3b51-bbee-cba8-af30a7605dc4@xen.org>
 <d1b095db-064e-bccf-b55d-d85fecb3045a@suse.com>
 <24203.2251.628483.557280@mariner.uk.xensource.com>
 <fd09220a-7470-4679-ce16-f4553579171b@xen.org>
 <26161282-7bad-5888-16c9-634647e6fde8@xen.org>
 <8a6f6e41-9395-6c68-eae9-4c1aeb7d96e2@suse.com>
 <24203.2546.728186.463143@mariner.uk.xensource.com>
 <24203.2996.819908.965198@mariner.uk.xensource.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f0102e04-29be-1e4d-2264-11601013b725@suse.com>
Date: Mon, 6 Apr 2020 13:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <24203.2996.819908.965198@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06.04.20 13:00, Ian Jackson wrote:
> Julien Grall writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
>> There are no correlation between event channels and vCPUs. The number of
>> event channels only depends on the number of frontend you have in your
>> guest. So...
>>
>> Hi Ian,
>>
>> On 06/04/2020 11:47, Ian Jackson wrote:
>>> If ARM folks want to have a different formula for the default then
>>> that is of course fine but I wonder whether this might do ARMk more
>>> harm than good in this case.
>>
>> ... 1023 event channels is going to be plenty enough for most of the use
>> cases.
> 
> OK, thanks for the quick reply.
> 
> So, Jürgen, I think everyone will be happy with this:
> 
> Ian Jackson writes ("Re: [PATCH v2] tools/libxl: make default of max event channels dependant on vcpus"):
>> I guess you should make two patches 1. duplicate the existing formula
>> (no functional change) 2. change the x86 formula.
>>
>> I would ack the first and be guided by x86 folks for the 2nd.

Okay, thanks. Will do that.


Juergen

