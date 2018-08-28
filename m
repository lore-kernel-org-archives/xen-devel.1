From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 02/23] xen: is_hvm_{domain,
 vcpu} should evaluate to false when !CONFIG_HVM
Date: Tue, 28 Aug 2018 09:41:21 +0100
Message-ID: <20180828084121.6dmbkbgcujr36m4t@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <dd4481dbc4e9fbfe0fcb3ab8a704e58e9d5f04ca.1535285866.git-series.wei.liu2@citrix.com>
 <5B84098302000078001E241E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fuZZ0-0007p1-Iq
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 08:41:26 +0000
Content-Disposition: inline
In-Reply-To: <5B84098302000078001E241E@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjcsIDIwMTggYXQgMDg6MjQ6MDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBUdXJuIHRoZW0gaW50byBzdGF0aWMgaW5saW5lIGZ1bmN0aW9ucyB3aGljaCBldmFs
dWF0ZSB0byBmYWxzZSB3aGVuCj4gPiBDT05GSUdfSFZNIGlzIG5vdCBzZXQuIEFSTSB3b24ndCBi
ZSBicm9rZW4gYmVjYXVzZSBBUk0gZ3Vlc3RzIGFyZSBzZXQKPiA+IHRvIFBWIHR5cGUgaW4gdGhl
IGh5cGVydmlzb3IuCj4gPiAKPiA+IEJ1dCBBUk0gaGFzIHBsYW4gdG8gc3dpdGNoIHRvIEhWTSBn
dWVzdCB0eXBlIGluc2lkZSB0aGUgaHlwZXJ2aXNvciwgc28KPiA+IHByZWVtcHRpdmVseSBpbnRy
b2R1Y2UgQ09ORklHX0hWTSBmb3IgQVJNIGhlcmUuCj4gCj4gQnV0IGlzIHNldHRpbmcgdGhpcyB0
byBZIHRoZW4gY29ycmVjdCBhdCB0aGlzIHBvaW50PwoKSSB0aGluayBpdCB3b3VsZCBiZSBsZXNz
IHN1cnByaXNpbmcgd2hlbiB0aGUgc3dpdGNoaW5nIGV2ZW50dWFsbHkKaGFwcGVucy4gSSB3aWxs
IGxldCBBUk0gbWFpbnRhaW5lcnMgZGVjaWRlIHdoZXRoZXIgaXQgc2hvdWxkIGJlIFkgb3IgTi4K
Cj4gCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAo+ID4gKysrIGIveGVuL2luY2x1
ZGUveGVuL3NjaGVkLmgKPiA+IEBAIC04NzksOCArODc5LDE3IEBAIHZvaWQgd2F0Y2hkb2dfZG9t
YWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCk7Cj4gPiAgCj4gPiAgI2RlZmluZSBpc19wdl9k
b21haW4oZCkgKChkKS0+Z3Vlc3RfdHlwZSA9PSBndWVzdF90eXBlX3B2KQo+ID4gICNkZWZpbmUg
aXNfcHZfdmNwdSh2KSAgIChpc19wdl9kb21haW4oKHYpLT5kb21haW4pKQo+ID4gLSNkZWZpbmUg
aXNfaHZtX2RvbWFpbihkKSAoKGQpLT5ndWVzdF90eXBlID09IGd1ZXN0X3R5cGVfaHZtKQo+ID4g
LSNkZWZpbmUgaXNfaHZtX3ZjcHUodikgICAoaXNfaHZtX2RvbWFpbih2LT5kb21haW4pKQo+ID4g
Kwo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpc19odm1fZG9tYWluKGNvbnN0IHN0cnVjdCBkb21h
aW4gKmQpCj4gPiArewo+ID4gKyAgICByZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfSFZNKSA/IGQt
Pmd1ZXN0X3R5cGUgPT0gZ3Vlc3RfdHlwZV9odm0gOiBmYWxzZTsKPiAKPiBVbHRpbWF0ZWx5IEkg
dGhpbmsgdGhlIGd1ZXN0X3R5cGVfe2h2bSxwdn0gZW51bWVyYXRvcnMgc2hvdWxkIG9ubHkKPiBi
ZSBlbmFibGVkIHdoZW4gQ09ORklHX3tIVk0sUFZ9LCBzbyBJIHRoaW5rICNpZmRlZiBDT05GSUdf
SFZNCj4gd291bGQgYmUgdGhlIGJldHRlciBjaG9pY2UgaGVyZS4gQnV0IG9mIGNvdXJzZSB3ZSBj
YW4gZG8gdGhpcyBmdXJ0aGVyCj4gY29udmVyc2lvbiBhdCBhIGxhdGVyIHBvaW50LCBzbwo+IEFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGFua3MuCgpXZWkuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
