Return-Path: <SRS0=DK6E=6N=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF8EC83004
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2020 13:27:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148D32087E
	for <xen-devel@archiver.kernel.org>; Wed, 29 Apr 2020 13:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="J252ACjS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 148D32087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTmkM-0008J3-Nw; Wed, 29 Apr 2020 13:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xGEm=6N=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1jTmkL-0008Iv-Mp
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 13:27:29 +0000
X-Inumbo-ID: 2bb28838-8a1d-11ea-9887-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bb28838-8a1d-11ea-9887-bc764e2007e4;
 Wed, 29 Apr 2020 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588166849;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=nEY+BgwN9s5pLDZw5R6QofIdPvR9bPDUkz6NuKW7k/I=;
 b=J252ACjSjCUS0LXWZ2H6w1A06RdJFkdgo/VTvLouq7jELbLSnTTQ/fWF
 6BXlcKLE9s9XF98YUP3YZmNrT59ZmaB5U39EBGm8G6lr+x0x4D2l2QJON
 K/0tD98Jduq5hptYwwh3IY/+KZf+ZQcoslZWPsT6BarEeIXVKxK06uv+6 w=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BOnBCUTpubBaykhefaGF8rXKtsZPc+Fut07Ttpr8cDUc7K3JPLRUqr429FR1wG89VJTSVSE1GS
 fl7FwBdzOT5hUdijEUuDrOwZ/vasJB/CWjA2eBEkYNrEGzLRaJoi2KNOSAWP3dmZLbIHvaKtc4
 zGL0RHraMEA524hZOQFnF2VYLJQIp/2+5iw7JDpHiVYY89G12Ni947dpdoJ/63Nb5naEKop093
 H5cQi9AyovxuecMchRcX1aVmCmE0L4Aql4m9yWww3BqDv2UYCOkLnxNAyufS417zkUEEeFs0ep
 SZ0=
X-SBRS: 2.7
X-MesageID: 16694309
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,332,1583211600"; d="scan'208";a="16694309"
Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in
 xensotred
To: <paul@xen.org>, =?UTF-8?B?J0rDvHJnZW4gR3Jvw58n?= <jgross@suse.com>,
 'Julien Grall' <julien@xen.org>, 'Julien Grall' <julien.grall.oss@gmail.com>
References: <20200428155144.8253-1-jgross@suse.com>
 <CAJ=z9a0WfWQs+UJ-t4Kt6PGGdNnA2kMeK5p8bNnDT_eFcpDiiQ@mail.gmail.com>
 <d1c41bd7-676e-c50a-416d-c62efcbdd41d@suse.com>
 <76ed29d6-e2fc-cd48-6de7-e0032daaa2e9@xen.org>
 <3fd79cb1-e18f-1987-69ff-94f1bd15c66f@citrix.com>
 <3dcbe001-c66c-13a6-7a28-ef24b05eefa0@suse.com>
 <c07e5106-d8de-f6a7-e406-b25ee9ff6d49@citrix.com>
 <f80aff47-8617-8f59-0d34-bf0385128b62@suse.com>
 <a23c3d72-f5c8-5c3f-2c2f-5a9ca1065d1f@citrix.com>
 <000001d61e25$97f86530$c7e92f90$@xen.org>
 <0eaea23f-8b4a-2c67-2fc4-827cf26dbd8d@citrix.com>
 <000101d61e29$37890f70$a69b2e50$@xen.org>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <df06904d-1915-bf13-f0ac-c1c78bf05287@citrix.com>
Date: Wed, 29 Apr 2020 14:27:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <000101d61e29$37890f70$a69b2e50$@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Wei Liu' <wl@xen.org>,
 andrew.cooper3@citrix.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29/04/2020 14:22, Paul Durrant wrote:
>> -----Original Message-----
>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>> Sent: 29 April 2020 14:17
>> To: paul@xen.org; 'Jürgen Groß' <jgross@suse.com>; 'Julien Grall' <julien@xen.org>; 'Julien Grall'
>> <julien.grall.oss@gmail.com>
>> Cc: 'xen-devel' <xen-devel@lists.xenproject.org>; 'Ian Jackson' <ian.jackson@eu.citrix.com>; 'Wei Liu'
>> <wl@xen.org>; andrew.cooper3@citrix.com
>> Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in xensotred
>>
>> On 29/04/2020 13:56, Paul Durrant wrote:
>>>> -----Original Message-----
>>>> From: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>> Sent: 29 April 2020 13:50
>>>> To: Jürgen Groß <jgross@suse.com>; Julien Grall <julien@xen.org>; Julien Grall
>>>> <julien.grall.oss@gmail.com>
>>>> Cc: xen-devel <xen-devel@lists.xenproject.org>; Ian Jackson <ian.jackson@eu.citrix.com>; Wei Liu
>>>> <wl@xen.org>; andrew.cooper3@citrix.com; Paul Durrant <paul@xen.org>
>>>> Subject: Re: [PATCH] tools/xenstore: don't store domU's mfn of ring page in xensotred
>>>>
>>>> On 29/04/2020 13:29, Jürgen Groß wrote:
>>>>>
>>>>> Wei, Ian, can you please tell me where I'm wrong?
>>>>>
>>>>> A soft reset should restart the domain in a clean state. AFAIK libxl is
>>>>> handling that by doing kind of in-place save-restore, including calling
>>>>> xs_release_domain() and later xs_introduce_domain(). This should result
>>>>> in xenstored throwing away all state it has regarding the domain and
>>>>> then restarting with a new (internal) domain instance.
>>>>>
>>>>> Is XAPI doing soft reset differently? Why should there be a need for
>>>>> keeping xenstored data across a soft reset?
>>>>
>>>> Yes, XAPI is doing soft reset differently from libxl. You need to keep xenstore
>>>> data to at least keep backends working without the need to reinitialize them
>>>> before entering kdump kernel. We do the same thing while entering crash kernel
>>>> in Windows after BSOD (CC Paul as he recommended this approach).
>>>
>>> IIRC I recommended not involving Xen or the toolstack in entering the crash kernel... they don't
>> need to know. Windows quite happily enters its crash kernel, rebuilds its Xen interfaces and re-
>> attaches to PV backends without any external intervention.
>>
>> In case of kdump toolstack certainly needs to know as it gets shutdown code 5 and
>> needs to restart the domain.
>>
> 
> The toolstack needs to restart the domain once the crash has completed, yes.

To clarify, what I meant is that once crash happened (before kdump kernel is loaded)
toolstack gets code 5 and then it's supposed to call soft reset and unpause the domain
to actually load into crash kernel.

I didn't mean that after crash kernel is finished the domain has to be restarted - that's
obvious.

Igor

 

