Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAAEC4332F
	for <xen-devel@archiver.kernel.org>; Sun, 11 Dec 2022 11:10:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.458877.716595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4KDp-0000Fh-1q; Sun, 11 Dec 2022 11:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458877.716595; Sun, 11 Dec 2022 11:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4KDo-0000Fa-Um; Sun, 11 Dec 2022 11:10:16 +0000
Received: by outflank-mailman (input) for mailman id 458877;
 Sun, 11 Dec 2022 11:10:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4KDn-0000FD-Gu
 for xen-devel@lists.xenproject.org; Sun, 11 Dec 2022 11:10:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4KDm-00076s-1d; Sun, 11 Dec 2022 11:10:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4KDl-0003wb-S7; Sun, 11 Dec 2022 11:10:13 +0000
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
	bh=JJQLY4gzE7vdjqFZ8y3xCY0q5TVfAjyFOWUximPDPdk=; b=hiY7qaQLgYXzVwxJHBctnsR5UL
	83qGgUTc3Lud/Uwxgb7hEswT8c49rtGbhf4xu1HRs2nLECYz20WQQUxOj7+MRXuAWxtfxUSsFFd1B
	OrZiPwzDDOlnFKPBlcXbdOnqi235vV+bFWKGCsgDZff+/valZalU0uoqo3p1nWEtsnYA=;
Message-ID: <25584924-2701-dfcc-58c1-b9a0e4036fc1@xen.org>
Date: Sun, 11 Dec 2022 11:10:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] xen/arm: efi-boot misra rule 4.1 fix
To: Stefano Stabellini <sstabellini@kernel.org>, bertrand.marquis@arm.com
Cc: Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 jbeulich@suse.com, Luca.Fancellu@arm.com,
 Stefano Stabellini <stefano.stabellini@amd.com>
References: <20221209222552.3353993-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221209222552.3353993-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 09/12/2022 22:25, Stefano Stabellini wrote:
> We have 3 violations of MISRA C Rule 4.1 ("Octal and hexadecimal escape
> sequences shall be terminated") in xen/arch/arm/efi/efi-boot.h. Fix them
> and take the opportunity to declare them as static const __initconst and
> improve the style.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

