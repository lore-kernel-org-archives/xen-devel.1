Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FF9C433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 12:36:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8325D206A2
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 12:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8325D206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg69O-00006X-Qw; Tue, 02 Jun 2020 12:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fJyN=7P=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jg69N-00006P-Jt
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 12:36:13 +0000
X-Inumbo-ID: a46c1dbe-a4cd-11ea-abe9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a46c1dbe-a4cd-11ea-abe9-12813bfff9fa;
 Tue, 02 Jun 2020 12:36:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D8C2EAA7C;
 Tue,  2 Jun 2020 12:36:13 +0000 (UTC)
Subject: Re: [PATCH-for-4.14 1/2] xen: fix build with CONFIG_HYPFS_CONFIG
 enabled
To: Wei Liu <wl@xen.org>
References: <20200602114050.5964-1-jgross@suse.com>
 <20200602114050.5964-2-jgross@suse.com>
 <d6c1360e-6ecd-7dda-554d-dced4767deaa@suse.com>
 <20200602120726.vm3br27ygbvbs2bx@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b8db01f-3cd0-ac09-210f-a9cfbe2ce447@suse.com>
Date: Tue, 2 Jun 2020 14:36:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200602120726.vm3br27ygbvbs2bx@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
Content-Type: text/plain; charset=utf-8
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 14:07, Wei Liu wrote:
> On Tue, Jun 02, 2020 at 01:55:14PM +0200, Jan Beulich wrote:
>> On 02.06.2020 13:40, Juergen Gross wrote:
>>> --- a/xen/common/Makefile
>>> +++ b/xen/common/Makefile
>>> @@ -75,7 +75,7 @@ obj-$(CONFIG_UBSAN) += ubsan/
>>>  obj-$(CONFIG_NEEDS_LIBELF) += libelf/
>>>  obj-$(CONFIG_HAS_DEVICE_TREE) += libfdt/
>>>  
>>> -config.gz: ../.config
>>> +config.gz: $(XEN_ROOT)/xen/$(KCONFIG_CONFIG)
>>
>> Looking at all pre-existing uses of KCONFIG_CONFIG this is the
>> first one assuming it holds a relative path. The doc also doesn't
>> indicate it can't be an absolute one.
> 
> This is not an objection to this patch right?

It is.

Jan

