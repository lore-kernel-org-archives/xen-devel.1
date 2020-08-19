Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA079C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 07:34:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6124206B5
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 07:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6124206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8IbX-0000nL-65; Wed, 19 Aug 2020 07:33:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b5Wx=B5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k8IbV-0000nG-SK
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 07:33:49 +0000
X-Inumbo-ID: f02f0121-ac8d-483c-9b32-9f57642722af
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f02f0121-ac8d-483c-9b32-9f57642722af;
 Wed, 19 Aug 2020 07:33:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82315AD5C;
 Wed, 19 Aug 2020 07:34:14 +0000 (UTC)
Subject: Re: [PATCH v2 2/7] x86: don't build with EFI support in
 shim-exclusive mode
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <3a8356a9-313c-6de8-f409-977eae1fbfa5@suse.com>
 <1a501ca8-8cf0-6fd0-547e-30b709fec6fc@suse.com>
 <20200818130028.GL828@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09fc953e-0b20-07f4-7af3-6221675e1d4d@suse.com>
Date: Wed, 19 Aug 2020 09:33:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200818130028.GL828@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 18.08.2020 15:00, Roger Pau Monné wrote:
> On Fri, Aug 07, 2020 at 01:32:38PM +0200, Jan Beulich wrote:
>> There's no need for xen.efi at all, and there's also no need for EFI
>> support in xen.gz since the shim runs in PVH mode, i.e. without any
>> firmware (and hence by implication also without EFI one).
>>
>> The slightly odd looking use of $(space) is to ensure the new ifneq()
>> evaluates consistently between "build" and "install" invocations of
>> make.
> 
> I would likely add a comment to the code itself, as it's not obvious
> without a hint IMO.

I did indeed consider this, as I agree in principle. The problem is
where to put such a comment - ahead of the entire macro is not a
good place imo, and I can't see any other good place either. As a
result I thought that the use being odd looking will either make
readers think of why it's there by itself, or direct them towards
the commit introducing it.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> I wonder however if there would be a less tricky way to arrange all
> this. Maybe the Kconfig work will remove some of this hacks?

Not sure.

Jan

