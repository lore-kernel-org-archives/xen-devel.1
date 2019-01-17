From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH] cr-try-bisect: When bisection is done,
 keep the old mro as mro.done
Date: Thu, 17 Jan 2019 11:44:25 +0000
Message-ID: <20190117114425.27755-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/zvk=PZ=citrix.com=prvs=91335fb6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gk663-0008HW-5W
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 11:44:31 +0000
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

VGhpcyB3aWxsIGhlbHAgd2l0aCBkZWJ1Z2dpbmcsIG9yIGlmIHdlIHdhbnQgdG8gbWFudWFsbHkg
cmVzZXQvcmVzdGFydAp0aGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBjci10cnktYmlzZWN0IHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvY3ItdHJ5
LWJpc2VjdCBiL2NyLXRyeS1iaXNlY3QKaW5kZXggZDYxM2MzNDguLmEyYjc3YjlhIDEwMDc1NQot
LS0gYS9jci10cnktYmlzZWN0CisrKyBiL2NyLXRyeS1iaXNlY3QKQEAgLTEwNiw2ICsxMDYsNiBA
QCBkb25lCiAKIGVjaG8gbm90aGluZyB0byBkbwogcm0gLWYgJHN0YXJ0c3RhbXAKLXJtICRtcm9m
CittdiAtZiAkbXJvZiAkbXJvZi5kb25lCiAKIGV4aXQgMAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
