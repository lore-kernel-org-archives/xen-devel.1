Return-Path: <SRS0=uIhg=IR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAA3C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 19 Mar 2021 10:28:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776D564F40
	for <xen-devel@archiver.kernel.org>; Fri, 19 Mar 2021 10:28:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776D564F40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.99164.188379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCM7-00062v-UJ; Fri, 19 Mar 2021 10:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99164.188379; Fri, 19 Mar 2021 10:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lNCM7-00062o-Qf; Fri, 19 Mar 2021 10:27:47 +0000
Received: by outflank-mailman (input) for mailman id 99164;
 Fri, 19 Mar 2021 10:27:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lNCM6-00062d-If
 for xen-devel@lists.xenproject.org; Fri, 19 Mar 2021 10:27:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNCM3-0000pM-R1; Fri, 19 Mar 2021 10:27:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lNCM3-0004u6-IU; Fri, 19 Mar 2021 10:27:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=+W4oxHwqzy81FKgupvP4mnRf46K3U1wqhmvHgeweaSk=; b=VPSQi0WQiTgKc+hoHP3J730Z6D
	dNwPVKAkm6zTkR5iGIjlM1FkTCbrhk3ZT/xg/atq1OAYys+yL6tffnwRhsMsdv6cqbx9Fii3GpAAD
	zbAPXWhzUJwTsQw86Ild78G51pnFtvw2hfVNYWWVNMwjBTRC7luQrlSFSqXOsvps0ozM=;
Subject: Re: preparations for 4.13.3
From: Julien Grall <julien@xen.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <5373f9d5-fc03-1967-8181-d77bbdaf25b9@suse.com>
 <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
Message-ID: <11f8d1e6-15b2-1fa2-2f50-a30df2fb1a24@xen.org>
Date: Fri, 19 Mar 2021 10:27:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b82a0932-761d-662c-baa4-59c4801ad5c8@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

Gentle ping. On IRC, Jan pointed out that he would like to realize the 
4.13.3 pretty soon.

Cheers,

On 13/03/2021 15:29, Julien Grall wrote:
> Hi Jan & Stefano,
> 
> On 08/03/2021 09:49, Jan Beulich wrote:
>> All,
>>
>> the release is overdue (my apologies). Please point out backports
>> you find missing from the respective staging branches, but which
>> you consider relevant.
>> > Ones that I have queued already, but which hadn't passed the push
>> gate to master yet when doing a swipe late last week, are
>>
>> c6ad5a701b9a crypto: adjust rijndaelEncrypt() prototype for gcc11
>> 9318fdf757ec x86/shadow: suppress "fast fault path" optimization 
>> without reserved bits
>> 60c0444fae21 x86/shadow: suppress "fast fault path" optimization when 
>> running virtualized
> 
> I would like to also consider the following one:
> 
> 28804c0ce9fd SUPPORT.MD: Clarify the support state for the Arm SMMUv{1, 
> 2} drivers (4.11+ as updating the security support)
> 067935804a8e xen/vgic: Implement write to ISPENDR in vGICv{2, 3} (4.13+)
>      To support newer kernel on stable Xen
> d81133d45d81 xen/arm: Add workaround for Cortex-A53 erratum #843419 (4.13+)
> fd7479b9aec2 xen/arm: Add workaround for Cortex-A55 erratum #1530923 
> (4.13+)
> 5505f5f8e7e8 xen/arm: Add Cortex-A73 erratum 858921 workaround (4.13+)
> 63b4c9bfb788 xen/arm: mm: Access a PT entry before the table is unmapped 
> (4.13 only)
> f6790389613c xen/arm: sched: Ensure the vCPU context is seen before 
> vcpu_pause() returns (4.13 only)
> 
> I have put in parentheses the list of versions targeted.
> 
> Cheers,
> 

-- 
Julien Grall

