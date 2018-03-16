From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [RFC PATCH 00/30] Xen Q35 Bringup patches + support
 for PCIe Extended Capabilities for passed through devices
Date: Fri, 16 Mar 2018 18:36:57 +0000
Message-ID: <20180316183657.6eufscptiwrv7oyo@MacBook-Pro-de-Roger.local>
References: <cover.1520867740.git.x1917x@gmail.com>
 <20180317033458.00003797@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dokm=gg=citrix.com=prvs=60669260a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewuE5-00081M-23
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 18:37:13 +0000
Content-Disposition: inline
In-Reply-To: <20180317033458.00003797@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBNYXIgMTcsIDIwMTggYXQgMDM6MzQ6NThBTSArMTAwMCwgQWxleGV5IEcgd3JvdGU6
Cj4gQSBnZW50bGUgUkZDLXBpbmcuCj4gCj4gQW55IHRob3VnaHRzIG9uIHRoaXM/IFJlZ2FyZGlu
ZyB0aGUgZmVhdHVyZSBhcyBhIHdob2xlLiBTbyBmYXIgdGhlcmUKPiB3ZXJlIHJlc3BvbnNlcyBt
b3N0bHkgdGFyZ2V0aW5nIGluZGl2aWR1YWwgcGF0Y2hlcywgd2hpbGUgSSdkIGxpa2UgdG8KPiBo
ZWFyIGFib3V0IGNob3NlbiBhcHByb2FjaGVzIGluIGdlbmVyYWwsIHdoZXRoZXIgdGhlIG92ZXJh
bGwgZGlyZWN0aW9uCj4gaXMgY29ycmVjdCAob3Igbm90KSwgZXRjLiBJdCdzIGp1c3QgUkZDIGFm
dGVyIGFsbCwgbm90IHYxMS4gOikKCkkgcGxhbiB0byBsb29rIGF0IHRoZSBzZXJpZXMsIGJ1dCBp
biBnZW5lcmFsIHlvdSBzaG91bGQgd2FpdCBhdCBsZWFzdAo3IGRheXMgKG9uZSB3ZWVrKSBiZWZv
cmUgcGluZ2luZy4KCj4gSSBjYW4gc3BsaXQgaXQgaW50byB0d28gc2VyaWVzIGlmIHRoYXQgd291
bGQgYmUgcHJlZmVyYWJsZSwgb25lIGZvcgo+IGdlbmVyYWwgUTM1IGJyaW5nIHVwIGFuZCBiYXNp
YyBhY2Nlc3MgdG8gUENJZSBleHRlbmRlZCBjb25maWcKPiBzcGFjZSB2aWEgRUNBTSAodGhpcyBp
cyB3aGF0IHRoZSBmZWF0dXJlIHdhcyB1c2VkIGZvciBpbml0aWFsbHkpIGFuZAo+IHRoZSBzZWNv
bmQgcGFydCBpcyBwcm92aWRpbmcgc3VwcG9ydCBmb3IgUENJZSBFeHRlbmRlZCBDYXBhYmlsaXRp
ZXMKPiBlbXVsYXRpb24gaW5mcmFzdHJ1Y3R1cmUgKGh3L3hlbi94ZW4tcHQqLmMgaW4gUUVNVSku
CgpJIHdvdWxkIHdhaXQgYSBiaXQgYmVmb3JlIGRvaW5nIG1vcmUgd29yaywgYXMgc2FpZCBJIHBs
YW4gdG8gbG9vayBhdAp0aGUgc2VyaWVzLCBhbmQgb3RoZXIgcHJvYmFibHkgYXJlIHRvbywgaXQn
cyBqdXN0IHRoYXQgeW91IGdhdmUgdXMgdG9vCmxpdHRsZSB0aW1lIDspLgoKS2VlcCBpbiBtaW5k
IHdlIGFyZSBhcHByb2FjaGluZyBmZWF0dXJlIGZyZWV6ZSwgYW5kIHRoZXJlIGFyZSBzb21lCm1v
cmUgbWF0dXJlIHNlcmllcyB0aGF0IHdpbGwgbGlrZWx5IGdldCBtb3JlIHJldmlldyBhdHRlbnRp
b24gdGhhbgp5b3VycyBBVE0sIGluIG9yZGVyIHRvIHRyeSB0byBnZXQgdGhlbSBpbiBiZWZvcmUg
dGhlIGZyZWV6ZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
