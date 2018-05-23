From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 18/23] Debian.pm: debian_overlays:
 Allow local overlay to override supplied one
Date: Wed, 23 May 2018 17:16:05 +0100
Message-ID: <1527092170-4111-19-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR7-0000Qf-JF
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:25 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

SSB0aGluaywgbm8gY2hhbmdlIHdpdGggYW55IHJlYXNvbmFibGUgY29uZmlncy4KClNpZ25lZC1v
ZmYtYnk6IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rl
c3QvRGViaWFuLnBtIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0L0RlYmlh
bi5wbQppbmRleCA4ZTcyNDA1Li5iOTg5MWI2IDEwMDY0NAotLS0gYS9Pc3N0ZXN0L0RlYmlhbi5w
bQorKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQpAQCAtODMwLDggKzgzMCw4IEBAIHN1YiBkZWJpYW5f
b3ZlcmxheXMgKCQkKSB7CiAJICAgIGRpZSAiZGViaWFuX292ZXJsYXlzIGNhbm5vdCBjaGVjayAk
bG9jYWxfZGlyOiAkISI7CiAJfQogICAgIH07Ci0gICAgJG1heWJlLT4oJGN7T3ZlcmxheUxvY2Fs
fSwgJ292ZXJsYXktbG9jYWwudGFyJyk7CiAgICAgJG1heWJlLT4oJ292ZXJsYXknKTsKKyAgICAk
bWF5YmUtPigkY3tPdmVybGF5TG9jYWx9LCAnb3ZlcmxheS1sb2NhbC50YXInKTsKIH0KIAogc3Vi
IHByZXNlZWRfYmFzZSAoJCQkO0ApIHsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
