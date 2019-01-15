From: Julien Grall <julien.grall@arm.com>
Subject: Re: PING ARM [PATCH v2] xen/cmdline: Fix buggy
 strncmp(s, LITERAL, ss - s) construct
Date: Tue, 15 Jan 2019 11:39:10 +0000
Message-ID: <fb88cc7b-82da-9d70-ca56-b763baa187ea@arm.com>
References: <1546622255-9324-1-git-send-email-andrew.cooper3@citrix.com>
 <8161196e-b6ff-2ab1-eaa8-cdb5341ae178@citrix.com>
 <4f1859e5-c901-3e3e-ffc2-0e7233d1c794@arm.com>
 <5d7290c3-02e2-c54d-9a65-cc8b8019a4cc@citrix.com>
 <cf0da64b-1dd5-8dfc-a041-cefe077dd0ff@arm.com>
 <9a301cf7-4e6e-c147-a7ae-b901b024b107@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9a301cf7-4e6e-c147-a7ae-b901b024b107@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgQW5kcmV3LAoKT24gMS8xNC8xOSA1OjQzIFBNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9u
IDE0LzAxLzIwMTkgMTc6MTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgQW5kcmV3LAo+Pgo+
PiBPbiAxNC8wMS8yMDE5IDE2OjU5LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gT24gMTQvMDEv
MjAxOSAxNjowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IE9uIDE0LzAxLzIwMTkgMTU6MTcs
IEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Vm
aS9lZmktYm9vdC5oCj4+Pj4+PiBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+Pj4+Pj4g
aW5kZXggY2E2NTVmZi4uMjJhODZlYyAxMDA2NDQKPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9l
ZmkvZWZpLWJvb3QuaAo+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oCj4+
Pj4+PiBAQCAtMjEyLDcgKzIxMiw3IEBAIEVGSV9TVEFUVVMgX19pbml0Cj4+Pj4+PiBmZHRfYWRk
X3VlZmlfbm9kZXMoRUZJX1NZU1RFTV9UQUJMRSAqc3lzX3RhYmxlLAo+Pj4+Pj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+PiAgwqDCoCDCoMKgwqDCoMKgwqDCoMKg
wqAgdHlwZSA9IGZkdF9nZXRwcm9wKGZkdCwgbm9kZSwgImRldmljZV90eXBlIiwgJmxlbik7Cj4+
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCB0eXBlICYmIHN0cm5jbXAodHlwZSwgIm1lbW9yeSIs
IGxlbikgPT0gMCApCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCB0eXBlICYmIGxlbiA9PSA2
ICYmIHN0cm5jbXAodHlwZSwgIm1lbW9yeSIsIDYpID09IDAgKQo+Pj4+Cj4+Pj4gc3RyaW5nIHBy
b3BlcnR5IHRlcm1pbmF0ZXMgd2l0aCBOVUwgYW5kIGlzIGluY2x1ZGVkIGluIHRoZSBsZW4uIFNv
IEkKPj4+PiBkb24ndCB0aGluayB0aGlzIGNoYW5nZSBpcyBjb3JyZWN0Lgo+Pj4KPj4+IEFyZSB5
b3Ugc2F5aW5nIHRoYXQgbGVuIGlzIDcgaGVyZSB0aGVuPwo+Pgo+PiBZZXMuIEJ1dCBJIGRvbid0
IHRoaW5rIHRoaXMgY2hhbmdlIGlzIG5lY2Vzc2FyeSBhcyB3ZSBhbHJlYWR5IGluY2x1ZGUKPj4g
TlVMIGluIHRoZSBjb21wYXJpc29uLgo+IAo+IEFoIC0gZmFpciBwb2ludC7CoCBJJ2xsIGRyb3Ag
dGhpcyBodW5rIHRoZW4uCj4gCj4gQXJlIHlvdSBoYXBweSB3aXRoIHRoZSBhZGp1c3RtZW50IGlu
IGFyY2gvYXJtL2NwdWVycmF0YS5jID8KClllcy4gRm9yIHRoYXQgY2hhbmdlOgoKQWNrZWQtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
