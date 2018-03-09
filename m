From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 12/16] xen/mm: Switch common/memory.c to
 use typesafe MFN
Date: Fri, 9 Mar 2018 17:33:58 +0000
Message-ID: <20180309173358.x6lem53h3jkcfr7j@citrix.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-13-julien.grall@arm.com>
 <5A997D2202000078001ADE90@prv-mh.provo.novell.com>
 <8a879538-9206-cc79-2951-69f89f53dbc1@arm.com>
 <5A9D654202000078001AE983@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5A9D654202000078001AE983@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDc6NDE6NTRBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjAzLjE4IGF0IDE1OjE4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdy
b3RlOgo+ID4gT24gMDIvMDMvMTggMTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4+IE9u
IDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4+PiBA
QCAtOTUsMTEgKzEwMSwxOCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IG1heF9vcmRlcihjb25zdCBz
dHJ1Y3QgZG9tYWluICpkKQo+ID4+PiAgICAgICByZXR1cm4gbWluKG9yZGVyLCBNQVhfT1JERVIg
KyAwVSk7Cj4gPj4+ICAgfQo+ID4+PiAgIAo+ID4+PiArLyogSGVscGVyIHRvIGNvcHkgYSB0eXBl
c2FmZSBNRk4gdG8gZ3Vlc3QgKi8KPiA+Pj4gKyNkZWZpbmUgY29weV9tZm5fdG9fZ3Vlc3QoaG5k
LCBvZmYsIG1mbikgICAgICAgICAgICBcCj4gPj4+ICsgICAgKHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4+PiArICAgICAgICB4ZW5fcGZuX3QgbWZu
XyA9IG1mbl94KG1mbik7ICAgICAgICAgICAgICAgIFwKPiA+Pj4gKyAgICAgICAgX19jb3B5X3Rv
X2d1ZXN0X29mZnNldChobmQsIG9mZiwgJm1mbl8sIDEpOyBcCj4gPj4+ICsgICAgfSkKPiA+PiAK
PiA+PiBIbW0sIG5vdCByZWFsbHkgbmljZSwgYnV0IHdoYXQgZG8geW91IGRvLgo+ID4gCj4gPiBJ
IGFtIG9wZW4gdG8gYmV0dGVyIHN1Z2dlc3Rpb24uIEkgd2FudGVkIHRvIGF2b2lkIHRoZSBjb252
ZXJzaW9uIGFsbCAKPiA+IG92ZXIgdGhlIGNvZGUuCj4gCj4gSSBoYXZlIG5vIGJldHRlciBzdWdn
ZXN0aW9uLCBJJ20gc29ycnksIGhlbmNlIHRoZSAiYnV0IHdoYXQgZG8KPiB5b3UgZG8uIgo+IAo+
ID4gQWxzbywgZG8geW91IGhhdmUgYW4gb3BpbmlvbiBvbiBXZWkncyBzdWdnZXN0aW9uOgo+ID4g
Cj4gPiAiV2hhdCBJIG1lYW50IHdhcyB0byBtYWtlIGNvcHlfe3RvLGZyb219X2d1ZXN0KiB0eXBl
LXNhZmUuIEkganVzdCBmZWVsIGl0Cj4gPiBhIGJpdCBzdHJhbmdlIHlvdSBvbmx5IGNyZWF0ZWQg
YSB3cmFwcGVyIGZvciB0aGlzIGZpbGUuIEkgd29uZGVyIHdoeS4KPiA+IAo+ID4gTm90ZSBJJ20g
anVzdCBhc2tpbmcgcXVlc3Rpb24uIFRoYXQncyBub3QgbmVjZXNzYXJpbHkgYSBnb29kIGlkZWEg
dG8KPiA+IHR1cm4gdGhlbSBhbGwgaW4gdGhlIGVuZC4iCj4gCj4gV2VsbCwgSSBkaWRuJ3QgcmVh
bGx5IHVuZGVyc3RhbmQgd2hhdCBoZSdzIGFmdGVyIChpbiB0aGUgY29udGV4dCBvZgo+IHRoaXMg
c2VyaWVzKSAtIGNvcHlfe3RvLGZyb219X2d1ZXN0KCkgZG9uJ3QgdGFrZSBvciByZXR1cm4gTUZO
cyBvcgo+IEdGTnMuCj4gCgpGdW5kYW1lbnRhbGx5IEp1bGllbidzIHBhdGNoIGlzIHRvIHdyYXAg
YXJvdW5kIGFuIGV4aXN0aW5nIEFQSSBmb3IgdGhpcwpvbmUgZmlsZSBvbmx5LiBXaHkgaXMgdGhp
cyBmaWxlIHNwZWNpYWw/IFdoeSBub3QganVzdCBtYWtlIHRoYXQgY2xhc3Mgb2YKQVBJcyBkbyB3
aGF0IGhlIHdhbnRzPwoKQnV0IHRoYXQgaXMgZ29pbmcgdG8gYmUgaW50cnVzaXZlIGFuZCBhIGJp
dCBjb3VudGVyLWludHVpdGl2ZS4KCihJbiB0aGUgc3Bpcml0IG9mIHVuYmxvY2tpbmcgdGhpbmdz
LCBJIHdvbid0IGluc2lzdCBtYWtpbmcgc3VjaCBjaGFuZ2UuKQoKV2VpLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
