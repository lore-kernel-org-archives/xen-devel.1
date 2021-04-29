Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45751C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 07:10:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11036141E
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 07:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B11036141E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.119753.226401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc0or-0008NY-RV; Thu, 29 Apr 2021 07:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119753.226401; Thu, 29 Apr 2021 07:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc0or-0008NR-OW; Thu, 29 Apr 2021 07:10:41 +0000
Received: by outflank-mailman (input) for mailman id 119753;
 Thu, 29 Apr 2021 07:10:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Zyx=J2=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lc0oq-0008NM-LQ
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 07:10:40 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e1329bdb-66d4-4a96-9d37-ff09e26ea398;
 Thu, 29 Apr 2021 07:10:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAAB331B;
 Thu, 29 Apr 2021 00:10:38 -0700 (PDT)
Received: from [10.57.1.124] (unknown [10.57.1.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C70FF3F73B;
 Thu, 29 Apr 2021 00:10:37 -0700 (PDT)
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
X-Inumbo-ID: e1329bdb-66d4-4a96-9d37-ff09e26ea398
Subject: Re: [PATCH v2 03/10] arm: Modify type of actlr to register_t
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-4-michal.orzel@arm.com>
 <160ccd79-1a6e-059f-82a7-996c8bcc68f3@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <9c2f6d85-2b03-0360-ffa6-a3433a30a9bd@arm.com>
Date: Thu, 29 Apr 2021 09:10:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <160ccd79-1a6e-059f-82a7-996c8bcc68f3@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 27.04.2021 11:47, Julien Grall wrote:
> Hi Michal,
> 
> On 27/04/2021 10:35, Michal Orzel wrote:
>> AArch64 registers are 64bit whereas AArch32 registers
>> are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
>> we should get rid of helpers READ/WRITE_SYSREG32
>> in favour of using READ/WRITE_SYSREG.
>> We should also use register_t type when reading sysregs
>> which can correspond to uint64_t or uint32_t.
>> Even though many AArch64 registers have upper 32bit reserved
>> it does not mean that they can't be widen in the future.
> 
> This is a pretty generic message but doesn't really explain the change itself and point out this is a bug (possibly latent on current HW) because it is implementation defined. IOW a CPU implementer may already have decided to use the top 32-bit without our knowledge.
> 
> Cheers,
> Is the following ok?
"
AArch64 registers are 64bit whereas AArch32 registers
are 32bit or 64bit. MSR/MRS are expecting 64bit values thus
we should get rid of helpers READ/WRITE_SYSREG32
in favour of using READ/WRITE_SYSREG.
We should also use register_t type when reading sysregs
which can correspond to uint64_t or uint32_t.
Even though many AArch64 registers have upper 32bit reserved
it does not mean that they can't be widen in the future.

ACTLR_EL1 system register bits are implementation defined
which means it is possibly a bug on current HW as the CPU
implementer may already have decided to use the top 32bit.
"

Cheers
Michal

