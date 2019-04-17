Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06706C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:04:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D373A205F4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 15:04:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D373A205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGm6h-0005nP-46; Wed, 17 Apr 2019 15:04:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGm6f-0005nK-ON
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 15:04:13 +0000
X-Inumbo-ID: 0ec3c30f-6122-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0ec3c30f-6122-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 15:04:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,362,1549929600"; d="scan'208";a="83804100"
Date: Wed, 17 Apr 2019 16:03:52 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Pu Wen <puwen@hygon.cn>
Message-ID: <20190417150352.GA30543@zion.uk.xensource.com>
References: <cover.1554382869.git.puwen@hygon.cn>
 <0d6839a65753c60f4fd1738560a551ca7df7b1e8.1554382869.git.puwen@hygon.cn>
 <614b4eab-065a-c911-7759-2663ab6a9657@citrix.com>
 <8f23051d-a8b5-a25b-af4a-acf045c31cd2@hygon.cn>
 <5CA708840200007800224C6E@prv1-mh.provo.novell.com>
 <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a14a1f04-eab0-dac6-7a7b-6125578cd3e5@hygon.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v5 01/15] x86/cpu: Create Hygon Dhyana
 architecture support file
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417150352.OtOI93am1H7u1IoG8JboNNJUPKgnppuC3uNmxzGC960@z>

T24gU2F0LCBBcHIgMTMsIDIwMTkgYXQgMTI6MTQ6MTRBTSArMDgwMCwgUHUgV2VuIHdyb3RlOgo+
IE9uIDIwMTkvNC81IDE1OjUwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9uIDA0LjA0LjE5IGF0
IDE4OjM5LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+ID4gPiBPbiAyMDE5LzQvNCAyMjowNywg
QW5kcmV3IENvb3BlciB3cm90ZToKPiA+ID4gPiBUaGlzIG5lZWRzIHRoZSBmb2xsb3dpbmcgaHVu
ayBmb2xkaW5nIGluCj4gPiA+ID4gd2hpY2ggY2FuIGJlIGRvbmUgb24gY29tbWl0IHRvIGF2b2lk
IHNlbmRpbmcgeWV0IGFub3RoZXIgdmVyc2lvbi4KPiA+ID4gCj4gPiA+IERvIHlvdSBtZWFuIEkg
bmVlZCB0byBzZW5kIGEgaW5kaXZpZHVhbCBwYXRjaCBmb3IgdGhpcyBmaWxlIGluc3RlYWQgb2YK
PiA+ID4gcmV3b3JraW5nIHRoZSB3aG9sZSBzZXJpZXM/Cj4gPiAKPiA+IEkgZG9uJ3QgdGhpbmsg
dGhhdCdzIG5lY2Vzc2FyeSwgdW5sZXNzIG90aGVyIHJlYXNvbnMgYXJpc2UgZm9yIHRoZXJlCj4g
PiB0byBiZSB5ZXQgYW5vdGhlciByb3VuZCBuZWNlc3NhcnkuIEFzIEFuZHJldyBzYXlzIC0gdGhp
cyBjYW4gZWFzaWx5Cj4gPiBiZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcuCj4gCj4gSGkgSmFuIGFu
ZCBBbmRyZXcsCj4gCj4gSG93IGFib3V0IHRoZSBwYXRjaGVzIHRpbGwgbm93PyBBcmUgdGhleSBh
Y2NlcHRhYmxlIHRvIGNvbW1pdD8KCkZZSSB3ZSdyZSB0cnlpbmcgdG8gc29ydCBvdXQgaXNzdWVz
IHdpdGggdXBzdHJlYW0gQ0kgc3lzdGVtLCBzbwpjb21taXR0aW5nIHRoZXNlIHBhdGNoZXMgbmVl
ZCB0byB3YWl0IGEgYml0LiBCdXQgZG9uJ3Qgd29ycnksIHRoZXkgd2lsbApldmVudHVhbGx5IGJl
IGNvbW1pdHRlZCAoYXNzdW1pbmcgYWxsIHRoZSBhY2tzIGFuZCBSYnMgYXJlIGluIHBsYWNlKS4K
CldlaS4KCj4gCj4gVGh4Lgo+IAo+IC0tIAo+IFJlZ2FyZHMsCj4gUHUgV2VuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
