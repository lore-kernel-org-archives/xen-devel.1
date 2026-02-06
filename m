Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAE3EB28F8
	for <xen-devel@archiver.kernel.org>; Fri,  6 Feb 2026 09:10:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1223016.1530678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHqm-0001FW-89; Fri, 06 Feb 2026 09:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223016.1530678; Fri, 06 Feb 2026 09:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHqm-0001F8-56; Fri, 06 Feb 2026 09:10:04 +0000
Received: by outflank-mailman (input) for mailman id 1223016;
 Fri, 06 Feb 2026 09:10:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YaI+=AK=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1voHql-00014k-KA
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:10:03 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9cd71c38-033b-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 10:09:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3201339
 for <xen-devel@lists.xenproject.org>; Fri,  6 Feb 2026 01:09:52 -0800 (PST)
Received: from [10.57.94.150] (unknown [10.57.94.150])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C17D13F778
 for <xen-devel@lists.xenproject.org>; Fri,  6 Feb 2026 01:09:58 -0800 (PST)
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
X-Inumbo-ID: 9cd71c38-033b-11f1-9ccf-f158ae23cfc8
Message-ID: <93d53946-feea-4aaf-be5c-b64954894b7b@arm.com>
Date: Fri, 6 Feb 2026 09:09:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fifth MPU Series
Content-Language: en-GB
To: xen-devel@lists.xenproject.org
References: <20260206090155.68466-1-harry.ramsey@arm.com>
From: Harry Ramsey <harry.ramsey@arm.com>
In-Reply-To: <20260206090155.68466-1-harry.ramsey@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/02/2026 09:01, Harry Ramsey wrote:

> This series continues to further the ongoing work to introduce support
> for MPU systems in Xen.
>
> The patches in this series aim to implement MPU specific p2m functions.
>
> Harry Ramsey (2):
>    arm/mpu: Introduce `v8r_el1_msa` device tree property for domains
>    arm/mpu: Implement p2m tables
>
> Penny Zheng (1):
>    arm/mpu: implement setup_virt_paging for MPU system
>
>   docs/misc/arm/device-tree/booting.txt    | 11 ++++
>   xen/arch/arm/arm64/mpu/p2m.c             | 67 +++++++++++++++++++++-
>   xen/arch/arm/dom0less-build.c            | 25 +++++++++
>   xen/arch/arm/domain.c                    | 16 ++++++
>   xen/arch/arm/include/asm/arm32/mpu.h     |  2 +
>   xen/arch/arm/include/asm/arm64/mpu.h     |  2 +
>   xen/arch/arm/include/asm/arm64/sysregs.h |  4 ++
>   xen/arch/arm/include/asm/cpufeature.h    | 13 ++++-
>   xen/arch/arm/include/asm/domain.h        |  9 +++
>   xen/arch/arm/include/asm/mpu.h           |  5 ++
>   xen/arch/arm/include/asm/mpu/p2m.h       | 12 ++++
>   xen/arch/arm/include/asm/p2m.h           |  5 ++
>   xen/arch/arm/include/asm/processor.h     | 11 ++++
>   xen/arch/arm/mpu/p2m.c                   | 71 +++++++++++++++++++++++-
>   xen/include/public/arch-arm.h            |  4 ++
>   15 files changed, 250 insertions(+), 7 deletions(-)
>
> --
> 2.43.0
>

This is a complete rework of the previous patch: 
https://patchwork.kernel.org/project/xen-devel/patch/20260119105022.3616126-1-harry.ramsey@arm.com/

v2:

- Split `implement setup_virt_paging for MPU system` into `arm/mpu: 
implement setup_virt_paging for MPU system` and `Implement p2m tables`

- Rework register setup within `setup_virt_paging` to be more concise

- Introduce v8r_el1_msa device tree parameter


