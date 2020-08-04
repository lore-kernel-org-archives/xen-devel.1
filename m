Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A639C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 15:54:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 100DC208A9
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 15:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 100DC208A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2zGB-00052G-Vx; Tue, 04 Aug 2020 15:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xzDE=BO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k2zGA-000528-M2
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 15:53:50 +0000
X-Inumbo-ID: a677f024-7f63-495c-b4e7-d28ce07d8cd1
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a677f024-7f63-495c-b4e7-d28ce07d8cd1;
 Tue, 04 Aug 2020 15:53:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17C00AF2A;
 Tue,  4 Aug 2020 15:54:05 +0000 (UTC)
Subject: Re: [PATCH] libxl: avoid golang building without CONFIG_GOLANG=y
To: Wei Liu <wl@xen.org>, Nick Rosbrook <rosbrookn@gmail.com>
References: <e8dd70a7-bdde-e12a-3f4d-f52e58016234@suse.com>
 <20200804141639.k2tpoqy7jj34gcm6@liuwe-devbox-debian-v2>
 <CAEBZRSf4opmGw2fDOCOMZLTtjisFXaP=Oe9aD6E2fTfUs2YFQQ@mail.gmail.com>
 <0deed4c6-ca87-09d3-a19c-ac0c00003cb7@suse.com>
 <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <12790d2b-020d-b6fe-4924-2233a4e93d83@suse.com>
Date: Tue, 4 Aug 2020 17:53:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804155043.vq7aupbrvmmcgzlv@liuwe-devbox-debian-v2>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 17:50, Wei Liu wrote:
> On Tue, Aug 04, 2020 at 05:30:40PM +0200, Jan Beulich wrote:
>> On 04.08.2020 17:22, Nick Rosbrook wrote:
>>> On Tue, Aug 4, 2020 at 10:17 AM Wei Liu <wl@xen.org> wrote:
>>>>
>>>> On Mon, Aug 03, 2020 at 10:06:32AM +0200, Jan Beulich wrote:
>>>>> While this doesn't address the real problem I've run into (attempting to
>>>>> update r/o source files), not recursing into tools/golang/xenlight/ is
>>>>> enough to fix the build for me for the moment. I don't currently see why
>>>>> 60db5da62ac0 ("libxl: Generate golang bindings in libxl Makefile") found
>>>>> it necessary to invoke this build step unconditionally.
>>>>>
>>>>
>>>> Perhaps an oversight?
>>>
>>> This is intentional, and I think the commit message in 60db5da62ac0
>>> ("libxl: Generate golang bindings in libxl Makefile") explains the
>>> reasoning well. But, to summarize, CONFIG_GOLANG is only used to
>>> control the bindings actually being compiled (i.e. with `go build`).
>>> However, we always want the code generation script
>>> (tools/golang/xenlight/gengotypes.py) to run if e.g.
>>> tools/libxl/libxl_types.idl is modified.
>>>
>>> I hope this helps.
>>
>> Not really - I'm still not seeing the "why" behind this behavior. I.e.
>> why build _anything_ that's not used further in the build, nor getting
>> installed? Also if (aiui) you effectively object to the change that
>> Wei has given his ack for, would you mind providing an alternative fix
>> for the problem at hand?
> 
> Is the solution here to make the target check if IDL definition file is
> actually changed before regenerating the bindings?

I don't know - Nick? A move-if-changed based approach would likely deal
with the r/o source problem at the same time (at least until such time
where the directory containing the file(s) is also r/o).

Jan

