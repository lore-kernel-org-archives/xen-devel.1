From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] SVM: re-work VMCB sync-ing
Date: Thu, 26 Apr 2018 11:20:58 -0400
Message-ID: <e20049ff-6eba-1ebb-b63a-149b0a40cd06@oracle.com>
References: <5AE1BF9D02000078001BEC18@prv1-mh.provo.novell.com>
 <22c156d4-c841-654c-c181-1ba4f4d4e0ab@citrix.com>
 <5AE1D53402000078001BED10@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=etlv=hp=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fBig7-0003hz-FE
 for xen-devel@lists.xenproject.org; Thu, 26 Apr 2018 15:19:23 +0000
In-Reply-To: <5AE1D53402000078001BED10@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMjYvMjAxOCAwOTozMyBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtc3RhdGljIHZv
aWQgc3ZtX3N5bmNfdm1jYihzdHJ1Y3QgdmNwdSAqdikKPj4+ICtzdGF0aWMgdm9pZCBzdm1fc3lu
Y192bWNiKHN0cnVjdCB2Y3B1ICp2LCBlbnVtIHZtY2Jfc3luY19zdGF0ZSBuZXdfc3RhdGUpCj4+
PiAgewo+Pj4gICAgICBzdHJ1Y3QgYXJjaF9zdm1fc3RydWN0ICphcmNoX3N2bSA9ICZ2LT5hcmNo
Lmh2bV9zdm07Cj4+PiAgCj4+PiAtICAgIGlmICggYXJjaF9zdm0tPnZtY2JfaW5fc3luYyApCj4+
PiAtICAgICAgICByZXR1cm47Cj4+PiAtCj4+PiAtICAgIGFyY2hfc3ZtLT52bWNiX2luX3N5bmMg
PSAxOwo+Pj4gKyAgICBpZiAoIGFyY2hfc3ZtLT52bWNiX3N5bmNfc3RhdGUgPT0gdm1jYl9uZWVk
c192bXNhdmUgKQo+Pj4gKyAgICAgICAgc3ZtX3Ztc2F2ZShhcmNoX3N2bS0+dm1jYik7Cj4+PiAg
Cj4+PiAtICAgIHN2bV92bXNhdmUoYXJjaF9zdm0tPnZtY2IpOwo+Pj4gKyAgICBpZiAoIGFyY2hf
c3ZtLT52bWNiX3N5bmNfc3RhdGUgIT0gdm1jYl9uZWVkc192bWxvYWQgKQo+Pj4gKyAgICAgICAg
YXJjaF9zdm0tPnZtY2Jfc3luY19zdGF0ZSA9IG5ld19zdGF0ZTsKPj4gVGhpcyBpcyBzbGlnaHRs
eSBhd2t3YXJkIGZvciBhIGNvdXBsZSBvZiByZWFzb25zLiAgRmlyc3QsIHBhc3NpbmcKPj4gdm1j
Yl9pbl9zeW5jIGluIGZvcmdldCB0aGUgZmFjdCB0aGF0IGEgdm1sb2FkIGlzIG5lZWRlZC4KPiBD
ZXJ0YWlubHkgbm90IC0gdGhhdCdzIHRoZSBwdXJwb3NlIG9mIHRoZSBpZigpIGFyb3VuZCBpdC4K
Pgo+PiBJbiBteSBwYXRjaCwgSSBpbnRyb2R1Y2VkIHN2bV9zeW5jX3ZtY2JfZm9yX3VwZGF0ZSgp
LCByYXRoZXIgdGhhbgo+PiByZXF1aXJpbmcgYSBwYXJhbWV0ZXIgdG8gYmUgcGFzc2VkIGluLiAg
SSB0aGluayB0aGlzIGlzIGEgYmV0dGVyIEFQSSwKPj4gYW5kIGl0IHNocmlua3MgdGhlIHNpemUg
b2YgdGhlIHBhdGNoLgo+IEknbSBub3QgY29udmluY2VkIG9mIHRoZSAiYmV0dGVyIiwgYW5kIGV2
ZW4gbGVzcyBzbyBvZiB0aGUgInNocmlua3MiLiBCdXQKPiBJJ2xsIHdhaXQgdG8gc2VlIHdoYXQg
dGhlIFNWTSBtYWludGFpbmVycyBzYXkuCgoKSSB0aGluayBhIHNpbmdsZSBmdW5jdGlvbiBpcyBi
ZXR0ZXIuIEluIGZhY3QsIEkgd2FzIHdvbmRlcmluZyB3aGV0aGVyCnN2bV92bWxvYWQoKSBjb3Vs
ZCBhbHNvIGJlIGZvbGRlZCBpbnRvIHN2bV9zeW5jX3ZtY2IoKSBzaW5jZSBpdCBpcyBhbHNvCmEg
c3luY2luZyBvcGVyYXRpb24uCgotYm9yaXMKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
