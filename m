Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8AAF01814
	for <xen-devel@archiver.kernel.org>; Fri,  6 Mar 2026 09:26:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1247500.1546088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRRs-0000cS-GY; Fri, 06 Mar 2026 09:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247500.1546088; Fri, 06 Mar 2026 09:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyRRs-0000cL-De; Fri, 06 Mar 2026 09:26:20 +0000
Received: by outflank-mailman (input) for mailman id 1247500;
 Fri, 06 Mar 2026 09:26:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vyRRq-0000cE-Pk
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 09:26:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vyRRq-008BSr-0s;
 Fri, 06 Mar 2026 09:26:18 +0000
Received: from [2a02:8012:3a1:0:f0b8:207:419e:3d8a]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vyRRq-001fKK-0I;
 Fri, 06 Mar 2026 09:26:18 +0000
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
	bh=XSI1KRPvWn+IVr2eqEcVZv3jMwf0CKUKByCZYDfU0Qg=; b=XphBMuGNZk6E9Gbv0QspeobMMl
	EKv4qUMmlz0XTWAiemhsO2OBJmeSj6yfRKYAsKR07jiwGxB8v71DoDzuSx1cq4fqKrXk73WOyUiLt
	fzBbJt7A3/p1wXQBYe6N2WfEMDpFTa7og980Kv7G5RB2WT9xGIEhgD8tK7pbT54ml3m4=;
Message-ID: <8eb6322f-ba2d-427b-8da7-c8df3288096d@xen.org>
Date: Fri, 6 Mar 2026 09:26:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM/vgic: Use for_each_set_bit() in vgic_sync_from_lrs()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20260305232845.62024-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260305232845.62024-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 05/03/2026 23:28, Andrew Cooper wrote:
> lr_mask doesn't have bits set beyond the hardware limit, with the upper bits
> remaining zero.  Therefore, for_each_set_bit() is a better option.
> 
> For ARM64, bloat-o-meter reports:
> 
>    Function                                     old     new   delta
>    vgic_sync_from_lrs                           208     168     -40
> 
> but this doesn't highlight that it also removes a call to find_next_bit() from
> each loop iteration.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <julien@xen.org>

> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> 
> RFC.  This form also doesn't suffer an OoB read when lr_mask changes type.

And potentially unaligned as well. On Arm 32, this would result to a 
crash because for forbid unaligned access.

Cheers,

-- 
Julien Grall


