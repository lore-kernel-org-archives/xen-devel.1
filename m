From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/6] mg-repro-setup: Fix runvar
 adjustment shell syntax
Date: Thu, 25 Apr 2019 16:50:53 +0100
Message-ID: <20190425155056.23145-4-ian.jackson@eu.citrix.com>
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeO-0002oC-Db
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:04 +0000
In-Reply-To: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
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

LXIgd291bGQgZmFpbCB3aXRoIGEgYmFzaCBzeW50YXggZXJyb3IuICBUaGlzIGJ1ZyBoYXMgZXhp
c3RlZCBldmVyCnNpbmNlIHRoaXMgZmVhdHVyZSB3YXMgaW50cm9kdWNlZC4KClNpZ25lZC1vZmYt
Ynk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1nLXJlcHJv
LXNldHVwIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbWctcmVwcm8tc2V0dXAgYi9tZy1yZXByby1zZXR1cAppbmRleCAz
N2NjYjU5ZC4uNmVkNGQ4NWUgMTAwNzU1Ci0tLSBhL21nLXJlcHJvLXNldHVwCisrKyBiL21nLXJl
cHJvLXNldHVwCkBAIC0xMDgsNyArMTA4LDcgQEAgYWRqcnVudmFyICgpIHsKIGZvciBhcmcgaW4g
IiR7YWRqdXN0c2V0c1tAXX0iOyBkbwogCWNhc2UgIiRhcmciIGluCiAJISp8XiopCWRlbHJ1bnZh
ciAiJHthcmcjP30iCQk7OwotCSo9KikJYWRqcnVudmFyICIke2FyZyUlPSp9IiAieyRhcmcjKj19
Igk7OworCSo9KikJYWRqcnVudmFyICIke2FyZyUlPSp9IiAiJHthcmcjKj19Igk7OwogCSopCWJh
ZC1hZGp1aXN0c2V0LXBhdHRlcm4JCQk7OwogCWVzYWMKIGRvbmUKLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
