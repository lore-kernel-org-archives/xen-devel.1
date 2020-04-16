Return-Path: <SRS0=l70B=6A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE1C6C2BB55
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 11:25:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C45C421841
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2020 11:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="6tAAO8Hz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C45C421841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP2eK-00069X-PL; Thu, 16 Apr 2020 11:25:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FuWY=6A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jP2eJ-00069N-Vc
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 11:25:40 +0000
X-Inumbo-ID: fffcf81a-7fd4-11ea-8b78-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fffcf81a-7fd4-11ea-8b78-12813bfff9fa;
 Thu, 16 Apr 2020 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tux4Pn7DtfiIM2J0xf+G6osHvsBjKxGAxQwcCieWLj4=; b=6tAAO8HznTTTyUOUdBmPmz1j+B
 TXe4DcqHQSdA/XWaUiGKePtwHhGaLYNkgZlq9oRjpqu3Gt2/k7t9mtx7lzn9l4PG8+0Whzb/wM0NH
 u9Hx6/eFZevs0ze7zLewVYUF8cmajK5MAHeq9yd8gd4Pry20BPcOutNyWnqyC8y5vTQY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP2eC-0002gP-0m; Thu, 16 Apr 2020 11:25:32 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jP2eB-0003A2-P4; Thu, 16 Apr 2020 11:25:31 +0000
Subject: Re: [PATCH 0/8] Fix build with using OCaml 4.06.1 and -safe-string
To: xen-devel@lists.xenproject.org,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <20200330192157.1335-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <67d3370c-779a-7007-e5fa-98d957a85ce9@xen.org>
Date: Thu, 16 Apr 2020 12:25:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200330192157.1335-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, dfaggioli@suse.com,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

Gentle ping. I am missing reviews for the OCaml part.

Cheers,

On 30/03/2020 20:21, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This series is meant to solve the build issue reported by Dario when
> using recent version of OCaml and -safe-string.
> 
> I took the opportunity to harden a bit more the code by using const more
> often.
> 
> This series was only build tested.
> 
> Cheers,
> 
> Julien Grall (8):
>    xen/guest_access: Harden copy_to_guest_offset to prevent const dest
>      operand
>    xen/public: sysctl: set_parameter.params and debug.keys should be
>      const
>    tools/libxc: misc: Mark const the parameter 'keys' of
>      xc_send_debug_keys()
>    tools/libxc: misc: Mark const the parameter 'params' of
>      xc_set_parameters()
>    tools/ocaml: libxc: Check error return in stub_xc_vcpu_context_get()
>    tools/ocaml: libxb: Harden stub_header_of_string()
>    tools/ocaml: libxb: Avoid to use String_val() when value is bytes
>    tools/ocaml: Fix stubs build when OCaml has been compiled with
>      -safe-string
> 
>   tools/libxc/include/xenctrl.h       |  4 ++--
>   tools/libxc/xc_misc.c               |  8 ++++----
>   tools/libxc/xc_private.h            |  8 ++++++++
>   tools/ocaml/libs/xb/xenbus_stubs.c  |  6 +++---
>   tools/ocaml/libs/xb/xs_ring_stubs.c | 12 ++++++++++--
>   tools/ocaml/libs/xc/xenctrl_stubs.c |  6 ++++--
>   xen/include/asm-arm/guest_access.h  |  2 +-
>   xen/include/asm-x86/guest_access.h  |  2 +-
>   xen/include/public/sysctl.h         |  4 ++--
>   9 files changed, 35 insertions(+), 17 deletions(-)
> 

-- 
Julien Grall

