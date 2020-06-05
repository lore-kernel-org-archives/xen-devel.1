Return-Path: <SRS0=7n4I=7S=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB786C433E0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 09:23:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98DDC20772
	for <xen-devel@archiver.kernel.org>; Fri,  5 Jun 2020 09:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98DDC20772
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh8Ys-0002wr-Ih; Fri, 05 Jun 2020 09:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jh8Yr-0002wk-4B
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 09:22:49 +0000
X-Inumbo-ID: 1f0b13bc-a70e-11ea-ba62-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f0b13bc-a70e-11ea-ba62-bc764e2007e4;
 Fri, 05 Jun 2020 09:22:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 00B61AFC8;
 Fri,  5 Jun 2020 09:22:50 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
Message-ID: <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
Date: Fri, 5 Jun 2020 11:22:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 11:09, Jan Beulich wrote:
> On 04.06.2020 16:25, Marek Marczykowski-Górecki wrote:
>> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
>> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
>> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
>> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
>> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
>> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> 
> Perhaps in this message could you also log
> v->domain->is_shutting_down, v->defer_shutdown, and
> v->paused_for_shutdown?

And v->domain->is_shut_down please.

Jan

