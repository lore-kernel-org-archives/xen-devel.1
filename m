Return-Path: <SRS0=XIDt=N4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AD1C433F5
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 10:43:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24ED060EBA
	for <xen-devel@archiver.kernel.org>; Mon,  6 Sep 2021 10:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24ED060EBA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.179615.325970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNC5p-0004ls-Ce; Mon, 06 Sep 2021 10:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179615.325970; Mon, 06 Sep 2021 10:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNC5p-0004ll-9k; Mon, 06 Sep 2021 10:43:13 +0000
Received: by outflank-mailman (input) for mailman id 179615;
 Mon, 06 Sep 2021 10:43:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mNC5o-0004lf-KT
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 10:43:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNC5m-0001kT-Vu; Mon, 06 Sep 2021 10:43:10 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mNC5m-0005x2-PP; Mon, 06 Sep 2021 10:43:10 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=ZCb0AKomNjh90Gk0tOHoLBirjLw+JK+7N6jSubaVZtI=; b=GTbTw7PclL7DoJ7msE18HSBIsh
	jZ4zTIk4BIazeIcE7Y+/WF8agIZibSSD0qhSLNtiQX3qAoQQzGagnIU7Ovk6ZPz5oFx5+r28taVjS
	fw3+rOD1Uzv3tihlqagvfii8YiXvRUVqfVdoEWQSNvavp9zD5Ti0lA2ZzQYTmCp+IGyM=;
Subject: Re: [PATCH v3 1/4] public: Add page related definitions for accessing
 guests memory
To: Jan Beulich <jbeulich@suse.com>, Costin Lupu <costin.lupu@cs.pub.ro>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1629737453.git.costin.lupu@cs.pub.ro>
 <22031be8466bb18d1dd891481ccc67d8c2b2dd55.1629737453.git.costin.lupu@cs.pub.ro>
 <accc3026-1043-6b90-eda4-1951ef808bdc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9a5e836c-32ae-50e2-1091-086a40beb4b2@xen.org>
Date: Mon, 6 Sep 2021 11:43:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <accc3026-1043-6b90-eda4-1951ef808bdc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 24/08/2021 07:11, Jan Beulich wrote:
> On 23.08.2021 19:02, Costin Lupu wrote:
>> These changes introduce the page related definitions needed for mapping and
>> accessing guests memory. These values are intended to be used by any toolstack
>> component that needs to map guests memory. Until now, the values were defined
>> by the xenctrl.h header, therefore whenever a component had to use them it also
>> had to add a dependency for the xenctrl library.
>>
>> This patch also introduces xen_mk_long() macrodefinition for defining long
>> constants both for C and assembler code.
>>
>> Signed-off-by: Costin Lupu <costin.lupu@cs.pub.ro>
> 
> x86 part:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> This extends to the common parts only if the Arm side gets an ack,

For Arm:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> since - as said before - there you're treating use of one unstable
> interface (libxc) for another (the ABI) in supposedly stable
> libraries, or - if the ABI is to be stable despite being exposed
> to the tool stack only - you make it impossible to make the page
> size variable down the road.
> 
> Just yesterday we've been (internally) talking about the similar
> "maximum vCPU-s" aspect: This shouldn't be taken directly from the
> ABI by tool stacks, as imo we ought to allow the upper bounds to
> be configurable in the hypervisor (with the present limits merely
> becoming limits of what can be configured). This would similarly
> require a library function (or two, as HVM and PV limits are
> likely different). I wonder whether we shouldn't have a stable
> library providing functions to retrieve such limits. Initially the
> library would return constants, short of the hypervisor providing
> the needed data.
> 
> Jan
> 

-- 
Julien Grall

