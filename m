Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FA9C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:30:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FFA92084D
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FFA92084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEWxv-0003Xq-3B; Thu, 11 Apr 2019 10:29:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pqov=SN=citrix.com=prvs=997e04109=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hEWxt-0003Xl-2x
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:29:53 +0000
X-Inumbo-ID: bccddd71-5c44-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bccddd71-5c44-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:29:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83316058"
Date: Thu, 11 Apr 2019 11:28:43 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Message-ID: <20190411102843.GE30543@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411102843.GmWVD32KXuzUZDxANjLPHfFQrC6N0okWcYyTHzjve1E@z>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDQ6MDk6NDJQTSArMDgwMCwgS2V2aW4gQnVja2xleSB3
cm90ZToKPiBGaXJzdGx5LCB3YW50IHRvIHNheSBob3cgaGFwcHkgSSB3YXMgdG8gc2VlIHRoZSBy
ZWxpYW5jZSBvbiBQeXRob24yIGdvLAo+IG5vdCBsZWFzdCwgYXMgYSBMaW51eCBGcm9tIFNjcmF0
Y2ggYnVpbGRlciwgd2hlcmUgUHl0aG9uMyBpcyBub3cgcGFydAo+IG9mIHRoZSAiY29yZSBPUyIs
IG9uZSBkb2Vzbid0IGhhdmUgdG8gYWxzbyBpbnN0YWxsIFB5dGhvbjIsIGhvd2V2ZXIsCj4gCj4g
SSBncmFiYmVkIHlvdXIgbWFzdGVyIGJyYW5jaCBsYXN0IG5pZ2h0IChjYjcwYTI2KSB0byB0cnkg
dGhpbmdzIG91dCBhbmQKPiBzdGlsbCBmZWxsIGZvdWwgb2YgYSAibmVlZCB0byBkZWZpbmUgUFlU
SE9OIiBhdCB0aGUgdG9vbHMvY29uZmlndXJlIHN0YWdlLgo+IAo+IE15IGlzc3VlIGlzIHJlc3Vs
dGluZyBmcm9tIHRoZSBmYWN0IHRoYXQgUHl0aG9uMyBoYXMgb25seSBiZWVuIGluc3RhbGxlZCBh
cwo+ICJweXRob24zIiwgd2hlcmVhcyB0aGUgY29uZmlndXJlIHNjcmlwdCBpbiB0aGUgdG9vbHMg
ZGlyZWN0b3J5IGFwcGVhcnMgdG8KPiBiZSBsb29raW5nIGZvciBhIGJhcmUgInB5dGhvbiIuCgpJ
bnRlcmVzdGluZy4KCkxvb2tpbmcgb25seSBmb3IgcHl0aG9uIHdhcyBjZXJ0YWlubHkgdGhlIGlu
dGVudCBiZWNhdXNlIEkgZXhwZWN0ZWQgYWxsCmRpc3Ryb3MgaGF2ZSBpdCBwb2ludGVkIHRvIGVp
dGhlciBweXRob24yIG9yIHB5dGhvbjMuCgpCdXQgaXQgYXBwZWFycyB0aGF0IExGUyBkb2Vzbid0
IGRvIHRoYXQuCgo+IAo+IE5vdywgdGhlIHJlbGV2YW50IHRleHQgaW4gdGhlIG9sZCBSRUFETUUg
dXNlZCB0byBzYXkKPiAKPiAtLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0t
LS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tCj4gTm90ZSB0aGF0IHRoZSBidWls
ZCBzeXN0ZW0gZXhwZWN0cyBgcHl0aG9uYCB0byBiZSBweXRob24yLiAgSWYgeW91ciBzeXN0ZW0K
PiBoYXMgYHB5dGhvbmAgcG9pbnRpbmcgdG8gcHl0aG9uMyAoYXMgaW4gdGhlIGNhc2Ugb2YgQXJj
aCBMaW51eCBvciBBbmFjb25kYSksCj4geW91J2xsIG5lZWQgdG8gc3BlY2lmeSBhIHBhdGggdG8g
YSBweXRob24yIGJpbmFyeSB3aGVuIHJ1bm5pbmcgY29uZmlndXJlOgo+IAo+ICAgICAgUFlUSE9O
PS91c3IvYmluL3B5dGhvbjIgLi9jb25maWd1cmUKPiAtLTg8LS0tLS0tLS04PC0tLS0tLS0tODwt
LS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tCj4gCj4g
Cj4gYnV0IGl0IHN0cmlrZXMgbWUgdGhhdCBzb21lIHN5c3RlbXMgbWF5IG9ubHkgaGF2ZSBhbiBl
eHBsaWNpdGx5IG5hbWVkCj4gcHl0aG9uMywgaW4gd2hpY2ggY2FzZSwgaXQgbWlnaHQgaGF2ZSBi
ZWVuIGJldHRlciB0byBub3QgaGF2ZSBjb21wbGV0ZWx5Cj4gcmVtb3ZlZCB0aGUgImhvdyB0byBk
ZWZpbmUgeW91ciBsb2NhbCBQWVRIT04iIHBhcmFncmFwaCwgYnV0IHRvIGhhdmUKPiByZS13b3Jk
ZWQgaXQgdG8gbm90ZSB0aGF0IGlmIG9ubHkgaGF2ZSBweXRob24zIChvciBwZXJoYXBzIGRvbid0
IGhhdmUgYQo+IGJhcmUgcHl0aGluKSB0aGVuIHlvdSdsbCBuZWVkIHRvIGV4cGxpY2l0bHkgZGVm
aW5lIGl0IGF0IHRoZSBjb25maWd1cmUgc3RhZ2UKPiBhbmQgdG8gc2hvdyBob3cgaXQncyBkb25l
LgoKU3VyZS4gSSB3aWxsIHdyaXRlIGEgcGF0Y2guCgpXZWkuCgo+IAo+IEhvcGluZyB0aGF0J3Mg
dXNlZnVsLAo+IEtldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
