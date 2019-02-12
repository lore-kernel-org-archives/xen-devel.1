From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Tue, 12 Feb 2019 14:59:25 +0200
Message-ID: <3210eb98-4912-8196-b64b-737f7eb31ec5@bitdefender.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
 <5C62C2A50200007800215E39@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8704=QT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gtXex-00068g-7m
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 12:59:35 +0000
In-Reply-To: <5C62C2A50200007800215E39@prv1-mh.provo.novell.com>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMi8xMi8xOSAyOjU3IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMi4wMi4xOSBh
dCAxMjo0MiwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBIVk1PUF9hbHRw
Mm1fc2V0X2RvbWFpbl9zdGF0ZSBkb2VzIG5vdCBkb21haW5fcGF1c2UoKSwgcHJlc3VtYWJseQo+
PiBvbiBwdXJwb3NlIChhcyBpdCB3YXMgb3JpZ2luYWxseSBzdXBwb3NlZCB0byBjYXRlciB0byBh
IGluLWd1ZXN0Cj4+IGFnZW50LCBhbmQgYSBkb21haW4gcGF1c2luZyBpdHNlbGYgaXMgbm90IGEg
Z29vZCBpZGVhKS4KPj4KPj4gVGhpcyBjYW4gbGVhZCB0byBkb21haW4gY3Jhc2hlcyBpbiB0aGUg
dm14X3ZtZXhpdF9oYW5kbGVyKCkgY29kZQo+PiB0aGF0IGNoZWNrcyBpZiB0aGUgZ3Vlc3QgaGFz
IHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBFUFRQIHdpdGhvdXQgYW4KPj4gZXhpdC4gVGhhdCBjb2Rl
IGNhbiBfX3ZtcmVhZCgpIHRoZSBob3N0IHAybSdzIEVQVF9QT0lOVEVSCj4+IChiZWZvcmUgSFZN
T1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgImZvcl9lYWNoX3ZjcHUoKSIgaGFzIGEKPj4gY2hh
bmNlIHRvIHJ1biBhbHRwMm1fdmNwdV9pbml0aWFsaXNlKCksIGJ1dCBhZnRlcgo+PiBkLT5hcmNo
LmFsdHAybV9hY3RpdmUgaXMgc2V0KS4KPj4KPj4gVGhpcyBwYXRjaCByZW9yZ2FuaXplcyB0aGUg
Y29kZSBzbyB0aGF0IGQtPmFyY2guYWx0cDJtX2FjdGl2ZQo+PiBpcyBzZXQgdG8gdHJ1ZSBvbmx5
IGFmdGVyIGFsbCB0aGUgaW5pdCB3b3JrIGhhcyBiZWVuIGRvbmUsIGFuZAo+PiB0byBmYWxzZSBi
ZWZvcmUgdGhlIHVuaW5pdCB3b3JrIGJlZ2lucy4gVGhpcyByZXF1aXJlZCBhZGRpbmcKPj4gYSBu
ZXcgYm9vbCBwYXJhbWV0ZXIgYWx0cDJtX3ZjcHVfdXBkYXRlX3AybSgpLCB3aGljaCByZWxpZWQK
Pj4gb24gZC0+YXJjaC5hbHRwMm1fYWN0aXZlIGJlaW5nIHNldCBiZWZvcmUgaXQncyBjYWxsZWQu
Cj4+Cj4+IFdoaWxlIGF0IGl0LCBJJ3ZlIGNoYW5nZWQgYSBjb3VwbGUgb2YgYm9vbF90J3MgdG8g
Ym9vbCdzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBi
aXRkZWZlbmRlci5jb20+Cj4gCj4gRlRSIC0gdGhpcyBsb29rcyBva2F5IHRvIG1lIG5vdy4gQnV0
IEkgZG9uJ3QgZmVlbCBxdWFsaWZpZWQgdG8KPiBnaXZlIGFuIFItYiwgc28ganVzdCBmb3IgdGhl
IHBhcnRzIHdoZXJlIGl0J3MgYXBwbGljYWJsZQo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpUaGFua3MgZm9yIHRoZSBhY2sgYW5kIHRoZSBoZWxwIQoKClJhenZh
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
