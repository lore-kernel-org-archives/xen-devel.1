From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 25/62] persistent-net: Add overlay on
 installed systems >= stretch
Date: Wed, 10 Apr 2019 15:23:31 +0100
Message-ID: <20190410142408.22848-26-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAF-0006Ht-MD
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:23 +0000
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
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

VGhpcyBwcmVwYXJlcyB0aGUgZ3JvdW5kIGZvciB0dXJuaW5nIG9mZiBuZXQuaWZuYW1lcy4gIFRo
ZSBhY3R1YWwKcnVsZXMgYXJlIGdhdGVkIG9uIG5ldC5pZm5hbWVzIHNvIHJpZ2h0IG5vdyB0aGVy
ZSBpcyBubyBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDcgKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBt
IGIvT3NzdGVzdC9EZWJpYW4ucG0KaW5kZXggNDE0Y2Q4OTcuLmUyNDZjMDEyIDEwMDY0NAotLS0g
YS9Pc3N0ZXN0L0RlYmlhbi5wbQorKysgYi9Pc3N0ZXN0L0RlYmlhbi5wbQpAQCAtNzk4LDYgKzc5
OCwxMyBAQCBzdWIgZGViaWFuX292ZXJsYXlzICgkJCkgewogICAgIH07CiAgICAgbXkgJHN1aXRl
ID0gJGhvLT57U3VpdGV9OwogICAgICRtYXliZS0+KCdvdmVybGF5Jyk7CisKKyAgICAjIEluIHN0
cmV0Y2ggYW5kIGxhdGVyLCBuZXQuaWZuYW1lcz0xLCB0aGUgZmRvLXN0eWxlIGBwcmVkaWN0YWJs
ZQorICAgICMgbmV0d29yayBkZXZpY2UgbmFtZXMnLCBpcyB0aGUgZGVmYXVsdDsgYnV0IGl0IGlz
IGFueXRoaW5nIGJ1dAorICAgICMgcHJlZGljdGFibGUsIHNvIHdlIGRpc2FibGUgaXQuICBJbnN0
ZWFkLCB3ZSByZXN0b3JlIHRoZQorICAgICMgNzUtcGVyc2lzdGVudC1uZXQtZ2VuZXJhdG9yIG1l
Y2hhbmlzbSBmcm9tIGplc3NpZSBhbmQgZWFybGllci4KKyAgICAkbWF5YmUtPigib3ZlcmxheS1w
ZXJzaXN0ZW50LW5ldCIpIGlmICRoby0+e1N1aXRlfSAhfiBtL3doZWV6eXxqZXNzaWUvOworCiAg
ICAgJG1heWJlLT4oIm92ZXJsYXktJHN1aXRlIik7CiAgICAgJG1heWJlLT4oJGN7T3ZlcmxheUxv
Y2FsfSwgJ292ZXJsYXktbG9jYWwudGFyJyk7CiAgICAgJG1heWJlLT4oIiRje092ZXJsYXlMb2Nh
bH0tJHN1aXRlIiwgJ292ZXJsYXktbG9jYWwtJHN1aXRlLnRhcicpOwotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
