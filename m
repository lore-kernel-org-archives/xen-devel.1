Return-Path: <SRS0=X+fC=A7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782E0C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 17:48:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5116320709
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 17:48:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="AckKINPz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5116320709
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZtb-0000Gl-M9; Mon, 20 Jul 2020 17:48:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Eely=A7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jxZtb-0000Gg-7G
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:48:11 +0000
X-Inumbo-ID: 2d2e0eb0-cab1-11ea-84ad-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d2e0eb0-cab1-11ea-84ad-bc764e2007e4;
 Mon, 20 Jul 2020 17:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I1vOqkTQHp54/DiklsAqjbZ1wXq/tOMFHzPhPDEN418=; b=AckKINPz56Fc7aKYqpNvvnmZNb
 8AzGV20m0DcHEwiSEnKscO6A4BHuX81q6CI0RMtMa7D4LzE1YMcNTlWTrIysSqXYng8mWeY8uttUJ
 PirYVrKfd05yhEWayXj4uXkC0lxHYQolrUJrpiHJrVctAhkBDEMLSPUaRU7JKERaOeY8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxZtW-0004EI-JU; Mon, 20 Jul 2020 17:48:06 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jxZtW-0005va-97; Mon, 20 Jul 2020 17:48:06 +0000
Subject: Re: [PATCH] SUPPORT.md: Spell correctly Experimental
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20200720173635.1571-1-julien@xen.org>
 <4cc580c5-146f-6f83-bd91-a798763c261b@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <627851f2-d28e-5c3b-6f1f-882e9eb02ed4@xen.org>
Date: Mon, 20 Jul 2020 18:48:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4cc580c5-146f-6f83-bd91-a798763c261b@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 20/07/2020 18:45, Andrew Cooper wrote:
> On 20/07/2020 18:36, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Although I'd suggest the subject be changed rearranged to "Spell
> Experimentally correctly".

Did you intend to write "Experimental" rather than "Experimentally"?

Other than that, I will fix it on commit.

Cheers,

-- 
Julien Grall

