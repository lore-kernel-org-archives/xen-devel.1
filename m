Return-Path: <SRS0=2i39=LL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD67C2B9F4
	for <xen-devel@archiver.kernel.org>; Thu, 17 Jun 2021 12:55:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E2661351
	for <xen-devel@archiver.kernel.org>; Thu, 17 Jun 2021 12:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E2661351
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ipxe.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.143975.265097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltrY8-0004rI-J5; Thu, 17 Jun 2021 12:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143975.265097; Thu, 17 Jun 2021 12:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltrY8-0004rB-GA; Thu, 17 Jun 2021 12:55:12 +0000
Received: by outflank-mailman (input) for mailman id 143975;
 Thu, 17 Jun 2021 12:55:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nXfV=LL=ipxe.org=mcb30@srs-us1.protection.inumbo.net>)
 id 1ltrY7-0004r5-H8
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 12:55:11 +0000
Received: from blyat.fensystems.co.uk (unknown
 [2a05:d018:a4d:6403:2dda:8093:274f:d185])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8632a62c-0b59-47a1-a6c8-823fb41cdea7;
 Thu, 17 Jun 2021 12:55:10 +0000 (UTC)
Received: from pudding.home (unknown [213.205.240.250])
 by blyat.fensystems.co.uk (Postfix) with ESMTPSA id 0B10544175;
 Thu, 17 Jun 2021 12:55:06 +0000 (UTC)
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
X-Inumbo-ID: 8632a62c-0b59-47a1-a6c8-823fb41cdea7
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC11
To: "Bernhard M. Wiedemann" <bwiedemann@suse.de>, Olaf Hering <olaf@aepfle.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210615212613.6270-1-olaf@aepfle.de>
 <b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
 <20210616145846.305d3ce1.olaf@aepfle.de>
 <fe5ac73a-6026-6db6-6756-911f803adc5f@suse.de>
From: Michael Brown <mcb30@ipxe.org>
Message-ID: <d8a47c67-0ff3-4fce-5fe5-d444c4c4f859@ipxe.org>
Date: Thu, 17 Jun 2021 13:55:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fe5ac73a-6026-6db6-6756-911f803adc5f@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16/06/2021 14:33, Bernhard M. Wiedemann wrote:
> So this means, CentOS7 binutils has
> 9cb80f72d8b from 2011-12-21
> but not
> git blame binutils/objcopy.c|grep enable-determini
> 955d0b3bd75 (Roland McGrath       2013-01-07 17:40:59 +0000  549)   -D
> --enable-deterministic-archives\n\
> 2e30cb575a1 (Cary Coutant         2012-04-25 17:50:14 +0000  555)   -D
> --enable-deterministic-archives\n\
> 
> one way out could be to call objcopy -D $PARAMS || objcopy $PARAMS

Testing on a clean "centos:7" container shows that "objcopy -D" works as 
expected (and "objcopy --help" shows the option as existing).

This container environment has /etc/centos-release showing:

   CentOS Linux release 7.6.1810 (Core)

Could you provide a simple environment in which to reproduce the problem?

Thanks,

Michael

