Return-Path: <SRS0=v5y7=7C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19B0DC433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 11:11:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC926207C4
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2020 11:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC926207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbMcc-0007UH-PX; Wed, 20 May 2020 11:10:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4N77=7C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jbMcb-0007U9-DA
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 11:10:49 +0000
X-Inumbo-ID: 8ea4719a-9a8a-11ea-b07b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8ea4719a-9a8a-11ea-b07b-bc764e2007e4;
 Wed, 20 May 2020 11:10:48 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: eLO6tUA21tGf+7O4ReGpA9+cZahwiIW4E3ec2XRHNrbQv0yQ+RTToqplQ/0GyjN4tF3fCMbH4e
 bjt9fHJB8l6AJIaxN+UCNTBZ+OeeBzcwJAFlpkj+OX26jt3bOLQq+SrnPU4xZlVpLyAOJsMJ+J
 0ip7QbWnkLkiEvgCKrkIqipX0BA3osEBdHqaEcdtZAUBw27hL2XQeEjbqRhnnYDESygJ1MlR+D
 J3HoILODW7ctGCPBo3rIFW3P3djXteYvmPrVUcgF4YauViL/+3h/XLCTlUEUo6RtDAdKgCzuGe
 PzY=
X-SBRS: 2.7
X-MesageID: 18334345
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,413,1583211600"; d="scan'208";a="18334345"
Subject: Re: [BUG] Consistent LBR/TSX vmentry failure (0x80000022) calling
 domain_crash() in vmx.c:3324
To: Elliot Killick <elliotkillick@zohomail.eu>,
 <xen-devel@lists.xenproject.org>
References: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c715f89a-b2ba-490c-c027-b4c7d7069f42@citrix.com>
Date: Wed, 20 May 2020 12:10:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <36815795-223f-2b96-5401-c262294cbaa8@zohomail.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 20/05/2020 11:33, Elliot Killick wrote:
> Hello,
>
> Xen is crashing Windows 10 (64-bit) VMs consistently whenever IDA
> Debugger
> (https://www.hex-rays.com/products/ida/support/download_freeware/)
> launches the Local Windows Debugger. The crash occurs when trying to
> launch the debugger against any executable (e.g. calc.exe) right at the
> time IDA says it is "Moving segment from <X address> to <Y address>".
>
> Tested on Windows 7, 8 and Linux as well but the bug is only triggered
> on Windows 10. Happens whether or not IDA is running with administrator
> privileges. No drivers/VM tools installed. Windows has a bug check code
> of zero, leaves no memory dump, nothing in the logs from QEMU in Dom0,
> the domain just powers off immediately leaving a record of the incident
> in the hypervisor.log. So, it does appear to be a Xen issue. Modern
> Intel CPU.
>
> Does anyone have some ideas on what may be causing this?

What exact CPU do you have?  This looks exactly like the
Haswell/Broadwell TSX errata.

~Andrew

