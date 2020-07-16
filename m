Return-Path: <SRS0=APZ7=A3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2983AC433E4
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 10:14:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF9B72074B
	for <xen-devel@archiver.kernel.org>; Thu, 16 Jul 2020 10:14:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="JdKDr9BS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF9B72074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jw0uC-00050A-Mj; Thu, 16 Jul 2020 10:14:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oOKz=A3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jw0uA-000504-Gt
 for xen-devel@lists.xenproject.org; Thu, 16 Jul 2020 10:14:18 +0000
X-Inumbo-ID: 1aecbca4-c74d-11ea-8496-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aecbca4-c74d-11ea-8496-bc764e2007e4;
 Thu, 16 Jul 2020 10:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594894457;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G8y/Werdp1fC4yWK8mnbUpnENPeqZCERXosdcj65L2Q=;
 b=JdKDr9BSt+922rwuY96JH2IdA4whLBNxpNRgqs9sZaDpjckMQY1XOwhU
 RMGlM032KYyUm/YKwxhbDKqhwrZczq+kVeNe4EVmrxLy3/AK4lcl5aAzY
 +Zeakzx6ypWZ+weLbip4mDxnWgpJtajxXno/pEhrlvqNEA17vjGc/oeVz 4=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: cHUKvwbhjDaAptNNP9/325Js1K18w6caGyK74KVjdm+uT/0y6xo817C1iL2InG2RnfRvc+wG4F
 sp2o+W7JrkGVXK/1eb2gFeGnxfsyZqhzy1sxo1dDG603v/CkEc6bMuLGSii+wVsybPy5DVJPPa
 /CLllbFOmox41UoMJyFCJT4ZoZ2hJZtEi6Y3kZODZSBYvE+v3XJ7jHsyK0Aj2fbnrn5TSYmQSk
 bZEN6KqQZrRwnSEULuX/0ULTCX3OXjuQLAgcwzOVNyOx0PX3pH4zya8aqlrIH9f8ZyoFbEj6jf
 C7Q=
X-SBRS: 2.7
X-MesageID: 23359823
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,358,1589256000"; d="scan'208";a="23359823"
Date: Thu, 16 Jul 2020 12:14:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] VT-d: install sync_cache hook on demand
Message-ID: <20200716101409.GK7191@Air-de-Roger>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
 <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 15, 2020 at 12:03:57PM +0200, Jan Beulich wrote:
> Instead of checking inside the hook whether any non-coherent IOMMUs are
> present, simply install the hook only when this is the case.
> 
> To prove that there are no other references to the now dynamically
> updated ops structure (and hence that its updating happens early
> enough), make it static and rename it at the same time.
> 
> Note that this change implies that sync_cache() shouldn't be called
> directly unless there are unusual circumstances, like is the case in
> alloc_pgtable_maddr(), which gets invoked too early for iommu_ops to
> be set already (and therefore we also need to be careful there to
> avoid accessing vtd_ops later on, as it lives in .init).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I think this is slightly better than what we currently have:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I would however prefer if we also added a check to assert that
alloc_pgtable_maddr is never called before iommu_alloc. We could maybe
poison the .sync_cache field, and then either set to NULL or to
sync_cache in iommu_alloc?

Maybe I'm just overly paranoid with this.

Thanks.

