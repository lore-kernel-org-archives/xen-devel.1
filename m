From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/2] ignores: update list of git ignored files
Date: Wed, 28 Feb 2018 12:47:20 +0000
Message-ID: <20180228124721.5298-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1er18w-0007ud-13
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 12:47:34 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QWRkIHRoZSBzaGltIGJ1aWxkIHN5bWJvbCBmaWxlIGFuZCByZW1vdmUgdGhlIHhlbi1zaGltIGJp
bmFyeSAod2hpY2gKaXMgbm8gbG9uZ2VyIGNyZWF0ZWQpLgoKUmVwb3J0ZWQtYnk6IE9sYWYgSGVy
aW5nIDxvbGFmQGFlcGZsZS5kZT4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgpDYzogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgotLS0KIC5n
aXRpZ25vcmUgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCA5MzM1N2Y3
NmE1Li4xNjQyMGMxZGY4IDEwMDY0NAotLS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25vcmUK
QEAgLTE1OSw2ICsxNTksNyBAQCB0b29scy9maXJtd2FyZS94ZW4tZGlyLyoub2xkCiB0b29scy9m
aXJtd2FyZS94ZW4tZGlyL2xpbmtmYXJtLnN0YW1wKgogdG9vbHMvZmlybXdhcmUveGVuLWRpci94
ZW4tcm9vdAogdG9vbHMvZmlybXdhcmUveGVuLWRpci94ZW4tc2hpbQordG9vbHMvZmlybXdhcmUv
eGVuLWRpci94ZW4tc2hpbS1zeW1zCiB0b29scy9mbGFzay91dGlscy9mbGFzay1nZXRlbmZvcmNl
CiB0b29scy9mbGFzay91dGlscy9mbGFzay1nZXQtYm9vbAogdG9vbHMvZmxhc2svdXRpbHMvZmxh
c2stbG9hZHBvbGljeQpAQCAtMzMxLDcgKzMzMiw2IEBAIHhlbi94c20vZmxhc2sveGVucG9saWN5
LSoKIHRvb2xzL2ZsYXNrL3BvbGljeS9wb2xpY3kuY29uZgogdG9vbHMvZmxhc2svcG9saWN5L3hl
bnBvbGljeS0qCiB4ZW4veGVuCi14ZW4veGVuLXNoaW0KIHhlbi94ZW4tc3ltcwogeGVuL3hlbi1z
eW1zLm1hcAogeGVuL3hlbi4qCi0tIAoyLjE2LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
