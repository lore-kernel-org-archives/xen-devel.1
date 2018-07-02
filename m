From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] x86/msr: Drop {MISC_ENABLES,
 PLATFORM_INFO}.available
Date: Mon, 2 Jul 2018 12:51:45 +0100
Message-ID: <1c7216f0-9229-803d-e188-379c332dcbc5@citrix.com>
References: <1530525447-28347-1-git-send-email-andrew.cooper3@citrix.com>
 <1530525447-28347-3-git-send-email-andrew.cooper3@citrix.com>
 <5B3A0C3002000078001CFBD6@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B3A0C3002000078001CFBD6@prv1-mh.provo.novell.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDcvMTggMTI6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDAyLjA3LjE4IGF0
IDExOjU3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZXNlIE1TUnMg
YXJlIG5vbi1hcmNoaXRlY3R1cmFsIGFuZCB0aGUgYXZhaWxhYmxlIGJvb2xlYW5zIHdlcmUgdXNl
ZCBpbiBsaWV1Cj4+IG9mIGFuIGFyY2hpdGVjdHVyYWwgc2lnbmFsIG9mIGF2YWlsYWJpbGl0eS4g
IFRoZSBNU1JzIGFyZSB1bmNvbmRpdGlvbmFsbHkKPj4gYXZhaWxhYmxlIHRvIEhWTSBndWVzdHMs
IGJ1dCBjdXJyZW50bHkgZm9yIFBWIGd1ZXN0cywgYXJlIGhpZGRlbiB3aGVuIENQVUlECj4+IGZh
dWx0aW5nIGlzIHVuYXZhaWxhYmxlLgo+Pgo+PiBIb3dldmVyLCBpbiBoaW5kc2lnaHQsIHRoZSBh
ZGRpdGlvbmFsIGJvb2xlYW5zIG1ha2UgdG9vbHN0YWNrIE1TUiBpbnRlcmFjdGlvbnMKPj4gbW9y
ZSBjb21wbGljYXRlZC4gIEFzIHRoZSBiZWhhdmlvdXIgb2YgdGhlIE1TUnMgaXMgcmVzZXJ2ZWQg
d2hlbiB1bmF2YWlsYWJsZSwKPiBJcyBpdD8gSXNuJ3QgdGhlIGV4cGVjdGVkIChtYW5kYXRlZD8p
IGJlaGF2aW9yIHJhaXNpbmcgb2YgI0dQKDApIGluIHRoYXQKPiBjYXNlPwoKSXQgaXMgcGxhdGZv
cm0gc3BlY2lmaWMgYXMgdG8gd2hldGhlciB0aGUgTVNSIGV4aXN0cyBvbiBub3QsIGFuZCB0aGUK
b25seSByZWFzb25hYmxlIHdheSB0byBmaW5kIG91dCB3aGV0aGVyIGl0IGlzIGF2YWlsYWJsZSBp
cyB0byB0cnkKcmVhZGluZyBpdC4KCkluIHByYWN0aWNlLCB0aGVzZSBNU1JzIGFwcGVhciB0byBo
YXZlIGV4aXN0ZWQgc2luY2UgTmV0YnVyc3QsIGFuZCBoYXZlCmEgcmFuZ2Ugb2YgbWlzYyBub24t
YXJjaGl0ZWN0dXJhbCBmdW5jdGlvbmFsaXR5IGluIHRoZW0uCgpUaGVzZSBjaGFuZ2VzIGRvIG1h
a2UgdGhlIE1TUnMgdW5jb25kaXRpb25hbGx5IGF2YWlsYWJsZSBmcm9tIHRoZSBndWVzdHMKcG9p
bnQgb2YgdmlldywgYnV0IG9mZmVyaW5nIDAncyBpcyBjb21wYXRpYmxlIHdpdGggaG93IGEgZ3Vl
c3QgY29uc3VtZXMKdGhlIGluZm9ybWF0aW9uLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
