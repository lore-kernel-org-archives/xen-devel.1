Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA903C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 12:44:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D67D64D9E
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 12:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D67D64D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.78121.141963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5T87-0007NK-KK; Fri, 29 Jan 2021 12:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78121.141963; Fri, 29 Jan 2021 12:44:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5T87-0007ND-G4; Fri, 29 Jan 2021 12:44:03 +0000
Received: by outflank-mailman (input) for mailman id 78121;
 Fri, 29 Jan 2021 12:44:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9cT=HA=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1l5T85-0007Lp-P9
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 12:44:01 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 863be2c2-2368-434e-8e82-9a29faa2432b;
 Fri, 29 Jan 2021 12:44:00 +0000 (UTC)
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
X-Inumbo-ID: 863be2c2-2368-434e-8e82-9a29faa2432b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611924240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QZleGI5lj5ZmHtp6aSH7b9gX/M0++5Q0jdFJsJs4Uds=;
  b=LEr2IioaOGbwnCdVTOjRsezBv+z3TuvNtCMN6oBgkg/nXaLPTmMIdvXy
   jOjP6E6fmHExCmPlUwMfblaErcpSVjemSaHfFWgtGcVu567WOZ/dPTx+u
   Zosgso0wL2MvQSAHTQ2T3+QeGX62n9OV/WOELwLiI1hFfY26fgeXirwwi
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Cez0SJizac96veCCl/4A72hajIjnZLRPhW2XJFXiIkjp71Tu0SUWv32+Nq/J4oRRYG3KkPQi7v
 5l/ytV8XuEB1t/6sy4ofBKVS40IBvihjVBkbQAfTiGEgiccEuJBvpatE5VMsDALrSIhgThkc4/
 iWKKkx5ndXcU+bRPGy1GnrHfDVlg5axdlZyhLy74zIwmG61GN8LgEBSjd0jaoR7ZH48mfpVbZz
 +3FaV5vhWJ6VO4icOT++xanrSlOo7Hi5MIGy0rFURs16Vgdxph9PrZIQNNgE/sOqNCtx1MJomF
 bVo=
X-SBRS: 5.1
X-MesageID: 36348684
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,385,1602561600"; 
   d="scan'208";a="36348684"
Date: Fri, 29 Jan 2021 12:43:55 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>, <wl@xen.org>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <sstabellini@kernel.org>, <paul@xen.org>,
	<roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] viridian: remove implicit limit of 64 VPs per
 partition
Message-ID: <YBQDCxUgyUOtc2C4@perard.uk.xensource.com>
References: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1610425048-990-1-git-send-email-igor.druzhinin@citrix.com>

On Tue, Jan 12, 2021 at 04:17:27AM +0000, Igor Druzhinin wrote:
> TLFS 7.8.1 stipulates that "a virtual processor index must be less than
> the maximum number of virtual processors per partition" that "can be obtained
> through CPUID leaf 0x40000005". Furthermore, "Requirements for Implementing
> the Microsoft Hypervisor Interface" defines that starting from Windows Server
> 2012, which allowed more than 64 CPUs to be brought up, this leaf can now
> contain a value -1 basically assuming the hypervisor has no restriction while
> 0 (that we currently expose) means the default restriction is still present.
> 
> Along with the previous changes exposing ExProcessorMasks this allows a recent
> Windows VM with Viridian extension enabled to have more than 64 vCPUs without
> going into BSOD in some cases.
> 
> Since we didn't expose the leaf before and to keep CPUID data consistent for
> incoming streams from previous Xen versions - let's keep it behind an option.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

