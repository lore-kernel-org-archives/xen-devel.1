Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDD9CD98CC
	for <xen-devel@archiver.kernel.org>; Thu, 11 Jun 2026 14:50:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1335727.1597897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgjG-0003Qg-40; Thu, 11 Jun 2026 14:49:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1335727.1597897; Thu, 11 Jun 2026 14:49:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXgjG-0003QZ-1C; Thu, 11 Jun 2026 14:49:58 +0000
Received: by outflank-mailman (input) for mailman id 1335727;
 Thu, 11 Jun 2026 14:49:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wXgjF-0003QT-Dx
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 14:49:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXgjE-00DD6U-GV
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2026 16:49:56 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2acb13-2eae-0a2a0a5409dd-0a2a4505a53a-6
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:49:56 +0200
Received: from [74.125.224.49] (helo=mail-yx1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a2acb13-aaa8-0a2a45050019-4a7de031a8c0-3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 16:49:56 +0200
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6626b5ace23so522727d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jun 2026 07:49:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1781189395; cv=none;
        d=google.com; s=arc-20240605;
        b=hrVpRMJrKeSqB1cOyZCEGX6jaUK+dPHEBi7ik7XEeVz5awXZxu89tdhdd2NWFpoNTv
         XZhdznk3yGKvBgEqruFjGZBPLPfFTSGmWtc9gLk13GbzALrU1R8SDZ03NUmeeFfsw4kC
         00UBAUb4+dKXhfIIwB442dcORpGEHUChHIdkm70WKeILAhyhczB++cfNcSRnCWxv39lf
         hVwJVNgCtaEaMpmVhbC/gqwisvBf6CGz4FiM+7GTdqMx0WF9MQICX3TiP7yd7Wl/hfJp
         NS4sxrPU4PcIIduaNAjvuH+DtZpTZGvjkuX8w6gieNNUEDePxCwuBQYZ/4NqM8I9WgRj
         /i9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=moTCC/8SdmNIwtUxXbsXuDbFrih4JjrEM9T7hJKhFlg=;
        fh=u9Gugbv7nDZYHETIpcjIyYj9si536uXJFSYjxWXrzIo=;
        b=gq7v0cBzEStnXbKIejYq8PhRyaF306zp+uwTItccTt4kGnZ1crrCyN1VFNQiFT4laX
         cx+Z14GhPmDGxHA2bOyYSGO995orY6a+m9FPOOhEhc8p5hTF4U6HFFHdtV6TUdNubKM0
         lT7s7775A63IKm0kaYOtXB7YfiOKSFeqSxV4hMXxsDAVBTx/xCY8p9ig/o714YBewHt3
         Z+AwwKx9BeaE2rJck8RkrFnfWGCjCi4EQwBC2MSYg1dAu6Ae9EY6XJWz8Vw99vyEbJhu
         NRv8LxnMuILOxg5juqlXQYxPynaE6FAOFPS1hOXz7z0XvxB5nl9s4nyDptU4gQw+gIZi
         GfFQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781189395; x=1781794195; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=moTCC/8SdmNIwtUxXbsXuDbFrih4JjrEM9T7hJKhFlg=;
        b=OfxQzt1xahbysO1YAffXMGDhHjjEpsWs8OAr+qWaioPAa+HBOyQDFF3JDe3WeSHjQm
         6SDLXmFRo9ijkedGU6cvZ1mdMViKGYXYjTyjKzcD0KhncN4rxsyKuu21Cuvoemfy/Knv
         m44MEK6/XSnE4SAMzs1HE+Bggx09JX0mbNH+Hr3H86EyB6uzBVo745EGjw5qOv9AzumN
         dEhdHN5TWsdsVf95TeoXKJcB3W1daEYcTwLma0+K7mdlBItxIPGZOsM++mnKPu4WOqNE
         zCUeX/PMO+dFuQOzvJuPerZqkb9ojMNlGHepU/00f3cbgLGDY27SadBIb9+FrEpaYV2x
         3Org==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781189395; x=1781794195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=moTCC/8SdmNIwtUxXbsXuDbFrih4JjrEM9T7hJKhFlg=;
        b=ifdSzMcaJUluiikV70W0/ubOvhDcoI65+SR98PGEyehzT1njCqdsp4QMnrwbXY3b7J
         iOHBmUCktz7cE3U7f6PqSfJmYdrXCU3mSUja41t3qWQjJLTjpQ6SKrmLWP56He2Me3X3
         gBJcW4v2pYs+ve+pLBD1v27TBNJJ/WR+Q8W7b/m/8vMga9AqlTxBAq2UWJvgDQSOh2bM
         tXSFyRj4BILJvyNczRkE0nBk6q6Dk2kK+Kfymrh2/lJB6sRkkdKp4xRN4s4vSy0792Nx
         /sQvkz8TI2wT3HbnHDhmOISAV7wiqj7gcMdRr7WcyKPRi1lEpVJwLMWC+TqssQTiy64z
         AaSA==
X-Forwarded-Encrypted: i=1; AFNElJ/Zd1/+1P3DeVgMe7/bOFJlR2NLiD0XcD5537Vo4Q1Nv7u7An+H13YBpkYjXsCuXMyprGF2GW41UtY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz28IEmr+Lts3kwSWc18EX86hnVFVv1JQZoz09jUB+nNV+ty+sU
	sliFJif9Fa/lpDCos0PZSzSI/dw4x1eMbg/5jZXQLv5NbPckt1M45fAs6OwCPN2yMlYEbCOYz/Y
	/ddrbCzddiIHmaFgyiSRUi+uE/+/rAos=
X-Gm-Gg: Acq92OHmR4kFc75BHNg5+EyDxQOmxMoBZhR75QAW2c3tzMsJ6NJeoUDbupASa1ouuyj
	JovXhqCsLC5cDjYL82tw7E8ITL4z5UVMu1TtjKW6rDpb/pAHF2b4s3jtUzhfpgVMDuMXIoqFJ1J
	8oJPhPeAHTVNfZFAG/fOho8C0s8mcW4Ryq+fqOYLS8lSAqwBdSu0ZrLHIxTNwJ1WGIT1T0XQqym
	aUerx3GFaLvrBwVKbp7J+faDIG/GmX/MNTkPkED+Uh49KxKH+BY9NlgmiJm4if+xVPn9Wa7KUAf
	K5ANBP9wmh3ASoCkwbIQ6Dje1tJXDGQgWpVOT1+XmzX7LR7Q
X-Received: by 2002:a05:690e:14cd:b0:65d:f682:a59b with SMTP id
 956f58d0204a3-66269e1e0e3mr1805519d50.26.1781189394703; Thu, 11 Jun 2026
 07:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260529153531.1341542-1-frediano.ziglio@cloud.com>
 <20260529153531.1341542-3-frediano.ziglio@cloud.com> <7067092e-ba18-4513-a9b1-83ba084ccbb4@suse.com>
 <CAHt6W4cP57pAPsNDKpssjYB=snLEZgOhWkYkVrJys01-NTMiRQ@mail.gmail.com>
 <75e86d74-9fa1-4090-bea7-332ec31ffb90@suse.com> <CAHt6W4dfXdyw4dOkqoQzo0x4XRmLsHXkhhznov+KvanKBi9bWw@mail.gmail.com>
 <5bee4f94-b2d0-4802-a990-b2a378d2f838@suse.com>
In-Reply-To: <5bee4f94-b2d0-4802-a990-b2a378d2f838@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 11 Jun 2026 15:49:42 +0100
X-Gm-Features: AVVi8CdMKLOMLtSAUGMUY11VqKUja0jPKPlX-nqnfonJTpcrDkFbFwUhvhiZQpM
Message-ID: <CAHt6W4cb4R7i79s9wYRpPfOdmkKS+XsaO=VphZ+jvmLKiRw-ZA@mail.gmail.com>
Subject: Re: [PATCH 2/6] Align all sections to 4KB
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1781189396-E1F9C443-8A529509/0/0
X-purgate-type: clean
X-purgate-size: 7883

On Wed, 10 Jun 2026 at 10:43, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 06.06.2026 18:02, Frediano Ziglio wrote:
> > Frediano
> >
> > On Fri, 5 Jun 2026 at 08:45, Jan Beulich <jbeulich@suse.com> wrote:
> >>
> >> On 04.06.2026 12:16, Frediano Ziglio wrote:
> >>> On Tue, 2 Jun 2026 at 13:09, Jan Beulich <jbeulich@suse.com> wrote:
> >>>> On 29.05.2026 17:35, Frediano Ziglio wrote:
> >>>>> --- a/xen/arch/x86/xen.lds.S
> >>>>> +++ b/xen/arch/x86/xen.lds.S
> >>>>> @@ -162,8 +162,8 @@ SECTIONS
> >>>>>         __note_gnu_build_id_end = .;
> >>>>>    } PHDR(note) PHDR(text)
> >>>>>  #elif defined(BUILD_ID_EFI)
> >>>>> -  /* Workaround bug in binutils < 2.36 */
> >>>>> -  . = ALIGN(32);
> >>>>> +  /* align to satisfy UEFI CA memory mitigation */
> >>>>> +  . = ALIGN(PAGE_SIZE);
> >>>>>    DECL_SECTION(.buildid) {
> >>>>>         __note_gnu_build_id_start = .;
> >>>>>         *(.buildid)
> >>>>> @@ -330,6 +330,7 @@ SECTIONS
> >>>>>    __2M_rwdata_end = ALIGN(SECTION_ALIGN);
> >>>>>
> >>>>>  #ifdef EFI
> >>>>> +  . = ALIGN(PAGE_SIZE);
> >>>>>    .reloc ALIGN(4) : {
> >>>>>      __base_relocs_start = .;
> >>>>>      *(.reloc)
> >>>>> @@ -355,6 +356,7 @@ SECTIONS
> >>>>>    VIRT_START &= 0;
> >>>>>    ALT_START &= 0;
> >>>>>
> >>>>> +  . = ALIGN(PAGE_SIZE);
> >>>>>    .sbat (NOLOAD) : { *(.sbat) }
> >>>>>  #elif defined(XEN_BUILD_EFI)
> >>>>>    /*
> >>>>
> >>>> You say "all sections" in the title, yet this is not covering e.g. debug
> >>>> info.
> >>>
> >>> I will change to "all loadable sections". debug sections are not
> >>> loadable so they don't cause an issue.
> >>
> >> Please try to be precise there, as some aspects are subtle. As per my
> >> understanding, like .reloc all .debug_* are loadable (and may be loaded).
> >> The IMAGE_SCN_MEM_DISCARDABLE flag merely means they can be discarded at
> >> a certain point after image loading (for .reloc in particular: after
> >> relocations were processed).
> >
> > No, debug sections are not loadable, for instance, in a random
> > executable I found:
> >
> > Sections:
> > Idx Name          Size      VMA               LMA               File off  Algn
> >   0 .text         0000c7f8  0000000140001000  0000000140001000  00000600  2**4
> >                   CONTENTS, ALLOC, LOAD, READONLY, CODE, DATA
> >   1 .data         00000250  000000014000e000  000000014000e000  0000ce00  2**4
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   2 .rdata        00002c70  000000014000f000  000000014000f000  0000d200  2**4
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   3 .pdata        00000654  0000000140012000  0000000140012000  00010000  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   4 .xdata        00000630  0000000140013000  0000000140013000  00010800  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >   5 .bss          00001ec0  0000000140014000  0000000140014000  00000000  2**4
> >                   ALLOC
> >   6 .idata        00000c88  0000000140016000  0000000140016000  00011000  2**2
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   7 .CRT          00000060  0000000140017000  0000000140017000  00011e00  2**2
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   8 .tls          00000010  0000000140018000  0000000140018000  00012000  2**2
> >                   CONTENTS, ALLOC, LOAD, DATA
> >   9 .reloc        0000009c  0000000140019000  0000000140019000  00012200  2**2
> >                   CONTENTS, ALLOC, LOAD, READONLY, DATA
> >  10 .debug_aranges 00000150  000000014001a000  000000014001a000  00012400  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  11 .debug_info   0000d5e4  000000014001b000  000000014001b000  00012600  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  12 .debug_abbrev 000014de  0000000140029000  0000000140029000  0001fc00  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  13 .debug_line   00001a36  000000014002b000  000000014002b000  00021200  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  14 .debug_frame  00000f40  000000014002d000  000000014002d000  00022e00  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  15 .debug_str    000003a0  000000014002e000  000000014002e000  00023e00  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  16 .debug_line_str 00000a76  000000014002f000  000000014002f000  00024200  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  17 .debug_loclists 0000174a  0000000140030000  0000000140030000  00024e00  2**0
> >                   CONTENTS, READONLY, DEBUGGING
> >  18 .debug_rnglists 0000039c  0000000140032000  0000000140032000  00026600  2**0
> >                   CONTENTS, READONLY, DEBUGGING
>
> That's derived from libfd's internal representation, which means nothing at
> all to the loader processing the image. If your objdump is suitably enabled,
> try using its -P option.
>
> Jan

You are right, I got

Section headers (at offset 0x00000188):
 # Name     paddr    vaddr    size     scnptr   relptr   lnnoptr   nrel nlnno
 1 .text    0000c7f8 00001000 0000c800 00000600 00000000 00000000     0     0
            Flags: 60000060: EXECUTE,READ,CODE,INITIALIZED DATA
 2 .data    00000250 0000e000 00000400 0000ce00 00000000 00000000     0     0
            Flags: c0000040: READ,WRITE,INITIALIZED DATA
 3 .rdata   00002c70 0000f000 00002e00 0000d200 00000000 00000000     0     0
            Flags: 40000040: READ,INITIALIZED DATA
 4 .pdata   00000654 00012000 00000800 00010000 00000000 00000000     0     0
            Flags: 40000040: READ,INITIALIZED DATA
 5 .xdata   00000630 00013000 00000800 00010800 00000000 00000000     0     0
            Flags: 40000040: READ,INITIALIZED DATA
 6 .bss     00001ec0 00014000 00000000 00000000 00000000 00000000     0     0
            Flags: c0000080: READ,WRITE,UNINITIALIZED DATA
 7 .idata   00000c88 00016000 00000e00 00011000 00000000 00000000     0     0
            Flags: c0000040: READ,WRITE,INITIALIZED DATA
 8 .CRT     00000060 00017000 00000200 00011e00 00000000 00000000     0     0
            Flags: c0000040: READ,WRITE,INITIALIZED DATA
 9 .tls     00000010 00018000 00000200 00012000 00000000 00000000     0     0
            Flags: c0000040: READ,WRITE,INITIALIZED DATA
10 .reloc   0000009c 00019000 00000200 00012200 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
11 /4       00000150 0001a000 00000200 00012400 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
12 /19      0000d5e4 0001b000 0000d600 00012600 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
13 /31      000014de 00029000 00001600 0001fc00 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
14 /45      00001a36 0002b000 00001c00 00021200 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
15 /57      00000f40 0002d000 00001000 00022e00 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
16 /70      000003a0 0002e000 00000400 00023e00 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
17 /81      00000a76 0002f000 00000c00 00024200 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
18 /97      0000174a 00030000 00001800 00024e00 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA
19 /113     0000039c 00032000 00000400 00026600 00000000 00000000     0     0
            Flags: 42000040: DISCARDABLE,READ,INITIALIZED DATA

I suppose I will change to simply "Align some sections to 4KB"

Frediano

