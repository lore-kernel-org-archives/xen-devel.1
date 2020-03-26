Return-Path: <SRS0=xTCj=5L=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77815C43331
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 14:56:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E8E9206F6
	for <xen-devel@archiver.kernel.org>; Thu, 26 Mar 2020 14:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E8E9206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jHTw3-00047r-PD; Thu, 26 Mar 2020 14:56:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ColY=5L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jHTw2-00047j-Vs
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2020 14:56:43 +0000
X-Inumbo-ID: 00ca8c08-6f72-11ea-8804-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00ca8c08-6f72-11ea-8804-12813bfff9fa;
 Thu, 26 Mar 2020 14:56:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 75224AD4F;
 Thu, 26 Mar 2020 14:56:41 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200323101724.15655-1-andrew.cooper3@citrix.com>
 <20200323101724.15655-5-andrew.cooper3@citrix.com>
 <52481e12-eb98-eead-be74-d48815e5a41f@suse.com>
 <eabacc07-ef92-0839-798b-ffee123f4f89@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <83909134-8bd7-b1b2-40f7-040dd00cc517@suse.com>
Date: Thu, 26 Mar 2020 15:56:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <eabacc07-ef92-0839-798b-ffee123f4f89@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Xen-devel] [PATCH 4/7] x86/ucode/intel: Reimplement get_{data,
 total}size() helpers
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.03.2020 15:35, Andrew Cooper wrote:
> On 25/03/2020 13:41, Jan Beulich wrote:
>> On 23.03.2020 11:17, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/cpu/microcode/intel.c
>>> +++ b/xen/arch/x86/cpu/microcode/intel.c
>>> @@ -46,9 +46,16 @@ struct microcode_header_intel {
>>>      unsigned int sig;
>>>      unsigned int cksum;
>>>      unsigned int ldrver;
>>> +
>>> +    /*
>>> +     * Microcode for the Pentium Pro and II had all further fields in the
>>> +     * header reserved, had a fixed datasize of 2000 and totalsize of 2048,
>>> +     * and didn't use platform flags despite the availability of the MSR.
>>> +     */
>>> +
>>>      unsigned int pf;
>>> -    unsigned int datasize;
>>> -    unsigned int totalsize;
>>> +    unsigned int _datasize;
>>> +    unsigned int _totalsize;
>> ... the underscores here dropped again. Or else - why did you add
>> them? This (to me at least) doesn't e.g. make any more clear that
>> the fields may be zero on old hardware.
> 
> No, but it is our normal hint that you shouldn't be using the field
> directly, and should be using the accessors instead.

Yet in patch 5 you do. Perhaps for an understandable reason, but
that way you at least partly invalidate what you say above.

>> Furthermore - do we really need this PPro/PentiumII logic seeing
>> that these aren't 64-bit capable CPUs?
> 
> I did actually drop support in one version of my series, but put it back in.
> 
> These old microcode blobs are still around, including in some versions
> of microcode.dat.  By dropping the ability to recognise them as
> legitimate, we'd break the logic to search through a container of
> multiple blobs to find the one which matches.

Oh, good point.

Jan

