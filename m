From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4 06/20] x86emul: place test blobs in
	executable section
Date: Tue, 6 Mar 2018 11:28:24 +0000
Message-ID: <aa6bc1ea-3822-5d40-a778-682572a948e1@citrix.com>
References: <5A96B3B902000078001ACB6D@prv-mh.provo.novell.com>
 <5A96B5F902000078001ACB93@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=+dfo=f4=citrix.com=prvs=5963b29d9=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1etAlf-0007sW-P2
 for xen-devel@lists.xenproject.org; Tue, 06 Mar 2018 11:28:27 +0000
In-Reply-To: <5A96B5F902000078001ACB93@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTM6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFRoaXMgYWxsb3dzIHRoZSBz
ZWN0aW9uIGNvbnRlbnRzIHRvIGJlIGRpc2Fzc2VtYmxlZCB3aXRob3V0IGdvaW5nCj4gdGhyb3Vn
aCBhbnkgZXh0cmEgaG9vcHMsIHNpbXBsaWZ5aW5nIHRoZSBhbmFseXNpcyBvZiBwcm9ibGVtcyBp
biB0ZXN0Cj4gYW5kL29yIGVtdWxhdGlvbiBjb2RlLgo+Cj4gVGhlIGJsb2JzIGJlaW5nIGVtaXR0
ZWQgYXMgKHIvbykgZGF0YSBtZWFucyB3ZSBuZWVkIHRvIGFjY2VwdCBhbgo+IGFzc2VtYmxlciB3
YXJuaW5nIGhlcmUgKGFib3V0IHRoZSBkaWZmZXJpbmcgc2VjdGlvbiBhdHRyaWJ1dGVzKS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBBY2tlZC1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiB2Mzog
TmV3Lgo+Cj4gLS0tIHVuc3RhYmxlLm9yaWcvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01ha2Vm
aWxlCTIwMTctMDUtMDkgMTA6NTc6MTYuMDAwMDAwMDAwICswMjAwCj4gKysrIHVuc3RhYmxlL3Rv
b2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQkyMDE3LTEwLTE2IDE0OjExOjQxLjAwMDAw
MDAwMCArMDIwMAo+IEBAIC05MSw3ICs5MSw3IEBAICQoYWRkc3VmZml4IC5oLCQoVEVTVENBU0VT
KSk6ICUuaDogJS5jIHQKPiAgCQkkKE1BS0UpIC1mIHRlc3RjYXNlLm1rIFRFU1RDQVNFPSQqIFhF
Tl9UQVJHRVRfQVJDSD0kKGFyY2gpICQqLWNmbGFncz0iJCRjZmxhZ3MiIGFsbDsgXAo+ICAJCXBy
ZWZpeD0kKHNoZWxsIGVjaG8gJChzdWJzdCAtLF8sJCopIHwgc2VkIC1lICdzLF5cKFswLTldXCks
X1wxLCcpOyBcCj4gIAkJZmxhdm9yPSQkKGVjaG8gJCR7Y2ZsYWdzfSB8IHNlZCAtZSAncywgLios
LCcgLWUgJ3ksLT0sX18sJykgOyBcCj4gLQkJKGVjaG8gInN0YXRpYyBjb25zdCB1bnNpZ25lZCBp
bnQgJCR7cHJlZml4fV8kKGFyY2gpJCR7Zmxhdm9yfVtdID0geyI7IFwKPiArCQkoZWNobyAnc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCBfX2F0dHJpYnV0ZV9fKChzZWN0aW9uKCIudGVzdCIpKSkg
JyIkJHtwcmVmaXh9XyQoYXJjaCkkJHtmbGF2b3J9W10gPSB7IjsgXAoKR2l2ZW4gdGhhdCB3ZSdy
ZSBhbHJlYWR5IHBsYXlpbmcgbWFueSB0b29sY2hhaW4gZ2FtZXMsIHRoZSBmb2xsb3dpbmcKYWN0
dWFsbHkgcmVtb3ZlcyB0aGUgd2FybmluZyB5b3UgY2l0ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
CgpfX2F0dHJpYnV0ZV9fKChzZWN0aW9uKCIudGVzdCwgXCJheFwiLCBAcHJvZ2JpdHMgIyIpKSkK
CkFuZCBpdCB0dXJucyBvdXQgdG8gYmUgY2xhbmctY29tcGF0aWJsZSBhcyB3ZWxsIChhbHRob3Vn
aCB0aGVyZSBhcmUgbWFueQpvdGhlciBiaXRzIG9mIHRoZSBlbXVsYXRvciB3aGljaCBhcmUgbm90
KS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
