From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v4 0/5] x86/pvh: fix fixes for PVH Dom0
Date: Wed, 14 Nov 2018 12:57:35 +0100
Message-ID: <20181114115740.1050-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zmga=nz=citrix.com=prvs=849b1dda4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gMtnn-0005TT-HD
 for xen-devel@lists.xenproject.org; Wed, 14 Nov 2018 11:57:47 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgpUaGUgZm9sbG93aW5nIHNlcmllcyBjb250YWluIG1pc2NlbGxhbmVvdXMgZml4ZXMg
Zm9yIGEgUFZIIERvbTAuIEkndmUKZm91bmQgb3V0IHRoaXMgaXNzdWVzIHdoaWxlIHRyeWluZyB0
byBib290IG9uIGFuIEFNRCBFUFlDIGJveC4KClRoZSBzZXJpZXMgY2FuIGJlIGZvdW5kIG9uIG15
IGdpdCByZXBvOgoKZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9yb3lnZXIveGVuLmdpdCBm
aXhlcy1wdmgtdjQKClJvZ2VyIFBhdSBNb25uZSAoNSk6CiAgdnBjaTogZml4IHVwZGF0aW5nIHRo
ZSBjb21tYW5kIHJlZ2lzdGVyCiAgdnBjaTogZml4IGRlZmVycmFsIG9mIGxvbmcgb3BlcmF0aW9u
cwogIHZwY2kvbXNpeDogY2FydmUgcDJtIGhvbGUgZm9yIE1TSVggTU1JTyByZWdpb25zCiAgYW1k
L2lvbW11OiBhc3NpZ24gaW9tbXUgZGV2aWNlcyB0byBYZW4KICBhbWQvaW9tbXU6IHNraXAgYnJp
ZGdlIGRldmljZXMgd2hlbiB1cGRhdGluZyBJT01NVSBwYWdlIHRhYmxlcwoKIHhlbi9hcmNoL3g4
Ni9odm0vaW9yZXEuYyAgICAgICAgICAgICAgICAgfCAgNiArLS0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL2FtZC9pb21tdV9pbml0LmMgfCAxMCArKysrKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X21hcC5jICB8ICA0ICsrCiB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jICAg
ICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKysrKysrLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy92
cGNpL21zaXguYyAgICAgICAgICAgICAgICAgIHwgNDkgKysrKysrKysrKysrKysrKysrKysrKysK
IHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAgICAgICAgICAgICAgICAgfCAgNSArKy0KIDYgZmls
ZXMgY2hhbmdlZCwgMTAyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0gCjIuMTku
MQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
