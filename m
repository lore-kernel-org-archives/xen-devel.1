Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9197C4453C
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 18:49:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368758.1617945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmbzu-0003l4-8v; Wed, 22 Jul 2026 18:48:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368758.1617945; Wed, 22 Jul 2026 18:48:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmbzu-0003kx-68; Wed, 22 Jul 2026 18:48:50 +0000
Received: by outflank-mailman (input) for mailman id 1368758;
 Wed, 22 Jul 2026 18:48:48 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wmbzs-0003kr-O6
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 18:48:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmbzs-008fEq-4u
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 20:48:48 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a61107b-2eae-0a2a0a5409dd-0a2a4502dc66-12
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 20:48:48 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a61108c-6ca4-0a2a45020019-c689ca88964a-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 20:48:45 +0200
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66MImErH1111943
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 22 Jul 2026 11:48:15 -0700
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026062701 header.d=zytor.com header.i="@zytor.com" header.h="Date:From:To:CC:Subject:In-Reply-To:References"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66MImErH1111943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784746096;
	bh=R6SrU57hacFG4oDF/kYYKWpCQdfvx2DZX725okXN7iw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Q6StkghlczxK+J5XaMrzi6vOfMthD0fNqpLGD2xxRvav4SXtzQbGl8G3TQJSPmIXI
	 VlC+SWKyDDKO6lA6W4YTRVVUnfWVZT2feqY9u7A27/QGVXzg8C5imn9MUKg++Wx88p
	 O7lkbsYu1cAmC6tV4j/atzG8Nhl0Gh/fsPWmniLeHvYWZzsAKE4VlXPKzlRjqY3vYU
	 jbJSPwAduf1GFKTCUTyt+RgOLrq46hI1sOsTv4eecah+EVLjooNiBEX0km9SavCooH
	 PuzwSnPt9o6iN6XRiPh+0plPgSeKwXNinL+984p/ZIUuFtRe92a9N59/wQFHWIIFFW
	 L/dwyiY+JrEVw==
Date: Wed, 22 Jul 2026 11:48:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_2/5=5D_x86/asm=3A_add_volatile=2C_cl?=
 =?US-ASCII?Q?obbers_and_zero-length_check_in_inline_memcmp?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com> <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com> <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
Message-ID: <829A5D01-29A2-454E-AE78-AEAD8FC597E6@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1784746125-674BE2AC-53246492/0/0
X-purgate-type: clean
X-purgate-size: 2395

On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>hpa in To:=2E
>
>On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira wrot=
e:
>> Add the volatile qualifier and clobbers parameter to prevent bugs with
>> instruction reordering and optimization=2E
>>=20
>> Also check the zero-length case, as the 'repe' prefix does not run the
>> 'cmpsb' instruction if the 'count' register is zero, which doesn't set
>
>Please use capital letters for insns: REPE, CMPSB and you don't need to p=
ut
>words in '' - it reads fine without them=2E
>
>> the condition-code/zero flag, so the result is based on a stale flag=2E
>>=20
>> Those are pre-existing issues found by Sashiko=2E
>>=20
>> Link: https://sashiko=2Edev/#/patchset/20260701-pvh-kasan-inline-v6-0-b=
a99045dfa9f%40igalia=2Ecom
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia=2Ecom>
>> ---
>>  arch/x86/include/asm/shared/string=2Eh | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/x86/include/asm/shared/string=2Eh b/arch/x86/include/=
asm/shared/string=2Eh
>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7=2E=2E166274e44f3cb49e3dc=
cab3cdac281d67aef5d44 100644
>> --- a/arch/x86/include/asm/shared/string=2Eh
>> +++ b/arch/x86/include/asm/shared/string=2Eh
>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const voi=
d *s1, const void *s2, size_
>>  {
>>  	bool diff;
>> =20
>> -	asm("repe cmpsb"
>> -	    : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>> +	if (len =3D=3D 0)
>> +		return 0;
>> +
>> +	asm volatile("repe cmpsb"
>> +		     : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len)
>> +		     : : "cc", "memory");
>> =20
>>  	return diff;
>>  }
>
>So this is a fix which should probably go to stable, I think=2E Going bac=
k into
>git history, it points to
>
>  62bd0337d0c4 ("Top header file for new x86 setup code")
>
>from 2007=2E And we have carried it this way through the years and who kn=
ows
>what hit this or not=2E So please make this the first patch in your set -=
 you
>can even send it separately so that I can get route it through stable=2E
>
>Then you can base the rest ontop=2E
>
>Thx=2E
>

I suspect that the zero-length case simply can't happen in the real code, =
but who knows; the use of the code has expanded over the years=2E

