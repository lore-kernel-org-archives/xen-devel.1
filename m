From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 2/2] ignores: update .hgignore
Date: Wed, 28 Feb 2018 12:47:21 +0000
Message-ID: <20180228124721.5298-2-roger.pau@citrix.com>
References: <20180228124721.5298-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=j/eq=fw=citrix.com=prvs=5902857c7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1er19A-0007wT-LE
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 12:47:48 +0000
In-Reply-To: <20180228124721.5298-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VG8gYWRkIHRoZSBzaGltIGJ1aWxkIG91dHB1dCBhbmQgYnVpbGQgZGlyZWN0b3J5LgoKU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5s
YXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpD
YzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8
dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIC5oZ2ln
bm9yZSB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS8uaGdpZ25vcmUgYi8uaGdpZ25vcmUKaW5kZXggODM0MmYzNjk4Mi4uZGVkOGNlZjUzMiAx
MDA2NDQKLS0tIGEvLmhnaWdub3JlCisrKyBiLy5oZ2lnbm9yZQpAQCAtMTcwLDYgKzE3MCwxMSBA
QAogXnRvb2xzL2Zpcm13YXJlL3JvbWJpb3MvMzJiaXQvMzJiaXRiaW9zX2ZsYXRcLmgkCiBedG9v
bHMvZmlybXdhcmUvdmdhYmlvcy92YmV0YWJsZXMtZ2VuJAogXnRvb2xzL2Zpcm13YXJlL3ZnYWJp
b3MvdmJldGFibGVzXC5oJAorXnRvb2xzL2Zpcm13YXJlL3hlbi1kaXIvLipcLm9sZCQKK150b29s
cy9maXJtd2FyZS94ZW4tZGlyL2xpbmtmYXJtLnN0YW1wLiokCitedG9vbHMvZmlybXdhcmUveGVu
LWRpci94ZW4tcm9vdCQKK150b29scy9maXJtd2FyZS94ZW4tZGlyL3hlbi1zaGltJAorXnRvb2xz
L2Zpcm13YXJlL3hlbi1kaXIveGVuLXNoaW0tc3ltcyQKIF50b29scy9mbGFzay91dGlscy9mbGFz
ay1nZXRlbmZvcmNlJAogXnRvb2xzL2ZsYXNrL3V0aWxzL2ZsYXNrLWdldC1ib29sJAogXnRvb2xz
L2ZsYXNrL3V0aWxzL2ZsYXNrLWxvYWRwb2xpY3kkCi0tIAoyLjE2LjEKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
