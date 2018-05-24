From: Sameer Goel <sameer.goel@linaro.org>
Subject: [v2 6/6] xen/smmu: Add a new config define for legacy
 SMMU
Date: Wed, 23 May 2018 18:46:20 -0600
Message-ID: <20180524004620.23828-7-sameer.goel@linaro.org>
References: <20180524004620.23828-1-sameer.goel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=merd=il=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1fLeP5-0001GO-0O
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 00:46:51 +0000
Received: by mail-pg0-x244.google.com with SMTP id 11-v6so8518487pge.2
 for <xen-devel@lists.xenproject.org>; Wed, 23 May 2018 17:46:49 -0700 (PDT)
In-Reply-To: <20180524004620.23828-1-sameer.goel@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org, julien.grall@arm.com, mjaggi@caviumnetworks.com
Cc: sstabellini@kernel.org, roger.pau@citrix.com, shankerd@codeaurora.org, Sameer Goel <sameer.goel@linaro.org>
List-Id: xen-devel@lists.xenproject.org

QWRkIGEgbmV3IGNvbmZpZyBpdGVtIHRvIGNvbnRyb2wgY29tcGlsYXRpb24gZm9yIGxlZ2FjeSBh
cm0gU01NVS4KClNpZ25lZC1vZmYtYnk6IFNhbWVlciBHb2VsIDxzYW1lZXIuZ29lbEBsaW5hcm8u
b3JnPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9LY29uZmlnICB8IDYgKysrKysr
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUgfCAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9LY29uZmlnIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
YXJtL0tjb25maWcKaW5kZXggY2RhODk5ZjYwOC4uZTg4OGE3ODMxMiAxMDA2NDQKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL0tjb25maWcKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYXJtL0tjb25maWcKQEAgLTYsMyArNiw5IEBAIGNvbmZpZyBBUk1fU01NVV92MwogCSBT
dXBwb3J0IGZvciBpbXBsZW1lbnRhdGlvbnMgb2YgdGhlIEFSTSBTeXN0ZW0gTU1VIGFyY2hpdGVj
dHVyZQogCSB2ZXJzaW9uIDMuCiAKK2NvbmZpZyBBUk1fU01NVQorCWJvb2wgIkFSTSBMZWdhY3kg
U01NVSBTdXBwb3J0IgorCWRlcGVuZHMgb24gQVJNCisJaGVscAorCSBTdXBwb3J0IGZvciBpbXBs
ZW1lbnRhdGlvbnMgb2YgdGhlIEFSTSBTeXN0ZW0gTU1VIGFyY2hpdGVjdHVyZQorCSB2ZXJzaW9u
IDEgYW5kIDIuCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZp
bGUgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vTWFrZWZpbGUKaW5kZXggZTE0NzMyYjU1
Yy4uNWIzZWIxNTQ1ZSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYXJtL01h
a2VmaWxlCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FybS9NYWtlZmlsZQpAQCAtMSwz
ICsxLDMgQEAKIG9iai15ICs9IGlvbW11Lm8KLW9iai15ICs9IHNtbXUubworb2JqLSQoQ09ORklH
X0FSTV9TTU1VKSArPSBzbW11Lm8KIG9iai0kKENPTkZJR19BUk1fU01NVV92MykgKz0gc21tdS12
My5vCi0tIAoyLjE3LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
