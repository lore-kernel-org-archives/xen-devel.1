Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BEBC79FB5
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 07:11:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412604.1642998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4CSA-000225-GC; Wed, 09 Sep 2026 07:10:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412604.1642998; Wed, 09 Sep 2026 07:10:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4CSA-00021y-CW; Wed, 09 Sep 2026 07:10:42 +0000
Received: by outflank-mailman (input) for mailman id 1412604;
 Wed, 09 Sep 2026 07:10:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1x4CS9-00021s-Qn
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 07:10:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1x4CS8-006KcO-1K;
 Wed, 09 Sep 2026 07:10:40 +0000
Received: from [2a02:8012:3a1:0:111e:e427:1551:134]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1x4CS9-006Qxe-06;
 Wed, 09 Sep 2026 07:10:40 +0000
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
	bh=79YGx68BM0QGfMeF3+qw2QlvE/vUpsEo3n5u+HdzZOM=; b=06XibakQADxRmKc77/Msef9sAO
	BLRStR3Uth4MNXAuDPfl08+Nzx0FxA3wKo737cCeYmwaHKALss35+Ud3VMvbNdUp720mZM5WMjLNy
	Op7TgRqArRdVrtM7dovCiDGEQRPWI+eT1MLkZnaBgy6TDpjONgGgipuwZeBNEvLfVOJU=;
Message-ID: <a78545a9-a6e0-4591-9ead-2b11e2153d2f@xen.org>
Date: Wed, 9 Sep 2026 08:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm64/atomic: Clear exclusive monitor on cmpxchg
 failure
To: Ryoji Okamoto <okamoto@valinux.co.jp>, xen-devel@lists.xenproject.org
Cc: Hirokazu Takahashi <taka@valinux.co.jp>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260909061253.546312-1-okamoto@valinux.co.jp>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260909061253.546312-1-okamoto@valinux.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ryoji,

On 09/09/2026 08:12, Ryoji Okamoto wrote:
> When the value comparison fails in atomic_cmpxchg, the code branches
> out without executing stxr, leaving the exclusive monitor in the
> exclusive state set by ldxr.
> 
> Add `clrex` to the failure path to explicitly clear the exclusive
> monitor.

The Xen atomics operations were originally taken from Linux. Looking at 
the implementation there, I don't see a clrex on the failure path. Do 
you have more details why we would want it?

Also, if this is necessary on arm64, then we most likely we want the 
same for the arm32 implementation (including __atomic_add_unless()).
	

Cheers,

-- 
Julien Grall


