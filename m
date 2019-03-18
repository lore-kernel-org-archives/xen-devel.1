From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 10/11] viridian: add implementation of
 synthetic timers
Date: Mon, 18 Mar 2019 10:55:52 -0600
Message-ID: <5C8FCD98020000780021FFDF@prv1-mh.provo.novell.com>
References: <20190318112059.21910-1-paul.durrant@citrix.com>
 <20190318112059.21910-11-paul.durrant@citrix.com>
 <5C8FAA00020000780021FE95@prv1-mh.provo.novell.com>
 <f742ebef90204de1ac1044c100620a2b@AMSPEX02CL02.citrite.net>
 <6001528cc0ae46f481f156802d8bcdd4@AMSPEX02CL02.citrite.net>
 <5C8FC5CA020000780021FF9A@prv1-mh.provo.novell.com>
 <1e189269a57a4e818a219a33a56e52ee@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VMO2=RV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h5vYM-0004M5-SH
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 16:55:58 +0000
In-Reply-To: <1e189269a57a4e818a219a33a56e52ee@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAzLjE5IGF0IDE3OjI2LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBGcm9tOiBKYW4gQmV1bGljaCBbbWFpbHRvOkpCZXVsaWNoQHN1c2UuY29tXQo+PiBTZW50
OiAxOCBNYXJjaCAyMDE5IDE2OjIzCj4+IAo+PiA+Pj4gT24gMTguMDMuMTkgYXQgMTY6NDYsIDxQ
YXVsLkR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+ID4+ID4gPiArICAgIHsKPj4gPj4gPiA+
ICsgICAgICAgIGV4cGlyYXRpb24gPSB2cy0+Y291bnQ7Cj4+ID4+ID4gPiArICAgICAgICBpZiAo
IGV4cGlyYXRpb24gLSBub3cgPD0gMCApCj4+ID4+ID4gPiArICAgICAgICB7Cj4+ID4+ID4gPiAr
ICAgICAgICAgICAgdnMtPmV4cGlyYXRpb24gPSBleHBpcmF0aW9uOwo+PiA+PiA+ID4gKyAgICAg
ICAgICAgIHN0aW1lcl9leHBpcmUodnMpOwo+PiA+PiA+Cj4+ID4+ID4gQXJlbid0IHlvdSBpbnRy
b2R1Y2luZyBhIHJpc2sgZm9yIHJhY2VzIGJ5IGNhbGxpbmcgdGhlIHRpbWVyIGZ1bmN0aW9uCj4+
ID4+ID4gZGlyZWN0bHkgZnJvbSBoZXJlPyBzdGFydF90aW1lcigpLCBhZnRlciBhbGwsIGdldHMg
Y2FsbGVkIGZyb20gcXVpdGUgYQo+PiA+PiA+IGZldyBwbGFjZXMuCj4+ID4+Cj4+ID4+IEluIHBy
YWN0aWNlIEkgZG9uJ3QgdGhpbmsgdGhlcmUgc2hvdWxkIGJlIGFueSBwcm9ibGVtYXRpYyByYWNl
LCBidXQgSSdsbCBjaGVjayBhZ2Fpbi4KPj4gPgo+PiA+IEkgdGhpbmsgdGhlICdwZXJpb2RpYycg
bmFtZSBtaWdodCBiZSBjb25mdXNpbmcgdGhpbmdzLi4uIFRoZSBYZW4gdGltZXJzIGFyZQo+PiA+
IGFsbCBzaW5nbGUtc2hvdCwgaXQncyBqdXN0IHRoYXQgc3RhcnRfc3RpbWVyKCkgaXMgcmUtY2Fs
bGVkIGFmdGVyIGEKPj4gPiBzdWNjZXNzZnVsIHBvbGwgaWYgdGhlIHZpcmlkaWFuIHRpbWVyIGlz
IGNvbmZpZ3VyZWQgdG8gYmUgcGVyaW9kaWMuIFNvIEkKPj4gPiBkb24ndCB0aGluayB0aGVyZSBp
cyBjYXNlIHdoZXJlIHRoZSB1bmRlcmx5aW5nIFhlbiB0aW1lciBjb3VsZCBhY3R1YWxseSBiZQo+
PiA+IHJ1bm5pbmcgd2hlbiB3ZSBlbnRlciBzdGFydF9zdGltZXIoKS4KPj4gCj4+IE9uZSBvZiB0
aGUgY2FsbGVycyBvZiB0aGUgZnVuY3Rpb24gaXMgdGhlIFdSTVNSIGhhbmRsZXIuIFdoeSB3b3Vs
ZAo+PiBpdCBiZSBndWFyYW50ZWVkIHRoYXQgdGhlIHRpbWVyIGlzbid0IGFjdGl2ZSB3aGVuIHN1
Y2ggYSBXUk1TUgo+PiBvY2N1cnM/Cj4gCj4gSXQncyBub3QgZ3VhcmFudGVlZCBvbiBlbnRyeSwg
YnV0IHRoZSBXUk1TUiBoYW5kbGVyIGFsd2F5cyBjYWxscyAKPiBzdG9wX3N0aW1lcigpIGJlZm9y
ZSBjYWxsaW5nIHN0YXJ0X3N0aW1lcigpIHdoaWNoIEFGQUlDVCBzaG91bGQgZ3VhcmFudGVlIHRo
ZSAKPiB0aW1lciBpcyBub3QgcnVubmluZyB3aGVuIHN0YXJ0X3N0aW1lcigpIGlzIGNhbGxlZC4K
CkkndmUgbG9va2VkIG9ubHkgYnJpZWZseSwgYnV0IHRoZSBzdG9wX3RpbWVyKCkgLT4gZGVhY3Rp
dmF0ZV90aW1lcigpIGNhbGwKY2hhaW4gZG9lc24ndCBsb29rIHRvIHdhaXQgZm9yIHRoZSB0aW1l
ciBoYW5kbGVyIHRvIG5vdCBiZSBhY3RpdmUgYW55bW9yZQpvbiBhbm90aGVyIENQVSBiZWZvcmUg
cmV0dXJuaW5nLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
