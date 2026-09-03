Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7E8C624A4
	for <xen-devel@archiver.kernel.org>; Thu,  3 Sep 2026 08:40:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406560.1639792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x22zu-0003Rf-35; Thu, 03 Sep 2026 08:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406560.1639792; Thu, 03 Sep 2026 08:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x22zu-0003RY-0Q; Thu, 03 Sep 2026 08:40:38 +0000
Received: by outflank-mailman (input) for mailman id 1406560;
 Thu, 03 Sep 2026 08:40:37 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1x22zt-0003RS-1q
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 08:40:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x22zs-000Cyr-Ed
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 10:40:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a99327a-2eae-0a2a0a5409dd-0a2a4506a3d0-22
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 10:40:36 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a993284-195a-0a2a45060019-d155802ccdb1-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 10:40:36 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-498028b3d5eso22115185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 01:40:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce47b9817sm99477295e9.1.2026.09.03.01.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 01:40:35 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788424836; x=1789029636; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z2kd8yy098YwLOhAkPABv3/vm8TT/oYlA03PQA2FRSg=;
        b=f2mqoD+CwbOq/Iq+kwAiymqHxihp4Z06sxWw5wmfw+IGgxVwrJGQ6fEsJMMNmLxytX
         ciQX/GrIn9ZluZR3oYdl2dkGt/THYu47LgSel9AgG1OHKxS7fduXNry83Nh2084hwoS1
         M4pG3IkOvNX8y3biws0Se74l0u+DboZMFtll3Pnb/Jz1BlqfUDQQQIyoyU6PK+X++sXC
         /uAgSlWVv6g9jdMkm2UL4jaOirgqEsTvqhLei9+kyN/vvwwX6ermCktILuIKmhrvGv6x
         X0dB2C8z1b9uwdtrBWejalI4vf5u4/cSqjh0kXQCI3ywSRf179exmYe4RNjgiaADl1dA
         P8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788424836; x=1789029636;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2kd8yy098YwLOhAkPABv3/vm8TT/oYlA03PQA2FRSg=;
        b=k0dJHTLfWeqlqXAzCsEloJ13d1U2E4EQOgs5ONfa8u8hacESyGEihGvvc0ptrd/GVY
         tt45+PiKOSVQmDMig7AnGlbC1P+D4KaH7raZpzl2j9/BC51gjmqJ4Ix6XpNJmqhGwhvF
         w9jwGm67wvQ0AYk/VrM4fyMFxbgpdq/W152/iXx3XgquDMlxgSkNoX61VdIrHDV/NhJE
         +poMlQbAKmh1N6dTPD9nNasRHRmT1QTCd6yrMA+OfxsqulXsqoQiFNI/lqNRnhvXyy9j
         H3q0JLP0CV5OvXKIXuvlFQvbHAVo9DvwQ8IgLRTKphVkwqBjAGiTSekITBme+Kaij8yg
         gFDw==
X-Forwarded-Encrypted: i=1; AKwUvBwzaGocc/6TDqXMM5yYgpHCv/2ig84FKzzZYBSA3tzWGCTAWgiRrhGhgljr1NsPp+39Ewv8uWE7s4o=@lists.xenproject.org
X-Gm-Message-State: AFuF++nbPYBGWMw6Wy12GcN3WcWACWdTV3aNQS9rB6D1i8QM1iXGulij
	wxjpqWOcDnd0Fme6koN4y6MDM4UiZEoihPPgfPeCCKnGcflcLxL+NqjY
X-Gm-Gg: AYBFou0I+TqXJDlce62KpFKrJAWYeHLceKr6lES0xRWXxClt/1SXaPnPm7oUQDF0QUX
	kwUv387CJznXgyh41240JiXEF2YPZYsImmQpZMbVLFw6v4u8PF8tTnDBW+zJvOauzdruHB5G/Sx
	44Odmt9uuU9g5u5ej7Dh/bpke0bzMof+gNc+Nkx88kJ+AblIBWSMcpiL5Hy7lhn8gADLYUJ4eVj
	8/Lu+5xdiNKhJEZ51k0WoVVVxdZDNWJNVsG8mCOtswqWR/Q8TH7WIagbR9Skb3pXXPGoRAv5PG0
	72i32jkGXQ4pkRFdf60q74Jr29jX5OVBHp6gW/0Vq1KSS4FyLuckdn1pyTWIOgGWaR6Yn6BHlnT
	Ur3ECTyyYr2tLDCNJ49RYCsjq9hbW4wMOluMBtPHKeTQgMunkqcDT7lvcdd49sC91FYoNE+PC6g
	fNcWIN6remnpTzICJfEhq/MwVNfC7ckHYHCsHftHUsfOeyMZT6CJ/L2lKyMWrEYmc5j6ZZUQky2
	Sja7lkv9Ee/BY6Bih64YmG1f5JQ5zs59Yjf
X-Received: by 2002:a05:600c:1da1:b0:499:9eb8:a1d7 with SMTP id 5b1f17b1804b1-49ce5842935mr226059755e9.9.1788424835605;
        Thu, 03 Sep 2026 01:40:35 -0700 (PDT)
Date: Thu, 3 Sep 2026 09:40:34 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>, Michael Matz
 <matz@suse.de>, Richard Biener <rguenther@suse.de>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 1/5] x86/boot: Remove "cc" clobber from memcmp()
Message-ID: <20260903094034.489b64bb@pumpkin>
In-Reply-To: <20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
	<20260822-pvh-kasan-inline-v9-1-e70ef3b75b6a@igalia.com>
	<20260902023129.GGapeKgVlL2WgHcJcb@fat_crate.local>
	<57b0d188-b256-bde4-43e6-99dae4f59d60@suse.de>
	<05896397667d66a2969259298bcebb7f@igalia.com>
	<20260903000132.GGapi43JjGh-8sj65Q@fat_crate.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-16d1c6/1788424836-F500977B-326D1C26/0/0
X-purgate-type: clean
X-purgate-size: 755

On Wed, 2 Sep 2026 17:01:32 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Wed, Sep 02, 2026 at 10:48:14AM -0300, Mauricio Faria de Oliveira wrote:
> > Boris, I guess this may be added as clarification in the commit message.
> > Would you prefer another version with it?  
> 
> Yeah, I'd actually prefer it in the code itself so that we can find it easier.
> This file is as good as any.
> 
> Something like this:
> 
> /*
>  * Summarized explanation that "cc" clobbers don't have a meaning
>  *
>  */
>  
> and leave the "cc" clobber there but commented out:
> 
>  /* "cc" ... */
> 
> so that we can grep for it easier later.

Why would you need to?
Apart from a scan to just remove them all...

David

> 
> Thanks!
> 


