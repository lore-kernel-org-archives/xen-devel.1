Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6FAC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:27:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC7A206BA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:27:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC7A206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiiJ-0003zp-8m; Wed, 17 Apr 2019 11:26:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f/qU=ST=citrix.com=prvs=0034167b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hGiiI-0003zj-Dc
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:26:50 +0000
X-Inumbo-ID: b0687024-6103-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b0687024-6103-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 11:26:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,361,1549929600"; d="scan'208";a="83780030"
Date: Wed, 17 Apr 2019 12:26:45 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190417112645.GV30543@zion.uk.xensource.com>
References: <CABwOO=fSCMfqqay_ZD7FjvoLWjW8PUyyVze9d1s43v=KFDFsXA@mail.gmail.com>
 <20190417095657.GQ30543@zion.uk.xensource.com>
 <20190417104136.GR30543@zion.uk.xensource.com>
 <4487fafe-cee9-4c3b-3059-5073c4a9ce69@citrix.com>
 <20190417105729.GS30543@zion.uk.xensource.com>
 <cda91b28-50c4-308a-30d8-6cecceb973c6@citrix.com>
 <20190417110356.GT30543@zion.uk.xensource.com>
 <a3576f49-eebc-6684-d043-b9511895cf1a@citrix.com>
 <20190417111635.GU30543@zion.uk.xensource.com>
 <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7fe14ebe-987a-8b95-1d77-d6d40a473fa3@citrix.com>
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
Message-ID: <20190417112645.SNyLfK_hWsOW3U5Tiq23W6augmPph42u-GrS3NY7Bf8@z>

T24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTI6MjM6MjlQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wNC8yMDE5IDEyOjE2LCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gV2VkLCBB
cHIgMTcsIDIwMTkgYXQgMTI6MTU6MDRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
PiBPbiAxNy8wNC8yMDE5IDEyOjAzLCBXZWkgTGl1IHdyb3RlOgo+ID4+PiBPbiBXZWQsIEFwciAx
NywgMjAxOSBhdCAxMTo1ODo0OUFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4g
T24gMTcvMDQvMjAxOSAxMTo1NywgV2VpIExpdSB3cm90ZToKPiA+Pj4+PiBPbiBXZWQsIEFwciAx
NywgMjAxOSBhdCAxMTo0NDozNkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+ID4+Pj4+
PiBPbiAxNy8wNC8yMDE5IDExOjQxLCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4+Pj4gT24gV2VkLCBB
cHIgMTcsIDIwMTkgYXQgMTA6NTY6NTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPiA+Pj4+Pj4+
Pj4gSGVyZSdzIHdoYXQgaSBkaWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBj
YjcwYTI2Cj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IHRhciB4ZiAvcGF0aC90by94ZW4tY2I3MGEy
Ni50YXIuZ3oKPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gY2QgeGVuLW1hc3Rlci8KPiA+Pj4+Pj4+
Pj4KPiA+Pj4+Pj4+Pj4gUFlUSE9OPS91c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVm
aXg9L3VzciAgIFwKPiA+Pj4+Pj4+Pj4gICAgLS1kaXNhYmxlLXNlYWJpb3MgICBcCj4gPj4+Pj4+
Pj4+ICAgIC0tZGlzYWJsZS1xZW11LXRyYWRpdGlvbmFsICBcCj4gPj4+Pj4+Pj4+ICAgIC0tZGlz
YWJsZS1yb21iaW9zICAgICBcCj4gPj4+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1zdHViZG9tIDI+JjEg
fCB0ZWUgLi4vY29uZmlnLmxvZwo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBtYWtlIEVGSV9ESVI9
L3Vzci9saWIvZWZpIHdvcmxkIDI+JjEgfCB0ZWUgLi4vbWFrZV93b3JsZF8zLm91dAo+ID4+Pj4+
Pj4+Pgo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiAuLi4KPiA+Pj4+Pj4+Pj4gZ2NjIC1XcCwtTUQs
dG9vbHMva2NvbmZpZy8uemNvbmYudGFiLm8uZCAgICAtRF9HTlVfU09VUkNFCj4gPj4+Pj4+Pj4+
IC1EX0RFRkFVTFRfU09VUkNFIC1EQ1VSU0VTX0xPQz0iPG5jdXJzZXMuaD4iIC1ETkNVUlNFU19X
SURFQ0hBUj0xCj4gPj4+Pj4+Pj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9v
bHMva2NvbmZpZy96Y29uZi50YWIubwo+ID4+Pj4+Pj4+PiB0b29scy9rY29uZmlnL3pjb25mLnRh
Yi5jCj4gPj4+Pj4+Pj4+IGdjYyAgLW8gdG9vbHMva2NvbmZpZy9jb25mIHRvb2xzL2tjb25maWcv
Y29uZi5vIHRvb2xzL2tjb25maWcvemNvbmYudGFiLm8KPiA+Pj4+Pj4+Pj4gdG9vbHMva2NvbmZp
Zy9jb25mIC1zIC0tc2lsZW50b2xkY29uZmlnIEtjb25maWcKPiA+Pj4+Pj4+Pj4gbWFrZVszXTog
TGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+
Pj4gbWFrZSAtZiBSdWxlcy5tayBfaW5zdGFsbAo+ID4+Pj4+Pj4+PiBtYWtlWzNdOiBFbnRlcmlu
ZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+Pj4gbWFr
ZSAtQyB0b29scwo+ID4+Pj4+Pj4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Iv
c3JjL3hlbi94ZW4tbWFzdGVyL3hlbi90b29scycKPiA+Pj4+Pj4+Pj4gbWFrZSBzeW1ib2xzCj4g
Pj4+Pj4+Pj4+IG1ha2VbNV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1t
YXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+Pj4+PiBnY2MgLVdhbGwgLVdlcnJvciAtV3N0cmljdC1w
cm90b3R5cGVzIC1PMiAtZm9taXQtZnJhbWUtcG9pbnRlcgo+ID4+Pj4+Pj4+PiAtZm5vLXN0cmlj
dC1hbGlhc2luZyAtV2RlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4gPj4+
Pj4+Pj4+IHN5bWJvbHMuYwo+ID4+Pj4+Pj4+PiBtYWtlWzVdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+Pj4+Pj4+PiBtYWtlWzRdOiBM
ZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+ID4+
Pj4+Pj4+PiBtYWtlIC1mIC91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi9SdWxlcy5tayBpbmNs
dWRlL3hlbi9jb21waWxlLmgKPiA+Pj4+Pj4+Pj4gbWFrZVs0XTogRW50ZXJpbmcgZGlyZWN0b3J5
ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+Pj4+Pj4+ICBYZW4gNC4xMy11bnN0
YWJsZQo+ID4+Pj4+Pj4+PiAvYmluL3NoOiBweXRob246IGNvbW1hbmQgbm90IGZvdW5kCj4gPj4+
Pj4+Pj4+IG1ha2VbNF06ICoqKiBbTWFrZWZpbGU6MTY5OiBpbmNsdWRlL3hlbi9jb21waWxlLmhd
IEVycm9yIDEyNwo+ID4+Pj4+Pj4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9t
IHRoZSBoeXBlcnZpc29yIGJ1aWxkLCBub3QgdGhlIHRvb2xzCj4gPj4+Pj4+Pj4gYnVpbGQuCj4g
Pj4+Pj4+Pj4KPiA+Pj4+Pj4+PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwgaGF2ZSBhIGNs
b3NlciBsb29rLgo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IG1ha2VbNF06IExlYXZpbmcgZGlyZWN0
b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4gPj4+Pj4+Pj4+IG1ha2VbM106ICoq
KiBbTWFrZWZpbGU6MTM3OiAvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4veGVuXSBFcnJvciAy
Cj4gPj4+Pj4+Pj4+IG1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVu
LW1hc3Rlci94ZW4nCj4gPj4+Pj4+Pj4+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NDU6IGluc3Rh
bGxdIEVycm9yIDIKPiA+Pj4+Pj4+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Iv
c3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPiA+Pj4+Pj4+Pj4gbWFrZVsxXTogKioqIFtNYWtlZmls
ZToxMjM6IGluc3RhbGwteGVuXSBFcnJvciAyCj4gPj4+Pj4+Pj4+IG1ha2VbMV06IExlYXZpbmcg
ZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3RlcicKPiA+Pj4+Pj4+Pj4gbWFrZTogKioq
IFtNYWtlZmlsZToxNjU6IHdvcmxkXSBFcnJvciAyCj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Cj4g
Pj4+Pj4+Pj4+IE5vdGUgdGhlCj4gPj4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4+IC9iaW4vc2g6IHB5dGhv
bjogY29tbWFuZCBub3QgZm91bmQKPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoZSBpc3N1ZSBoZXJl
IGlzIG9uIExGUyB0aGVyZSBpcyBubyAvdXNyL2Jpbi9weXRob24uIFNvIHRoZSBoeXBlcnZpc29y
Cj4gPj4+Pj4+PiBidWlsZCBpcyBicm9rZW4gYmVjYXVzZSB4ZW4vaW5jbHVkZS9jb21waWxlLmgg
aW52b2tlcwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+ICBAJChQWVRIT04pIHRvb2xzL2ZpZy10by1vY3Qu
cHkgPCAuYmFubmVyID4+ICRALm5ldwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IFRoZXJlIGFyZSBvdGhl
ciBhcHBlYXJhbmNlcyBvZiBQWVRIT04gaW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4g
Pj4+Pj4+PiBlcXVhbGx5IGJyb2tlbi4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBXZSBoYWQgLyBoYXZl
IGEgcG9saWN5IHRvIGF2b2lkIG1ha2luZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+
ID4+Pj4+Pj4gY29uZmlndXJlLiBJIGhhdmUgQ0MnZWQgbW9yZSBwZW9wbGUgb24gdGhlaXIgb3Bp
bmlvbnMuCj4gPj4+Pj4+IFdoZXJlIGhhcyAkKFBZVEhPTikgZ290IGxvc3Q/wqAgSXQgd2FzIHNw
ZWNpZmllZCBjb3JyZWN0bHkgdG8gYmVnaW4gd2l0aC4KPiA+Pj4+PiBXaGVyZSBpcyBpdCBzcGVj
aWZpZWQ/Cj4gPj4+PiBPaCAtIEkgc2VlIG5vdy4KPiA+Pj4+Cj4gPj4+PiBJdCBpcyBzcGVjaWZp
ZWQgZm9yIC4vY29uZmlndXJlLCBidXQgbm90IGZvciBtYWtlLgo+ID4+PiBSaWdodC4KPiA+Pj4K
PiA+Pj4gSXQgd29ya3MgZm9yIHRvb2xzIGJlY2F1c2UgdG9vbHMgYnVpbGQgaW5jbHVkZXMgY29u
ZmlnL1Rvb2xzLm1rIHdoaWNoCj4gPj4+IGNvbnRhaW5zIHRoZSBjb3JyZWN0IHB5dGhvbiBwYXRo
LiBUb29scy5tayBpcyBnZW5lcmF0ZWQgYnkgY29uZmlndXJlLgo+ID4+PiAgCj4gPj4+IE9idmlv
dXNseSBoeXBlcnZpc29yIGJ1aWxkIHNob3VsZG4ndCBpbmNsdWRlIFRvb2xzLm1rLiBGdXJ0aGVy
bW9yZSwgdGhlCj4gPj4+IHBvbGljeSBvZiAiaHYgc2hvdWxkbid0IGRlcGVuZCBvbiBjb25maWd1
cmUiIG1ha2VzIHRoaXMgcm91dGUgYSBuby1nby4KPiA+Pj4KPiA+Pj4gRWl0aGVyIHdlIGNoYW5n
ZSB0aGUgcG9saWN5LCBvciB3ZSBkb2N1bWVudCB0aGUgZGVmaWNpZW5jeSwgb3Igd2UgY29tZQo+
ID4+PiB1cCB3aXRoIHNvbWUgY2xldmVyIHRyaWNrIHRvIHByb2JlLgo+ID4+IEdpdmVuIHRoZSBz
aGViYW5nIGluIGFsbCBvZiBvdXIgc2NyaXB0cywgd291bGQgYGVudiBweXRob25gIGJlCj4gPj4g
c3VmZmljaWVudGx5IGNsZXZlciB0cmlja2VyeSwgb3IgaXMgdGhhdCBhIGNhbiBvZiB3b3JtcyB3
ZSdkIHByZWZlciBub3QKPiA+PiB0byBvcGVuPwo+ID4gSSBhbHJlYWR5IHRyaWVkIGVudiBweXRo
b24gLS0gaXQgZGlkbid0IHdvcmsuIEkgdGhpbmsgaXQgc2VhcmNoZXMgUEFUSFMKPiA+IGp1c3Qg
bGlrZSBhIHNoZWxsIHdvdWxkLgo+IAo+IFNvIHRoaXMgcGFydGljdWxhciB1c2Ugb2YgcHl0aG9u
IGlzIGNvbXBsZXRlbHkgdHJpdmlhbC7CoCBJdCBpcyBhbiBvY3RhbAo+IGNvbnZlcnNpb24gb24g
dGhlIGJhbm5lciBzdHJpbmcsIHRvIGZlZWQgaW50byBhIHN0cmluZyBmb3IgWEVOX0JBTk5FUgo+
IAo+IEl0IGV4aXN0cyBiZWNhdXNlIEkgcmVtb3ZlZCBhIGZvcmsgb2YgZmlnbGV0WzFdIGZyb20g
WGVuJ3Mgc291cmNlIHRyZWUKPiB3aXRoIHRoaXMgc2NyaXB0LCBidXQgaXRzIHByb2JhYmx5IGp1
c3QgYXMgZWFzeSB0byBkbyB3aXRoIGF3ayBvcgo+IHNvbWV0aGluZyBzaW1pbGFyLgo+IAo+IH5B
bmRyZXcKPiAKPiBbMV0gWWVzIC0gWGVuIGRpZCB1c2UgdG8gY2FycnkgYSBmb3JrIG9mIGZpZ2xl
dCB3aGljaCBkaWZmZXJlZCBzb2xlbHkgYnkKPiBiZWluZyBhYmxlIHRvIG91dHB1dCBhbiBvY3Rh
bC1lc2NhcGVkIHN0cmluZy7CoCBObyAtIEkgaGF2ZSBubyB3b3Jkcwo+IHdoaWNoIGNhbiBwb3Nz
aWJseSBiZSB1c2VkIHRvIGRlZmVuZCB0aGlzLi4uCgoKQnV0IHRoZXJlIGFyZSBvdGhlciBsZXNz
IHRyaXZpYWwgb25lcy4gU2VlIHhlbi9pbmNsdWRlL01ha2VmaWxlLiBYU00KYWxzbyByZWxpZXMg
b24gaXQgdG8gZ2VuZXJhdGUgcG9saWN5LiBXaGF0IGRvIHlvdSB3YW50IHRvIGRvIHdpdGggdGhv
c2U/CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
