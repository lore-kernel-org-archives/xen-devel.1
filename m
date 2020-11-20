Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F1BC5519F
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 15:09:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E60D722226
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 15:09:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="hnyHRe97"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E60D722226
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.32299.63334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg823-0006Je-VX; Fri, 20 Nov 2020 15:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32299.63334; Fri, 20 Nov 2020 15:09:03 +0000
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
	id 1kg823-0006JX-SR; Fri, 20 Nov 2020 15:09:03 +0000
Received: by outflank-mailman (input) for mailman id 32299;
 Fri, 20 Nov 2020 15:09:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg823-0006JS-6F
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:09:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a84c3203-3054-4c88-92bb-461f5f406404;
 Fri, 20 Nov 2020 15:09:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 85138AB3D;
 Fri, 20 Nov 2020 15:09:01 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg823-0006JS-6F
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 15:09:03 +0000
X-Inumbo-ID: a84c3203-3054-4c88-92bb-461f5f406404
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a84c3203-3054-4c88-92bb-461f5f406404;
	Fri, 20 Nov 2020 15:09:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605884941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MKDHEUQBokxra7DPVEaE5cAh4CiadQJVXPCoj2eiT8s=;
	b=hnyHRe97c7xWMUlkBgZzWRl1UUpSI5OZdY/p0K0IKYWhc7Q7hyN0f1s6T8Zz1LSAGhX58s
	2MDOXMQOxuRaaLAKf5SeZzpJUWOvQTn3ZARHqyWwSWNQiw/Mc5ujSUNcRPCcl9n1TvSktB
	n4N+MRDpBjy5a7ceC0lXaOGq6l3q3Ho=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 85138AB3D;
	Fri, 20 Nov 2020 15:09:01 +0000 (UTC)
Subject: Re: [PATCH v2 05/12] viridian: use hypercall_vpmask in hvcall_ipi()
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20201120094900.1489-1-paul@xen.org>
 <20201120094900.1489-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a7e118c7-2b72-98f8-19a1-82667c47f44f@suse.com>
Date: Fri, 20 Nov 2020 16:09:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120094900.1489-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 10:48, Paul Durrant wrote:
> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -551,6 +551,25 @@ static bool vpmask_test(const struct hypercall_vpmask *vpmask,
>      return test_bit(vp, vpmask->mask);
>  }
>  
> +static unsigned int vpmask_first(struct hypercall_vpmask *vpmask)

Now this and ...

> +{
> +    return find_first_bit(vpmask->mask, HVM_MAX_VCPUS);
> +}
> +
> +static unsigned int vpmask_next(struct hypercall_vpmask *vpmask, unsigned int vp)

... this should really have pointers to const as parameters.

> @@ -631,13 +650,21 @@ static int hvcall_flush(union hypercall_input *input,
>      return 0;
>  }
>  
> +static void send_ipi(struct hypercall_vpmask *vpmask, uint8_t vector)

And I guess this one should, too.

Jan

