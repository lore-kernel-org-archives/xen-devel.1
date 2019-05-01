From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 14/15] cross builds: Build armhf
 kernels on amd64 hosts
Date: Wed, 1 May 2019 11:48:38 +0100
Message-ID: <20190501104839.21621-15-ian.jackson@eu.citrix.com>
References: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9pMH=TB=citrix.com=prvs=01726d3a8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hLmnH-0005aP-Uu
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 10:48:55 +0000
In-Reply-To: <20190501104839.21621-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

T3VyIGFybWhmIGhvc3RzIGFyZSBkZXZib2FyZHMgYW5kIHZlcnkgc2xvdywgYXMgd2VsbCBhcyBz
Y2FyY2UuICBJdAp0YWtlcyAxN2tzIG9yIHNvIGZvciBhIGtlcm5lbCBidWlsZC4gIFRoaXMgd2ls
bCBnbyAqbXVjaCogZmFzdGVyIG9uCmFuIGFtZDY0IGJveCBhbmQgd2UgaGF2ZSBsb3RzIG9mIHRo
b3NlIHRvby4KCnN0YW5kYWxvbmUtZ2VuZXJhdGUtZHVtcC1mbGlnaHQtcnVudmFycyBzaG93cyB0
aGF0IHRoZSBvbmx5IGNoYW5nZSBpcwp0byBjaGFuZ2UgaG9zdF9hcmNoIGZyb20gYXJtaGYgdG8g
YW1kNjQgaW4gYnVpbGQtYXJtaGYtcHZvcHMgam9icy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KLS0tCnYyOiBGaXggdHlwbyBpbiBjb21taXQgbWVzc2FnZS4KLS0tCiBtZmkt
Y29tbW9uIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbWZpLWNvbW1vbiBiL21maS1jb21tb24KaW5kZXggN2I1Yzg5NGYu
LjMwZjI2OTJkIDEwMDY0NAotLS0gYS9tZmktY29tbW9uCisrKyBiL21maS1jb21tb24KQEAgLTQy
NCw3ICs0MjQsNyBAQCBjcmVhdGVfYnVpbGRfam9icyAoKSB7CiAgICAgZmkKIAogICAgIGpvYl9j
cmVhdGVfYnVpbGRfY3Jvc3NhYmxlIGJ1aWxkLSRhcmNoLXB2b3BzIGJ1aWxkLWtlcm4gJGFyY2gg
ICAgICAgICAgICBcCi0gICAgICAgICAgICAgICAgLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAgICAgICAgICBhcm1o
ZiBhbWQ2NCAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAogICAgICAgICAgICAgICAgIGtjb25maWdob3c9eGVuLWVuYWJsZS14ZW4tY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgICAgICAgICAgICAgJFJVTlZBUlMgJEJVSUxE
X1JVTlZBUlMgJEJVSUxEX0xJTlVYX1JVTlZBUlMgJGFyY2hfcnVudmFycyAgIFwKICAgICAgICAg
ICAgICAgICAkaG9zdG9zX3J1bnZhcnMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
