Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF297C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 07:49:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2E8207D3
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 07:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D2E8207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbJTc-0003Ih-BH; Wed, 20 May 2020 07:49:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbJTb-0003Ib-1h
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 07:49:19 +0000
X-Inumbo-ID: 685782fa-9a6e-11ea-a9cb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 685782fa-9a6e-11ea-a9cb-12813bfff9fa;
 Wed, 20 May 2020 07:49:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 597FFAC69;
 Wed, 20 May 2020 07:49:19 +0000 (UTC)
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <2783ddc5-9919-3c97-ba52-2f734e7d72d5@suse.com>
 <62d4999b-7db3-bac6-28ed-bb636347df38@citrix.com>
 <3088e420-a72a-1b2d-144f-115610488418@suse.com>
 <1750cbe5-ef48-6dc7-e372-cbc0a8cbc9cc@citrix.com>
 <4a5c33c0-9245-126b-123e-3980a9135190@suse.com>
 <1808df24-ecde-97c6-c296-ecf385260395@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90bf918e-3b87-b1be-344f-80a1bd6803a8@suse.com>
Date: Wed, 20 May 2020 09:48:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1808df24-ecde-97c6-c296-ecf385260395@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Tim Deegan <tim@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19.05.2020 20:00, Andrew Cooper wrote:
> On 19/05/2020 17:09, Jan Beulich wrote:
>> In any event there would be 12 bits to reclaim from the up
>> pointer - it being a physical address, there'll not be more
>> than 52 significant bits.
> 
> Right, but for L1TF safety, the address bits in the PTE must not be
> cacheable.

So if I understand this right, your response was only indirectly
related to what I said: You mean that no matter whether we find
a way to store full-width GFNs, SH_L1E_MMIO_MAGIC can't have
arbitrarily many set bits dropped. On L1TF vulnerable hardware,
that is (i.e. in principle the constant could become a variable
to be determined at boot).

> Currently, on fully populated multi-socket servers, the MMIO fastpath
> relies on the top 4G of address space not being cacheable, which is the
> safest we can reasonably manage.  Extending this by a nibble takes us to
> 16G which is not meaningfully less safe.

That's 64G (36 address bits), isn't it? Looking at
l1tf_calculations(), I'd be worried in particular Penryn /
Dunnington might not support more than 36 address bits (I don't
think I have anywhere to check). Even if it was 38, 39, or 40
bits, 64G becomes a not insignificant part of the overall 256G /
512G / 1T address space. Then again the top quarter assumption
in l1tf_calculations() would still be met in this latter case.

Jan

