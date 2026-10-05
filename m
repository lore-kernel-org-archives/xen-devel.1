Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EF5CA5FCE
	for <xen-devel@archiver.kernel.org>; Mon,  5 Oct 2026 09:27:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1440641.1658040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDexx-00011Q-B5; Mon, 05 Oct 2026 09:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1440641.1658040; Mon, 05 Oct 2026 09:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDexx-00011J-7W; Mon, 05 Oct 2026 09:26:37 +0000
Received: by outflank-mailman (input) for mailman id 1440641;
 Mon, 05 Oct 2026 09:26:35 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1xDexv-00010N-T7
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 09:26:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDexv-00BvIv-9j
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2026 11:26:35 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac36d40-bab6-0a2a0a5309dd-0a2a4501c15c-36
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:26:34 +0200
Received: from [170.10.133.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <berrange@redhat.com>)
 id 6ac36d49-5984-0a2a45010019-aa0a857c7b95-3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 11:26:34 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-578-N6hTJVhvPH-NDifGdYGF_A-1; Mon,
 05 Oct 2026 05:26:29 -0400
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB15419236B0; Mon,  5 Oct 2026 09:26:27 +0000 (UTC)
Received: from redhat.com (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 631281956044; Mon,  5 Oct 2026 09:26:25 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791192393;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=cCc57hc9JUT01LxypoVVFPFOwLInLi3iRPdYV2t4GiQ=;
	b=QBnnyVp+byChjWJWxeOp6l19z1cg9t9bT46vK/1hcMz6IT5Ya8vUjjJCR+TEOKOVkNY8jH
	pR/W1NFN378x6WXjxSt/o4Mvf1jqCM1IWL+ollYuAoAoQcLx7gyxdUNSK2rMBZ7d8GodzY
	CrpDNodv3AzZp6zvrKF8tA/tBxD3wag=
X-MC-Unique: N6hTJVhvPH-NDifGdYGF_A-1
X-Mimecast-MFC-AGG-ID: N6hTJVhvPH-NDifGdYGF_A_1791192388
Date: Mon, 5 Oct 2026 10:26:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
	qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [PATCH 15/28] hw: define most common PCI types as secure
Message-ID: <asNtPslm7pT6Uj1J@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260911143627.2743803-1-berrange@redhat.com>
 <20260911143627.2743803-16-berrange@redhat.com>
 <179096166122.3025252.2345560702508398440.b4-review@b4>
MIME-Version: 1.0
In-Reply-To: <179096166122.3025252.2345560702508398440.b4-review@b4>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: Fi64AEVRSU2nhdG0qqxlmkdklR6Fo4Nj26zBC9LE-bQ_1791192388
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-purgate-ID: tlsNG-d62444/1791192394-BCB45757-B4D9F5C1/0/0
X-purgate-type: clean
X-purgate-size: 870

On Fri, Oct 02, 2026 at 09:21:01PM +0400, marcandre.lureau@redhat.com wrote:
> > Essentially all PCI infrastructure is in scope for the virtualization
> > use case, aside from the niche simba bridge.
> > 
> 
> You should exclude the CXL bits though, as stated on cover letter.

Yes.

> Also questionable perhaps: xio3130, pcie_pci, pxb

The latter two are both reasonable as long as i440fx is around,
and xio3130 is a core documented part of QEMU's PCI-Express support,
though I've never understood why one would want it over pcie-pxb.
Overall, I think all the generic PCI/PCI-E infra is in scope.

With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


