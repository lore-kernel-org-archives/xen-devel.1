From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 45/62] Debian: partman scripts: Run
 right away too
Date: Wed, 10 Apr 2019 15:23:51 +0100
Message-ID: <20190410142408.22848-46-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAV-0006ro-Fp
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:39 +0000
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

V2UgYXJlIHN3aXRjaGluZyB0aGUgaW5zdGFsbGF0aW9uIG9mIHRoZXNlIHRvIHBhcnRtYW4vZWFy
bHlfY29tbWFuZAp3aGljaCBydW5zIGFzIGEgcmVzdWx0IG9mIGEgL2xpYi9wYXJ0bWFuL2luaXQu
ZCBob29rLiAgVGhhdCBtZWFucyB0aGF0CnRoaW5ncyB3ZSBpbnN0YWxsIGRvbid0IGdldCBwaWNr
ZWQgdXAsIHNvIHJ1biB0aGVtIHJpZ2h0IGF3YXkgKHRvbykuCgpTaWduZWQtb2ZmLWJ5OiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5w
bSB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmlu
ZGV4IGQxYjUyYjViLi45ZGVjMzIxZiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysr
IGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTExNTcsNyArMTE1Nyw3IEBAIHN1YiBwcmVzZWVkX2Ny
ZWF0ZSAoJCQ7QCkgewogICAgIG15ICRkX2kgPSAkaG8tPntUZnRwfXtQYXRofS4nLycuZGlfaW5z
dGFsbGVyX3BhdGgoJGhvKTsKIAogICAgIHByZXNlZWRfaG9va19pbnN0YWxsc2NyaXB0KCRobywg
JHNmeCwKLSAgICAgICAgICAnL2xpYi9wYXJ0bWFuL2luaXQuZCcsICcwMDBvdmVycmlkZS1wYXJ0
ZWQtZGV2aWNlcycsIDw8RU5EKTsKKyAgICAgICAgICAnL2xpYi9wYXJ0bWFuL2luaXQuZCcsICcw
MDBvdmVycmlkZS1wYXJ0ZWQtZGV2aWNlcycsIDw8RU5ELCAxKTsKICMhL2Jpbi9zaAogc2V0IC1l
eAogY2QgL2JpbgpAQCAtMTE3MSw3ICsxMTcxLDcgQEAgY2htb2QgK3ggcGFydGVkX2RldmljZXMK
IEVORAogCiAgICAgcHJlc2VlZF9ob29rX2luc3RhbGxzY3JpcHQoJGhvLCAkc2Z4LAotICAgICAg
ICAgICcvbGliL3BhcnRtYW4vaW5pdC5kJywgJzI1ZXJhc2Utb3RoZXItZGlza3MnLCA8PEVORCk7
CisgICAgICAgICAgJy9saWIvcGFydG1hbi9pbml0LmQnLCAnMjVlcmFzZS1vdGhlci1kaXNrcycs
IDw8RU5ELCAxKTsKICMhL2Jpbi9zaAogc2V0IC1leAogc3RhbXA9L3Zhci9lcmFzZS1vdGhlci1k
aXNrcy5zdGFtcAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
