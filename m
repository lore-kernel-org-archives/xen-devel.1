From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Ping: [PATCH 0/5] x86: more power-efficient CPU
 parking
Date: Wed, 29 Aug 2018 18:01:31 +0100
Message-ID: <0a2bdb90-fee3-895c-c40c-b4bfe03e5112@citrix.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B86467B02000078001E2D9E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xzde=lm=citrix.com=prvs=772b5abf7=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fv3qY-0007Jm-Mv
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 17:01:34 +0000
In-Reply-To: <5B86467B02000078001E2D9E@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMDg6MDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAxLjA4LjE4IGF0
IDE2OjIyLCAgd3JvdGU6Cj4+IFdoZW4gcHV0dGluZyBDUFVzIHRvIHNsZWVwIHBlcm1hbmVudGx5
LCB3ZSBzaG91bGQgdHJ5IHRvIHB1dCB0aGVtIGludG8KPj4gdGhlIG1vc3QgcG93ZXIgY29uc2Vy
dmluZyBzdGF0ZSBwb3NzaWJsZS4gRm9yIG5vdyBpdCBpcyB1bmNsZWFyIHdoZXRoZXIsCj4+IGVz
cGVjaWFsbHkgaW4gYSBkZWVwIEMtc3RhdGUsIHRoZSBQLXN0YXRlIGFsc28gbWF0dGVycywgc28g
dGhpcyBzZXJpZXMgb25seQo+PiBhcnJhbmdlcyBmb3IgdGhlIEMtc3RhdGUgc2lkZSBvZiB0aGlu
Z3MgKHBsdXMgc29tZSBjbGVhbnVwKS4KPj4KPj4gMTogeDg2L2NwdWlkbGU6IHJlcGxhY2UgYSBw
b2ludGxlc3MgTlVMTCBjaGVjawo+PiAyOiB4ODYvaWRsZTogcmUtYXJyYW5nZSBkZWFkLWlkbGUg
aGFuZGxpbmcKPj4gMzogeDg2L2NwdWlkbGU6IHB1c2ggcGFya2VkIENQVXMgaW50byBkZWVwZXIg
c2xlZXAgc3RhdGVzIHdoZW4gcG9zc2libGUKPj4gNDogeDg2L2NwdWlkbGU6IGNsZWFuIHVwIEN4
IGR1bXBpbmcKPj4gNTogeDg2OiBwbGFjZSBub24tcGFya2VkIENQVXMgaW50byB3YWl0LWZvci1T
SVBJIHN0YXRlIGFmdGVyIG9mZmxpbmluZwoKSSBkb24ndCBoYXZlIGEgcHJvYmxlbSBpbiBwcmlu
Y2lwbGUsIGJ1dCBJJ20gYWZyYWlkIHRoYXQgeW91J3JlIGdvaW5nIHRvCm5lZWQgZWl0aGVyIHBv
c2l0aXZlIGRvY3VtZW50YXRpb24sIG9yIGEgcG9zaXRpdmUgc3RhdGVtZW50IGZyb20gSW50ZWwK
YW5kIEFNRCB0aGF0IHdhaXQtZm9yLVNJUEkgaXMgdGhlIG1vc3QgcG93ZXIgZWZmaWNpZW50IHN0
YXRlIHRvIHBhcmsgYQpDUFUgaW4uCgpBdCBhIGd1ZXNzLCBJJ2QgZXhwZWN0IHRoYXQgd2FpdC1m
b3ItU0lQSSBpc24ndCBhbiBvcHRpbWlzZWQgc3RhdGUKKGJlY2F1c2UgdGhlIHZlbmRvcnMgd291
bGRuJ3QgZXhwZWN0IGhhcmR3YXJlIHRvIGJlIGluIHRoaXMgc3RhdGUgYWZ0ZXIKYm9vdCksIGFu
ZCBmcm9tIHRoZSB2YXJpb3VzIGRpc2N1c3Npb25zIGFyb3VuZCBMMVRGLCB0aGVyZSBhcmUKZGVm
aW5pdGVseSBkaWZmZXJlbmNlcyBiZXR3ZWVuIHdhaXQtZm9yLVNJUEkgYW5kIG13YWl0LgoKfkFu
ZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
