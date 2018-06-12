From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v2 0/2] VT-d: make dom0-strict work with buggy
 firmware
Date: Tue, 12 Jun 2018 14:47:32 +0100
Message-ID: <20180612134734.22132-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xtaw=i6=citrix.com=prvs=694cbda5f=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fSje8-0001Kv-56
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 13:47:40 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hlbiBkb20wLXN0cmljdCBtb2RlIGlzIGVuYWJsZWQgdGhlIGlvbW11X2luY2x1c2l2ZV9tYXBw
aW5nIHdvcmthcm91bmQKZm9yIGZpcm13YXJlIHdpdGggdW5kZWNsYXJlZCBSTVJScyBpcyByZW5k
ZXJlZCB1c2VsZXNzLiBUaGlzIHNlcmllcyBmaXhlcwp0aGUgcHJvYmxlbS4KClBhdWwgRHVycmFu
dCAoMik6CiAgVlQtZDogcmUtcGhyYXNlIGxvZ2ljIGluIHZ0ZF9zZXRfaHdkb21fbWFwcGluZygp
IGZvciBjbGFyaXR5CiAgVlQtZDogcmVjb25jaWxlIGlvbW11X2luY2x1c2l2ZV9tYXBwaW5nIGFu
ZCBpb21tdT1kb20wLXN0cmljdAoKIGRvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLm1hcmtkb3du
ICAgfCAgNiArKysrLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgfCAg
MiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3g4Ni92dGQuYyB8IDM5ICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAg
ICAgICAgICAgIHwgIDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCi0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgpDYzogS29ucmFkIFJ6ZXN6
dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2Vp
LmxpdTJAY2l0cml4LmNvbT4KLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
