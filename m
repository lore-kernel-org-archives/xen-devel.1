Return-Path: <SRS0=o2nd=EL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02A8CC4741F
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 15:49:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84463206FA
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2020 15:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="AaVRj+ak"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84463206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.19882.45349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kahW7-0004mO-MG; Thu, 05 Nov 2020 15:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19882.45349; Thu, 05 Nov 2020 15:49:39 +0000
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
	id 1kahW7-0004mH-Iz; Thu, 05 Nov 2020 15:49:39 +0000
Received: by outflank-mailman (input) for mailman id 19882;
 Thu, 05 Nov 2020 15:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BrWA=EL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1kahW6-0004mA-MW
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:49:38 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 792c0c55-3b5e-48f5-8fe0-4ef12f01a4a1;
 Thu, 05 Nov 2020 15:49:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BrWA=EL=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
	id 1kahW6-0004mA-MW
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 15:49:38 +0000
X-Inumbo-ID: 792c0c55-3b5e-48f5-8fe0-4ef12f01a4a1
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 792c0c55-3b5e-48f5-8fe0-4ef12f01a4a1;
	Thu, 05 Nov 2020 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1604591377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HSO5V/NnPVdK2gbwb/SgQFXpIENruT650/i5YptNuHI=;
  b=AaVRj+aknzntId9OOcnkYfcxtPkqgvp7yt1U6pqtEKNy7IUsR/nzj0ei
   3k39p6FNMC/13LtYciSRE8+TUDVyLhL+qgcvL/mdBQTFgcipTrd9UaG5D
   buAVb/SInRN6CUKnTx+BTvduWyx+htpp4nPbFpUsrqzgzsKtz0SNiE+lB
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: FRgFSROrUrMjH/hztCUYAkc/jqOVljfGZIB4e7Wk3A7tN9Z3dEjgvM1kRupO56CjASnJUoSlLQ
 OfaAhRxqTqWJE4brvquIjBvsc60gURjFQXvReuQ9J3J4MhQETglWPzZzdElp5iQowhtOvjQQ20
 wDvw1tRQzwpkxeaYgXqW6mWSZToogQlhzpyiLgAlwSDAa47Md1BXbOSks6REdSkGxQ/cMewJmM
 fx6F5oQ/GBhbMdy1pgLSFiApddEoK5m8VE0mMQbp3cdq1qbww8iOF+Erk3Ox5EOTXodiIDOZpK
 aRI=
X-SBRS: None
X-MesageID: 30795796
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,453,1596513600"; 
   d="scan'208";a="30795796"
Date: Thu, 5 Nov 2020 15:49:10 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Xinhao Zhang <zhangxinhao1@huawei.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <paul@xen.org>, <dengkai1@huawei.com>,
	<alex.chen@huawei.com>, <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] hw/xen: Don't use '#' flag of printf format
Message-ID: <20201105154910.GK2214@perard.uk.xensource.com>
References: <20201104133709.3326630-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201104133709.3326630-1-zhangxinhao1@huawei.com>

On Wed, Nov 04, 2020 at 09:37:09PM +0800, Xinhao Zhang wrote:
> Fix code style. Don't use '#' flag of printf format ('%#') in
> format strings, use '0x' prefix instead
> 
> Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
> Signed-off-by: Kai Deng <dengkai1@huawei.com>

Acked-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

