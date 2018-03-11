From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 3/7] RFC arm/domain: Reject invalid
 combinations of domain creation flags
Date: Sun, 11 Mar 2018 19:59:16 +0000
Message-ID: <8b868679-4e3d-6fa7-5b8c-16dd6a223acc@arm.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1520601522-2886-4-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMDMvMDkvMjAxOCAwMToxOCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToK
PiBBUk0gZ3Vlc3RzIGFyZSBIVk0gYW5kIGhhdmUgaGFyZHdhcmUgYXNzaXN0ZWQgcGFnaW5nLiAg
VGhlcmUgYXJlIG5vIFBWIGd1ZXN0cwo+IG9yIHNoYWRvdyBwYWdpbmcsIGFuZCBhbGwgb3RoZXIg
Y3JlYXRpb24gZmxhZ3MgYXJlIHg4NiBzcGVjaWZpYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IC0tLQo+IENDOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQ0M6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5j
aXRyaXguY29tPgo+IENDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFJGQy4g
IFRoaXMgaXMgdW50ZXN0ZWQsIGJ1dCBJIG5vdGljZWQgaXQgd2hlbiBwdXR0aW5nIHRvZ2V0aGVy
IHRoZSBwcmVjZWVkaW5nCj4gcGF0Y2guICBUaGVyZSBpcyBhIG1vZGVyYXRlIGNoYW5jZSB0aGF0
IHRoaXMgd2lsbCBjYXVzZSB0aGluZ3MgdG8gZXhwbG9kZQo+IGJlY2F1c2Ugb2YgaG93IGxpYnhs
IGhhbmRsZXMgQVJNIGd1ZXN0IGNvbnN0cnVjdGlvbiwgYnV0IHNvbWV0aGluZyBhbG9uZyB0aGVz
ZQo+IGxpbmVzIGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KClRvb2xzIGFuZCBoeXBlcnZpc29y
IGFyZSBjb25zaWRlcmluZyBBUk0gZ3Vlc3RzIGFzIFBWLiBTbyB0aGlzIHBhdGNoIGlzIApnb2lu
ZyB0byBicmVhayBib290LiBUaGVyZSBhcmUgYW4gYWN0aW9uIChYRU4tMTAyKSB0byBtb3ZlIEFS
TSBndWVzdHMgdG8gCmJlaGF2ZSBtb3JlIGxpa2UgUFZIIGZyb20gdGhlIHRvb2xzIFBPVi4gSSBh
bSBub3Qgc3VyZSB3aGVuIEkgd2lsbCBoYXZlIAp0aW1lIHRvIGxvb2sgYXQgaXQgdGhvdWdodC4K
CkZvciB0aGUgdGltZSBiZWluZywgSSBhbSB3b25kZXJpbmcgaWYgd2UgY291bGQgb3ZlcnJpZGUg
dGhlIGZsYWdzIGZvciAKQXJtIGluIHRoZSB0b29sc3RhY2s/CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
