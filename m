From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] amd-iommu: remove page merging code
Date: Tue, 27 Nov 2018 14:19:16 +0000
Message-ID: <a500cc7c-ec6b-9894-63a0-df3329790bdc@citrix.com>
References: <20181126173045.1274-1-paul.durrant@citrix.com>
 <5BFD415B02000078002005DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=curg=og=citrix.com=prvs=86220cbda=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gReCz-00014v-59
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 14:19:25 +0000
In-Reply-To: <5BFD415B02000078002005DF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMTEvMjAxOCAxMzowNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjYuMTEuMTgg
YXQgMTg6MzAsIDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IFRoZSBwYWdlIG1l
cmdpbmcgbG9naWMgbWFrZXMgdXNlIG9mIGJpdHMgMS04IGFuZCBiaXQgNjMgb2YgYSBQVEUsIHdo
aWNoIHVzZWQKPj4gdG8gYmUgc3BlY2lmaWVkIGFzIGlnbm9yZWQuIEhvd2V2ZXIsIGJpdHMgNSBh
bmQgNiBhcmUgbm93IHNwZWNpZmllZCBhcwo+PiAnYWNjZXNzZWQnIGFuZCAnZGlydHknIGJpdHMg
YW5kIHRoZWlyIHVzZSBvbmx5IHJlbWFpbnMgc2FmZSBhcyBsb25nIGFzCj4+IHRoZSBEVEUgJ0hv
c3QgQWNjZXNzIERpcnR5JyBiaXRzIHJlbWFpbiBjbGVhci4KPiBVcG9uIHNlY29uZCB0aG91Z2h0
IC0gaXMgdGhpcyBhY3R1YWxseSB0cnVlIHdpdGggdGhlIFhTQS0yNzUKPiBjaGFuZ2VzIGluIHBs
YWNlPyBBcyBsb25nIGFzIHRoZSBkb21haW4gaXMgbm90IHJ1bm5pbmcgeWV0LAo+IGhvdyB3b3Vs
ZCBBIGFuZC9vciBEIGJpdHMgZ2V0IHNldD8KCkRURS5IQUQgaXMgYW4gSU9NTVUgY29udHJvbCB3
aGljaCBYZW4gZG9lc24ndCBjdXJyZW50bHkgZW5hYmxlLCBzbyB0aGlzCmlzbid0IGFuIGlzc3Vl
IGluIGN1cnJlbnQgdXNhZ2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
