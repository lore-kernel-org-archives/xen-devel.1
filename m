Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49C21112276
	for <xen-devel@archiver.kernel.org>; Thu,  2 Apr 2026 02:31:27 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1270964.1559336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w87pk-0004X6-6T; Thu, 02 Apr 2026 02:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1270964.1559336; Thu, 02 Apr 2026 02:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w87pk-0004Wx-1b; Thu, 02 Apr 2026 02:31:00 +0000
Received: by outflank-mailman (input) for mailman id 1270964;
 Thu, 02 Apr 2026 02:30:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1w87pi-0004Wr-UF
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2026 02:30:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w87pi-005Z3a-25;
 Thu, 02 Apr 2026 02:30:58 +0000
Received: from [2001:268:9abd:66c7:b99f:63d7:98fa:3237]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1w87pi-00EOeS-0n;
 Thu, 02 Apr 2026 02:30:58 +0000
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
	bh=XNBeaCFJnRrOzCHOlR24NIMb8hWks2v97D7twN+FcCI=; b=zSe6pZOGM/HocuH/i49FXELydD
	ZT7rN1QxUXae4V7vGTVkhcO4NXOadMF8FWSCO9nig3xqTH7ZhkrE7bH9lxtg3eNqZuqN+qHweKOKD
	Gw8oeGi76QATzjBYM/M4o34ZV7vmG6IhIDEP6/slcyFTq4zzP1wDRXl+W3QUjK9KaOFo=;
Message-ID: <e1a380cd-e1ec-4b24-ad04-29e6795cf6d5@xen.org>
Date: Thu, 2 Apr 2026 03:30:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm: acpi: Rename local acpi_size to avoid
 shadowing typedef
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20260401145816.169557-1-michal.orzel@amd.com>
 <20260401145816.169557-2-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20260401145816.169557-2-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 01/04/2026 15:58, Michal Orzel wrote:
> Rename the local variable acpi_size to acpi_len in
> estimate_acpi_efi_size() to avoid shadowing the acpi_size typedef
> from xen/include/acpi/actypes.h.

We can't change actypes.h but I wish they were suffixing the types with _t.

> 
> This resolves a MISRA C Rule 5.6 violation.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Julien Grall <julien@xen.org>

Cheers,

-- 
Julien Grall


