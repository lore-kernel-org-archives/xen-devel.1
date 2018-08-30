From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86/pv: Deprecate support for paging out
 the LDT
Date: Thu, 30 Aug 2018 06:30:43 -0600
Message-ID: <5B87E37302000078001E3833@prv1-mh.provo.novell.com>
References: <1535622956-26846-1-git-send-email-andrew.cooper3@citrix.com>
 <5B87E25502000078001E3813@prv1-mh.provo.novell.com>
 <fe5d23d5-844a-dd9f-04a5-56848db7459c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <fe5d23d5-844a-dd9f-04a5-56848db7459c@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Xen-devel <xen-devel@lists.xen.org>, Julien Grall <julien.grall@arm.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA4LjE4IGF0IDE0OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzAvMDgvMTggMTM6MjUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAzMC4w
OC4xOCBhdCAxMTo1NSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L0tjb25maWcKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+
PiBAQCAtMTY0LDMgKzE2NCwyNiBAQCBlbmRtZW51Cj4+PiAgc291cmNlICJjb21tb24vS2NvbmZp
ZyIKPj4+ICAKPj4+ICBzb3VyY2UgImRyaXZlcnMvS2NvbmZpZyIKPj4+ICsKPj4+ICttZW51ICJE
ZXByZWNhdGVkIEZ1bmN0aW9uYWxpdHkiCj4+PiArCj4+PiArY29uZmlnIExFR0FDWV9QVl9MRFRf
UEFHSU5HCj4+PiArCWRlZl9ib29sIG4KPj4gQ2FuIHRoaXMgcGxlYXNlIHNpbXBseSBiZSAiYm9v
bCIgYW5kIGRlcGVuZCBvbiBQViByaWdodCBhd2F5Cj4gCj4gU3VyZS4gIChJIGJlbGlldmUgdGhp
cyBwYXRjaCBhY3R1YWxseSBwcmVkaWNhdGVzIENPTkZJR19QViBlbnRpcmVseSkuCj4gCj4+ICht
YXliZSB0aGUgbmFtZSB3b3VsZCB0aGVuIGFsc28gYmV0dGVyIGhhdmUgUFZfIGZpcnN0LCBidXQK
Pj4gSSdsbCBsZWF2ZSB0aGF0IHBhcnQgdXAgdG8geW91KT8gV2l0aCB0aGF0Cj4+IFJldmlld2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gUGVyaGFwcyBkcm9wIGl0
IHRvIGp1c3QgQ09ORklHX1BWX0xEVF9QQUdJTkcgPyAgVGhlIExFR0FDWSBwYXJ0IGlzCj4gcmF0
aGVyIHJlZHVuZGFudC4KCkkgd2FzIGFib3V0IHRvIHN1Z2dlc3QgdGhhdCBhbmQgdGhlbiBkaWRu
J3QsIGFzc3VtaW5nIHlvdSBoYWQgcHV0Cml0IHRoZXJlIG9uIHB1cnBvc2UuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
