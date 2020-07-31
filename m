Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0E4C433E3
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:22:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14B7D2087C
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 12:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14B7D2087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1U2v-0005p3-JC; Fri, 31 Jul 2020 12:21:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S17i=BK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k1U2u-0005ox-Gi
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 12:21:56 +0000
X-Inumbo-ID: 6bfbcdf6-d328-11ea-abaa-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bfbcdf6-d328-11ea-abaa-12813bfff9fa;
 Fri, 31 Jul 2020 12:21:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F0729B188;
 Fri, 31 Jul 2020 12:22:07 +0000 (UTC)
Subject: Re: [PATCH v1] tools/xen-cpuid: show enqcmd
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200730163406.31020-1-olaf@aepfle.de>
 <65317ac2-0dd0-b453-caec-e5529b423d95@suse.com>
 <6e467a8f-d727-8511-da56-69901b6ada85@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <92d27664-267a-4095-484d-90a07367c5c9@suse.com>
Date: Fri, 31 Jul 2020 14:21:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e467a8f-d727-8511-da56-69901b6ada85@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Olaf Hering <olaf@aepfle.de>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.07.2020 14:04, Andrew Cooper wrote:
> On 31/07/2020 13:03, Jan Beulich wrote:
>> On 30.07.2020 18:34, Olaf Hering wrote:
>>> Translate <29> into a feature string.
>>>
>>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>
>> Albeit I'm pretty sure there are more missing than just this lone one.
> 
> And in particular, probably missing from libxl_cpuid.c, which I was
> meaning to check when I've got a free moment.

As it's not just this one, but e.g. also the two movdir* ones,
I thought I'd not require the other side to also be changed,
the more that enqcmd also doesn't get exposed to guests at all
right now.

Jan

