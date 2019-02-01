From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12] automation: introduce a QEMU smoke
 test for PVH Dom0
Date: Fri, 1 Feb 2019 16:06:13 +0100
Message-ID: <924e71bd-b8fd-628e-4e1a-f992cb66b4a1@suse.com>
References: <20190124152411.20304-1-wei.liu2@citrix.com>
 <20190201134204.rj2lbojxtdg7u5yl@doug-macbook.localdomain>
 <5cce0402-be4d-efd0-2908-a8cb79d2fef9@suse.com>
 <20190201150255.rlmlro4jyyhjh62u@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpaOW-0003Pj-4i
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 15:06:16 +0000
In-Reply-To: <20190201150255.rlmlro4jyyhjh62u@zion.uk.xensource.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNjowMiwgV2VpIExpdSB3cm90ZToKPiBPbiBGcmksIEZlYiAwMSwgMjAx
OSBhdCAwMzo1OTo1OFBNICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwMS8wMi8y
MDE5IDE0OjQyLCBEb3VnIEdvbGRzdGVpbiB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDI0LCAyMDE5
IGF0IDAzOjI0OjExUE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6Cj4+Pj4gTWFrZSBxZW11LXNtb2tl
LXg4Ni02NC5zaCB0YWtlIGEgdmFyaWFudCBhcmd1bWVudC4gTWFrZSB0d28gbmV3IHRlc3RzCj4+
Pj4gaW4gdGVzdC55YW1sLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxp
dTJAY2l0cml4LmNvbT4KPj4+Cj4+PiBBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBj
YXJkb2UuY29tPgo+Pj4KPj4+IFRoaXMgaXMgYSBnb29kIGltcHJvdmVtZW50IHRvIGluY3JlYXNl
IG91ciB0ZXN0IGNvdmVyYWdlLiBUaGFua3MgZm9yCj4+PiBkb2luZyB0aGlzIFdlaS4KPj4KPj4g
SSdtIHF1aXRlIGhlc2l0YW50IHRvIGFjY2VwdCB0aGF0IGluIHRoZSBSQy1waGFzZSBvZiA0LjEy
LiBDb3VsZCB5b3UgZG8KPj4gc29tZSB0ZXN0IHJvdW5kcyB0byBlbnN1cmUgdGhpcyB0ZXN0IHdv
bid0IGJlIGJsb2NraW5nIGR1ZSB0bwo+PiBpbnRlcm1pdHRlbnQgZmFpbHVyZXM/Cj4gCj4gVGhp
cyBpc24ndCBhIHBhdGNoIHRvIG9zc3Rlc3QuIEl0IGlzIGEgcGF0Y2ggdG8gR2l0bGFiIENJLCB3
aGljaCBkb2Vzbid0Cj4gYmxvY2sgb3NzdGVzdCBpbiBhbnkgd2F5Lgo+IAo+IEkgYWxzbyByYW4g
YW4gYWRob2MgcGlwZWxpbmUgdG8gbWFrZSBzdXJlIGl0IHdvcmtlZC4KCkFoLCBva2F5LiBUaGVu
IHlvdSBjYW4gaGF2ZSBteToKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
