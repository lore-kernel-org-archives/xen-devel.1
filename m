From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [PATCH] libxl: get_reaper_lock_and_uid: Document fd
 handling
Date: Wed, 2 Jan 2019 12:03:43 +0000
Message-ID: <20190102120343.21267-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=W/yL=PK=citrix.com=prvs=898f09f31=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gefFW-0004GB-8x
 for xen-devel@lists.xenproject.org; Wed, 02 Jan 2019 12:03:50 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q292ZXJpdHkgdW5kZXJzdGFuZGFibHkgY29tcGxhaW5zIHRoYXQgZ2V0X3JlYXBlcl9sb2NrX2Fu
ZF91aWQgbGVha3MKdGhlIGZkIGFuZCBoZW5jZSBvcGVuLWZpbGUuICBCdXQgdGhpcyBpcyBpbnRl
bnRpb25hbDogdGhlIGxvY2sgYmVjb21lcwpvd25lZCBieSB0aGUgY2hpbGQgcHJvY2VzcyBhcyBh
IHdob2xlLCB3aGljaCBpcyBlbnRpcmVseSB0aGUgcHJvcGVydHkKb2YgbGlieGwuCgooVGhlIGNv
ZGluZyBzdHlsZSBoZXJlIGluIHRoaXMgc3VicHJvY2VzcyBpcyBhIGJpdCBhbm9tYWxvdXMgYnV0
IGl0J3MKcHJvYmFibHkgbm90IHdvcnRoIGl0IHRvIGNvbnZlcnQgZ2V0X3JlYXBlcl9sb2NrX2Fu
ZF91aWQgdG8gYGdvdG8gb3V0JwpzdHlsZSBhbmQgaGF2ZSBpdCBleHBsaWNpdGx5IHJldHVybiB0
aGUgZmQgbnVtYmVyLikKClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgotLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29s
cy9saWJ4bC9saWJ4bF9kbS5jIGIvdG9vbHMvbGlieGwvbGlieGxfZG0uYwppbmRleCBiZTQ5M2Nm
OWYyLi41ZGUzZmM3YTY3IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF9kbS5jCisrKyBi
L3Rvb2xzL2xpYnhsL2xpYnhsX2RtLmMKQEAgLTI4ODksNyArMjg4OSw3IEBAIHN0YXRpYyBpbnQg
Z2V0X3JlYXBlcl9sb2NrX2FuZF91aWQobGlieGxfX2Rlc3Ryb3lfZGV2aWNlbW9kZWxfc3RhdGUg
KmRkbXMsCiAgICAgaW50IGRvbWlkID0gZGRtcy0+ZG9taWQ7CiAgICAgaW50IHI7CiAgICAgY29u
c3QgY2hhciAqIGxvY2tmaWxlOwotICAgIGludCBmZDsKKyAgICBpbnQgZmQ7IC8qICJsZWFrZWQi
IGludG8gdGhlIGdlbmVyYWwgcHJvY2VzcyBjb250ZXh0IChldmVuIG9uIGZhaWx1cmUpICovCiAK
ICAgICAvKiBUcnkgdG8gbG9jayB0aGUgInJlYXBlciB1aWQiICovCiAgICAgbG9ja2ZpbGUgPSBH
Q1NQUklOVEYoIiVzL2RtLXJlYXBlci1sb2NrIiwgbGlieGxfX3J1bl9kaXJfcGF0aCgpKTsKLS0g
CjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
