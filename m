From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2] libxl: put RSDP for PVH guest near 4GB
Date: Tue, 19 Dec 2017 15:38:02 +0000
Message-ID: <20171219153802.355ha2zrocgb6mes@MacBook-Pro-de-Roger.local>
References: <20171201141407.21993-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=u91z=dp=citrix.com=prvs=519ad8697=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eRJyu-0004HQ-3W
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 15:39:00 +0000
Content-Disposition: inline
In-Reply-To: <20171201141407.21993-1-jgross@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBEZWMgMDEsIDIwMTcgYXQgMDM6MTQ6MDdQTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBJbnN0ZWFkIG9mIGxvY2F0aW5nIHRoZSBSU0RQIHRhYmxlIGJlbG93IDFNQiBwdXQg
aXQganVzdCBiZWxvdyA0R0IKPiBsaWtlIHRoZSByZXN0IG9mIHRoZSBBQ1BJIHRhYmxlcyBpbiBj
YXNlIG9mIFBWSCBndWVzdHMuIFRoaXMgd2lsbAo+IGF2b2lkIHB1bmNoaW5nIG1vcmUgaG9sZXMg
dGhhbiBuZWNlc3NhcnkgaW50byB0aGUgbWVtb3J5IG1hcC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Cj4gLS0tCj4gIHRvb2xzL2xpYnhjL3hjX2RvbV9odm1sb2FkZXIuYyB8
IDIgKy0KPiAgdG9vbHMvbGlieGwvbGlieGxfeDg2X2FjcGkuYyAgIHwgNSArKy0tLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvbGlieGMveGNfZG9tX2h2bWxvYWRlci5jIGIvdG9vbHMvbGlieGMveGNfZG9t
X2h2bWxvYWRlci5jCj4gaW5kZXggNTlmOTRlNTFlNS4uM2YwYmQ2NTU0NyAxMDA2NDQKPiAtLS0g
YS90b29scy9saWJ4Yy94Y19kb21faHZtbG9hZGVyLmMKPiArKysgYi90b29scy9saWJ4Yy94Y19k
b21faHZtbG9hZGVyLmMKPiBAQCAtMTM2LDcgKzEzNiw3IEBAIHN0YXRpYyBpbnQgbW9kdWxlX2lu
aXRfb25lKHN0cnVjdCB4Y19kb21faW1hZ2UgKmRvbSwKPiAgICAgIHN0cnVjdCB4Y19kb21fc2Vn
IHNlZzsKPiAgICAgIHZvaWQgKmRlc3Q7Cj4gIAo+IC0gICAgaWYgKCBtb2R1bGUtPmxlbmd0aCAp
Cj4gKyAgICBpZiAoIG1vZHVsZS0+bGVuZ3RoICYmICFtb2R1bGUtPmd1ZXN0X2FkZHJfb3V0ICkK
Cklzbid0IHRoYXQga2luZCBvZiBhIHNlcGFyYXRlIGZpeD8gQUZBSUNUIHRoaXMganVzdCBwcmV2
ZW50cwphbGxvY2F0aW5nIG1lbW9yeSBpZiBndWVzdF9hZGRyX291dCBpcyBhbHJlYWR5IHNldCB0
byBhIGZpeGVkCnBvc2l0aW9uLgoKVGhlIHJlc3QgTEdUTS4KClRoYW5rcywgUm9nZXIuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
