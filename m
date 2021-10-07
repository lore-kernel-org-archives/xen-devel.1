Return-Path: <SRS0=uD6j=O3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32816C433F5
	for <xen-devel@archiver.kernel.org>; Thu,  7 Oct 2021 08:03:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B7A610EA
	for <xen-devel@archiver.kernel.org>; Thu,  7 Oct 2021 08:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3B7A610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.203354.358455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOMr-0004Gt-7U; Thu, 07 Oct 2021 08:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203354.358455; Thu, 07 Oct 2021 08:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYOMr-0004Gm-3G; Thu, 07 Oct 2021 08:03:05 +0000
Received: by outflank-mailman (input) for mailman id 203354;
 Thu, 07 Oct 2021 08:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y1KR=O3=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mYOMp-0004Gg-8N
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 08:03:03 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fe60deb8-2744-11ec-bfc1-12813bfff9fa;
 Thu, 07 Oct 2021 08:03:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C966E1FB;
 Thu,  7 Oct 2021 01:03:01 -0700 (PDT)
Received: from [10.57.18.238] (unknown [10.57.18.238])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 683D63F766;
 Thu,  7 Oct 2021 01:02:59 -0700 (PDT)
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
X-Inumbo-ID: fe60deb8-2744-11ec-bfc1-12813bfff9fa
Subject: Re: [PATCH v2 1/3] xen+tools: Introduce XEN_SYSCTL_PHYSCAP_vpmu
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Nick Rosbrook <rosbrookn@ainfosec.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, bertrand.marquis@arm.com, xen-devel@lists.xenproject.org
References: <20211006105827.15217-1-michal.orzel@arm.com>
 <20211006105827.15217-2-michal.orzel@arm.com>
 <6c97eefc-77a0-5e2d-92b1-6cb704a93e13@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <19a4b434-3cfc-e9db-80a1-1afb42c57fd5@arm.com>
Date: Thu, 7 Oct 2021 10:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6c97eefc-77a0-5e2d-92b1-6cb704a93e13@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 07.10.2021 09:59, Jan Beulich wrote:
> On 06.10.2021 12:58, Michal Orzel wrote:
>> Introduce flag XEN_SYSCTL_PHYSCAP_vpmu which
>> indicates whether the platform supports vPMU
>> functionality. Modify Xen and tools accordingly.
>>
>> Take the opportunity and fix XEN_SYSCTL_PHYSCAP_vmtrace
>> definition in sysctl.h which wrongly uses (1<<6)
>> instead of (1u<<6) and does not follow the standard
>> of using separate macro for a flag field.
> 
> While adding the u suffix is fine with me, iirc not introducing
> _XEN_SYSCTL_PHYSCAP_vmtrace was a specific review request at the
> time. I would similarly ask to avoid introduction of
> _XEN_SYSCTL_PHYSCAP_vpmu here, for it not being consumed by
> anything other than XEN_SYSCTL_PHYSCAP_vpmu's definition.
> 
> Jan
> 
Ok I did not know that. I thought we should stick to the previous standard.
Is this something that can be fixed on commit or should I send
a v3 only for that?

Cheers,
Michal

