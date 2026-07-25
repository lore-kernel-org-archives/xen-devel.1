Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A68C531C9
	for <xen-devel@archiver.kernel.org>; Sat, 25 Jul 2026 10:35:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1370646.1618720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZiU-0001bD-F2; Sat, 25 Jul 2026 10:34:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1370646.1618720; Sat, 25 Jul 2026 10:34:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wnZiU-0001b6-C4; Sat, 25 Jul 2026 10:34:50 +0000
Received: by outflank-mailman (input) for mailman id 1370646;
 Sat, 25 Jul 2026 10:34:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <david.laight.linux@gmail.com>) id 1wnZiT-0001b0-DX
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 10:34:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wnZiS-003ASq-JP
 for xen-devel@lists.xenproject.org; Sat, 25 Jul 2026 12:34:48 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a649114-5cb7-0a2a0a5109dd-0a2a45089526-32
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 12:34:48 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <david.laight.linux@gmail.com>)
 id 6a649148-f659-0a2a45080019-d1558029c51b-3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 12:34:48 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so9408425e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 25 Jul 2026 03:34:48 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b4f302f8sm53865865e9.12.2026.07.25.03.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2026 03:34:46 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1784975688; x=1785580488; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lPQ1yd3wvQrSfjKjwB6za0d4edq1Z4RYR+4kmUZXqy8=;
        b=JSnRxBFThgYx7qiqcTk0zsxTuoCFQ1mrIthldfXdkk/3vbeP7C3UkthesZkw2WhGp4
         mAWbj22Hz73vo63LczphBiMztczl6+KPOphqzHetK6nJE9RxIDTuzZJ1aNhuK1tGNH9M
         EqrsewV56v0iEXLIMR35gU4dbkUa0ceryOMk6DWTPK26t9IfjGqdgWFYk3t5Pdb0ZREu
         PAHz6Z0bUUHoch4lBcol/hhTPj+FIwIUCwDjOHDGVRml5wy+5Njhk17EB0XzGXUkaPtw
         QvJmIt6LjX//ypBDpGvZH3sEGRmzqr2pHVAWzYGW49nAWdUM6K6bsbCK9d2hFFk9Pk7K
         /Yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784975688; x=1785580488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPQ1yd3wvQrSfjKjwB6za0d4edq1Z4RYR+4kmUZXqy8=;
        b=kdfm6nJQcGQ2snPCUVmLbeoyYdn2SI+OSp8rPw60KW361XDdfoah+PrWmSZ3f10FZo
         bU/ZfI3reBLqVRDau1s+GtS+a8hazJQGWan6cZaN2yrFwY1RKncqIFRP3CvUupjOUNmU
         5/Sz1EKE99KArIFyZq9VppiaP+IbnQ2Xa6myka+djiBrJ3aD8txo2C3CBjqi6JU3KTBG
         2jQT+JmOSmt0fCDr23/pIlxxnrz+lsMhWlXseJalbaELGqvYWAhVc7dcHfUStY/DNG+6
         CLONcWGxcKHsBwMcw/NfEokQgFWLBV2XOPZbbpI2tgrwGSJme88aPhODTx1LCiDuxob/
         PJuA==
X-Forwarded-Encrypted: i=1; AHgh+RrJOQP17/FzEezgEtbbvr+FJ7R5we5BVBgtW0QNCzA46b/EDFqBPqNmGp0avucMhwXaO7b3dcVo6R4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxzGVVe1DpzeA4aBAzlVF/kVWNshGUe1slUf6/gYPnbZ0XO+3Ae
	2qbQNsc0zIl7X/ZLepBgZkbvj0vbSuyGhtaxgKok87a7Mma13KOebdnk
X-Gm-Gg: AR+sD10UkmQezlaCwQqhKDaQ/79Ur9d7tnYqryOnsqoJIxWQz3Nl28iGunjGn7lg+Ov
	83WRDIjaKrivm14lgRdDjvLDb4BVO8+neiAHO5MZEcmseX42ypO31SCX+8kSYjxibygbZy8I5PX
	g1HvaZy0wPnb9YSez1Qq4uMuDo0HTapjZhxPXxxc8zEO5NLi9wubPrcX7EY213vDkxRD+Tnma8B
	fTryBWf9BPuDYyry/2bVqgv5xeOiDdV6LHQgSL3PpttU9lw54VxbfoLbxO5dErZ5S6ZLPf5WdKZ
	BuBt+nAJ9wFDWztIyGoVWFuIDXS2nnBGO5lsWikgPo0W7tsL7JBkQYWuqbPfFxpUdfOmEt5SX5m
	SLsxENOCS2nWM9jxXJetx3+YaKtJBWxCR+OGSN02k0nwT9VG9DWC8ibf+788JYuY3H7+N02B0IO
	lVZ+DEX0r6yNmzidvN+SHrlL7DP1arJHTA7VrbZ5pwdOjFDmBIrA==
X-Received: by 2002:a05:600c:3509:b0:493:b87c:c87d with SMTP id 5b1f17b1804b1-496b56f3607mr21539045e9.11.1784975687659;
        Sat, 25 Jul 2026 03:34:47 -0700 (PDT)
Date: Sat, 25 Jul 2026 11:34:45 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Mauricio Faria de Oliveira <mfo@igalia.com>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Juergen Gross
 <jgross@suse.com>, Alexey Dobriyan <adobriyan@gmail.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 2/5] x86/asm: add volatile, clobbers and zero-length
 check in inline memcmp
Message-ID: <20260725113445.14ccf42f@pumpkin>
In-Reply-To: <CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
References: <20260721-pvh-kasan-inline-v7-0-38979a50cef0@igalia.com>
	<20260721-pvh-kasan-inline-v7-2-38979a50cef0@igalia.com>
	<20260722170334.GCamD35gwrCng30WH1@fat_crate.local>
	<0F3A1121-208F-4F71-8C88-BEAE7CB50E75@zytor.com>
	<CAMzpN2hyupAUk-XGRzM2wwQojPrsN66jWtT+saVf1NWdOzFXuw@mail.gmail.com>
	<2f22094d-b8c5-46ec-92b9-dd6752a8dc2e@zytor.com>
	<CAMzpN2hdw60=Un+mAFS5CEQqDRZ-d3fMogEwE4NxUe75P-GfSA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1784975688-D694287B-488BAD8C/0/0
X-purgate-type: clean
X-purgate-size: 781

On Thu, 23 Jul 2026 20:49:13 -0400
Brian Gerst <brgerst@gmail.com> wrote:

...
> I had originally thought that the test for RCX==0 was also at the end
> of the loop, after the decrement.  But a closer look at the
> pseudo-code in the SDM does show that the test is at the start of the
> loop.  Starting with RCX==0 does indeed skip the comparison and does
> not touch ZF.  Your suggestion is good, but should have a comment
> explaining why it's there to someone reading the code in the future.

I have a feeling that was a change between the 8086 and 80286.
I don't have an 8086 book (any more) but I'm sure I remember fixing
bugs where %cx of zero caused 65536 iterations.
(Fun to find because the vector table is 'first in the line to be
overwritten.)

	David

