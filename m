Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80627C44536
	for <xen-devel@archiver.kernel.org>; Wed, 22 Jul 2026 18:47:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1368750.1617935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmbxl-000338-V4; Wed, 22 Jul 2026 18:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1368750.1617935; Wed, 22 Jul 2026 18:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmbxl-000331-SO; Wed, 22 Jul 2026 18:46:37 +0000
Received: by outflank-mailman (input) for mailman id 1368750;
 Wed, 22 Jul 2026 18:46:36 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wmbxk-00032v-Fb
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 18:46:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmbxj-001RnD-Hs
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2026 20:46:35 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a610fd6-e002-0a2a0a5209dd-0a2a450483c8-36
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 20:46:35 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a611009-b57f-0a2a45040019-c689ca888c9e-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Jul 2026 20:46:34 +0200
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66MIk0ND1108880
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 22 Jul 2026 11:46:00 -0700
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
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66MIk0ND1108880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784745962;
	bh=vv4NuIBgZGQHoBeIg2Gczd78scbr9EeELphLC+J5EGM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=G+VJrcS9id2noY1BwUOadPgJWvVLD/Xwm2zTX13Ngabaz7Yz+8RLG/TMTx01Q5D+f
	 MlBWUNAMa954zO71aQx7POjCALNV6uGVMyufkHzV7oLn5kCkKX+/JQ2Kwi5n7ZVNHn
	 Ji7syA5AXrUcjh8JWOtGVUgot4EqnKLS3LevTR1ib2omzG654U2DL/Ab3uq0AwS3si
	 5VM1p075Y8udmFZ/Y7dZFyABLFg8vfixx2PFIWipmDrDalOUW5wrfEvrSiB2pZ7inA
	 w1f8jxH0HuxoD4wv+9fvarI8pfbbKZtiXMWiX69ki/bmkSF+JjeUXiYaIy7IVeZC/h
	 pQ9WOmR8VNbNA==
Date: Wed, 22 Jul 2026 11:45:55 -0700
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
Message-ID: <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1784745995-50CDFB50-E9D11BB6/0/0
X-purgate-type: clean
X-purgate-size: 2391

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

Also, this is silly=2E Instead of adding a whole separate test, just do "t=
est %3,%3" before the repe to set ZF and let the REPE skip=2E

