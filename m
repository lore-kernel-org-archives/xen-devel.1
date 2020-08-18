Return-Path: <SRS0=Ms5E=B4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF65C433DF
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2020 13:15:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF1F206B5
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2020 13:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="qfCPEBar"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF1F206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k81SC-0005Ls-GW; Tue, 18 Aug 2020 13:15:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ffgU=B4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k81SB-0005Li-5p
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:15:03 +0000
X-Inumbo-ID: fb2659f0-391f-4de8-87fc-5c3bc647e08d
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb2659f0-391f-4de8-87fc-5c3bc647e08d;
 Tue, 18 Aug 2020 13:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=JSPGMYCYgwbPn2TkolB5eSHZ5EonuW9reBBIB2IlOos=; b=qfCPEBarofSwBeqPZsFgqvVyUm
 ObZ62xCg4iQwv+oNoYmhnj5mjfwY3alo77jTStpqKh87kx+X+Bq28pu8kVoY+p1NaRgfrqLPcsZlc
 066NRPngUmNDsE3GK+HBgx1UpyNHNMmrovkjn+5MSctSI6NHq+LyJE2vDVp/sBkGX/oc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k81S4-0004Zz-9x; Tue, 18 Aug 2020 13:14:56 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k81S4-0002oz-0t; Tue, 18 Aug 2020 13:14:56 +0000
Subject: Re: [RESEND][PATCH v2 5/7] xen: include xen/guest_access.h rather
 than asm/guest_access.h
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>
References: <20200730181827.1670-1-julien@xen.org>
 <20200730181827.1670-6-julien@xen.org>
 <0874b4c7-13d4-61c1-c076-c9d7cf3720c7@suse.com>
 <b2c77386-69a7-b6ee-8311-b2dd25e5ddcd@xen.org>
 <70f7a5c0-3f41-e3a7-00ea-0e620a5506e9@suse.com>
 <8e4685b1-157b-a7ce-72aa-75352c4985b9@xen.org>
 <6474b805-dda6-56ac-cbed-65e4b399081c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d2a790ad-0e97-4f58-a38e-c3a23caf0dac@xen.org>
Date: Tue, 18 Aug 2020 14:14:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6474b805-dda6-56ac-cbed-65e4b399081c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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



On 18/08/2020 12:32, Jan Beulich wrote:
> On 18.08.2020 10:58, Julien Grall wrote:
>>> One option. Personally I'd prefer to avoid introduction of yet another
>>> constant, by leveraging __XEN_GUEST_ACCESS_H__ instead.
>>
>> I thought about it but it doesn't prevent new inclusions of asm/guest_access.h. For instance, the following would still compile:
>>
>> #include <xen/guest_access.h>
>>
>> [...]
>>
>> #include <asm/guest_access.h>
> 
> But where's the problem with this? The first #include will already
> have resulted in the inclusion of asm/guest_access.h, so the second
> #include is simply a no-op.

A couple of reasons:
    1) I don't consider this solving completely your original request [1]
    2) I don't see how this is more important to prevent including 
<asm/guest_access.h> before and not after. Both will still compile fine, 
we just want to avoid it.


[1] "Is there any chance you could take measures to avoid new inclusions 
of asm/guest_access.h to appear?"

-- 
Julien Grall

