Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AC2606A335
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 19:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=stKYPTMS
Received: from list by lists.xenproject.org with outflank-mailman.1496905.1695265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU8DZ-0005Tc-Lt; Thu, 19 Nov 2026 19:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496905.1695265; Thu, 19 Nov 2026 19:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xU8DZ-0005TV-HV; Thu, 19 Nov 2026 19:54:49 +0000
Received: by outflank-mailman (input) for mailman id 1496905;
 Thu, 19 Nov 2026 19:32:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <shyckless@gmail.com>) id 1xU7rc-0007hH-Dj
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 19:32:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xU7rb-008D79-C6
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 20:32:07 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <shyckless@gmail.com>)
 id 6aff4e96-e002-0a2a0a5209dd-0a2a450cb5dc-48
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:32:07 +0100
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <shyckless@gmail.com>)
 id 6aff4eb6-f479-0a2a450c0019-d155dd30e098-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 20:32:07 +0100
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4aa5833c263so47775f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:32:06 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795116726; cv=none;
        d=google.com; s=arc-20260327;
        b=X4h2oaX/CcWush2Es3/QHO/bPoBC+xf/k7dQ2MbWX9/FK1kFORuTuRj+5x2Gp4FsUr
         S96hEj6GUo+WadIufO3Qy26NTaKmjsMVu1xkHzozA70/PI7jQAyuK1JSFR8HzLOzdOng
         Ae6t8ddlk2pl75ZA1VHfyyHVwHePKl2RVymjJDU1r18uonkz3PcDBcCBap81z3pfAGmb
         HfsxuQEk8yliRELuYqO58UxwmK4CxouonhFMgXXSK/Iu5mA84XYAh/WZ/MJP5h/IMVMK
         QvgStKVx44Hf5SiRQwCoyLDRiVUdrhJEw4d/elWW3PtpOFn4ElFh/WVAKX10xPej/1A6
         QyIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
        fh=a1Kfrk7nuDrlJfijhICnpfuCCPB9yKBd83Udh67O3II=;
        b=cMCUWzEbrHl8g4/FTkYZQK0legvk78dAwoUVIK/gJaGEy6bs0S/T7axWuRx7WPQvHN
         F6Gc5OtM49ocqdRuC0NScipYKYxUy8unobxWA0qnxdtmHiTs2v9bHkkriHwK4mYba5xs
         I4pTa1/FCRNFl0Yr7Rc6rQmrAHoNmsOit+aaSECbSsNIMuSci8lexGFetKdXpxLJytif
         wpqW2iQQBw8GnsCe7+K+42jC076VZBxijZ2DJCowELbNJEgJxdH4y1O7zm3A8FmthBQP
         n7b0DImZpSnYxCjBYKSilSYwaOcmPx2MHqN7lHwt+niONBaYIm12Jx7j0GnXdF4dZ7la
         uSbg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116726; x=1795721526; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
        b=stKYPTMS357pF4hrmnct/WpO5N7oj0LDfVm8/d3Sa581sfZtHR982Re2TXtqNlSxZi
         IR6SmtfOWX232Yl3NbnitCn4TXt1BHfMhdndTwQjO+/8ar1rp/kgI15ET58BXUAwRwNL
         t8CzmEmlOm/89lusd02Tub0jYerXgBz4VpLzAh6WU28PYvI+y6G80lc463r9HQw3USPq
         ppgIhwvjWYAL+HvIolJDqscGjlLI3JKN9bvB6cySIoZUncyJk/SNlv35kqrQe/5vnvp3
         R2/sCMgdic0D4JPGwboA194OrJBdqxOhAUGSfW5pWE7/L9YcYq2plZ6ePH9dCnMcn87+
         n0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116726; x=1795721526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zHELh1wvQ9nrwWZUArifTWwLGXrX5lfqWf4Gv/ulNME=;
        b=U+/1ffYXZ/gPbDAb8a1+6z4hqR2KAKqsGzZqCX7o5uncYbFb2Ki2QoOipKzUY6H+VP
         RtwV+24JyyA6V56uq9LFZwB9fH6N2MItSrVGKi6zWTrdStGT4ZJCRlnPGcLVn1LYa2Cb
         cJBZc/izXU6WbDqAF7wQOSQi0MlvK1SGPUpyJwPzpPP9tdZxNRCDL04RXy6MVi/eoxOG
         lEYdidpvlkyYC89ufPU5Xt+2G7rhRxTyF6KxcJdo5LSZtIXqHRVUm+PRKhvQpRx4ueNW
         wH9tZNnd0RVf32jPVdi13bgCUWZk+9+kSBBm5v3QPwgLqeQHGHnNlidBxPvGNoiORvdE
         M/fA==
X-Forwarded-Encrypted: i=1; AL+hErEawUT0104sZjG9P7zVBNk0bzxUm2Jee0marKc2u4BThLvXkoQ55C+PaQ6COtXn8cY/Q45Zz4RMmJM=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+QjX5q38zTNlK2hGtwam/Vh93EUrFcAaL5qFaPneOYcWZz7dlF
	hjiZSGokgO/GY20vyNbJ4gkinKgzZvxc2yfbMkK5nvKdUSxJ47I6yWSF8X7UKgEs2F4iBMDTCxP
	f6fNKctNfZO8k5AT3NukJz+d067iEnJU=
X-Gm-Gg: AZFdTZeZ042vQ3RTmTP25qjj7UIzZQrNze/JUP7w8WcXmqzOxv/AOGjBZZkWGDcYsEh
	rcZXn2L3uEg3DpCnKrEFoHt94wwGMHxE2R1eUIH2+8s2AfWN9E+NYyKIT4TYJcFoYUDH2+169Vt
	FwQJYymZBnXTGZ4RO7AqXu9c+DwlUeWet1iRxs21FSeGvqUcIPkYFPNO9/RB8v96hOsMG6dRXfl
	7nhAy0uYD3sYaHib1Dbe5HxvknvJvW9WuTinNx+MppLn/Q1BjXw+3SoFrTyXbZo4eqAsNu/SO71
	3coFS0byfLEgIxmdhSoU7yKIjFLOG9H1hYDSohCbw3fhyKkjJrHUW1gNnEn0PBanln118dx1lkz
	5CKR+7OUZAG86klRFLvpob22ussVT5IVpoA==
X-Received: by 2002:a05:6000:4705:b0:48f:cb37:3ec3 with SMTP id
 ffacd0b85a97d-4abb400c591mr853280f8f.41.1795116726352; Thu, 19 Nov 2026
 11:32:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-xen-tpmfront-v1-1-bfabbbed462a@gmail.com>
 <av8Tr2jTQaOBOEid@kernel.org> <8c988944-34e3-4fc9-a323-daca101c1bab@suse.com>
 <av8kIqYC04D5QdXf@kernel.org> <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
In-Reply-To: <3b37565a-4dd7-454d-99b7-108b8e4e7133@suse.com>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 20 Nov 2026 03:31:53 +0800
X-Gm-Features: Aa3M54rJ-G9ninS-5Hi_IFXsKYFH3S7hyehBNAqEoZNCg_X0cyVis4rAtusXM0A
Message-ID: <CA+X8Sdj4KRfJagaKHkcXrv370Si_WktanBqRN-SrB7qOMH=FAg@mail.gmail.com>
Subject: Re: [PATCH] tpm: xen-tpmfront: fix use-after-free in backend_changed()
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>, jgg@ziepe.ca, linux-kernel@vger.kernel.org, 
	sstabellini@kernel.org, linux-integrity@vger.kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1795116727-51339A5B-14B80F43/0/0
X-purgate-type: clean
X-purgate-size: 3676
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Juergen, Jarkko,

Thanks Juergen, that explains why nobody has run into it: with the
stubdom backend the frontend never sees Closing or Closed, so this
path is only reached with a backend that does close. I agree the
normal state machine should stay.

So with today's backend this is latent. Jarkko, if you prefer, I can
send a v2 that says so in the commit message and drops the
Cc: stable.

Thanks,
Suyuan

J=C3=BCrgen Gro=C3=9F <jgross@suse.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8820=
=E6=97=A5=E5=91=A8=E4=BA=94 00:32=E5=86=99=E9=81=93=EF=BC=9A
>
> On 19.11.26 17:30, Jarkko Sakkinen wrote:
> > On Thu, Nov 19, 2026 at 04:35:02PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> >> On 19.11.26 16:20, Jarkko Sakkinen wrote:
> >>> On Thu, Nov 19, 2026 at 11:20:33AM +0000, Suyuan Wang via B4 Relay wr=
ote:
> >>>> From: Suyuan Wang <stevewong@hust.edu.cn>
> >>>>
> >>>> When the backend moves to Closing or Closed, backend_changed()
> >>>> unregisters the device and then keeps using it:
> >>>>
> >>>>    device_unregister(&dev->dev);
> >>>>    xenbus_frontend_closed(dev);
> >>>>
> >>>> The xenbus watch callback that calls backend_changed() does not hold=
 a
> >>>> reference to the device. The tpm_chip registered by xen-tpmfront has=
 dev
> >>>> as its parent and holds a reference to it, but tpmfront_remove() dro=
ps
> >>>> that reference when it unregisters the chip. So device_unregister() =
can
> >>>> release the last reference and free the xenbus_device, and
> >>>> xenbus_frontend_closed(dev) then accesses freed memory.
> >>>>
> >>>> Take a temporary reference before unregistering and drop it after
> >>>> xenbus_frontend_closed(). This keeps dev alive for the last access a=
nd
> >>>> keeps the existing order, in which TPM operations are stopped before
> >>>> the frontend is marked Closed.
> >>>>
> >>>> Found with a static analysis tool and checked by hand.
> >>>>
> >>>> Fixes: e2683957fb26 ("drivers/tpm: add xen tpmfront interface")
> >>>> Cc: stable@vger.kernel.org
> >>>> Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> >>>> Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> >>>> Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> >>>> ---
> >>>> Compile tested on x86_64 (W=3D1, no new warnings). Not run with a Xe=
n vTPM
> >>>> backend.
> >>>> ---
> >>>>    drivers/char/tpm/xen-tpmfront.c | 3 +++
> >>>>    1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/drivers/char/tpm/xen-tpmfront.c b/drivers/char/tpm/xen-=
tpmfront.c
> >>>> index 3c0cce57c4ae..1be925cca535 100644
> >>>> --- a/drivers/char/tpm/xen-tpmfront.c
> >>>> +++ b/drivers/char/tpm/xen-tpmfront.c
> >>>> @@ -397,8 +397,11 @@ static void backend_changed(struct xenbus_devic=
e *dev,
> >>>>            case XenbusStateClosing:
> >>>>            case XenbusStateClosed:
> >>>> +          /* device_unregister() can drop the last reference to dev=
 */
> >>>> +          get_device(&dev->dev);
> >>>>                    device_unregister(&dev->dev);
> >>>>                    xenbus_frontend_closed(dev);
> >>>> +          put_device(&dev->dev);
> >>>
> >>> Not a NAK but makes me wonder why this has not hit the wall ever.
> >>>
> >>> I.e. "feeling confused".
> >> Is there any vtpm backend other than the stubdom based one?
> >>
> >> If not, then it is quite easy: this backend never switches state to
> >> XenbusStateClosing or XenbusStateClosed.
> >>
> >>
> >> Juergen
> >
> > Should it be removed use the default-fallback?
> I don't think so.
>
> There might be other backends in future, so following the normal Xen PV-d=
evice
> state machine should be kept.
>
>
> Juergen

