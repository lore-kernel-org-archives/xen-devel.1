From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Fri, 31 Aug 2018 21:18:36 +0100
Message-ID: <a51b35eb-98cf-c1d3-a4cb-da096178842f@citrix.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
 <d0531953-521f-9a0f-8e1b-8709b69da3b3@citrix.com>
 <5B879DBE02000078001E3591@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvsg=lo=citrix.com=prvs=7748f1fea=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fvpsO-0007k9-EZ
 for xen-devel@lists.xenproject.org; Fri, 31 Aug 2018 20:18:40 +0000
In-Reply-To: <5B879DBE02000078001E3591@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDgvMTggMDg6MzMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI5LjA4LjE4IGF0
IDE5OjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDI2LzA3LzE4
IDE0OjA3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IERvbid0IGNoYW5jZSBoYXZpbmcgU3BlY3Ry
ZSB2MSAoaW5jbHVkaW5nIEJDQlMpIGdhZGdldHMuIEluIHNvbWUgb2YgdGhlCj4+PiBjYXNlcyB0
aGUgaW5zZXJ0aW9ucyBhcmUgbW9yZSBvZiBwcmVjYXV0aW9uYXJ5IG5hdHVyZSByYXRoZXIgdGhh
biB0aGVyZQo+Pj4gcHJvdmFibHkgYmVpbmcgYSBnYWRnZXQsIGJ1dCBJIHRoaW5rIHdlIHNob3Vs
ZCBlcnIgb24gdGhlIHNhZmUgKHNlY3VyZSkKPj4+IHNpZGUgaGVyZS4KPj4+Cj4+PiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IEknbSBzdGlsbCBub3Qg
Y29udmluY2VkIGJ5IHRoZSB1cGRhdGVfZG9tYWluX2NwdWlkX2luZm8oKSBjaGFuZ2UuICBJdCBp
cwo+PiBhIEJDQlMgZ2FkZ2V0LCBidXQgaXMgcmVzdHJpY3RlZCB0byB0aGUgdG9vbHN0YWNrIG9u
bHkgd2hpY2ggY2FuIGdldCBhdAo+PiBhbGwgdGhlIGludGVyZXN0aW5nIGRhdGEgdmlhIGxlZ2l0
aW1hdGUgbWVhbnMsIGFuZCBhbHNvIG5vdCBsb25nIGZvcgo+PiB0aGlzIHdvcmxkLgo+IFdlbGws
IHRoaXMgZ29lcyBiYWNrIHRvIG91ciBiZWxvdmVkIFhTQS03NywgaS5lLiBoaWdobHkgZGlzYWdn
cmVnYXRlZCB0b29sCj4gc3RhY2tzLgoKRGlzYWdncmVnYXRpbmcgcmVzcG9uc2liaWxpdHkgZm9y
IGRvbWFpbiBjb25zdHJ1Y3Rpb24gdG8gdGhpcyBsZXZlbCBpcyBhCmZhbnRhc3kuwqAgSXRzIG5v
dCBzZWN1cmUgYW5kIGNhbm5vdCBiZSBtYWRlIHRvIGJlLgoKVGhlIGxhY2sgb2YgYW55IHdvcmsg
b24gWFNBLTc3IGZyb20gdGhlIHBlb3BsZSB3aG8gdXNlIFhTTSB3b3VsZCBzdWdnZXN0CnRoYXQg
bm9vbmUgaXMgdXNpbmcgWFNNIHRvIGZvciB0aGlzIHB1cnBvc2UgKHdoaWNoIGFsc28gbWF0Y2hl
cyBteSB2YWd1ZQp1bmRlcnN0YW5kaW5nIG9mIGhvdyBPcGVuWFQgZG9lcyB1c2UgWFNNKS4KCj4K
Pj4gRXZlcnl0aGluZyBlbHNlIExHVE0uICBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcgo+PiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBQbGVhc2UgY2xhcmlmeSB3aGV0aGVyIHlvdSdk
IHByZWZlciBtZSB0byBkcm9wIHRoZSBkb21jdGwuYyBwYXJ0IG9mIHRoZQo+IGNoYW5nZSAtIEkn
bSBmaW5lIGVpdGhlciB3YXksIHdpdGgganVzdCBhIHNsaWdodCBwcmVmZXJlbmNlIHRvd2FyZHMK
PiBwcmVjYXV0aW9ucyBhbHNvIGZvciB0b29sIHN0YWNrIG9ubHkgaW50ZXJmYWNlcy4KCkknZCBw
cmVmZXIgeW91IHRvIGRyb3AgaXQuwqAgVGhpcyBjb2RlIGlzIGJlaW5nIGVudGlyZWx5IHJld3Jp
dHRlbiwgaW4gYQpzZWN1cml0eS1yZWxldmFudCBzZXJpZXMsIGFuZCBJJ2xsIG1ha2Ugc3VyZSB0
aGF0IHRoZSBlbmQgcmVzdWx0IGlzbid0CnZ1bG5lcmFibGUgdG8gQkNCUywgYnV0IGlmIHlvdSBj
b21taXQgdGhpcyBwYXRjaCwgaXRzIGp1c3Qgd29yayBJJ2xsCmhhdmUgdG8gdW5kby4KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
