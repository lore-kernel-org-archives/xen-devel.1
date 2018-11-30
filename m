From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 01/13] x86: reduce general stack
 alignment to 8
Date: Fri, 30 Nov 2018 02:03:29 -0700
Message-ID: <5C00FCE10200007800201772@prv1-mh.provo.novell.com>
References: <5B97C28802000078001E7456@prv1-mh.provo.novell.com>
 <5BE45CB602000078001F9C6A@prv1-mh.provo.novell.com>
 <5BE45ED902000078001F9C96@prv1-mh.provo.novell.com>
 <20181129174458.3ovvxhuaruo2bzws@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uARp=OJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gSejr-0001iS-Ru
 for xen-devel@lists.xenproject.org; Fri, 30 Nov 2018 09:05:31 +0000
In-Reply-To: <20181129174458.3ovvxhuaruo2bzws@zion.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjExLjE4IGF0IDE4OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBOb3YgMDgsIDIwMTggYXQgMDk6MDU6NDVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvTWFrZWZpbGUKPj4gKysrIGIveGVuL2FyY2gv
eDg2L2VmaS9NYWtlZmlsZQo+PiBAQCAtNSw3ICs1LDExIEBAIENGTEFHUyArPSAtZnNob3J0LXdj
aGFyCj4+ICAKPj4gIGJvb3QuaW5pdC5vOiBidWlsZGlkLm8KPj4gIAo+PiArRUZJT0JKIDo9IGJv
b3QuaW5pdC5vIGNvbXBhdC5vIHJ1bnRpbWUubwo+PiArCj4+ICskKEVGSU9CSik6IENGTEFHUy1z
dGFjay1ib3VuZGFyeSA6PSAtbXByZWZlcnJlZC1zdGFjay1ib3VuZGFyeT00Cj4gCj4gRnJvbSBn
Y2MncyBtYW51YWwgb24gLW1pbmNvbWluZy1zdGFjay1ib3VuZGFyeToKPiAKPiAiVGh1cyBjYWxs
aW5nIGEgZnVuY3Rpb24gY29tcGlsZWQgd2l0aCBhIGhpZ2hlciBwcmVmZXJyZWQgc3RhY2sgYm91
bmRhcnkKPiBmcm9tIGEgZnVuY3Rpb24gY29tcGlsZWQgd2l0aCBhIGxvd2VyIHByZWZlcnJlZCBz
dGFjayBib3VuZGFyeSBtb3N0Cj4gbGlrZWx5IG1pc2FsaWducyB0aGUgc3RhY2suIiAKPiAKPiBJ
IG5vdGljZSBydW50aW1lLm8gbm93IGhhcyBzdGFjayBhbGlnbm1lbnQgb2YgMl40IHdoaWxlIHRo
ZSByZXN0IG9mIHhlbgo+IGhhcyAyXjMuCj4gCj4gVGhlcmUgaXMgYXQgbGVhc3Qgb25lIGV4YW1w
bGUgKGVmaV9nZXRfdGltZSkgdGhhdCBjb3VsZCBtaXNhbGlnbiB0aGUKPiBzdGFjay4gSXMgdGhh
dCBva2F5PwoKSXQgd291bGQgbm90IGJlIG9rYXkgaWYgdGhlIHJ1bnRpbWUgY2FsbCBtYWNoaW5l
cnkgd291bGRuJ3QgZm9yY2UKMzItYnl0ZSBhbGlnbm1lbnQgb2YgdGhlIHN0YWNrLiBTZWUgdGhl
IGRlY2xhcmF0aW9uIG9mIHN0cnVjdAplZmlfcnNfc3RhdGUsIGFuIGluc3RhbmNlIG9mIHdoaWNo
IGdldHMgcHV0IG9uIHRoZSBzdGFjayBvZiBldmVyeQpmdW5jdGlvbiBtYWtpbmcgcnVudGltZSBj
YWxscy4gQWxzbyBub3RlIGhvdyB0aGlzIGlzIG5vIGRpZmZlcmVudApmcm9tIHByaW9yIHRvIHRo
aXMgY2hhbmdlLCBhcyBleHBsYWluZWQgYnkgdGhlIGNvbW1lbnQgaW4gdGhhdApzdHJ1Y3R1cmUg
ZGVjbGFyYXRpb24sIGV4Y2VwdCB0aGF0IGluc3RlYWQgb2YgYWx3YXlzIHJ1bm5pbmcgb24KYSBy
ZWxpYWJseSBtaXMtYWxpZ25lZCBzdGFjayB3ZSB3aWxsIG5vdyBydW4gb24gYSBtaXh0dXJlICho
ZW5jZQp0aGUgY29kZSBbYW5kIHN0YWNrXSBzaXplIHNhdmluZ3MgbWVudGlvbmVkIGluIHRoZSBk
ZXNjcmlwdGlvbikuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
