From: Sameer Goel <sameer.goel@linaro.org>
Subject: [RFC v4 7/8] xen/smmu: Add a new config define for
	legacy SMMU
Date: Mon, 18 Dec 2017 20:17:02 -0700
Message-ID: <20171219031703.23420-8-sameer.goel@linaro.org>
References: <20171219031703.23420-1-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ximu=dp=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1eR8PF-0006cA-Su
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2017 03:17:25 +0000
Received: by mail-pl0-x244.google.com with SMTP id bi12so6149690plb.6
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2017 19:17:24 -0800 (PST)
In-Reply-To: <20171219031703.23420-1-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, shankerd@codeaurora.org, andre.przywara@linaro.org, Sameer Goel <sameer.goel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgbmV3IGNvbmZpZyBpdGVtIHRvIGNvbnRyb2wgY29tcGlsYXRpb24gZm9yIGxlZ2FjeSBh
cm0gU01NVS4KClNpZ25lZC1vZmYtYnk6IFNhbWVlciBHb2VsIDxzYW1lZXIuZ29lbEBsaW5hcm8u
b3JnPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9LY29uZmlnICB8IDYgKysrKysr
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgfCAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9LY29uZmlnIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL0tjb25maWcKaW5kZXggY2RhODk5ZjYwOC4uNTk3ZjU4ZjEwYiAxMDA2NDQKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL0tjb25maWcKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL0tjb25maWcKQEAgLTYsMyArNiw5IEBAIGNvbmZpZyBBUk1fU01NVV92MwogCSBT
dXBwb3J0IGZvciBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIEFSTSBTeXN0ZW0gTU1VIGFyY2hpdGVj
dHVyZQogCSB2ZXJzaW9uIDMuCiAKK2NvbmZpZyBBUk1fU01NVQorCWJvb2wgIkFSTSBMZWdhY3kg
U01NVSBTdXBwb3J0IgorCWRlcGVuZHMgb24gKEFSTV82NCB8fCBBUk0pCisJaGVscAorCSBTdXBw
b3J0IGZvciBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIEFSTSBTeXN0ZW0gTU1VIGFyY2hpdGVjdHVy
ZQorCSB2ZXJzaW9uIDEgYW5kIDIuCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9hcm0vTWFrZWZpbGUgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKaW5k
ZXggZTE0NzMyYjU1Yy4uNWIzZWIxNTQ1ZSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL01ha2VmaWxlCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtl
ZmlsZQpAQCAtMSwzICsxLDMgQEAKIG9iai15ICs9IGlvbW11Lm8KLW9iai15ICs9IHNtbXUubwor
b2JqLSQoQ09ORklHX0FSTV9TTU1VKSArPSBzbW11Lm8KIG9iai0kKENPTkZJR19BUk1fU01NVV92
MykgKz0gc21tdS12My5vCi0tIAoyLjE0LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
