Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F082CC10F12
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:57:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02642064A
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 10:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02642064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiG4-00010A-QK; Wed, 17 Apr 2019 10:57:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGiG3-000105-Jk
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 10:57:39 +0000
X-Inumbo-ID: 9cb66566-60ff-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9cb66566-60ff-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 10:57:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83778226"
Date: Wed, 17 Apr 2019 11:57:29 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190417105729.GS30543@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
 <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
 <20190417104136.GR30543@zion.uk.xensource.com>
 <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Hypervisor build can't work without `python` (Was:
 Re: Xen commit 9b0bc91b3 possibly removed too much info from README)
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
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417105729.ZBWhsmJ-v6Ukwz3K83JcY16coYccIDD6_7EBe7oA2rI@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTE6NDQ6MzZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wNC8yMDE5IDExOjQxLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2VkLCBB
cHIgMTcsIDIwMTkgYXQgMTA6NTY6NTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+Pj4gSGVy
ZSdzIHdoYXQgaSBkaWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2
Cj4gPj4+Cj4gPj4+IHRhciB4ZiAvcGF0aC90by94ZW4tY2I3MGEyNi50YXIuZ3oKPiA+Pj4KPiA+
Pj4gY2QgeGVuLW1hc3Rlci8KPiA+Pj4KPiA+Pj4gUFlUSE9OPS91c3IvYmluL3B5dGhvbjMgLi9j
b25maWd1cmUgLS1wcmVmaXg9L3VzciAgIFwKPiA+Pj4gICAgLS1kaXNhYmxlLXNlYWJpb3MgICBc
Cj4gPj4+ICAgIC0tZGlzYWJsZS1xZW11LXRyYWRpdGlvbmFsICBcCj4gPj4+ICAgIC0tZGlzYWJs
ZS1yb21iaW9zICAgICBcCj4gPj4+ICAgIC0tZGlzYWJsZS1zdHViZG9tIDI+JjEgfCB0ZWUgLi4v
Y29uZmlnLmxvZwo+ID4+Pgo+ID4+PiBtYWtlIEVGSV9ESVI9L3Vzci9saWIvZWZpIHdvcmxkIDI+
JjEgfCB0ZWUgLi4vbWFrZV93b3JsZF8zLm91dAo+ID4+Pgo+ID4+Pgo+ID4+PiAuLi4KPiA+Pj4g
Z2NjIC1XcCwtTUQsdG9vbHMva2NvbmZpZy8uemNvbmYudGFiLm8uZCAgICAtRF9HTlVfU09VUkNF
Cj4gPj4+IC1EX0RFRkFVTFRfU09VUkNFIC1EQ1VSU0VTX0xPQz0iPG5jdXJzZXMuaD4iIC1ETkNV
UlNFU19XSURFQ0hBUj0xCj4gPj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9v
bHMva2NvbmZpZy96Y29uZi50YWIubwo+ID4+PiB0b29scy9rY29uZmlnL3pjb25mLnRhYi5jCj4g
Pj4+IGdjYyAgLW8gdG9vbHMva2NvbmZpZy9jb25mIHRvb2xzL2tjb25maWcvY29uZi5vIHRvb2xz
L2tjb25maWcvemNvbmYudGFiLm8KPiA+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50
b2xkY29uZmlnIEtjb25maWcKPiA+Pj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Iv
c3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4gbWFrZSAtZiBSdWxlcy5tayBfaW5zdGFsbAo+
ID4+PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbicKPiA+Pj4gbWFrZSAtQyB0b29scwo+ID4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3Rv
cnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi90b29scycKPiA+Pj4gbWFrZSBzeW1ib2xz
Cj4gPj4+IG1ha2VbNV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0
ZXIveGVuL3Rvb2xzJwo+ID4+PiBnY2MgLVdhbGwgLVdlcnJvciAtV3N0cmljdC1wcm90b3R5cGVz
IC1PMiAtZm9taXQtZnJhbWUtcG9pbnRlcgo+ID4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2Rl
Y2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4gPj4+IHN5bWJvbHMuYwo+ID4+
PiBtYWtlWzVdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVu
L3Rvb2xzJwo+ID4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hl
bi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+PiBtYWtlIC1mIC91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbi9SdWxlcy5tayBpbmNsdWRlL3hlbi9jb21waWxlLmgKPiA+Pj4gbWFrZVs0XTogRW50ZXJp
bmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+ICBYZW4gNC4x
My11bnN0YWJsZQo+ID4+PiAvYmluL3NoOiBweXRob246IGNvbW1hbmQgbm90IGZvdW5kCj4gPj4+
IG1ha2VbNF06ICoqKiBbTWFrZWZpbGU6MTY5OiBpbmNsdWRlL3hlbi9jb21waWxlLmhdIEVycm9y
IDEyNwo+ID4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9tIHRoZSBoeXBlcnZp
c29yIGJ1aWxkLCBub3QgdGhlIHRvb2xzCj4gPj4gYnVpbGQuCj4gPj4KPiA+PiBUaGFua3MgZm9y
IHRoZSBsb2cuICBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLgo+ID4+Cj4gPj4+IG1ha2VbNF06
IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+IG1h
a2VbM106ICoqKiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4veGVu
XSBFcnJvciAyCj4gPj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4v
eGVuLW1hc3Rlci94ZW4nCj4gPj4+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NDU6IGluc3RhbGxd
IEVycm9yIDIKPiA+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94
ZW4tbWFzdGVyL3hlbicKPiA+Pj4gbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMjM6IGluc3RhbGwt
eGVuXSBFcnJvciAyCj4gPj4+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94
ZW4veGVuLW1hc3RlcicKPiA+Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxNjU6IHdvcmxkXSBFcnJv
ciAyCj4gPj4+Cj4gPj4+Cj4gPj4+IE5vdGUgdGhlCj4gPj4+Cj4gPj4+IC9iaW4vc2g6IHB5dGhv
bjogY29tbWFuZCBub3QgZm91bmQKPiA+Pj4KPiA+IFRoZSBpc3N1ZSBoZXJlIGlzIG9uIExGUyB0
aGVyZSBpcyBubyAvdXNyL2Jpbi9weXRob24uIFNvIHRoZSBoeXBlcnZpc29yCj4gPiBidWlsZCBp
cyBicm9rZW4gYmVjYXVzZSB4ZW4vaW5jbHVkZS9jb21waWxlLmggaW52b2tlcwo+ID4KPiA+ICBA
JChQWVRIT04pIHRvb2xzL2ZpZy10by1vY3QucHkgPCAuYmFubmVyID4+ICRALm5ldwo+ID4KPiA+
IFRoZXJlIGFyZSBvdGhlciBhcHBlYXJhbmNlcyBvZiBQWVRIT04gaW4gaHlwZXJ2aXNvciBidWls
ZCwgd2hpY2ggYXJlCj4gPiBlcXVhbGx5IGJyb2tlbi4KPiA+Cj4gPiBXZSBoYWQgLyBoYXZlIGEg
cG9saWN5IHRvIGF2b2lkIG1ha2luZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+ID4g
Y29uZmlndXJlLiBJIGhhdmUgQ0MnZWQgbW9yZSBwZW9wbGUgb24gdGhlaXIgb3BpbmlvbnMuCj4g
Cj4gV2hlcmUgaGFzICQoUFlUSE9OKSBnb3QgbG9zdD/CoCBJdCB3YXMgc3BlY2lmaWVkIGNvcnJl
Y3RseSB0byBiZWdpbiB3aXRoLgoKV2hlcmUgaXMgaXQgc3BlY2lmaWVkPwoKV2VpLgoKPiAKPiB+
QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
