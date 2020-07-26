Return-Path: <SRS0=MTdN=BF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74652C433E1
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 08:28:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A85206F6
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2020 08:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A85206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzc0f-0000GV-6Y; Sun, 26 Jul 2020 08:27:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jzc0e-0000GP-F4
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2020 08:27:52 +0000
X-Inumbo-ID: e519352e-cf19-11ea-a650-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e519352e-cf19-11ea-a650-12813bfff9fa;
 Sun, 26 Jul 2020 08:27:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 682FAAEBF;
 Sun, 26 Jul 2020 08:28:00 +0000 (UTC)
Subject: Re: [PATCH 3/6] iommu: remove iommu_lookup_page() and the
 lookup_page() method...
To: paul@xen.org
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-4-paul@xen.org>
 <c47710e1-fcb6-3b5d-ff6a-d237a4149b3b@citrix.com>
 <000101d661eb$c68a75a0$539f60e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <35260401-fd2b-2eba-6e9b-a274cb8c057b@suse.com>
Date: Sun, 26 Jul 2020 10:27:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <000101d661eb$c68a75a0$539f60e0$@xen.org>
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>, 'Kevin Tian' <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.2020 20:53, Paul Durrant wrote:
>> From: Andrew Cooper <andrew.cooper3@citrix.com>
>> Sent: 24 July 2020 19:39
>>
>> On 24/07/2020 17:46, Paul Durrant wrote:
>>> From: Paul Durrant <pdurrant@amazon.com>
>>>
>>> ... from iommu_ops.
>>>
>>> This patch is essentially a reversion of dd93d54f "vtd: add lookup_page method
>>> to iommu_ops". The code was intended to be used by a patch that has long-
>>> since been abandoned. Therefore it is dead code and can be removed.
>>
>> And by this, you mean the work that you only partial unstreamed, with
>> the remainder of the feature still very much in use by XenServer?
>>
> 
> I thought we basically decided to bin the original PV IOMMU idea though? 

Did we? It's the first time I hear of it, I think.

Jan

