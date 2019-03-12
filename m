From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH L1TF v9 7/7] common/grant_table: block
 speculative out-of-bound accesses
Date: Tue, 12 Mar 2019 06:57:20 -0600
Message-ID: <5C87ACB0020000780021DB8A@prv1-mh.provo.novell.com>
References: <1551284020-7050-1-git-send-email-nmanthey@amazon.de>
 <1551284020-7050-8-git-send-email-nmanthey@amazon.de>
 <5C7EA60D020000780021BD0A@prv1-mh.provo.novell.com>
 <e25bd94e-8835-1b17-0eaf-115fae81fc5c@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rfzp=RP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h3gyC-0007WF-Qj
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 12:57:24 +0000
In-Reply-To: <e25bd94e-8835-1b17-0eaf-115fae81fc5c@amazon.de>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: nmanthey@amazon.de
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>, Martin Pohlack <mpohlack@amazon.de>, wipawel@amazon.de, Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>, "Martin Mazein(amazein)" <amazein@amazon.de>, xen-devel <xen-devel@lists.xenproject.org>, Julian Stecklina <jsteckli@amazon.de>, Bjoern Doebel <doebel@amazon.de>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAzLjE5IGF0IDExOjM2LCA8bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToKPiBP
biAzLzUvMTkgMTc6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNy4wMi4xOSBhdCAx
NzoxMywgPG5tYW50aGV5QGFtYXpvbi5kZT4gd3JvdGU6Cj4+PiBTcGVjdWxhdGl2ZSBleGVjdXRp
b24gaXMgbm90IGJsb2NrZWQgaW4gY2FzZSBvbmUgb2YgdGhlIGZvbGxvd2luZwo+Pj4gcHJvcGVy
dGllcyBpcyB0cnVlOgo+Pj4gIC0gcGF0aCBjYW5ub3QgYmUgdHJpZ2dlcmVkIGJ5IHRoZSBndWVz
dAo+Pj4gIC0gcGF0aCBkb2VzIG5vdCByZXR1cm4gdG8gdGhlIGd1ZXN0Cj4+PiAgLSBwYXRoIGRv
ZXMgbm90IHJlc3VsdCBpbiBhbiBvdXQtb2YtYm91bmQgYWNjZXNzCj4+PiAgLSBwYXRoIGNhbm5v
dCBiZSBleGVjdXRlZCByZXBlYXRlZGx5Cj4+PiBPbmx5IHRoZSBjb21iaW5hdGlvbiBvZiB0aGUg
YWJvdmUgcHJvcGVydGllcyBhbGxvd3MgdG8gYWN0dWFsbHkgbGVhawo+Pj4gY29udGludW91cyBj
aHVua3Mgb2YgbWVtb3J5LiBUaGVyZWZvcmUsIHdlIG9ubHkgYWRkIHRoZSBwZW5hbHR5IG9mCj4+
PiBwcm90ZWN0aXZlIG1lY2hhbmlzbXMgaW4gY2FzZSBhIHBvdGVudGlhbCBzcGVjdWxhdGl2ZSBv
dXQtb2YtYm91bmQKPj4+IGFjY2VzcyBtYXRjaGVzIGFsbCB0aGUgYWJvdmUgcHJvcGVydGllcy4K
Pj4gV2hpbGUgdGhpcyBpcyBhbGwgZmluZSwgaG93IGRvIEkgbWF0Y2ggd2hpY2ggb2YgdGhlIHJl
YXNvbnMgYXBwbGllcyB0bwo+PiB3aGljaCBvZiAoaW4gcGFydGljdWxhcikgdGhlIGd0X3ZlcnNp
b24gY2hlY2tzIGxlZnQgYWxvbmU/IEFzIHNhaWQsIHRoZQo+PiByZWFzb25pbmcgaGVyZSBzaG91
bGQgc3BlY2lmaWNhbGx5IGJlIGRldGFpbGVkIHNvIGl0IGNhbiBiZSB1c2VkIGFzIGEKPj4gZ3Vp
ZGluZyByZWZlcmVuY2Ugd2hlbiBhZGRpbmcgZnVydGhlciBjb25kaXRpb25hbHMgdG8gdGhlIGNv
ZGUgZG93bgo+PiB0aGUgcm9hZC4gQW5kIG9mIGNvdXJzZSByZXZpZXcgaXMgKG1vcmUpIGRpZmZp
Y3VsdCB0aGlzIHdheSBhcyB3ZWxsLCBhcwo+PiAoanVkZ2luZyBmcm9tIHByaW9yIGNvbnZlcnNh
dGlvbnMpIHdlIGRvbid0IHNlZW0gdG8gbmVjZXNzYXJpbHkKPj4gYWdyZWUgaW4gb3VyIHZpZXdz
IGluIGFsbCBwbGFjZXMsIGFuZCBoZW5jZSB0byBkaXNjdXNzIGEgcG9zc2libHkKPj4gcXVlc3Rp
b25hYmxlIGRlY2lzaW9uIG90aGVycyBhbHNvIG5lZWQgdG8gdW5kZXJzdGFuZCB3aGljaCBvZiB0
aGUKPj4gY3JpdGVyaWEgeW91IGNvbnNpZGVyZWQgdG8gbWF0Y2ggaW4gdGhlIHNwZWNpZmljIGNh
c2UuCj4gCj4gSSBsaXN0ZWQgdGhlIHJlYXNvbnMgdG8gdXNlIGFib3ZlIChhbmQgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlKS4gSSB3aWxsCj4gZXh0ZW5kIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgZ2l2
ZSBhIHJlYXNvbiBmb3IgZWFjaCB2ZXJzaW9uIGNvbXBhcmlzb24sCj4gc2ltaWxhcmx5IHRvIGEg
cHJpb3IgZW1haWwgSSBzZW50Lgo+IAo+IEluIG15IG9waW5pb24sIHRoZSBjb21taXQgbWVzc2Fn
ZSBmb3IgZml4aW5nIHRoZSBwcm9ibGVtcyB3ZSBmb3VuZCBpbgo+IHRoYXQgZmlsZSBzaG91bGQg
bm90IGJlIGEgdHV0b3JpYWwgb24gaG93IHRvIGlkZW50aWZ5IGFuZCBmaXggcG90ZW50aWFsCj4g
c3BlY3VsYXRpdmUgb3V0LW9mLWJvdW5kIGFjY2Vzc2VzLiBXaGlsZSBJIGFncmVlIHRoYXQgdGVh
Y2hpbmcgbW9yZQo+IHBlb3BsZSBob3cgdG8ganVkZ2Ugd2hldGhlciBhIGNlcnRhaW4gcGllY2Ug
b2YgY29kZSBtaWdodCBsZWFkIHRvCj4gaW5mb3JtYXRpb24gbGVhayB2aWEgc3BlY3VsYXRpdmUg
ZXhlY3V0aW9uLCBJIHdvdWxkIG5vdCB1c2UgYSBjb21taXQKPiBtZXNzYWdlIHRvIGdldCB0aGF0
IGNvdmVyZWQuCgpBbmQgdGhhdCBhbHNvIHdhc24ndCBteSBsaW5lIG9mIGFyZ3VtZW50YXRpb24u
IEFsbCBJJ20gYWZ0ZXIgaXMgYXMgZ29vZApvZiBhIGd1aWRlbGluZSBhcyBwb3NzaWJsZSBmb3Ig
aG93IHRvIGRlYWwgd2l0aCBmdXR1cmUgbmV3IHZlcnNpb24KZGVwZW5kZW50IGNvZGUgaW4gZ3Jh
bnRfdGFibGUuYy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
