Return-Path: <SRS0=DZRD=AO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16F2C433DF
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2020 12:51:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 878E220B80
	for <xen-devel@archiver.kernel.org>; Fri,  3 Jul 2020 12:51:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 878E220B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrL9i-0008SD-0l; Fri, 03 Jul 2020 12:51:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jrL9h-0008S8-11
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 12:51:01 +0000
X-Inumbo-ID: d4e7e0d8-bd2b-11ea-89a0-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d4e7e0d8-bd2b-11ea-89a0-12813bfff9fa;
 Fri, 03 Jul 2020 12:50:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E7D37ACA0;
 Fri,  3 Jul 2020 12:50:53 +0000 (UTC)
Subject: Re: [PATCH v4 06/10] memory: batch processing in acquire_resource()
To: Julien Grall <julien@xen.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
 <5be6cb58-82d0-0a78-a9b2-5c078b5d3587@xen.org>
 <004901d65128$16a6f330$43f4d990$@xen.org>
 <481e8ee7-561a-10d6-4358-7b07a8911ce8@xen.org>
 <d45edef1-5b15-fdd4-b030-1ffe5c77057d@suse.com>
 <cec1bfc7-694c-ae40-3fcd-ed0829295893@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fbc0a79-052e-0596-ca31-ec4902dddc85@suse.com>
Date: Fri, 3 Jul 2020 14:50:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cec1bfc7-694c-ae40-3fcd-ed0829295893@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 'Wei Liu' <wl@xen.org>, paul@xen.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, luwei.kang@intel.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03.07.2020 13:36, Julien Grall wrote:
> On 03/07/2020 12:22, Jan Beulich wrote:
>> On 03.07.2020 13:17, Julien Grall wrote:
>>> In the current implementation, we tell the guest how many frames it can
>>> request in a batch. This number may be much smaller that the maximum
>>> number of frames of the type.
>>>
>>> Furthermore this value is not tie to the xmar.type. Therefore, it is
>>> valid for a guest to call this hypercall only once at boot to figure out
>>> the maximum batch.
>>>
>>> So while the change you suggest looks a good idea, I don't think it is
>>> possible to do that with the current hypercall.
>>
>> Doesn't the limit simply change to UINT_MAX >> MEMOP_EXTENT_SHIFT,
>> which then is what should be reported?
> 
> Hmmm... Can you remind me whether we support migration to an older release?

I'm pretty sure we say "N -> N+1 only" somewhere, but this "somewhere"
clearly isn't SUPPORT.md.

Jan

