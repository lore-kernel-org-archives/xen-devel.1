Return-Path: <SRS0=7Zzv=TJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7879FC04AB1
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 17:00:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D9C20656
	for <xen-devel@archiver.kernel.org>; Thu,  9 May 2019 17:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D9C20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOmP3-00078p-6f; Thu, 09 May 2019 17:00:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=47gT=TJ=citrix.com=prvs=025ab97d4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hOmP1-00078e-Es
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 17:00:15 +0000
X-Inumbo-ID: ea20fa0b-727b-11e9-8980-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ea20fa0b-727b-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 17:00:14 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,450,1549929600"; d="scan'208";a="85284975"
Date: Thu, 9 May 2019 18:00:12 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190509170012.GN2798@zion.uk.xensource.com>
References: <5CD42DCB020000780022D317@prv1-mh.provo.novell.com>
 <5CD42EB9020000780022D332@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD42EB9020000780022D332@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/mm: make
 guest_physmap_add_entry() HVM-only
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190509170012.klBpJ2MvXI9g8VZcDcd6neP2GGVQn4aSV4uoYQvbtl8@z>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDc6NDQ6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gTGlmdCBpdHMgIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZSgpIHBhcnQgaW50byBndWVzdF9w
aHlzbWFwX2FkZF9wYWdlKCkKPiAod2hpY2ggaXMgd2hhdCBjb21tb24gY29kZSBjYWxscyksIGVs
aW1pbmF0aW5nIHRoZSBkdW1teSB1c2Ugb2YgYQo+IChIVk0tb25seSByZWFsbHkpIFAyTSB0eXBl
IGluIHRoZSBQViBjYXNlLgo+IAo+IFN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29t
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
