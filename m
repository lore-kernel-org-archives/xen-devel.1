Return-Path: <SRS0=X+fC=A7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C3FC433E4
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 17:49:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8002C20709
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 17:49:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="haK3oIPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8002C20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxZua-0000LW-0d; Mon, 20 Jul 2020 17:49:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gz2F=A7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jxZuY-0000LM-Oa
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 17:49:10 +0000
X-Inumbo-ID: 5017c786-cab1-11ea-9fef-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5017c786-cab1-11ea-9fef-12813bfff9fa;
 Mon, 20 Jul 2020 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595267349;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=k+bJkAMdPWA0Q/lTdghw8iuqQC/R+Y88+G/voLuqVcQ=;
 b=haK3oIPG4IEmvweoEUiDq8eVF6MfVW4KTu3EAjtWULEzXgjLwrHm7dXr
 Pp2jfOCVcQRI4K8ASPAq/qxL7oSPOI2MQBO0bnN+3nIq6XxJbAbMQZ2Ir
 DFP3OIB9Q1kCIa/NNwJsXLeCBPzPbCqPi2m1IdweMLjLIkxM6NkleTMDr 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: PKEEKZcPq6vtaXXp5ZpvhfdN5hesgMfujB3y4twFBpeLqdoLRgo1QrC4ygLVSY/bHkwnoQS91P
 2AaCdrYIEsu7oknyxKTVtNb79DvmvTihUiF8o7S3ewKFJ/8K3MWEv2YfD32+OBxAlcHUVl/3Za
 bHkDHFAf/gnx+Awvir2fS2a44X5QQb5R43mVIUTB5yTr5BGFNBvnIzyb2pe3ATphUW9BmfAhiB
 pEKVRQJyxfEj68v9fW3bsD5Iku+FklPOmJeNzDXqsBP48TOeCHROFxby06sgxa9k71nozcalWE
 nik=
X-SBRS: 2.7
X-MesageID: 22780157
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,375,1589256000"; d="scan'208";a="22780157"
Subject: Re: [PATCH] SUPPORT.md: Spell correctly Experimental
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200720173635.1571-1-julien@xen.org>
 <4cc580c5-146f-6f83-bd91-a798763c261b@citrix.com>
 <627851f2-d28e-5c3b-6f1f-882e9eb02ed4@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <aae69fa5-4aee-781d-2f52-291d8fa948bd@citrix.com>
Date: Mon, 20 Jul 2020 18:49:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <627851f2-d28e-5c3b-6f1f-882e9eb02ed4@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/07/2020 18:48, Julien Grall wrote:
>
> On 20/07/2020 18:45, Andrew Cooper wrote:
>> On 20/07/2020 18:36, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>
>> Although I'd suggest the subject be changed rearranged to "Spell
>> Experimentally correctly".
>
> Did you intend to write "Experimental" rather than "Experimentally"?

Erm, yes :)

~Andrew

