Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 862F4C55184
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2026 23:38:49 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1382691.1626018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrOiF-0007QY-HS; Tue, 04 Aug 2026 23:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1382691.1626018; Tue, 04 Aug 2026 23:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrOiF-0007QR-E0; Tue, 04 Aug 2026 23:38:23 +0000
Received: by outflank-mailman (input) for mailman id 1382691;
 Tue, 04 Aug 2026 23:38:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <36XdyagYKCfwwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 1wrOiE-0007QL-0a
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2026 23:38:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrOiC-002ejV-4h
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 01:38:20 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <36XdyagYKCfwwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a7277cc-e002-0a2a0a5209dd-0a2a4504d3bc-14
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:38:20 +0200
Received: from [209.85.210.198] (helo=mail-pf1-f198.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <36XdyagYKCfwwierngksskpi.gsq1ir-hizippmwxw.1irtvsnigx.svk@flex--seanjc.bounces.google.com>)
 id 6a7277ea-b57f-0a2a45040019-d155d2c6d0f4-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 01:38:19 +0200
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-8486c3411c8so432403b3a.2
 for <xen-devel@lists.xenproject.org>; Tue, 04 Aug 2026 16:38:19 -0700 (PDT)
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
        d=google.com; s=20251104; t=1785886698; x=1786491498; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCQeULnuxyizouUVujp9ZRZMwHTWkFpcMFYeBXRE7J4=;
        b=sYb+VhPgMeKWlobkFKPoJlB0RoNcWw5WMGQzmTEIjs0PvAZG668J1PZAD2XjEUzAbx
         fxy3OSwt63BVb5BJ723myCT9nxtiCjSz7lUi09bg6tT02yjbhkeYQkVXbciDCcnjUBEg
         6e4p1DWCuxB77RDbvybFsMhcF3Gamcb9NTkdBoru/GseYt5FA7Q5I95sDvQ7NWk9+wsH
         CgENSTa0dRvVO9K/yyF+hbt6dRj5XQBV7gV0qjMJcFB/NcST9ABrb19rrbGNx5Se8tN4
         AMjEvyCEcG/kplPqR0Cei3o6baoe8OrO2Ysad/If325tHgte9RIhNEFI8IaJ/fA8VwdA
         ZBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785886698; x=1786491498;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCQeULnuxyizouUVujp9ZRZMwHTWkFpcMFYeBXRE7J4=;
        b=JGPL1G+ive0LS/sx5HVijuswEe0sK1tMzitfR9eNWj7wCPxIiA/k43dNWj6oT20RZY
         cbwipMzhEZkL6kn593/dBbCyAWyKCaRQiV5WqAfEZkf9ae7d775FfZb34k2G8htDfSr/
         kWZYmmG+Up8DV0TeiI0YRfBk1kYxG9Z01lxuhQPJpC3D4jdbbzyAWsx7Q/fLBO7VMHtB
         Rbx6qk6i/aAhq1LqPDOfWVovyXsM8HehJFOrkDYZANM4T1iVmBrUDvrCcCtynxQdacww
         YvYxQT7n/714VRntmfNDwBjj5w0fBA8pZKnvu4+buinoJKmv3z46EA0ZTRIitAEAWPAh
         tyow==
X-Forwarded-Encrypted: i=1; AHgh+Rp0A43ac/WUxOwsaw6gOBNgMkouLk+5TvG5RJBVhSggTkz1yZk9VN1VB5LGn8+QJf4SCfJtpRp8dTc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YytBpQ2fqC/GfWGir/Jh73UnqgJb9uyu1k91L935q53GlnZTxOe
	YG1WSJt/T15d3JXYQ/NEh9nuRwA5FRmMSZJU5kDkkuIPrEOdeJJzsDK3t0EqR7Fz28IHOJsPyHg
	Sj4YK0g==
X-Received: from pgig16.prod.google.com ([2002:a63:f410:0:b0:c92:11a5:bbce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3a15:b0:84a:60a4:2651
 with SMTP id d2e1a72fcca58-84f2dfc53efmr1961102b3a.6.1785886697620; Tue, 04
 Aug 2026 16:38:17 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:38:17 -0700
In-Reply-To: <d2d98dd31718eb925ae44b0eceb325538a8174ae.camel@infradead.org>
Mime-Version: 1.0
References: <20260728144954.355376-1-dwmw2@infradead.org> <20260728144954.355376-32-dwmw2@infradead.org>
 <am0upFND1r93HPxq@google.com> <d2d98dd31718eb925ae44b0eceb325538a8174ae.camel@infradead.org>
Message-ID: <anJ36SBzN7HL4A2D@google.com>
Subject: Re: [PATCH v7 31/36] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for
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
X-purgate-ID: tlsNG-ebf023/1785886699-C0CDFB50-B313748F/0/0
X-purgate-type: clean
X-purgate-size: 1065

On Sat, Aug 01, 2026, David Woodhouse wrote:
> On Fri, 2026-07-31 at 16:24 -0700, Sean Christopherson wrote:
> >=20
> > > +	/*
> > > +	 * Allow for a discrepancy of 1 kHz either way between the TSC
> > > +	 * frequency used to generate the user's pvclock and the current
> > > +	 * host's measured frequency, since they may not precisely match.
> > > +	 */
> > > +	if (user_tsc_hz < curr_tsc_hz - 1000 ||
> > > +	=C2=A0=C2=A0=C2=A0 user_tsc_hz > curr_tsc_hz + 1000) {
> >=20
> > I don't follow, why is KVM restricting what frequency userspace can set=
?
>=20
> Userspace actually sets the frequency with KVM_SET_TSC_KHZ. What KVM is
> insisting upon here is that the input to KVM_SET_CLOCK_GUEST is
> *consistent* with the guest's TSC frequency (within a little slop
> caused by different host TSCs).

Why does KVM care though?  I know some people hate that KVM's uAPI is permi=
ssive
to a fault, but trying to "help" userspace often ends badly for everyone.  =
E.g.
what happens if userspace does KVM_SET_TSC_KHZ after KVM_SET_CLOCK_GUEST?

