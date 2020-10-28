Return-Path: <SRS0=61/H=ED=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F3FC388F7
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 15:49:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1B9247CC
	for <xen-devel@archiver.kernel.org>; Wed, 28 Oct 2020 15:49:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="LOKUqf9i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1B9247CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.13733.34476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnhL-0007nk-T4; Wed, 28 Oct 2020 15:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 13733.34476; Wed, 28 Oct 2020 15:49:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kXnhL-0007nd-Pu; Wed, 28 Oct 2020 15:49:15 +0000
Received: by outflank-mailman (input) for mailman id 13733;
 Wed, 28 Oct 2020 15:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kXnhK-0007mt-F8
 for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:49:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 347b0444-ce59-4e92-8a2e-5bb9515c174e;
 Wed, 28 Oct 2020 15:49:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93847AD71;
 Wed, 28 Oct 2020 15:49:12 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dk2S=ED=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kXnhK-0007mt-F8
	for xen-devel@lists.xenproject.org; Wed, 28 Oct 2020 15:49:14 +0000
X-Inumbo-ID: 347b0444-ce59-4e92-8a2e-5bb9515c174e
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 347b0444-ce59-4e92-8a2e-5bb9515c174e;
	Wed, 28 Oct 2020 15:49:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603900152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nFcUCOP/g/UZYCuUBOE6MBVdn1yuJPxtFuzE8jr9Rpw=;
	b=LOKUqf9iDH/0SYrcRnjK2kkdAhowptCiOhzWrBrP298V1KFAR+JnjrpWXge//daq4n3Jha
	nbe3ws03zJuOkVplJytBkme7G41zYSInswxFrFzJ7T7i1cP32sXrpXCYDjwOg1OfWMWiCg
	VTtF816ZG2xqok1+MJpMVc5GLAIwzoI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 93847AD71;
	Wed, 28 Oct 2020 15:49:12 +0000 (UTC)
Subject: Re: [PATCH v1 1/4] xen/ns16550: solve compilation error on ARM with
 CONFIG_HAS_PCI enabled.
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <cover.1603731279.git.rahul.singh@arm.com>
 <d1df24d48508c0c01c0b1130ed22f2b4585d04db.1603731279.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2010271621480.12247@sstabellini-ThinkPad-T480s>
 <95b72e09-246b-dcbe-6254-86b3e25081c6@suse.com>
 <53C69BD9-716C-4ECF-8287-75C435C561CE@arm.com>
 <749813e0-0b04-0ecf-5dc6-96cfe53c786b@xen.org>
 <752F9365-EB91-46AC-A2AD-060A630D8404@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b2fd97b-2d82-8af2-8e20-4a623b62447d@suse.com>
Date: Wed, 28 Oct 2020 16:49:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <752F9365-EB91-46AC-A2AD-060A630D8404@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.10.2020 16:47, Rahul Singh wrote:
> Ok. I will enable by default HAS_NS16550_PCI on X86 only. Once we have proper support for NS16550 PCI on ARM we can enable it at that time.
> I will modify as follows:
> 
> config HAS_NS16550_PCI                                                          
>     bool                                                                        
>     default y                                                                   

def_bool y

Jan

