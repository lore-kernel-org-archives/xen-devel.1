Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F8FC5519F
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 11:35:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B14DB206C0
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 11:35:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="Zyk2yEl6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B14DB206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37598.70040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kht4f-0003Ew-2y; Wed, 25 Nov 2020 11:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37598.70040; Wed, 25 Nov 2020 11:35:01 +0000
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
	id 1kht4e-0003Ep-WD; Wed, 25 Nov 2020 11:35:01 +0000
Received: by outflank-mailman (input) for mailman id 37598;
 Wed, 25 Nov 2020 11:35:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QLmq=E7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kht4e-0003Ek-Bk
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:35:00 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98a1c86e-ce4f-446c-b8b4-b8d25921092f;
 Wed, 25 Nov 2020 11:34:59 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QLmq=E7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kht4e-0003Ek-Bk
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 11:35:00 +0000
X-Inumbo-ID: 98a1c86e-ce4f-446c-b8b4-b8d25921092f
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 98a1c86e-ce4f-446c-b8b4-b8d25921092f;
	Wed, 25 Nov 2020 11:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1606304099;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=01AObPEzqIxLTNz3dIKwWe0KbB5hu7dlBpFLNIJ4zXQ=;
  b=Zyk2yEl6zhVQZdxD533Razwp0RPnPYZ5WJYr9iTcV+LaFl4GEBFJneKK
   yXDRdi9yC3+YdB62NS6P1Od0GXAQR34a/v1JNU1bebkLmafBVWB3ujJpn
   FRz0VqYAFl+hXKEKhOG3K1aGg6UdRI1PrQ+CwtY0yga3TE7K2eEtS1MU5
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8laZL+S721WS+YayX/vM0WXv1fRymI3Fd8PNOKeBwuiHq67IYrntiFO/Hmt/2Dtog/IVV4AVMy
 Odj6TxyBhODs2+1dA7BRGOn5Dk7UkXo5AzUFqrtcd8BcTBwsNuu3RL3qBnu601ax3jsjBo08sT
 xqfxVo7CGFKz6qseRqaTKpmu1IqOdabt4QG4zVH85VauKJShOW9sATKKA24GkvOKNDW9zA/6DK
 QA64IMQ3gJgq2+H+4q2sITaEt4BxE/3S47x77yi++jKOo4st/RwTZC0swmfg4/Q+6xNjw5NuWx
 nqw=
X-SBRS: None
X-MesageID: 32249198
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,368,1599537600"; 
   d="scan'208";a="32249198"
Subject: Re: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
CC: Paul Durrant <pdurrant@amazon.com>, Eslam Elnikety <elnikety@amazon.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2b2e3737-ecd7-907f-3c72-f31835dc5cb8@citrix.com>
Date: Wed, 25 Nov 2020 11:30:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124191751.11472-2-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

On 24/11/2020 19:17, Paul Durrant wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 666aeb71bf1b..70701c59d053 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +#define _XEN_DOMCTL_CDF_disable_fifo  7
> +#define XEN_DOMCTL_CDF_disable_fifo   (1U << _XEN_DOMCTL_CDF_disable_fifo)

The sense is backwards.  It should be a "permit the use of FIFO"
control.  If the code had been written this way to begin with, the bug
you found wouldn't have existed.

Given that there is not currently a way to disable FIFO, you can
probably do without an enumeration of whether the hypervisor supports it
or not.

~Andrew

