From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] build: Help attempts to syntax highlight
	Config.mk
Date: Thu, 22 Feb 2018 10:50:40 +0000
Message-ID: <1519296640-18918-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U29tZSBhdHRlbXB0cyB0byBzeW50YXggaGlnaGxpZ2h0IENvbmZpZy5tayBlbmQgdXAgdGhpbmtp
bmcgdGhhdCBtb3N0IG9mCkNvbmZpZy5tayBpcyBhIHN0cmluZywgZHVlIHRvIHRoZSB1bmJhbGFu
Y2VkIHNxdW90ZS4gIFByb3ZpZGUgYSBiYWxhbmNpbmcKc3F1b3RlIGluIGEgY29tbWVudCB0byBj
b21wZW5zYXRlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEdlb3JnZSBEdW5sYXAg
PEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBldS5jaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpDQzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDQzogVGltIERlZWdhbiA8dGlt
QHhlbi5vcmc+CkNDOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIENvbmZpZy5t
ayB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvQ29u
ZmlnLm1rIGIvQ29uZmlnLm1rCmluZGV4IDAzN2U1MTYuLmM2ZjBkZjkgMTAwNjQ0Ci0tLSBhL0Nv
bmZpZy5taworKysgYi9Db25maWcubWsKQEAgLTcsNiArNyw3IEBAIGVuZGlmCiAjIENvbnZlbmll
bnQgdmFyaWFibGVzCiBjb21tYSAgIDo9ICwKIHNxdW90ZSAgOj0gJworIycgQmFsYW5jaW5nIHNx
dW90ZSwgdG8gaGVscCBzeW50YXggaGlnaGxpZ2h0aW5nCiBlbXB0eSAgIDo9CiBzcGFjZSAgIDo9
ICQoZW1wdHkpICQoZW1wdHkpCiAKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
