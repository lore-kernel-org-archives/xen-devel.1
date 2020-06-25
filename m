Return-Path: <SRS0=ZzRU=AG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA7BC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2020 02:44:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D697C2078D
	for <xen-devel@archiver.kernel.org>; Thu, 25 Jun 2020 02:44:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJrRcOqc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D697C2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joHs7-0007PR-Cy; Thu, 25 Jun 2020 02:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oVq+=AG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1joHs6-0007PM-Ts
 for xen-devel@lists.xenproject.org; Thu, 25 Jun 2020 02:44:14 +0000
X-Inumbo-ID: c12253e8-b68d-11ea-b7bb-bc764e2007e4
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c12253e8-b68d-11ea-b7bb-bc764e2007e4;
 Thu, 25 Jun 2020 02:44:14 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id t25so233885lji.12
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jun 2020 19:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ijxYOypE8JXmxPV7oqzpPRU34Arl5A/6UxXyzebkzTE=;
 b=aJrRcOqcB6m7AtN2HWtoifTfn5MvNxminS0EWt/BO2jobOhDpWEwVAh/U4We2yzNwi
 j8G1/OVA6ztA3TYFz6vw79ki0ePUwKugeodA+6ZC5m4TrhDif/lLjZv97BxEUlzKD/sw
 qYCYbTmHp/wWihFbMiPIHYRmUG8f+zJTNWl0GXQKm/DEh3FmT0F40a5jz8dPXFJ8hDnO
 D1k2Jln0hRIfu6HSRvUR+ci8Uoc5yAKuKgpdji+y83Jo3RuBX93j59VLcI30QvucAgje
 CRX4Yd3NAu/q9n2ILMvaPz/nS9rDTC5XLXhew4elue1ZfiuKKQwF0/ainIbLNu+WGMjY
 pCMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ijxYOypE8JXmxPV7oqzpPRU34Arl5A/6UxXyzebkzTE=;
 b=UqI+57ZE2XLWvOSWU0GIDle0fEngL8v1wD+56z0WKTMKRJuVmn8QeJfigt3q2fUQSq
 CidyyytJk2JyPTggEHO0QOzlMrb7yH2iziP1QDX/7wvUYz2y4cNWkfLn3RRzfFrxGlSG
 kYdQaZzF5YQwSLywrUiXzB6nFeV1qDZMiexF8iSq05o0lugOtSZ0pdBixHiJofIjxhvV
 pn+TYJ/K8NhhzxLhnu8YYPYodi483qSSuBPAPU9e4XPweZR1yrXgzyFm+PDtjydPdO12
 Kiw4TX7jTtTIlRDLFgNjeDCg8Owa2jz3UsAmBBnATI1/9U6WBgXrFYcSZ/rJO0e946t6
 F2WA==
X-Gm-Message-State: AOAM531pylrmLbhcQWGqNUyuGdaiDQSBwaC0ruWUfkFfr1wSCGW7AisP
 vDoDsdYgf9d/Y63mBL17MEl+JrslhrTOyebHGzc=
X-Google-Smtp-Source: ABdhPJyuLSZ/XCaBa1ABWU/XsMuIcc8TqjQSUuD8XEgjbvwas8KZop8+H2BeD4OCm3fYLTHkJ/qjr/24fQvYc3CNdBg=
X-Received: by 2002:a2e:978b:: with SMTP id y11mr3907624lji.399.1593053053018; 
 Wed, 24 Jun 2020 19:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xptNySqXOHAZJiiBq=h99GBQcS8Cbzmpyqzy-ucxX8Od2Q@mail.gmail.com>
 <20200624175653.GA49433@work-vm>
In-Reply-To: <20200624175653.GA49433@work-vm>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 24 Jun 2020 22:44:00 -0400
Message-ID: <CAKf6xpvtiOVSY8VWFi-bRAAsTGy0nVNZk0aO4HKshXAXQ9Kt5Q@mail.gmail.com>
Subject: Re: Migration vmdesc and xen-save-devices-state
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, QEMU <qemu-devel@nongnu.org>,
 zhang.zhanghailiang@huawei.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jun 24, 2020 at 1:57 PM Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Jason Andryuk (jandryuk@gmail.com) wrote:
> > Hi,
> >
> > At some point, QEMU changed to add a json VM description (vmdesc)
> > after the migration data.  The vmdesc is not needed to restore the
> > migration data, but qemu_loadvm_state() will read and discard the
> > vmdesc to clear the stream when should_send_vmdesc() is true.
>
> About 5 years ago :-)

:)

> > xen-save-devices-state generates its migration data without a vmdesc.
> > xen-load-devices-state in turn calls qemu_loadvm_state() which tries
> > to load vmdesc since should_send_vmdesc is true for xen.  When
> > restoring from a file, this is fine since it'll return EOF, print
> > "Expected vmdescription section, but got 0" and end the restore
> > successfully.
> >
> > Linux stubdoms load their migration data over a console, so they don't
> > hit the EOF and end up waiting.  There does seem to be a timeout
> > though and restore continues after a delay, but we'd like to eliminate
> > the delay.
> >
> > Two options to address this are to either:
> > 1) set suppress_vmdesc for the Xen machines to bypass the
> > should_send_vmdesc() check.
> > or
> > 2) just send the vmdesc data.
> >
> > Since vmdesc is just discarded, maybe #1 should be followed.
>
> #1 does sound simple!
>
> > If going with #2, qemu_save_device_state() needs to generate the
> > vmdesc data.  Looking at qemu_save_device_state() and
> > qemu_savevm_state_complete_precopy_non_iterable(), they are both very
> > similar and could seemingly be merged.  qmp_xen_save_devices_state()
> > could even leverage the bdrv_inactivate_all() call in
> > qemu_savevm_state_complete_precopy_non_iterable().
> >
> > The would make qemu_save_device_state a little more heavywight, which
> > could impact COLO.  I'm not sure how performance sensitive the COLO
> > code is, and I haven't measured anything.
>
> COLO snapshots are potentially quite sensitive; although we've got a
> load of other things we could do with speeding up, we could do without
> making them noticably heavier.

qemu_savevm_state_complete_precopy_non_iterable() generates the vmdesc
json and just discards it if not needed.  How much overhead that adds
is the question.

Thanks,
Jason

