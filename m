Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0FDC79FB7
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 21:40:24 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413715.1643771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Q1M-0001Ch-4D; Wed, 09 Sep 2026 21:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413715.1643771; Wed, 09 Sep 2026 21:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Q1M-0001Ca-0e; Wed, 09 Sep 2026 21:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1413715;
 Wed, 09 Sep 2026 21:39:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x4Q1L-0001CP-1X
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 21:39:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4Q1J-00DcVO-MJ
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 23:39:53 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa1d1c8-e002-0a2a0a5209dd-0a2a4506e4ac-42
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 23:39:53 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa1d229-195a-0a2a45060019-4a7de14caf29-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 23:39:53 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-482f6356256so1157387f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 14:39:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4859162f354sm38982359f8f.20.2026.09.09.14.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2026 14:39:52 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788989993; x=1789594793; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GEVD0ONiRBgZcGn2NlyLse7rj8h6967aW8UFFN5/dyY=;
        b=KkQ+6j3mSfvIznSip3tN9o6tjzAfJ4pifM2kJR1AnSJYonMXwh1Wx0KVTV30Owezh/
         f1j1+gjD/CibEvT1KCs6oMa1VEEjN5TravUSvJ6SespW13xFlt3XNLAmJeFLA9ojeTRx
         /Gn0DpvKzIXGIE5zys1egE9yStBnUY9xMuMAWgoe/02cEm7t/EAnFPuivWqu+trx5ePT
         T/EirEnF5To/EVmXeiFwDD4+cnfAuuXMfdT9RK4ob5qWSFnaurH/Q594KsH70HSWYW+n
         MNoxuPijULnvmtwIVhKnsedJdZtuwCuspLOYTdLTKW26bGWgAQoxPzozJcr2MZeJyNrS
         FoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989993; x=1789594793;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GEVD0ONiRBgZcGn2NlyLse7rj8h6967aW8UFFN5/dyY=;
        b=HTkzvYEZa8KyIfllap4/w/co0KrFod3X0xSyECvo8VDelT52qIcpOwjcZTJalX05h5
         q70q79+i5eHFriUGUTJr8+UHgB9O+//5N+E2KS7w5BVb3n5CP/zKEuKDoxhXFy5dNg8U
         UPz5BpZNYzBnshAfBXJ5KkE68VDMeTBu/++0D2mm+aLcXpcn8N3XRvUWhsYK0cUyzI0i
         XbI8uv3TB7Gy79UZKZN8RGTzfsE2/5XNow3b4ZrD/UK1PkR0u286rNqAGsgXAvLJWRf8
         NtLzT+mRCRyxjSVi7z1jj7r0itUeI7koFfZlDk8uIj5QF58np6Xwtj29eTGo+fRWauI6
         ClFQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3Xx3Oc7JcVvbo6+DACFo5+N/KMqlThUJTfqOE1UKSSDaxjyxQfr7yMDvDW0gY7NU/ezIJHeuDXII=@lists.xenproject.org
X-Gm-Message-State: AFuF++m63X2NyzPrN+QP6pwoDPuyPYTB8AHZtDvQSyGqELEo/Z8yoaET
	FYmU9h7dNJvvyTZ1BdGF4YWIKKlp/Tcsbft9LZyi0vPROP9zClOssRRu
X-Gm-Gg: AYBFou0UJj+K0l6wKgf92Q501Hn5L08bUYPvvHXZsjn9XOaa8F9j4cExzrT9rQ1OiT7
	hKR+XQltcP+qNXgow7o+j/HNU41Rejk/0N6Zl//2nG6nbKpECV3hNF2WUzmVM50k1Fewzyt+JOB
	qtzOoiV1PMeyAiu0vX/Mkrzdlin84b2CdeZBJD1iKmUUY4ZcG9JyErM3Q7QSrqsrZvGb2rHwfjM
	RRIYYLjWTjqT7sP+ConHi+qIeXB8/zfVVMQ2ITJjKGRKvRko1W3Jm4kWZH9JXZgv/MZN+sRIyCI
	p9H/9OskKy9+Z/Ge5rbENTfgQxetjJLGmh5HtpsjESGLND/xupHaoIxbjoxIMy2v5R5iiaSVAV0
	uS6hYLO+D0t7ukjATZJczv9ztPpSuW4tn1Xw/wcl64lLBdzobQMmBDetgtkK/dA3hGrb8l8c3Nh
	4GKCOgaYCjPMHfHsCoC57gcAes4kr3Oh9hebxl/fhJq1wzd4iQtZBKXAaofcQGb83YZgHkvcyO7
	Rq7nBbaN6IXpSL+u53i0UJ13dHHYYmyB/7m
X-Received: by 2002:a05:6000:4607:b0:485:a32b:1ee8 with SMTP id ffacd0b85a97d-486e0fa01ecmr1480012f8f.20.1788989992817;
        Wed, 09 Sep 2026 14:39:52 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:39:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Borislav Petkov <bp@alien8.de>, Mauricio Faria de Oliveira
 <mfo@igalia.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
Message-ID: <20260909223951.1fe5fe25@pumpkin>
In-Reply-To: <95D5AACE-1D91-402A-9B6B-8D03C3D90705@zytor.com>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
	<20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
	<E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
	<d1b9ff734b918889eaf8885d64141bc3@igalia.com>
	<20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
	<e74c5a6b-ed9c-40c6-b9d7-ff04ee8c099e@zytor.com>
	<20260909093831.095b89cb@pumpkin>
	<8b00b7d2-2bd3-4871-9908-9fe1568d2690@zytor.com>
	<20260909202838.28071bff@pumpkin>
	<95D5AACE-1D91-402A-9B6B-8D03C3D90705@zytor.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788989993-1F4C977B-9668A1B8/0/0
X-purgate-type: clean
X-purgate-size: 2982

On Wed, 09 Sep 2026 12:33:40 -0700
"H. Peter Anvin" <hpa@zytor.com> wrote:

> On September 9, 2026 12:28:38 PM PDT, David Laight <david.laight.linux@gmail.com> wrote:
> >On Wed, 9 Sep 2026 06:43:01 -0700
> >"H. Peter Anvin" <hpa@zytor.com> wrote:
> >  
> >> On 2026-09-09 01:38, David Laight wrote:  
> >> >>
> >> >> Here is an out-of-line compact memcmp() which works for both 16/32 and 64 bits:
> >> >>    
> >> <broken code removed>
> >>   
> >> >>
> >> >> On 64 bits it compiles to:
> >> >>
> >> >> 0000000000000000 <memcmp>:
> >> >>    0:   48 89 d1                mov    %rdx,%rcx
> >> >>    3:   31 d2                   xor    %edx,%edx
> >> >>    5:   31 c0                   xor    %eax,%eax
> >> >>    7:   f3 a6                   repz cmpsb (%rdi),(%rsi)
> >> >>    9:   0f 97 c2                seta   %dl
> >> >>    c:   0f 92 c0                setb   %al
> >> >>    f:   29 d0                   sub    %edx,%eax    
> >> > 
> >> > That isn't the object code from the source ...
> >> >     
> >> And that's the ultimate hint that a cut and paste error had happened.
> >> 
> >> This was the actual source code.
> >> 
> >> int memcmp(const void *s1, const void *s2, size_t len)
> >> {
> >>     int lt, gt;
> >> 
> >>     /*
> >>      * Note: for the benefit of 64-bit code, xDI and xSI are reversed
> >>      * compared with what CMPSB uses; hence SETA and SETB are also reversed.
> >>      *
> >>      * The XOR statements set ZF = 1, CF = 0, which is required to handle
> >>      * the case len == 0 correctly.
> >>      */
> >>     asm volatile("xor %[lt],%[lt] ; "
> >>                  "xor %[gt],%[gt] ; "
> >>                  "repe cmpsb ; "
> >>                  "seta %b[lt] ; "
> >>                  "setb %b[gt]"
> >>                  : "+D" (s1), "+S" (s2), "+c" (len),
> >>                    [lt] "=&q" (lt), [gt] "=&q" (gt)
> >>                  : : "cc", "memory");
> >>     return gt - lt;
> >> }
> >>   
> >
> >Try:
> >
> >int memcmp_2(const void *s1, const void *s2, unsigned long len)
> >{
> >    signed char lt, gt;
> >
> >    asm volatile("repe cmpsb ; "
> >                 "seta %[lt] ; "
> >                 "setb %[gt]"
> >                 : "+D" (s1), "+S" (s2), "+c" (len),
> >                   [lt] "=&q" (lt), [gt] "=&q" (gt)
> >                 : : "cc", "memory");
> >    return (signed char)(gt - lt);
> >}
> >
> >https://www.godbolt.org/z/6hrxGxb18
> >
> >Saves the XORs - go away completely in the usual case of 'if (memcpy(....))'.
> >The 'mess' on the return statement moves the sign extend after the
> >subtract.
> >
> >David  
> 
> The xors are explicitly in the asm to deal with the len = 0 case (this is for the out of line version!)
> 
> We need to enter with ZF = 1 CF = 0.

And, of course, I knew that.
They also zero the high 24bits of the registers.
Given the setup cost of 'repe cmpsb' I suspect the xor just add code
bytes.

David



