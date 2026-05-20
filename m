Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE151CD4F3D
	for <xen-devel@archiver.kernel.org>; Wed, 20 May 2026 17:57:06 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1314244.1584214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPl9v-0004St-8A; Wed, 20 May 2026 17:56:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314244.1584214; Wed, 20 May 2026 17:56:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPl9v-0004Sm-4i; Wed, 20 May 2026 17:56:43 +0000
Received: by outflank-mailman (input) for mailman id 1314244;
 Wed, 20 May 2026 17:56:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <31vUNagYKCVEBxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 1wPl9t-0004Sg-Q1
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 17:56:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPl9t-004uJe-5s
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 19:56:41 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <31vUNagYKCVEBxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6a0df5ab-5cb7-0a2a0a5109dd-0a2a4509c26a-32
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:56:41 +0200
Received: from [209.85.210.201] (helo=mail-pf1-f201.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <31vUNagYKCVEBxt62vz77z4x.v75Gx6-wxEx441BCB.Gx68A72xvC.7Az@flex--seanjc.bounces.google.com>)
 id 6a0df5d7-2497-0a2a45090019-d155d2c9dc2c-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 19:56:40 +0200
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-83f24cd00f8so2788371b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 10:56:40 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779299799; x=1779904599; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6+hlvnmwj5Awnxfo2Fw5NZ8DPJZlHGIf0en9UEe6nA=;
        b=waz1pOgkccI/EWQOK/i4YKIGUNCAc/qknH344jQbd/endX8v9Y+VURQx4P0P4QH7+x
         2Dq3FPEnMl79gtQraj3eRGaDqR0bcmmiFPOwZpuOr3AHtsPCFxyduP1FNYumzeS8HySr
         pVsZo1nreW68NGdCRqNrRrKejrLy/axYNrWqewhTXvpAOhq4pcBZS9pq/JWjvZu0aX0J
         sYtmtMlvyU6C+bP9nyPNYNz7UEXNtNLZwuwZLNdnubj2v1ixrf2RBbS8q4LcN70VTx94
         u5WycHUMt70z2ohZ7sfrakuurwElUUdD7lPlH/wJN1O6muZPS8sufQs2vDmK4+hyd1n6
         gGhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779299799; x=1779904599;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s6+hlvnmwj5Awnxfo2Fw5NZ8DPJZlHGIf0en9UEe6nA=;
        b=gIOAK+bEvjvF3hhhcxR8VcrPBel8JlVcuuK7/TcjeuZ0qLWv0eTx8Pmv3TY7AtN76F
         4PFT+kFjK4uYiE3eJ3SF90czwXvqTlvUDfffwMMRshN/pvEknt7hrg9FtAf8BdfSqhAJ
         6CoGha+eArIKPwingG+8m44SzD+uyPNvbvBuLoaorOn2rSaKY1QDR+YXUUaBr+9Gzo4Y
         BIk/rxO42rpHqAd+Qd6nUFlUfVmmilv5Xz6SOyRuolIdJGyGpWnoDA0HiRZmbK5fxMdT
         0iBOmvOLh7DnLogDYt6RQAnXDWTrTM1UvwLaykpvoFAet1RICt5k2PHiDwXetIFW9Kqi
         tf7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/07m5xtAE9SGjlF7E5biNMEj7RYnZ8FbACzoq3g9UX8G68JZ/jGZdPMIC+sYkrhxsY6MxekU7meaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwE2AaHTANPbR5bgmJFrDDoHjNGOjrZbdtmK7uq6Fz2u/2pbuya
	JQO57u2UcLzgaM0fd8JbBnxPVAVwzKiNli1sFnhUaiC7eI3AWOeWnyHlsmeSnc9JUV/an5NNeeW
	l9DsJ4w==
X-Received: from pfdc18.prod.google.com ([2002:aa7:8c12:0:b0:834:df9e:8e02])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3028:b0:837:8c8f:8f51
 with SMTP id d2e1a72fcca58-83f33db3f0dmr25728027b3a.47.1779299798653; Wed, 20
 May 2026 10:56:38 -0700 (PDT)
Date: Wed, 20 May 2026 10:56:38 -0700
In-Reply-To: <949e39aec749f019b18fa41c2a42bcc9231288b9.camel@amazon.co.uk>
Mime-Version: 1.0
References: <20260515191942.1892718-1-seanjc@google.com> <20260515191942.1892718-3-seanjc@google.com>
 <949e39aec749f019b18fa41c2a42bcc9231288b9.camel@amazon.co.uk>
Message-ID: <ag311hHnqrCGR9Jc@google.com>
Subject: Re: [PATCH v3 02/41] x86/tsc: Add helper to register CPU and TSC freq
 calibration routines
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: "tglx@kernel.org" <tglx@kernel.org>, "longli@microsoft.com" <longli@microsoft.com>, 
	"luto@kernel.org" <luto@kernel.org>, 
	"alexey.makhalov@broadcom.com" <alexey.makhalov@broadcom.com>, "jstultz@google.com" <jstultz@google.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, 
	"ajay.kaher@broadcom.com" <ajay.kaher@broadcom.com>, "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>, 
	"haiyangz@microsoft.com" <haiyangz@microsoft.com>, "kas@kernel.org" <kas@kernel.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "kys@microsoft.com" <kys@microsoft.com>, 
	"decui@microsoft.com" <decui@microsoft.com>, 
	"daniel.lezcano@kernel.org" <daniel.lezcano@kernel.org>, "wei.liu@kernel.org" <wei.liu@kernel.org>, 
	"peterz@infradead.org" <peterz@infradead.org>, "jgross@suse.com" <jgross@suse.com>, 
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"mhklinux@outlook.com" <mhklinux@outlook.com>, "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, 
	"tglx@linutronix.de" <tglx@linutronix.de>, "nikunj@amd.com" <nikunj@amd.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>, "vkuznets@redhat.com" <vkuznets@redhat.com>, 
	"rick.p.edgecombe@intel.com" <rick.p.edgecombe@intel.com>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-bad1c0/1779299801-37F7EA53-5E04E7AD/0/0
X-purgate-type: clean
X-purgate-size: 1036

On Mon, May 18, 2026, David Woodhouse wrote:
> On Fri, 2026-05-15 at 12:19 -0700, Sean Christopherson wrote:
> >=20
> > --- a/arch/x86/xen/time.c
> > +++ b/arch/x86/xen/time.c
> > @@ -569,7 +569,7 @@ static void __init xen_init_time_common(void)
> > =C2=A0	static_call_update(pv_steal_clock, xen_steal_clock);
> > =C2=A0	paravirt_set_sched_clock(xen_sched_clock);
> > =C2=A0
> > -	x86_platform.calibrate_tsc =3D xen_tsc_khz;
> > +	tsc_register_calibration_routines(xen_tsc_khz, NULL);
> > =C2=A0	x86_platform.get_wallclock =3D xen_get_wallclock;
> > =C2=A0}
> > =C2=A0
>=20
> xen_tsc_khz() doesn't use CPUID but really *should*.
>=20
> Care to pull in
> https://lore.kernel.org/all/20260509224824.3264567-31-dwmw2@infradead.org=
/
> to your next round please?
>=20
> (Without the misplaced changes in kvm/x86.c that should have been in
> two different prior commits, and are now folded into those correctly in
> my kvmclock5 branch ready for the next posting of that).

Ya, will do.  What's one more patch...

