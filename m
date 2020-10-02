Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46927C47425
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 12:32:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEE5A20719
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 12:32:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="asYBeV9n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEE5A20719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2046.6135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOKDs-0003Ww-Es; Fri, 02 Oct 2020 12:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2046.6135; Fri, 02 Oct 2020 12:31:40 +0000
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
	id 1kOKDs-0003Wp-Bx; Fri, 02 Oct 2020 12:31:40 +0000
Received: by outflank-mailman (input) for mailman id 2046;
 Fri, 02 Oct 2020 12:31:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOKDr-0003Wk-Oa
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:31:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c417eb15-30b8-4870-8f05-b7feebfccf27;
 Fri, 02 Oct 2020 12:31:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5140DAC6D;
 Fri,  2 Oct 2020 12:31:38 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOKDr-0003Wk-Oa
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 12:31:39 +0000
X-Inumbo-ID: c417eb15-30b8-4870-8f05-b7feebfccf27
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c417eb15-30b8-4870-8f05-b7feebfccf27;
	Fri, 02 Oct 2020 12:31:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601641898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNOz+1P9pqyTZrGccFA7iVYQln8SAIGLyY/tKcHVFV8=;
	b=asYBeV9nWCwzptOPNc9Nzp7dDj7y2zuqoWyQ79uPmsDAH9FcAgAwEYHQhOC1GzpQmKVhLO
	ENhnUNkfLY+kcjhKY63SuGyzy4vTT24nV3W70dqDwIT9sQAuYquprVFB2ytnznoNBGtzLj
	JVtqh/rOQlT7xcgznP2rnZnRE6TfqVI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5140DAC6D;
	Fri,  2 Oct 2020 12:31:38 +0000 (UTC)
Subject: Re: [PATCH 3/3] x86/vLAPIC: vlapic_init() runs only once for a vCPU
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1a55f2f0-f0aa-4a33-1219-1091ed9150df@suse.com>
 <3735eb75-76ef-abff-1b05-aa89ddc39fcc@suse.com>
 <03ab138c-5608-ba4e-90ae-5d7bcdfd6bd9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd4bd18e-d179-7ad1-edd2-3ad1520268e7@suse.com>
Date: Fri, 2 Oct 2020 14:31:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <03ab138c-5608-ba4e-90ae-5d7bcdfd6bd9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.10.2020 13:19, Andrew Cooper wrote:
> On 02/10/2020 11:31, Jan Beulich wrote:
>> Hence there's no need to guard allocation / mapping by checks whether
>> the same action has been done before. I assume this was a transient
>> change which should have been undone before 509529e99148 ("x86 hvm: Xen
>> interface and implementation for virtual S3") got committed.
>>
>> While touching this code, switch dprintk()-s to use %pv.
> 
> Logging ENOMEM, especially without actually saying ENOMEM, is quite
> pointless.
> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably with
> the printk()s dropped.

Thanks, and sure - I'll be happy to drop them. Just didn't want to
make more of a change than needed, and them being dprintk()-s didn't
make them look all that awful.

Jan


