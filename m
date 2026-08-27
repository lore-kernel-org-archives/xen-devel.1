Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2694C61DC2
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2026 13:49:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1400655.1636215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzaTe-0006fj-JT; Thu, 27 Aug 2026 13:49:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1400655.1636215; Thu, 27 Aug 2026 13:49:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzaTe-0006fc-Gh; Thu, 27 Aug 2026 13:49:10 +0000
Received: by outflank-mailman (input) for mailman id 1400655;
 Thu, 27 Aug 2026 13:49:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <gwd@xenproject.org>) id 1wzaTd-0006fW-Sg
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 13:49:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wzaTd-008MzX-2b
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 13:49:09 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <gwd@xenproject.org>) id 1wzaTd-00BHYJ-1U
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2026 13:49:09 +0000
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5b5e18f0439so434889e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2026 06:49:09 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:Content-Type:Cc
	:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
	bh=LLe9bL3tsHJGzzgHCRj31tZ7b1+COS93qx+rWxkgyfI=; b=N1hBI4cRYGU4+HV9pYuiOcWAux
	u1o9ATUqzvPMR+L4pv9Dvhl0YukhDLzhk8bGxibDiq2S0+nzSoFue7mOwjZe2hYnBLYCQ98y5tx67
	7LDDmgIHLsG/qTvetELwc9OPh3x5lUJzyIurEErHd9r3UlPDqsZipgiW0+Zs1ja066Y0=;
X-Gm-Message-State: AFuF++ldKmmdM3aIUeH1TXHRp8JEpzZfk4FjGav7DYta1w0VoYNkAYia
	ysR+7y4n3ZVT/Tn83G49Memo2ITDf465Zds4CNciwXDiltYDCdp35BGfTOW+bHhOMIKfeE0zgyp
	TykwvcKMKqMTle+PQbkjScsRI4lqw4cQ=
X-Received: by 2002:a05:6512:63d7:20b0:5b1:5b11:8eab with SMTP id
 2adb3069b0e04-5b4a90a106cmr3882835e87.15.1787838548046; Thu, 27 Aug 2026
 06:49:08 -0700 (PDT)
MIME-Version: 1.0
References: <b9c89c9f-20e1-441c-bf77-7da42eafdae3@suse.com>
In-Reply-To: <b9c89c9f-20e1-441c-bf77-7da42eafdae3@suse.com>
From: George Dunlap <gwd@xenproject.org>
Date: Thu, 27 Aug 2026 14:48:54 +0100
X-Gmail-Original-Message-ID: <CAFLBxZb=n9T1MhgQyOZOns=3Ns6MzyTN08s2ruBo4oDQXypmUw@mail.gmail.com>
X-Gm-Features: AcwNN1VnyUkC_2eHLUJCr92YQE45rh2eut-_WuAJceVeCAYB6__TvzcJ8eqt3Fw
Message-ID: <CAFLBxZb=n9T1MhgQyOZOns=3Ns6MzyTN08s2ruBo4oDQXypmUw@mail.gmail.com>
Subject: Re: [PATCH] x86: always park offline CPUs
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
	Teddy Astie <teddy.astie@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 1:36=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> While on AMD (or Hygon) CPUs the situation isn't as bad wrt broadcasting
> of #MC, some "multicast" can still happen. Therefore the reasoning to par=
k
> CPUs rather than fully offlining them applies everywhere.
>
> Don't retain the dependency on the "mce=3D" cmdline option either: That
> option may best be dropped as well, as not enabling MCE will result in a
> shutdown when #MC would otherwise be raised.
>
> Drop the global variable, using a #define (just like common code does)
> instead. Outside of common code, simplify expressions / code accordingly.
> (In common code we still have to cater for x86 wanting it different from
> everyone else.)
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> As it was never actually used after its introduction, we may want to
> further consider dropping CPU_REMOVE again.
>
> I was almost certain that we would have at least one place (presumably a
> CPU notifier handler) were we assumed no parking for AMD/Hygon. Yet I
> couldn't find anything; did I overlook the crucial bits?

FWIW, the per-CPU stack mapping bit of the ASI series I have would
almost certainly have tripped over such an instance if it existed, but
didn't.

I've tested this patch on an Intel box, whose behavior in theory
shouldn't change.  Not sure if that warrants a Tested-by, given that
the main change should happen on an AMD box.

 -George

