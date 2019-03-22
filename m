From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH RESEND 1/3] OvmfPkg/XenSupport: remove usage
 of prefetchable PCI host bridge aperture
Date: Fri, 22 Mar 2019 17:33:01 +0900
Message-ID: <20190322082650.tk65vju74g4gt7vj@MacBook-Air-de-Roger.local>
References: <1551876056-28223-1-git-send-email-igor.druzhinin@citrix.com>
 <1551876056-28223-2-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=OW6j=RZ=citrix.com=prvs=977fcb30c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1h7Fc6-00085a-N7
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 08:33:18 +0000
Content-Disposition: inline
In-Reply-To: <1551876056-28223-2-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: ard.biesheuvel@linaro.org, jordan.l.justen@intel.com, edk2-devel@lists.01.org, julien.grall@arm.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org, lersek@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMDYsIDIwMTkgYXQgMTI6NDA6NTRQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gVGhpcyBhcGVydHVyZSBkb2Vzbid0IGV4aXN0IGluIE9WTUYgYW5kIHRyeWluZyB0
byB1c2UgaXQgY2F1c2VzCj4gZmFpbGluZyBhc3NlcnRpb25zIGxhdGVyIGluIGNhc2VzIHRoZXJl
IGFyZSBwcmVmZXRjaGFibGUgYW5kCj4gbm9uLXByZWZldGNoYWJsZSBCQVJzIGZvbGxvd2luZyBl
YWNoIG90aGVyLiBUaGlzIGNvbmZpZ3VyYXRpb24gaXMKPiBxdWl0ZSBsaWtlbHkgd2l0aCBzb21l
IFBDSSBwYXNzdGhyb3VnaCBkZXZpY2VzLgoKQWNjb3JkaW5nIHRvIHRoZSBQQ0llIHNwZWMsIGl0
J3MgZmluZSB0byBwbGFjZSBwcmVmZXRjaGFibGUgQkFScyBpbgpub24tcHJlZmV0Y2hhYmxlIG1l
bW9yeSBzcGFjZS4gVGhlcmUncyBhIG5vdGUgdGhhdCBzYXlzIHRoYXQgbW9zdAppbXBsZW1lbnRh
dGlvbnMgd2lsbCBvbmx5IGhhdmUgMUcgb2Ygbm9uLXByZWZldGNoYWJsZSBtZW1vcnksIGFuZAp0
aGF0IG1vc3Qgc2NhbGFibGUgcGxhdGZvcm1zIHdpbGwgbWFwIDMyYml0IEJBUnMgaW50bwpub24t
cHJlZmV0Y2hhYmxlIG1lbW9yeSByZWdhcmRsZXNzIG9mIHRoZSBwcmVmZXRjaGFibGUgYml0IHZh
bHVlLgoKU2hvdWxkbid0IE9WTUYgYmUgZmluZSB3aXRoIGZpbmRpbmcgYm90aCBwcmVmZXRjaGFi
bGUgYW5kCm5vbi1wcmVmZXRjaGFibGUgQkFScywgYXMgbG9uZyBhcyB0aGUgbWVtb3J5IHJlZ2lv
biBpcyBzZXQgdG8Kbm9uLXByZWZldGNoYWJsZT8KCkRvZXMgT1ZNRiBoYXZlIHRoZSBjYXBhYmls
aXR5IHRvIHBvc2l0aW9uIEJBUnMgYnkgaXRzZWxmPyBJZiBzbyB3ZQpjb3VsZCBza2lwIG9mIHRo
ZSBwbGFjZW1lbnQgZG9uZSBieSBodm1sb2FkZXIgYW5kIGp1c3QgbGV0IE9WTUYKcG9zaXRpb24g
dGhpbmdzIHdoZXJlIGl0IHNlZSBmaXQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
