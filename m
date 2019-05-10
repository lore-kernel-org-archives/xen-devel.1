Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E6EC04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 14:23:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90681216C4
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 14:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90681216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP6QP-0002K3-JJ; Fri, 10 May 2019 14:23:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DGEm=TK=citrix.com=prvs=026c30d3b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hP6QO-0002Jv-Jm
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:23:00 +0000
X-Inumbo-ID: 1b47bdf2-732f-11e9-8180-abc7c5b1d448
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b47bdf2-732f-11e9-8180-abc7c5b1d448;
 Fri, 10 May 2019 14:22:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,453,1549929600"; d="scan'208";a="85324014"
Date: Fri, 10 May 2019 15:22:54 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190510142254.GX2798@zion.uk.xensource.com>
References: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CD586E3020000780022D9D1@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] x86/mm: free_page_type() is PV-only
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510142254.4bEIUL1BVgUZPfWEBymjcArXDl13rrbA71v-IS2eC0g@z>

T24gRnJpLCBNYXkgMTAsIDIwMTkgYXQgMDg6MTI6NTFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hpbGUgaXQgYWxyZWFkeSBoYXMgYSBDT05GSUdfUFYgd3JhcHBlZCBhcm91bmQgaXRz
IGVudGlyZSBib2R5LCBpdCBpcwo+IHN0aWxsIHVzZWxlc3NseSBpbnZva2luZyBtZm5fdG9fZ21m
bigpLCB3aGljaCBpcyBhYm91dCB0byBiZSByZXBsYWNlZC4KPiBBdm9pZCBtb3JwaGluZyB0aGlz
IGNvZGUgaW50byBldmVuIG1vcmUgc3VzcGljaW91cyBzaGFwZSBhbmQgcmVtb3ZlIHRoZQo+IGVm
ZmVjdGl2ZWx5IGRlYWQgY29kZSAtIHRyYW5zbGF0ZWQgbW9kZSBoYXMgYmVlbiBtYWRlIGltcG9z
c2libGUgZm9yIFBWCj4gcXVpdGUgc29tZSB0aW1lIGFnby4KPiAKPiBBZGp1c3QgYW5kIGV4dGVu
ZCB0aGUgYXNzZXJ0aW9ucyBhdCB0aGUgc2FtZSB0aW1lOiBUaGUgb3JpZ2luYWwKPiBBU1NFUlQo
IXNoYWRvd19tb2RlX3JlZmNvdW50cyhvd25lcikpIHJlYWxseSBtZWFucwo+IEFTU0VSVCghc2hh
ZG93X21vZGVfZW5hYmxlZChvd25lcikgfHwgIXBhZ2luZ19tb2RlX3JlZmNvdW50cyhvd25lcikp
LAo+IHdoaWNoIGlzbid0IHdoYXQgd2Ugd2FudCBoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
