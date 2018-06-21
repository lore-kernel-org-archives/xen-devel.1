From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 1/2] xen-netfront: Fix mismatched rtnl_unlock
Date: Thu, 21 Jun 2018 14:00:20 +0100
Message-ID: <20180621130021.27029-2-ross.lagerwall__38958.6970014081$1529585980$gmane$org@citrix.com>
References: <20180621130021.27029-1-ross.lagerwall@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=evb4=jh=citrix.com=prvs=70385fc13=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1fVzCX-0004ql-AS
 for xen-devel@lists.xenproject.org; Thu, 21 Jun 2018 13:00:37 +0000
In-Reply-To: <20180621130021.27029-1-ross.lagerwall@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: netdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, "David S.
 Miller" <davem@davemloft.net>
List-Id: xen-devel@lists.xenproject.org

Rml4ZXM6IGY1OTljNjRmZGY3ZCAoInhlbi1uZXRmcm9udDogRml4IHJhY2UgYmV0d2VlbiBkZXZp
Y2Ugc2V0dXAgYW5kIG9wZW4iKQpSZXBvcnRlZC1ieTogQmVuIEh1dGNoaW5ncyA8YmVuLmh1dGNo
aW5nc0Bjb2RldGhpbmsuY28udWs+ClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3Nz
LmxhZ2Vyd2FsbEBjaXRyaXguY29tPgotLS0KIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwg
MyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYyBiL2RyaXZlcnMvbmV0L3hlbi1u
ZXRmcm9udC5jCmluZGV4IDkyMmNlMGEuLmVlNGNiNmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0
L3hlbi1uZXRmcm9udC5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCkBAIC0xODEw
LDcgKzE4MTAsNyBAQCBzdGF0aWMgaW50IHRhbGtfdG9fbmV0YmFjayhzdHJ1Y3QgeGVuYnVzX2Rl
dmljZSAqZGV2LAogCWVyciA9IHhlbl9uZXRfcmVhZF9tYWMoZGV2LCBpbmZvLT5uZXRkZXYtPmRl
dl9hZGRyKTsKIAlpZiAoZXJyKSB7CiAJCXhlbmJ1c19kZXZfZmF0YWwoZGV2LCBlcnIsICJwYXJz
aW5nICVzL21hYyIsIGRldi0+bm9kZW5hbWUpOwotCQlnb3RvIG91dDsKKwkJZ290byBvdXRfdW5s
b2NrZWQ7CiAJfQogCiAJcnRubF9sb2NrKCk7CkBAIC0xOTI1LDYgKzE5MjUsNyBAQCBzdGF0aWMg
aW50IHRhbGtfdG9fbmV0YmFjayhzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2LAogCXhlbm5ldF9k
ZXN0cm95X3F1ZXVlcyhpbmZvKTsKICBvdXQ6CiAJcnRubF91bmxvY2soKTsKK291dF91bmxvY2tl
ZDoKIAlkZXZpY2VfdW5yZWdpc3RlcigmZGV2LT5kZXYpOwogCXJldHVybiBlcnI7CiB9Ci0tIAoy
LjkuNQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
