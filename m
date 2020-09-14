Return-Path: <SRS0=xX5W=CX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 819F8C43461
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 14:34:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33540207EA
	for <xen-devel@archiver.kernel.org>; Mon, 14 Sep 2020 14:34:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="EL2TE+MX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33540207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHpZ3-0004in-Cb; Mon, 14 Sep 2020 14:34:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qknR=CX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kHpZ2-0004ih-2G
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 14:34:40 +0000
X-Inumbo-ID: fab3fe29-27f6-4c74-b682-523740ee206d
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fab3fe29-27f6-4c74-b682-523740ee206d;
 Mon, 14 Sep 2020 14:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600094078;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=S198w6/5LeVeAXqIxlt3woQmMISTks5bWxUkKc68j2o=;
 b=EL2TE+MXzCYmruFLF2GW+g468aDh4UaODv77J9Hvyto/NLKpCNESYRxI
 PEgeMc7CgRNpBSh4zFKUH8OJTFWpwnebpV1VI4OxVYjpWDMldx6KM/MSD
 vkdojrUm9fu/ez178PuGZ3+qJKgPuLicnQSnFNk9wJlomq/wH+lWNe3GA A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: F12PYA69QlVlU7L5Vv8l8Wok1lbLsEtoX3VWLTziTp2oEAC0guFNQvZnAoFswGKkX3FrECxoxy
 hrCPCrnz1aj6+Gq4k4DnBXNgnxJNy822cBkK53UdiJv2o+GiG3+lPprnFd2nMvMDsRJdslnWNT
 zE57mok7qalFOk4Wp9vpAD9pMgugzMrrV4AfIOnDnzImwsvUjEGD/IXBSGvEKywQXvnfU4TZE3
 yyDdAr+m6oaxASRdA8s9GPaKmgUOASELoM6sbdgDS3vr0vbqtYlmE5OaHQhm0Tt0w/CK3W928H
 hGA=
X-SBRS: 2.7
X-MesageID: 26759421
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,426,1592884800"; d="scan'208";a="26759421"
Subject: Re: [PATCH 2/5] x86/asm: Split __wr{fs,gs}base() out of
 write_{fs,gs}_base()
To: Jan Beulich <jbeulich@suse.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20200909095920.25495-1-andrew.cooper3@citrix.com>
 <20200909095920.25495-3-andrew.cooper3@citrix.com>
 <83dadf8d-f5ea-bd76-86bc-19f3cd1f6a21@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ff6df1bb-25ad-2a21-5b95-7ae1bb3871f3@citrix.com>
Date: Mon, 14 Sep 2020 15:34:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83dadf8d-f5ea-bd76-86bc-19f3cd1f6a21@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL05.citrite.net (10.13.108.178)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10/09/2020 15:47, Jan Beulich wrote:
> On 09.09.2020 11:59, Andrew Cooper wrote:
>> To match the read side which is already split out.  A future change will want
>> to use them.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Of course ...
>
>> --- a/xen/include/asm-x86/msr.h
>> +++ b/xen/include/asm-x86/msr.h
>> @@ -156,6 +156,24 @@ static inline unsigned long __rdgsbase(void)
>>      return base;
>>  }
>>  
>> +static inline void __wrfsbase(unsigned long base)
>> +{
>> +#ifdef HAVE_AS_FSGSBASE
>> +    asm volatile ( "wrfsbase %0" :: "r" (base) );
>> +#else
>> +    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd0" :: "a" (base) );
>> +#endif
>> +}
>> +
>> +static inline void __wrgsbase(unsigned long base)
>> +{
>> +#ifdef HAVE_AS_FSGSBASE
>> +    asm volatile ( "wrgsbase %0" :: "r" (base) );
>> +#else
>> +    asm volatile ( ".byte 0xf3, 0x48, 0x0f, 0xae, 0xd8" :: "a" (base) );
>> +#endif
>> +}
> ... I'd have preferred if you had used just a single leading
> underscore, despite realizing this would introduce an inconsistency
> with the read sides.

You're welcome to change them if you wish.

As always, I value consistency far far higher than arbitrary rules which
don't impact us in practice.

~Andrew

