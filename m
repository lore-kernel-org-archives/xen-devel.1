Return-Path: <SRS0=oDxe=CE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154ECC433DF
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 07:59:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E061020707
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2020 07:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E061020707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAqLG-0002G0-F4; Wed, 26 Aug 2020 07:59:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7zTW=CE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAqLF-0002Fv-Qr
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 07:59:33 +0000
X-Inumbo-ID: 54efd8f4-fe9f-4467-931c-5359f3931e13
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54efd8f4-fe9f-4467-931c-5359f3931e13;
 Wed, 26 Aug 2020 07:59:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2278AAC46;
 Wed, 26 Aug 2020 08:00:02 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/xen: Add misuse warning to virt_to_gfn
To: Simon Leiner <simon@leiner.me>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org
References: <Aw: [Linux] [ARM] Granting memory obtained from the DMA API>
 <20200825093153.35500-1-simon@leiner.me>
 <20200825093153.35500-2-simon@leiner.me>
 <374f42a0-b618-8b90-71b5-0a865ea1ddbb@suse.com>
 <alpine.DEB.2.21.2008251647100.24407@sstabellini-ThinkPad-T480s>
 <00bdd0ee-8f18-4580-01c7-01c95f3a6184@suse.com>
 <d5db3e9a-2d5e-ef20-2516-c014d25e9e1c@leiner.me>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bf17ac65-6182-d426-a6d6-7dac0f286dc7@suse.com>
Date: Wed, 26 Aug 2020 09:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d5db3e9a-2d5e-ef20-2516-c014d25e9e1c@leiner.me>
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

On 26.08.20 09:50, Simon Leiner wrote:
> On 26.08.20 08:20, Jan Beulich wrote:
>> Hmm, to me __phys_to_virt() and __virt_to_phys_nodebug() give
>> the impression that they're just linear transformations of the
>> address, which would seem to suggest there's a pre-determined
>> address range used for the direct map.
> 
>  From eyeballing the kernel code, it seems like __is_lm_address() is
> suitable for such a check, especially since it is also used in
> __virt_to_phys() (the one in arch/arm64/mm/physaddr.c).

This seems to be an Arm specific function.

virt_addr_valid() seems to be a good fit.


Juergen

