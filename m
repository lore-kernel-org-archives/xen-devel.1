Return-Path: <SRS0=v/14=JE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51689C433B4
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 15:00:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9E96113D
	for <xen-devel@archiver.kernel.org>; Wed,  7 Apr 2021 15:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E9E96113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.106745.204094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9ex-0002cs-O6; Wed, 07 Apr 2021 14:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106745.204094; Wed, 07 Apr 2021 14:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9ex-0002cl-Kf; Wed, 07 Apr 2021 14:59:59 +0000
Received: by outflank-mailman (input) for mailman id 106745;
 Wed, 07 Apr 2021 14:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU9ew-0002cg-PV
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 14:59:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10bbff3d-b3bb-4f63-a4f3-2e788eee0f2c;
 Wed, 07 Apr 2021 14:59:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 254A5B03D;
 Wed,  7 Apr 2021 14:59:57 +0000 (UTC)
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
X-Inumbo-ID: 10bbff3d-b3bb-4f63-a4f3-2e788eee0f2c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617807597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hFjbxnTPGwRNZoBNKz1nnOU5P9FQ4glztgCAmAlvJW4=;
	b=f2/Q72ibyhBvta9cHeJG4WEMuLWNflLfSwE5s611j410LxMSi0GTtukdL7lzogHxWZrlQE
	rHIO+eRMD7l8QPwzlB2OjqbKy0BYHEKOoY1GIYgBxHg/uQAYebyYX4FQJAaVqxwdqwwmmg
	JrAnGELSQ0z490ZdslIJsGe6SEDh5Nw=
Subject: Re: [PATCH v3 04/11] x86/vmsi: use the newly introduced EOI callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5e42180d-378d-82ac-acd8-c4a56b8c0829@suse.com>
Date: Wed, 7 Apr 2021 16:59:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> and instead use the newly introduced EOI callback mechanism in order
> to register a callback for MSI vectors injected from passed through
> devices.
> 
> This avoids having multiple callback functions open-coded in
> vlapic_handle_EOI, as there is now a generic framework for registering
> such callbacks. It also avoids doing an unconditional call to
> hvm_dpci_msi_eoi for each EOI processed by the local APIC.
> 
> Note that now the callback is only registered (and thus executed) when
> there's an MSI interrupt originating from a PCI passthrough device
> being injected into the guest, so the check in hvm_dpci_msi_eoi can be
> removed as it's already done by hvm_dirq_assist which is the only
> caller of vmsi_deliver_pirq.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

