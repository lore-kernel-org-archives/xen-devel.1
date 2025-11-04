Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86498CCF9E3
	for <xen-devel@archiver.kernel.org>; Tue,  4 Nov 2025 10:55:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1155669.1485110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEgj-0001B9-OT; Tue, 04 Nov 2025 10:54:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155669.1485110; Tue, 04 Nov 2025 10:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGEgj-0001B2-JH; Tue, 04 Nov 2025 10:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1155669;
 Tue, 04 Nov 2025 10:54:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vGEgh-0001Aw-Gj
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 10:54:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEgg-000mKI-2b;
 Tue, 04 Nov 2025 10:54:55 +0000
Received: from [2a02:8012:3a1:0:2858:32e7:18b8:3bf]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vGEgg-00B5aG-2i;
 Tue, 04 Nov 2025 10:54:54 +0000
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
	bh=UO44pjj3/P2uckSRmi9p5Kc8hoydRQyaw2DRGZPeEvA=; b=SqRo9BunCSrxb196zb0TWBapZt
	VNScfvPBRRXePu3DAtG2aFMhaAPKSRP/vBuv01Ki+2gemhf3bcmv1tVPECFMuqXiPJrQoeefKn7ej
	DfItmnGpenBfa8QcJjGzHCbZpzA4XvqYHTb9CZIOAjvOiKuYym6P7SPmOSAKIL5QAkCE=;
Message-ID: <7d95cd09-c997-4d84-91d2-3f1e53a42639@xen.org>
Date: Tue, 4 Nov 2025 10:54:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] arm/gic: Use static irqaction
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1760083684.git.mykyta_poturai@epam.com>
 <7ebd435d510c88e2840ee991f8fd75f25ad66f75.1760083684.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7ebd435d510c88e2840ee991f8fd75f25ad66f75.1760083684.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykyta,

On 10/10/2025 10:21, Mykyta Poturai wrote:
> When stopping a core cpu_gic_callback is called in non-alloc
> context, which causes xfree in release_irq to fail an assert.
> 
> To fix this, switch to a statically allocated irqaction that does not
> need to be freed in release_irq.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Assuming Mykola's comment is address:

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


