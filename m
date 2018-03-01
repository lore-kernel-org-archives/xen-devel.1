From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: get_page_from_gfn() for foreign pages
Date: Thu, 1 Mar 2018 16:06:11 +0000
Message-ID: <62cc97efe1754d48ba1c3c5d49897e9f@AMSPEX02CL03.citrite.net>
References: <0c720c97bfdd476695368cd777576e0d@AMSPEX02CL03.citrite.net>
 <5A98158702000078001AD5E6@prv-mh.provo.novell.com>
 <1208931795b34f66b196dcfe29190748@AMSPEX02CL03.citrite.net>
 <5A981CE302000078001AD66C@prv-mh.provo.novell.com>
 <abf2f4c74129475a9fca5e4a8e02278e@AMSPEX02CL03.citrite.net>
 <5A982F2702000078001AD744@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=s+6d=fx=citrix.com=prvs=591d9ebe8=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1erQkn-0008Ab-Ad
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 16:08:21 +0000
In-Reply-To: <5A982F2702000078001AD744@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: "xen-devel (xen-devel@lists.xenproject.org)" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+PiBBbmQgdGhlbiB5b3UgZGlk
bid0IHJlYWxseSBhbnN3ZXIgbXkgcXVlc3Rpb24uCj4gPgo+ID4gV2VsbCwgeW91IGNhbid0IHJl
dm9rZSBhIGdyYW50IHdoaXN0IGEgYmFja2VuZCBoYXMgaXQgbWFwcGVkLi4uIHRoYXQncyBiZWVu
Cj4gPiBhIGxpbWl0YXRpb24gZm9yZXZlci4gQWxzbywgSSB0aGluayBpdCdzIHJlYXNvbmFibGUg
dGhhdCBncmFudGluZyB0byBhIGRvbWFpbgo+ID4gQSBhbGxvd3MgZG9tYWluIEEgKmFuZCogYW55
IG90aGVyIGRvbWFpbiB3aXRoIG1hcHBpbmcgcHJpdmlsZWdlIG92ZXIKPiBkb21haW4gQQo+ID4g
dG8gYWNjZXNzIHRoYXQgcGFnZS4gSSBkb24ndCB0aGluayB0aGVyZSdzIHJlYWxseSBhbnkgZXhw
ZWN0YXRpb24gaW4gdGhlCj4gPiBncmFudCBpbnRlcmZhY2UgdGhhdCBncmFudGluZyB0byBvbmx5
IHRoYXQgZG9tYWluLi4uIGZyb250ZW5kcyBoYXZlIHRvIHRydXN0Cj4gPiBiYWNrZW5kcyBhbmQg
aWYgdGhlIGJhY2tlbmQgZ3JhbnRzIGl0IG9uIHRoZW4gc28gYmUgaXQuIFRoYXQncyBjZXJ0YWlu
bHkgdGhlCj4gPiBsZXZlbCBvZiB0cnVzdCB0aGF0J3MgYmVlbiBpbiBwbGFjZSBzaW5jZSB2MiBh
bmQgQUZBSUsgbm8tb25lIGlzIHVuaGFwcHkKPiBhYm91dAo+ID4gdGhhdC4KPiAKPiBBbGwgdHJ1
ZSwgYnV0IHdoYXQgeW91IHdhbnQgdG8gZG8gaGVyZSBpcyBhIG1hcHBpbmcgb3V0c2lkZSBvZgo+
IHdoYXQgZ3JhbnRfdGFibGUuYyBjb250cm9scyBhbmQgcHJvdmlkZXMuIFlldCBmb3IgdGhlIHBh
Z2Ugb3duZXIKPiB0byBrbm93IHdoZW4gYSBncmFudCBpcyBmaW5lIHRvIHJldm9rZSwgc3VjaCBv
YnRhaW5pbmcgb2YgZXh0cmEKPiByZWZlcmVuY2VzIHdvdWxkIG5lZWQgdG8gYmUgdHJhY2tlZC4K
PiAKCkFoIHllcywgdGhhdCdzIGEgYml0IGduYXJseS4gSSdsbCBoYXZlIHRvIHRyeSB0byBmaWd1
cmUgb3V0IHdoYXQgY2FuIGJlIGRvbmUgdGhlcmUuCgogIFBhdWwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
