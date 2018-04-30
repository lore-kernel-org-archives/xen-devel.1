From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] xen: char: Remove unnecessary (uart->irq >
 0) check
Date: Mon, 30 Apr 2018 15:31:38 +0100
Message-ID: <ecb6f9b6-4c1e-e9df-174b-13f165790258@arm.com>
References: <1524906494-6917-1-git-send-email-amittomer25@gmail.com>
 <5AE6D17602000078001BF7D9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fywh=ht=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fD9qC-0000gO-NM
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 14:31:44 +0000
In-Reply-To: <5AE6D17602000078001BF7D9@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Amit Singh Tomar <amittomer25@gmail.com>
Cc: edgar.iglesias@xilinx.com, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, andre.przywara@arm.com, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, baozich@gmail.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMC8wNC8xOCAwOToxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjguMDQu
MTggYXQgMTE6MDgsIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+IHdyb3RlOgo+PiBXaGlsZSB3b3Jr
aW5nIG9uIE1WRUJVIHVhcnQgZHJpdmVyLCBKdWxpZW4gcG9pbnRlZCBvdXQgdGhhdCAodWFydC0+
aXJxID4gMCkKPj4gY2hlY2sgaXMgdW5uZWNlc3NhcnkgZHVyaW5nIGlycSBzZXQgdXAuaWYgZXZl
ciB0aGVyZSBpcyBhbiBpbnZhbGlkIGlycSwgZHJpdmVyCj4+IGluaXRpYWxpemF0aW9uIGl0c2Vs
ZiB3b3VsZCBiZSBiYWlsZWQgb3V0IGZyb20gcGxhdGZvcm1fZ2V0X2lycS4KPj4KPj4gVGhpcyBw
YXRjaCB3b3VsZCByZW1vdmUgc2ltaWxhciBjaGVjayBmb3Igb3RoZXIgdWFydCBkcml2ZXJzIHBy
ZXNlbnQgaW4gWEVOLgo+IAo+IEF0IHRoZSBleGFtcGxlIG9mIHRoZSBjaGFuZ2VzIHRvIG5zMTY1
NTAuYyB5b3UgZG8sIHRoaXMgaXMgbm90IGNvcnJlY3QuIEkKPiBjYW4ndCBqdWRnZSBhYm91dCB0
aGUgdmFyaW91cyBBUk0gc3BlY2lmaWMgZHJpdmVycywgYnV0IHRoZSAxNjU1MCBjYW4gd2VsbAo+
IGJlIHJ1biBpbiBwb2xsaW5nIG1vZGUsIGFuZCBoZW5jZSBmYWlsdXJlIHRvIHNldCB1cCBhbiBp
bnRlcnJ1cHQgaXMgbm90IGZhdGFsCj4gdG8gb3ZlcmFsbCBkcml2ZXIgaW5pdGlhbGl6YXRpb24u
CgpUaGlzIG1ha2VzIHNlbnNlIGZvciBhbnkgQVJNIG9ubHkgVUFSVCBkcml2ZXIgYmVjYXVzZSB0
aGV5IGRvbid0IHN1cHBvcnQgCnBvbGxpbmcuIEhvd2V2ZXIsIEkgYWdyZWUgdGhhdCBpZiB0aGUg
ZHJpdmVyIGlzIHN1cHBvcnRpbmcgcG9sbGluZyAoc3VjaCAKYXMgTlMxNjU1MCkgdGhlbiB5b3Ug
c2hvdWxkIGtlZXAgdGhlIGlycSBjaGVjayBhcm91bmQuCgpDaGVlcnMsCgo+IAo+PiBTaWduZWQt
b2ZmLWJ5OiBBbWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+Cj4+IC0tLQo+
PiAgICAgICogVGhpcyBwYXRjaCBpcyBvbmx5IGNvbXBpbGVkIHRlc3RlZC4KPiAKPiBJbiB3aGlj
aCBjYXNlIHRoaXMgc2hvdWxkIGJlIG1hcmtlZCBSRkMgaW1vLgo+IAo+IEphbgo+IAo+IAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
