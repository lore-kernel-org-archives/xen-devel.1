Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554ECED7B91
	for <xen-devel@archiver.kernel.org>; Tue, 14 Apr 2026 09:19:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1281498.1564387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZuv-00022x-QZ; Tue, 14 Apr 2026 09:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281498.1564387; Tue, 14 Apr 2026 09:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCZuv-00022q-ND; Tue, 14 Apr 2026 09:18:45 +0000
Received: by outflank-mailman (input) for mailman id 1281498;
 Tue, 14 Apr 2026 09:18:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <berrange@redhat.com>) id 1wCZuu-00022k-7h
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 09:18:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wCZus-00FhFb-Re
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 11:18:42 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <berrange@redhat.com>)
 id 69de0668-bab6-0a2a0a5309dd-0a2a4501b2c6-46
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:18:42 +0200
Received: from [170.10.129.124] (helo=us-smtp-delivery-124.mimecast.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <berrange@redhat.com>)
 id 69de0671-6fc9-0a2a45010019-aa0a817c78fb-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Apr 2026 11:18:42 +0200
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-rTsOmLJ1OXS-Dp8JHnGxGg-1; Tue,
 14 Apr 2026 05:18:37 -0400
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1B7F3195609E; Tue, 14 Apr 2026 09:18:36 +0000 (UTC)
Received: from redhat.com (headnet01.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.101])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 603AD195608E; Tue, 14 Apr 2026 09:18:34 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mimecast20190719 header.d=redhat.com header.i="@redhat.com" header.h="From:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776158321;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmtXZQeMRh+rctyuoTSEkZL1cxFBhrRFLX3Pl/Sx4gY=;
	b=iIJKCCw3AccmdxsXljI/a/zzQY6TYsW2MW0mp06h1WARreOc5wQusndsvyWqBL6Oo8cgwT
	j6xdyJC4h7dvWz66lRjS15asLExcRPalR+axXf+ezndFs2w9WVDL85G3BStP/y78NKg9nv
	b6VLxhxeiScgPoRVtKYgmzEeQ1eDziY=
X-MC-Unique: rTsOmLJ1OXS-Dp8JHnGxGg-1
X-Mimecast-MFC-AGG-ID: rTsOmLJ1OXS-Dp8JHnGxGg_1776158316
Date: Tue, 14 Apr 2026 10:18:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Thierry Escande <thierry.escande@vates.tech>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v3 2/3] libxl: Allow PCI device passthrough using
 -device Qemu command line
Message-ID: <ad4GZpUdtbf1I4hA@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20260410150333.1533568-1-thierry.escande@vates.tech>
 <20260410150333.1533568-3-thierry.escande@vates.tech>
 <ece34618-f527-455d-a6fe-c964aa1f4878@vates.tech>
MIME-Version: 1.0
In-Reply-To: <ece34618-f527-455d-a6fe-c964aa1f4878@vates.tech>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xv42_pn1bDFyYsTJpSaxrf8hxdO54BckhQ3lEAUkun8_1776158316
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1776158322-B78FC185-67B3D50F/0/0
X-purgate-type: clean
X-purgate-size: 1688

On Tue, Apr 14, 2026 at 08:59:52AM +0000, Teddy Astie wrote:
> Le 10/04/2026 à 17:06, Thierry Escande a écrit :
> > This change makes use of the new option 'hotplug' for host PCI devices
> > passthrough'd to the guest. If hotplug=0 is used in the pci device
> > configuration table, the device will be attached to the guest using the
> > Qemu command line as '-device xen-pci-passthrough,hostaddr=...'
> > 
> > The host device configuration is passed to the -device option as a json
> > array, just like it's done for hotplug using QMP. The json array is
> > created by a new internal function libxl__device_pci_get_qmp_json() that
> > is also used by pci_add_qmp_device_add().
> 
> If (in this specific case) we're not using QMP anymore, I think 
> libxl__device_pci_get_qmp_json should lose the "qmp" qualification.
> (unless QEMU also considers JSON-formatted command-line paramters as QMP)

FWIW, from the QEMU POV, 'QMP' refers to the monitor protocol,
whose specification is defined using the 'QAPI' schema language.

QEMU is increasing enabling use of JSON on the command line, by
having the CLI args parsed using 'QAPI' visitors. In these cases,
the 'QAPI' data structures are shared between the command line
and QMP in most cases.

IOW, in this case, perhaps "qapi_json" is a more accurate name
than 'qmp_json' if libxl is returning a JSON doc that represents
an object defined using QAPI.


With regards,
Daniel
-- 
|: https://berrange.com       ~~        https://hachyderm.io/@berrange :|
|: https://libvirt.org          ~~          https://entangle-photo.org :|
|: https://pixelfed.art/berrange   ~~    https://fstop138.berrange.com :|


