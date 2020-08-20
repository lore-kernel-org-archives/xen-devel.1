Return-Path: <SRS0=1JDs=B6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770D4C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 09:32:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BFE922BEB
	for <xen-devel@archiver.kernel.org>; Thu, 20 Aug 2020 09:32:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="anQKxHzL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BFE922BEB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8gvc-0006l3-GU; Thu, 20 Aug 2020 09:32:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bq9Y=B6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8gva-0006ky-M4
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 09:32:10 +0000
X-Inumbo-ID: 91de80af-339d-4b60-b9e6-0b0a692fc010
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 91de80af-339d-4b60-b9e6-0b0a692fc010;
 Thu, 20 Aug 2020 09:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=JYsZwn6mK3N6k5inL8Tu2utsAZjXZXsW7d2iyC2q3/g=; b=anQKxHzLwBCbJHzIzv0Ve7QAkZ
 eqXg2SXZ0P7Ym65CZFppJ4Yhg3zV+jHY49fqdxYx/yE8dsCt07vtlqZW9834jh5ecNjxv4z5jk06r
 ZqAgB6BpU+KjmlcprkIAiopWG2I/DGNB0NcQ/Q3uARX2nlymHtP73JaIbHfpFq1L3eGw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8gvY-0007R6-7Y; Thu, 20 Aug 2020 09:32:08 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8gvX-00040J-QX; Thu, 20 Aug 2020 09:32:08 +0000
Subject: Re: [PATCH 0/2] Enable 1165522 Errata for Neovers
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>,
 Andre Przywara <andre.przywara@arm.com>
References: <cover.1597740876.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <13bb006f-66b4-4c6e-1fd3-9a1e15521651@xen.org>
Date: Thu, 20 Aug 2020 10:32:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1597740876.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 18/08/2020 14:47, Bertrand Marquis wrote:
> This patch serie is adding Neoverse N1 processor identification and
> enabling the processor errata 1165522 for Neoverse N1 processors.
> 
> Bertrand Marquis (2):
>    arm: Add Neoverse N1 processor identifation
>    xen/arm: Enable CPU Errata 1165522 for Neoverse

Committed, thank you!

Cheers,

-- 
Julien Grall

