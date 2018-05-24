From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 08:05:30 -0600
Message-ID: <5B06C6AA02000078001C5967@prv1-mh.provo.novell.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <4c2574fb-eebb-68d5-8b4d-a60509dd51e6@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLqs5-0002V7-Jq
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:05:37 +0000
In-Reply-To: <4c2574fb-eebb-68d5-8b4d-a60509dd51e6@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE1OjQ4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjQvMDUvMTggMTQ6NDEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJbiBjb21taXQg
ZDFkNmZjOTdkNiAoIng4Ni94cHRpOiByZWFsbHkgaGlkZSBhbG1vc3QgYWxsIG9mIFhlbiBpbWFn
ZSIpCj4+IEkndmUgZmFpbGVkIHRvIHJlbWVtYmVyIHRoZSBmYWN0IHRoYXQgbXVsdGlwbGUgQ1BV
cyBzaGFyZSBhIHN0dWIKPj4gbWFwcGluZyBwYWdlLiBUaGVyZWZvcmUgaXQgaXMgd3JvbmcgdG8g
dW5jb25kaXRpb25hbGx5IHphcCB0aGUgbWFwcGluZwo+PiB3aGVuIGJyaW5naW5nIGRvd24gYSBD
UFU7IGl0IG1heSBvbmx5IGJlIHVubWFwcGVkIHdoZW4gbm8gb3RoZXIgb25saW5lCj4+IENQVSB1
c2VzIHRoYXQgc2FtZSBwYWdlLgo+Pgo+PiBSZXBvcnRlZC1ieTogU2ltb24gR2Fpc2VyIDxzaW1v
bkBpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPj4g
KysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+PiBAQCAtODc2LDcgKzg3NiwyMSBAQCBzdGF0
aWMgdm9pZCBjbGVhbnVwX2NwdV9yb290X3BndCh1bnNpZ25lCj4+ICAKPj4gICAgICBmcmVlX3hl
bl9wYWdldGFibGUocnB0KTsKPj4gIAo+PiAtICAgIC8qIEFsc28gemFwIHRoZSBzdHViIG1hcHBp
bmcgZm9yIHRoaXMgQ1BVLiAqLwo+PiArICAgIC8qCj4+ICsgICAgICogQWxzbyB6YXAgdGhlIHN0
dWIgbWFwcGluZyBmb3IgdGhpcyBDUFUsIGlmIG5vIG90aGVyIG9ubGluZSBvbmUgdXNlcwo+PiAr
ICAgICAqIHRoZSBzYW1lIHBhZ2UuCj4+ICsgICAgICovCj4+ICsgICAgaWYgKCBzdHViX2xpbmVh
ciApCj4+ICsgICAgewo+PiArICAgICAgICB1bnNpZ25lZCBpbnQgb3RoZXI7Cj4+ICsKPj4gKyAg
ICAgICAgZm9yX2VhY2hfb25saW5lX2NwdShvdGhlcikKPiAKPiBMb29rIG92ZXIgdGhlIGNvZGUs
IGl0IHNlZW1zIHRoYXQgd2l0aCBzcGFjZXMgaXMgdGhlIG1vcmUgY29tbW9uIHN0eWxlLAo+IGJ1
dCBpdCBpcyBhZG1pdHRlZGx5IGZhaXJseSBtaXhlZC4KCkknZCBwcmVmZXIgdG8gbGVhdmUgaXQg
YXMgaXMgLSBwZXJzb25hbGx5IEkgZG9uJ3QgY29uc2lkZXIgImZvcl9lYWNoX29ubGluZV9jcHUi
CmFuZCBhbGlrZSBrZXl3b3Jkcywgd2hpY2ggaXMgd2hhdCAuL0NPRElOR19TVFlMRSB0YWxrcyBh
Ym91dC4gSSBhY2NlcHQKb3RoZXJzIHRha2luZyBhIGRpZmZlcmVudCBwb3NpdGlvbiwgaS5lLiBJ
IGRvbid0IG5vcm1hbGx5IGRlbWFuZCBhIHBhcnRpY3VsYXIKc3R5bGUgdG8gYmUgdXNlZCB0aGVy
ZSwgYnV0IGluIGNvZGUgSSB3cml0ZSBJIHByZWZlciB0byBvbmx5IGFwcGx5IHNwYWNlcyB0bwpy
ZWFsIGtleXdvcmRzLgoKPiBFaXRoZXIgd2F5IChhcyB0aGF0J3MgdHJpdmlhbCB0byBmaXgpLCBB
Y2tlZC1ieTogQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKVGhh
bmtzLCBKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
