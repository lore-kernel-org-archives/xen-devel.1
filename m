Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1773EC282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:43:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D990E20645
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 11:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D990E20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGiy9-0005kh-HK; Wed, 17 Apr 2019 11:43:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wIUc=ST=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hGiy8-0005kb-Cn
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 11:43:12 +0000
X-Inumbo-ID: f91ffef2-6105-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f91ffef2-6105-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 11:43:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E2B71AE5E;
 Wed, 17 Apr 2019 11:43:08 +0000 (UTC)
To: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
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
 <20190417112645.GV30543@zion.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <1ff06c9a-8e81-7c00-9dab-26f3d4173714@suse.com>
Date: Wed, 17 Apr 2019 13:43:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190417112645.GV30543@zion.uk.xensource.com>
Content-Language: de-DE
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>,
 Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417114305.14zy2PPx95jytEAHpK01iOQ3Gyc_aTkbKJPsIU3V0Mg@z>

T24gMTcvMDQvMjAxOSAxMzoyNiwgV2VpIExpdSB3cm90ZToKPiBPbiBXZWQsIEFwciAxNywgMjAx
OSBhdCAxMjoyMzoyOVBNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBPbiAxNy8wNC8y
MDE5IDEyOjE2LCBXZWkgTGl1IHdyb3RlOgo+Pj4gT24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTI6
MTU6MDRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+PiBPbiAxNy8wNC8yMDE5IDEy
OjAzLCBXZWkgTGl1IHdyb3RlOgo+Pj4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMTo1ODo0
OUFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4gT24gMTcvMDQvMjAxOSAxMTo1
NywgV2VpIExpdSB3cm90ZToKPj4+Pj4+PiBPbiBXZWQsIEFwciAxNywgMjAxOSBhdCAxMTo0NDoz
NkFNICswMTAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+Pj4+PiBPbiAxNy8wNC8yMDE5IDEx
OjQxLCBXZWkgTGl1IHdyb3RlOgo+Pj4+Pj4+Pj4gT24gV2VkLCBBcHIgMTcsIDIwMTkgYXQgMTA6
NTY6NTdBTSArMDEwMCwgV2VpIExpdSB3cm90ZToKPj4+Pj4+Pj4+Pj4gSGVyZSdzIHdoYXQgaSBk
aWQgaGF2aW5nIHB1bGxlZCB0aGUgbWFzdGVyIGF0IGNvbW1pdCBjYjcwYTI2Cj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IHRhciB4ZiAvcGF0aC90by94ZW4tY2I3MGEyNi50YXIuZ3oKPj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Pj4gY2QgeGVuLW1hc3Rlci8KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gUFlU
SE9OPS91c3IvYmluL3B5dGhvbjMgLi9jb25maWd1cmUgLS1wcmVmaXg9L3VzciAgIFwKPj4+Pj4+
Pj4+Pj4gICAgLS1kaXNhYmxlLXNlYWJpb3MgICBcCj4+Pj4+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1x
ZW11LXRyYWRpdGlvbmFsICBcCj4+Pj4+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1yb21iaW9zICAgICBc
Cj4+Pj4+Pj4+Pj4+ICAgIC0tZGlzYWJsZS1zdHViZG9tIDI+JjEgfCB0ZWUgLi4vY29uZmlnLmxv
Zwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBtYWtlIEVGSV9ESVI9L3Vzci9saWIvZWZpIHdvcmxk
IDI+JjEgfCB0ZWUgLi4vbWFrZV93b3JsZF8zLm91dAo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4+PiAuLi4KPj4+Pj4+Pj4+Pj4gZ2NjIC1XcCwtTUQsdG9vbHMva2NvbmZpZy8uemNv
bmYudGFiLm8uZCAgICAtRF9HTlVfU09VUkNFCj4+Pj4+Pj4+Pj4+IC1EX0RFRkFVTFRfU09VUkNF
IC1EQ1VSU0VTX0xPQz0iPG5jdXJzZXMuaD4iIC1ETkNVUlNFU19XSURFQ0hBUj0xCj4+Pj4+Pj4+
Pj4+IC1ETE9DQUxFICAtSXRvb2xzL2tjb25maWcgLWMgLW8gdG9vbHMva2NvbmZpZy96Y29uZi50
YWIubwo+Pj4+Pj4+Pj4+PiB0b29scy9rY29uZmlnL3pjb25mLnRhYi5jCj4+Pj4+Pj4+Pj4+IGdj
YyAgLW8gdG9vbHMva2NvbmZpZy9jb25mIHRvb2xzL2tjb25maWcvY29uZi5vIHRvb2xzL2tjb25m
aWcvemNvbmYudGFiLm8KPj4+Pj4+Pj4+Pj4gdG9vbHMva2NvbmZpZy9jb25mIC1zIC0tc2lsZW50
b2xkY29uZmlnIEtjb25maWcKPj4+Pj4+Pj4+Pj4gbWFrZVszXTogTGVhdmluZyBkaXJlY3Rvcnkg
Jy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+Pj4+Pj4gbWFrZSAtZiBSdWxlcy5t
ayBfaW5zdGFsbAo+Pj4+Pj4+Pj4+PiBtYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Iv
c3JjL3hlbi94ZW4tbWFzdGVyL3hlbicKPj4+Pj4+Pj4+Pj4gbWFrZSAtQyB0b29scwo+Pj4+Pj4+
Pj4+PiBtYWtlWzRdOiBFbnRlcmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbi90b29scycKPj4+Pj4+Pj4+Pj4gbWFrZSBzeW1ib2xzCj4+Pj4+Pj4+Pj4+IG1ha2VbNV06
IEVudGVyaW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+
Pj4+Pj4+Pj4+PiBnY2MgLVdhbGwgLVdlcnJvciAtV3N0cmljdC1wcm90b3R5cGVzIC1PMiAtZm9t
aXQtZnJhbWUtcG9pbnRlcgo+Pj4+Pj4+Pj4+PiAtZm5vLXN0cmljdC1hbGlhc2luZyAtV2RlY2xh
cmF0aW9uLWFmdGVyLXN0YXRlbWVudCAtbyBzeW1ib2xzCj4+Pj4+Pj4+Pj4+IHN5bWJvbHMuYwo+
Pj4+Pj4+Pj4+PiBtYWtlWzVdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Vzci9zcmMveGVuL3hlbi1t
YXN0ZXIveGVuL3Rvb2xzJwo+Pj4+Pj4+Pj4+PiBtYWtlWzRdOiBMZWF2aW5nIGRpcmVjdG9yeSAn
L3Vzci9zcmMveGVuL3hlbi1tYXN0ZXIveGVuL3Rvb2xzJwo+Pj4+Pj4+Pj4+PiBtYWtlIC1mIC91
c3Ivc3JjL3hlbi94ZW4tbWFzdGVyL3hlbi9SdWxlcy5tayBpbmNsdWRlL3hlbi9jb21waWxlLmgK
Pj4+Pj4+Pj4+Pj4gbWFrZVs0XTogRW50ZXJpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVu
LW1hc3Rlci94ZW4nCj4+Pj4+Pj4+Pj4+ICBYZW4gNC4xMy11bnN0YWJsZQo+Pj4+Pj4+Pj4+PiAv
YmluL3NoOiBweXRob246IGNvbW1hbmQgbm90IGZvdW5kCj4+Pj4+Pj4+Pj4+IG1ha2VbNF06ICoq
KiBbTWFrZWZpbGU6MTY5OiBpbmNsdWRlL3hlbi9jb21waWxlLmhdIEVycm9yIDEyNwo+Pj4+Pj4+
Pj4+IEhlcmUuIFRoZSBQWVRIT04gaW52b2NhdGlvbiBpcyBmcm9tIHRoZSBoeXBlcnZpc29yIGJ1
aWxkLCBub3QgdGhlIHRvb2xzCj4+Pj4+Pj4+Pj4gYnVpbGQuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
PiBUaGFua3MgZm9yIHRoZSBsb2cuICBJIHdpbGwgaGF2ZSBhIGNsb3NlciBsb29rLgo+Pj4+Pj4+
Pj4+Cj4+Pj4+Pj4+Pj4+IG1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4v
eGVuLW1hc3Rlci94ZW4nCj4+Pj4+Pj4+Pj4+IG1ha2VbM106ICoqKiBbTWFrZWZpbGU6MTM3OiAv
dXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4veGVuXSBFcnJvciAyCj4+Pj4+Pj4+Pj4+IG1ha2Vb
M106IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3NyYy94ZW4veGVuLW1hc3Rlci94ZW4nCj4+Pj4+
Pj4+Pj4+IG1ha2VbMl06ICoqKiBbTWFrZWZpbGU6NDU6IGluc3RhbGxdIEVycm9yIDIKPj4+Pj4+
Pj4+Pj4gbWFrZVsyXTogTGVhdmluZyBkaXJlY3RvcnkgJy91c3Ivc3JjL3hlbi94ZW4tbWFzdGVy
L3hlbicKPj4+Pj4+Pj4+Pj4gbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMjM6IGluc3RhbGwteGVu
XSBFcnJvciAyCj4+Pj4+Pj4+Pj4+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvdXNyL3Ny
Yy94ZW4veGVuLW1hc3RlcicKPj4+Pj4+Pj4+Pj4gbWFrZTogKioqIFtNYWtlZmlsZToxNjU6IHdv
cmxkXSBFcnJvciAyCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IE5vdGUgdGhl
Cj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IC9iaW4vc2g6IHB5dGhvbjogY29tbWFuZCBub3QgZm91
bmQKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZSBpc3N1ZSBoZXJlIGlzIG9uIExGUyB0aGVyZSBp
cyBubyAvdXNyL2Jpbi9weXRob24uIFNvIHRoZSBoeXBlcnZpc29yCj4+Pj4+Pj4+PiBidWlsZCBp
cyBicm9rZW4gYmVjYXVzZSB4ZW4vaW5jbHVkZS9jb21waWxlLmggaW52b2tlcwo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+ICBAJChQWVRIT04pIHRvb2xzL2ZpZy10by1vY3QucHkgPCAuYmFubmVyID4+ICRA
Lm5ldwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFRoZXJlIGFyZSBvdGhlciBhcHBlYXJhbmNlcyBvZiBQ
WVRIT04gaW4gaHlwZXJ2aXNvciBidWlsZCwgd2hpY2ggYXJlCj4+Pj4+Pj4+PiBlcXVhbGx5IGJy
b2tlbi4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBXZSBoYWQgLyBoYXZlIGEgcG9saWN5IHRvIGF2b2lk
IG1ha2luZyBoeXBlcnZpc29yIGJ1aWxkIGRlcGVuZGVudCBvbgo+Pj4+Pj4+Pj4gY29uZmlndXJl
LiBJIGhhdmUgQ0MnZWQgbW9yZSBwZW9wbGUgb24gdGhlaXIgb3BpbmlvbnMuCj4+Pj4+Pj4+IFdo
ZXJlIGhhcyAkKFBZVEhPTikgZ290IGxvc3Q/wqAgSXQgd2FzIHNwZWNpZmllZCBjb3JyZWN0bHkg
dG8gYmVnaW4gd2l0aC4KPj4+Pj4+PiBXaGVyZSBpcyBpdCBzcGVjaWZpZWQ/Cj4+Pj4+PiBPaCAt
IEkgc2VlIG5vdy4KPj4+Pj4+Cj4+Pj4+PiBJdCBpcyBzcGVjaWZpZWQgZm9yIC4vY29uZmlndXJl
LCBidXQgbm90IGZvciBtYWtlLgo+Pj4+PiBSaWdodC4KPj4+Pj4KPj4+Pj4gSXQgd29ya3MgZm9y
IHRvb2xzIGJlY2F1c2UgdG9vbHMgYnVpbGQgaW5jbHVkZXMgY29uZmlnL1Rvb2xzLm1rIHdoaWNo
Cj4+Pj4+IGNvbnRhaW5zIHRoZSBjb3JyZWN0IHB5dGhvbiBwYXRoLiBUb29scy5tayBpcyBnZW5l
cmF0ZWQgYnkgY29uZmlndXJlLgo+Pj4+PiAgCj4+Pj4+IE9idmlvdXNseSBoeXBlcnZpc29yIGJ1
aWxkIHNob3VsZG4ndCBpbmNsdWRlIFRvb2xzLm1rLiBGdXJ0aGVybW9yZSwgdGhlCj4+Pj4+IHBv
bGljeSBvZiAiaHYgc2hvdWxkbid0IGRlcGVuZCBvbiBjb25maWd1cmUiIG1ha2VzIHRoaXMgcm91
dGUgYSBuby1nby4KPj4+Pj4KPj4+Pj4gRWl0aGVyIHdlIGNoYW5nZSB0aGUgcG9saWN5LCBvciB3
ZSBkb2N1bWVudCB0aGUgZGVmaWNpZW5jeSwgb3Igd2UgY29tZQo+Pj4+PiB1cCB3aXRoIHNvbWUg
Y2xldmVyIHRyaWNrIHRvIHByb2JlLgo+Pj4+IEdpdmVuIHRoZSBzaGViYW5nIGluIGFsbCBvZiBv
dXIgc2NyaXB0cywgd291bGQgYGVudiBweXRob25gIGJlCj4+Pj4gc3VmZmljaWVudGx5IGNsZXZl
ciB0cmlja2VyeSwgb3IgaXMgdGhhdCBhIGNhbiBvZiB3b3JtcyB3ZSdkIHByZWZlciBub3QKPj4+
PiB0byBvcGVuPwo+Pj4gSSBhbHJlYWR5IHRyaWVkIGVudiBweXRob24gLS0gaXQgZGlkbid0IHdv
cmsuIEkgdGhpbmsgaXQgc2VhcmNoZXMgUEFUSFMKPj4+IGp1c3QgbGlrZSBhIHNoZWxsIHdvdWxk
Lgo+Pgo+PiBTbyB0aGlzIHBhcnRpY3VsYXIgdXNlIG9mIHB5dGhvbiBpcyBjb21wbGV0ZWx5IHRy
aXZpYWwuwqAgSXQgaXMgYW4gb2N0YWwKPj4gY29udmVyc2lvbiBvbiB0aGUgYmFubmVyIHN0cmlu
ZywgdG8gZmVlZCBpbnRvIGEgc3RyaW5nIGZvciBYRU5fQkFOTkVSCj4+Cj4+IEl0IGV4aXN0cyBi
ZWNhdXNlIEkgcmVtb3ZlZCBhIGZvcmsgb2YgZmlnbGV0WzFdIGZyb20gWGVuJ3Mgc291cmNlIHRy
ZWUKPj4gd2l0aCB0aGlzIHNjcmlwdCwgYnV0IGl0cyBwcm9iYWJseSBqdXN0IGFzIGVhc3kgdG8g
ZG8gd2l0aCBhd2sgb3IKPj4gc29tZXRoaW5nIHNpbWlsYXIuCj4+Cj4+IH5BbmRyZXcKPj4KPj4g
WzFdIFllcyAtIFhlbiBkaWQgdXNlIHRvIGNhcnJ5IGEgZm9yayBvZiBmaWdsZXQgd2hpY2ggZGlm
ZmVyZWQgc29sZWx5IGJ5Cj4+IGJlaW5nIGFibGUgdG8gb3V0cHV0IGFuIG9jdGFsLWVzY2FwZWQg
c3RyaW5nLsKgIE5vIC0gSSBoYXZlIG5vIHdvcmRzCj4+IHdoaWNoIGNhbiBwb3NzaWJseSBiZSB1
c2VkIHRvIGRlZmVuZCB0aGlzLi4uCj4gCj4gCj4gQnV0IHRoZXJlIGFyZSBvdGhlciBsZXNzIHRy
aXZpYWwgb25lcy4gU2VlIHhlbi9pbmNsdWRlL01ha2VmaWxlLiBYU00KPiBhbHNvIHJlbGllcyBv
biBpdCB0byBnZW5lcmF0ZSBwb2xpY3kuIFdoYXQgZG8geW91IHdhbnQgdG8gZG8gd2l0aCB0aG9z
ZT8KClNob3VsZG4ndCBfc29tZV8gc2V0dGluZ3Mgb2YgY29uZmlndXJlIGVuZCB1cCBpbiB0aGUg
aHlwZXJ2aXNvciBidWlsZCwKdG9vPyBMaWtlIENDLCBBV0ssIFNIRUxMLCBIT1NUQ0M/CgpNYXli
ZSB3ZSBuZWVkIGEgcmF0aGVyIHNtYWxsIGJhc2ljX3Rvb2xzLm1rIGNvbnRhaW5pbmcgdGhvc2Ug
c2V0dGluZ3MKKHdpdGggYSBzYW5lIGRlZmF1bHQsIG9mIGNvdXJzZSk/CgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
