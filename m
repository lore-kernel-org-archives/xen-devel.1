Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26477C531CC
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2026 00:49:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1369772.1618319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn46W-00010L-C1; Fri, 24 Jul 2026 00:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1369772.1618319; Fri, 24 Jul 2026 00:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wn46W-00010E-7s; Fri, 24 Jul 2026 00:49:32 +0000
Received: by outflank-mailman (input) for mailman id 1369772;
 Fri, 24 Jul 2026 00:49:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brgerst@gmail.com>) id 1wn46U-000108-Gz
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 00:49:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wn46T-008s7k-GE
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2026 02:49:29 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brgerst@gmail.com>)
 id 6a62b662-2eae-0a2a0a5409dd-0a2a450b82e6-24
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 02:49:29 +0200
Received: from [209.85.217.42] (helo=mail-vs1-f42.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brgerst@gmail.com>)
 id 6a62b698-b7e8-0a2a450b0019-d155d92ae032-3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Jul 2026 02:49:29 +0200
Received: by mail-vs1-f42.google.com with SMTP id
 ada2fe7eead31-74ac0efb654so671347137.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jul 2026 17:49:29 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1784854168; cv=none;
        d=google.com; s=arc-20260327;
        b=HS2evN/+RqM8LCF53jIhCkC9D8Km42+sy/cTN2Qspgumes786BOOvq4/r5mdmEAxL+
         W1JvUTi618lwvv0K4Je6zwUywrLs4/v2bU/85LB0RlpN6/KOS1f6sxiGapA4+/DQDbWE
         dibxCczivLlKf3cbHTE/FoUn/YbRMZ0jS43yVW42ny4uYzZPYd36XYRBPFukJB0hmq9u
         sqf50goIngkoC4qfCbDakNZZuDVYSE0hAcxQjoH/DXejvbjQXqKb/0+EvASkYxKwDC3j
         M+g9VZFZ81Z9oDv8tgzgLzYtQCXGTPe8YfmWAcmbHKJrJZBqpIu5vpHVmxHu/M8CluG0
         lN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHdU6G1F9MKnhrV0MttU1GATQHfTchrhi/+r4Nb6dJY=;
        fh=kXUsuW/8EmFLxOq4p73gFZOIEx4lTXvKzfkxyuUpyIU=;
        b=i+K7Snu5jo0AWs9JPr+XbhCugPWoNMxKskrtMemv5QfD/Iuy/pNl3qwe7eLNqACvzg
         AgzUP1kT8Q2+Fo/ZGH7td/nuYjkoNdoKVPY4U4pqNRDFG/zMYLTD5NZJfjDedP0Auixi
         M6bAD3Y8Qv1Q7+xrv3OATXJEuXHo+9RC3Hv9ITd1Tgu4tjDDqVnJQt4yAS782MsLMzSB
         z9fwL7Cz8j2UJ4OFc43aRaPFjWbmtbpWOUBKHz9iWy6eVQlYVP2B8tGTlQWrquOiyJ6o
         k+qJ2Wuv+b1YMzaWZllGygivU40EsC5NvtQLwhMdNoH4aDbaNecknoEEZ0kWMTfELNl3
         BclA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784854168; x=1785458968; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHdU6G1F9MKnhrV0MttU1GATQHfTchrhi/+r4Nb6dJY=;
        b=GqDlkEnMMN0Bb9CZBac0ccBnVc2o3KlO5bg9JODG2e9k/7x4jdV8TlNx8a63rQIzU0
         /g+5NZ0YPzDcxi0+nPWyezPxV742mFLFy0bVkEoE8KgwuIRDlkIEd7d5H1oAVpZL8Np2
         2kiqp7f/mA3kza328hQ20N2D8SCgL8080P6GUVdQhecpFGnEuWAR9GmaBt/ACn3gmImb
         f2o0d95dWpbLgGxMHsZu1TIg3Im1zGAk59sRcfFV5G3SxYLLGz5m6D7JetXGzCFfIR8C
         RnJTEGaF/bXVREkAroOFklt90dvQpHP8LLxt0Ocbca+jv9YBqp7UPnQr3PnCRMMGxK1o
         h68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784854168; x=1785458968;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHdU6G1F9MKnhrV0MttU1GATQHfTchrhi/+r4Nb6dJY=;
        b=hqQ3R8881bPhIMYoIV0eA4DQd2uiVCsQNGITgWSmz6P+2xUjiTGRN7gvbyZeRPHEZe
         MfMGBTqlEW+FGV5cLPfPphsgrWZ02Ilq4V1dCAIH894RwyTtih3RDeqrs1RIZ5UzdnPM
         HOKagiudR1pUxacTml40NKZynEiHAxjZv6Gwciq8dukrlo89iiW8TWkhs/0LuoR+xLMt
         jYAqJHw7jV+t9C7c0GD+DP/G1d9pB4D+ZIRKThIe8/wPwuMJtwHAfFDaSN3JUaZ/TQS4
         ujNkvoxg6K2o5I7GmDSvVHY71s5tsy+MrbRALFew7rralHCHvStcvvLk9o2G0Cyyhu18
         nGww==
X-Forwarded-Encrypted: i=1; AHgh+RpB0o5oPhJEyFPLD5GKWbCJYT25ovcfzGjtl2596hMxekgRKBj4Hk1FX6FRpiFu3keKMO9I1xIpOws=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxk748YDZvY70YJG94ZdxaeRU79TZ9+2zAuYONSM4cTfTmLDXO6
	VtKV2Kg1KVJlOwS1ry/m+XEiAiQ2XeOLlkAQwyOrmq+QHxnIVfjme4O/zIsTvdB4L87gSjQ4YwG
	V6z3ehbFfePZtRypMgcH3mBd1g1xgQg==
X-Gm-Gg: AR+sD10hH8t/Py4L9xqU6weFw4BLkjJvFLeBCmBKkj/prWyNol/TQ8HNISWa0jJq4js
	xR95uijiL8xCrJM0xUUbdFSIM8BjIAgfTzqXX73kGNhByKM7w4juStGRlnbbyMNVdPo8UEC6A9m
	wfKIKKuQfCRXdfgsE99nXRwMHJTafT9qwmoPU1hKF9aGA/7V2oKoWNDmNbKKfyHBtjElbOJGxbg
	YSU1pq96NC0lqcbhANANymUTwcsVuGxQfMMg53PM3Vg3aVE5L+xZ3bt+XliG/64KKseHG4Qo/lY
X-Received: by 2002:a05:6102:e0d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-74d602e4befmr3177977137.20.1784854167835; Thu, 23 Jul 2026
 17:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
 <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com> <20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
 <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com> <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com>
 <2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com>
In-Reply-To: <2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Thu, 23 Jul 2026 20:49:13 -0400
X-Gm-Features: AUfX_mwUupTj5Oc-riwrNGSO2nErFQHgNj2MqU6MavNa8LaZnbzCF08lw5MUBWc
Message-ID: <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Juergen Gross <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com, 
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1784854169-AA4DB9EA-6BA6CF61/0/0
X-purgate-type: clean
X-purgate-size: 3720

On Thu, Jul 23, 2026 at 7:13=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrot=
e:
>
> On 2026-07-23 12:37, Brian Gerst wrote:
> > On Wed, Jul 22, 2026 at 2:53=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> =
wrote:
> >>
> >> On July 22, 2026 10:03:34 AM PDT, Borislav Petkov <bp@alien8.de> wrote=
:
> >>> hpa in To:.
> >>>
> >>> On Tue, Jul 21, 2026 at 12:56:43PM -0300, Mauricio Faria de Oliveira =
wrote:
> >>>> Add the volatile qualifier and clobbers parameter to prevent bugs wi=
th
> >>>> instruction reordering and optimization.
> >>>>
> >>>> Also check the zero-length case, as the 'repe' prefix does not run t=
he
> >>>> 'cmpsb' instruction if the 'count' register is zero, which doesn't s=
et
> >>>
> >>> Please use capital letters for insns: REPE, CMPSB and you don't need =
to put
> >>> words in '' - it reads fine without them.
> >>>
> >>>> the condition-code/zero flag, so the result is based on a stale flag=
.
> >>>>
> >>>> Those are pre-existing issues found by Sashiko.
> >>>>
> >>>> Link: https://sashiko.dev/#/patchset/20260701-pvh-kasan-inline-v6-0-=
ba99045dfa9f%40igalia.com
> >>>> Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
> >>>> ---
> >>>>  arch/x86/include/asm/shared/string.h | 8 ++++++--
> >>>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/arch/x86/include/asm/shared/string.h b/arch/x86/include=
/asm/shared/string.h
> >>>> index 02b92927553f7b8e1c87e6122bbaa70439e57ea7..166274e44f3cb49e3dcc=
ab3cdac281d67aef5d44 100644
> >>>> --- a/arch/x86/include/asm/shared/string.h
> >>>> +++ b/arch/x86/include/asm/shared/string.h
> >>>> @@ -11,8 +11,12 @@ static __always_inline int __inline_memcmp(const =
void *s1, const void *s2, size_
> >>>>  {
> >>>>      bool diff;
> >>>>
> >>>> -    asm("repe cmpsb"
> >>>> -        : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (len));
> >>>> +    if (len =3D=3D 0)
> >>>> +            return 0;
> >>>> +
> >>>> +    asm volatile("repe cmpsb"
> >>>> +                 : "=3D@ccnz" (diff), "+D" (s1), "+S" (s2), "+c" (l=
en)
> >>>> +                 : : "cc", "memory");
> >>>>
> >>>>      return diff;
> >>>>  }
> >>>
> >>> So this is a fix which should probably go to stable, I think. Going b=
ack into
> >>> git history, it points to
> >>>
> >>>  62bd0337d0c4 ("Top header file for new x86 setup code")
> >>>
> >> >from 2007. And we have carried it this way through the years and who =
knows
> >>> what hit this or not. So please make this the first patch in your set=
 - you
> >>> can even send it separately so that I can get route it through stable=
.
> >>>
> >>> Then you can base the rest ontop.
> >>>
> >>> Thx.
> >>>
> >>
> >> Also, this is silly. Instead of adding a whole separate test, just do =
"test %3,%3" before the repe to set ZF and let the REPE skip.
> >
> > REPE does not check ZF before the first iteration.
> >
> > From the Intel SDM:
> > "When the REPE/REPZ and REPNE/REPNZ prefixes are used, the ZF flag
> > does not require initialization because both
> > the CMPS and SCAS instructions affect the ZF flag according to the
> > results of the comparisons they make."
> >
>
> The point was to ensure we have a valid result in ZF (which should be ZF=
=3D1)
> even if len =3D 0.

I had originally thought that the test for RCX=3D=3D0 was also at the end
of the loop, after the decrement.  But a closer look at the
pseudo-code in the SDM does show that the test is at the start of the
loop.  Starting with RCX=3D=3D0 does indeed skip the comparison and does
not touch ZF.  Your suggestion is good, but should have a comment
explaining why it's there to someone reading the code in the future.

