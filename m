Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C722606A332
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xTOa0dxg
Received: from list by lists.xenproject.org with outflank-mailman.1497934.1695966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKyL-0004jx-7t; Fri, 20 Nov 2026 09:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1497934.1695966; Fri, 20 Nov 2026 09:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUKyL-0004jp-4A; Fri, 20 Nov 2026 09:31:57 +0000
Received: by outflank-mailman (input) for mailman id 1497934;
 Fri, 20 Nov 2026 09:31:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <shyckless@gmail.com>) id 1xUKyJ-0004jj-JB
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 09:31:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUKyI-003Sm4-PD
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 10:31:54 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <shyckless@gmail.com>)
 id 6b001389-8faa-0a2a0a5109dd-0a2a4508a182-2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:31:54 +0100
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <shyckless@gmail.com>)
 id 6b00138a-f659-0a2a45080019-d155dd2cf0be-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 10:31:54 +0100
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-491971ac844so546965f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 01:31:54 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1795167114; cv=none;
        d=google.com; s=arc-20260327;
        b=EZ3F/R9pt4g0BolsyrX3D9oeM26TfC6Puf8muH82AFSBNxi/8pUTc6Q0EBI6zEGc8s
         a1yGlwni/AI1i+lIN313WKE4gMtDJd6ROnNNBrX/Ddf3R42aNyAOkWQj/0Beaq9EnM0S
         22U19Se8tnYUjt2dZJY2mjaVA4bdbZ8AZPSldbAyINMOiLHjKH+ZvXxlL83lGojxJPMi
         gy3B2m59WBdX1Dovhj8ptRMxlMdyg7M/wuPkhJOcXoIM7SGk9iXwrHbtuyg+TDAlRskN
         FORftfHyGYpptC13dHFUhnNShKRC1ffTMQTu8dVLfWcqz9a0+FmXlWhut9EHKaYEL3Nn
         YONA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
        fh=zD7HiBEO4ZyX9tYMmQjY+uzzDtqGYM52CS3afh2b1IU=;
        b=go0lw9HVvsHk2RiY3evx+1vK1hsAQ/kymVvPcdvwsRysQFX1zhw4rGJlFY8ZeFGcqn
         tJ8trquGGxyiYEy0WRKRVCD2LhRHtI5cksF21Y6QafLTWaqx6dL0f0t0g2ESDLBe5ZYh
         VV9v/0ykOmuatx+okXljghJ0KzWpTKFSG7H3UIaEvnM13zirQIsTM/S/gUh8UBrqKPoL
         toLOh7LLOwi0mNcL8DWIU5ILr9wzXKwryeJk39Q4LQWOy88EuxngtGQk6bJoDZNREWYv
         jQpB/lrRoLuj8SgttryTZlkj9NJu9enQIvoMPc0ULZs73LsVu+X24dwP0h528otna0S0
         wNWA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795167114; x=1795771914; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
        b=xTOa0dxgQ5Y7nJqh/DegAZGtqQ6BmZI1B6fChYbGQMGjm5p1dK98odzELLnHpwNDbS
         6CRUF6sG5WjugZAhL64cDrIl84KnTynqbj+KYi89UDKyCQVaFTqWEmPdY5xpJhJolGZb
         ysloz/e4HXjuAMllYswi0Q2x0ANbj3q50EK7DS7ZDGm6SwgR1NLbasYgF4J9kH1MDBjl
         NhERgcBk0ufyJbqnpwBz7wPTONefr3nYPrykt53OKF+4Go3S9AbIh4tcxwKUJKDgQ4Ag
         k8WoHxX8Fox6Pqg61k3Aam1Fjxr6f90hmvIhPCIsnZUTTso9qpeaiPtli2oqC0gg9lWn
         NhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795167114; x=1795771914;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zn4lAoghu5jQhcYe+1nVRr6HSJgIEjuvXu7xfOq1cUI=;
        b=Xr6MgAVkekx6KhK71YBgvjCQfzQk2fV9+ALsOu1fVP/ZT/vddQ9upyUgUM+isbAXhd
         ekZ0M9fSLzvA0ycBhGcWCBuyxsU2k55zjeFEMRelhqndseQyDFr/RAKEzjmaKm3yjBUc
         TgDIlPtlMPgU2baDb0ZZGmFcy1hyh3Rk4rOTGGndA59GpyHGLfEz+atJNLdJsnpL6nv+
         drK5sGxZyzSEfUmNuaJ/d2+FshwZP2chLgLju++OC89aEOB+5yxlR7JuiRfHbSYnAf0i
         EL5RdhLrUBLykXrhYEryEAtdIR+dzEdVi5fgXBPJzhNhiFPSdNmCryNdF4aUWOtXtGyB
         aveA==
X-Forwarded-Encrypted: i=1; AL+hErFjjdLJ6ZcFOmtmUIF/i7isHixfS06XGB2Az+MGntdD/8HLPG+tjeJTqKK6IzTAVdJvELBjNo+rNAw=@lists.xenproject.org
X-Gm-Message-State: APuU4Z+l+WEIJHPiFD79tntXzHT98zVPpLlw4cRq/oXceuKEFThuzY24
	dSe9PrIlICu/VcklVQLMpN07vfiGXPQVfIEXGa89/lFaobic7UYYqEFQ9oWmCR65Ag0WQmZXZ3M
	Q+3JRzevtrQQVQgt/0qB7Qa17XFTp+D8=
X-Gm-Gg: AZFdTZfHngpScCwvFNm+zU3FD34zjxaHhlz9iS9LaplVGaUOb54Ap5bZby72BsYGSsm
	Yvf3I3znaPGOvmcWFoS9fzsaEguxKIn/zMGZ5ETabjmFng9N1CH1Ig3kBau+ClhV1k2lMt4NtDc
	Coh0rS6GmYJk46orbDBMrK6l9/UoULzl7PnyY4QZCYrRWaxVtlhiN0Qp/5fo7i3wL7myFubn/O1
	a/2spNAsTwrOmaWawhCyJeC6yybYPNUTCBi2gGX8jHQ7AkK6BVwxT2Lvkw6dNFkapJ9pkiFtEst
	3BHvfyGEh5Zl5QGV51CjmbCvuE33ar3cEPbB0+Z+uRdE5w+8P8KAo/wY87SF4She4B86AD48yFo
	bP4NoB9nPqJahSXFQJH3zmgZ0TTbOla4jiIV+3C3nIYRxJ3C6oUAFzT/mSUyS6CzeWjNWq/EYsn
	sqSxXAD6w4XRMarCK2
X-Received: by 2002:a05:6000:2913:b0:4a7:7bec:e16d with SMTP id
 ffacd0b85a97d-4abb0c5d670mr5033398f8f.20.1795167113904; Fri, 20 Nov 2026
 01:31:53 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-xen-tpmfront-v3-1-3ea2e3fd8611@gmail.com> <awALp-m9n07zxwfj@kernel.org>
In-Reply-To: <awALp-m9n07zxwfj@kernel.org>
From: Wong Steve <shyckless@gmail.com>
Date: Fri, 20 Nov 2026 17:31:40 +0800
X-Gm-Features: Aa3M54puGGfyhs9Fb4PbPHCi2DwRGJKHVjyhAyTJ0EWTjaesj9JM_GgTWd2co1U
Message-ID: <CA+X8Sdi3CFZNDSOueF1b+C0myV5kqtwYzcxrUPx2T=8dJKyVzg@mail.gmail.com>
Subject: Re: [PATCH v3] tpm: xen-tpmfront: fix use-after-free in backend_changed()
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: jgg@ziepe.ca, sstabellini@kernel.org, jgross@suse.com, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-c1860d/1795167114-CF75B87B-95712F5D/0/0
X-purgate-type: clean
X-purgate-size: 2237
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jarkko,

On Fri, Nov 20, 2026, Jarkko Sakkinen wrote:
> There's no use-after-free to fix.

OK, with the only backend in use never closing, there is nothing to
hit here. I'll drop this patch. Thanks to you and Juergen for looking
at it.

Thanks,
Suyuan

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B411=E6=9C=8820=E6=
=97=A5=E5=91=A8=E4=BA=94 16:58=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 20, 2026 at 04:26:16AM +0000, Suyuan Wang via B4 Relay wrote:
> > From: Suyuan Wang <stevewong@hust.edu.cn>
> >
> > When the backend moves to Closing or Closed, backend_changed()
> > unregisters the device and then keeps using it:
> >
> >       device_unregister(&dev->dev);
> >       xenbus_frontend_closed(dev);
> >
> > The xenbus watch callback that calls backend_changed() does not hold a
> > reference to the device. The tpm_chip registered by xen-tpmfront has de=
v
> > as its parent and holds a reference to it, but tpmfront_remove() drops
> > that reference when it unregisters the chip. So device_unregister() can
> > release the last reference and free the xenbus_device, and
> > xenbus_frontend_closed(dev) then accesses freed memory.
> >
> > The stubdom based vTPM backend, the only one in use today, never
> > switches to Closing or Closed, so this path is not reached with it. It
> > is reached with any backend that follows the normal xenbus state
> > machine on shutdown.
> >
> > Take a temporary reference before unregistering and drop it after
> > xenbus_frontend_closed(). This keeps dev alive for the last access and
> > keeps the existing order, in which TPM operations are stopped before
> > the frontend is marked Closed.
> >
> > Found with a static analysis tool and checked by hand.
> >
> > Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
> > Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
> > ---
> > Changes in v3:
> > - Drop the Fixes tag (Jarkko). No code change.
> >
> > Changes in v2:
> > - Say that the stubdom vTPM backend never reaches this path, and don't
> >   ask for a stable backport (Juergen, Jarkko). No code change.
>
> There's no use-after-free to fix.
>
> Br, Jarkko

