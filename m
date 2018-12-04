From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Subject: [OSSTEST PATCH 7/7] README: add Fedora setup section
Date: Tue,  4 Dec 2018 22:37:11 +0100
Message-ID: <22ff27a6bd0c7057767ba05ddb03dcbe3938d14c.1543959416.git-series.marmarek@invisiblethingslab.com>
References: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pex+=on=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1gUIOi-0006n9-3q
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 21:38:28 +0000
In-Reply-To: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
References: <cover.1a6b492e19e3f9f4f75130091142be454d04d5db.1543959416.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
List-Id: xen-devel@lists.xenproject.org

UGFja2FnZSBuYW1lcyBhcmUgc2xpZ2h0bHkgZGlmZmVyZW50LiBBZGRpdGlvbmFsbHkgc29tZSBw
YXJ0cyBhcmUKRGViaWFuLW9ubHkuCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQogUkVBRE1FIHwg
MTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvUkVBRE1FIGIvUkVBRE1FCmluZGV4IGE0NTIwYzguLmM4ODM3MjggMTAwNjQ0Ci0t
LSBhL1JFQURNRQorKysgYi9SRUFETUUKQEAgLTI5MCw2ICsyOTAsNyBAQCBTdGFuZGFsb25lIE1v
ZGUKIFRvIHJ1biBvc3N0ZXN0IGluIHN0YW5kYWxvbmUgbW9kZToKIAogIC0gWW91IG5lZWQgdG8g
aW5zdGFsbAorICAgRGViaWFuOgogICAgICBzcWxpdGUzCiAgICAgIHRjbDguNSB0Y2x4OC40IGxp
YnNxbGl0ZTMtdGNsCiAgICAgIGxpYmRiaS1wZXJsIGxpYmRiZC1zcWxpdGUzLXBlcmwKQEAgLTMw
MCw2ICszMDEsMTkgQEAgVG8gcnVuIG9zc3Rlc3QgaW4gc3RhbmRhbG9uZSBtb2RlOgogICAgICBs
aWJ4bWwtbGlieG1sLXBlcmwKICAgICAgZGN0cmwtdG9vbHMKICAgICAgbGlibmV0LXNubXAtcGVy
bCAoaWYgeW91IGFyZSBnb2luZyB0byB1c2UgTWFzdGVyc3dpdGNoIFBEVXMpCisgICBGZWRvcmE6
CisgICAgIHNxbGl0ZQorICAgICB0Y2wgdGNseCBzcWxpdGUtdGNsCisgICAgIHBlcmwtREJJIHBl
cmwtREJELVNRTGl0ZQorICAgICBzcGF4IHJzeW5jCisgICAgIGN1cmwKKyAgICAgbm1hcC1uY2F0
CisgICAgIHBlcmwtbGlieG1sLXBlcmwKKyAgICAgbmV0LXNubXAtcGVybAorCisgICAgIEFkZGl0
aW9uYWxseToKKyAgICAgIC0gdGhlcmUgaXMgbm8gZGN0cmwtdG9vbHMsIHNvIHlvdSBuZWVkIHRv
IHNldCBEZWJpYW5Ob25mcmVlRmlybXdhcmU9JycgaW4gY29uZmlnCisgICAgICAtIHJlcGxhY2Ug
L3Vzci9iaW4vdGNsc2g4LjUgc2hlYmFuZyB3aXRoIC91c3IvYmluL3RjbHNoIGluIHNjcmlwdHMK
IAogIC0gT3B0aW9uYWw6CiAgICAgIGlwbWl0b29sIC0tIGZvciBob3N0cyB3aGljaCB1c2UgSVBN
SSBmb3IgcG93ZXIgY29udHJvbAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
