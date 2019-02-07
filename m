From: Norbert Manthey <nmanthey@amazon.de>
Subject: Re: [PATCH SpectreV1+L1TF v5 8/9] common/grant_table:
 block speculative out-of-bound accesses
Date: Thu, 7 Feb 2019 11:20:23 +0100
Message-ID: <2dea3db6-6ea5-4d97-ba08-87017a10541d@amazon.de>
References: <c755dfdd-3c1e-5ccd-983f-11d0b35bb342@suse.com>
 <1548772997-32742-1-git-send-email-nmanthey@amazon.de>
 <1548772997-32742-9-git-send-email-nmanthey@amazon.de>
 <5C4ED1D402000078002119E6@prv1-mh.provo.novell.com>
 <9C03B9BA0200004637554D14@prv1-mh.provo.novell.com>
 <00FAA7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <0104A7AF020000F8B1E090C7@prv1-mh.provo.novell.com>
 <5C5AF49B0200007800214548@prv1-mh.provo.novell.com>
 <0f80318d-7454-2055-694c-c22b40a7ddb0@amazon.de>
 <5C5B02E00200007800214606@prv1-mh.provo.novell.com>
 <ed4b5749-ccc0-05d0-bc29-29d2fd199d53@amazon.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1APC=QO=amazon.de=prvs=93423d84c=nmanthey@srs-us1.protection.inumbo.net>)
 id 1grgnT-0003Rf-Uh
 for xen-devel@lists.xenproject.org; Thu, 07 Feb 2019 10:20:44 +0000
In-Reply-To: <ed4b5749-ccc0-05d0-bc29-29d2fd199d53@amazon.de>
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

Ck9uIDIvNy8xOSAxMDo1MCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOgo+IE9uIDIvNi8xOSAxNjo1
MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA2LjAyLjE5IGF0IDE2OjA2LCA8bm1hbnRo
ZXlAYW1hem9uLmRlPiB3cm90ZToKPj4+IE9uIDIvNi8xOSAxNTo1MiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+Pj4gT24gMjkuMDEuMTkgYXQgMTU6NDMsIDxubWFudGhleUBhbWF6b24uZGU+IHdy
b3RlOgo+Pj4+PiBAQCAtOTYzLDYgKzk2NSw5IEBAIG1hcF9ncmFudF9yZWYoCj4+Pj4+ICAgICAg
ICAgIFBJTl9GQUlMKHVubG9ja19vdXQsIEdOVFNUX2JhZF9nbnRyZWYsICJCYWQgcmVmICUjeCBm
b3IgZCVkXG4iLAo+Pj4+PiAgICAgICAgICAgICAgICAgICBvcC0+cmVmLCByZ3QtPmRvbWFpbi0+
ZG9tYWluX2lkKTsKPj4+Pj4gIAo+Pj4+PiArICAgIC8qIE1ha2Ugc3VyZSB0aGUgYWJvdmUgY2hl
Y2sgaXMgbm90IGJ5cGFzc2VkIHNwZWN1bGF0aXZlbHkgKi8KPj4+Pj4gKyAgICBvcC0+cmVmID0g
YXJyYXlfaW5kZXhfbm9zcGVjKG9wLT5yZWYsIG5yX2dyYW50X2VudHJpZXMocmd0KSk7Cj4+Pj4+
ICsKPj4+Pj4gICAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIG9wLT5yZWYpOwo+
Pj4+PiAgICAgIHNoYWggPSBzaGFyZWRfZW50cnlfaGVhZGVyKHJndCwgb3AtPnJlZik7Cj4+Pj4+
ICAgICAgc3RhdHVzID0gcmd0LT5ndF92ZXJzaW9uID09IDEgPyAmc2hhaC0+ZmxhZ3MgOiAmc3Rh
dHVzX2VudHJ5KHJndCwgb3AtPnJlZik7Cj4+Pj4gSnVzdCBGVFIgLSB0aGlzIGlzIGEgY2FzZSB3
aGVyZSB0aGUgY2hhbmdlLCBhY2NvcmRpbmcgdG8gcHJpb3IKPj4+PiBkaXNjdXNzaW9uLCBpcyBw
cmV0dHkgdW5saWtlbHkgdG8gaGVscCBhdCBhbGwuIFRoZSBjb21waWxlciB3aWxsIGhhdmUKPj4+
PiBhIGhhcmQgdGltZSByZWFsaXppbmcgdGhhdCBpdCBjb3VsZCBrZWVwIHRoZSByZXN1bHQgaW4g
YSByZWdpc3RlciBwYXN0Cj4+Pj4gdGhlIGFjdGl2ZV9lbnRyeV9hY3F1aXJlKCkgaW52b2NhdGlv
biwgYXMgdGhhdCAtIGR1ZSB0byB0aGUgc3Bpbgo+Pj4+IGxvY2sgYWNxdWlyZWQgdGhlcmUgLSBh
Y3RzIGFzIGEgY29tcGlsZXIgYmFycmllci4gQW5kIGxvb2tpbmcgYXQKPj4+PiBnZW5lcmF0ZWQg
Y29kZSAoZ2NjIDguMikgY29uZmlybXMgdGhhdCB0aGVyZSdzIGEgcmVsb2FkIGZyb20gdGhlCj4+
Pj4gc3RhY2suCj4+PiBJIGNvdWxkIGNoYW5nZSB0aGlzIGJhY2sgdG8gYSBwcmlvciB2ZXJzaW9u
IHRoYXQgcHJvdGVjdHMgZWFjaCByZWFkCj4+PiBvcGVyYXRpb24uCj4+IFRoYXQgb3IgdXNlIGJs
b2NrX3NwZWN1bGF0aW9uKCkgd2l0aCBhIGNvbW1lbnQgZXhwbGFpbmluZyB3aHkuCj4+Cj4+IEFs
c28gLSB3aHkgYXJlIHRoZXJlIG5vIGNoYW5nZXMgYXQgYWxsIHRvIHRoZSB1bm1hcF9ncmFudF9y
ZWYoKSAvCj4+IHVubWFwX2FuZF9yZXBsYWNlKCkgY2FsbCBwYXRocz8gTm90ZSBpbiBwYXJ0aWN1
bGFyIHRoZSBzZWN1cml0eQo+PiByZWxhdGVkIGNvbW1lbnQgbmV4dCB0byB0aGUgYm91bmRzIGNo
ZWNrIG9mIG9wLT5yZWYgdGhlcmUuIEkndmUKPj4gZ29uZSB0aHJvdWdoIGVhcmxpZXIgcmV2aWV3
IHJvdW5kcywgYnV0IEkgY291bGRuJ3QgZmluZCBhbiBpbmRpY2F0aW9uCj4+IHRoYXQgdGhpcyBt
aWdodCBoYXZlIGJlZW4gdGhlIHJlc3VsdCBvZiByZXZpZXcgZmVlZGJhY2suCj4gWW91IGFyZSBy
aWdodC4gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIEkgaGFkIGEgZml4IHBsYWNlZCB0aGVyZSBpbiB0
aGUKPiBiZWdpbm5pbmcuIEkgd2lsbCByZXBsYWNlIHRoZSBmaXJzdCAic21wX3JtYigpOyIgaW4g
ZnVuY3Rpb24KPiB1bm1hcF9jb21tb24gZm9yIHRoZSBuZXh0IGl0ZXJhdGlvbiB3aXRoIHRoZSAi
YmxvY2tfc3BlY3VsYXRpb24iIG1hY3JvLgpJIGp1c3QgY2hlY2tlZCB0aGlzIG9uZSBtb3JlIHRp
bWUuIFRoZSBtYXB0cmFja19lbnRyeSBtYWNybyBoYXMgYmVlbgpleHRlbmRlZCB3aXRoIHRoZSBh
cnJheV9pbmRleF9ub3NwZWMgbWFjcm8gYWxyZWFkeSwgc28gdGhhdCB0aGUKYXNzaWdubWVudCB0
byB0aGUgbWFwIHZhcmlhYmxlIGlzIGluIGJvdW5kLiBUaGVyZWZvcmUsIEkgYWN0dWFsbHkgd2ls
bApub3QgaW50cm9kdWNlIHRoZSBibG9ja19zcGVjdWxhdGlvbiBtYWNyby4KPgo+IFRoZSBvdGhl
ciBjaGVjayB1bmxpa2VseShvcC0+cmVmID49IG5yX2dyYW50X2VudHJpZXMocmd0KSkgY2FuIG9u
bHkKPiByZWFjaCBvdXQtb2YtYm91bmRzIGZvciB0aGUgdW5tYXAgY2FzZSwgaW4gY2FzZSB0aGUg
bWFwLT5yZWYgZW50cnkgaGFzCj4gYmVlbiBvdXQtb2YtYm91bmRzIGJlZm9yZWhhbmQuIEkgZGlk
IG5vdCBmaW5kIGFuIGFzc2lnbm1lbnQgdGhhdCBpcyBub3QKPiBwcm90ZWN0ZWQgYnkgYSBib3Vu
ZCBjaGVjayBhbmQgYSBzcGVjdWxhdGlvbiBiYXJyaWVyIG9yIGFycmF5X25vc3BlY19pbmRleC4K
Pgo+IEJlc3QsCj4gTm9yYmVydAo+Cj4KCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBD
aHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkK
RWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
