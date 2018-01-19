From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] replace vCPU's dirty CPU mask by
	numeric ID
Date: Fri, 19 Jan 2018 17:48:51 +0000
Message-ID: <e841050d-ab7e-5486-3e4c-2b6cdd574ed0@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A62257A02000078001A0791@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=rwd1=eo=citrix.com=prvs=5503b2e3b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ecbRd-0003YG-Qw
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 18:31:17 +0000
In-Reply-To: <5A62257A02000078001A0791@prv-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTkvMDEvMTggMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEF0IG1vc3Qgb25lIGJpdCBj
YW4gYmUgc2V0IGluIHRoZSBtYXNrcywgc28gZXNwZWNpYWxseSBvbiBsYXJnZXIgc3lzdGVtcwo+
IGl0J3MgcXVpdGUgYSBiaXQgb2YgdW5uZWNlc3NhcnkgbWVtb3J5IGFuZCBwcm9jZXNzaW5nIG92
ZXJoZWFkIHRvIHRyYWNrCj4gdGhlIGluZm9ybWF0aW9uIGFzIGEgbWFzay4gU3RvcmUgdGhlIG51
bWVyaWMgSUQgb2YgdGhlIHJlc3BlY3RpdmUgQ1BVCj4gaW5zdGVhZCwgb3IgTlJfQ1BVUyBpZiBu
byBkaXJ0eSBzdGF0ZSBleGlzdHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpEZWZpbml0ZWx5ICsxIGZvciB0aGlzIGNoYW5nZS4KCkhvd2V2ZXIs
IHRoZSBjb21wYXJpc29uIGFnYWluc3QgbnJfY3B1X2lkcyBpc24ndCBjb21wbGV0ZWx5IG9idmlv
dXMgYXMKdG8gaXRzIGZ1bmN0aW9uLsKgIEhvdyBhYm91dCBpbnRyb2R1Y2luZyBhIHByZWRpY2F0
ZSBzdWNoIGFzIHZjcHVfZGlydHkoKQp3aGljaCB3cmFwcyB0aGUgdXNlIG9mIHRoZSBpZD8KCkFs
c28sIHlvdSdkIGdldCBiZXR0ZXIgY29kZSBieSB1c2luZyBOUl9DUFVTIHdoaWNoIGlzIGEgY29t
cGlsZS10aW1lCmNvbnN0YW50LCByYXRoZXIgdGhhbiBucl9jcHVfaWRzIHdoaWNoIHdvdWxkIGJl
IGEgbWVtb3J5IHJlYWQuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
