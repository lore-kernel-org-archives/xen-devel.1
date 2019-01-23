From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.12] amd/iommu: fix present bit checking
 when clearing PTE
Date: Wed, 23 Jan 2019 10:47:55 +0100
Message-ID: <20190123094755.72146-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vroR=P7=citrix.com=prvs=919cbf1eb=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gmF8m-0006pY-8C
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 09:48:12 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <paul.durrant@citrix.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlIGN1cnJlbnQgY2hlY2sgZm9yIHRoZSBwcmVzZW50IGJpdCBpcyB3cm9uZywgc2luY2UgdGhl
IHByZXNlbnQgYml0CmlzIGxvY2F0ZWQgaW4gdGhlIGxvdyBwYXJ0IG9mIHRoZSBlbnRyeS4KCkZp
eGVzOiBlOGFmZTExMjRjYzEgKCJpb21tdTogZWxpZGUgZmx1c2hpbmcgZm9yIGhpZ2hlciBvcmRl
ciBtYXAvdW5tYXAgb3BlcmF0aW9ucyIpClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3Vy
YXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+CkNjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNA
YW1kLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFBhdWwgRHVy
cmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvYW1kL2lvbW11X21hcC5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YW1kL2lvbW11X21hcC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X21hcC5j
CmluZGV4IDk5YWMwYTY4NjIuLjY3MzI5YjBjOTUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfbWFwLmMKQEAgLTM5LDE1ICszOSwxMyBAQCBzdGF0aWMgdW5zaWduZWQgaW50IGNs
ZWFyX2lvbW11X3B0ZV9wcmVzZW50KHVuc2lnbmVkIGxvbmcgbDFfbWZuLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGRmbikKIHsKICAg
ICB1aW50NjRfdCAqdGFibGUsICpwdGU7Ci0gICAgdWludDMyX3QgZW50cnk7CiAgICAgdW5zaWdu
ZWQgaW50IGZsdXNoX2ZsYWdzOwogCiAgICAgdGFibGUgPSBtYXBfZG9tYWluX3BhZ2UoX21mbihs
MV9tZm4pKTsKIAogICAgIHB0ZSA9ICh0YWJsZSArIHBmbl90b19wZGVfaWR4KGRmbiwgMSkpOwot
ICAgIGVudHJ5ID0gKnB0ZSA+PiAzMjsKIAotICAgIGZsdXNoX2ZsYWdzID0gZ2V0X2ZpZWxkX2Zy
b21fcmVnX3UzMihlbnRyeSwgSU9NTVVfUFRFX1BSRVNFTlRfTUFTSywKKyAgICBmbHVzaF9mbGFn
cyA9IGdldF9maWVsZF9mcm9tX3JlZ191MzIoKnB0ZSwgSU9NTVVfUFRFX1BSRVNFTlRfTUFTSywK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9NTVVfUFRFX1BSRVNF
TlRfU0hJRlQpID8KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU9N
TVVfRkxVU0hGX21vZGlmaWVkIDogMDsKIAotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
