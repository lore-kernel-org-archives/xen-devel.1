Return-Path: <SRS0=aFvL=OS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE69C433F5
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 06:26:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96EE2611BD
	for <xen-devel@archiver.kernel.org>; Tue, 28 Sep 2021 06:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 96EE2611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.197565.350686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6Z9-00037P-Ib; Tue, 28 Sep 2021 06:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197565.350686; Tue, 28 Sep 2021 06:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV6Z9-00037I-FK; Tue, 28 Sep 2021 06:26:11 +0000
Received: by outflank-mailman (input) for mailman id 197565;
 Tue, 28 Sep 2021 06:26:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV6Z8-00037C-Af
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 06:26:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f7466d2c-2024-11ec-bc6b-12813bfff9fa;
 Tue, 28 Sep 2021 06:26:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FBF661159;
 Tue, 28 Sep 2021 06:26:07 +0000 (UTC)
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
X-Inumbo-ID: f7466d2c-2024-11ec-bc6b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632810367;
	bh=hICJfTW5J5FttlptTDqGDMRdNurcagj721E0LCeA6/s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=K0izqKJML/d2ULbpUef8tfKchkBHhKRaTUYFM7pzpy6qGvta+ugrRnB10rtF3j04h
	 Dvr7OmQLV/xw3F7ZTQmA+LnnDcojIgwkUfSEOZq087XGbpNeAYVx/he0Dlww8DpHqB
	 Hy6QYnCYNpeoxDBox6elRysTeIXR282+LTOxLQwHUHKa0fu1FtKeiLpBODnjYYSfn3
	 cOyQINBIXrzZ+JUD/vjVSTDy6mV3mp62L0ze/itUtt0gGW6vVKvMqXgfYFemxF7/BT
	 zx95GpDF/EuXCmwcnFWe34FMeO6o0y1dslE15zSlkIRdcYLeWehfcSzkMN5D4Ev7ZM
	 PTeaHwrMisn1A==
Date: Mon, 27 Sep 2021 23:26:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christopher Clark <christopher.w.clark@gmail.com>
cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
    =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
    Artem Mygaiev <Artem_Mygaiev@epam.com>, 
    Oleksandr Tyshchenko <olekstysh@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>, 
    Wei Liu <wl@xen.org>, Stefan Hajnoczi <stefanha@gmail.com>, 
    Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Arnd Bergmann <arnd.bergmann@linaro.org>, 
    David Woodhouse <dwmw2@infradead.org>, 
    Stratos Mailing List <stratos-dev@op-lists.linaro.org>, 
    Rich Persaud <persaur@gmail.com>, 
    Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
    openxt <openxt@googlegroups.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project
 Stratos
In-Reply-To: <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl> <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1811458571-1632810367=:5022"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1811458571-1632810367=:5022
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 27 Sep 2021, Christopher Clark wrote:
> On Mon, Sep 27, 2021 at 3:06 AM Alex Bennée via Stratos-dev <stratos-dev@op-lists.linaro.org> wrote:
> 
>       Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com> writes:
> 
>       > [[PGP Signed Part:Undecided]]
>       > On Fri, Sep 24, 2021 at 05:02:46PM +0100, Alex Bennée wrote:
>       >> Hi,
>       >
>       > Hi,
>       >
>       >> 2.1 Stable ABI for foreignmemory mapping to non-dom0 ([STR-57])
>       >> ───────────────────────────────────────────────────────────────
>       >>
>       >>   Currently the foreign memory mapping support only works for dom0 due
>       >>   to reference counting issues. If we are to support backends running in
>       >>   their own domains this will need to get fixed.
>       >>
>       >>   Estimate: 8w
>       >>
>       >>
>       >> [STR-57] <https://linaro.atlassian.net/browse/STR-57>
>       >
>       > I'm pretty sure it was discussed before, but I can't find relevant
>       > (part of) thread right now: does your model assumes the backend (running
>       > outside of dom0) will gain ability to map (or access in other way)
>       > _arbitrary_ memory page of a frontend domain? Or worse: any domain?
> 
>       The aim is for some DomU's to host backends for other DomU's instead of
>       all backends being in Dom0. Those backend DomU's would have to be
>       considered trusted because as you say the default memory model of VirtIO
>       is to have full access to the frontend domains memory map.
> 
> 
> I share Marek's concern. I believe that there are Xen-based systems that will want to run guests using VirtIO devices without extending
> this level of trust to the backend domains.

From a safety perspective, it would be challenging to deploy a system
with privileged backends. From a safety perspective, it would be a lot
easier if the backend were unprivileged.

This is one of those times where safety and security requirements are
actually aligned.
--8323329-1811458571-1632810367=:5022--

