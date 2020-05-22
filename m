Return-Path: <SRS0=Ri3b=7E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438A0C433DF
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 08:30:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07FDB207FB
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2020 08:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07FDB207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc33s-0007LH-Tw; Fri, 22 May 2020 08:29:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc33s-0007LB-A7
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 08:29:48 +0000
X-Inumbo-ID: 6466b7ef-9c06-11ea-ab9a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6466b7ef-9c06-11ea-ab9a-12813bfff9fa;
 Fri, 22 May 2020 08:29:46 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HUwpCuqjl1gvR5QYmSxkcaTLLvGqV49ZsNtttLIaQ8j2NZBrxfqKvfDj0oSEr+zg+7Rz/U3+Ty
 3i/d8s8mzDfLYk2sDqI+O1Ehlxe42DlypJ/v4L4u5Q3C0xWA+Ur4k3MYw18WiftPbLNgC5SmMJ
 Q2N/DPcKCGowgxjHfnlHeAVCRw3S/Jj502i1vouyUKBsWiWJ0cyclqrsJ4EYvzKqmcfdrPBLtI
 1xCiYDWRlYalZsLRHB4J6NE27tquKMfzOuXfUXr0hZH5QFi+mgAgP/R7m0oqZgIzlTaceQtwmD
 qG0=
X-SBRS: 2.7
X-MesageID: 18421233
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18421233"
Date: Fri, 22 May 2020 10:29:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH for-4.14 2/2] tools/libxc: xc_memshr_fork with interrupts
 disabled
Message-ID: <20200522082939.GU54375@Air-de-Roger>
References: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
 <c2830cae9affe327170c900731a7ca050ddb91ea.1590101479.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2830cae9affe327170c900731a7ca050ddb91ea.1590101479.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 21, 2020 at 03:53:23PM -0700, Tamas K Lengyel wrote:
> Toolstack side for creating forks with interrupt injection disabled.
> 
> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I have the same suggestion to use block instead of prohibit, so if you
agree to change it on patch #1 it should also be changed here.

Thanks, Roger.

