From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v6 01/15] argo: Introduce the Kconfig option to
 govern inclusion of Argo
Date: Wed, 23 Jan 2019 18:04:49 -0800
Message-ID: <1548295503-15946-2-git-send-email-christopher.w.clark@gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulBm=QA=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gmUOR-0003sW-92
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 02:05:23 +0000
Received: by mail-it1-x141.google.com with SMTP id d11so2502758itf.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 18:05:22 -0800 (PST)
In-Reply-To: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
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
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo9PT0KSmFuJ3MgYWNrIG9ubHkgc3RhbmRzIGZvciBj
b21taXR0aW5nIHRoaXMgdG9nZXRoZXIgd2l0aCBhdCBsZWFzdCBvbmUgcGF0Y2gKYWN0dWFsbHkg
dXNpbmcgdGhlIENPTkZJR19BUkdPIHN5bWJvbC4KCnYzIGFkZGVkIEphbidzIEFjawp2MiAjMDEg
ZmVlZGJhY2ssIEphbjogcmVwbGFjZSBkZWZfYm9vbC9wcm9tcHQgd2l0aCBib29sCnYxICMwMiBm
ZWVkYmFjaywgSmFuOiBkZWZhdWx0IEtjb25maWcgb2ZmLCB1c2UgRVhQRVJULCBmaXggd2hpdGVz
cGFjZQotLS0KIHhlbi9jb21tb24vS2NvbmZpZyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9L
Y29uZmlnIGIveGVuL2NvbW1vbi9LY29uZmlnCmluZGV4IGE3OWNkNDAuLjA0Mzg0NjIgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vS2NvbmZpZworKysgYi94ZW4vY29tbW9uL0tjb25maWcKQEAgLTIw
Miw2ICsyMDIsMjUgQEAgY29uZmlnIExBVEVfSFdET00KIAogCSAgSWYgdW5zdXJlLCBzYXkgTi4K
IAorY29uZmlnIEFSR08KKwlib29sICJBcmdvOiBoeXBlcnZpc29yLW1lZGlhdGVkIGludGVyZG9t
YWluIGNvbW11bmljYXRpb24iIGlmIEVYUEVSVCA9ICJ5IgorCS0tLWhlbHAtLS0KKwkgIEVuYWJs
ZXMgYSBoeXBlcmNhbGwgZm9yIGRvbWFpbnMgdG8gYXNrIHRoZSBoeXBlcnZpc29yIHRvIHBlcmZv
cm0KKwkgIGRhdGEgdHJhbnNmZXIgb2YgbWVzc2FnZXMgYmV0d2VlbiBkb21haW5zLgorCisJICBU
aGlzIGFsbG93cyBjb21tdW5pY2F0aW9uIGNoYW5uZWxzIHRvIGJlIGVzdGFibGlzaGVkIHRoYXQg
ZG8gbm90CisJICByZXF1aXJlIGFueSBzaGFyZWQgbWVtb3J5IGJldHdlZW4gZG9tYWluczsgdGhl
IGh5cGVydmlzb3IgaXMgdGhlCisJICBlbnRpdHkgdGhhdCBlYWNoIGRvbWFpbiBpbnRlcmFjdHMg
d2l0aC4gVGhlIGh5cGVydmlzb3IgaXMgYWJsZSB0bworCSAgZW5mb3JjZSBNYW5kYXRvcnkgQWNj
ZXNzIENvbnRyb2wgcG9saWN5IG92ZXIgdGhlIGNvbW11bmljYXRpb24uCisKKwkgIElmIFhTTV9G
TEFTSyBpcyBlbmFibGVkLCBYU00gcG9saWN5IGNhbiBnb3Zlcm4gd2hpY2ggZG9tYWlucyBtYXkK
KwkgIGNvbW11bmljYXRlIHZpYSB0aGUgQXJnbyBzeXN0ZW0uCisKKwkgIFRoaXMgZmVhdHVyZSBk
b2VzIG5vdGhpbmcgaWYgdGhlICJhcmdvIiBib290IHBhcmFtZXRlciBpcyBub3QgcHJlc2VudC4K
KwkgIEFyZ28gaXMgZGlzYWJsZWQgYXQgcnVudGltZSBieSBkZWZhdWx0LgorCisJICBJZiB1bnN1
cmUsIHNheSBOLgorCiBtZW51ICJTY2hlZHVsZXJzIgogCXZpc2libGUgaWYgRVhQRVJUID0gInki
CiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
