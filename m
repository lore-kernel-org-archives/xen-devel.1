Return-Path: <SRS0=oC9Q=C6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900E8C4363C
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 18:05:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E99E2071A
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2020 18:05:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="bzUGSeeZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E99E2071A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKQBC-0003o4-JT; Mon, 21 Sep 2020 18:04:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKQBB-0003ny-Lc
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 18:04:45 +0000
X-Inumbo-ID: 20157835-09f9-4412-b1bf-062d2c01a285
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20157835-09f9-4412-b1bf-062d2c01a285;
 Mon, 21 Sep 2020 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=eXRxZG4dW6cF5nUBuT9luhXAAH6Hl9y+rCQ+lyVbW58=; b=bzUGSeeZr+nVp48SZe2Pn+Ruw0
 0qU+/w0gDFLiU8z1hCETWl9JzjnRwNVKA3Gl4u7yv7TO7InjuJ7JvdJXfLYk3/8iawYLNxkvyADu4
 x64oINgS8Ajp5PFUC4icp2q15POEcCgW62SoBSYcUGaKjBRPHKny736kQ4X2Y96k844w=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQB9-0008Bg-Su; Mon, 21 Sep 2020 18:04:43 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKQB9-00041X-NC; Mon, 21 Sep 2020 18:04:43 +0000
Subject: Re: [PATCH] xen/mm: Introduce CONFIG_M2P and provide common fallback
 logic
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20200824181524.1111-1-andrew.cooper3@citrix.com>
 <01c0aa01-513b-05ac-e44d-8deaf11e2b95@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8ed961c1-2f7c-083c-8564-e9f493b80ffc@xen.org>
Date: Mon, 21 Sep 2020 19:04:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <01c0aa01-513b-05ac-e44d-8deaf11e2b95@suse.com>
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

Hi Jan,

On 25/08/2020 08:40, Jan Beulich wrote:
> On 24.08.2020 20:15, Andrew Cooper wrote:
>> I'm pretty sure the mfn_to_gmfn() stub is bogus before and after this change.
>> The two uses in common code are getdomaininfo and in memory_exchange(), which
>> result in junk.
> 
> It's been a long time back that I think I did suggest to restrict
> memory_exchange() to non-translated guests. I don't recall what
> the arguments against this were, but I'm quite sure it wasn't
> merely "it alters the ABI for such guests".

This was just a low priority for me. But I revived the series (see [1]).

Cheers,

[1] <20200921180214.4842-1-julien@xen.org>

-- 
Julien Grall

