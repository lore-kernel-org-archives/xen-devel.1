From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v5 2/9] x86/vioapic: block
 speculative out-of-bound accesses
Date: Fri, 1 Feb 2019 14:54:12 +0100
Message-ID: <f5e922ba-e676-6559-d1d0-a05772b50ba4@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-3-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <00FA27AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C531CB60200007800212DC6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jx5g=QI=amazon.de=prvs=928388056=nmanthey@srs-us1.protection.inumbo.net>)
 id 1gpZH2-0003Od-23
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 13:54:28 +0000
In-Reply-To: <5C531CB60200007800212DC6@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

T24gMS8zMS8xOSAxNzowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjkuMDEuMTkgYXQg
MTU6NDMsIDxubWFudGhleUBhbWF6b24uZGU+IHdyb3RlOgo+PiBXaGVuIGludGVyYWN0aW5nIHdp
dGggaW8gYXBpYywgYSBndWVzdCBjYW4gc3BlY2lmeSB2YWx1ZXMgdGhhdCBhcmUgdXNlZAo+PiBh
cyBpbmRleCB0byBzdHJ1Y3R1cmVzLCBhbmQgd2hvc2UgdmFsdWVzIGFyZSBub3QgY29tcGFyZWQg
YWdhaW5zdAo+PiB1cHBlciBib3VuZHMgdG8gcHJldmVudCBzcGVjdWxhdGl2ZSBvdXQtb2YtYm91
bmQgYWNjZXNzZXMuIFRoaXMgY2hhbmdlCj4+IHByZXZlbnRzIHRoZXNlIHNwZWN1bGF0aXZlIGFj
Y2Vzc2VzLgo+Pgo+PiBGdXJ0aGVybW9yZSwgdHdvIHZhcmlhYmxlcyBhcmUgaW5pdGlhbGl6ZWQg
YW5kIHRoZSBjb21waWxlciBpcyBhc2tlZCB0bwo+PiBub3Qgb3B0aW1pemVkIHRoZXNlIGluaXRp
YWxpemF0aW9ucywgYXMgdGhlIHVuaW5pdGlhbGl6ZWQsIHBvdGVudGlhbGx5Cj4+IGd1ZXN0IGNv
bnRyb2xsZWQsIHZhcmlhYmxlcyBtaWdodCBiZSB1c2VkIGluIGEgc3BlY3VsYXRpdmUgb3V0LW9m
LWJvdW5kCj4+IGFjY2Vzcy4gQXMgdGhlIHR3byBwcm9ibGVtYXRpYyB2YXJpYWJsZXMgYXJlIGJv
dGggdXNlZCBpbiB0aGUgY29tbW9uCj4+IGZ1bmN0aW9uIGdzaV92aW9hcGljLCB0aGUgbWl0aWdh
dGlvbiBpcyBpbXBsZW1lbnRlZCB0aGVyZS4gQ3VycmVudGx5LAo+PiB0aGUgcHJvYmxlbWF0aWMg
Y2FsbGVycyBhcmUgdGhlIGZ1bmN0aW9ucyB2aW9hcGljX2lycV9wb3NpdGl2ZV9lZGdlIGFuZAo+
PiB2aW9hcGljX2dldF90cmlnZ2VyX21vZGUuCj4gSSB3b3VsZCBoYXZlIHdpc2hlZCBmb3IgeW91
IHRvIHNheSB3aHkgdGhlIG90aGVyIHR3byBhcmUgX25vdF8KPiBhIHByb2JsZW0uIEFmYWljdCBp
biBib3RoIGNhc2VzIHRoZSBmdW5jdGlvbnMgb25seSBldmVyIGdldAo+IGludGVybmFsIGRhdGEg
cGFzc2VkLgo+Cj4gVGhlbiBhZ2FpbiBJJ20gbm90IGNvbnZpbmNlZCBpdCdzIHdvcnRoIHRha2lu
ZyB0aGUgcmlzayB0aGF0IGEKPiBwcm9ibGVtYXRpYyBjYWxsZXIgZ2V0cyBhZGRlZCBkb3duIHRo
ZSByb2FkLiBIb3cgYWJvdXQgeW91IGFkZAo+IGluaXRpYWxpemVycyBldmVyeXdoZXJlLCBjbGFy
aWZ5aW5nIGluIHRoZSBkZXNjcmlwdGlvbiB0aGF0IGl0J3MgImp1c3QKPiBpbiBjYXNlIiBmb3Ig
dGhlIHR3byBjdXJyZW50bHkgc2FmZSBvbmVzPwpJIHdpbGwgYWRkIHRoZSBvdGhlciBpbml0aWFs
aXphdGlvbiBhbmQgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZS4KPgo+PiBUaGlzIGNvbW1pdCBp
cyBwYXJ0IG9mIHRoZSBTcGVjdHJlVjErTDFURiBtaXRpZ2F0aW9uIHBhdGNoIHNlcmllcy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogTm9yYmVydCBNYW50aGV5IDxubWFudGhleUBhbWF6b24uZGU+Cj4+
Cj4+IC0tLQo+IEJ0dy4sIGNvdWxkIHlvdSBwbGVhc2UgZ2V0IHVzZWQgdG8gdGhlIGhhYml0IG9m
IGFkZGluZyBhIGJyaWVmCj4gc3VtbWFyeSBvZiBjaGFuZ2VzIGZvciBhdCBsZWFzdCB0aGUgbW9z
dCByZWNlbnQgdmVyc2lvbiBoZXJlLAo+IHdoaWNoIGFpZHMgcmV2aWV3IHF1aXRlIGEgYml0PwpJ
IHdpbGwgc3RhcnQgdG8gZG8gdGhpcyB3aXRoIHRoZSBuZXh0IHZlcnNpb24uCj4KPj4gQEAgLTIx
Miw3ICsyMjAsMTUgQEAgc3RhdGljIHZvaWQgdmlvYXBpY193cml0ZV9yZWRpcmVudCgKPj4gICAg
ICBzdHJ1Y3QgaHZtX2lycSAqaHZtX2lycSA9IGh2bV9kb21haW5faXJxKGQpOwo+PiAgICAgIHVu
aW9uIHZpb2FwaWNfcmVkaXJfZW50cnkgKnBlbnQsIGVudDsKPj4gICAgICBpbnQgdW5tYXNrZWQg
PSAwOwo+PiAtICAgIHVuc2lnbmVkIGludCBnc2kgPSB2aW9hcGljLT5iYXNlX2dzaSArIGlkeDsK
Pj4gKyAgICB1bnNpZ25lZCBpbnQgZ3NpOwo+PiArCj4+ICsgICAgLyogQ2FsbGVycyBvZiB0aGlz
IGZ1bmN0aW9uIHNob3VsZCBtYWtlIHN1cmUgaWR4IGlzIGJvdW5kZWQgYXBwcm9wcmlhdGVseSov
Cj4gTWlzc2luZyBibGFuayBhdCB0aGUgZW5kIG9mIHRoZSBjb21tZW50ICh3aGljaCwgaWYgdGhp
cyB3YXMgdGhlCj4gb25seSBvcGVuIHBvaW50LCB3b3VsZCBiZSBlYXN5IGVub3VnaCB0byBhZGp1
c3Qgd2hpbGUgY29tbWl0dGluZykuCgpXaWxsIGZpeC4KCkJlc3QsCk5vcmJlcnQKCj4KPiBKYW4K
Pgo+CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIu
IDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJlcjogQ2hyaXN0aWFuIFNjaGxhZWdlciwg
UmFsZiBIZXJicmljaApVc3QtSUQ6IERFIDI4OSAyMzcgODc5CkVpbmdldHJhZ2VuIGFtIEFtdHNn
ZXJpY2h0IENoYXJsb3R0ZW5idXJnIEhSQiAxNDkxNzMgQgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
