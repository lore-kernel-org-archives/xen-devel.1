Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2BBC88E73
	for <xen-devel@archiver.kernel.org>; Tue, 15 Sep 2026 08:43:57 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1421531.1647330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6OlV-0001xu-IS; Tue, 15 Sep 2026 08:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1421531.1647330; Tue, 15 Sep 2026 08:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6OlV-0001xn-F1; Tue, 15 Sep 2026 08:43:45 +0000
Received: by outflank-mailman (input) for mailman id 1421531;
 Tue, 15 Sep 2026 08:43:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x6OlU-0001xh-2p
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 08:43:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6OlS-00BQwV-MU
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2026 10:43:42 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa90535-8faa-0a2a0a5109dd-0a2a450bd286-40
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 10:43:42 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6aa9053e-b7e8-0a2a450b0019-4a7de18c9bde-3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 10:43:42 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ccfd61ecaso27918485e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 01:43:42 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49e7ef24be2sm30342585e9.0.2026.09.15.01.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 01:43:41 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789461822; x=1790066622; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wn/lyeTbbPBDsoxu3rQlBRh1hn3vc28DqPKEKt99NCc=;
        b=cLZ1/oxtvB5c8AAMWRFeVIFWMKniREzNFe5Jgp/GISC+m3rFDLOsGQGSVJ6OoYel2K
         Ph/lIZo+GYkIhUt07jW4baHRga6sIcovszvq0opSIIOAJEeT0Q/bfj1lE1wJCVTGrm0w
         oLeMT4onH89E5y/rdGLZRHumsM+3OKBEp4Eq/OMIsX9Ycspdf/1KFpNc4D9M9oeiimvI
         YiZ6M0fM1VXN2w+f1ydchwqJp85B9JFPK7IdnWa93pG/59t1QgTDT/mqty3COcawfPPw
         HgYH+0xWlq4a2DZsxPEcyM0lsSvVrEQ33pw6+qfHmljUBiG7augE+8hsHOG6OUbQkRwo
         Wg6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461822; x=1790066622;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wn/lyeTbbPBDsoxu3rQlBRh1hn3vc28DqPKEKt99NCc=;
        b=EaSP7pG4YUu/qXeocyWVvOrDatsX8rvyFCdm95B6Hs6BaEaZEXpJVrDEg901kdrAPG
         +OMgnJrl00ZZAjO2tt8cZsQaUpewrrSXMWzcM8IMZQFUEFIg/AU8txGCaacfC3KzH99W
         XbzygWJl7CITd8Kd81spCSPwaIfKx/vR4NMBJ2NFjFfU0MyExtvXj5ROz19kESNn7wVQ
         i0eQssNioF6dTjO/UYz1FwST1VM7T/pKxiiuaP7qm0/kXgpejYs69G3+DQKDVNNPutVY
         QiDAv/JNDxSp0dJ/BzRLan7KPPwqQYhtSYo8SOQ0FiIrKWYch5RK74yP7pbBrtRyi0aZ
         Xlrw==
X-Forwarded-Encrypted: i=1; AKwUvBwbF9X5ZmazQaYRh9Zbbszt3MPuOUmMbI1v2hkO+nj5yjf6rjD+PZkVQSqwdFJUbHPaTV5NcpFb2jU=@lists.xenproject.org
X-Gm-Message-State: AFuF++mMlf59VEffwhAnX3cWqqMyXLhpravtTyPp1QqIj4sUMlsfg9+W
	OO6nHxkKjK7CMyQdRmokpdqEfutF1R2+ac1Ccq3Jm3w5VBnOFUQRrNmA
X-Gm-Gg: AYBFou0eNsUPV+E0JkrOS1ydsyXDZuuH/raf0JEAK+rJWmN6s91EUg4l/+Ux40sXzIT
	1C/CVrh+i3ch7UqHR4BrUNlArGGExbLCn5vZEonGF5ctC8wMA37bXGeeGr9GKlafrAEETOMwMHA
	nfz0PsWJdHFZNsyOKtg3XsImFKdKil+OtIGdlB8PGp10B3V4OMTfcoXy7mK6sixe2XqJQpLMl7x
	tJ04QJt5FcP+OiCguTA6ntZys+mxJdTg4lYksqG5Wp8MPQTr9KlAmzd8KchKN+u8hlCRHANT0kT
	HiHjrsefU0qaaLQYBQNfa8RNmZE8NDB2hi35IJEIo7FiHDFhy/2ky44D4up3dOpbT4NblITKrP4
	2BjzgWBKrTEgIhyVrolkZn7W+TVwmVsEreNJv9Ib7OlAda2FiW4YhGHL/ZMm61TNha88J5rU37X
	9dIcS+kYZAZGYb6tO6rpdSWFsloYE6Zq3ZmptVgW+zIIgJ8TGGxypq1FO2Vo0bi87vFWQMvhymz
	sk8JC3cCu8PRLHkADDDkEK4stE5kSkCGv+o
X-Received: by 2002:a05:600c:3593:b0:49c:e3ad:41d3 with SMTP id 5b1f17b1804b1-49e7a5edc17mr72558105e9.0.1789461821804;
        Tue, 15 Sep 2026 01:43:41 -0700 (PDT)
Date: Tue, 15 Sep 2026 09:43:39 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 4/5] x86/cpuid: fix unbootable VMs by really inlining
 memcmp() in hypervisor_cpuid_base()
Message-ID: <20260915094339.39a83b54@pumpkin>
In-Reply-To: <20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-4-e70ef3b75b6a@igalia.com>
	<20260911043822.GHaqOFvnw5mQ0s89QQ@fat_crate.local>
	<6113f06c790cfe1141d2dc09b68937b6@igalia.com>
	<20260915051155.GGaqjTm7yIluwxZ80x@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1789461822-A90CD9EA-CE4605F9/0/0
X-purgate-type: clean
X-purgate-size: 773

On Mon, 14 Sep 2026 22:11:55 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Mon, Sep 14, 2026 at 08:22:08AM -0300, Mauricio Faria de Oliveira wrote:
> > In the review of the original patchset (fixed by this series) it is
> > mentioned that a compiler might turn it into a memcmp() [1] -- and thus
> > revert back to the same issue.
> > 
> > [1] https://lore.kernel.org/all/877ccz12ab.ffs@tglx/  
> 
> Hmm, never heard that before but that doesn't mean anything. Probably should
> mention it in one of the commit messages so that we know for the future...
> 

It definitely has a habit of converting copy loops to memcpy().
Annoying when they are short.

But usually easily avoidable by sprinkling 'volatile' or barrier() in the
right places.

David

