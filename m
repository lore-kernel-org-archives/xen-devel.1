Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D88C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 13:49:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B0D206A2
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 13:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B0D206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg7HG-0008EH-Vc; Tue, 02 Jun 2020 13:48:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d8pY=7P=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jg7HF-0008EC-Sb
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 13:48:25 +0000
X-Inumbo-ID: bac12cbc-a4d7-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bac12cbc-a4d7-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 13:48:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 46143AC2D;
 Tue,  2 Jun 2020 13:48:26 +0000 (UTC)
Subject: Re: [PATCH-for-4.14 v2 1/2] xen: fix build with CONFIG_HYPFS_CONFIG
 enabled
To: Jan Beulich <jbeulich@suse.com>
References: <20200602125900.4424-1-jgross@suse.com>
 <20200602125900.4424-2-jgross@suse.com>
 <2b6e9630-8181-d035-cc32-4d4793f1a326@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ce3ac37e-d057-4a54-cf97-520cab4a87f8@suse.com>
Date: Tue, 2 Jun 2020 15:48:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2b6e9630-8181-d035-cc32-4d4793f1a326@suse.com>
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
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.20 15:02, Jan Beulich wrote:
> On 02.06.2020 14:58, Juergen Gross wrote:
>> Commit 58263ed7713e ("xen: add /buildinfo/config entry to hypervisor
>> filesystem") added a dependency to .config, but the hypervisor's build
>> config could be have another name via setting KCONFIG_CONFIG.
>>
>> Fix that by using $(KCONFIG_CONFIG) instead. Additionally reference
>> the config file via $(XEN_ROOT) instead of a relative path.
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
>> --- a/xen/common/Makefile
>> +++ b/xen/common/Makefile
>> @@ -75,7 +75,8 @@ obj-$(CONFIG_UBSAN) += ubsan/
>>   obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>>   obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>>   
>> -config.gz: ../.config
>> +CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/$(KCONFIG_CONFIG),$(KCONFIG_CONFIG))
> 
> ... I'll be tempted to shorten this to
> 
> CONF_FILE := $(if $(patsubst /%,,$(KCONFIG_CONFIG)),$(XEN_ROOT)/xen/)$(KCONFIG_CONFIG)

Yes, this is better.


Juergen

