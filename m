Return-Path: <SRS0=iZSu=OA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B195C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 10:06:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C85460F45
	for <xen-devel@archiver.kernel.org>; Fri, 10 Sep 2021 10:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C85460F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.184208.332769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdQV-0002iO-Vy; Fri, 10 Sep 2021 10:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184208.332769; Fri, 10 Sep 2021 10:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOdQV-0002iH-T5; Fri, 10 Sep 2021 10:06:31 +0000
Received: by outflank-mailman (input) for mailman id 184208;
 Fri, 10 Sep 2021 10:06:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OyUy=OA=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mOdQU-0002i8-7Z
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 10:06:30 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3ce0270-121e-11ec-b221-12813bfff9fa;
 Fri, 10 Sep 2021 10:06:29 +0000 (UTC)
Received: from [10.10.1.146] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631268383894215.78289560400754;
 Fri, 10 Sep 2021 03:06:23 -0700 (PDT)
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
X-Inumbo-ID: c3ce0270-121e-11ec-b221-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631268387; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BGmHo5Akbbsj/xfbtRFimf0JZCjDHbYhYHKHPW0NOKtl/fzRdxmefXas4bV1XI8GCuh+jE8Jx7pQwRqAe8qIOjc2QpCYFGXRP9//5attJzHVt3eP2SbBC8SQzo45u+u7QcoHHaOwkM1wm5bu2OmWTui7lIe6i0AoNnLHrttjDRI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631268387; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QEjZX0zuy3A6qMLNdFILZu10UrGIeNde2vBbeM+kN9o=; 
	b=QApNXB/zxGbP30KURDmIMh0dnCnqYG3EJVv87Ka8utwZ02vfTqgSkh5+BIpRfQIEC03eud4W/WAd99DrUcjkwUzeUgYaqrxGYcT78yki9JRBbgWLAqX+mcSxkTcmx0zZvaziZpwHzH+JYCNe1SbsAOY3kUSFy35mzPf6ugp73KA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631268387;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=QEjZX0zuy3A6qMLNdFILZu10UrGIeNde2vBbeM+kN9o=;
	b=aaDOgMpkKC1cnwT7Goy6XkFManh+q5T+kf91QZ4Z1oDm65DGs3wYwAbCyWeOAT88
	QnWfTej3vN/NqoIcn593E/qr3synyGj673E7i5OHN7ecsH2PwX/JUHW65ueRkgMSrL/
	TPVtNVsfVstCJKJROhZCTK/kaeT9mwpIpQc3rX34=
Subject: Re: [PATCH v5 05/10] xsm: apply coding style
To: Jan Beulich <jbeulich@suse.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>, xen-devel@lists.xenproject.org
References: <20210910021236.15082-1-dpsmith@apertussolutions.com>
 <20210910021236.15082-6-dpsmith@apertussolutions.com>
 <ea0a2e43-6c8c-bfcd-34aa-ec181600ea2d@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <dd15228e-529e-7de6-856a-964d469ef658@apertussolutions.com>
Date: Fri, 10 Sep 2021 06:04:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ea0a2e43-6c8c-bfcd-34aa-ec181600ea2d@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 9/10/21 2:15 AM, Jan Beulich wrote:
> On 10.09.2021 04:12, Daniel P. Smith wrote:
>> @@ -70,7 +73,7 @@ void __xsm_action_mismatch_detected(void);
>>   #endif /* CONFIG_XSM */
>>   
>>   static always_inline int xsm_default_action(
>> -    xsm_default_t action, struct domain *src, struct domain *target)
>> +	xsm_default_t action, struct domain *src, struct domain *target)
> 
> Here and below you're now introducing hard tabs. In Xen style
> we don't ever use hard tabs for indentation; this is limited to
> files inherited from elsewhere.
> 
> It's also not clear why you've touched this instance at all:
> The 4 chars indentation was correct already, as previously
> pointed out by Andrew (on perhaps a different example).
> 
> Jan
> 

I honestly don't know what is going on. Since right now my primary focus 
is on Xen, I have my vimrc set to 4 space tabs with expand tabs and I am 
not manually changing. I will retab the file in the next submission.

v/r,
dps

