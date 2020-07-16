Return-Path: <SRS0=APZ7=A3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF28AC433E7
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 11:49:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FA220657
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 11:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FA220657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw2Ng-00054s-Ae; Thu, 16 Jul 2020 11:48:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dhnJ=A3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jw2Ne-00054n-UQ
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 11:48:50 +0000
X-Inumbo-ID: 506b140e-c75a-11ea-b7bb-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 506b140e-c75a-11ea-b7bb-bc764e2007e4;
 Thu, 16 Jul 2020 11:48:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47592B931;
 Thu, 16 Jul 2020 11:48:53 +0000 (UTC)
Subject: Re: [PATCH 1/2] common: map_vcpu_info() cosmetics
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <fef45e49-bcb4-dc11-8f7f-b2f5e4bf1a73@suse.com>
 <2a0341c7-3836-a8c0-9516-b6a08e2720ec@suse.com>
 <20200716114128.GO7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <03a4d446-c26b-f171-57fd-a1eb13dad6c0@suse.com>
Date: Thu, 16 Jul 2020 13:48:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200716114128.GO7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16.07.2020 13:41, Roger Pau Monné wrote:
> On Wed, Jul 15, 2020 at 12:15:10PM +0200, Jan Beulich wrote:
>> Use ENXIO instead of EINVAL to cover the two cases of the address not
>> satisfying the requirements. This will make an issue here better stand
>> out at the call site.
> 
> Not sure whether I would use EFAULT instead of ENXIO, as the
> description of it is 'bad address' which seems more inline with the
> error that we are trying to report.

The address isn't bad in the sense of causing a fault, it's just
that we elect to not allow it. Hence I don't think EFAULT is
suitable. I'm open to replacement suggestions for ENXIO, though.

>> Also add a missing compat-mode related size check: If the sizes
>> differed, other code in the function would need changing. Accompany this
>> by a change to the initial sizeof() expression, tying it to the type of
>> the variable we're actually after (matching e.g. the alignof() added by
>> XSA-327).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Jan

