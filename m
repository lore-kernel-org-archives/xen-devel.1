From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH 1/2] x86/hvm: make sure HVM_PARAM_[BUF]IOREQ_PFN
 can only be set once
Date: Fri, 5 Oct 2018 14:43:33 +0100
Message-ID: <20181005134334.2645-2-paul.durrant@citrix.com>
References: <20181005134334.2645-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qlgr=mr=citrix.com=prvs=8099faa14=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1g8QOJ-0001tm-D2
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 13:43:39 +0000
In-Reply-To: <20181005134334.2645-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlc2UgcGFyYW1ldGVycyBzaG91bGQgaGF2ZSBhbHdheXMgYmVlbiBpbiB0aGUgJ3NldCBvbmNl
JyBjYXRlZ29yeQpidXQgdGhpcyBoYXMsIHNvIGZhciwgbm90IGJlZW4gZW5mb3JjZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgotLS0KQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgot
LS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9odm0uYyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKaW5kZXggNTFmYzNlYzA3Zi4uMDdlYzIwZmI1MiAxMDA2NDQKLS0tIGEv
eGVuL2FyY2gveDg2L2h2bS9odm0uYworKysgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCkBAIC00
MDgzLDYgKzQwODMsOCBAQCBzdGF0aWMgaW50IGh2bV9hbGxvd19zZXRfcGFyYW0oc3RydWN0IGRv
bWFpbiAqZCwKICAgICB7CiAgICAgLyogVGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzIHNob3VsZCBv
bmx5IGJlIGNoYW5nZWQgb25jZS4gKi8KICAgICBjYXNlIEhWTV9QQVJBTV9WSVJJRElBTjoKKyAg
ICBjYXNlIEhWTV9QQVJBTV9JT1JFUV9QRk46CisgICAgY2FzZSBIVk1fUEFSQU1fQlVGSU9SRVFf
UEZOOgogICAgIGNhc2UgSFZNX1BBUkFNX0lPUkVRX1NFUlZFUl9QRk46CiAgICAgY2FzZSBIVk1f
UEFSQU1fTlJfSU9SRVFfU0VSVkVSX1BBR0VTOgogICAgIGNhc2UgSFZNX1BBUkFNX0FMVFAyTToK
LS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
