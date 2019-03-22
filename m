From: Julien Grall <julien.grall@arm.com>
Subject: Re: vgic initialization with maximum number of
 interrupt lines fails
Date: Fri, 22 Mar 2019 16:38:45 +0000
Message-ID: <5eb6237c-5ef9-f620-58cc-0d778045cb00@arm.com>
References: <b5b240bd-2837-b404-f072-f229bd6fb766@ice.rwth-aachen.de>
 <ef416ee8-e523-56b4-c984-e0b3ea362333@arm.com>
 <6833242e-2258-2d6a-40fb-9ceb4711e5fb@ice.rwth-aachen.de>
 <1b2f36b7-7a45-dcc1-3f5a-bd6e19656979@arm.com>
 <5e80548b-f3db-5be8-0c8d-9f9014238ccb@ice.rwth-aachen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VRmA=RZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h7NBx-0008DZ-G5
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2019 16:38:49 +0000
In-Reply-To: <5e80548b-f3db-5be8-0c8d-9f9014238ccb@ice.rwth-aachen.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Lukas_J=c3=bcnger?= <lukas.juenger@ice.rwth-aachen.de>, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMi8wMy8yMDE5IDE2OjE5LCBMdWthcyBKw7xuZ2VyIHdyb3RlOgo+IE9uIDMvMjIv
MTkgNToxMiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4KPj4+PiBUaGlzIGlzIHdoeSB3ZSBs
aW1pdCB0byA5OTIgaW50ZXJydXB0cy4gQXMgRG9tMCBleHBvc2VzIHRoZSBzYW1lIG51bWJlciBv
ZiAKPj4+PiBpbnRlcnJ1cHRzIGFzIHRoZSBob3N0LCB0aGlzIGlzIGFuIGlzc3VlIG9uIHBsYXRm
b3JtIHdoZXJlIHRoZSBHSUMgcmVwb3J0IAo+Pj4+IDEwMjQgaW50ZXJydXB0cy4gQUZBSUssIHRo
b3NlIHBsYXRmb3JtcyBhcmUgb25seSB2aXJ0dWFsLCBzbyBteSBpZGVhIHdhcyB0byAKPj4+PiBs
aW1pdCB0aGUgbnVtYmVyIGludGVycnVwdHMgZXhwb3NlZCB0byBEb20wLiBTb21ldGhpbmcgbGlr
ZToKPj4+Pgo+Pj4+IGRvbTBfY2ZnLmFyY2gubnJfc3BpcyA9IG1pbihnaWNfbnVtYmVyX2xpbmVz
KCksIDk5MikgLSAzMjsKPj4+Pgo+Pj4+IERvZXMgeW91IHBsYXRmb3JtIGhhdmUgaW50ZXJydXB0
cyB3aXJlZCBhYm92ZSA5OTI/Cj4+Pgo+Pj4gSW4gbXkgc2ltdWxhdG9yIEkganVzdCByZWR1Y2Vk
IHRoZSBudW1iZXIgb2YgaW50ZXJydXB0cyByZXBvcnRlZCB0byBiZSAKPj4+IGF2YWlsYWJsZSBi
eSB0aGUgR0lDdjIgbW9kZWwuIFRoaXMgc29sdmVzIHRoZSBpc3N1ZSBmb3IgbXkgdXNlIGNhc2Uu
Cj4+Cj4+IFRoYW5rIHlvdSBmb3IgdGhlIGNvbmZpcm1hdGlvbi4gU28gYSBwYXRjaCBsaWtlIGFi
b3ZlIGluIFhlbiBzaG91bGQgd29yayBmb3IgdXMuCj4gCj4gU2hvdWxkIEkgc3VibWl0IGEgcGF0
Y2gsIG9yIGRvIHlvdSBqdXN0IHBhdGNoIHRoaXMgeW91cnNlbGY/IAoKSWYgeW91IGRvbid0IG1p
bmQsIHBsZWFzZSBzZW5kIGEgcGF0Y2guCgo+IERvIHlvdSB3YW50IHRvIGxpbWl0IHRvIDk5MiBv
ciA5ODAgbGlrZSB0aGUgb3JpZ2luYWwgY29kZSBkb2VzPwoKSSBndWVzcyB5b3UgbWVhbiA5OTIg
b3IgOTg4LiA5ODggaXMgdGhlIG1heGltdW0gbnVtYmVyIG9mIFNQSXMuIEluIG91ciBjYXNlLCB3
ZSAKd2FudCBtYXhpbXVtIDEwMjQgLSAzMiAtIDMyID0gOTYwIFNQSXMuIFRoZSBmaXJzdCAzMiBp
cyB0byByZW1vdmUgdGhlIGxhc3QgMzIgCmludGVycnVwdHMsIHRoZSBzZWNvbmQgaXMgdG8gc3Vi
dHJhY3QgdGhlIGxvY2FsIElSUXMuCgpTbyB0aGUgbnVtYmVyIGNhbiBlaXRoZXIgYmUgOTkyIG9y
IDk2MCBkZXBlbmRpbmcgb24gd2hlcmUgeW91IHdhbnQgdG8gcGxhY2UgdGhlIAptaW4oKS4gSSBh
bSBoYXBweSB3aXRoIGVpdGhlciB3YXkuCgpJbiBib3RoIGNhc2UsIHlvdSB3b3VsZCB3YW50IHRv
IHdyaXRlIGEgY29tbWVudCBvbiB0b3AgZXhwbGFpbmluZyB0aGUgcmVhc29uIGZvciAKdGhlIGxp
bWl0YXRpb24uCgpJIGFtIGhhcHB5IHRvIGd1aWRlIHlvdSB0aHJvdWdoIHRoZSBjaGFuZ2UgaWYg
eW91IG5lZWQgdG8uCgo+IAo+PiBPT0ksIHdoaWNoIHNpbXVsYXRvciBhcmUgeW91IHVzaW5nPwo+
IAo+IEl0J3Mgc29tZXRoaW5nIGJhc2VkIG9uIFFFTVUsIGJ1dCB0aGUgR0lDdjIgbW9kZWwgaXMg
ZnJvbSBWQ01MIAo+IChodHRwczovL2dpdGh1Yi5jb20vamFud2VpbnN0b2NrL3ZjbWwpLgoKVGhh
bmsgeW91IQoKQ2hlZXJzLAoKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
