Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236BF606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 13:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GDf5x0Gy
Received: from list by lists.xenproject.org with outflank-mailman.1465643.1676110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmPG-0005VV-CR; Fri, 30 Oct 2026 13:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465643.1676110; Fri, 30 Oct 2026 13:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMmPG-0005VO-9G; Fri, 30 Oct 2026 13:12:30 +0000
Received: by outflank-mailman (input) for mailman id 1465643;
 Fri, 30 Oct 2026 13:12:29 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xMmPF-0005VI-Bm
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 13:12:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMmPE-001n49-9U
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 14:12:28 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae4979b-bab6-0a2a0a5309dd-0a2a450aa336-30
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 14:12:27 +0100
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ae497ba-f2d2-0a2a450a0019-aa0a857c6afd-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 14:12:27 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-wLI8iMc8NRaHZo9QEuBdlw-1; Fri,
 30 Oct 2026 09:12:19 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 077D51828ADD; Fri, 30 Oct 2026 13:12:12 +0000 (UTC)
Received: from redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 905FB1956088; Fri, 30 Oct 2026 13:12:09 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793365946;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luqN36eQr9cvX7ZlJUQi6wCB1RlpaTkpx7SoAr5njao=;
	b=GDf5x0GyTVmoC2cj4ZOIsD65K6+QnAcTUiQh4azd7SuIVsAwxEVm8i3mMcvqc8y6nbK48M
	BVcbGT+K/t+zvgTLpJD329rZmHlNz++kbtveVgYam2fT+4tqx6yVgpCpqcvR8wFrP34Mtd
	dh8bD0/qcteegkcP02kLAhXE//3vOLw=
X-MC-Unique: wLI8iMc8NRaHZo9QEuBdlw-1
X-Mimecast-MFC-AGG-ID: wLI8iMc8NRaHZo9QEuBdlw_1793365938
Date: Fri, 30 Oct 2026 13:12:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 09/28] hw/net: mark e1000, e1000e, IGB, rtl8139 & sPAPR
 VLAN as secure
Message-ID: <auSXprZs_pozFfqV@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-10-berrange@redhat.com>
 <CAFEAcA8GwF=EdaqvO7OBNZY1ku8LWNH5giveZYXSVnmk9JWfng@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8GwF=EdaqvO7OBNZY1ku8LWNH5giveZYXSVnmk9JWfng@mail.gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: BZoHLA3nUl3TbRKut8vaFSTbqr-qL6RB00r5tK4yPGI_1793365938
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-4011c0/1793365947-514C7CFC-CC328990/0/0
X-purgate-type: clean
X-purgate-size: 1775
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 11:12:55AM +0000, Peter Maydell wrote:
> On Fri, 11 Sept 2026 at 15:42, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > Historically most NICs are only interesting for non-virtualization
> > use cases and have not been written with malicious guests in mind.
> >
> > As a general rule either virtio-net or xen-net should be used in
> > all virtualized guests requiring a security boundary.
> >
> > There are a handful of exceptions resulting from historical usage
> > in the x86 world, to support virtualized guests lacking virtio
> > support.
> >
> > Thus the rtl8139, e1000, e1000e & IGB NICs are declared to provide
> > a security boundary.
> 
> You've said in several bugs (e.g.
> https://gitlab.com/qemu-project/qemu/-/work_items/3872 )
> that igb wasn't covered by the virtualization use case.

Hmm, yes, I forgot I had said that, which I guess shows the value
of this series long term.

> I don't care either way, but I wanted to check since I've been
> marking igb bugs as non-confidential when triaging on the
> basis of that...

I added it in this series because I forgot what I previously said
and then found our RHEL shipped it. I've since checked that the
RHEL inclusion was only for ease of SRIOV testing, not intended for
production deployment.

So consider 'igb' dropped from this patch. We'll continue to treat
it as insecure, unless a maintainer steps up to request otherwise
and fix historical issues we've had disclosed this year.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


