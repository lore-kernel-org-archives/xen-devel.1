Return-Path: <SRS0=7n4I=7S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6EDC433DF
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 09:38:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4305D207D0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 09:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4305D207D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh8nt-00042o-Uw; Fri, 05 Jun 2020 09:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh8ns-00042j-2n
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 09:38:20 +0000
X-Inumbo-ID: 49c5030e-a710-11ea-af92-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49c5030e-a710-11ea-af92-12813bfff9fa;
 Fri, 05 Jun 2020 09:38:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AD08FAD1A;
 Fri,  5 Jun 2020 09:38:21 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9c6dba3-2780-b155-5b12-3eb44dc31957@suse.com>
Date: Fri, 5 Jun 2020 11:38:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200604014621.GA203658@mail-itl>
Content-Type: text/plain; charset=utf-8
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> (continuation of a thread from #xendevel)
> 
> During system shutdown quite often I hit infinite stream of errors like
> this:
> 
>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>     (XEN) domain_crash called from io.c:178
> 
> This is all running on Xen 4.13.0 (I think I've got this with 4.13.1
> too), nested within KVM. The KVM part means everything is very slow, so
> various race conditions are much more likely to happen.
> 
> It started happening not long ago, and I'm pretty sure it's about
> updating to qemu 4.2.0 (in linux stubdom), previous one was 3.0.0.
> 
> Thanks to Andrew and Roger, I've managed to collect more info.
> 
> Context:
>     dom0: pv
>     dom1: hvm
>     dom2: stubdom for dom1
>     dom3: hvm
>     dom4: stubdom for dom3
>     dom5: pvh
>     dom6: pvh
> 
> It starts I think ok:
> 
>     (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>     (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>     (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0

I can't seem to be able to spot the call site of this, in any of
qemu, libxl, or libxc. I'm in particular curious as to the further
actions taken on the domain after this was invoked: Do any ioreq
servers get unregistered immediately (which I think would be a
problem)?

Jan

