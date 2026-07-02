Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B2CC43458
	for <xen-devel@archiver.kernel.org>; Thu,  2 Jul 2026 12:31:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1351802.1608851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfGZq-00084R-4s; Thu, 02 Jul 2026 12:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351802.1608851; Thu, 02 Jul 2026 12:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfGZq-00084K-1l; Thu, 02 Jul 2026 12:31:34 +0000
Received: by outflank-mailman (input) for mailman id 1351802;
 Thu, 02 Jul 2026 12:31:33 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wfGZp-00084E-6Z
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 12:31:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfGZo-005jVG-JY
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 14:31:32 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a465a22-bab6-0a2a0a5309dd-0a2a4503cc4c-12
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 14:31:32 +0200
Received: from [74.125.224.45] (helo=mail-yx1-f45.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a465a23-ec1a-0a2a45030019-4a7de02dbc5b-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 14:31:32 +0200
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-6662551100bso1120382d50.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 05:31:32 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1782995491; cv=none;
        d=google.com; s=arc-20260327;
        b=ToXjHFqgtd9xRNZXbyw7iy2syBaNQTa6+mr0ewRd+YFNzytay3g4mFPvCGAsOPgQWN
         JYvD/jXg2N+kGvxG25mDB5vi60ZDP5WR+hd3U/Wk179qwRbClzsoTcjoQpsol3R1G0NF
         4/Zv85qYpc9mSSbC2n8rpDBj8XjxZwoQGdoDWAX0dHaHBX0tDF6H0vzyci1EAoj5TeA8
         iH6hknSHohStNPlzTBTCIRjG6SJdxsCjq/s7GqgsNgxkDqIaxKPdQSAo8CNt0dSf9Chf
         mvwsiEpUnEfsfLzpkEJX6zH6EOTz27xELsTQAy8qFzD5X7mE0sSMO+yziDDKjfvfbZPG
         y3Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ySn3gMwf35pdMOoKlEwyhm0+ybEatoARftdVy4I7+6A=;
        fh=pmfIAu1zZ/y4MK+Ok8pH+KJi8l1vy8Cep5fL3L/xSOQ=;
        b=Dxhr8Lw73FhzB18WO711DnLtorlFOOJccADY0iGQfzjF5Y6DSK09A0oIDY+0QqCCY7
         dd4gHllVD3BqXeDu0MKXydJl/9k3EsNU5KK8W3sWtJpUZ+x7ryb/1n1rBaSCgxCthzno
         naobrM6l2kFMShlqCWNVZOFSUReRoS/FaBZKVOo1I2aXNEE1van8fbi2nda2PENajvUt
         WuQ+wXOepElM7T7x3rGG2KBka65hxHymUhoqYICCqCEvdaNSt/HZnBbwLa687oY6Th/B
         FBL8N98GV3XE3tTEOIsmQzBHvz7j7x4xnKzyQdlC2NOoNcQpdRGhOwU1M3gtKO97v7JJ
         iw/A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995491; x=1783600291; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ySn3gMwf35pdMOoKlEwyhm0+ybEatoARftdVy4I7+6A=;
        b=C9u0eeltBO2W1v62fqqJmc9NngJIvYY0at1xBVKpG0jFj3k8aZdtZOXINTYdz2f8Ye
         lIUnyMfcr0ZYkDHk9biLFM359sZKYEpSUr1M23a9kLEY4ptux5yRz5Doqrans+73Sfqh
         T/N7I9CbQ9ER8QleSlNnrjWnqr5SaeDtw/jkXcVQYk0pmDcoMFbin4pxoESxJecAoUSX
         KvAn0MedJ4WkxqjS45v+EPCTkOvYTlpzldjIxoeEMSyGpBJcKrJLct9Y6UFd7D4lU8Fx
         Pn8Jt65Ef52NJ5vR7Z7X+RvyRWdPs37AT6dURfNzPdqeRmwmot0wtop8MRMX0xJIKKZt
         O0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995491; x=1783600291;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySn3gMwf35pdMOoKlEwyhm0+ybEatoARftdVy4I7+6A=;
        b=hCa0iSjuO3nv03d9iTyW/HSX1amQrncj3u18vv+mlnHnFPtnoSXkZYaQ2lVA3LU1An
         DxoKEAVzCDFu/iUrp30AueeP+aKlY0lJeKLIk1Ya8MOImykD5KTR1ecSgpNGT9n7kUQY
         77cLYx67DJhJCDTjlZ/y+Hk9p9bKVLNRHs++ANC3mxNPp8vTMEjL+FfmBmU18DgC7uZ/
         JyfnY6mgChDNFJ96rbTRbg7bFdnHxAeMyxYjZBcydES7g6UZ9skhkItYHOWXBnXYGUm0
         8cRPEDe+mZ1IByM0eQPD0KnR1u/v7GLawhEoNKW3boH+44KxJOouJO272hLuHdCi6Kq2
         ToFg==
X-Gm-Message-State: AOJu0Yx/tB45aS9FyRy/bWji9Zt33beTxsoe9XLaN3doN1rDSdKGkv13
	Kjh2hkTJnCPKnUKSbfdhGMqttgPNFW9x+DVK0NOkEJG9u6itHJMaRpYWHwXoJWVi1g4vBgzziTS
	tPflNh5D0H6T/yDT0L2svnfUhXij4+cI=
X-Gm-Gg: AfdE7cluurAF1oihHtTT99tNzBl1Hn2oRFc7iAHUcAmeELdmwRTy1aibwey8rK6gfEi
	E8IaWDkN5PY48NIA5rY2Zbu42wT/fYZAD5XSyl7NsO0vx9g+bfcG8yEYcHjjbRHPPQux07OYPv+
	w35lJnTVMIgv7ROUg1mIt84dLXu+R5vdsnuEdBGUKan+kJj5Q30Fw+w5An6E6V1FXHD+GL7fDu0
	0cqdARTciimxiJDzirF6y22x5TSBAhWaIbZrXJg8GcxTZyxQKlC1VBakIBYVABDAJTNgUVFdCVi
	RoxDRCxaNwMlgy9wB0x/IjhRiP8wdIbhDQ==
X-Received: by 2002:a05:690e:1918:b0:664:de27:9de5 with SMTP id
 956f58d0204a3-66521cf00a0mr5248423d50.79.1782995490812; Thu, 02 Jul 2026
 05:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260619130501.272832-1-frediano.ziglio@citrix.com>
 <20260619130501.272832-3-frediano.ziglio@citrix.com> <66e293a9-0384-4028-913d-90f2f3d1874c@citrix.com>
In-Reply-To: <66e293a9-0384-4028-913d-90f2f3d1874c@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 2 Jul 2026 13:31:19 +0100
X-Gm-Features: AVVi8Ccva7Q2tC64CMNMqEawCU1qa3IEf_tdqGCKpCdU9568YVWxJ1bZjnm9ppw
Message-ID: <CAHt6W4fW58Tt7khO=BtQOVKbBrf74HKvQ4SsPMLTwhgPsvD7DA@mail.gmail.com>
Subject: Re: [PATCH v6 02/16] libs/guest: Reduce number of I/O vectors in write_batch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1782995492-061315D1-A5907257/0/0
X-purgate-type: clean
X-purgate-size: 1081

On Tue, 30 Jun 2026 at 17:41, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 19/06/2026 2:04 pm, Frediano Ziglio wrote:
> > diff --git a/tools/libs/guest/xg_sr_save.c b/tools/libs/guest/xg_sr_save.c
> > index fdbceab52e..68ce1aeb98 100644
> > --- a/tools/libs/guest/xg_sr_save.c
> > +++ b/tools/libs/guest/xg_sr_save.c
> > @@ -97,9 +97,11 @@ static int write_batch(struct xc_sr_context *ctx)
> >      void *page, *orig_page;
> >      uint64_t *rec_pfns = NULL;
> >      struct iovec *iov = NULL; int iovcnt = 0;
> > -    struct xc_sr_rec_page_data_header hdr = { 0 };
> > -    struct xc_sr_record rec = {
> > -        .type = REC_TYPE_PAGE_DATA,
> > +    struct {
> > +        struct xc_sr_rhdr rec;
> > +        struct xc_sr_rec_page_data_header page_data;
> > +    } hdrs = {
> > +        { .type = REC_TYPE_PAGE_DATA },
>
> .rec = { .type = ... },
>
> Otherwise this is fragile to reordering.
>

Changed.
Here we are implementing a network protocol, reordering should not be
done, unless you want to break the code.

> ~Andrew

Frediano

