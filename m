Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF39C531D0
	for <xen-devel@archiver.kernel.org>; Sun, 26 Jul 2026 02:58:47 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370940.1618793 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnp4D-0001QM-Bf; Sun, 26 Jul 2026 02:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370940.1618793; Sun, 26 Jul 2026 02:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnp4D-0001QE-6O; Sun, 26 Jul 2026 02:58:17 +0000
Received: by outflank-mailman (input) for mailman id 1370940;
 Sun, 26 Jul 2026 02:58:16 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hpa@zytor.com>) id 1wnp4C-0001Q7-1k
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 02:58:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnp4B-00FPfM-0e
 for xen-devel@lists.xenproject.org; Sun, 26 Jul 2026 04:58:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <hpa@zytor.com>)
 id 6a65764e-5cb7-0a2a0a5109dd-0a2a4502c28e-16
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 04:58:14 +0200
Received: from [198.137.202.136] (helo=mail.zytor.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <hpa@zytor.com>)
 id 6a6577c4-6ca4-0a2a45020019-c689ca88bd50-3
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jul 2026 04:58:14 +0200
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net
 [76.133.66.138]) (authenticated bits=0)
 by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 66Q2vYTD536917
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Sat, 25 Jul 2026 19:57:34 -0700
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
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 66Q2vYTD536917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1785034657;
	bh=kGfV63mG7ZtSeWXvQizP6lBB+RX//0RIPDV16FrvT8o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CzFeaLEG7P1llSpI85KnYi3kxWtJskBiLEMhU/11u0bTwFa+S944ciWeeOT09G5G4
	 NxRbhl3v5aD4E0613dQrnMo3S/XL2Ep3yIFR39jxuZ2lVQbNO8CpadPbv1LxM3+LIU
	 Md9ScDJh8hqFr4xqODekGpblooPPAKy9V5tAKQXYxMWUj6Ig5tuKhr06gHc+CHeT0y
	 bwD1DorQ076tIwD2QEZ57Z4dPT0/6O8H7txlqmqBytE3MYPKau0x+3iFl6ggGzh7R8
	 3QtnUaSRAHN4pGUEnJsKO2rww+3QOC38dRRIeQT5kYGTXB0yWoQzkYuKHcJhY03hXO
	 LyvQ3gFnQZwow==
Date: Sat, 25 Jul 2026 19:57:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Brian Gerst <brgerst@gmail.com>
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
In-Reply-To: <20260725113445.14ccf42f@pumpkin>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com> <20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com> <20260722170334.GCamD35gwrCng30WH1@fat_crate.local> <0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com> <CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com> <2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com> <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com> <20260725113445.14ccf42f@pumpkin>
Message-ID: <C2EBCD00-4F46-424D-A796-4A0A4B86B8A7@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1785034694-319CB2AC-B00EB744/0/0
X-purgate-type: clean
X-purgate-size: 966

On July 25, 2026 3:34:45 AM PDT, David Laight <david=2Elaight=2Elinux@gmail=
=2Ecom> wrote:
>On Thu, 23 Jul 2026 20:49:13 -0400
>Brian Gerst <brgerst@gmail=2Ecom> wrote:
>
>=2E=2E=2E
>> I had originally thought that the test for RCX=3D=3D0 was also at the e=
nd
>> of the loop, after the decrement=2E  But a closer look at the
>> pseudo-code in the SDM does show that the test is at the start of the
>> loop=2E  Starting with RCX=3D=3D0 does indeed skip the comparison and d=
oes
>> not touch ZF=2E  Your suggestion is good, but should have a comment
>> explaining why it's there to someone reading the code in the future=2E
>
>I have a feeling that was a change between the 8086 and 80286=2E
>I don't have an 8086 book (any more) but I'm sure I remember fixing
>bugs where %cx of zero caused 65536 iterations=2E
>(Fun to find because the vector table is 'first in the line to be
>overwritten=2E)
>
>	David

No, but on the Z80 0 meant 64K=2E

