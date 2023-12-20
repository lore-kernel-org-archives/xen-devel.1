Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160B3C3DA6E
	for <xen-devel@archiver.kernel.org>; Wed, 20 Dec 2023 11:49:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.657738.1026802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv4x-0001Wg-5u; Wed, 20 Dec 2023 11:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657738.1026802; Wed, 20 Dec 2023 11:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFv4x-0001WX-3I; Wed, 20 Dec 2023 11:49:35 +0000
Received: by outflank-mailman (input) for mailman id 657738;
 Wed, 20 Dec 2023 11:49:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFv4w-0001WE-2j
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 11:49:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv4v-0003S9-GF; Wed, 20 Dec 2023 11:49:33 +0000
Received: from 82-132-247-3.dab.02.net ([82.132.247.3] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFv4v-0002By-7c; Wed, 20 Dec 2023 11:49:33 +0000
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
	bh=IN4CIVzThZOVZSDXbDlj6tvK/UKh6fNqP6Wui7mmzqA=; b=MqNkX7F0xb5HZKGWt7tDyYBVov
	74Yk7QPBmVe4uNml/vvtE5QZDLXOxLyMsQsjj2gm0ulyQyBntYhcyln2nXOhHiqs2zfyHMwzfmcoz
	aF82qHlNE2e+boU2i03CTx7FpcocDSxTdHrcvji+BEPM+ZgZw1I4C4I95+TyHdNTgeqg=;
Message-ID: <1d61edeb-e0e0-4223-9000-9aa5554fe4fb@xen.org>
Date: Wed, 20 Dec 2023 11:49:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 6/7] xen/arm: mmu: address a violations of MISRA
 C:2012 Rule 16.3
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <92740a979c4d3a19d7c76ff69b90ab211049448e.1703066935.git.federico.serafini@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92740a979c4d3a19d7c76ff69b90ab211049448e.1703066935.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Federico,

On 20/12/2023 11:03, Federico Serafini wrote:
> Add missing break at the end of the switch-clause to address a
> violation of MISRA C:2012 Rule 16.3 ("An unconditional `break'
> statement shall terminate every switch-clause").
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

