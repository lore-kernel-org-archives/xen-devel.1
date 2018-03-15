From: Simon Gaiser <simon@invisiblethingslab.com>
Subject: [PATCH v2 2/3] xen: xenbus: Catch closing of non
	existent transactions
Date: Thu, 15 Mar 2018 03:43:21 +0100
Message-ID: <20180315024322.27429-2-simon__10380.2003352486$1521081866$gmane$org@invisiblethingslab.com>
References: <20180315024322.27429-1-simon@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=nlnv=gf=invisiblethingslab.com=simon@srs-us1.protection.inumbo.net>)
 id 1ewItg-00015D-L6
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 02:45:40 +0000
In-Reply-To: <20180315024322.27429-1-simon@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

VXNlcnMgb2YgdGhlIHhlbmJ1cyBmdW5jdGlvbnMgc2hvdWxkIG5ldmVyIGNsb3NlIGEgbm9uIGV4
aXN0ZW50CnRyYW5zYWN0aW9uIChmb3IgZXhhbXBsZSBieSB0cnlpbmcgdG8gY2xvc2luZyB0aGUg
c2FtZSB0cmFuc2FjdGlvbgp0d2ljZSkgYnV0IGJldHRlciBjYXRjaCBpdCBpbiB4c19yZXF1ZXN0
X2V4aXQoKSB0aGFuIHRvIGNvcnJ1cHQgdGhlCnJlZmVyZW5jZSBjb3VudGVyLgoKU2lnbmVkLW9m
Zi1ieTogU2ltb24gR2Fpc2VyIDxzaW1vbkBpbnZpc2libGV0aGluZ3NsYWIuY29tPgotLS0KIGRy
aXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hl
bmJ1cy94ZW5idXNfeHMuYyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYwppbmRleCAz
ZjNiMjkzOThhYjguLjQ5YTM4NzRhZTZiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVuYnVz
L3hlbmJ1c194cy5jCisrKyBiL2RyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfeHMuYwpAQCAtMTQw
LDcgKzE0MCw5IEBAIHZvaWQgeHNfcmVxdWVzdF9leGl0KHN0cnVjdCB4Yl9yZXFfZGF0YSAqcmVx
KQogCXNwaW5fbG9jaygmeHNfc3RhdGVfbG9jayk7CiAJeHNfc3RhdGVfdXNlcnMtLTsKIAlpZiAo
KHJlcS0+dHlwZSA9PSBYU19UUkFOU0FDVElPTl9TVEFSVCAmJiByZXEtPm1zZy50eXBlID09IFhT
X0VSUk9SKSB8fAotCSAgICByZXEtPnR5cGUgPT0gWFNfVFJBTlNBQ1RJT05fRU5EKQorCSAgICAo
cmVxLT50eXBlID09IFhTX1RSQU5TQUNUSU9OX0VORCAmJgorCSAgICAgIVdBUk5fT05fT05DRShy
ZXEtPm1zZy50eXBlID09IFhTX0VSUk9SICYmCisJCQkgICAhc3RyY21wKHJlcS0+Ym9keSwgIkVO
T0VOVCIpKSkpCiAJCXhzX3N0YXRlX3VzZXJzLS07CiAJc3Bpbl91bmxvY2soJnhzX3N0YXRlX2xv
Y2spOwogCi0tIAoyLjE2LjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
