Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B38FC44525
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 10:11:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366442.1616326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkyF-0001nn-Ib; Mon, 20 Jul 2026 10:11:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366442.1616326; Mon, 20 Jul 2026 10:11:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wlkyF-0001ng-Fp; Mon, 20 Jul 2026 10:11:35 +0000
Received: by outflank-mailman (input) for mailman id 1366442;
 Mon, 20 Jul 2026 10:11:34 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wlkyE-0001na-86
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:11:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wlkyD-00BFYG-EG
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 12:11:33 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df444-2eae-0a2a0a5409dd-0a2a45099a04-48
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:11:33 +0200
Received: from [209.85.128.173] (helo=mail-yw1-f173.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a5df454-be1a-0a2a45090019-d15580adb41f-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 12:11:33 +0200
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-81e9f7491ffso122572247b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 03:11:32 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1784542292; cv=none;
        d=google.com; s=arc-20260327;
        b=jZbfnpZ6W2N/tK1cY+ob/wJ34u/bsTjrjEfdF6Tn//kjJm83KfnwR+CyYTST4coTFG
         uJBDGU+kPk2dA6H/SmHs4N3s9SJ8dFpm8XQdoVN4L0FAd8hePViLwjEtwxE1nnBJ31W1
         ljtZ0WUMDeswJo2GBpUpgWnElKXmlfsRVE/Nkh53EMTQXzqCg8n3IITlT8W9o65+WhJx
         nNJNgdVckvLbexyZt5Y08w7H5M8vTlllYsL2hLkOsEqZuEl+KCuQJzuBlUevVjavkWYi
         kHIJEdSm8N0tary6iGBU9frG0EcA7LJZ3v4WN8Mn2fsddrPtNJNR/GvE9xVRBFgbx4PW
         GBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NXJHWPuAL4rkXjz51HNntRUzNe2yDQqqI6DSiDO6oVk=;
        fh=pmfIAu1zZ/y4MK+Ok8pH+KJi8l1vy8Cep5fL3L/xSOQ=;
        b=UjYKWNeehecMWy0s4MBeDvl7Zm6GBPX1n3HE9rfIXSR9biMyszHVCzk06/hr4hKOqd
         WBu1NGZyCiahXY5Y7o/mzsz78tEy1u5AlqKEbIm+SGZXYUhmnj7y5rIhGIZRAcUFl5MX
         CIxwagyDYSIicOa5mjscgLqpcmB5McEN7vHIVGS9u0bywHCEBoAtdhKlxHHESgvL8aZA
         78DRKZU03tO6MkG0i23wbukKIvvY+f2zg3JLGwei3+9WieWjN3wMK5BV2/rhJVk6foBq
         6zSC5XRT4WTaBQIZ5bwuqnh52JjAyAcGEHF5R3qkRWuORWrFGRw4hAhK/Kf415mwpGKb
         Gllw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784542292; x=1785147092; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXJHWPuAL4rkXjz51HNntRUzNe2yDQqqI6DSiDO6oVk=;
        b=b/1UyHAh7uDTfopkUfrUaNkR/SkTW6AGdmP6Q2wUOGMXkzyOnolG3N75D+Ct38JhSj
         KBQ8HncdCnCGb04VT328rD9Ug0H+FhwYXPrxqlceeJKOeSawczzzvbnccC2XLlrFKskN
         B5YtTA8AKi776HEw9T6sdioxfuhvKhmpk1wTwpZT2mIBM2isz9xY3TlStq6cypcBliHx
         jxlGt2vM1kVEmDkl13KhaQaZTVHTlX4Cv/Cu2C+nw+667lUAQ0Rnzfl+nkyLEtHpP1Gz
         +09J+FgfZB8Rou+5ylCHuZxP15f3UATyCSm/+noXet8M3reN3wGvgI5UnNCyOLMtPZui
         Wp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784542292; x=1785147092;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NXJHWPuAL4rkXjz51HNntRUzNe2yDQqqI6DSiDO6oVk=;
        b=oVmkpzW3u5bJOZxhIoggCKkMCJr6/qaAM69nTRwpYrD2dROY7uQ+vmqDwOfTwWwCQc
         IgfkORVUAj1yjjJ95ZTtixR2LMMM0quAVGDsTb4vxo09ctxdh7W17ZEr4BSddTqvQyPG
         E1WLuAiTJTLgRHKSI8Qs3FvkY3/cIseDHkcgKK2eFP9A1bCxfrJLQC+vsxJ2VL8pUzgu
         4GNMFYmnS1q4Cc4aipW7m2AHBC72RuB8sGLPMnmJGkl2IDbQuAgprf+b1NXxEnEdjDDp
         Y3j7O/nqsLGA6nygamMv2jY7qhVr8liFbfV71dO6hZzzHq3nGH1HnB+/ClDKhi63cnYI
         TfwA==
X-Gm-Message-State: AOJu0Yy/DK4+KCkvlTCAGba3kCX5BiDhp1CoWl/hyqb/f6ivviqka8h2
	jECgshwLzls6txp3hquDEciMU8EjMnpQZl2y0RvX51CvmQnn6X7ELKFfr57FkfcxIeErNXQ4kfL
	V/noTQrV/21nAx0j7aP9pmCYkucga+AI=
X-Gm-Gg: AR+sD10ixIun8xfTBa5E0E3cV0xF5B8LqyH7EpwHiiTBkGLXLHlkDIopPe7Q/IS6CVy
	sjZZjGFNJeizo+T3MR7SM2AiJkiYSUg183tD3N05wU8qsb/uq5K1ZjvGpRTDIPjcCksM1DtrKgn
	1TrKCeqK+lQQHqAzB8RQBNIA4YUsBKV0yaPcEAPca3TnsD02Z6AcdVD+LV9hq23f7h12B1k1Q9Z
	KY5dyNTIwj6K9bxqGzsQWmdJwBn/gIsRaZmL2fyn4eslHhsh7bP4PfrGT+Of7nn4TcgiaTv5XxQ
	3fNeSkFECN7ucmBzbQ==
X-Received: by 2002:a05:690c:4b81:b0:81e:eaaa:535b with SMTP id
 00721157ae682-81ef2802b3cmr41469147b3.35.1784542291800; Mon, 20 Jul 2026
 03:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260713204802.105115-1-frediano.ziglio@citrix.com>
 <20260713204802.105115-5-frediano.ziglio@citrix.com> <1f4c1217-ee5d-40fb-acfa-057b53a8dae0@citrix.com>
In-Reply-To: <1f4c1217-ee5d-40fb-acfa-057b53a8dae0@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 20 Jul 2026 11:11:19 +0100
X-Gm-Features: AUfX_mzGKL5ZLhSLnomYdSLwMSwU8-jv3Ophxs0HSI2Mr5cCZqCXZ-fXeQXiwYs
Message-ID: <CAHt6W4dRqQMjJbepygR8D1hbBF1WZ8iivX5MvAzdyYkvbnB63w@mail.gmail.com>
Subject: Re: [PATCH v9 4/4] libs/guest: use Valgrind to detect various buffer overflows
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Teddy Astie <teddy.astie@vates.tech>, Anthony PERARD <anthony.perard@vates.tech>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1784542293-FD06B034-A11E5528/0/0
X-purgate-type: clean
X-purgate-size: 2077

On Wed, 15 Jul 2026 at 14:38, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 13/07/2026 9:48 pm, Frediano Ziglio wrote:
> > diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_common.h
> > index c07c6db59e..d3fc7f363e 100644
> > --- a/tools/libs/guest/xg_sr_common.h
> > +++ b/tools/libs/guest/xg_sr_common.h
> > @@ -245,13 +245,21 @@ struct xc_sr_context
> >              xc_hypercall_buffer_t dirty_bitmap_hbuf;
> >              struct xc_sr_context_save_buffers
> >              {
> > +                MEM_NOACCESS_BUFFER(na0, 16);
> >                  xen_pfn_t batch_pfns[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na1, 16);
> >                  xen_pfn_t mfns[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na2, 16);
> >                  xen_pfn_t types[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na3, 16);
> >                  void *local_pages[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na4, 16);
> >                  struct iovec iov[MAX_BATCH_SIZE + 2]; /* Headers + data. */
> > +                MEM_NOACCESS_BUFFER(na5, 16);
> >                  uint64_t rec_pfns[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na6, 16);
> >                  int errors[MAX_BATCH_SIZE];
> > +                MEM_NOACCESS_BUFFER(na7, 16);
>
> If you're going to do this, use 64 not 16, and put iov[] at the end.  It
> is good practice to misalign large buffers by one cacheline, not that I
> suspect the access pattern in this algorithm is relevant.
>

Easily doable. Why put "iov" at the end?

> But, I'm not sure of the utility of doing this.  By removing the dynamic
> allocations you also prevent ASAN from working.
>

It can be extended to ASAN using "sanitizer/asan_interface.h",
specifically "ASAN_POISON_MEMORY_REGION" macro.

> We either care about them all (and keep the dynamic allocations), or
> don't care, and get rid of it all.  This half-way-house serves no good
> purpose.
>
> ~Andrew

Why is a half-way-house ?

Frediano

