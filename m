Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A69CD5BB1
	for <xen-devel@archiver.kernel.org>; Fri, 22 May 2026 12:50:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1316762.1586107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPK8-0002mP-8W; Fri, 22 May 2026 12:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316762.1586107; Fri, 22 May 2026 12:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPK8-0002mI-3x; Fri, 22 May 2026 12:49:56 +0000
Received: by outflank-mailman (input) for mailman id 1316762;
 Fri, 22 May 2026 12:49:55 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <37lAQagYKCSkXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 1wQPK7-0002mC-LJ
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 12:49:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQPK6-006a5e-NI
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 14:49:54 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <37lAQagYKCSkXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 6a1050eb-e002-0a2a0a5209dd-0a2a4506964c-28
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:49:54 +0200
Received: from [209.85.214.202] (helo=mail-pl1-f202.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <37lAQagYKCSkXJFSOHLTTLQJ.HTRcJS-IJaJQQNXYX.cJSUWTOJHY.TWL@flex--seanjc.bounces.google.com>)
 id 6a1050ef-7371-0a2a45060019-d155d6cadc31-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 14:49:52 +0200
Received: by mail-pl1-f202.google.com with SMTP id
 d9443c01a7336-2b9b8137828so74872355ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 05:49:52 -0700 (PDT)
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
        d=google.com; s=20251104; t=1779454191; x=1780058991; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQXBtYOgD26OY0sxOaH3yIHE1h+TPqKS3BQiU+AvFJA=;
        b=jV7Q9I2dA27qnqDRDYYYvH3PQOKQqjvNFpzHYWCV9Cdn+akZCyfW15uhns/YD8yLWc
         rloyX6WWpzextkmZJpPAsZtCSpbeaeeGC2H1FuF92QVshGEWVIYm+uxXTOB5T7uSx9vf
         e7qhy48DdrXCog+Te+d23BoLUbB1HGDRWYgRKyR8udcC7Y/rZv1IukKfHjEw4FbPn+E+
         1RK83OuKDRSG53APBC8j4KRSyZLTd4KYTLY2JuxNt6HuDwEGZn5DPfWudnqLip0Kfse8
         hrCHOGABlq7TCHJK27SwY6d8pPU6OSU8eumCG5Yftjk03MVLxIyqtBOWZUHgFk5vjWR2
         BTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454191; x=1780058991;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DQXBtYOgD26OY0sxOaH3yIHE1h+TPqKS3BQiU+AvFJA=;
        b=f2Z/A069AcU7RMu66JqgJBLyLvLErXIYWkcZbDvM639m3ciKvwYdwzWmYpTHba51aP
         X7FiAE3yXsK/RMgdk2yRxpJxdLy8P1qe3YSDHB55GbUtCuH1WnCl+s4LHp9aU3tFJPAS
         LN+wLNga1rnoVXz566pjunLGDm3L5Ea3WtfX8HOuyPHMak7LEwGKNB8N/B58Ggnr6I3a
         l06EmsdphjZTIfzSlcIfM4fkYYH7HCMrs6ScgQ9ZsraGY+XBJdvGVqor2ZcTlIXXBrUW
         qAsrtGPsGw40epbEiYzXf8k/gMj0B/3rrR2P3TESE7gWXLWKsQjRLUAXRQ34yc5QLgnB
         lyUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jGGkAW7RU0os7ZZIs0E5ljAls9UpwvakzA8Ce1p5MD3rn7Cd/CDvIBgRSlxRFCJjdFVE/eNupPTg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpXgAQJlJ8QamCrUINoumxeiiTX8W5roeam1aTd5Z8+8c841Nj
	N83ED2DB7IeH2Y5l2Ifq7fWD9ftues27saqIlB3fXQe+Ld5W1X6vn8uevHa3F5effipAXgKbnI5
	9YScI2w==
X-Received: from plpf11.prod.google.com ([2002:a17:903:3c4b:b0:2b0:51f0:272d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c94d:b0:2b4:63bf:5535
 with SMTP id d9443c01a7336-2beb073d568mr36887635ad.41.1779454190670; Fri, 22
 May 2026 05:49:50 -0700 (PDT)
Date: Fri, 22 May 2026 05:49:50 -0700
In-Reply-To: <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
Mime-Version: 1.0
References: <20260509224824.3264567-1-dwmw2@infradead.org> <20260509224824.3264567-28-dwmw2@infradead.org>
 <3ad6cd109480772ade3c11f23b9c1d7a9855d67e.camel@infradead.org>
 <ag-Hf2liLSX9q0rS@google.com> <ab84153e33fbe7c25667f595c56b310d4d5a93ef.camel@infradead.org>
Message-ID: <ahBQ7mXNaTtouT3C@google.com>
Subject: Re: [PATCH v4 27/30] KVM: x86: Add KVM_VCPU_TSC_EFFECTIVE_FREQ attribute
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
X-purgate-ID: tlsNG-16d1c6/1779454193-8C47CD75-77086E51/0/0
X-purgate-type: clean
X-purgate-size: 1727

On Thu, May 21, 2026, David Woodhouse wrote:
> On Thu, 2026-05-21 at 15:30 -0700, Sean Christopherson wrote:
> > On Thu, May 21, 2026, David Woodhouse wrote:
> > > On Sat, 2026-05-09 at 23:46 +0100, David Woodhouse wrote:
> > > > From: David Woodhouse <dwmw@amazon.co.uk>
> > > That does leave userspace still needing a way to get the APIC bus
> > > frequency, to populate CPUID. So maybe I'll just make an attribute
> > > which returns that as a single value.
> >=20
> > Already exists, KVM_CAP_X86_APIC_BUS_CYCLES_NS.=C2=A0 The TDX architect=
ure decided
> > that unconditionally telling guests the virtual APIC bus runs at 400Mhz=
 was a
> > brilliant idea.
>=20
> Ah, thanks.
>=20
> So KVM always exposes 1GHz by default regardless of the actual host?
> Which is why there's no *get* method?
>=20
> (Well... getting KVM_CAP_APIC_BUS_CYCLES_NS returns
> APIC_BUS_CYCLE_NS_DEFAULT which is 1, so it's basically just returning
> 1 like a lot of cap queries do, and *not* returning what the period is
> actually set to)

Oh, that's just an oversight, definitely not intentional.  Easy enough to f=
ix:

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1616b2eec6e7..cd4a244ca0c5 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2235,7 +2235,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, lon=
g ext)
                r =3D tdp_enabled;
                break;
        case KVM_CAP_X86_APIC_BUS_CYCLES_NS:
-               r =3D APIC_BUS_CYCLE_NS_DEFAULT;
+               r =3D kvm ? kvm->arch.apic_bus_cycle_ns : APIC_BUS_CYCLE_NS=
_DEFAULT;
                break;
        case KVM_CAP_EXIT_HYPERCALL:
                r =3D KVM_EXIT_HYPERCALL_VALID_MASK;


