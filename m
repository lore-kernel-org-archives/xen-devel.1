Return-Path: <SRS0=HK45=7H=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28811C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 25 May 2020 17:00:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007002073B
	for <xen-devel@archiver.kernel.org>; Mon, 25 May 2020 17:00:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007002073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdGS2-0006Jn-Pq; Mon, 25 May 2020 16:59:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pvIA=7H=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jdGS1-0006JW-V8
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 16:59:45 +0000
X-Inumbo-ID: 1f3be284-9ea9-11ea-aef9-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1f3be284-9ea9-11ea-aef9-12813bfff9fa;
 Mon, 25 May 2020 16:59:40 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:42506
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jdGRu-0000n7-M1 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Mon, 25 May 2020 17:59:38 +0100
Subject: Re: Xen PVH domU start-of-day VCPU state
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, mirageos-devel@lists.xenproject.org,
 anil@recoil.org, dave@recoil.org
References: <20200525160401.GA3091@nodbug.lucina.net>
 <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6a22e477-c9e7-f0d7-6cb1-615137a778be@citrix.com>
Date: Mon, 25 May 2020 17:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a17fef73-382c-50b3-1e6b-5904fc3bf60f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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

On 25/05/2020 17:42, Jürgen Groß wrote:
> On 25.05.20 18:04, Martin Lucina wrote:
>> Hi,
>>
>> I'm trying to bootstrap a new PVH-only Xen domU OS "from scratch", to
>> replace our existing use of Mini-OS for the early boot/low-level support
>> layer in MirageOS. I've done this by creating new Xen bindings for Solo5
>> [1], basing them on our existing virtio code [2].
>>
>> Unfortunately, I can't seem to get past the first few instructions on
>> VCPU
>> boot. Here's what I have at the moment (abridged):
>>
>>      .section .note.solo5.xen
>>
>>              .align  4
>>              .long   4
>>              .long   4
>>              .long   XEN_ELFNOTE_PHYS32_ENTRY
>>              .ascii "Xen\0"
>>              .long   _start32
>>
>>      /* ... */
>>
>>      .code32
>>
>>      ENTRY(_start32)
>>              cld
>>
>>              lgdt (gdt64_ptr)
>>              ljmp $0x10, $1f
>
> You need to setup virtual addressing and enable 64 bit mode before using
> 64-bit GDT.
>
> See Mini-OS source arch/x86/x86_hvm.S

Or
https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=blob;f=arch/x86/hvm/head.S;h=f7dc72b58ab9ec68538f0087969ab6f72d181d80;hb=HEAD

But yes - Juergen is correct.  Until you have enabled long mode, lgdt
will only load the bottom 32 bits of GDTR.base.

Is there a less abridged version to look at?

~Andrew

