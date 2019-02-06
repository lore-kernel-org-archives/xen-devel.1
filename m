From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v8 for-4.12 01/17] argo: Introduce the Kconfig
 option to govern inclusion of Argo
Date: Wed,  6 Feb 2019 00:54:52 -0800
Message-ID: <1549443308-24448-2-git-send-email-christopher.w.clark@gmail.com>
References: <1549443308-24448-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kbPR=QN=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1grIzQ-0008Bg-R1
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 08:55:28 +0000
Received: by mail-it1-x143.google.com with SMTP id h193so4473709ita.5
 for <xen-devel@lists.xenproject.org>; Wed, 06 Feb 2019 00:55:28 -0800 (PST)
In-Reply-To: <1549443308-24448-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGVmaW5lcyBDT05GSUdfQVJHTyB3aGVuIGVuYWJsZWQuIERlZmF1bHQ6IGRpc2FibGVkLgoKV2hl
biB0aGUgS2NvbmZpZyBvcHRpb24gaXMgZW5hYmxlZCwgdGhlIEFyZ28gaHlwZXJjYWxsIGltcGxl
bWVudGF0aW9uCndpbGwgYmUgaW5jbHVkZWQsIGFsbG93aW5nIHVzZSBvZiB0aGUgaHlwZXJ2aXNv
ci1tZWRpYXRlZCBpbnRlcmRvbWFpbgpjb21tdW5pY2F0aW9uIG1lY2hhbmlzbS4KCkFyZ28gaXMg
aW1wbGVtZW50ZWQgZm9yIHg4NiBhbmQgQVJNIGhhcmR3YXJlIHBsYXRmb3Jtcy4KCkF2YWlsYWJp
bGl0eSBvZiB0aGUgb3B0aW9uIGRlcGVuZHMgb24gRVhQRVJUIGFuZCBBcmdvIGlzIGN1cnJlbnRs
eSBhbgpleHBlcmltZW50YWwgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENs
YXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+CkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2MyBhZGRlZCBKYW4ncyBBY2sKdjIgIzAxIGZl
ZWRiYWNrLCBKYW46IHJlcGxhY2UgZGVmX2Jvb2wvcHJvbXB0IHdpdGggYm9vbAp2MSAjMDIgZmVl
ZGJhY2ssIEphbjogZGVmYXVsdCBLY29uZmlnIG9mZiwgdXNlIEVYUEVSVCwgZml4IHdoaXRlc3Bh
Y2UKCiB4ZW4vY29tbW9uL0tjb25maWcgfCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZp
ZyBiL3hlbi9jb21tb24vS2NvbmZpZwppbmRleCBhNzljZDQwLi4wNDM4NDYyIDEwMDY0NAotLS0g
YS94ZW4vY29tbW9uL0tjb25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0yMDIsNiAr
MjAyLDI1IEBAIGNvbmZpZyBMQVRFX0hXRE9NCiAKIAkgIElmIHVuc3VyZSwgc2F5IE4uCiAKK2Nv
bmZpZyBBUkdPCisJYm9vbCAiQXJnbzogaHlwZXJ2aXNvci1tZWRpYXRlZCBpbnRlcmRvbWFpbiBj
b21tdW5pY2F0aW9uIiBpZiBFWFBFUlQgPSAieSIKKwktLS1oZWxwLS0tCisJICBFbmFibGVzIGEg
aHlwZXJjYWxsIGZvciBkb21haW5zIHRvIGFzayB0aGUgaHlwZXJ2aXNvciB0byBwZXJmb3JtCisJ
ICBkYXRhIHRyYW5zZmVyIG9mIG1lc3NhZ2VzIGJldHdlZW4gZG9tYWlucy4KKworCSAgVGhpcyBh
bGxvd3MgY29tbXVuaWNhdGlvbiBjaGFubmVscyB0byBiZSBlc3RhYmxpc2hlZCB0aGF0IGRvIG5v
dAorCSAgcmVxdWlyZSBhbnkgc2hhcmVkIG1lbW9yeSBiZXR3ZWVuIGRvbWFpbnM7IHRoZSBoeXBl
cnZpc29yIGlzIHRoZQorCSAgZW50aXR5IHRoYXQgZWFjaCBkb21haW4gaW50ZXJhY3RzIHdpdGgu
IFRoZSBoeXBlcnZpc29yIGlzIGFibGUgdG8KKwkgIGVuZm9yY2UgTWFuZGF0b3J5IEFjY2VzcyBD
b250cm9sIHBvbGljeSBvdmVyIHRoZSBjb21tdW5pY2F0aW9uLgorCisJICBJZiBYU01fRkxBU0sg
aXMgZW5hYmxlZCwgWFNNIHBvbGljeSBjYW4gZ292ZXJuIHdoaWNoIGRvbWFpbnMgbWF5CisJICBj
b21tdW5pY2F0ZSB2aWEgdGhlIEFyZ28gc3lzdGVtLgorCisJICBUaGlzIGZlYXR1cmUgZG9lcyBu
b3RoaW5nIGlmIHRoZSAiYXJnbyIgYm9vdCBwYXJhbWV0ZXIgaXMgbm90IHByZXNlbnQuCisJICBB
cmdvIGlzIGRpc2FibGVkIGF0IHJ1bnRpbWUgYnkgZGVmYXVsdC4KKworCSAgSWYgdW5zdXJlLCBz
YXkgTi4KKwogbWVudSAiU2NoZWR1bGVycyIKIAl2aXNpYmxlIGlmIEVYUEVSVCA9ICJ5IgogCi0t
IAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
