Return-Path: <SRS0=yWKO=DX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DCEC433E7
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 10:24:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43E6B204FD
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2020 10:24:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="ZOIqUEDC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43E6B204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7876.20773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTMtx-0002uE-Ex; Fri, 16 Oct 2020 10:23:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7876.20773; Fri, 16 Oct 2020 10:23:57 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTMtx-0002u7-Bf; Fri, 16 Oct 2020 10:23:57 +0000
Received: by outflank-mailman (input) for mailman id 7876;
 Fri, 16 Oct 2020 10:23:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTMtw-0002u1-1d
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:23:56 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eee113c4-05d2-4aaa-a1c3-e126932aaeb1;
 Fri, 16 Oct 2020 10:23:52 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTMto-00010x-HV; Fri, 16 Oct 2020 10:23:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTMto-0006UE-9a; Fri, 16 Oct 2020 10:23:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTMtw-0002u1-1d
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 10:23:56 +0000
X-Inumbo-ID: eee113c4-05d2-4aaa-a1c3-e126932aaeb1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id eee113c4-05d2-4aaa-a1c3-e126932aaeb1;
	Fri, 16 Oct 2020 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=0S/GXTmwpIu6yEEvu7d9OAdDFNc4RY8WZMqCXBptqLA=; b=ZOIqUEDCm9GMujrWg/yoycP/lT
	0QLMgwksUi4vQDDe4lwtmljVnlkTZWBYiTXaMBpH64PsaGSG46xFs66lD4iij3ELt5F5bfC9ybNh9
	0f3Ns7RQ2gEQkVSy0D23SrAbKp1+JD5kNdTDbpkVM+t/a38mcm+8bEEQfkrqUur08lzg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTMto-00010x-HV; Fri, 16 Oct 2020 10:23:48 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTMto-0006UE-9a; Fri, 16 Oct 2020 10:23:48 +0000
Subject: Re: Xen Coding style and clang-format
To: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "George.Dunlap@citrix.com" <George.Dunlap@citrix.com>
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "vicooodin@gmail.com" <vicooodin@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <300923eb27aea4d19bff3c21bc51d749c315f8e3.camel@epam.com>
 <4238269c-3bf4-3acb-7464-3d753f377eef@suse.com>
 <E068C671-8009-4976-87B8-0709F6A5C3BF@citrix.com>
 <b16dfb26e0916166180d5cbbe95278dc99277330.camel@epam.com>
 <B64C5E67-7BEA-4C31-9089-AB8CC1F1E80F@citrix.com>
 <3ff3f7d16cdab692178ce638da1a6b880817fb7e.camel@epam.com>
 <64FE5ADB-2359-4A31-B1A1-925750515D98@citrix.com>
 <b4d7e9a7-6c25-1f7f-86ce-867083beb81a@suse.com>
 <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5bd7cc00-c4c9-0737-897d-e76f22e2fd5b@xen.org>
Date: Fri, 16 Oct 2020 11:23:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <4d4f351b152df2c50e18676ccd6ab6b4dc667801.camel@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 16/10/2020 10:42, Anastasiia Lukianenko wrote:
> Thanks for your advices, which helped me improve the checker. I
> understand that there are still some disagreements about the
> formatting, but as I said before, the checker cannot be very flexible
> and take into account all the author's ideas.

I am not sure what you refer by "author's ideas" here. The checker 
should follow a coding style (Xen or a modified version):
    - Anything not following the coding style should be considered as 
invalid.
    - Anything not written in the coding style should be left 
untouched/uncommented by the checker.

> I suggest using the
> checker not as a mandatory check, but as an indication to the author of
> possible formatting errors that he can correct or ignore.

I can understand that short term we would want to make it optional so 
either the coding style or the checker can be tuned. But I don't think 
this is an ideal situation to be in long term.

The goal of the checker is to automatically verify the coding style and 
get it consistent across Xen. If we make it optional or it is 
"unreliable", then we lose the two benefits and possibly increase the 
contributor frustration as the checker would say A but we need B.

Therefore, we need to make sure the checker and the coding style match. 
I don't have any opinions on the approach to achieve that.

Cheers,

-- 
Julien Grall

