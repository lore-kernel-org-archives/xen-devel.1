From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 02/25] argo: Introduce the Kconfig option to
 govern inclusion of Argo
Date: Fri, 30 Nov 2018 17:32:41 -0800
Message-ID: <1543627984-21394-3-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSu9v-0006Ut-8M
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:33:27 +0000
Received: by mail-it1-x143.google.com with SMTP id a6so1216028itl.4
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:33:26 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KLS0tCiB4ZW4vY29tbW9uL0tjb25maWcgfCAyMCArKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4v
Y29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9uL0tjb25maWcKaW5kZXggNjgxMzJhMy4uYTA2ZGRj
YiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCisrKyBiL3hlbi9jb21tb24vS2NvbmZp
ZwpAQCAtMjAwLDYgKzIwMCwyNiBAQCBjb25maWcgTEFURV9IV0RPTQogCiAJICBJZiB1bnN1cmUs
IHNheSBOLgogCitjb25maWcgQVJHTworICAgIGJvb2wgIkFyZ286IGh5cGVydmlzb3ItbWVkaWF0
ZWQgaW50ZXJkb21haW4gY29tbXVuaWNhdGlvbiIKKyAgICBkZWZhdWx0IHkKKyAgICAtLS1oZWxw
LS0tCisgICAgICBFbmFibGVzIGEgaHlwZXJjYWxsIGZvciBkb21haW5zIHRvIGFzayB0aGUgaHlw
ZXJ2aXNvciB0byBwZXJmb3JtCisgICAgICBkYXRhIHRyYW5zZmVyIG9mIG1lc3NhZ2VzIGJldHdl
ZW4gZG9tYWlucy4KKworICAgICAgVGhpcyBhbGxvd3MgY29tbXVuaWNhdGlvbiBjaGFubmVscyB0
byBiZSBlc3RhYmxpc2hlZCB0aGF0IGRvIG5vdAorICAgICAgcmVxdWlyZSBhbnkgc2hhcmVkIG1l
bW9yeSBiZXR3ZWVuIGRvbWFpbnM7IHRoZSBoeXBlcnZpc29yIGlzIHRoZQorICAgICAgZW50aXR5
IHRoYXQgZWFjaCBkb21haW4gaW50ZXJhY3RzIHdpdGguIFRoZSBoeXBlcnZpc29yIGlzIGFibGUg
dG8KKyAgICAgIGVuZm9yY2UgTWFuZGF0b3J5IEFjY2VzcyBDb250cm9sIHBvbGljeSBvdmVyIHRo
ZSBjb21tdW5pY2F0aW9uLgorCisgICAgICBJZiBYU01fRkxBU0sgaXMgZW5hYmxlZCwgWFNNIHBv
bGljeSBjYW4gZ292ZXJuIHdoaWNoIGRvbWFpbnMgbWF5CisgICAgICBjb21tdW5pY2F0ZSB2aWEg
dGhlIEFyZ28gc3lzdGVtLgorCisgICAgICBUaGlzIGZlYXR1cmUgZG9lcyBub3RoaW5nIGlmIHRo
ZSAiYXJnbyIgYm9vdCBwYXJhbWV0ZXIgaXMgbm90IHByZXNlbnQuCisgICAgICBBcmdvIGlzIGRp
c2FibGVkIGF0IHJ1bnRpbWUgYnkgZGVmYXVsdC4KKworICAgICAgSWYgdW5zdXJlLCBzYXkgWS4K
KwogbWVudSAiU2NoZWR1bGVycyIKIAl2aXNpYmxlIGlmIEVYUEVSVCA9ICJ5IgogCi0tIAoyLjEu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
