Return-Path: <SRS0=vMqj=6Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EADFC47255
	for <xen-devel@archiver.kernel.org>; Mon, 11 May 2020 07:29:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5889A2075E
	for <xen-devel@archiver.kernel.org>; Mon, 11 May 2020 07:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5889A2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY2sV-0003Yf-VI; Mon, 11 May 2020 07:29:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY2sU-0003YZ-8D
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 07:29:30 +0000
X-Inumbo-ID: 26481850-9359-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 26481850-9359-11ea-9887-bc764e2007e4;
 Mon, 11 May 2020 07:29:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 71875B052;
 Mon, 11 May 2020 07:29:31 +0000 (UTC)
Subject: Re: [PATCH v8 08/12] x86emul: support FLDENV and FRSTOR
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <09fe2c18-0037-af71-93be-87261051e2a2@suse.com>
 <20200508133720.GH1353@Air-de-Roger>
 <4b6f4353-066e-351d-597d-4455193ff95f@suse.com>
 <20200508162155.GL1353@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7f289c91-da38-55bc-a49a-dd80e60958d4@suse.com>
Date: Mon, 11 May 2020 09:29:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508162155.GL1353@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 18:21, Roger Pau Monné wrote:
> On Fri, May 08, 2020 at 05:04:02PM +0200, Jan Beulich wrote:
>> On 08.05.2020 15:37, Roger Pau Monné wrote:
>>> On Tue, May 05, 2020 at 10:16:20AM +0200, Jan Beulich wrote:
>>>> --- a/tools/tests/x86_emulator/test_x86_emulator.c
>>>> +++ b/tools/tests/x86_emulator/test_x86_emulator.c
>>>> @@ -11648,6 +11651,89 @@ int x86_emul_blk(
>>>>  
>>>>  #ifndef X86EMUL_NO_FPU
>>>>  
>>>> +    case blk_fld:
>>>> +        ASSERT(!data);
>>>> +
>>>> +        /* state->rex_prefix carries CR0.PE && !EFLAGS.VM setting */
>>>> +        switch ( bytes )
>>>> +        {
>>>> +        case sizeof(fpstate.env):
>>>> +        case sizeof(fpstate):
>>>> +            memcpy(&fpstate.env, ptr, sizeof(fpstate.env));
>>>> +            if ( !state->rex_prefix )
>>>> +            {
>>>> +                unsigned int fip = fpstate.env.mode.real.fip_lo +
>>>> +                                   (fpstate.env.mode.real.fip_hi << 16);
>>>> +                unsigned int fdp = fpstate.env.mode.real.fdp_lo +
>>>> +                                   (fpstate.env.mode.real.fdp_hi << 16);
>>>> +                unsigned int fop = fpstate.env.mode.real.fop;
>>>> +
>>>> +                fpstate.env.mode.prot.fip = fip & 0xf;
>>>> +                fpstate.env.mode.prot.fcs = fip >> 4;
>>>> +                fpstate.env.mode.prot.fop = fop;
>>>> +                fpstate.env.mode.prot.fdp = fdp & 0xf;
>>>> +                fpstate.env.mode.prot.fds = fdp >> 4;
>>>
>>> I've found the layouts in the SDM vol. 1, but I haven't been able to
>>> found the translation mechanism from real to protected. Could you
>>> maybe add a reference here?
>>
>> A reference to some piece of documentation? I don't think this
>> is spelled out anywhere. It's also only one of various possible
>> ways of doing the translation, but among them the most flexible
>> one for possible consumers of the data (because of using the
>> smallest possible offsets into the segments).
> 
> Having this written down as a comment would help, but maybe that's
> just because I'm not familiar at all with all this stuff.
> 
> Again, likely a very stupid question, but I would expect:
> 
> fpstate.env.mode.prot.fip = fip;
> 
> Without the mask.

How that? A linear address has many ways of decomposing into a
real/vm86 mode ssss:oooo pair, but what you suggest is not one
of them. The other extreme to the one chosen would be

                fpstate.env.mode.prot.fip = fip & 0xffff;
                fpstate.env.mode.prot.fcs = (fip >> 4) & 0xf000;

Except that when doing it this way, even the full insn (or for
fcs:fdp the full operand) may not be accessible through the
resulting ssss, due to segment wraparound.

Jan

