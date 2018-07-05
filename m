From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] EFI: add EFI_LOAD_OPTION support
Date: Thu, 05 Jul 2018 06:00:14 -0600
Message-ID: <5B3E084E02000078001D17B9@prv1-mh.provo.novell.com>
References: <5B31E90F02000078001CDCE1@prv1-mh.provo.novell.com>
 <20180705095918.zklzzjraybeowhh3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=6ivd=jv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fb2vp-00076Q-2u
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 12:00:17 +0000
In-Reply-To: <20180705095918.zklzzjraybeowhh3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA3LjE4IGF0IDExOjU5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDE6MTk6NDNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IFdoZW4gYm9vdGluZyBYZW4gdmlhIFVFRkkgdGhlIFhlbiBjb25maWcgZmlsZSBjYW4g
Y29udGFpbiBtdWx0aXBsZQo+PiBzZWN0aW9ucyBlYWNoIGRlc2NyaWJpbmcgZGlmZmVyZW50IGJv
b3Qgb3B0aW9ucy4gSXQgaXMgY3VycmVudGx5IG9ubHkKPj4gcG9zc2libGUgdG8gY2hvb3NlIHdo
aWNoIHNlY3Rpb24gdG8gYm9vdCB3aXRoIGlmIHRoZSBidWZmZXIgY29udGFpbnMgYQo+PiBzdHJp
bmcuIFVFRkkgcHJvdmlkZXMgYSBkaWZmZXJlbnQgc3RhbmRhcmQgdG8gcGFzcyBvcHRpb25hbCBh
cmd1bWVudHMKPj4gdG8gYW4gYXBwbGljYXRpb24sIGFuZCBpbiB0aGlzIHBhdGNoIHdlIG1ha2Ug
WGVuIHByb3Blcmx5IHBhcnNlIHRoaXMKPj4gYnVmZmVyLCB0aHVzIG1ha2luZyBpdCBwb3NzaWJs
ZSB0byBoYXZlIHNlcGFyYXRlIEVGSSBib290IG9wdGlvbnMKPj4gcHJlc2VudCBmb3IgdGhlIGRp
ZmZlcmVudCBjb25maWcgc2VjdGlvbnMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBOb3Qgc3VyZSB3aHkgSSdtIENDJ2VkIG9uIHRoaXMg
cGF0Y2guIFNpbmNlIHlvdSdyZSB0aGUgRUZJIG1haW50YWluZXIsIEkKPiBkb24ndCB0aGluayBh
IHRhZyBpcyBuZWVkZWQgZm9yIHlvdSB0byBjb21taXQgdGhpcyBjaGFuZ2UuCgpIbW0sIHNvIGZh
ciBJIHdhcyB1bmRlciB0aGUgaW1wcmVzc2lvbiB0aGF0IHRoZSBsYWNrIG9mIGEgMm5kCm1haW50
YWluZXIgbWVhbnQgYW4gYWNrIGZyb20gVEhFIFJFU1Qgd291bGQgYXQgdGhlIHZlcnkgbGVhc3QK
YmUgZGVzaXJhYmxlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
