Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC66C433E5
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 12:27:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E21902080D
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 12:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="XJPKZebm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E21902080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrLz-00005o-3b; Tue, 21 Jul 2020 12:26:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQ5W=BA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxrLx-00005i-K6
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:26:37 +0000
X-Inumbo-ID: 6b6e5238-cb4d-11ea-850b-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b6e5238-cb4d-11ea-850b-bc764e2007e4;
 Tue, 21 Jul 2020 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595334396;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=+bTnkqjqrHPNyCrpDXVqs8mLvK7TcjZqSh+/Vw4wTqA=;
 b=XJPKZebmX9juLlohGLWNRVB2K0gO7OeQykHacLyds0Fl5+CJP/CeWnvq
 I1WbXkhRoXBaHdj1I0XIVXTxPWHon8Ggg7IOCCZW2nrOFWEBdPJelq5EA
 RWQR7auoyb2cmU3IXaxJnogr8oZK1FPfrJdYDToF9yW1kUkRuHvTB/WCs k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: j4o6ulCCUFkkjEKHlstF7yy7CzgW0jl0cxriiYjKjK7oj52QcFB1qgv9nW/ABvuml/d3fr16OI
 BhyCn0f18lldNLoyskFBr072jEA2mFaGiykhobLnRVXBWaRXNtzETIZIUafmsWf1ECNq3L6hYX
 9jq7o51ZrfvcfynwXnSbM4+lZ1UPlQHe1rCJ6aHzDfknaAwf2vf0vS9MkGjSk1k6M1dFze0sML
 mYD9P8IwECnvEaEW46Mq2YTVbWEbcDWrQsPV/IjI5d1HVvOFCL5SHHyc8PaGvG1ES4m/apFsga
 Itw=
X-SBRS: 2.7
X-MesageID: 23162858
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,378,1589256000"; d="scan'208";a="23162858"
Subject: Re: [PATCH] tools/xen-cpuid: use dashes consistently in feature names
To: Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <2bd92eaf-a29d-3fbf-e505-af118937cdda@suse.com>
 <20200721121600.vdglmcv3m74qfnhw@liuwe-devbox-debian-v2>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c9369f4-1e89-ce44-dd39-94548b134ad0@citrix.com>
Date: Tue, 21 Jul 2020 13:26:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721121600.vdglmcv3m74qfnhw@liuwe-devbox-debian-v2>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 21/07/2020 13:16, Wei Liu wrote:
> On Tue, Jul 21, 2020 at 02:04:59PM +0200, Jan Beulich wrote:
>> We've grown to a mix of dashes and underscores - switch to consistent
>> naming in the hope that future additions will play by this.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Acked-by: Wei Liu <wl@xen.org>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

