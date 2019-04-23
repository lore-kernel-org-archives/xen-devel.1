From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
Date: Tue, 23 Apr 2019 20:36:13 +0200
Message-ID: <e744c7eb-1685-13b6-7ae9-e952f8f53ab0__7837.77379417501$1556044641$gmane$org@suse.com>
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-4-jgross@suse.com>
 <alpine.DEB.2.10.1904230955190.24598@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jhle=SZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJ0HC-00047C-Jq
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 18:36:18 +0000
In-Reply-To: <alpine.DEB.2.10.1904230955190.24598@sstabellini-ThinkPad-X260>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: boris.ostrovsky@oracle.com, xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, konrad.wilk@oracle.com
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDQvMjAxOSAxOTowNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFR1ZSwg
MjMgQXByIDIwMTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEluc3RlYWQgb2YgYWx3YXlzIGNh
bGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSBpbiBjYXNlIHRoZQo+PiBtZW1v
cnkgaXMgRE1BLWFibGUgZm9yIHRoZSB1c2VkIGRldmljZSwgZG8gc28gb25seSBpbiBjYXNlIGl0
IGhhcyBiZWVuCj4+IG1hZGUgRE1BLWFibGUgdmlhIHhlbl9jcmVhdGVfY29udGlndW91c19yZWdp
b24oKSBiZWZvcmUuCj4+Cj4+IFRoaXMgd2lsbCBhdm9pZCBhIGxvdCBvZiB4ZW5fZGVzdHJveV9j
b250aWd1b3VzX3JlZ2lvbigpIGNhbGxzIGZvcgo+PiA2NC1iaXQgY2FwYWJsZSBkZXZpY2VzLgo+
Pgo+PiBBcyB0aGUgbWVtb3J5IGluIHF1ZXN0aW9uIGlzIG93bmVkIGJ5IHN3aW90bGIteGVuIHRo
ZSBQR19vd25lcl9wcml2XzEKPj4gZmxhZyBvZiB0aGUgZmlyc3QgYWxsb2NhdGVkIHBhZ2UgY2Fu
IGJlIHVzZWQgZm9yIHJlbWVtYmVyaW5nLgo+IAo+IEFsdGhvdWdoIHRoZSBwYXRjaCBsb29rcyBP
SywgdGhpcyBzZW50ZW5jZSBwdXp6bGVzIG1lLiBXaHkgZG8geW91IHNheQo+IHRoYXQgdGhlIG1l
bW9yeSBpbiBxdWVzdGlvbiBpcyBvd25lZCBieSBzd2lvdGxiLXhlbj8gQmVjYXVzZSBpdCB3YXMK
PiByZXR1cm5lZCBieSB4ZW5fYWxsb2NfY29oZXJlbnRfcGFnZXM/IEJvdGggdGhlIHg4NiBhbmQg
dGhlIEFybQo+IGltcGxlbWVudGF0aW9uIHJldHVybiBmcmVzaCBuZXcgbWVtb3J5LCBoZW5jZSwg
aXQgc2hvdWxkIGJlIHNhZmUgdG8gc2V0Cj4gdGhlIFBhZ2VPd25lclByaXYxIGZsYWc/Cj4gCj4g
TXkgY29uY2VybiB3aXRoIHRoaXMgYXBwcm9hY2ggaXMgd2l0aCB0aGUgc2VtYW50aWNzIG9mIFBH
X293bmVyX3ByaXZfMS4KPiBJcyBhIHBhZ2UgbWFya2VkIHdpdGggUEdfb3duZXJfcHJpdl8xIG9u
bHkgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0aGUKPiBvd25lcj8KClRoZSBvd25lciBvZiB0aGUg
cGFnZSBpcyBmcmVlIHRvIHVzZSB0aGUgZmxhZy4KCkxpa2UgR3JhbnQgcGFnZXMgYXJlIG1hcmtl
ZCBieSB0aGUgZ3JhbnQgZHJpdmVyIHVzaW5nIHRoaXMgZmxhZy4gQW5kClhlbiBwYWdlIHRhYmxl
cyBhcmUgdXNpbmcgaXQgaW4gUFYtZ3Vlc3RzIGZvciBpbmRpY2F0aW5nIGEgIlBpbm5lZCIKcGFn
ZSB0YWJsZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
