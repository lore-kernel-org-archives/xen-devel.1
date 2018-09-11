From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: xpti=dom0=false doesn't seem to work on 4.8.4
Date: Tue, 11 Sep 2018 02:07:30 -0600
Message-ID: <5B9777C202000078001E705A@prv1-mh.provo.novell.com>
References: <CAAzNQHSU6x9Tp9kRx65Q8sZ2wEm4QcLyNgT_40gBia+=ShsmjQ@mail.gmail.com>
 <5B4C67C402000078001D43AD@prv1-mh.provo.novell.com>
 <CAAzNQHQxPXL+fFZMtE6c4CHAiet6FF=E=TUAC6U_i4cyGB8w3Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzdhw-0004n8-5p
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 08:07:36 +0000
In-Reply-To: <CAAzNQHQxPXL+fFZMtE6c4CHAiet6FF=E=TUAC6U_i4cyGB8w3Q@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Karl Johnson <karljohnson.it@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA5LjE4IGF0IDE4OjQwLCA8a2FybGpvaG5zb24uaXRAZ21haWwuY29tPiB3cm90
ZToKPiBPbiBNb24sIEp1bCAxNiwgMjAxOCBhdCA1OjM5IEFNIEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cj4gCj4+ID4+PiBPbiAxMy4wNy4xOCBhdCAyMDo1NCwgPGthcmxq
b2huc29uLml0QGdtYWlsLmNvbT4gd3JvdGU6Cj4+ID4gSGVsbG8sCj4+ID4KPj4gPiBJJ20gY3Vy
cmVudGx5IHRlc3RpbmcgbGFzdCBYZW4gNC44LjQgYnVpbGQgZm9yIENlbnRPUwo+PiA+IChodHRw
Oi8vY2JzLmNlbnRvcy5vcmcva29qaS9idWlsZGluZm8/YnVpbGRJRD0yMzE2OSkgYW5kIGRpc2Fi
bGluZwo+PiA+IFhQVEkgZm9yIGRvbTAgZG9lc24ndCBzZWVtIHRvIHdvcms6Cj4+ID4KPj4gPiAo
WEVOKSBDb21tYW5kIGxpbmU6IGRvbTBfbWVtPTE3OTJNLG1heDoyMDQ4TSBkb20wX21heF92Y3B1
cz00IGNwdWluZm8KPj4gPiBjb20xPTExNTIwMCw4bjEgY29uc29sZT1jb20xLHZnYSB4cHRpPWRv
bTA9ZmFsc2UgbG9nbHZsPWFsbAo+PiA+IGd1ZXN0X2xvZ2x2bD1hbGwgY3Jhc2hrZXJuZWw9NTEy
TUA2NE0KPj4gPgo+PiA+IChYRU4pICAgWFBUSSAoNjQtYml0IFBWIG9ubHkpOiBEb20wIGVuYWJs
ZWQsIERvbVUgZW5hYmxlZAo+PiA+Cj4+ID4gQnVnIG9yIHdyb25nIHN5bnRheD8KPj4KPj4gQnVn
IC0gc2VlCj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOC0wNy9tc2cwMTMwNS5odG1sIAo+PiAuCj4+Cj4+IEFsdGVybmF0aXZlbHkgeW91
IGNvdWxkIHVzZSAieHB0aT1uby1kb20wIiBvciAoSSB0aGluaykgInhwdGk9ZG9tMD1mYWxzZSwi
Lgo+IAo+IElzIHhwdGkgY29tbWFuZCBsaW5lIGJyb2tlbiBhZ2FpbiBvbiA0Ljg/IEkndmUgdXBn
cmFkZWQgdG8gcGFja2FnZQo+IHhlbi00LjguNC40My5nZTUyZWM0Yjc4Ny0xIHdoaWNoIGlzIGJh
c2VkIG9uIGxhdGVzdCBzdGFnaW5nIHNuYXBzaG90IGFuZAo+IHhwdGk9bm8tZG9tMCBub3cgc2Vl
bXMgdG8gZGlzYWJsZSBYUFRJIGZvciBkb21VOgo+IAo+IFtyb290QG5vZGUtdG1wMSB+XSMgeGwg
ZG1lc2d8Z3JlcCAtaSB4cHRpCj4gKFhFTikgQ29tbWFuZCBsaW5lOiBkb20wX21lbT0xNzkyTSxt
YXg6MjA0OE0gZG9tMF9tYXhfdmNwdXM9NCBjcHVpbmZvCj4gY29tMT0xMTUyMDAsOG4xIGNvbnNv
bGU9Y29tMSx2Z2EgeHB0aT1uby1kb20wIGNyYXNoa2VybmVsPTUxMk1ANjRNCj4gbG9nbHZsPWFs
bCBndWVzdF9sb2dsdmw9YWxsCj4gKFhFTikgICBYUFRJICg2NC1iaXQgUFYgb25seSk6IERvbTAg
ZGlzYWJsZWQsIERvbVUgZGlzYWJsZWQKClN0aWxsIGEgYnVnLCBzZWUKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTA4L21zZzAxNzQyLmh0
bWwKSSB3YXMgaG9waW5nIHRvIGhhdmUgdGhpcyBjb21taXR0ZWQgcXVpdGUgc29tZSB0aW1lIGFn
bywgYnV0CkFuZHJldyBpc24ndCByZWFsbHkgaGFwcHkgd2l0aCBpdCBwbHVzIHRoZSBkaXNjdXNz
aW9uIGxvb2tzIHRvIGJlCnN0YWxsZWQgcmlnaHQgbm93LgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
