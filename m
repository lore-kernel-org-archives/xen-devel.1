From: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH] iommu: leave IOMMU enabled by default
 during kexec crash transition
Date: Fri, 22 Feb 2019 12:40:57 +0000
Message-ID: <94ee97ef-ce41-0940-3c7f-3b4cf2258bed@citrix.com>
References: <1550506867-26221-1-git-send-email-igor.druzhinin@citrix.com>
 <5C6BBAA50200007800217DCE@prv1-mh.provo.novell.com>
 <1df95f34-34c8-88cd-6971-748d565f34a8@citrix.com>
 <5C6D146602000078002183D2@prv1-mh.provo.novell.com>
 <df8a00b2-2c53-307c-e459-d1180a2b785a@citrix.com>
 <5C6FC65E0200007800219095@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3YMO=Q5=citrix.com=prvs=949a3c8b6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1gxA9R-0002uO-7b
 for xen-devel@lists.xenproject.org; Fri, 22 Feb 2019 12:42:01 +0000
In-Reply-To: <5C6FC65E0200007800219095@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDIvMjAxOSAwOTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjAuMDIuMTkg
YXQgMTk6MTksIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjAvMDIv
MjAxOSAwODo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pgo+Pj4gU29tZSBlbnRpdHkgbmVlZHMg
dG8gZGVjaWRlIHdoZXRoZXIgdG8gYWRkIHRoZSByZXNwZWN0aXZlIGNvbW1hbmQKPj4+IGxpbmUg
b3B0aW9uIHRvIHRoZSBjcmFzaCBrZXJuZWwncyBjb21tYW5kIGxpbmUuIEl0IHNob3VsZCBiZSB0
aGlzIHNhbWUKPj4+IGVudGl0eSB0byB0ZWxsIFhlbiB3aGV0aGVyIHRvIGtlZXAgdGhlIElPTU1V
IGVuYWJsZWQgd2hpbGUgaW52b2tpbmcKPj4+IHRoZSBjcmFzaCBrZXJuZWwuIEkgYW0gbWVyZWx5
IGd1ZXNzaW5nIHRoYXQgdGhpcyBlbnRpdHkgaXMgdGhlIGtleGVjCj4+PiB0b29sLgo+Pj4KPj4K
Pj4gSSB3YXMganVzdCBkb3VibGUgY2hlY2tpbmcgYW5kIGl0IHNlZW1zIChhc3N1bWluZyB0aGUg
ZGV2aWNlIHJlc2V0Cj4+IGNvcnJlY3RseSBpbiB0aGUgY3Jhc2gga2VybmVsKSBldmVyeXRoaW5n
IHNlZW0gdG8gd29yayBldmVuIHdpdGhvdXQKPj4gZW5hYmxpbmcgaW50ZWxfaW9tbXUgaW4gdGhl
IGNvbW1hbmQgbGluZSAtIG5ld2VyIGtlcm5lbHMgaGFuZGxlIHRoaXMKPj4gY2FzZSBieSBleHBs
aWNpdGx5IGRpc2FibGluZyB0cmFuc2xhdGlvbiBpbiBhbnkgY2FzZTogdGhleSBleHBlY3QgaXQg
dG8KPj4gYmUgZW5hYmxlZCBieSB0aGUgcHJldmlvdXMga2VybmVsLgo+IAo+IFNvIGlmIHRoZXkg
ZGlzYWJsZSB0cmFuc2xhdGlvbiwgaG93IGlzIHRoZW0gZG9pbmcgc28gYW55IGJldHRlciB0aGFu
IHVzCj4gZG9pbmcgc28sIG90aGVyIHRoYW4gdGhlaXJzIG9jY3VycmluZyBzbGlnaHRseSBsYXRl
ciBvbiB0aGUgdGltZSBzY2FsZSBhbmQKPiBoZW5jZSB0aGVyZSBiZWluZyBiZXR0ZXIgY2hhbmNl
cyBvZiBpbi1mbGlnaHQgKGF0IHRoZSB0aW1lIG9mIHRoZSBjcmFzaCkKPiBETUEgaGF2aW5nIGNv
bXBsZXRlZCBtZWFud2hpbGU/Cj4gCgpUaGVyZSBhcmUgc2V2ZXJhbCByZWFzb25zIHdoeSBpdCdz
IGJldHRlcjoKYSkga2VybmVsIGlzIGFibGUgdG8gcGVyZm9ybSBkZXZpY2UgcmVzZXQgcHJvcGVy
bHkgYXMgaXQgaGFzIGJ1cwpzcGVjaWZpYyBjb2RlIHRoYXQgZG9lcyB0aGlzLiBUaGVyZSBpcyBl
dmVuIGEgY29tbWVudCBpbiB0aGUgY29kZQptZW50aW9uaW5nIHRoYXQgYXQgdGhlIG1vbWVudCBp
dCBkaXNhYmxlcyB0aGUgdHJhbnNsYXRpb24gYnVzLXNwZWNpZmljCnJlc2V0IGlzIGZpbmlzaGVk
IGFuZCBpdCdzIHNhZmVyIChhcyBkZXZpY2VzIGxpa2VseSBzdG9wcGVkIERNQSBhdCB0aGlzCnBv
aW50KSB0byBkbyBpdCBub3cuCmIpIGtlcm5lbCBoYXMgdGhlIGRyaXZlcnMgdGhhdCBkbyBwZXIt
ZHJpdmVyLXNwZWNpZmljIHJlc2V0IG9mIHRoZQpkZXZpY2VzIHRoYXQgZG8gbm90IHdvcmsgd2Vs
bCB3aXRoIGJ1cy1zcGVjaWZpYyByZXNldC4gSXQncyBzaW1wbHkKaW1wb3NzaWJsZSB0byBpbXBs
ZW1lbnQgdGhhdCBpbiBYZW4KYykgZXZlbiBpZiBhIGRldmljZSBpcyB1bmNvb3BlcmF0aXZlIGFu
ZCBrZWVwcyBzZW5kaW5nIGJ1cyB0cmFuc2FjdGlvbnMsCmFuIGVycm9yIGV2ZW50IHRoYXQgSSBt
ZW50aW9uZWQgZWFybGllciB3aWxsIGJlIHByb3Blcmx5IGhhbmRsZWQgYXMgd2UKaGF2ZSBmYWNp
bGl0aWVzIGZvciBpdCBpbiB0aGUga2VybmVsIGF0IHRoYXQgcG9pbnQKCklnb3IKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
