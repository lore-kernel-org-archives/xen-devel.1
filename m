Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40040C28B2F
	for <xen-devel@archiver.kernel.org>; Tue, 11 Mar 2025 20:28:22 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.909223.1316210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6Co-0000YU-VW; Tue, 11 Mar 2025 20:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909223.1316210; Tue, 11 Mar 2025 20:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6Co-0000YN-Si; Tue, 11 Mar 2025 20:28:02 +0000
Received: by outflank-mailman (input) for mailman id 909223;
 Tue, 11 Mar 2025 20:28:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts6Cn-0000YG-QB
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 20:28:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6Cn-00EiHU-2Y;
 Tue, 11 Mar 2025 20:28:01 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6Cn-004jNM-14;
 Tue, 11 Mar 2025 20:28:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=W6/Cqy8EW2y4DqqbOEpioXdcSIuC6VCxP5l3lldR+Y4=; b=fFJczJldoEp0rfHw6hI86Qfxh9
	7uax//sElFnzX8jivRnFRKdPSOWtIJ3rVm4j0VpS5Zg0Kcoh5l2vuRSi6u4/buzxOry13S3/QCarN
	gbPKnaJM1Uqse/ngtjEo1xxl3yvUIbFsq2ZuY2+lgzfP7HVFRTUa1Jt+efB34vT60Mag=;
Message-ID: <27398a82-ecc9-4b4c-b140-2d68de666675@xen.org>
Date: Tue, 11 Mar 2025 20:27:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] iommu: Add checks before calling iommu
 suspend/resume
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykyta Poturai <mykyta_poturai@epam.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5694f2b73e808ebdc5d5b60a31cfad2b24f0e9d8.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/03/2025 09:11, Mykola Kvach wrote:
> From: Mykyta Poturai <mykyta_poturai@epam.com>
> 
> These functions may be unimplemented, so check that they exist before
> calling to prevent crashes.

Looking at the cover letter, I see you wrote the following:

"Add suspend/resume handlers to IOMMU drivers (there aren’t any
problems with the current implementation because the domains used for
test are thin, and this patch series implements only the very basic
logic)"

which I read as this patch is a temporary hack until we implement IOMMU.
Is that correct? If so, can you tag it as HACK and move to the end to 
end up to merge it?

Cheers,

-- 
Julien Grall


