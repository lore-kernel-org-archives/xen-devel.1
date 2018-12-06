From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/9] x86/amd: Introduce CPUID/MSR
 definitions for per-vcpu SSBD support
Date: Thu, 6 Dec 2018 18:35:51 +0000
Message-ID: <1ed7caa1-a78f-afec-6978-626178b5d710@citrix.com>
References: <1543853902-6257-1-git-send-email-andrew.cooper3@citrix.com>
 <1543853902-6257-5-git-send-email-andrew.cooper3@citrix.com>
 <5C07FF2B02000078002033C5@prv1-mh.provo.novell.com>
 <76dd7107-d69d-7a3f-b72a-4f0f0ee47c44@citrix.com>
 <5C08E2B402000078002036DA@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5C08E2B402000078002036DA@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMTIvMjAxOCAwODo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gKyAgICAgICAgeyJh
bWRfc3RpYnAiLCAgICAweDgwMDAwMDA4LCBOQSwgQ1BVSURfUkVHX0VCWCwgMTUsICAxfSwKPj4+
PiArICAgICAgICB7ImFtZF9zc2JkIiwgICAgIDB4ODAwMDAwMDgsIE5BLCBDUFVJRF9SRUdfRUJY
LCAyNCwgIDF9LAo+Pj4+ICsgICAgICAgIHsidmlydF9zY19zc2JkIiwgMHg4MDAwMDAwOCwgTkEs
IENQVUlEX1JFR19FQlgsIDI1LCAgMX0sCj4+Pj4gKyAgICAgICAgeyJhbWRfc3NiX25vIiwgICAw
eDgwMDAwMDA4LCBOQSwgQ1BVSURfUkVHX0VCWCwgMjYsICAxfSwKPj4+IFNpbmNlIHlvdSdyZSBh
dCBpdCwgd2h5IG5vdCBhbHNvIGludHJvZHVjZSBuYW1lcyBmb3IgYml0cyAxNi0xOAo+Pj4gYXQg
dGhpcyBvY2Nhc2lvbj8KPj4gSSBoYXZlbid0IHByZXZpb3VzbHkgZmlsbGVkIGluIG5hbWVzIGZv
ciB0aGUgc2FrZSBvZiBpdC4KPj4KPj4gVGhlIHJlYXNvbiB0aGF0IGlicnMvc3RpYnAvc3NiZCBh
cmUgaGVyZSBpcyBiZWNhdXNlIHRoZXkncmUgcmVsYXRlZCBhbmQKPj4gSSd2ZSBhbHNvIGdvdCBh
IGZvbGxvd29uIGZldyBwYXRjaGVzIHRvIHN1cHBvcnQgTVNSX1ZJUlRfU1BFQ19DVFJMIG9uCj4+
IFJvbWUgaGFyZHdhcmUgdmlhIE1TUl9TUEVDX0NUUkwsIGJ1dCBJIG5lZWQgYW4gU0RQIGFuZCBz
b21lCj4+IGV4cGVyaW1lbnRhdGlvbiB0aW1lIGJlZm9yZSBJJ2QgYmUgaGFwcHkgcG9zdGluZyB0
aGVtLgo+Pgo+PiBCdXQgdG8gYWRkcmVzcyB5b3VyIHF1ZXN0aW9uLCBJIGNhbid0IGxvY2F0ZSB0
aG9zZSBiaXRzIGF0IGFsbC4gIE5vdAo+PiBldmVuIGluIHRoZSBOREEgZG9jcyBvciBMaW51eCBz
b3VyY2UuCj4gSG1tLCB0aGF0J3MgY2VydGFpbmx5IG9kZC4gSSd2ZSBmb3VuZCB0aGVtIHF1aXRl
IHNvbWUgdGltZSBhZ28gaW4gdGhpcwo+IHB1YmxpYyB3aGl0ZXBhcGVyOgo+IGh0dHBzOi8vZGV2
ZWxvcGVyLmFtZC5jb20vd3AtY29udGVudC9yZXNvdXJjZXMvQXJjaGl0ZWN0dXJlX0d1aWRlbGlu
ZXNfVXBkYXRlX0luZGlyZWN0X0JyYW5jaF9Db250cm9sLnBkZgo+IFRoZXkncmUgYWxsIGNsZWFy
bHkgSUJSUy9TVElCUCByZWxhdGVkLgoKT2ggLSBJJ2QgY29tcGxldGVseSBmb3Jnb3R0ZW4gYWJv
dXQgdGhhdCB3aGl0ZXBhcGVyLsKgIFNvbWUgb2YgdGhlCmRldGFpbHMgYXJlIHN1cGVyc2VkZWQg
YnkgdGhlIFNTQkQgcGFwZXIuCgpGb3Igbm93LCBJJ2xsIGRyb3AgdGhlIGJpdCBuYW1lcyBmb3Ig
ZmVhdHVyZXMgbm90IHVzZWQgaW4gdGhpcyBzZXJpZXMuwqAKT25lIHdheSBvciBhbm90aGVyLCBk
b2luZyBhbnl0aGluZyB3aXRoIHRoZSBvdGhlcnMgd2lsbCByZXF1aXJlIHNvbWUKZXhwZXJpbWVu
dGF0aW9uIG9uIGhhcmR3YXJlIHdoaWNoIHN1cHBvcnRzIHRoZW0uCgp+QW5kcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
