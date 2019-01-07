From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v3 01/15] argo: Introduce the Kconfig option to
 govern inclusion of Argo
Date: Sun,  6 Jan 2019 23:42:34 -0800
Message-ID: <1546846968-7372-2-git-send-email-christopher.w.clark@gmail.com>
References: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x9VP=PP=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1ggPYy-0004ax-0R
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 07:43:08 +0000
Received: by mail-pg1-x542.google.com with SMTP id n2so20383447pgm.3
 for <xen-devel@lists.xenproject.org>; Sun, 06 Jan 2019 23:43:06 -0800 (PST)
In-Reply-To: <1546846968-7372-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGVmaW5lcyBDT05GSUdfQVJHTyB3aGVuIGVuYWJsZWQuIERlZmF1bHQ6IGRpc2FibGVkLgoKV2hl
biB0aGUgS2NvbmZpZyBvcHRpb24gaXMgZW5hYmxlZCwgdGhlIEFyZ28gaHlwZXJjYWxsIGltcGxl
bWVudGF0aW9uCndpbGwgYmUgaW5jbHVkZWQsIGFsbG93aW5nIHVzZSBvZiB0aGUgaHlwZXJ2aXNv
ci1tZWRpYXRlZCBpbnRlcmRvbWFpbgpjb21tdW5pY2F0aW9uIG1lY2hhbmlzbS4KCkFyZ28gaXMg
aW1wbGVtZW50ZWQgZm9yIHg4NiBhbmQgQVJNIGhhcmR3YXJlIHBsYXRmb3Jtcy4KCkF2YWlsYWJp
bGl0eSBvZiB0aGUgb3B0aW9uIGRlcGVuZHMgb24gRVhQRVJUIGFuZCBBcmdvIGlzIGN1cnJlbnRs
eSBhbgpleHBlcmltZW50YWwgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENs
YXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQp2MiAjMDEgZmVlZGJh
Y2ssIEphbjogcmVwbGFjZSBkZWZfYm9vbC9wcm9tcHQgd2l0aCBib29sCnYxICMwMiBmZWVkYmFj
aywgSmFuOiBkZWZhdWx0IEtjb25maWcgb2ZmLCB1c2UgRVhQRVJULCBmaXggd2hpdGVzcGFjZQoK
IHhlbi9jb21tb24vS2NvbmZpZyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAxOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIv
eGVuL2NvbW1vbi9LY29uZmlnCmluZGV4IDM3Zjg1MDUuLjVlMTI1MWUgMTAwNjQ0Ci0tLSBhL3hl
bi9jb21tb24vS2NvbmZpZworKysgYi94ZW4vY29tbW9uL0tjb25maWcKQEAgLTIwMCw2ICsyMDAs
MjUgQEAgY29uZmlnIExBVEVfSFdET00KIAogCSAgSWYgdW5zdXJlLCBzYXkgTi4KIAorY29uZmln
IEFSR08KKwlib29sICJBcmdvOiBoeXBlcnZpc29yLW1lZGlhdGVkIGludGVyZG9tYWluIGNvbW11
bmljYXRpb24iIGlmIEVYUEVSVCA9ICJ5IgorCS0tLWhlbHAtLS0KKwkgIEVuYWJsZXMgYSBoeXBl
cmNhbGwgZm9yIGRvbWFpbnMgdG8gYXNrIHRoZSBoeXBlcnZpc29yIHRvIHBlcmZvcm0KKwkgIGRh
dGEgdHJhbnNmZXIgb2YgbWVzc2FnZXMgYmV0d2VlbiBkb21haW5zLgorCisJICBUaGlzIGFsbG93
cyBjb21tdW5pY2F0aW9uIGNoYW5uZWxzIHRvIGJlIGVzdGFibGlzaGVkIHRoYXQgZG8gbm90CisJ
ICByZXF1aXJlIGFueSBzaGFyZWQgbWVtb3J5IGJldHdlZW4gZG9tYWluczsgdGhlIGh5cGVydmlz
b3IgaXMgdGhlCisJICBlbnRpdHkgdGhhdCBlYWNoIGRvbWFpbiBpbnRlcmFjdHMgd2l0aC4gVGhl
IGh5cGVydmlzb3IgaXMgYWJsZSB0bworCSAgZW5mb3JjZSBNYW5kYXRvcnkgQWNjZXNzIENvbnRy
b2wgcG9saWN5IG92ZXIgdGhlIGNvbW11bmljYXRpb24uCisKKwkgIElmIFhTTV9GTEFTSyBpcyBl
bmFibGVkLCBYU00gcG9saWN5IGNhbiBnb3Zlcm4gd2hpY2ggZG9tYWlucyBtYXkKKwkgIGNvbW11
bmljYXRlIHZpYSB0aGUgQXJnbyBzeXN0ZW0uCisKKwkgIFRoaXMgZmVhdHVyZSBkb2VzIG5vdGhp
bmcgaWYgdGhlICJhcmdvIiBib290IHBhcmFtZXRlciBpcyBub3QgcHJlc2VudC4KKwkgIEFyZ28g
aXMgZGlzYWJsZWQgYXQgcnVudGltZSBieSBkZWZhdWx0LgorCisJICBJZiB1bnN1cmUsIHNheSBO
LgorCiBtZW51ICJTY2hlZHVsZXJzIgogCXZpc2libGUgaWYgRVhQRVJUID0gInkiCiAKLS0gCjIu
Ny40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
