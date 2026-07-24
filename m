Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DE9C531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:54:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370284.1618517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNqG-0000jX-Gv; Fri, 24 Jul 2026 21:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370284.1618517; Fri, 24 Jul 2026 21:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNqG-0000jQ-EJ; Fri, 24 Jul 2026 21:54:04 +0000
Received: by outflank-mailman (input) for mailman id 1370284;
 Fri, 24 Jul 2026 21:54:03 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wnNqF-0000jK-IC
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:54:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNqE-007rpI-VV
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:54:02 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63ded4-e002-0a2a0a5209dd-0a2a45049070-18
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:54:02 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63def9-b57f-0a2a45040019-c689ca88dc9a-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:54:02 +0200
Received: from ehlo.thunderbird.net ([172.56.213.87]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66OLrYZ21917110
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 24 Jul 2026 14:53:37 -0700
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
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66OLrYZ21917110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784930018;
	bh=us+Ot6IZgbcHbaM7rOb0wNq4lvujAX3CF4+WVAZHg/c=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TsafXbX4mBJC9+/AaoHz9jf8HicM5lcrxte6PJD7iUbEyFeG8DRqnlKzS/sjQjgrS
	 VbL9Gz1fTJb77Doef6/hO3wPKkrGQ7fI5k5AP4EUIF7rMJ6LSFphKnY+0aprb1Fb6B
	 Ida2f80Tq82oJYAfs+RmFL1fBxKhg15Ag5/dAF/jGXHyOLyGiFrSDrnLPGpCN1Ra21
	 ly1SAdylo+vFARslMLjJs6pjr/O/CaUuMuNKdmX6sw4hswkkgNcYHsejcVJWl3Tyz2
	 UwdBHJfD3dd/K0jJIqfxwRa1+ctuCz218O0cJ20g8siYW3BwFGV5hYnSrrobCDgY8F
	 VxH4IP2zcSfNA==
Date: Fri, 24 Jul 2026 14:53:21 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
        Borislav Petkov <bp@alien8.de>
CC: Jan Beulich <jbeulich@suse.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_2/5=5D_x86/asm=3A_add_volatile=2C_cl?=
 =?US-ASCII?Q?obbers_and_zero-length_check_in_inline_memcmp?=
User-Agent: K-9 Mail for Android
In-Reply-To: <8df0340f0dc7f6c303c6a7da78fad7b8@igalia.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com> <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com> <20260722170334.GCamD35gwrCng30WH1@fat_crate.local> <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com> <4daed8ac-b533-436f-9f86-6d297b87abbb@suse.com> <5e19b195-0ca2-4510-81cb-497b40e4aaf5@zytor.com> <8df0340f0dc7f6c303c6a7da78fad7b8@igalia.com>
Message-ID: <7148BD5B-2E06-4137-B361-18AAF329DDC5@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-ebf023/1784930042-528C9B50-9F7ECFF5/0/0
X-purgate-type: clean
X-purgate-size: 4964

On July 23, 2026 5:35:02 PM PDT, Mauricio Faria de Oliveira <mfo@igalia=2Ec=
om> wrote:
>On 2026-07-23 20:12, H=2E Peter Anvin wrote:
>> On 2026-07-22 23:59, Jan Beulich wrote:
>>>>=20
>>>> Also, this is silly=2E Instead of adding a whole separate test, just =
do "test %3,%3" before the repe to set ZF and let the REPE skip=2E
>>>=20
>>> Besides this, isn't the function effectively returning bool wrong anyw=
ay? This
>>> way you can use it for equal / not-equal comparisons, but not for sort=
ing and
>>> alike=2E
>>>=20
>> There is no use case in the early code for sorting, and it seems rather=
 broken
>> to burden the code with that=2E
>
>If this is merged, other users not in early code might eventually
>appear, which might introduce the use case for sorting=2E Even though tha=
t
>is unlikely, as such users could probably use regular memcmp() instead,
>consider that just in case, so I can ask for your input/advice on this:
>
>> That being said it probably should return bool explicitly (it makes no =
sense
>> for the prototype to be different than the internal variable=2E)
>>=20
>> We could call it memneq() if someone really, really cares, I guess=2E
>>=20
>> The early code is very size-sensitive, so I'm really not fond of the id=
ea of
>> burdening it further=2E Perhaps something like:
>
>Do you think this implementation (returns -1/0/+1) is reasonable,
>size-wise, for early code?
>
>I considered submitting it eventually, once the return value difference
>to regular memcmp() was called out [0], as an improvement, if there's
>agreement this would be a good idea considering the scenario above=2E
>
>static __always_inline int __inline_memcmp(const void *s1, const void
>*s2, size_t len)
>{
>        int above, below;
>
>        asm volatile("test %2, %2\n\t"
>                     "repe cmpsb"
>                     : "+S" (s1), "+D" (s2), "+c" (len),
>                       "=3D@cca" (above), "=3D@ccb" (below)
>                     : : "memory");
>
>        return above - below;
>}
>
>@ arch/x86/boot/string=2Eo
>00000028 <memcmp>:
>  28:   66 57                   push   %di
>  2a:   66 56                   push   %si
>  2c:   66 89 c6                mov    %ax,%si
>  2f:   66 89 d7                mov    %dx,%di
>
>  32:   66 85 c9                test   %cx,%cx
>  35:   f3 a6                   repz cmpsb %es:(%edi),%ds:(%esi)
>  37:   0f 97 c0                seta   %al
>  3a:   66 0f b6 c0             movzbw %al,%ax
>  3e:   0f 92 c2                setb   %dl
>  41:   66 0f b6 d2             movzbw %dl,%dx
>  45:   66 29 d0                sub    %dx,%ax
>
>  48:   66 5e                   pop    %si
>  4a:   66 5f                   pop    %di
>  4c:   66 c3                   retw
>
>> A memory clobber is ugly here since no memory is actually modified, alt=
hough
>
>I'm definitely not an expert, but IIUIC, this memory clobber is for
>reads, not writes? Say, a caller/optimized code that writes to the
>buffer(s) prior to __inline_memcmp() and data might still reside in
>registers; even if theoretical/unlikely=2E
>
>As in [1]:
>
>  The "memory" clobber tells the compiler that the assembly code
>performs memory reads or writes [=2E=2E=2E] (for example, accessing the m=
emory
>pointed to [=2E=2E=2E])=2E To ensure memory contains correct values, GCC =
may
>need to flush specific register values to memory before executing the
>asm=2E
>
>> it probably doesn't affect code; "cc" is completely redundant with cond=
ition
>> code output operand=2E
>
>Thanks for explaining=2E I'll remove that in the next version=2E
>
>[0]
>https://lore=2Ekernel=2Eorg/all/324ef97b16f52e0ccc72f6381d1b5dd2@igalia=
=2Ecom/
>[1]
>https://gcc=2Egnu=2Eorg/onlinedocs/gcc/Extended-Asm=2Ehtml#Clobbers-and-S=
cratch-Registers-1
>
>cheers,
>
>> static __always_inline bool
>> __inline_memcmp(const void *s1, const void *s2, size_t len)
>> {
>> 	bool diff;
>>=20
>> 	if (__builtin_constant_p(len =3D=3D 0)) {
>> 		if (!len)
>> 			return false;
>> 		asm volatile("repe cmpsb"
>> 				: "=3D@ccnz" (diff),
>> 				  "+D" (s1), "+S" (s2), "+c" (len)
>> 				: : "memory");
>> 	} else {
>> 		/* Clear ZF beforehand in case len =3D=3D 0 */
>> 		asm volatile("test %3,%3; repe cmpsb"
>> 				: "=3D@ccnz" (diff),
>> 				  "+D" (s1), "+S" (s2), "+c" (len)
>> 				: : "memory");
>> 	}
>> 	return diff;
>> }
>
>

It's pretty bloaty; I don't know exactly how much the rest of the code blo=
ats=2E

I would be fine with having mem[n]eq() though as an explicit API=2E For th=
e out-of-line version used for compiler-generated memcmp() calls it doesn't=
 matter=2E=20

Here is a very compact way the out-of-line version can be written (showing=
 the 64-bit version; formatting apologies, on a phone):

xor %eax,%eax    /* Sets ZF */
repe cmpsb
jr z,1f
movzbl -1(%rdi),%edi
mov -1(%rsi),%al
sub %edi,%eax
1: ret




