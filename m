Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1133EC55ABA
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 21:41:26 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382653.1625982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrMsd-0008Ml-PC; Tue, 04 Aug 2026 21:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382653.1625982; Tue, 04 Aug 2026 21:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrMsd-0008Me-LE; Tue, 04 Aug 2026 21:40:59 +0000
Received: by outflank-mailman (input) for mailman id 1382653;
 Tue, 04 Aug 2026 21:40:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wrMsc-0008MY-2z
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 21:40:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrMsb-001obd-6Z
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 23:40:57 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a725c2a-2eae-0a2a0a5409dd-0a2a450487ba-44
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:40:57 +0200
Received: from [74.125.224.47] (helo=mail-yx1-f47.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a725c68-b57f-0a2a45040019-4a7de02fbd12-3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 23:40:57 +0200
Received: by mail-yx1-f47.google.com with SMTP id
 956f58d0204a3-669944f5ef1so302167d50.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 14:40:56 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1785879655; cv=none;
        d=google.com; s=arc-20260327;
        b=g36Z68Wwbq2TXta0huJSzjGl+bhGBcD2EFjefRfbqycj6X6JaZ+yp9QWAxYBJHkW4B
         obuxWqfKz5sMs0hl9/BzcapFVmySqUAbEtO4PQ4EHTMLhQCP2e/DpO8/UyKyU6RFteRY
         MtJXaGw0M4P/xev9yK0KYBj2E6/yAYuC5w8Itdxd2R54YVGdvkH7ysIVaK0Nl2WnSBbb
         ZLhNPiB1FDpC1f7nHlXp5C5HRR7aD2eHsYKFfyQURDM0bGb/64yfLsLck9hPeKN8QVEh
         M9iTHyUnpqG1gGCP02yDnpnaf6/X/k4d7J2lsTuKjfS8Q8FWaIV4mYJHckBvadX9iEnR
         M8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sUP90bFdYVViBJwMVU0ncUeotpyeUeVbV/REZdSDfEg=;
        fh=K9IAd8BUey1PZ/zoeGTbn1ETVLXZhvAgW6PCZb/WSCU=;
        b=PnSMeV0tNNIU72qLKz4gKYb+ihNbTjXp+EBL/BRfoXbrLW1UbeENhZ/8g+Iwuu3pNV
         ZqNJs2SDNse1ED0kCgbSfpHcUC39ScrfeBWHZZI42GdkHoe6bwt8fgev4ZKgkGh2Z2IA
         XBOBv8oOKI+3nDimCzvvn3SLhcyYAV1nlH4V/jTopS/OOdWIbZjOIYIiw/9eFZ5oblMa
         jIoxe7AUUAXdSaAh1LnhU+PscieyXEJbCyV1ElgIKelKDL52OtNUAwyiIfarQm+MQY2H
         fhCP2RY8i4gXtJdriPN5ogCPEflCNPYN9thPnm+dV/MGtVsYvUZPmoZie5wb0m1x0VPw
         BcXA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785879655; x=1786484455; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUP90bFdYVViBJwMVU0ncUeotpyeUeVbV/REZdSDfEg=;
        b=HGXP0+GmRqgqY7wih4hjQo0WG8iDs4T+MH/XXM+RgUbbY6jjqne+7KysjimYmi+Peo
         YcFneXnt4HIBBRMx7dRH7awBEiflpVr9MhP7LbPj0jyGi4sOpeCKVd6ATedg5r0BS4bC
         GwG3ukrh8Knae5FYx+Y7peWWofSr5fKaI0/UfPbfxd4aZEt9xjAJj6/TSl/0njLF0r+E
         nBQneR6Ws9jr/qLUqHpQwRucYHC6Nx76/655tYKTJlH6wrEwNdP252GUjcRn+Jc1A3Bf
         +qucN4rOYuBk0WXtkeFC/eCA8B8Wg7gUoD9ESasaFH5XsWvEP7/okuZ79wubqmpuwQxk
         64HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785879655; x=1786484455;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sUP90bFdYVViBJwMVU0ncUeotpyeUeVbV/REZdSDfEg=;
        b=SQ5zvTDhCZQtGKgJo1wecctnICiZLeZyXiGAXUOoaqGTSQ1KX6CVCf09vYEVe/hfuu
         2qwVf4TqLMRX+zmiv+PO3GtUeMpmUXchcwEU4a14IJG74Heai4aAZjTjEUyhZEiUA893
         vptrSREgSD4ohsZbQqDVBhVLcf7vUnnHuDs086aV+PO2Gi2/8dK16dOO11TrE5qhgWqZ
         wAo/fxGbolL19my4eUWkxjpcJt62IXn1C3g6B8VStYJCt3vFG4HEDDJZXekHMCWuUKFI
         2hwkVa2Uf+YjOJDGXRCioX7efS5jrshMDhczZtKSkaRpQXqGkRpL6/Sr/GqRoxL1P6e8
         w5Eg==
X-Gm-Message-State: AOJu0Ywcd0LZ/KH/S4W7BDyakQdcpesO0A4PYBx9uX5DDKbCc3/JT8J7
	D3JSscn6/w2LKeAjwyBs7J0NDQFa/4M1uw2AOz/Td97DH2Ygby9j+hqrvPTn1SmX+2IfmEL0Gle
	oY7tT2TYVvZ6cw43U/OjBKcNXiYhKBLQ=
X-Gm-Gg: AR+sD13BvMb80n+QmJf+uZZhY08LIZE7iFGsUFJUVDUO0auVvs9I45347W8gFbHjRIM
	I0RiFwqp73YZ5FSkmj1AiwxqfwoqKj1/55jJaFjB8c+a6QlNLa4Amu5wPYy7OWTem/OtC6UoLmn
	ew0Z+a5IeCznAbLXB3bytJOnEMOv93KWG1rSkTmzXv0b1GgpvePbRkxvcGvJBYPn6UjyEcPZomm
	vdx76bpDM5YiwgUhpnzfQlAXNnjd7yihReV58Z7G9iR7oaTGoU/oNi3r49cXaC8EdGq1E9YTZKx
	8Lt2lkqkjED8pnu0IYbV6Nl/t85byOIUUzp42WsY1SfaW0K2mXbda5JMcZGgUXrSppfsWs71GIu
	h
X-Received: by 2002:a53:b543:0:b0:667:e04a:8a3f with SMTP id
 956f58d0204a3-6699a919d86mr969713d50.5.1785879655484; Tue, 04 Aug 2026
 14:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260804174219.835096-1-frediano.ziglio@citrix.com>
 <20260804174219.835096-2-frediano.ziglio@citrix.com> <1785871743.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099@vates.tech>
In-Reply-To: <1785871743.8631fc262581453bbf619ec5b2062170.19fce4038dd000e099@vates.tech>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Tue, 4 Aug 2026 22:40:44 +0100
X-Gm-Features: AUfX_mxHyihNtyDMkBfWJHdz09e80hO9TOwHB81ucSm2D6hWkksFcqiOiVQvCaw
Message-ID: <CAHt6W4caSVXHx-bdNh0WDTk-K0UXTb0pN75NYuCC+A66woo9Vw@mail.gmail.com>
Subject: Re: [PATCH 1/2] CI: Simplify directories creation
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1785879657-536C2B50-9A16AF3D/0/0
X-purgate-type: clean
X-purgate-size: 2001

On Tue, 4 Aug 2026 at 20:29, Anthony PERARD <anthony.perard@vates.tech> wrote:
>
> On Tue, Aug 04, 2026 at 06:42:17PM +0100, Frediano Ziglio wrote:
> > diff --git a/automation/scripts/qemu-alpine-x86_64.sh b/automation/scripts/qemu-alpine-x86_64.sh
> > index 242ffca693..60f5cc49fc 100755
> > --- a/automation/scripts/qemu-alpine-x86_64.sh
> > +++ b/automation/scripts/qemu-alpine-x86_64.sh
> > @@ -4,16 +4,7 @@ set -ex -o pipefail
> >
> >  # DomU Busybox
> >  cd binaries
> > -mkdir -p initrd
> > -mkdir -p initrd/bin
> > -mkdir -p initrd/sbin
> > -mkdir -p initrd/etc
> > -mkdir -p initrd/dev
> > -mkdir -p initrd/proc
> > -mkdir -p initrd/sys
> > -mkdir -p initrd/lib
> > -mkdir -p initrd/var
> > -mkdir -p initrd/mnt
> > +mkdir -p initrd/{bin,sbin,etc,dev,proc,sys,lib,var,mnt}
>
> This makes it really hard to find out if more directory or less
> directory are been created. When reviewing a patch, we don't see what
> changed in a line without using more complex tools.
>
> For this patch, I have now idea at a glimpse if all the directory that
> was created before are still created.
>
> In the future, we might need to create more directories, this would
> change on very long line to another, and make it hard to find out what
> was the logical change, by just looking at the output of `diff -u`.
>
> So I don't see this patch as an improvement.
>
> But that just my opinion, but that would apply equally to other similar
> changes, like packing all the variable declaration on a single line in C.
>
> Cheers,
>

Hi,
   what about putting the directory names in alphabetical order?
Either in multiline or in the concise single line?
In both cases it makes it easier to check if it's already there.

Or something like

mkdir -p binaries/initrd
cd binaries/initrd
mkdir -p \
        bin \
        dev \
        etc \
        lib \
        mnt \
        proc \
        sbin \
        sys \
        var
cd ..

Regards,
   Frediano

