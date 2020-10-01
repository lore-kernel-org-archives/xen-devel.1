Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC704C4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 09:40:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ACC22087D
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 09:40:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="EEgUIGJA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ACC22087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1150.3783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNv47-0000h9-Fn; Thu, 01 Oct 2020 09:39:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150.3783; Thu, 01 Oct 2020 09:39:55 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNv47-0000h2-C6; Thu, 01 Oct 2020 09:39:55 +0000
Received: by outflank-mailman (input) for mailman id 1150;
 Thu, 01 Oct 2020 09:39:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNv45-0000gw-Un
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:39:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1522ba7-08c0-4757-8027-20d3e9bf0d46;
 Thu, 01 Oct 2020 09:39:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=jQH2=DI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNv45-0000gw-Un
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 09:39:53 +0000
X-Inumbo-ID: b1522ba7-08c0-4757-8027-20d3e9bf0d46
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b1522ba7-08c0-4757-8027-20d3e9bf0d46;
	Thu, 01 Oct 2020 09:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601545193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Sy9RhktHhKCZPoO1SvVPs/IAQLIURM7MzqGmOAdgZzg=;
  b=EEgUIGJAAMwbGJQhAj1uMboWp1dlKzQFuFPypLgisbQu2XL9Gp6ZmU9S
   /R0qZm3p8n1U9u6D9FuHrFdlUPH3O5aV3UEG5i3RPFu0nrdTx98uNtMa9
   VQEjPdlvWQzZxcQiEAGKxAe6/dg4OY+TC+6b72c7PA9381jN+314SksfZ
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IaA5xlRhdTAheeutYCL7jlOOzM7g/xhjvC2zQvciPT/5e2O0ZyHRykRBh66w9otBVBHHV4HnPV
 puy9aUKniZdoDi3ldpH+JDHdTRQeViKOeG3fm0t5dO6leVvsZZMVwjGi1bdOjEh0lwujjoL0gn
 WMXCYk1bxbKHBhPVsGQ+G5aoqt0K92wlaMw4jVi7musKK1uUjbMx3RtfZtmbJh0UVacMpVKqzq
 LbZ9uL8RYJsLRTdTOiWUgXgk3PI6J4ec3ePtuRsH7XNfaBHz9VAwnIpweBkP3SrICF9FHMDmy0
 U5E=
X-SBRS: None
X-MesageID: 28323557
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,323,1596513600"; 
   d="scan'208";a="28323557"
Date: Thu, 1 Oct 2020 11:39:40 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/8] xen/domctl: Simplify DOMCTL_CDF_ checking logic
Message-ID: <20201001093940.GZ19254@Air-de-Roger>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200930134248.4918-3-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Wed, Sep 30, 2020 at 02:42:42PM +0100, Andrew Cooper wrote:
> Introduce some local variables to make the resulting logic easier to follow.
> Join the two IOMMU checks in sanitise_domain_config().  Tweak some of the
> terminology for better accuracy.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

On an unrelated note, we don't seem to sanitize iommu_opts in
sanitise_domain_config like we do for flags.

Thanks, Roger.

