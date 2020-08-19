Return-Path: <SRS0=ZsuC=B5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C0EC433E1
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 08:51:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EECC5207FB
	for <xen-devel@archiver.kernel.org>; Wed, 19 Aug 2020 08:51:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="K/mxkwYV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EECC5207FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8Jnw-0000fs-5D; Wed, 19 Aug 2020 08:50:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ayQ0=B5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k8Jnv-0000fn-GR
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 08:50:43 +0000
X-Inumbo-ID: 41a01c17-85f6-45d3-998f-3396aa079ddb
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41a01c17-85f6-45d3-998f-3396aa079ddb;
 Wed, 19 Aug 2020 08:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=ZMDcc6r34hoTtpjy5/O3oIfAqo66PmaMoTUPV6E9FnE=; b=K/mxkwYVIYrjISIw8nP3c00TCA
 n97WmAkq5Zs0+x3z+T2VWAS66Epwgenf3axbgghGymETWElZhoB1R5dwO269v848sKyD6vTMPHcxj
 7Yrlrgt5JfKmnrvSvO3ea9p6ZsnrYOfb3uFL2bUUA5df6FNNJ3VsKxAC4rVRBGgDtNqc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8Jnn-00035v-Lw; Wed, 19 Aug 2020 08:50:35 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k8Jnn-0004ii-EM; Wed, 19 Aug 2020 08:50:35 +0000
Subject: Re: [PATCH 1/2] xen/arm: entry: Place a speculation barrier following
 an ret instruction
To: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, 
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andre Przywara <Andre.Przywara@arm.com>, Julien Grall <jgrall@amazon.com>,
 "security@xenproject.org" <security@xen.org>
References: <20200616175913.7368-1-julien@xen.org>
 <20200616175913.7368-2-julien@xen.org>
 <alpine.DEB.2.21.2006161422240.24982@sstabellini-ThinkPad-T480s>
 <57696b4d-da83-a4d6-4d82-41a6f6c9174c@xen.org>
 <5c3a2407-3e76-3a30-7f93-036706e00f73@xen.org>
 <9DFF73C4-5141-47AF-A0DB-331787007F37@arm.com>
 <5a406d61-293b-8dd7-44c2-d4f5dde4856f@xen.org>
 <7EAB4E0A-338C-4DCF-80A4-A426BC95C051@arm.com>
 <5dceeedf-9982-37c5-553e-76f22d9d6db2@xen.org>
 <B2AFB28F-0D54-45D4-AFAA-8C495A6D9054@arm.com>
 <75e13b0b-07fc-1e30-42e8-e11a65fa1c81@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <52ce222b-2d48-8824-aac6-6240dbe30ebf@xen.org>
Date: Wed, 19 Aug 2020 09:50:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <75e13b0b-07fc-1e30-42e8-e11a65fa1c81@suse.com>
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

(Adding back security)

Hi Jan,

On 19/08/2020 09:02, Jan Beulich wrote:
> On 19.08.2020 09:59, Bertrand Marquis wrote:
>>> On 18 Aug 2020, at 18:34, Julien Grall <julien@xen.org> wrote:
> 
> Btw - is there any need for this thread to be cross posted to both
> xen-devel@ and security@? (I've dropped the latter here.)

 From the cover letter:

"The patch series is directly sent on the mailing list as the
security team has been aware of the issues after the whitepaper was
publicly released."

This is technically still a security issue except this is discussed in 
the open as it is a zero day for us. An XSA will have to be issued in 
due course. Hence why security@ is added to keep track of the conversation.

Cheers,

-- 
Julien Grall

