Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3016EC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03BC820857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03BC820857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpm6-0008Eq-RQ; Tue, 09 Apr 2019 12:22:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=piA2=SL=citrix.com=prvs=9957968d6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hDpm5-0008EF-Gj
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:22:49 +0000
X-Inumbo-ID: 2f517f97-5ac2-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f517f97-5ac2-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 12:22:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,329,1549929600"; d="scan'208";a="83100291"
Date: Tue, 9 Apr 2019 13:22:35 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190409122235.GP1986@zion.uk.xensource.com>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-8-wei.liu2@citrix.com>
 <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5C8BC777020000780021F5EF@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH RFC 07/55] x86/mm: add an end_of_loop label
 in map_pages_to_xen
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122235.kKyyxV13r3KHp70TDMuxZociyJXSZ8nnpPxFLDGhi5s@z>

T24gRnJpLCBNYXIgMTUsIDIwMTkgYXQgMDk6NDA6MzlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA3LjAyLjE5IGF0IDE3OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBXZSB3aWxsIHNvb24gbmVlZCB0byBjbGVhbiB1cCBtYXBwaW5ncyB3aGVuZXZlciB0
aGUgb3V0IG1vc3QgbG9vcCBpcwo+ID4gZW5kZWQuIEFkZCBhIG5ldyBsYWJlbCBhbmQgdHVybiBy
ZWxldmFudCBjb250aW51ZSdzIGludG8gZ290bydzLgo+IAo+IFRvIGJlIGhvbmVzdCwgSSB3YXMg
b24gdGhlIGVkZ2Ugb2YgYWxyZWFkeSBzdWdnZXN0aW5nIGxlc3MgdXNlCj4gb2YgZ290byBpbiB0
aGUgcHJldmlvdXMgcGF0Y2guIFRoaXMgb25lIGRlZmluaXRlbHkgZ29lcyB0b28gZmFyCj4gZm9y
IG15IHRhc3RlIC0gSSBjYW4gc29tZWhvdyBsaXZlIHdpdGggZ290by1zIHVzZWQgZm9yIGVycm9y
Cj4gaGFuZGxpbmcsIGJ1dCBwbGVhc2Ugbm90IG11Y2ggbW9yZS4gSXMgdGhlcmUgcmVhbGx5IG5v
IGJldHRlcgo+IHdheT8KPiAKCkl0IG1heSBiZSBwb3NzaWJsZSB0byBjYWxsIFVOTUFQIGF0IHRo
ZSBiZWdpbm5pbmcgb2YgdGhlIGxvb3AgaW5zdGVhZC4KSG93IGRvZXMgdGhhdCBzb3VuZCB0byB5
b3U/CgpXZWkuCgo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
