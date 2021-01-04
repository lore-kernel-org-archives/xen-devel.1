Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C578C433E0
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 14:21:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42F35224D2
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 14:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42F35224D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61259.107626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQjK-0007Vh-EI; Mon, 04 Jan 2021 14:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61259.107626; Mon, 04 Jan 2021 14:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQjK-0007Va-9Y; Mon, 04 Jan 2021 14:21:06 +0000
Received: by outflank-mailman (input) for mailman id 61259;
 Mon, 04 Jan 2021 14:21:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQjI-0007VU-O6
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 14:21:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abe5f214-7121-45a2-b11d-d1d3f0b2a418;
 Mon, 04 Jan 2021 14:21:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 35A95B27B;
 Mon,  4 Jan 2021 14:21:03 +0000 (UTC)
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
X-Inumbo-ID: abe5f214-7121-45a2-b11d-d1d3f0b2a418
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609770063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVNSpd9R2xpuCdpgG+63iko2YaScpy4k1wYgOUL0ocU=;
	b=uMsbew3MWXzi4QOlcmA6O6Ol21ovxhxAaQBEshgevd0T0NX5gbp8NDhq3m0CjI3key2CaP
	A1UE4TB18cqsWs+x0PTLvOXBLL4MojwQJvGNY8fiiXr4LbwJ1gnKdxd09cDGIT/54pvHk4
	67mJuT8BkAUFru1qAIZQaFSVv+d6pPE=
Subject: Re: [PATCH] xen/iommu: smmu: Use 1UL << 31 rather than 1 << 31
To: Julien Grall <julien@xen.org>
Cc: bertrand.marquis@arm.com, Rahul.Singh@arm.com,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20201224152419.22453-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b4323f4c-36f5-1d3b-6a46-09420ad6e47d@suse.com>
Date: Mon, 4 Jan 2021 15:21:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224152419.22453-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.12.2020 16:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Replace all the use of 1 << 31 with 1UL << 31 to prevent undefined
> behavior in the SMMU driver.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

With, as already pointed out by Hans, 1UL replaced by 1U in
title and description
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

