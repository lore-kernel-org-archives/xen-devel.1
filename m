Return-Path: <SRS0=v0KR=OH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8C5C433F5
	for <xen-devel@archiver.kernel.org>; Fri, 17 Sep 2021 13:20:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B8461212
	for <xen-devel@archiver.kernel.org>; Fri, 17 Sep 2021 13:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3B8461212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=apertussolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.189401.339080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDmd-0003IV-31; Fri, 17 Sep 2021 13:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 189401.339080; Fri, 17 Sep 2021 13:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mRDmc-0003IO-Ve; Fri, 17 Sep 2021 13:20:02 +0000
Received: by outflank-mailman (input) for mailman id 189401;
 Fri, 17 Sep 2021 13:20:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y96v=OH=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1mRDmb-00036j-SA
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 13:20:02 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5b01a94-17b9-11ec-b6a0-12813bfff9fa;
 Fri, 17 Sep 2021 13:20:00 +0000 (UTC)
Received: from [10.10.1.24] (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1631884791627845.5371428471088;
 Fri, 17 Sep 2021 06:19:51 -0700 (PDT)
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
X-Inumbo-ID: f5b01a94-17b9-11ec-b6a0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; t=1631884797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YpJjkWR2KTeCl/tPoVDK4LqnKEAIAvj/+YPvDIeCeQqsgbEIXnufveLZUqHHfamyEoHP+vIK2eOG7/nPLQ0MEV4/kPicFTG97nwCC24kKveskpB0SQEZm01N7tRIR+37zGD2yLau3cKnxtSKwpfhjbOwnHo+aBl430mfXqhbOgo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1631884797; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HhssghJGx7/IL6SOq974BeYYZj6SlieVg2iEnlJF4po=; 
	b=XMGUN8IV0QJRRPRm7A0osGc9/dzvtPllTASogOsA6IfDkY+RL4t8warNZD2w48KljrgTBmvJyWaMIyAO6CHfgKNTs/73ts9wtuHH5cXfXdaP65c9sYK8Qje6syh9mLl+LerFE+MVqTpWRILgzAxx2nOTHPVXemV5MbRIak9ZMuA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1631884797;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=HhssghJGx7/IL6SOq974BeYYZj6SlieVg2iEnlJF4po=;
	b=CnINWBt1FD+9eazMkK8mRprHOW/s0VqV1inbL2elvY52RBMGhCELXAwcOsr53qOz
	Ok9741p8gUMnJAx8opfyAblujVmxxsHge/pTDV5Dyxh2AVCR1w6o3MZIbuX4Ftirqao
	Z9exR3reqZeJcYUJFqthkHY5e6jIGQbak+HAjeU8=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 xen-devel@lists.xenproject.org
References: <20210910201305.32526-1-dpsmith@apertussolutions.com>
 <20210910201305.32526-10-dpsmith@apertussolutions.com>
 <33d87667-4be7-0ec8-0c1e-f773d77f2d72@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v6 09/10] kconfig: update xsm config to reflect reality
Message-ID: <7b6c830f-c4b3-3fef-a1ed-0d557eeacf52@apertussolutions.com>
Date: Fri, 17 Sep 2021 09:19:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <33d87667-4be7-0ec8-0c1e-f773d77f2d72@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 9/17/21 8:09 AM, Jan Beulich wrote:
> On 10.09.2021 22:13, Daniel P. Smith wrote:
>> --- a/xen/common/Kconfig
>> +++ b/xen/common/Kconfig
>> @@ -200,23 +200,20 @@ config XENOPROF
>>  
>>  	  If unsure, say Y.
>>  
>> -config XSM
>> -	bool "Xen Security Modules support"
>> +config XSM_CONFIGURABLE
>> +	bool "Configure Xen Security Modules"
>>  	default ARM
>> -	---help---
>> -	  Enables the security framework known as Xen Security Modules which
>> -	  allows administrators fine-grained control over a Xen domain and
>> -	  its capabilities by defining permissible interactions between domains,
>> -	  the hypervisor itself, and related resources such as memory and
>> -	  devices.
>> +	help
>> +	  Allows for configuring the Xen Security Modules (XSM) policy or policies
>> +	  modules that will be availble and which will be the default.
>>  
>>  	  If unsure, say N.
>>  
>>  config XSM_FLASK
>> -	def_bool y
>> -	prompt "FLux Advanced Security Kernel support"
>> -	depends on XSM
>> -	---help---
>> +	bool "FLux Advanced Security Kernel support"
>> +	depends on XSM_CONFIGURABLE
>> +	select XSM_EVTCHN_LABELING
>> +	help
>>  	  Enables FLASK (FLux Advanced Security Kernel) as the access control
>>  	  mechanism used by the XSM framework.  This provides a mandatory access
>>  	  control framework by which security enforcement, isolation, and
> 
> I continue to think that the default here and ...
> 
>> @@ -253,10 +250,10 @@ config XSM_FLASK_POLICY
>>  	  If unsure, say Y.
>>  
>>  config XSM_SILO
>> -	def_bool y
>> -	prompt "SILO support"
>> -	depends on XSM
>> -	---help---
>> +	bool "SILO support"
>> +	default y if ARM
>> +	depends on XSM_CONFIGURABLE
>> +	help
>>  	  Enables SILO as the access control mechanism used by the XSM framework.
>>  	  This is not the default module, add boot parameter xsm=silo to choose
>>  	  it. This will deny any unmediated communication channels (grant tables
> 
> ... here should not change. If it changes, the change needs justifying
> in the description.

IMHO the configure system should not presumptuously assume that if a
user selects XSM_CONFIGURABLE that the Flask module, which is not
currently security supported, should be enabled. I would agree that we
could turn on the SILO module since it is security supported. Later when
I am able to get Flask into a security supported state, I would be all
for enabling it as well. A more roadmap-ish idea is to see SILO subsumed
as a select-able policy under Flask, but that is a bit of a digression.

I will add to the commit message to clarify this position that is being
encoded.

>> @@ -282,15 +279,15 @@ endchoice
>>  config LATE_HWDOM
>>  	bool "Dedicated hardware domain"
>>  	default n
>> -	depends on XSM && X86
>> -	---help---
>> +	depends on XSM_FLASK && X86
>> +	help
>>  	  Allows the creation of a dedicated hardware domain distinct from
>>  	  domain 0 that manages devices without needing access to other
>>  	  privileged functionality such as the ability to manage domains.
>>  	  This requires that the actual domain 0 be a stub domain that
>>  	  constructs the actual hardware domain instead of initializing the
>>  	  hardware itself.  Because the hardware domain needs access to
>> -	  hypercalls not available to unprivileged guests, an XSM policy
>> +	  hypercalls not available to unprivileged guests, an XSM Flask policy
>>  	  is required to properly define the privilege of these domains.
> 
> I also continue to think that this would better be a separate change.
> Or if not, the seemingly unrelated change needs mentioning in the
> description (to make clear it's not a stray change).

Apologies that I missed the suggestion to break this out. Since this
really is more of a general clean-up over being part of the intended
improvement for this patch set, I will break it out and move it to the
front of the patch set.

v/r,
dps


