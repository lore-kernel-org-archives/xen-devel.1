Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54295C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 06:50:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2056020651
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 06:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nIWY84tu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2056020651
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEq0P-0007es-GV; Fri, 12 Apr 2019 06:49:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bt0k=SO=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1hEq0O-0007en-1l
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 06:49:44 +0000
X-Inumbo-ID: 26353252-5cef-11e9-92d7-bc764e045a96
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26353252-5cef-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 06:49:42 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3C6hlpR027871;
 Fri, 12 Apr 2019 06:49:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=b7woYrl63pNzcetbuxkWEBWjxuHs1pmlo0Ddo71dyWQ=;
 b=nIWY84tu+RXJHdzCGV6r64TEivap4dNZvCegmI4gRHq+X8s2Y4oU7kWuFuZU016DjV0d
 U508suIxDuzw0uS5AngC+pZtpmbA6gPgGFAI7WYo/nL6UC5afA7kxXVg/+0pHcepCUpS
 okEsJpo0eXXywsIPhOXKZaHL3WywFCLdOPr67t8zyZEHcG1WuVN1HFMAVdTGdoCHbSEG
 vnedqQk8pguK8+AbnVED+ArPl1fsxk377ekC0x0kJs7eYeQFTAYfFzNqJKP2NzRHyAAL
 HdP4VkFJ9SCebx78Juxu68HHBBKR+ZnUp0xLW56BZHD1V6OwqMVjoo5j+iFS4wzaVvoN Tw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2rpmrqmmu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2019 06:49:36 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3C6m94s189407;
 Fri, 12 Apr 2019 06:49:35 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3030.oracle.com with ESMTP id 2rt9uq0pjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Apr 2019 06:49:35 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3C6nYDd018876;
 Fri, 12 Apr 2019 06:49:34 GMT
Received: from linux.cn.oracle.com (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 11 Apr 2019 23:49:33 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org, netdev@vger.kernel.org
Date: Fri, 12 Apr 2019 14:53:24 +0800
Message-Id: <1555052004-31855-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9224
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904120046
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9224
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904120046
Subject: [Xen-devel] [PATCH 1/1] xen-netback: add reference from xenvif to
 backend_info to facilitate coredump analysis
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: wei.liu2@citrix.com, joe.jin@oracle.com, linux-kernel@vger.kernel.org,
 junxiao.bi@oracle.com, paul.durrant@citrix.com, jie.l.li@oracle.com,
 davem@davemloft.net
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHVyaW5nIGNvcmVkdW1wIGFuYWx5c2lzLCBpdCBpcyBub3QgZWFzeSB0byBvYnRhaW4gdGhlIGFk
ZHJlc3Mgb2YKYmFja2VuZF9pbmZvIGluIHhlbi1uZXRiYWNrLgoKU28gZmFyIHRoZXJlIGFyZSB0
d28gd2F5cyB0byBvYnRhaW4gYmFja2VuZF9pbmZvOgoKMS4gRG8gd2hhdCB4ZW5idXNfZGV2aWNl
X2ZpbmQoKSBkb2VzIGZvciB2bWNvcmUgdG8gZmluZCB0aGUgeGVuYnVzX2RldmljZQphbmQgdGhl
biBkZXJpdmUgaXQgZnJvbSBkZXZfZ2V0X2RydmRhdGEoKS4KCjIuIEV4dHJhY3QgYmFja2VuZF9p
bmZvIGZyb20gY2FsbHN0YWNrIG9mIHhlbndhdGNoIChlLmcuLCBuZXRiYWNrX3JlbW92ZSgpCm9y
IGZyb250ZW5kX2NoYW5nZWQoKSkuCgpUaGlzIHBhdGNoIGFkZHMgYSByZWZlcmVuY2UgZnJvbSB4
ZW52aWYgdG8gYmFja2VuZF9pbmZvIHNvIHRoYXQgaXQgd291bGQgYmUKbXVjaCBtb3JlIGVhc2ll
ciB0byBvYnRhaW4gYmFja2VuZF9pbmZvIGR1cmluZyBjb3JlZHVtcCBhbmFseXNpcy4KClNpZ25l
ZC1vZmYtYnk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Ci0tLQogZHJp
dmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmggfCAxOCArKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jIHwgMTcgKy0tLS0tLS0tLS0tLS0tLS0KIDIg
ZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmggYi9kcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9jb21tb24uaAppbmRleCA5MzZjMGIzLi4wNTg0N2ViIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24uaAorKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9jb21tb24uaApAQCAtMjQ4LDYgKzI0OCwyMiBAQCBzdHJ1Y3QgeGVudmlmX2hhc2ggewogCXN0
cnVjdCB4ZW52aWZfaGFzaF9jYWNoZSBjYWNoZTsKIH07CiAKK3N0cnVjdCBiYWNrZW5kX2luZm8g
eworCXN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXY7CisJc3RydWN0IHhlbnZpZiAqdmlmOworCisJ
LyogVGhpcyBpcyB0aGUgc3RhdGUgdGhhdCB3aWxsIGJlIHJlZmxlY3RlZCBpbiB4ZW5zdG9yZSB3
aGVuIGFueQorCSAqIGFjdGl2ZSBob3RwbHVnIHNjcmlwdCBjb21wbGV0ZXMuCisJICovCisJZW51
bSB4ZW5idXNfc3RhdGUgc3RhdGU7CisKKwllbnVtIHhlbmJ1c19zdGF0ZSBmcm9udGVuZF9zdGF0
ZTsKKwlzdHJ1Y3QgeGVuYnVzX3dhdGNoIGhvdHBsdWdfc3RhdHVzX3dhdGNoOworCXU4IGhhdmVf
aG90cGx1Z19zdGF0dXNfd2F0Y2g6MTsKKworCWNvbnN0IGNoYXIgKmhvdHBsdWdfc2NyaXB0Owor
fTsKKwogc3RydWN0IHhlbnZpZiB7CiAJLyogVW5pcXVlIGlkZW50aWZpZXIgZm9yIHRoaXMgaW50
ZXJmYWNlLiAqLwogCWRvbWlkX3QgICAgICAgICAgZG9taWQ7CkBAIC0yODMsNiArMjk5LDggQEAg
c3RydWN0IHhlbnZpZiB7CiAJc3RydWN0IHhlbmJ1c193YXRjaCBjcmVkaXRfd2F0Y2g7CiAJc3Ry
dWN0IHhlbmJ1c193YXRjaCBtY2FzdF9jdHJsX3dhdGNoOwogCisJc3RydWN0IGJhY2tlbmRfaW5m
byAqYmU7CisKIAlzcGlubG9ja190IGxvY2s7CiAKICNpZmRlZiBDT05GSUdfREVCVUdfRlMKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL3hlbmJ1cy5jIGIvZHJpdmVycy9uZXQv
eGVuLW5ldGJhY2sveGVuYnVzLmMKaW5kZXggMzMwZGRiNi4uNDFjOWU4ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9uZXQveGVuLW5ldGJhY2sveGVuYnVzLmMKKysrIGIvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2sveGVuYnVzLmMKQEAgLTIyLDIyICsyMiw2IEBACiAjaW5jbHVkZSA8bGludXgvdm1hbGxv
Yy5oPgogI2luY2x1ZGUgPGxpbnV4L3J0bmV0bGluay5oPgogCi1zdHJ1Y3QgYmFja2VuZF9pbmZv
IHsKLQlzdHJ1Y3QgeGVuYnVzX2RldmljZSAqZGV2OwotCXN0cnVjdCB4ZW52aWYgKnZpZjsKLQot
CS8qIFRoaXMgaXMgdGhlIHN0YXRlIHRoYXQgd2lsbCBiZSByZWZsZWN0ZWQgaW4geGVuc3RvcmUg
d2hlbiBhbnkKLQkgKiBhY3RpdmUgaG90cGx1ZyBzY3JpcHQgY29tcGxldGVzLgotCSAqLwotCWVu
dW0geGVuYnVzX3N0YXRlIHN0YXRlOwotCi0JZW51bSB4ZW5idXNfc3RhdGUgZnJvbnRlbmRfc3Rh
dGU7Ci0Jc3RydWN0IHhlbmJ1c193YXRjaCBob3RwbHVnX3N0YXR1c193YXRjaDsKLQl1OCBoYXZl
X2hvdHBsdWdfc3RhdHVzX3dhdGNoOjE7Ci0KLQljb25zdCBjaGFyICpob3RwbHVnX3NjcmlwdDsK
LX07Ci0KIHN0YXRpYyBpbnQgY29ubmVjdF9kYXRhX3JpbmdzKHN0cnVjdCBiYWNrZW5kX2luZm8g
KmJlLAogCQkJICAgICAgc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUpOwogc3RhdGljIHZvaWQg
Y29ubmVjdChzdHJ1Y3QgYmFja2VuZF9pbmZvICpiZSk7CkBAIC00NzIsNiArNDU2LDcgQEAgc3Rh
dGljIGludCBiYWNrZW5kX2NyZWF0ZV94ZW52aWYoc3RydWN0IGJhY2tlbmRfaW5mbyAqYmUpCiAJ
CXJldHVybiBlcnI7CiAJfQogCWJlLT52aWYgPSB2aWY7CisJdmlmLT5iZSA9IGJlOwogCiAJa29i
amVjdF91ZXZlbnQoJmRldi0+ZGV2LmtvYmosIEtPQkpfT05MSU5FKTsKIAlyZXR1cm4gMDsKLS0g
CjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
