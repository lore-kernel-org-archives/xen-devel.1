From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
Date: Fri, 03 May 2019 07:57:57 -0600
Message-ID: <5CCC48E5020000780022B9F5@prv1-mh.provo.novell.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
 <20190502221345.18459-2-tamas@tklengyel.com>
 <5CCBFB86020000780022B889@prv1-mh.provo.novell.com>
 <CABfawhkocyDAiGyXF+Cf+Y4fB7w8is=GEUJEzMVJ5dXbEEGeLw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMYhO-000363-Vz
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 13:58:03 +0000
In-Reply-To: <CABfawhkocyDAiGyXF+Cf+Y4fB7w8is=GEUJEzMVJ5dXbEEGeLw@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA1LjE5IGF0IDE1OjQzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBNYXkgMywgMjAxOSBhdCAyOjI3IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4+Cj4+ID4+PiBPbiAwMy4wNS4xOSBhdCAwMDoxMywgPHRhbWFzQHRrbGVu
Z3llbC5jb20+IHdyb3RlOgo+PiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5j
Cj4+ID4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPj4gPiBAQCAtMTEyLDEz
ICsxMTIsNDggQEAgc3RhdGljIGlubGluZSB2b2lkIHBhZ2Vfc2hhcmluZ19kaXNwb3NlKHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2UpCj4+ID4KPj4gPiAgI2VuZGlmIC8qIE1FTV9TSEFSSU5HX0FVRElU
ICovCj4+ID4KPj4gPiAtc3RhdGljIGlubGluZSBpbnQgbWVtX3NoYXJpbmdfcGFnZV9sb2NrKHN0
cnVjdCBwYWdlX2luZm8gKnBnKQo+PiA+ICsvKgo+PiA+ICsgKiBQcml2YXRlIGltcGxlbWVudGF0
aW9ucyBvZiBwYWdlX2xvY2svdW5sb2NrIHRvIGJ5cGFzcyBQVi1vbmx5Cj4+ID4gKyAqIHNhbml0
eSBjaGVja3Mgbm90IGFwcGxpY2FibGUgdG8gbWVtLXNoYXJpbmcuCj4+ID4gKyAqLwo+PiA+ICtz
dGF0aWMgaW5saW5lIGJvb2wgX3BhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+PiA+
ICB7Cj4+ID4gLSAgICBpbnQgcmM7Cj4+ID4gKyAgICB1bnNpZ25lZCBsb25nIHgsIG54Owo+PiA+
ICsKPj4gPiArICAgIGRvIHsKPj4gPiArICAgICAgICB3aGlsZSAoICh4ID0gcGFnZS0+dS5pbnVz
ZS50eXBlX2luZm8pICYgUEdUX2xvY2tlZCApCj4+ID4gKyAgICAgICAgICAgIGNwdV9yZWxheCgp
Owo+PiA+ICsgICAgICAgIG54ID0geCArICgxIHwgUEdUX2xvY2tlZCk7Cj4+ID4gKyAgICAgICAg
aWYgKCAhKHggJiBQR1RfdmFsaWRhdGVkKSB8fAo+PiA+ICsgICAgICAgICAgICAgISh4ICYgUEdU
X2NvdW50X21hc2spIHx8Cj4+ID4gKyAgICAgICAgICAgICAhKG54ICYgUEdUX2NvdW50X21hc2sp
ICkKPj4gPiArICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pgo+PiBKdXN0IGZvciBteSBvd24g
dW5kZXJzdGFuZGluZzogRGlkIHlvdSB2ZXJpZnkgdGhhdCB0aGUgUEdUX3ZhbGlkYXRlZAo+PiBj
aGVjayBpcyBpbmRlZWQgbmVlZGVkIGhlcmUsIG9yIGRpZCB5b3UgY29weSBpdCAianVzdCBpbiBj
YXNlIj8gSW4gdGhlCj4+IGxhdHRlciBjYXNlIGEgY29tbWVudCBtYXkgYmUgd29ydGh3aGlsZS4K
PiAKPiBUaGlzIGlzIGFuIGV4YWN0IGNvcHkgb2YgcGFnZV9sb2NrLCBzYW5zIHRoZSBhc3NlcnRz
IHRoYXQgYnJlYWsgaXQKPiBmcm9tIG1lbV9zaGFyaW5nLiBJIGRpZG4ndCBpbnZlc3RpZ2F0ZSB3
aGljaCBvZiB0aGVzZSBmbGFncyBhcmUKPiBuZWNlc3NhcnkgZm9yIG1lbV9zaGFyaW5nLiBGcmFu
a2x5LCBJIGRvbid0IGZ1bGx5IHVuZGVyc3RhbmQgdGhlaXIKPiBtZWFuaW5nIGFuZCBJIGhhdmVu
J3QgY2FtZSBhY3Jvc3MgZG9jdW1lbnRhdGlvbiBhYm91dCBpdCB5ZXQuIEkgY2FuCj4gY2VydGFp
bmx5IGFkZCBhIGNvbW1lbnQgc2F5aW5nIFRPRE86IGZpZ3VyZSBvdXQgd2hpY2ggb2YgdGhlc2Ug
ZmxhZ3MKPiBhcmUgYWN0dWFsbHkgbmVlZGVkLgoKWWVzIHNvbWV0aGluZyBhbG9uZyB0aGVzZSBs
aW5lcyBpcyB3aGF0IEknbSBhZnRlci4gQnV0ICJ0aGVzZSBmbGFncyIKcmVhbGx5IGlzIGp1c3Qg
UEdUX3ZhbGlkYXRlZC4gVGhlcmUncyBubyBxdWVzdGlvbiB0aGUgUEdUX2xvY2tlZAphbmQgUEdU
X2NvdW50X21hc2sgb3BlcmF0aW9ucyBuZWVkIHRvIHJlbWFpbiBhcyB0aGV5IGFyZS4KCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
