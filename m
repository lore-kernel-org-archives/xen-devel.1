Return-Path: <SRS0=l84g=6E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BDA2C3A5A0
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 13:43:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB5C20857
	for <xen-devel@archiver.kernel.org>; Mon, 20 Apr 2020 13:43:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="RDeMqUYE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB5C20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQWhj-0001ez-SK; Mon, 20 Apr 2020 13:43:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jQWhi-0001eu-US
 for xen-devel@lists.xen.org; Mon, 20 Apr 2020 13:43:18 +0000
X-Inumbo-ID: e3eef7a0-830c-11ea-b58d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3eef7a0-830c-11ea-b58d-bc764e2007e4;
 Mon, 20 Apr 2020 13:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1587390199;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=XuJI7MJ4eLlPZd78Ewl8OXRKmbXDAyZFQxiQFbAVD2E=;
 b=RDeMqUYE/KjWx6b+USzEneZ9dh/eGDI4PWWisfTK/qGTk4BfT0P/yT69
 o/xAjm760Oyqwj3j3yCZ0jfg1aZxr1SHZ6ugPQwbnCtIYIn6YpqtZDhmJ
 mIY7w5JJoEgfPgE7d1GNLRlEetYttrggA7R5iko4FBNlbxxFyGtQ9TZLz U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SDxmUL4Ds1blFeR6GmLnRQYPchznhXdtAXvYtHUglLxmvz1yXI3USVUO3Z81NSnG1GNJWn0Vb4
 K6U5PtGGXSNPNkbYyJrqZluMAsJfRU1415zhs7gi6CmBXZXR8pQaA/h6RwkBIpelf3BbuStxPx
 OJF9xQ3pJljaAFjfaYe0P4/3xjxnqGmxUMTeWP7NLCE0dlWvsQiqcFjxDF4J/4HUNe4fOV5nMn
 sDcn64NEckI/nDyOy04fWz4ZPWGo6mNisjBwgvSiyH2RYfw9MViAQYnS3d8CbII3rjyMPzXEaM
 G+g=
X-SBRS: 2.7
X-MesageID: 15952752
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,406,1580792400"; d="scan'208";a="15952752"
Subject: Re: [XTF 4/4] setup: Setup PV console for HVM guests on xen >4.2
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20200416094141.65120-1-wipawel@amazon.de>
 <20200416094141.65120-5-wipawel@amazon.de>
 <e1e910a7-ed94-46e9-6987-fecdd704e104@citrix.com>
 <82FE157A-310D-4D4E-9D87-F04DE2E6B26E@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <26028dfa-d475-486d-83ae-08b27389d536@citrix.com>
Date: Mon, 20 Apr 2020 14:43:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <82FE157A-310D-4D4E-9D87-F04DE2E6B26E@amazon.com>
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
Cc: "semelpaul@gmail.com" <semelpaul@gmail.com>, "paul@xen.org" <paul@xen.org>,
 "julien@xen.org" <julien@xen.org>, "Manthey, Norbert" <nmanthey@amazon.de>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 16/04/2020 12:51, Wieczorkiewicz, Pawel wrote:
>> On 16. Apr 2020, at 12:36, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
>>
>>
>>
>> On 16/04/2020 10:41, Pawel Wieczorkiewicz wrote:
>>> @@ -272,9 +274,23 @@ void arch_setup(void)
>>>
>>>     init_hypercalls();
>>>
>>> -    if ( !is_initdomain() )
>>> +    xen_version = hypercall_xen_version(XENVER_version, NULL);
>>> +    if ( version )
>>> +        *version = xen_version;
>>> +
>>> +    /*
>>> +     * The setup_pv_console function registers a writing function
>>> +     * that makes hvm guests crash on Xen 4.2
>> This comment in particular is rather concerning.  Even if there is a
>> configuration issue in 4.2 stopping the PV console from being wired up
>> properly, nothing involved in transmitting on the console should crash
>> the guest.
>>
> I am again a little short on details here. Maybe Paul could chime in.
> But, I vagualy remember it was something about the init_pv_console()’s:
>
>     if ( port >= (sizeof(shared_info.evtchn_pending) * CHAR_BIT) )
>         panic("evtchn %u out of evtchn_pending[] range\n", port);

This is a sanity check about not overrunning the evtchn_pending array. 
However, the check is still correct AFAICT.

port will either be 0 (if not configured by the toolstack), or strictly
less than 8 if configured properly.

What value are you seeing here?

~Andrew

