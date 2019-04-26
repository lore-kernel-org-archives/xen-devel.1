From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
Date: Fri, 26 Apr 2019 06:24:03 -0600
Message-ID: <CABfawh=fLVp+b-K_Que5UEDDzMoYysEtVP8itb+cWoXAJdToSA@mail.gmail.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
 <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jv+f=S4=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJzuM-0002cP-UN
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 12:24:51 +0000
Received: by mail-wm1-f52.google.com with SMTP id n25so4131108wmk.4
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2019 05:24:40 -0700 (PDT)
In-Reply-To: <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
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

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMzoyNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDI2LjA0LjE5IGF0IDAyOjEyLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBJIHdvdWxkIGJlIE9LIHdpdGggcHV0dGluZyB0aGUgd2hvbGUg
dGhpbmcgYmVoaW5kCj4gPiBDT05GSUdfSEFTX01FTV9TSEFSSU5HIGFuZCBoYXZpbmcgdGhhdCBi
ZSBvZmYgYnkgZGVmYXVsdC4gSXMgdGhhdCBhCj4gPiBmZWFzaWJsZSByb3V0ZSBmcm9tIHlvdXIg
UE9WPwo+Cj4gU28gaXMgdGhlcmUgYW55dGhpbmcgd3Jvbmcgd2l0aCBteSBlYXJsaWVyIHN1Z2dl
c3Rpb24gb2YKPiByZS1wdXJwb3NpbmcgdGhlIHNoYXJpbmcgZmllbGQgdG8gYXR0YWNoIGEgc3Ry
dWN0dXJlIHRvIHRoZSBwYWdlCj4gd2hpY2ggY29udGFpbnMgdGhlIG5lY2Vzc2FyeSBsb2NrPyBJ
LmUuIGluIHRoZSBzaW1wbGVzdCBjYXNlIGJ5Cj4gYWRkaW5nIHRoZSBsb2NrIHRvIHN0cnVjdCBw
YWdlX3NoYXJpbmdfaW5mbyBpdHNlbGY/CgpZZXMsIHRoYXQgd29uJ3Qgd29yayB1bmZvcnR1bmF0
ZWx5LiBUaGUgbG9jayBpcyBzdXBwb3NlZCB0byBwcm90ZWN0CnVwZGF0ZXMgbWFkZSB0byB0aGUg
c3RydWN0dXJlIGJ1dCBhbHNvIGZyZWVpbmcgaXQuIElmIHRoZSBsb2NrIGxpdmVzCndpdGhpbiB0
aGUgc3RydWN0dXJlIGl0IG9idmlvdXNseSB3b3VsZCBoYXZlIHRvIGJlIHVubG9ja2VkIGJlZm9y
ZSBpdHMKZnJlZWQsIGJ1dCBpZiBpdHMgdW5sb2NrZWQgYmVmb3JlIGZyZWVkIHRoZW4gYW5vdGhl
ciB0aHJlYWQgd2FpdGluZyBvbgppdCBjb3VsZCBjb250aW51ZSB3aXRob3V0IHJlYWxpemluZyBp
dCBpcyBiZWluZyBmcmVlZC4KCj4KPiBBcyB0byB5b3VyIHF1ZXN0aW9uIGFib3ZlIC0gdGhhdCB3
b3VsZCBiZSBhbm90aGVyIG9wdGlvbiwgb2YKPiBjb3Vyc2Ugd2l0aCB0aGUgY29uZmlnIG9wdGlv
biBnZXR0aW5nIGl0cyBIQVNfIHBhcnQgZHJvcHBlZC4KPiBQb3NzaWJseSBpdCBjb3VsZCB0aGVu
IGV2ZW4gZGVmYXVsdCB0byBlbmFibGVkIHdoZW4gQklHTUVNPXkuCj4gQnV0IHlvdSByZWFsaXpl
IHRoYXQgYnkgZ29pbmcgdGhpcyByb3V0ZSB5b3UgZnVydGhlciBpbmNyZWFzZQo+IHRoZSByaXNr
IG9mIGNoYW5nZXMgZWxzZXdoZXJlIGJyZWFraW5nIG1lbS1zaGFyaW5nIHdpdGhvdXQKPiBhbnlv
bmUgbm90aWNpbmcgcmlnaHQgYXdheT8KCkkgZG8gcmVhbGl6ZSB0aGF0IGJ1dCBjb25zaWRlcmlu
ZyBob3cgbXVjaCBicmVha2FnZSBoYXBwZW5lZCB0bwptZW1zaGFyaW5nIHdpdGggaXQgZW5hYmxl
ZCwgSSBkb24ndCB0aGluayBpdCBtYWtlcyBtdWNoIGRpZmZlcmVuY2UuCldpdGhvdXQgaGF2aW5n
IGFueSB0ZXN0cyBpbiB0aGUgQ0kgc3lzdGVtIHRoZSBjb21waWxlLXRlc3RpbmcgaXRzZWxmCmlz
IG5vdCBzdWZmaWNpZW50LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
