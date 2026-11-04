Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1C606A31B
	for <xen-devel@archiver.kernel.org>; Wed,  4 Nov 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FJ+MwjLy
Received: from list by lists.xenproject.org with outflank-mailman.1471630.1679885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYG1-0002oq-PN; Wed, 04 Nov 2026 10:30:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1471630.1679885; Wed, 04 Nov 2026 10:30:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOYG1-0002oj-MQ; Wed, 04 Nov 2026 10:30:17 +0000
Received: by outflank-mailman (input) for mailman id 1471630;
 Wed, 04 Nov 2026 10:30:16 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xOYG0-0002od-56
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 10:30:16 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOYFz-00AECs-Ao
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2026 11:30:15 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6aeb092e-2eae-0a2a0a5409dd-0a2a4509b406-42
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:30:15 +0100
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6aeb0935-be1a-0a2a45090019-aa0a817c72dd-3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Nov 2026 11:30:14 +0100
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-269-2XW9K-evPbCMOJuVoGm3kw-1; Wed,
 04 Nov 2026 05:30:10 -0500
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0BEC5180054D; Wed,  4 Nov 2026 10:30:08 +0000 (UTC)
Received: from redhat.com (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AD6AA431; Wed,  4 Nov 2026 10:30:03 +0000 (UTC)
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
	s=mimecast20190719; t=1793788213;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7JQbULKv+WOJqpIOxNfeiT2Ln28699D6hmY8bZfJb0=;
	b=FJ+MwjLynnOaPi6AczQm5O3SmagQszaBduy5ZdCjSAnh+jQATSDrMGDdqIa/IrbaKCrrZf
	p0WSFIXsGF29hJ0T7+iTgz9V/ScuLrA0xDRJd4WQSU5nS4wV2TyNurB9xLyl6Rt9RyI/MA
	vP4TGY7tBhwmERPdzHfOZPxVCJFzxj4=
X-MC-Unique: 2XW9K-evPbCMOJuVoGm3kw-1
X-Mimecast-MFC-AGG-ID: 2XW9K-evPbCMOJuVoGm3kw_1793788208
Date: Wed, 4 Nov 2026 10:30:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Helge Deller <deller@gmx.de>, xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony@xenproject.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PULL 00/25] Tracing patches
Message-ID: <ausJKNfBbqXtPDe9@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20261102185831.1880189-1-stefanha@redhat.com>
 <102e313c-1193-44b1-9908-a03c01a85e8d@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <102e313c-1193-44b1-9908-a03c01a85e8d@linaro.org>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: aWEK6UUaqWW2Nj2Gh1sO7Vtox97P8USKgCEZKDa0yco_1793788208
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793788214-BC8C9034-0752CF6D/35/111497
X-purgate-type: clean
X-purgate-size: 1831
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 10:59:43AM -0800, Richard Henderson wrote:
> On 11/2/26 10:58, Stefan Hajnoczi wrote:
> > The following changes since commit 56afd82bd4db9688f1c1c9d0e2ea163b8cde3283:
> > 
> >    Merge tag 'qemu-sparc-20261101' ofhttps://github.com/mcayland/qemu into staging (2026-11-01 08:37:48 -0800)
> > 
> > are available in the Git repository at:
> > 
> >    https://gitlab.com/stefanha/qemu.git tags/tracing-pull-request
> > 
> > for you to fetch changes up to 3b68720390b98f21e26ffcff8874851b7b49b7b7:
> > 
> >    trace: remove 'trace_event_get_state' wrapper (2026-11-02 13:52:14 -0500)
> > 
> > ----------------------------------------------------------------
> > Pull request
> > 
> > Daniel Berrangé's 'disable' property removal and associated cleanups.
> 
> Function signature change in here somewhere that didn't get propagated to
> rust?
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/17710633655#L4275
> 
> > error[E0308]: mismatched types
> >    --> /builds/qemu-project/qemu/build/trace/trace-hw_char.rs:236:14
> >     |
> > 236 |       unsafe { (bindings::qemu_loglevel & bindings::LOG_TRACE) != 0 &&
> >     |  ______________^
> > 237 | |              trace_event_state_is_enabled(_TRACE_PARALLEL_IOPORT_READ_DSTATE) } ||
> >     | |_____________________________________________________________________________^ expected `()`, found `bool`
> >     |
> 
> etc.

Bug in the "trace: include qemu_loglevel_mask(LOG_TRACE) in guard" patch

Guess I must have not had --enable-rust set after I changed that code.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


