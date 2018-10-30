From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 7/7] amd/pvh: enable ACPI C1E disable
 quirk on PVH Dom0
Date: Tue, 30 Oct 2018 12:00:54 +0100
Message-ID: <20181030110054.7hhwpqqdlxq2cnau@mac.citrite.net>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-8-roger.pau@citrix.com>
 <5BD716E802000078001F5D60@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlru=nk=citrix.com=prvs=8342f37c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHRlh-0000fz-FN
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 11:01:05 +0000
Content-Disposition: inline
In-Reply-To: <5BD716E802000078001F5D60@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDg6MTk6MjBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjEwLjE4IGF0IDE3OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9zdm0vc3ZtLmMKPiA+ICsrKyBiL3hlbi9h
cmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gPiBAQCAtMTI3Miw2ICsxMjcyLDI0IEBAIHZvaWQgc3Zt
X2hvc3Rfb3N2d19pbml0KCkKPiA+ICAgICAgc3Bpbl91bmxvY2soJm9zdndfbG9jayk7Cj4gPiAg
fQo+ID4gIAo+ID4gK3N0YXRpYyBpbnQgYWNwaV9jMWVfcXVpcmsoaW50IGRpciwgdW5zaWduZWQg
aW50IHBvcnQsIHVuc2lnbmVkIGludCBieXRlcywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90ICp2YWwpCj4gPiArewo+ID4gKyAgICBBU1NFUlQoYnl0ZXMgPT0gMSAmJiBw
b3J0ID09IGFjcGlfc21pX2NtZCk7Cj4gPiArCj4gPiArICAgIGlmICggZGlyID09IElPUkVRX1JF
QUQgKQo+ID4gKyAgICB7Cj4gPiArICAgICAgICAqdmFsID0gaW5iKHBvcnQpOwo+ID4gKyAgICAg
ICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICBvdXRiKCp2
YWwsIHBvcnQpOwo+ID4gKyAgICBpZiAoICp2YWwgPT0gYWNwaV9lbmFibGVfdmFsdWUgKQo+ID4g
KyAgICAgICBvbl9lYWNoX2NwdShhbWRfZGlzYWJsZV9jMWUsIE5VTEwsIDEpOwo+ID4gKwo+ID4g
KyAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+ID4gK30KPiAKPiBOb3RoaW5nIGluIGhlcmUgbm9y
IC4uLgo+IAo+ID4gQEAgLTEyODQsNiArMTMwMiw5IEBAIHN0YXRpYyBpbnQgc3ZtX2RvbWFpbl9p
bml0aWFsaXNlKHN0cnVjdCBkb21haW4gKmQpCj4gPiAgCj4gPiAgICAgIHN2bV9ndWVzdF9vc3Z3
X2luaXQoZCk7Cj4gPiAgCj4gPiArICAgIGlmICggYW1kX2FjcGlfYzFlX3F1aXJrICkKPiA+ICsg
ICAgICAgIHJlZ2lzdGVyX3BvcnRpb19oYW5kbGVyKGQsIGFjcGlfc21pX2NtZCwgMSwgYWNwaV9j
MWVfcXVpcmspOwo+IAo+IC4uLiB0aGUgcmVnaXN0cmF0aW9uIGhlcmUgcmVzdHJpY3RzIHRoaXMg
dG8gRG9tMC4KClJpZ2h0LCBJIGdvdCBtZXNzZWQgdXAgd2l0aCB0aGUgcGVybWlzc2lvbnMgYW5k
IGNvbXBsZXRlbHkgZm9yZ290CmFib3V0IGxpbWl0aW5nIHRvIERvbTAuCgpUaGUgYWJvdmUgbmVl
ZHMgdG8gaGF2ZSBhICcmJiBpc19oYXJkd2FyZV9kb21haW4oZCknIElNTy4gSSBwcmVmZXIgdG8K
ZG8gdGhpcyBhdCBob29rIHJlZ2lzdHJhdGlvbiByYXRoZXIgdGhhbiBhZGRpbmcgc3VjaCBjaGVj
ayBpbiB0aGUKaGFuZGxlciBpdHNlbGYuCgpUaGFua3MuIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
