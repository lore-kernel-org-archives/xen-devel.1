From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Fri, 26 Apr 2019 06:24:30 -0600
Message-ID: <CABfawhkeNi+Du-qJwaP=OmrMBOPFOTY+y4FLYC9OoRtpwf3izA@mail.gmail.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <5CC2CEC002000078002295D3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJzui-0002e9-LC
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 12:25:12 +0000
Received: by mail-wm1-f48.google.com with SMTP id p21so1813001wmc.0
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 05:25:08 -0700 (PDT)
In-Reply-To: <5CC2CEC002000078002295D3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMzoyNiBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI1LjA0LjE5IGF0IDIxOjU3LCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBUaHUsIEFwciAyNSwgMjAxOSBhdCAxMjo1OCBQTSBBbmRy
ZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4KPiA+
PiBPbiAyNS8wNC8yMDE5IDE2OjMyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4gPiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9t
bS5oCj4gPj4gPiBpbmRleCA2ZmFhNTYzMTY3Li41OTRkZTYxNDhmIDEwMDY0NAo+ID4+ID4gLS0t
IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gPj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L21tLmgKPiA+PiA+IEBAIC0xMzMsNyArMTMzLDEwIEBAIHN0cnVjdCBwYWdlX2luZm8KPiA+
PiA+ICAgICAgICAgICAqIG9mIHNoYXJpbmcgc2hhcmUgdGhlIHZlcnNpb24gdGhleSBleHBlY3Qg
dG8uCj4gPj4gPiAgICAgICAgICAgKiBUaGlzIGxpc3QgaXMgYWxsb2NhdGVkIGFuZCBmcmVlZCB3
aGVuIGEgcGFnZSBpcwo+ID4gc2hhcmVkL3Vuc2hhcmVkLgo+ID4+ID4gICAgICAgICAgICovCj4g
Pj4gPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9zaGFyaW5nX2luZm8gKnNoYXJpbmc7Cj4gPj4gPiAr
ICAgICAgICBzdHJ1Y3Qgewo+ID4+ID4gKyAgICAgICAgICAgIHN0cnVjdCBwYWdlX3NoYXJpbmdf
aW5mbyAqaW5mbzsKPiA+PiA+ICsgICAgICAgICAgICByd2xvY2tfdCBsb2NrOwo+ID4+ID4gKyAg
ICAgICAgfSBzaGFyaW5nOwo+ID4+ID4gICAgICB9Owo+ID4+ID4KPiA+PiA+ICAgICAgLyogUmVm
ZXJlbmNlIGNvdW50IGFuZCB2YXJpb3VzIFBHQ194eHggZmxhZ3MgYW5kIGZpZWxkcy4gKi8KPiA+
Pgo+ID4+IEknbSBhZnJhaWQgdGhpcyBpcyBhIG5vLWdvLCBidXQgZm9yIHNvbWUgcmVhc29ucyB3
aGljaCBhcmUgcmF0aGVyIG1vcmUKPiA+PiBzdWJ0bGUgdGhhdCB0aGV5IGFwcGVhciBoZXJlLgo+
ID4+Cj4gPj4gVGhlcmUgaXMgb25lIHN0cnVjdCBwYWdlX2luZm8gcGVyIDRrIGZyYW1lLCBhbmQg
eW91J3ZlIGFkZGVkIGFuIGV4dHJhIDE2Cj4gPj4gYnl0ZXMsIHRha2luZyBpdCBmcm9tIDMyIGJ5
dGVzIHRvIDQ4IGJ5dGVzLgo+ID4+Cj4gPj4gT3RoZXIgdGhhbiBtYWtpbmcgaXQgYSBub24tcG93
ZXItb2YtMiAobmV0IGRpZmZzdGF0IGdyb3cvc2hyaW5rOiAyNTYvMjcKPiA+PiB1cC9kb3duOiA3
NzUwLy01Njk2ICgyMDU0KSBkdWUgdG8gbGVzcyBlZmZpY2llbnQgYXJpdGhtZXRpY1sxXSksIHRo
ZQo+ID4+IGZyYW10YWJsZSBoYXMgYSBmaXhlZCB2aXJ0dWFsIHNpemUgKDEyOEcgYnkgZGVmYXVs
dCksIHNvIHlvdSd2ZSBlbmRlZCB1cAo+ID4+IGRyb3BwaW5nIFhlbidzIG1lbW9yeSBsaW1pdCAo
MTZUQiBieSBkZWZhdWx0KSBieSAxLzMuCj4gPgo+ID4gSW50ZXJlc3RpbmcsIEknbSBub3Qgc3Vy
ZSBJIGNvbXBsZXRlbHkgZm9sbG93IGJ1dCBkb2VzIHRoaXMgbWVhbiB0aGF0Cj4gPiB0aGlzIHN0
cnVjdHVyZSBpcyBub3cgbm90IGFsbG93ZWQgdG8gZ3JvdywgbGlrZSBldmVyLCBvciB0aGF0IEkg
anVzdAo+ID4gbmVlZCB0byBhZGQgcGFkZGluZyB0byBmaXggdXAgaXRzIGFsaWdubWVudD8KPgo+
IEluIGFkZGl0aW9uIHRvIHdoYXQgQW5kcmV3IGhhcyBzYWlkLCBhbHNvIG5vdGljZSBob3cgd2Un
dmUgZ29uZQo+IHRocm91Z2ggZXh0cmEgaG9vcHMgdG8gYXZvaWQgZ3Jvd2luZyB0aGUgc3RydWN0
dXJlIGluIHRoZSBjb250ZXh0Cj4gb2YgWFNBLTI4MC4KCkxvb2tzIHRvIG1lIGF0IHRoaXMgcG9p
bnQgSSB3b24ndCBiZSBhYmxlIHRvIHJlcGxhY2UgdXNpbmcKcGFnZV9sb2NrL3BhZ2VfdW5sb2Nr
IHdpdGggYSBzZXBhcmF0ZSBsb2NrIGluIGEgbWVhbmluZ2Z1bCB3YXkuCgpUYW1hcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
