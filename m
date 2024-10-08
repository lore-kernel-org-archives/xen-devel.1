Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96271CED27C
	for <xen-devel@archiver.kernel.org>; Tue,  8 Oct 2024 08:31:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.812794.1225544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5cg-0004l5-NH; Tue, 08 Oct 2024 08:31:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812794.1225544; Tue, 08 Oct 2024 08:31:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy5cg-0004ky-Kn; Tue, 08 Oct 2024 08:31:14 +0000
Received: by outflank-mailman (input) for mailman id 812794;
 Tue, 08 Oct 2024 08:31:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sy5ce-0004ks-Sy
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 08:31:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sy5ce-0005bI-CM; Tue, 08 Oct 2024 08:31:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sy5ce-0000TZ-54; Tue, 08 Oct 2024 08:31:12 +0000
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
	bh=tiIp7ZeuBCwflvEl2uQ1t2+G3Fu8unsKhS5berx9g1k=; b=tqhSOXic//l3H83oE7Y7IqhvX8
	j/YGdQYwFTi/dPqj0WhgOZKuJ7B66yESgqZyP6TC9nwDITcOBaDPaTiRqoLH0+72ipHubMTQullru
	/uRO2thTZmsbHCAJNxlCFSORoUjpto9oKDYUeHa6ihN8eI1TDz6G2C8yB36g1TXNo4yE=;
Message-ID: <dd4e3460-eed6-4a4d-82c8-c3d89b0d52e6@xen.org>
Date: Tue, 8 Oct 2024 09:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] types: replace remaining uses of s64
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <e3ba27ee-1534-40c1-b635-17ff89f50a6b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e3ba27ee-1534-40c1-b635-17ff89f50a6b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 01/10/2024 14:30, Jan Beulich wrote:
> --- a/xen/arch/arm/include/asm/arm64/cpufeature.h
> +++ b/xen/arch/arm/include/asm/arm64/cpufeature.h

This file needs to stick with Linux coding style. I don't think it is a 
problem to include "xen/linux-compat.h" here because the header is only 
included directly in two *.c. (There are no indirect inclusion).

Cheers,

-- 
Julien Grall


