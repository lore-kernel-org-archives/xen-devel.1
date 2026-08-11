Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7B6C5B56A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Aug 2026 14:16:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1388278.1629488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtnH6-00016U-Dx; Tue, 11 Aug 2026 14:16:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1388278.1629488; Tue, 11 Aug 2026 14:16:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtnH6-00016N-9r; Tue, 11 Aug 2026 14:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1388278;
 Tue, 11 Aug 2026 14:16:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3qy57agYKCVAAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 1wtnH5-00016H-9v
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 14:16:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtnH3-0048Bi-SL
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2026 16:16:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3qy57agYKCVAAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a7b2ead-e002-0a2a0a5209dd-0a2a4502b0a4-0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:16:13 +0200
Received: from [209.85.215.198] (helo=mail-pg1-f198.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3qy57agYKCVAAws51uy66y3w.u64Fw5-vwDw330ABA.Fw57961wuB.69y@flex--seanjc.bounces.google.com>)
 id 6a7b2eac-6ca4-0a2a45020019-d155d7c6ecfb-3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 16:16:13 +0200
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-cbedb8673ceso286302a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Aug 2026 07:16:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=google.com header.i="@google.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786457772; x=1787062572; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0x2URhZVNyLUMnaCJcyZpjyHlUxRNnCvJLXmuoMKMjI=;
        b=mZf5aOBzHwiaCkZo7PLsa6xBUUgMwtBkmxz/pOw4wGgEJxJe93Y1zgff2SZy3GxpOT
         +MW3C+kJ9k0epU1EDBRzmpueDeW67RlvNYpIdq3OwKq6z1w97x/NWebU/0CTIG3Fco4u
         r0IdbgPF0XRkJM2I/tM3uGopEm32j7yrorccuhS4V5NjWPwYO4H4E9N/Hzodr6dFo6s6
         nIGs1oIXuoa/1IZXe2aWNAKKoyvOs2Lh42pxMkvO7ou5tG/g4QMjK0QrDsICLFY7KnOq
         Av2H3qNIPw0LQXTM3GVigbx7amZgVmPrIeXoHrftgJDxrNJqIsC0R4GVBt7mCQ/NIqHu
         QXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786457772; x=1787062572;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x2URhZVNyLUMnaCJcyZpjyHlUxRNnCvJLXmuoMKMjI=;
        b=PhQa5OsrZlym/LgSbb5NSbocYBOXdSTKh8YbLecgHiOykOyA9EnlqIFl8NJ2HNup23
         TMgzazTh6kOv2tP2/XY1ojULAlclIWGEYTaYwQu+R0GwN432yH1ZXUGvX5r6McdLJk4w
         iwK0ipuDEBom+3EIZMvqyILKKcInaYV4rCCBXYG2YLZGaioXdv7paeQQ7BbUX3yiyUyQ
         nWsoLd34HP5sj14Qo/Xp4xxe4Q719w883epc0fOgQQ5PQurSzlM9S1MRMd5f3AyWo+Lt
         BN0QmmADqhXtFuBXJ0cxgzwZFj8Q43ulKd6UEdgIYfGYYvr+LTzFzuGyh9MMLf1imOFL
         fkgw==
X-Forwarded-Encrypted: i=1; AHgh+Roc5U+xcPaaE6xEVxWyYfR1WZ9SooJAPBYku0mADqE2sYVAWn4WKCmivAU7dBvw8X8E8fhg77s+/Q4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwefaRWlJqXx+Of77dBHOb4JLfXYJDl0nl/90N2xBSz5+kuZjEY
	GS+t6qrieZ2/GcQDIOGaTL6yiayegt63aqw6SPN75sP0l9Sc9QRI3HJBoauz5Yoehdh9rxVDG9b
	QxZeLGQ==
X-Received: from pfbkm16.prod.google.com ([2002:a05:6a00:3c50:b0:84a:310d:317a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:f8b:b0:84e:4d6:78fe
 with SMTP id d2e1a72fcca58-84fa86b672amr4014025b3a.3.1786457771384; Tue, 11
 Aug 2026 07:16:11 -0700 (PDT)
Date: Tue, 11 Aug 2026 07:16:10 -0700
In-Reply-To: <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-18-dwmw2@infradead.org>
 <anoOz2rZ02KFk1l-@google.com> <acd9b32617f75d188c370a464a922af0d650d4f5.camel@infradead.org>
 <ano6-gIZtqMfipiD@google.com> <bb9a12cc663130eb2caa8e839d0f6ca53d722d1c.camel@infradead.org>
Message-ID: <ansuqrD2KwFuLWbV@google.com>
Subject: Re: [PATCH v7 17/36] KVM: x86: Allow KVM master clock mode when TSCs
 are offset from each other
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Paul Durrant <paul@xen.org>, 
	Jonathan Cameron <jic23@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Jack Allister <jalliste@amazon.com>, 
	Dongli Zhang <dongli.zhang@oracle.com>, joe.jin@oracle.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-720697/1786457773-F38BC2AC-BCE1BB86/0/0
X-purgate-type: clean
X-purgate-size: 1726

On Mon, Aug 10, 2026, David Woodhouse wrote:
> On Mon, 2026-08-10 at 13:56 -0700, Sean Christopherson wrote:
> > =C2=A0
> > > > To allow different offsets, KVM would need to track a per-vCPU offs=
et to the
> > > > master clock and apply that in kvm_guest_time_update() (and maybe o=
ther places?).
> > > > Which is doable, but it's not clear to me why we'd want to support =
that (though
> > > > I haven't fully processed the back half ot his series, so it's very=
 possible I'm
> > > > missing something obvious).
> > >=20
> > > Because I want to reduce the number of cases where we have to fall ba=
ck
> > > to non-masterclock mode. Especially the ones which are driven by
> > > *guests* rather than weird choices on the VMM's part.
> >=20
> > But why though?=C2=A0 What is the harm to the host or guest?=C2=A0 E.g.=
 does it make it more
> > difficult to accurately migrate the VM?=C2=A0 I'm not opposed to allowi=
ng master-clock
> > mode with diverging offsets, just trying to understand why it matters.
>=20
> Accurate migration without masterclock is hard, yes. The
> KVM_SET_CLOCK_GUEST thing relies on it (because the principle is that
> you get the *TSC* right, then the KVM clock is just a fixed
> mathematical function of that).
>=20
> That *shouldn't* be difficult with offsets between vCPUs. Just use the
> TSC of vCPU0 as the reference for KVM_SET_CLOCK_GUEST and let the
> others just have their offset from that.

Yeah, my only (quite mild) concern is that we would introduce fragility by =
adding
yet another variable that needs to be accounted for, but AFAICT it's litera=
lly
just the tsc_timestamp in the shared data structure that consumes the per-v=
CPU
offset.

