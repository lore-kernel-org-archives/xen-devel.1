Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE79AC433F7
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 15:00:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B80B3207CD
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 14:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JvfDRRle"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B80B3207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYsZ8-0003qs-1Z; Wed, 13 May 2020 14:40:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cxQB=63=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYsZ6-0003qn-DP
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 14:40:56 +0000
X-Inumbo-ID: bffbcef4-9527-11ea-9887-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bffbcef4-9527-11ea-9887-bc764e2007e4;
 Wed, 13 May 2020 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589380856;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aJPuLbXmdiUuvxJZB9lY/DMK61zjlx7iWP0InQTAu3o=;
 b=JvfDRRleSHx78ebnE64XH+i558wQfvLcQpwlrKNQ5PkOqrDzJMQoz3PL
 lKoJRMAW+Bs2H/N5Q8KJjrcqfCvZ8SCF78GrEmnWLpWtLIOvdj5knVUsD
 plF8apsO/MlxrK8/MFGH6oKyU6Cn2z4Dy7Q5kdwPU0kWtdBYasacBMkSy E=;
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
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: VvX3nAt0ezuSuxDOykhKCzheoUyLKUASYAy2MFYKayxIye40p7h7eRrn4Z/AwoilhqFz75PuU3
 bj+UtjDBbbfTT6WtE8QoP0l9A0zLr5Rm3fw2sij5c6+tSGH+ILmeWKpevGd5fYK4mTJxe95KFv
 Mblg+6MO3h0M7sY34eh8KHMO37bu/Ah6x3UhL0wTl96d4AlWD79Fxvzcu/73YSBh4NpwvUoiun
 /1tGF2VzhMNmLA0jOrEVBpROetD2Czf32CV5E+kLPtfytgATGgzK4qyOwZlrsYdyxda9GznP8s
 xBE=
X-SBRS: 2.7
X-MesageID: 17448237
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,388,1583211600"; d="scan'208";a="17448237"
Subject: Re: [PATCH] x86/build: Unilaterally disable -fcf-protection
To: Jan Beulich <jbeulich@suse.com>
References: <20200513135552.24329-1-andrew.cooper3@citrix.com>
 <20200513135552.24329-3-andrew.cooper3@citrix.com>
 <a56bb718-47e8-ab45-d706-84f59d3131d8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d395aa13-ab66-490e-109c-94a050b1fc9a@citrix.com>
Date: Wed, 13 May 2020 15:40:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <a56bb718-47e8-ab45-d706-84f59d3131d8@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jason Andryuk <jandryuk@gmail.com>, Stefan Bader <stefan.bader@canonical.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 13/05/2020 15:13, Jan Beulich wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>
> On 13.05.2020 15:55, Andrew Cooper wrote:
>> Xen doesn't support CET-IBT yet.  At a minimum, logic is required to enable it
>> for supervisor use, but the livepatch functionality needs to learn not to
>> overwrite ENDBR64 instructions.
>>
>> Furthermore, Ubuntu enables -fcf-protection by default, along with a buggy
>> version of GCC-9 which objects to it in combination with
>> -mindirect-branch=thunk-extern (Fixed in GCC 10, 9.4).
>>
>> Various objects (Xen boot path, Rombios 32 stubs) require .text to be at the
>> beginning of the object.  These paths explode when .note.gnu.properties gets
>> put ahead of .text and we end up executing the notes data.
>>
>> Disable -fcf-protection for all embedded objects.
>>
>> Reported-by: Jason Andryuk <jandryuk@gmail.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> For the immediate purpose
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
> I wonder however ...
>
>> --- a/Config.mk
>> +++ b/Config.mk
>> @@ -205,6 +205,7 @@ APPEND_CFLAGS += $(foreach i, $(APPEND_INCLUDES), -I$(i))
>>  
>>  EMBEDDED_EXTRA_CFLAGS := -nopie -fno-stack-protector -fno-stack-protector-all
>>  EMBEDDED_EXTRA_CFLAGS += -fno-exceptions -fno-asynchronous-unwind-tables
>> +EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
> ... whether this isn't going to bite us once some of the consumers
> of this variable want to enable some different mode.

I'm not overly happy with EMBEDDED_EXTRA_CFLAGS as a concept, but these
build fixes do need backporting.

All embedded targets may in principle use some/all of these options at
some point in the future.

~Andrew

