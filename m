Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917F8606A69A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2026 21:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A74/b4a/
Received: from list by lists.xenproject.org with outflank-mailman.1498525.1696217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWZZ-00055d-6B; Fri, 20 Nov 2026 21:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1498525.1696217; Fri, 20 Nov 2026 21:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xUWZZ-00055W-3c; Fri, 20 Nov 2026 21:55:09 +0000
Received: by outflank-mailman (input) for mailman id 1498525;
 Fri, 20 Nov 2026 21:55:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <sstabellini@kernel.org>) id 1xUWZX-00055Q-SY
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 21:55:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xUWZX-006jtO-1y
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2026 22:55:07 +0100
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6b00c1a9-8faa-0a2a0a5109dd-0a2a4503b450-10
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 22:55:07 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <sstabellini@kernel.org>)
 id 6b00c1b9-fae8-0a2a45030019-ac6904fe9d36-3
 for <xen-devel@lists.xenproject.org>; Fri, 20 Nov 2026 22:55:06 +0100
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 5E43D6012A;
 Fri, 20 Nov 2026 21:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011261F000C0;
 Fri, 20 Nov 2026 21:55:03 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20260515 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:cc:Subject:In-Reply-To:References"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795211704;
	bh=4AeoZ9g50jflCKfU8EDvkziKo2uzVLkClLVLIxm1kmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=A74/b4a/VUdu1PHb6q8T/RC87vvd/vqWQ26oHpMNrhfAbtLK33JN+z3XHOp+IRg91
	 fEEUlnIZq7jKFSDf+Ul2rMErKNa2aWmRbcRfVaUmGHdnGEC9f7DIXQOIIKQGWIrwBn
	 SbYeNPMLRg41xs/b5wboG2LY2xzwclYEG00OBYxcqUNYQ1fP8vcNtr10ZbDLfHiN8x
	 aTZPBNhpuPOCSUDO7XvWmfEhiz3AOCMqmLIUCFvaAjGoVI7/VXLeVqLhtrsTGwBTEB
	 0PbsnH9CtycFTFHoDC1VrXQdnIJ/725drC+Y3718eh+xRpmekz9qG/1u86WL6dHbvv
	 fJHOFox6N6eNg==
Date: Fri, 20 Nov 2026 13:55:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <stefano.stabellini@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>, 
    Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] x86/vlapic: size the all-ones broadcast by the
 sender's mode
In-Reply-To: <6c0f9314-05ea-413d-89d2-5e63d0182065@suse.com>
Message-ID: <63acd724-1eb6-e1da-a986-c8fdaf3e955b@kernel.org>
References: <20261119220003.38517-1-stefano.stabellini@amd.com> <6c0f9314-05ea-413d-89d2-5e63d0182065@suse.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-purgate-ID: tlsNG-33051d/1795211707-76AF94E9-81C86457/0/0
X-purgate-type: clean
X-purgate-size: 1608
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 20 Nov 2026, Jan Beulich wrote:
> On 19.11.2026 23:00, Stefano Stabellini wrote:
> > vlapic_match_dest() detects a broadcast by comparing the destination
> > with all ones in the target's mode, but an IPI's destination has the
> > width of the sender's mode.
> > 
> > Use the sender's mode when there is one, as is_multicast_dest() does:
> > whether a destination is a broadcast is decided by the sender. vIO-APIC
> > and MSI destinations have no sender and are still compared in the
> > target's mode.
> 
> But that isn't right: Those simply cannot express wide target IDs. Aiui
> 0xff is uniformly "broadcast" there. (Or alternatively 0xff cannot
> validly be used in x2APIC mode, or even at all. I fear different sources
> say different things as to the validity of this.)
> 
> The situation is perhaps yet more fuzzy there with the 15-bit ID extension,
> for which patches are floating around. All we've got in the tree so far is
> XEN_HVM_CPUID_EXT_DEST_ID afaics.
> 
> Overall with no sender it may be best to simply skip the broadcast check.

Is this what you are thinking?

if ( source && dest == _VLAPIC_ID(source, 0xffffffffU) )
    return true;

Note that this also drops the physical 0xff broadcast from IO-APIC/MSI
to xAPIC-mode vLAPICs.

If 0xff is uniformly a broadcast for IO-APIC/MSI, the alternative is to
accept a physical 0xff from them for every vLAPIC, independent of the
target's mode:

case APIC_DEST_NOSHORT:
    if ( source ? dest == _VLAPIC_ID(source, 0xffffffffU)
                : !dest_mode && dest == 0xff )
        return true;


