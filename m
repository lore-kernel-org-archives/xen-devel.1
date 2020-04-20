Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5A7C3815B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 19:43:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769FD20782
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 19:43:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="PpfANSy9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769FD20782
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQcJl-0001el-8Z; Mon, 20 Apr 2020 19:42:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQcJj-0001dr-PW
 for xen-devel@lists.xen.org; Mon, 20 Apr 2020 19:42:55 +0000
X-Inumbo-ID: 207ea634-833f-11ea-90a0-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 207ea634-833f-11ea-90a0-12813bfff9fa;
 Mon, 20 Apr 2020 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587411774;
 h=subject:from:to:cc:references:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EcoVDdX2n7iLRgt2kHD8oLc9jomtpflRQLMWHNvAzUA=;
 b=PpfANSy9vGec6RVRW0DS6BrI2UpCeKlAcB0iQBoyVZe5SgiAF9PuJLx1
 PzaITQL555eqyOXRGts78/VUT9hdG9dPoSvPRD1TP6AKS/zi8oEOPth6b
 /MLyZxaF5SYoHrQix35fUDPz+hjBnPmeNEPXxnT4vV4duVijgY3tg/0GU 4=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FUBaUWY2mGK5sgaUUeMWdVAUjCgGDdJ6QM6PAmqWSZsHO183G83oVgs3IfQ8ipmJKe2Yqee+tf
 6F0yVfxIWa8qBHO+qh0w9PciqBPRhmmUC66qtMQWUeOfBBH+LuyULHG9taU0qyKDXLZ/rESUcV
 tYTTk0kci8NoPK7lhhHSptCCaelLjg67AXk0tluTMPgZdeeEsxuu2Ix8EERCCQehjVGHKb8WGk
 JKVe6yVOLbGyJumgebNE6Nz5FhiO4Ebt/9QH5tSA2ssO1Ifltwm32HMxsi9pRH5Huvui4aq2mV
 hxo=
X-SBRS: 2.7
X-MesageID: 15947036
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,407,1580792400"; d="scan'208";a="15947036"
Subject: Re: [XTF 2/4] lib: always append CR after LF in vsnprintf()
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-3-wipawel@amazon.de>
 <00549997-7633-a8c2-899a-fbc0b5a45541@citrix.com>
 <A2E046DD-9F85-4C54-9FED-BE240AA71E09@amazon.com>
 <5d319ae1-e244-23bb-d3fa-cbabb739c33c@citrix.com>
Message-ID: <088234e8-16a6-872c-70a3-6b4bd1c3767b@citrix.com>
Date: Mon, 20 Apr 2020 20:42:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <5d319ae1-e244-23bb-d3fa-cbabb739c33c@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "semelpaul@gmail.com" <semelpaul@gmail.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Julien Grall <julien@xen.org>, "Manthey, Norbert" <nmanthey@amazon.de>,
 "paul@xen.org" <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20/04/2020 20:26, Andrew Cooper wrote:
>>>> ---
>>>> common/libc/vsnprintf.c | 10 ++++++++++
>>>> 1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/common/libc/vsnprintf.c b/common/libc/vsnprintf.c
>>>> index a49fd30..3202137 100644
>>>> --- a/common/libc/vsnprintf.c
>>>> +++ b/common/libc/vsnprintf.c
>>>> @@ -285,6 +285,16 @@ int vsnprintf(char *buf, size_t size, const char *fmt, va_list args)
>>>>         if ( *fmt != '%' )
>>>>         {
>>>>             PUT(*fmt);
>>>> +
>>>> +            /*
>>>> +             * The '\n' character alone on some terminals is not automatically
>>>> +             * converted to LFCR.
>>>> +             * The explicit LFCR sequence guarantees proper line by line
>>>> +             * formatting in the output.
>>>> +             */
>>>> +            if ( *fmt == '\n' && str < end )
>>>> +                PUT('\r');
>>> ... doesn't this end up putting out \n\r ?
>> yes, it does
> So the one type of line ending which isn't in common use?

Switching this to do \r\n does seem to fix the raw `xl create` problem
you were seeing before, doesn't cause the double newlines as far as
`./xtf-runner` is concerned, and doesn't appear to cause xenconsoled to
write windows file endings.

I'm still a little hesitant to do this unilaterally.  Do we know what
Linux usually emits via the console, because that will get us closer to
whatever people actually test.

~Andrew

