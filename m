Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17C0C55171
	for <xen-devel@archiver.kernel.org>; Fri, 31 Jul 2026 23:16:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1379669.1624083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwSf-0005ro-1M; Fri, 31 Jul 2026 23:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1379669.1624083; Fri, 31 Jul 2026 23:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wpwSe-0005rh-Tp; Fri, 31 Jul 2026 23:16:16 +0000
Received: by outflank-mailman (input) for mailman id 1379669;
 Fri, 31 Jul 2026 23:16:16 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <3vCxtagYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 1wpwSe-0005rb-2D
 for xen-devel@lists.xenproject.org; Fri, 31 Jul 2026 23:16:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wpwSc-00Ad6Z-Te
 for xen-devel@lists.xenproject.org; Sat, 01 Aug 2026 01:16:14 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <3vCxtagYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a6d2c4c-2eae-0a2a0a5409dd-0a2a450babde-46
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:16:14 +0200
Received: from [209.85.216.71] (helo=mail-pj1-f71.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <3vCxtagYKCSUTFBOKDHPPHMF.DPNYFO-EFWFMMJTUT.YFOQSPKFDU.PSH@flex--seanjc.bounces.google.com>)
 id 6a6d2cbd-b7e8-0a2a450b0019-d155d847d825-3
 for <xen-devel@lists.xenproject.org>; Sat, 01 Aug 2026 01:16:14 +0200
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-38dd87656d3so2062307a91.2
 for <xen-devel@lists.xenproject.org>; Fri, 31 Jul 2026 16:16:14 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785539773; x=1786144573; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A2ZszD5oB/5IQjIY93Gpv4YTCK5z3C0SzJKpHpheYqk=;
        b=Uzeee7Hhj1gRh01ldYRlLtmf1Xdl2UauycnDF/suYvNunEt0NcbS/lRxQAhb2i99ix
         Cjqe4Ko0/sqK1k1HcWKYvne8U7HJWSjx1yZCwTZVAoMlNXdx5xeQcjDndcyjht8tPWWQ
         87MWZ/3Tl3ZF4ZV+i8KNjYT/Rqnlia+FnYAgQFJI49bjn6PFcAPdzSdHzA4J4EbbvgkF
         XxX/YaiLiHImuC3CBlva+8iHeIKBlsFiGjvbw8XFbRoKuRAqX9fCrlH4TKCdwVmHtkur
         HEdfwBhV0XKM0un+QXvxNSVOpuYbnKm0Tn2VZubzEEJxtNxZRuAu+q7iThUCFlfRMLTB
         DoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785539773; x=1786144573;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A2ZszD5oB/5IQjIY93Gpv4YTCK5z3C0SzJKpHpheYqk=;
        b=EeLL9FE/DIlm0HTcoGa9mNS6GvvOW1rYcbASv1KGgnxXmCdYO5BKo++aUXhNhgAmIK
         spq3IA/TaMxVyBDaGBXIXPZ7dNjbz3jTmfNlX6IEHqkcchV8wVMbxadf73GKZy686MoZ
         PffeGb4k/23X7AWCyRTn0onoSIumm7KwLQ6+sDkH2cxsY38Jr/lC1+iUhNRmmgKf+fmw
         DsRYJdmY+fbA3If6Zj8cuXM62pEL6ayXAWRLwcdd0OQSSYBWXXdDI8GAw/AfSnehV1/r
         sz1lHGb2t7HuuUPtmAyTLXAPHS+Ue4t8pDU0CTI5I6jTN2Jww5dXC67EXLOsPP3/MTgZ
         98KQ==
X-Forwarded-Encrypted: i=1; AHgh+RqoKeXzpYuUPYNCiNW+bJbOMTvflKv13wcFU2N1vHpFBLHcdO4jBNjgRi88+5RxKbp0TL2poO9/N/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/p7Hhkqu3Bnx6UudNhbZY6AHG0hnI1sQ+Y/m7mbqVBRBmQtwK
	bxkYl+fJxmDmSKlPQTXSBFjtkQvQ+ZRYb8iP1oAxvqCRW+ZAH3RxwXld2MT1UM1gZ8RP3w+Vg0l
	TYW5nAg==
X-Received: from pjbqx12.prod.google.com ([2002:a17:90b:3e4c:b0:38e:a577:5cbd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:584e:b0:38e:76f8:fcbe
 with SMTP id 98e67ed59e1d1-38fbc561b48mr1327142a91.29.1785539772383; Fri, 31
 Jul 2026 16:16:12 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:16:11 -0700
In-Reply-To: <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Mime-Version: 1.0
References: <20260703212145.343527-1-dwmw2@infradead.org> <20260703212145.343527-6-dwmw2@infradead.org>
 <amPWX8lKXw2KS_kZ@google.com> <e8e7554debef481d13265f0870e847e2fa37f7c2.camel@infradead.org>
Message-ID: <am0su482WLEa3ojQ@google.com>
Subject: Re: [PATCH v6 05/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
 accurate KVM clock migration
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
X-purgate-ID: tlsNG-42698a/1785539774-1A8D99EA-75508FE8/0/0
X-purgate-type: clean
X-purgate-size: 755

On Sat, Jul 25, 2026, David Woodhouse wrote:
> On Fri, 2026-07-24 at 14:17 -0700, Sean Christopherson wrote:
> > On Fri, Jul 03, 2026, David Woodhouse wrote:
> > > +4.145 KVM_GET_CLOCK_GUEST
> > > +----------------------------
> > > +
> > > +:Capability: none
> >=20
> > Why not add a CAP?=C2=A0 The check in the subsequent selftest is quite =
gross.
>=20
> Because nobody would ever use it in practice anyway.=20

Yes, the selftest will.

> Even if the ioctl is present, you *still* have to try it and fall back to=
 the
> old method because there are ways that a *guest* can force master clock m=
ode
> off.

That's totally fine, but userspace, especially for selftests, needs a way t=
o
know the ioctl exists and _should_ work.

