Return-Path: <SRS0=VPcc=CU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C0A7C433E2
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2020 09:32:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1CFF20855
	for <xen-devel@archiver.kernel.org>; Fri, 11 Sep 2020 09:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1CFF20855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGfOt-00051X-EN; Fri, 11 Sep 2020 09:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eh3a=CU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGfOr-00051S-UA
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 09:31:21 +0000
X-Inumbo-ID: adb11b12-74cd-4f2e-bfe5-aa75680589a2
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adb11b12-74cd-4f2e-bfe5-aa75680589a2;
 Fri, 11 Sep 2020 09:31:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7CF97B39A;
 Fri, 11 Sep 2020 09:31:35 +0000 (UTC)
Subject: Re: [PATCH] xen/hypfs: fix writing of custom parameter
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20200911053043.29445-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b4b5fc2-e849-0dc8-8cc1-5000106d2be7@suse.com>
Date: Fri, 11 Sep 2020 11:31:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911053043.29445-1-jgross@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.09.2020 07:30, Juergen Gross wrote:
> Today the maximum allowed data length for writing a hypfs node is
> tested in the generic hypfs_write() function. For custom runtime
> parameters this might be wrong, as the maximum allowed size is derived
> from the buffer holding the current setting, while there might be ways
> to set the parameter needing more characters than the minimal
> representation of that value.
> 
> One example for this is the "ept" parameter. Its value buffer is sized
> to be able to hold the string "exec-sp=0" or "exec-sp=1", while it is
> allowed to use e.g. "no-exec-sp" or "exec-sp=yes" for setting it.
> 
> Fix that by moving the length check one level down to the type
> specific write function.
> 
> In order to avoid allocation of arbitrary sized buffers use a new
> MAX_PARAM_SIZE macro as an upper limit for custom writes. The value
> of MAX_PARAM_SIZE is the same as the limit in parse_params() for a
> single parameter.
> 
> Fixes: 5b5ccafb0c42 ("xen: add basic hypervisor filesystem support")

Perhaps rather a659d7cab9af ("xen: add runtime parameter access
support to hypfs"), as that where hypfs_write_custom() got introduced?

> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

