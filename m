From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 14/62] adjust how to skip bootloader
 installation for arm32, in Stretch
Date: Wed, 10 Apr 2019 15:23:20 +0100
Message-ID: <20190410142408.22848-15-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEDt-0003kG-Iw
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:29:09 +0000
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
Cc: Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCnY0OiBDaGFuZ2UgY2FzZSBvZiBzdWl0ZSBuYW1lcyBpbiBj
b21tZW50LgotLS0KIE9zc3Rlc3QvRGViaWFuLnBtIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvT3NzdGVzdC9EZWJpYW4ucG0gYi9Pc3N0ZXN0
L0RlYmlhbi5wbQppbmRleCA5MWJmZmRmZi4uODViMTg5MGQgMTAwNjQ0Ci0tLSBhL09zc3Rlc3Qv
RGViaWFuLnBtCisrKyBiL09zc3Rlc3QvRGViaWFuLnBtCkBAIC0xMDQxLDcgKzEwNDEsMTEgQEAg
RU5ECiAJIyBhY3R1YWxseSBkb2VzIHdoYXQgd2UgbmVlZCwgYnV0IHRoZSBpbnN0YWxsZXIgZG9l
c24ndCB0cmVhdAogCSMgdGhhdCBhcyBhICJib290bG9hZGVyIi4KIAkkcHJlc2VlZF9maWxlLj0g
KDw8RU5EKTsKKyAgICAgICAgIyBqZXNzaWUgYW5kIGVhcmxpZXIKIGQtaSAgICAgbm9ib290bG9h
ZGVyL2NvbmZpcm1hdGlvbl9jb21tb24gYm9vbGVhbiB0cnVlCisgICAgICAgICMgc3RyZXRjaCBh
bmQgbGF0ZXIKK2QtaSAgICAgZ3J1Yi1pbnN0YWxsZXIvc2tpcCBib29sZWFuIHRydWUKK2QtaSAg
ICAgbGlsby1pbnN0YWxsZXIvc2tpcCBib29sZWFuIHRydWUKIEVORAogCiAgICAgICAgICMgRGVi
aWFuIEJ1ZyAjNzcxOTQ5IG1lYW5zIHRoYXQgdXBkYXRlLW1lbnUtbGlzdCBhbHdheXMKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
