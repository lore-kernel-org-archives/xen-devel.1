From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 03/14] x86/cpu/vpmu: Add Hygon Dhyana and
 AMD Zen support for vPMU
Date: Wed, 27 Mar 2019 02:37:51 -0600
Message-ID: <5C9B365F020000780022211F@prv1-mh.provo.novell.com>
References: <cover.1553520193.git.puwen@hygon.cn>
 <babf13f907b9b85afe40cdffce4ee2cf17f67f11.1553520193.git.puwen@hygon.cn>
 <5C9A4EFD0200007800221FAC@prv1-mh.provo.novell.com>
 <54bb7b55-1d3c-5a36-d8f8-28be62f93635@hygon.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0tC/=R6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h944L-0006Xp-O4
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 08:37:57 +0000
In-Reply-To: <54bb7b55-1d3c-5a36-d8f8-28be62f93635@hygon.cn>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Pu Wen <puwen@hygon.cn>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE5IGF0IDA5OjE2LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+IE9uIDIw
MTkvMy8yNyAwOjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMDMuMTkgYXQgMTQ6MzAs
IDxwdXdlbkBoeWdvbi5jbj4gd3JvdGU6Cj4+PiAtICAgIGZvciAoIGkgPSAwOyBpIDwgbnVtX2Nv
dW50ZXJzOyBpKysgKQo+Pj4gK2ludCBfX2luaXQgaHlnb25fdnBtdV9pbml0KHZvaWQpCj4+PiAr
ewo+Pj4gKyAgICBzd2l0Y2ggKCBjdXJyZW50X2NwdV9kYXRhLng4NiApCj4+PiAgICAgICB7Cj4+
PiAtICAgICAgICByZG1zcmwoY3RybHNbaV0sIGN0cmxfcnN2ZFtpXSk7Cj4+PiAtICAgICAgICBj
dHJsX3JzdmRbaV0gJj0gQ1RSTF9SU1ZEX01BU0s7Cj4+PiArICAgIGNhc2UgMHgxODoKPj4+ICsg
ICAgICAgIG51bV9jb3VudGVycyA9IEYxNUhfTlVNX0NPVU5URVJTOwo+Pj4gKyAgICAgICAgY291
bnRlcnMgPSBBTURfRjE1SF9DT1VOVEVSUzsKPj4+ICsgICAgICAgIGN0cmxzID0gQU1EX0YxNUhf
Q1RSTFM7Cj4+PiArICAgICAgICBrN19jb3VudGVyc19taXJyb3JlZCA9IDE7Cj4+PiArICAgICAg
ICBicmVhazsKPj4+ICsgICAgZGVmYXVsdDoKPj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FS
TklORyAiVlBNVTogVW5zdXBwb3J0ZWQgQ1BVIGZhbWlseSAlI3hcbiIsCj4+PiArICAgICAgICAg
ICAgICAgY3VycmVudF9jcHVfZGF0YS54ODYpOwo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7
Cj4+PiAgICAgICB9Cj4+IAo+PiBXaGlsZSBJJ20gbm90IGdvaW5nIHRvIGluc2lzdCBpbiBjYXNl
cyB3aGVyZSB5b3UgYWRkIHRvIGV4aXN0aW5nCj4+IHN3aXRjaCgpLWVzIHdoaWNoIGxhY2sgc3Vj
aCBibGFuayBsaW5lcywgcGxlYXNlIGFkZCBhIGJsYW5rIGxpbmUKPj4gYmV0d2VlbiB0aGUgY2Fz
ZSBibG9ja3MgaGVyZS4gWWV0IHRoZW4gYWdhaW4gSSB3b25kZXIgd2hldGhlcgo+PiB0aGUgZGVm
YXVsdCBjYXNlIHdvdWxkbid0IGJldHRlciBtb3ZlIGludG8gdGhlIHNoYXJlZCBmdW5jdGlvbgo+
PiBhcyB3ZWxsLCBrZXlpbmcgb2ZmIG9mIGUuZy4gbnVtX2NvdW50ZXJzIHN0aWxsIGJlaW5nIHpl
cm8uCj4gCj4gSSB0aGluayBpdCdzIGEgZ29vZCBpZGVhIHRvIG1vdmUgdGhlIGRlZmF1bHQgY2Fz
ZSBpbnRvIHRoZSBzaGFyZWQKPiBmdW5jdGlvbiwgd2hpY2ggd291bGQgbGlrZToKPiBzdGF0aWMg
aW50IGNvbW1vbl9pbml0KHZvaWQpCj4gewo+ICAgICAgdW5zaWduZWQgaW50IGk7Cj4gCj4gICAg
ICBpZiAoIW51bV9jb3VudGVycykgewo+ICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAi
VlBNVTogVW5zdXBwb3J0ZWQgQ1BVIGZhbWlseSAlI3hcbiIsCj4gICAgICAgICAgICAgICAgIGN1
cnJlbnRfY3B1X2RhdGEueDg2KTsKPiAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAgIH0K
PiAuLi4KPiAKPiBUaGVuIGFzIHRoZXJlIGlzIG9ubHkgb25lIGNhc2UgaW4gaHlnb25fdnBtdV9p
bml0KCksIGhvdyBhYm91dCByZW1vdmUKPiBzd2l0Y2goKS1lcyBpbiB0aGlzIGZ1bmN0aW9uPwoK
V2VsbCwgcGVyc29uYWxseSBJJ2QgcHJlZmVyIHRvIGtlZXAgdGhlIHN3aXRjaCgpLCBhcyB0aGF0
IHdoYXQncwpnb2luZyB0byBiZSBuZWVkZWQgb25jZSB5b3UgaW50cm9kdWNlIGEgc2Vjb25kIG1v
ZGVsLCBidXQgSQp3b24ndCBpbnNpc3QuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
