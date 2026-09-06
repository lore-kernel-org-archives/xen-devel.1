Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313BEC79F8C
	for <xen-devel@archiver.kernel.org>; Sun,  6 Sep 2026 18:16:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1410465.1641362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3HPi-0008F6-83; Sun, 06 Sep 2026 18:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1410465.1641362; Sun, 06 Sep 2026 18:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3HPi-0008Ez-3Z; Sun, 06 Sep 2026 18:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1410465;
 Sun, 06 Sep 2026 18:16:20 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1x3HPg-0008Et-OH
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 18:16:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3HPf-006zlu-SE
 for xen-devel@lists.xenproject.org; Sun, 06 Sep 2026 20:16:20 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a9dadb8-2eae-0a2a0a5409dd-0a2a450cc842-24
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 20:16:19 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a9dadf1-f479-0a2a450c0019-c689ca88c9be-3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Sep 2026 20:16:18 +0200
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 686IFdJ2989969
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sun, 6 Sep 2026 11:15:39 -0700
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=2026082801 header.d=zytor.com header.i="@zytor.com" header.h="Date:From:To:CC:Subject:In-Reply-To:References"
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 686IFdJ2989969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026082801; t=1788718541;
	bh=DhRKyzANNARtmaWAz4jDDix5ntjLK+kItZzluS+D+BQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=My5wT8OQBzVZyrqJR8KvHJV9I7W4IPlJ3k+N1opZm9C4RhQbBHPkMIsiGH4D2WXmq
	 +CYlxhppw5y9EgKmYnWHx4hLBlthWwC0uFmTSvcXgviltv2uImyN1pue9kESh+J2QJ
	 QbqRDmoUiTUb4BfVsk+UCS1z2gix8XSM0GJW/gZA+EArA5vCCzvzd0vq0af6CWn3Sp
	 w1loWnM91xquRmfSrUfad02Cmv3ACRf4eUTCU+rZGvw6WSTpm0/2DdkFZmDVFVF40O
	 44I7W65KC1lgkxbo8t7DhLUe0yBiwGrDdl0yrPQBj9eirxzUMqa6iEyjlEqYdB7b0k
	 0gTCPh/269mAA==
Date: Sun, 06 Sep 2026 11:15:33 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Jan Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
        kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
User-Agent: K-9 Mail for Android
In-Reply-To: <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com> <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com> <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
Message-ID: <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1788718579-52331A5B-498861EC/0/0
X-purgate-type: clean
X-purgate-size: 1993

On September 6, 2026 10:01:16 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrot=
e:
>On Sat, Aug 22, 2026 at 03:33:18PM -0300, Mauricio Faria de Oliveira wrot=
e:
>> Move the inline memcmp function currently only available in 'boot/strin=
g=2Ec'
>> into the shared string function header <asm/shared/string=2Eh> to be re=
used=2E
>>=20
>> This is not done through <asm/string=2Eh> to avoid pulling unnecessary =
code
>> in 'boot/string=2Ec' that causes build errors in 'boot/compressed/strin=
g=2Ec'
>> and 'purgatory/purgatory=2Ero'=2E
>
>Please drop those '' quotes - it is perfectly clear that those are =2Ec f=
iles=2E
>
>> No functional changes=2E
>>=20
>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia=2Ecom>
>>=20
>> ---
>>=20
>> Thanks to David Laight for noticing the return value difference between
>> inline and regular memcmp()=2E
>> ---
>>  arch/x86/boot/string=2Ec               | 13 ++-----------
>>  arch/x86/include/asm/shared/string=2Eh | 26 ++++++++++++++++++++++++++
>>  2 files changed, 28 insertions(+), 11 deletions(-)
>
>=2E=2E=2E
>
>> diff --git a/arch/x86/include/asm/shared/string=2Eh b/arch/x86/include/=
asm/shared/string=2Eh
>> new file mode 100644
>> index 0000000000000000000000000000000000000000=2E=2E06c1d5e5013e4d59cfb=
49866d10e164362d2c4cc
>> --- /dev/null
>> +++ b/arch/x86/include/asm/shared/string=2Eh
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2=2E0 */
>> +#ifndef _ASM_X86_SHARED_STRING_H
>> +#define _ASM_X86_SHARED_STRING_H
>> +
>> +/*
>> + * This inline memcmp() returns 0 (equal) or 1 (not equal)=2E
>> + * The regular memcmp() returns <0 (less than), 0 (equal), or >0 (grea=
ter than)
>> + * to indicate ordering as well=2E
>
>No need to overdo it:
>
>	Returns:	0 (equal)
>			1 (not equal)
>
>In contrast, the regular memcmp() follows glibc return value semantics=2E
>
>

Worth noting that memeq() and streq() are becoming used in other contexts,=
 e=2Eg=2E glibc=2E

