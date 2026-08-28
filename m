Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE8EC61DB9
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:54:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401711.1637250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzrPl-00068u-MC; Fri, 28 Aug 2026 07:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401711.1637250; Fri, 28 Aug 2026 07:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzrPl-00068n-JZ; Fri, 28 Aug 2026 07:54:17 +0000
Received: by outflank-mailman (input) for mailman id 1401711;
 Fri, 28 Aug 2026 07:54:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wzrPk-00067c-Mj
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:54:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wzrPk-009wzi-0F;
 Fri, 28 Aug 2026 07:54:15 +0000
Received: from [2a02:8012:3a1:0:b46d:19b9:3369:f1e1]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wzrPi-00E9tF-22;
 Fri, 28 Aug 2026 07:54:14 +0000
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
	bh=JC5p0cqmy/OnXdsqCXkhOxXjsvNcK3X48yKMSC/PPns=; b=2/AKofr97zj1rMIaFrI4R1w9mt
	jRsatedY5emEIqbEbpCJgsDuVG4vGlv3YruXAuLPwZGndLbm3gABsgeN3HbRZZwsM+qM7WoPRgTMb
	BgCkleM7pPsWoXP6KXmuEmHlVBoHuwKvnNKZjEyWPh1X6Ze0epgfWEnUxM/grHKWnYiw=;
Message-ID: <0c8ebd80-9e73-4db0-a5b9-7b58b87874c0@xen.org>
Date: Fri, 28 Aug 2026 08:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ARM/vgic: Clean up vgic_v{2,3}_setup_hw()
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260828070409.106935-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260828070409.106935-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 28/08/2026 08:04, Michal Orzel wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> vgic_v{2,3}_setup_hw()'s callers are __init, so they should be too.
> vgic_v{2,3}_hw and gic_v2_hw_data are written once during init and
> unmodified thereafter, so make them __ro_after_init.  Reposition
> 'bool enabled' in these structures to fit in the tail padding, removing
> 8 bytes from their size when paddr_t is 8B.
> 
> While at it, drop dead vgic_v3_setup_hw() dummy implementation
> from vgic/vgic.c. GICV3 depends on !NEW_VGIC.

I am not sure about this one. There are logics in the new vGIC which are 
GICv3 specific so technically not reachable. However, I would argue they 
should not be remove as the eventual goal as always been to move to a 
different GIC (our current vGIC is not spec compliant). For this 
specific change, it is easy to re-add so ...

> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


