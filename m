Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43096C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 17:02:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB81564E00
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 17:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB81564E00
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78333.142475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5XAD-0004YK-7M; Fri, 29 Jan 2021 17:02:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78333.142475; Fri, 29 Jan 2021 17:02:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5XAD-0004YD-45; Fri, 29 Jan 2021 17:02:29 +0000
Received: by outflank-mailman (input) for mailman id 78333;
 Fri, 29 Jan 2021 17:02:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5XAC-0004Y8-66
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 17:02:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5X9j-0002Ez-Ul; Fri, 29 Jan 2021 17:01:59 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5X9j-00026i-KD; Fri, 29 Jan 2021 17:01:59 +0000
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
	bh=GJjxpg58GA+1PkuPFL1M36Gv8SlsFkIyqoebUCcQwwU=; b=CCMDzJ8canpk7tDcNHAc99Zke9
	PHmZl16PYXfzDK1rVi+gyaIxDql69yXdClKjd6zjA7hymv9MjYo94vNoIqXdAaYa5ZrPGLNUgpo0E
	+zjGSkc9js5jm5+9yDQnxLvbOxrMZfK3lvti9ZnLItng1u00eDbio3GOI5Ni0RE6mKM0=;
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0149ee4f-a148-fc30-2bb2-d39f53a9feee@xen.org>
Date: Fri, 29 Jan 2021 17:01:56 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
> Julien Grall (3):
>    xen/ioreq: Make x86's IOREQ related dm-op handling common
>    xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
>    arm/ioreq: Introduce arch specific bits for IOREQ/DM features
> 
> Oleksandr Tyshchenko (21):
>    x86/ioreq: Prepare IOREQ feature for making it common
>    x86/ioreq: Add IOREQ_STATUS_* #define-s and update code for moving
>    x86/ioreq: Provide out-of-line wrapper for the handle_mmio()
>    xen/ioreq: Make x86's IOREQ feature common
>    xen/ioreq: Make x86's hvm_ioreq_needs_completion() common
>    xen/ioreq: Make x86's hvm_mmio_first(last)_byte() common
>    xen/ioreq: Make x86's hvm_ioreq_(page/vcpu/server) structs common
>    xen/ioreq: Move x86's ioreq_server to struct domain
>    xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu
>    xen/ioreq: Remove "hvm" prefixes from involved function names
>    xen/ioreq: Use guest_cmpxchg64() instead of cmpxchg()
>    xen/arm: Call vcpu_ioreq_handle_completion() in check_for_vcpu_work()
>    xen/mm: Handle properly reference in set_foreign_p2m_entry() on Arm
>    xen/ioreq: Introduce domain_has_ioreq_server()
>    xen/dm: Introduce xendevicemodel_set_irq_level DM op
>    xen/arm: io: Abstract sign-extension
>    xen/arm: io: Harden sign extension check
>    xen/ioreq: Make x86's send_invalidate_req() common
>    xen/arm: Add mapcache invalidation handling
>    xen/ioreq: Do not let bufioreq to be used on other than x86 arches
>    xen/ioreq: Make the IOREQ feature selectable on Arm

I have used the v7 of the last and committed the series.

I am looking forward for the virtio support :).

Thanks for the hard work!

Cheers,

-- 
Julien Grall

