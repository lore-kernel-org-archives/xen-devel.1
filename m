Return-Path: <SRS0=9gwS=BD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D69C433E4
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 18:39:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8840E2065E
	for <xen-devel@archiver.kernel.org>; Fri, 24 Jul 2020 18:39:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="fAy6Btvp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8840E2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz2ao-0005ov-DD; Fri, 24 Jul 2020 18:38:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tno1=BD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jz2an-0005oq-5e
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 18:38:49 +0000
X-Inumbo-ID: e9326844-cddc-11ea-a45b-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9326844-cddc-11ea-a45b-12813bfff9fa;
 Fri, 24 Jul 2020 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595615929;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dWbvvceeGY6NXTorz9bY+257l+AXrmrOXmHvAQHxPp4=;
 b=fAy6BtvpIN6Ya4jJ0GCsvAXtxRPrzjfoovrZN+ef3lMXHWoXgQ7ku2ao
 Xo5CDq2L8ExOFc/FGVhEZFO9KxNh2XNfoLd9O8ClI8aUcBFKdtf/V8vZT
 IfszN9S9arPAEHJWUW2EjO3VkPAnoL8zUySbLgWIH6Pyv/leV0SYEgGi1 k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 469q0NSn0Eu98I/dW2JBXyLmvtMHRolRQzuWQZhbHzrB9Q8xLtF2kQ3iR0tSdf+Prhz4iGonyX
 VIIxOnt604Heggj9CKOH4NF08eCv+Jh2htHVgWGX3LPLHKIOkA7JJBg4mDzCDu1OTC2OnqdVUc
 WNdoRgXKVZjKoG/icQzHm1X0Q2iHxRKM+K9fZFU4aZWY7Adk9rs8ocVhzcFlhJJUgM26bEZumV
 op2zehAkJnLkSIBfB/G4+cMOCoT3YjMAJMV86/20p1eJcecfJ80mUXXaHhE9Yi7ungKmWX/Nmy
 jkQ=
X-SBRS: 2.7
X-MesageID: 23148207
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,391,1589256000"; d="scan'208";a="23148207"
Subject: Re: [PATCH 3/6] iommu: remove iommu_lookup_page() and the
 lookup_page() method...
To: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-4-paul@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c47710e1-fcb6-3b5d-ff6a-d237a4149b3b@citrix.com>
Date: Fri, 24 Jul 2020 19:38:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200724164619.1245-4-paul@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: Paul Durrant <pdurrant@amazon.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24/07/2020 17:46, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
>
> ... from iommu_ops.
>
> This patch is essentially a reversion of dd93d54f "vtd: add lookup_page method
> to iommu_ops". The code was intended to be used by a patch that has long-
> since been abandoned. Therefore it is dead code and can be removed.

And by this, you mean the work that you only partial unstreamed, with
the remainder of the feature still very much in use by XenServer?

Please don't go breaking in-use things, simply because we're fixing
Xen's IOMMU mess once large XSA at a time...

As far as I can tell, this patch doesn't interact with any others in the
series.

~Andrew

