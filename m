From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 07/16] x86: put XEN_DOMCTL_{set,
 get}_address_size under CONFIG_PV
Date: Fri, 19 Oct 2018 15:28:33 +0100
Message-ID: <d87454cedf90ee1bd7ff0e0d05f3b4a910b93ddd.1539959287.git-series.wei.liu2@citrix.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDVlg-0002dH-40
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 14:28:48 +0000
In-Reply-To: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhleSBhcmUgdXNlZnVsIHRvIFBWIG9ubHkuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWku
bGl1MkBjaXRyaXguY29tPgotLS0KdjI6IG5ldwotLS0KIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyB8
IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvZG9tY3RsLmMgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKaW5kZXggMTE1ZGRmNi4u
OGVjMGI5YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbWN0bC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9kb21jdGwuYwpAQCAtNjA4LDYgKzYwOCw3IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoCiAg
ICAgICAgICAgICBjb3B5YmFjayA9IHRydWU7CiAgICAgICAgIGJyZWFrOwogCisjaWZkZWYgQ09O
RklHX1BWCiAgICAgY2FzZSBYRU5fRE9NQ1RMX3NldF9hZGRyZXNzX3NpemU6CiAgICAgICAgIGlm
ICggKChkb21jdGwtPnUuYWRkcmVzc19zaXplLnNpemUgPT0gNjQpICYmICFkLT5hcmNoLmlzXzMy
Yml0X3B2KSB8fAogICAgICAgICAgICAgICgoZG9tY3RsLT51LmFkZHJlc3Nfc2l6ZS5zaXplID09
IDMyKSAmJiBkLT5hcmNoLmlzXzMyYml0X3B2KSApCkBAIC02MjMsNiArNjI0LDcgQEAgbG9uZyBh
cmNoX2RvX2RvbWN0bCgKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgQklUU19QRVJfTE9ORzsKICAgICAgICAgY29weWJhY2sgPSB0
cnVlOwogICAgICAgICBicmVhazsKKyNlbmRpZgogCiAgICAgY2FzZSBYRU5fRE9NQ1RMX3NldF9t
YWNoaW5lX2FkZHJlc3Nfc2l6ZToKICAgICAgICAgaWYgKCBkLT50b3RfcGFnZXMgPiAwICkKLS0g
CmdpdC1zZXJpZXMgMC45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
