Return-Path: <SRS0=bMr6=AR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1ADEC433E0
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 15:47:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F05820720
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2020 15:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JIWhfXJ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F05820720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsTKo-0006YJ-28; Mon, 06 Jul 2020 15:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G1NU=AR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jsTKn-0006YE-Fy
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 15:47:09 +0000
X-Inumbo-ID: f1c8d4f2-bf9f-11ea-b7bb-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1c8d4f2-bf9f-11ea-b7bb-bc764e2007e4;
 Mon, 06 Jul 2020 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594050426;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1fFrTf8uNkEHrsl86x9jQ69OdtuBRhByr0KriIBoYN0=;
 b=JIWhfXJ7dgXKh+tfqkXqgoR5nm/hlUH7fsiZXxlWQ3U3PPkz5Ewf7t6C
 JR7B24O0o4GJTZ6+MM9wRPhcKfVdlghdv5F5gyvGX2Gdw3aZ7tSMaFvFt
 s5nV8YrXnHkAjuGKv23rFblkN8XMuWO8XN+itHtIco1ksS54uY0liMUU7 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: GuwQeNwa6kLJulgktJ427JYsSOhXXd9CvxtNTtoKCyvvUNj3AkXKV9vwK6/48h3nDg1Xxf6BA3
 ojT29Yf6LZ0Axj1m7XW0TvibqUFnwMnbQh+Nn4TszvnmFBFdrB2jRPmWo9lerhGcxIJdvNeG11
 WL32A2nyYwaIG6mVhmCkEtN/FIe3Iyz2N3NGvqiZJhc3u8Cuz+orAE9gksT7UP4g1IuTX5j+L+
 Z+hLpCsEpkuaiCLsFKqeeGtHbDn4SkXTkOaSgEzW5bRW/r6RbqbRIRfY6L9blWBIsgVzwVnFi8
 UN4=
X-SBRS: 2.7
X-MesageID: 21898130
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,320,1589256000"; d="scan'208";a="21898130"
Subject: Re: [PATCH] x86emul: fix FXRSTOR test for most AMD CPUs
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <29986a8f-47bf-43c2-98e9-e08c1c5925af@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b35fc5f2-4f12-38f2-088c-cee019e8cbad@citrix.com>
Date: Mon, 6 Jul 2020 16:46:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <29986a8f-47bf-43c2-98e9-e08c1c5925af@suse.com>
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
Cc: Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 06/07/2020 16:14, Jan Beulich wrote:
> AMD CPUs that we classify as X86_BUG_FPU_PTRS don't touch the selector/
> offset portion of the save image during FXSAVE unless an unmasked
> exception is pending. Hence the selector zapping done between the
> initial FXSAVE and the emulated FXRSTOR needs to be mirrored onto the
> second FXSAVE, output of which gets fed into memcmp() to compare with
> the input image.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
Tested-by: Andrew Cooper <andrew.cooper3@citrix.com>

