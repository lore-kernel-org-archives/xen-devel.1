Return-Path: <SRS0=xDB7=64=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B6CC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2020 09:53:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA76420727
	for <xen-devel@archiver.kernel.org>; Thu, 14 May 2020 09:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA76420727
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZAXk-0007a6-Ms; Thu, 14 May 2020 09:52:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WGWk=64=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jZAXj-0007a0-95
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:52:43 +0000
X-Inumbo-ID: a72e4f5e-95c8-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a72e4f5e-95c8-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 09:52:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EF2B2AF10;
 Thu, 14 May 2020 09:52:43 +0000 (UTC)
Subject: Re: [PATCH v8 08/12] xen: add /buildinfo/config entry to hypervisor
 filesystem
To: Jan Beulich <jbeulich@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-9-jgross@suse.com>
 <2e963c64-a2f0-dde7-ef3d-fd6e91c6e520@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d77dc23c-3408-8956-af62-b30ed83a9dfd@suse.com>
Date: Thu, 14 May 2020 11:52:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2e963c64-a2f0-dde7-ef3d-fd6e91c6e520@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14.05.20 11:32, Jan Beulich wrote:
> On 08.05.2020 17:34, Juergen Gross wrote:
>> Add the /buildinfo/config entry to the hypervisor filesystem. This
>> entry contains the .config file used to build the hypervisor.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a remark and one further adjustment:
> 
>> @@ -73,3 +74,14 @@ obj-$(CONFIG_UBSAN) += ubsan/
>>   
>>   obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>>   obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>> +
>> +config.gz: ../.config
>> +	gzip -c $< >$@
>> +
>> +config_data.o: config.gz
>> +
>> +config_data.S: $(XEN_ROOT)/xen/tools/binfile
>> +	$(XEN_ROOT)/xen/tools/binfile $@ config.gz xen_config_data
> 
> This will want changing to the changed build infrastructure, such
> that in default (non-verbose, non-silent) mode a line gets output
> to stdout. But I'd be fine with this getting done subsequently.
> 
>> --- a/xen/include/xen/kernel.h
>> +++ b/xen/include/xen/kernel.h
>> @@ -100,5 +100,8 @@ extern enum system_state {
>>   
>>   bool_t is_active_kernel_text(unsigned long addr);
>>   
>> +extern const char xen_config_data;
> 
> Surely you meant to add [] here, and then possibly omit the & on
> the line using the symbol?

Of course. ;-p


Juergen


