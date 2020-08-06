Return-Path: <SRS0=cbMO=BQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FD1FC433E0
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 15:26:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DDDF23135
	for <xen-devel@archiver.kernel.org>; Thu,  6 Aug 2020 15:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="W6Y0twER"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DDDF23135
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3hm8-0002WC-E7; Thu, 06 Aug 2020 15:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=49j5=BQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3hm7-0002W5-6m
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 15:25:47 +0000
X-Inumbo-ID: bcfbc8a7-3df8-4100-b6a8-8f48f603add0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcfbc8a7-3df8-4100-b6a8-8f48f603add0;
 Thu, 06 Aug 2020 15:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596727546;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=K+oriAnIaJvKhD6uHcdVOVRcgp4QC3R04HEDnpu2fDk=;
 b=W6Y0twERyKvBtdMUoejMX94OTPVUALZzXcQ3Yyx5By7k+vsOMATxZHVg
 xOIQ36dlYbOgaTZvpeb7JtlCI0cJeGxDUPI6RhnQgLvIjFCGqwwOLGElC
 fHSVdfbKfd5odnghpWtjtSRa0FRKHaIFwM3Hcgw+xdNRmQq4ESQqsunlH k=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Kbr+6e/GVFDTfVNZLVRoVOv3aGr/uIu+2TIOgn2uwLLXTbCZjKhM+cfS0SlA1GELBjzymj3c8/
 87kXyY5PwS0M4+bPyVdsTA1gchDviL8YLCyqxvdRg1R8xNBPdBjNlQuRSyDjzvSzmSyYlI5wQ5
 Wthr60Xas5DeJtpG4+93ByjUsx1C9bPjRMJw93wZkAkspdhjFV9gxmpwQNWziceJfxpBmKxzjh
 hKxiM8fbo+flIL+M8LHIYqTAqwsEkALtmKyp+jL2NkdKXV9C/x+ewZcoVz9oKSGlHwFWdAeHg1
 YB4=
X-SBRS: 3.7
X-MesageID: 24343692
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,441,1589256000"; d="scan'208";a="24343692"
Subject: Re: [PATCH 2/4] build: correctly report non-empty section sizes upon
 .o -> .init.o conversion
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <305c2532-408a-9f78-61fe-c90a2e86eb8e@suse.com>
 <5fcb47ec-4a0e-99a2-c548-f42ec1cc8030@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <2d573b9e-e69e-80b9-444e-affbb105d8c5@citrix.com>
Date: Thu, 6 Aug 2020 16:25:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fcb47ec-4a0e-99a2-c548-f42ec1cc8030@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/08/2020 10:05, Jan Beulich wrote:
> The originally used sed expression converted not just multiple leading
> zeroes (as intended), but also trailing ones, rendering the error
> message somewhat confusing. Collapse zeroes in just the one place where
> we need them collapsed, and leave objdump's output as is for all other
> purposes.
>
> Fixes: 48115d14743e ("Move more kernel decompression bits to .init.* sections")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

