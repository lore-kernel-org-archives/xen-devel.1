From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 0/4] x86/iommu: PVH Dom0 workarounds for missing
 RMRR/IRSV entries
Date: Fri, 27 Jul 2018 17:31:45 +0200
Message-ID: <20180727153149.25094-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uvxm=kl=citrix.com=prvs=739380171=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fj4k3-0007XQ-Fr
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 15:33:19 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: "Bercaru, Gabriel" <bercarug@amazon.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBpbXBsZW1lbnQgYSB3b3JrYXJvdW5kIGZvciBt
aXNzaW5nIFJNUlIvSVJTVgplbnRyaWVzIGZvciBhIFBWSCBEb20wLiBJdCdzIGJhc2VkIG9uIHRo
ZSBpb21tdV9pbmNsdXNpdmVfbWFwcGluZyBWVGQKb3B0aW9uLCB3aGljaCBpcyBnZW5lcmFsaXpl
ZCB0byBiZSB1c2VkIGJ5IGJvdGggVlRkIGFuZCBBTUQtVmkKaGFyZHdhcmUuCgpUaGUgUFZIIHdv
cmthcm91bmQgaWRlbnRpdHkgbWFwcyBhbGwgcmVnaW9ucyBtYXJrZWQgYXMgcmVzZXJ2ZWQgaW4g
dGhlCm1lbW9yeSBtYXAuCgpUaGUgc2VyaWVzIGNhbiBiZSBmb3VuZCBhdDoKCmdpdDovL3hlbmJp
dHMueGVuLm9yZy9wZW9wbGUvcm95Z2VyL3hlbi5naXQgaW9tbXVfaW5jbHVzaXZlX3YxCgpUaGFu
a3MsIFJvZ2VyLgoKUm9nZXIgUGF1IE1vbm5lICg0KToKICBpb21tdTogcmVtb3ZlIHVubmVlZGVk
IHJldHVybiBmcm9tIGlvbW11X2h3ZG9tX2luaXQKICBpb21tdTogZ2VuZXJhbGl6ZSBpb21tdV9p
bmNsdXNpdmVfbWFwcGluZwogIHg4Ni9pb21tdTogcmVvcmRlciBjb25kaXRpb25zIHVzZWQgaW4g
dGhlIGluY2x1c2l2ZSBpb21tdSBtYXBwaW5ncwogIHg4Ni9pb21tdTogYWRkIFBWSCBzdXBwb3J0
IHRvIHRoZSBpbmNsdXNpdmUgb3B0aW9ucwoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1h
cmtkb3duICAgfCAgMjAgKysrKysKIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9pb21tdS5j
ICAgfCAgIDQgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyAgICAgICB8ICAgOCAr
LQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2V4dGVybi5oICB8ICAgMiAtCiB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgIHwgICA2IC0tCiB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQveDg2L3Z0ZC5jIHwgIDY2ICstLS0tLS0tLS0tLS0tLQogeGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gveDg2L2lvbW11LmMgICB8IDExNyArKysrKysrKysrKysrKysrKysrKysrKysr
KwogeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICAgICAgICB8ICAgMiArCiA4IGZpbGVz
IGNoYW5nZWQsIDE1MSBpbnNlcnRpb25zKCspLCA3NCBkZWxldGlvbnMoLSkKCi0tIAoyLjE4LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
