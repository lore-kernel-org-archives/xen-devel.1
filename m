From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] README.dev: Document things that are
 now handled by ansible in Mass
Date: Thu, 13 Sep 2018 17:56:38 +0100
Message-ID: <20180913165638.5476-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=i2cq=l3=citrix.com=prvs=787a2bb9e=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1g0Uv6-0002he-FT
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:56:44 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogUkVBRE1FLmRldiB8IDEwICsrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvUkVBRE1FLmRldiBiL1JFQURNRS5k
ZXYKaW5kZXggYThiZmJiNTMuLmVmZjgyMzUwIDEwMDY0NAotLS0gYS9SRUFETUUuZGV2CisrKyBi
L1JFQURNRS5kZXYKQEAgLTkyLDE0ICs5MiwxNCBAQCBTZXQgdXAgYW55IG5lY2Vzc2FyeSBob3N0
IHByb3BlcnRpZXM6CiAKIEZvciBleGFtcGxlLCBvbmUgbWlnaHQgbmVlZCBzb21ldGhpbmcgbGlr
ZSB0aGlzOgogCi0gJCAuL21nLWhvc3RzIHNldHByb3BzIG1hcmlsaXRoLW40IC0tIGRoY3Atd2F0
Y2gtbWV0aG9kICdsZWFzZXMgZGhjcDMgZG5zLWNhbTEudWsueGVuc291cmNlLmNvbTo1NTU2Jwot
Ci0oTWFueSBvZiB0aGVzZSB0aGluZ3MgYXJlIG5vdCBuZWVkZWQgaW4gTWFzc2FjaHVzZXR0cyBh
cyB0aGUgYW5zaWJsZQotcGxheWJvb2sgd2lsbCBwcm92aWRlIGl0IHZpYSBhbiBhdXRvZ2VuZXJh
dGVkIGNvbmZpZyBmaWxlIC0gc2VlIGFib3ZlLikKKyAkIC4vbWctaG9zdHMgc2V0cHJvcHMgbWFy
aWxpdGgtbjQgLS0gZGhjcC13YXRjaC1tZXRob2QgJ2xlYXNlcyBkaGNwMyBkbnMtY2FtMS51ay54
ZW5zb3VyY2UuY29tOjU1NTYnICAjIG5vdCBuZWVkZWQgaW4gTWFzcwogCiBTZXQgdGhlIGZpcm13
YXJlLCBpZiBpdCdzIFVFRkk6CiAKLSAkIC4vbWctaG9zdHMgc2V0cHJvcHMgYWxiYW5hezAsMX0g
LS0gRmlybXdhcmUgdWVmaQorICQgLi9tZy1ob3N0cyBzZXRwcm9wcyBhbGJhbmF7MCwxfSAtLSBG
aXJtd2FyZSB1ZWZpICAjIG5vdCBuZWVkZWQgaW4gTWFzcworCisoTWFueSBvZiB0aGVzZSB0aGlu
Z3MgYXJlIG5vdCBuZWVkZWQgaW4gTWFzc2FjaHVzZXR0cyBhcyB0aGUgYW5zaWJsZQorcGxheWJv
b2sgd2lsbCBwcm92aWRlIGl0IHZpYSBhbiBhdXRvZ2VuZXJhdGVkIGNvbmZpZyBmaWxlIC0gc2Vl
IGFib3ZlLikKIAogQ3JlYXRlIHRoZSB0ZnRwIGRpcmVjdG9yeSAobXVzdCBiZSBkb25lIGFmdGVy
IGZpcm13YXJlIGlzIHNldCk6CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
