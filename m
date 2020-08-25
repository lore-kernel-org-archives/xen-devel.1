Return-Path: <SRS0=XBNZ=CD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B516AC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 11:27:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DB3920715
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 11:27:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DB3920715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAX6R-0001N9-8a; Tue, 25 Aug 2020 11:26:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAX6P-0001N4-69
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 11:26:57 +0000
X-Inumbo-ID: 37c17114-26ea-4ac6-a6d2-411c916fa3b0
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37c17114-26ea-4ac6-a6d2-411c916fa3b0;
 Tue, 25 Aug 2020 11:26:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2ACC2AD04;
 Tue, 25 Aug 2020 11:27:26 +0000 (UTC)
Subject: Re: [PATCH v3 26/38] tools: move libxenctrl below tools/libs
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, xen-devel@dornerworks.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-27-jgross@suse.com> <20200825111631.GB1626@mail-itl>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <becf1709-57d3-444c-9647-cbe188e3985e@suse.com>
Date: Tue, 25 Aug 2020 13:26:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825111631.GB1626@mail-itl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 25.08.20 13:16, Marek Marczykowski-Górecki wrote:
> On Sun, Aug 23, 2020 at 11:35:07AM +0200, Juergen Gross wrote:
>> Today tools/libxc needs to be built after tools/libs as libxenctrl is
>> depending on some libraries in tools/libs. This in turn blocks moving
>> other libraries depending on libxenctrl below tools/libs.
>>
>> So carve out libxenctrl from tools/libxc and move it into
>> tools/libs/ctrl.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org> (stubdom parts)
> 
> Acked-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> (python parts)
> 
> Some other comments below.
> 
>> --- a/tools/libxc/Makefile
>> +++ b/tools/libxc/Makefile
>> @@ -9,47 +9,10 @@ ifeq ($(CONFIG_LIBXC_MINIOS),y)
>>   override CONFIG_MIGRATE := n
>>   endif
>>   
> ...
>> +LINK_FILES := xc_private.h xc_core.h xc_core_x86.h xc_core_arm.h xc_bitops.h
>> +
>> +$(LINK_FILES):
>> +	ln -sf $(XEN_ROOT)/tools/libs/ctrl/$(notdir $@) $@
> 
> Why symlinks instead of adjusting compiler flags?

I want to control which files are accessible.

> But then, if symlinks, why not commit them into git instead of creating at
> build time?

That's how it is done in the tree at other places.


Juergen

