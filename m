From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/8] x86/SVM: Add AVIC vmexit handlers
Date: Mon, 23 Apr 2018 01:54:17 -0600
Message-ID: <5ADD912902000078001BD6A5@prv1-mh.provo.novell.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <29be8811f7cd22aecafddcfab330ed6cd67bdc0a.1522794651.git.Janakarajan.Natarajan@amd.com>
 <5AD5EF6D02000078001BC158@prv1-mh.provo.novell.com>
 <c13e4d5b-9010-cf2f-950f-e47bfc108eb2@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <c13e4d5b-9010-cf2f-950f-e47bfc108eb2@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>, JanakarajanNatarajan <jnataraj@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjA0LjE4IGF0IDIyOjAyLCA8am5hdGFyYWpAYW1kLmNvbT4gd3JvdGU6Cj4gT24g
NC8xNy8yMDE4IDc6NTggQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4wNC4xOCBh
dCAwMTowMSwgPEphbmFrYXJhamFuLk5hdGFyYWphbkBhbWQuY29tPiB3cm90ZToKPj4+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZsYXBpYy5oCj4+PiArKysgYi94ZW4vaW5jbHVkZS9h
c20teDg2L2h2bS92bGFwaWMuaAo+Pj4gQEAgLTEzNyw2ICsxMzcsMTAgQEAgdm9pZCB2bGFwaWNf
aXBpKHN0cnVjdCB2bGFwaWMgKnZsYXBpYywgdWludDMyX3QgCj4gaWNyX2xvdywKPj4+IHVpbnQz
Ml90IGljcl9oaWdoKTsKPj4+ICAgCj4+PiAgIGludCB2bGFwaWNfYXBpY3Zfd3JpdGUoc3RydWN0
IHZjcHUgKnYsIHVuc2lnbmVkIGludCBvZmZzZXQpOwo+Pj4gICAKPj4+ICt2b2lkIHZsYXBpY19y
ZWdfd3JpdGUoc3RydWN0IHZjcHUgKnYsIHVuc2lnbmVkIGludCBvZmZzZXQsIHVpbnQzMl90IHZh
bCk7Cj4+PiArCj4+PiArdWludDMyX3QgdmxhcGljX3JlYWRfYWxpZ25lZChjb25zdCBzdHJ1Y3Qg
dmxhcGljICp2bGFwaWMsIHVuc2lnbmVkIGludCBvZmZzZXQpOwo+PiBJZiBtYWtpbmcgdGhlc2Ug
bm9uLXN0YXRpYyBpcyByZWFsbHkgbmVjZXNzYXJ5LCB0aGV5IHNob3VsZCAobmFtZS13aXNlKSBi
ZWNvbWUKPj4gcHJvcGVyIHBhaXJzIG9mIG9uZSBhbm90aGVyLCBlLmcuIHJlbmFtZWQgdGhlIGZv
cm1lciB0byB2bGFwaWNfcmVnX3JlYWQoKS4KPj4KPj4gQWxzbyB3aGlsZSBoZXJlIHlvdSBwcm9w
ZXJseSB1c2UgdWludDMyX3QsIGFsbW9zdCBldmVyeXdoZXJlIHlvdSB1c2UgdTMyLgo+PiBQbGVh
c2Ugc3dpdGNoIHRoaXMgdGhyb3VnaG91dCB0aGUgc2VyaWVzLCBhbmQgb2YgY291cnNlIGZvciBh
bGwgb3RoZXIgZml4ZWQKPj4gd2lkdGggaW50ZWdlciB0eXBlcy4KPiAKPiBJbiB0aGUgY2FzZSBv
ZiB2bWNiLmgsIHdoZXJlIHRoZSBleGlzdGluZyB2YXJpYWJsZXMgdXNlIHUzMiwgdTY0IHdvdWxk
IAo+IHlvdSB3YW50IG1lIHRvIGhhdmUgdWludDMyX3QsCj4gdWludDY0X3QgZm9yIHRoZSBuZXcg
YXZpYyB2YXJpYWJsZXM/CgpJZGVhbGx5LCB5ZXMgKGFuZCBldmVuIG1vcmUgaWRlYWxseSB5b3Un
ZCBmaW5kIHRoZSB0aW1lIHRvIHN3aXRjaCB0aGUgb3RoZXJzCmFyb3VuZCksIGJ1dCBJIHdvdWxk
bid0IG1ha2UgdGhpcyBhIHN0cmljdCByZXF1aXJlbWVudCAoZXZlbiBsZXNzIHNvIGFzIEknbQpu
b3QgYSBtYWludGFpbmVyIG9mIHRob3NlIGZpbGVzIGFueXdheSkgLSBJIGNhbiBzZWUgdGhlIGNv
bnNpc3RlbmN5CmFyZ3VtZW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
