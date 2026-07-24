Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB81C531C9
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 21:41:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370276.1618509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNeE-0007Lx-H5; Fri, 24 Jul 2026 21:41:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370276.1618509; Fri, 24 Jul 2026 21:41:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnNeE-0007Lq-DP; Fri, 24 Jul 2026 21:41:38 +0000
Received: by outflank-mailman (input) for mailman id 1370276;
 Fri, 24 Jul 2026 21:41:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wnNeC-0007Lk-CS
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 21:41:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnNe9-0026KP-Pa
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 23:41:33 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63dbb5-bab6-0a2a0a5309dd-0a2a4506cf26-26
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:41:33 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a63dc0b-195a-0a2a45060019-c689ca88dbfe-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 23:41:33 +0200
Received: from ehlo.thunderbird.net ([172.56.213.251]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66OLf3tC1897596
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Fri, 24 Jul 2026 14:41:05 -0700
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
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66OLf3tC1897596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1784929266;
	bh=xk4/1NbKq2j814emCqmK+oM3nYVHHT25ig+AsYhm2CI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=LVNbwGDG3GcC7x/akJF7Ov4CF1pTgAbDcCTV6NgjI0vNJI4sJf9mEp1PjBHwi+eek
	 O/AB9YeYmR+Jop20frk/puF/vOfuZI0XyVb1yMHtbwnknJ6knN/j/oT0CBMAV+WLoT
	 hUL2jWzX0H0l24ojMAkvktHPm6vicVDf7uaXaRszbNP4HI1vJzhk7f6rBNAySNddEB
	 L9qonShEPgmxY4shMSSv2ovasibmGgm9i81nSPZ3OplBBv8VbtabwLN2iCx0UNa57A
	 SVW4tyXAPlknujSHoa4ayZr3i3S7z0jf9Ay2ErtQXVjG02qtKitZc/8ke8H2el/huH
	 /JZE+Q7643ZDw==
Date: Fri, 24 Jul 2026 14:40:50 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Brian Gerst <brgerst@gmail.com>
CC: Borislav Petkov <bp@alien8.de>,
        Mauricio Faria de Oliveira <mfo@igalia.com>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
        linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v7_2/5=5D_x86/asm=3A_add_volatile=2C_cl?=
 =?US-ASCII?Q?obbers_and_zero-length_check_in_inline_memcmp?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com> <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com> <20260722170334.GCamD35gwrCng30WH1@fat_crate.local> <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com> <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com> <2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com> <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
Message-ID: <7B30E71C-5893-44A0-B984-F88432462C3C@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1784929293-1FCCD77B-FAFC1BCC/0/0
X-purgate-type: clean
X-purgate-size: 3974

On July 23, 2026 5:49:13 PM PDT, Brian Gerst <brgerst@gmail=2Ecom> wrote:
>On Thu, Jul 23, 2026 at 7:13=E2=80=AFPM H=2E Peter Anvin <hpa@zytor=2Ecom=
> wrote:
>>
>> On 2026-07-23 12:37, Brian Gerst wrote:
>> > On Wed, Jul 22, 2026 at 2:53=E2=80=AFPM H=2E Peter Anvin <hpa@zytor=
=2Ecom> wrote:
>> >>
>> >> On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8=2Ede> w=
rote:
>> >>> hpa in To:=2E
>> >>>
>> >>> On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveir=
a wrote:
>> >>>> Add the volatile qualifier and clobbers parameter to prevent bugs =
with
>> >>>> instruction reordering and optimization=2E
>> >>>>
>> >>>> Also check the zero-length case, as the 'repe' prefix does not run=
 the
>> >>>> 'cmpsb' instruction if the 'count' register is zero, which doesn't=
 set
>> >>>
>> >>> Please use capital letters for insns: REPE, CMPSB and you don't nee=
d to put
>> >>> words in '' - it reads fine without them=2E
>> >>>
>> >>>> the condition-code/zero flag, so the result is based on a stale fl=
ag=2E
>> >>>>
>> >>>> Those are pre-existing issues found by Sashiko=2E
>> >>>>
>> >>>> Link: https://sashiko=2Edev/#/patchset/20260701-pvh-kasan-inline-v=
6-0-ba99045dfa9f%40igalia=2Ecom
>> >>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia=2Ecom>
>> >>>> ---
>> >>>>  arch/x86/include/asm/shared/string=2Eh | 8 ++++++--
>> >>>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> >>>>
>> >>>> diff --git a/arch/x86/include/asm/shared/string=2Eh b/arch/x86/inc=
lude/asm/shared/string=2Eh
>> >>>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7=2E=2E166274e44f3cb4=
9e3dccab3cdac281d67aef5d44 100644
>> >>>> --- a/arch/x86/include/asm/shared/string=2Eh
>> >>>> +++ b/arch/x86/include/asm/shared/string=2Eh
>> >>>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(cons=
t void *s1, const void *s2, size_
>> >>>>  {
>> >>>>      bool diff;
>> >>>>
>> >>>> -    asm("repe cmpsb"
>> >>>> -        : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
>> >>>> +    if (len =3D=3D 0)
>> >>>> +            return 0;
>> >>>> +
>> >>>> +    asm volatile("repe cmpsb"
>> >>>> +                 : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" =
(len)
>> >>>> +                 : : "cc", "memory");
>> >>>>
>> >>>>      return diff;
>> >>>>  }
>> >>>
>> >>> So this is a fix which should probably go to stable, I think=2E Goi=
ng back into
>> >>> git history, it points to
>> >>>
>> >>>  62bd0337d0c4 ("Top header file for new x86 setup code")
>> >>>
>> >> >from 2007=2E And we have carried it this way through the years and =
who knows
>> >>> what hit this or not=2E So please make this the first patch in your=
 set - you
>> >>> can even send it separately so that I can get route it through stab=
le=2E
>> >>>
>> >>> Then you can base the rest ontop=2E
>> >>>
>> >>> Thx=2E
>> >>>
>> >>
>> >> Also, this is silly=2E Instead of adding a whole separate test, just=
 do "test %3,%3" before the repe to set ZF and let the REPE skip=2E
>> >
>> > REPE does not check ZF before the first iteration=2E
>> >
>> > From the Intel SDM:
>> > "When the REPE/REPZ and REPNE/REPNZ prefixes are used, the ZF flag
>> > does not require initialization because both
>> > the CMPS and SCAS instructions affect the ZF flag according to the
>> > results of the comparisons they make=2E"
>> >
>>
>> The point was to ensure we have a valid result in ZF (which should be Z=
F=3D1)
>> even if len =3D 0=2E
>
>I had originally thought that the test for RCX=3D=3D0 was also at the end
>of the loop, after the decrement=2E  But a closer look at the
>pseudo-code in the SDM does show that the test is at the start of the
>loop=2E  Starting with RCX=3D=3D0 does indeed skip the comparison and doe=
s
>not touch ZF=2E  Your suggestion is good, but should have a comment
>explaining why it's there to someone reading the code in the future=2E
>

See other post=2E

