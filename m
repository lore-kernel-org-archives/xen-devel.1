From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/4] xen/watchdog: Fold exit paths to have a
 single unlock
Date: Mon, 13 May 2019 14:51:27 +0100
Message-ID: <9d672876-1630-4a10-4b85-e1db7dbefbd4@citrix.com>
References: <1557512884-32395-1-git-send-email-andrew.cooper3@citrix.com>
 <1557512884-32395-2-git-send-email-andrew.cooper3@citrix.com>
 <5CD97567020000780022E1F0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CZq+=TN=citrix.com=prvs=029e45453=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hQBMa-0005N9-4c
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 13:51:32 +0000
In-Reply-To: <5CD97567020000780022E1F0@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Pau Ruiz Safont <pau.safont@citrix.com>, Julien Grall <julien.grall@arm.com>, =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDUvMjAxOSAxNDo0NywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDUuMTkg
YXQgMjA6MjgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gLS0tIGEveGVu
L2NvbW1vbi9zY2hlZHVsZS5jCj4+ICsrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwo+PiBAQCAt
MTA1MCw2ICsxMDUwLDggQEAgc3RhdGljIHZvaWQgZG9tYWluX3dhdGNoZG9nX3RpbWVvdXQodm9p
ZCAqZGF0YSkKPj4gIAo+PiAgc3RhdGljIGxvbmcgZG9tYWluX3dhdGNoZG9nKHN0cnVjdCBkb21h
aW4gKmQsIHVpbnQzMl90IGlkLCB1aW50MzJfdCB0aW1lb3V0KQo+PiAgewo+PiArICAgIGxvbmcg
cmMgPSAwOwo+IEknbSB3b25kZXJpbmcgd2h5IHRoaXMgaXNuJ3QgcGxhaW4gaW50LiBOb3QgYSBi
aWcgZGVhbCwgYnV0IEknbQo+IGN1cmlvdXMgYW55d2F5LgoKVG8gbWF0Y2ggdGhlIHJldHVybiB2
YWx1ZS7CoCBUaGlzIGZ1bmN0aW9uIGlzIGNvbXBpbGVkIHR3aWNlIEFGQUlDVC4KCj4KPiBBcyBw
ZXIgeW91ciBvd24gcmVzcG9uc2UgdG8gcGF0Y2ggMiBJIHVuZGVyc3RhbmQgdGhhdCB0aGUKPiBv
dGhlciBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGRvbiN0IG5lZWQgbG9va2luZyBhdCB1bnRpbCB5
b3UKPiBzZW5kIGEgdjIuCgpwYXRjaCAzIGlzIGluZGVwZW5kZW50IG9mIHRoZSBBQkkgY2hhbmdl
cywgc28gZmluZSBpbiBwcmluY2lwbGUgdG8KcmV2aWV3IG5vdy4KClBhdGNoZXMgMiBhbmQgNCB3
aWxsIGRlZmluaXRlbHkgbmVlZCBjaGFuZ2luZy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
