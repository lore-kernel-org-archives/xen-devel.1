Return-Path: <SRS0=y719=BK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B7EFC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 10:50:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1889820838
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2020 10:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="cq4mkn7y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1889820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1Sc8-0001VH-F8; Fri, 31 Jul 2020 10:50:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oG5j=BK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k1Sc7-0001VB-Ny
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2020 10:50:11 +0000
X-Inumbo-ID: 9aca1492-d31b-11ea-8e24-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9aca1492-d31b-11ea-8e24-bc764e2007e4;
 Fri, 31 Jul 2020 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596192611;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=tZx3PEJmOBHD6pru8XvPlLvbiHaBtjABhRbeqzn/zek=;
 b=cq4mkn7yKLXI8+n5P9oiGSnZHKGNxOKO0Sm02MgZLD0mIFxP56i8hqGb
 gpmHMRKuEd1frb309NaUnnrbjRE52rXo/GiK81A0lNNtAyBX+o1pvcgCn
 53JL0P8NRJwPP82qC49ek5/rKbw1Xdbz65DXC2sn5Jy6S4gzwy+T1KHx/ 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: U0rYzTZXmpNJz2TQ4Cf3cHdh0JXuKqzA2cK1XcU1UaqNGQtV0nJQNZGYPhi/fo38YIS7YQKztF
 9HapsaWQ32f3pXiZnux1M35iTU95aruXBLenpV+Ils+OY4yT0kCHTI/03wdxlig0h9nr4wz6Fa
 ENsU1wnhBAeqt07N93ehua0ziM5VNsXAYkX6GuXSp0gplbLbnQLFZ6h23h+0T68mmJeVKcVqES
 HS91pnISWu6JWpux8wLGoTiSDERhsJ1NMaqejD2Z0ADAvFDWtOleSBpRK8aHwEKxOcBknPXdi0
 vHA=
X-SBRS: 3.7
X-MesageID: 23632365
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,418,1589256000"; d="scan'208";a="23632365"
Subject: Re: [PATCH] x86emul: replace UB shifts
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <bd679766-939d-3176-c913-e993dd48ef15@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <564e3f51-335d-dcdf-900f-380886d01d6b@citrix.com>
Date: Fri, 31 Jul 2020 11:50:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bd679766-939d-3176-c913-e993dd48ef15@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31/07/2020 08:06, Jan Beulich wrote:
> Displacement values can be negative, hence we shouldn't left-shift them.
>
> While auditing shifts, I noticed a pair of missing parentheses, which
> also get added right here.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'd suggest putting the UBSAN report into the commit message

(XEN) UBSAN: Undefined behaviour in x86_emulate/x86_emulate.c:3482:55
(XEN) left shift of negative value -2

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

