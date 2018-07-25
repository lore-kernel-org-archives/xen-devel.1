From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/mm: Add mem access rights to NPT
Date: Wed, 25 Jul 2018 04:37:40 -0600
Message-ID: <5B5852F402000078001D79E9@prv1-mh.provo.novell.com>
References: <1532353689-2242-1-git-send-email-aisaila@bitdefender.com>
 <5B56E99D02000078001D706B@prv1-mh.provo.novell.com>
 <31981fe5-90b4-9490-08d9-f58afc28b6b1@citrix.com>
 <5B57154C02000078001D72F6@prv1-mh.provo.novell.com>
 <9ad5e355-8d22-c67c-b803-46dc935fe47b@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9ad5e355-8d22-c67c-b803-46dc935fe47b@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: george.dunlap@citrix.com
Cc: tamas@tklengyel.com, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xen.org, aisaila@bitdefender.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA3LjE4IGF0IDExOjI1LCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAwNy8yNC8yMDE4IDAxOjAyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gT24g
MjQuMDcuMTggYXQgMTM6MjYsIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4g
T24gMDcvMjQvMjAxOCAwOTo1NSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+Pj4gT24gMjMu
MDcuMTggYXQgMTU6NDgsIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4+Pj4+ICsg
ICAgICAgIHsKPj4+Pj4gKyAgICAgICAgICAgIHhmcmVlKGQtPmFyY2gubW9uaXRvci5tc3JfYml0
bWFwKTsKPj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+Pj4+PiArICAgICAgICB9
Cj4+Pj4+ICsgICAgICAgIHJhZGl4X3RyZWVfaW5pdChwMm0tPm1lbV9hY2Nlc3Nfc2V0dGluZ3Mp
Owo+Pj4+PiArICAgIH0KPj4+Pgo+Pj4+IFdoYXQncyB0aGUgU1ZNIGNvbm5lY3Rpb24gaGVyZT8g
UGxlYXNlIGRvbid0IGZvcmdldCB0aGF0IHAybS1wdC5jCj4+Pj4gYWxzbyBzZXJ2ZXMgdGhlIHNo
YWRvdyBjYXNlLiBQZXJoYXBzIHN0cnVjdCBwMm1fZG9tYWluIHNob3VsZAo+Pj4+IGNvbnRhaW4g
YSBib29sZWFuIGluZGljYXRvciB3aGV0aGVyIHRoaXMgYXV4aWxpYXJ5IGRhdGEgc3RydWN0dXJl
IGlzCj4+Pj4gbmVlZGVkPwo+Pj4KPj4+IEl0J3MgYmFzaWNhbGx5IGp1c3QgImhhcF9lbmFibGVk
KCkiIGlzbid0IGl0Pwo+PiAKPj4gT25seSBpZiB3ZSBjYW4ndCBtYWtlIGl0IHRoZXJlIHdoZW4g
RVBUIGlzIGFjdGl2ZS4KPiAKPiBJdCBjYW4gbWFrZSBpdCBoZXJlIHdoZW4gVk1YIGlzIGFjdGl2
ZSBhbmQgc2hhZG93IGlzIGVuYWJsZWQsIGJ1dCBpdAo+IHNob3VsZG4ndCBiZSBhYmxlIHRvIGdl
dCBoZXJlIHdoZW4gRVBUIGlzIGFjdGl2ZS4gIFdlIGNvdWxkIGFkZCBhbgo+IEFTU0VSVCgpIHRv
IHRoYXQgZWZmZWN0OyBpdCBzaG91bGQgYmUgc2FmZSBpbiBwcm9kdWN0aW9uLCBhcyB0aGUgb25s
eQo+IHNpZGUgZWZmZWN0IHNob3VsZCBiZSB0aGF0IHdlIGRvIGEgc21hbGwgcG9pbnRsZXNzIGFs
bG9jYXRpb24uCgpTbyBJJ3ZlIGxvb2tlZCBhIGxpdHRsZSBtb3JlIGNsb3NlbHk6IFRoaXMgaXMg
YmVpbmcgYWRkZWQgdG8KYXJjaF9tb25pdG9yX2luaXRfZG9tYWluKCksIGNhbGxlZCBmcm9tIHZt
X2V2ZW50X2RvbWN0bCgpLiBJIGNhbid0CnNlZSB3aHkgdGhpcyB3b3VsZG4ndCBiZSByZWFjaGFi
bGUgd2l0aCBFUFQgZW5hYmxlZC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
