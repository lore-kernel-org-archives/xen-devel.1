Return-Path: <SRS0=5Xtu=SY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2639C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 12:36:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88A8F20693
	for <xen-devel@archiver.kernel.org>; Mon, 22 Apr 2019 12:36:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="yC5J1dOG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88A8F20693
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIYBS-0001Rk-Is; Mon, 22 Apr 2019 12:36:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NvB3=SY=oracle.com=dongli.zhang@srs-us1.protection.inumbo.net>)
 id 1hIYBR-0001Rf-Ce
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2019 12:36:29 +0000
X-Inumbo-ID: 3fcefc4f-64fb-11e9-92d7-bc764e045a96
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3fcefc4f-64fb-11e9-92d7-bc764e045a96;
 Mon, 22 Apr 2019 12:36:28 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3MCTEme080310;
 Mon, 22 Apr 2019 12:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id; s=corp-2018-07-02;
 bh=PfsNwZ+a0XeeN1RSjTgHu+0azTGV1vvO4SteTYhP49o=;
 b=yC5J1dOGQ8ke0AcIph6v9mm7aAosUok3gfCflj92OfzIJKqnJit+uaV9E3vo6IqoFqTS
 Gtc1XsXZFSYJvO+7876ZtRmFGeusFzP89d5sXjdG6anLFzieHSscW2U5ddCydmh5RAHM
 VmqkI9nSvRhSh1HO3SAJRPMLp9WcYOb7jAUJGpnszAUTwHXQ/4p0tOMWOKP4MV1V3dqW
 j8g16Iz0hGiSZtLAkXQCG3a9g08kTEMpDFfVXzJlo7W1491JvC4sQhQ6nM8FoCrd+gtF
 W3SmM//hlTkePg5BCawVlWbfB3DvRo58dg2Tftqqwf2kx7cUvo7F31vX4vGu5ufzSECh Nw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 2ryrxcp67u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Apr 2019 12:36:21 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3MCaLVD121883;
 Mon, 22 Apr 2019 12:36:21 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2s0f0uwtfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Apr 2019 12:36:21 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3MCaHsG025837;
 Mon, 22 Apr 2019 12:36:17 GMT
Received: from linux.cn.oracle.com (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 22 Apr 2019 05:36:17 -0700
From: Dongli Zhang <dongli.zhang@oracle.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Apr 2019 20:39:59 +0800
Message-Id: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
X-Mailer: git-send-email 2.7.4
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9234
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=606
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904220096
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9234
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=636 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904220096
Subject: [Xen-devel] [PATCH 1/1] xen/gnttab: print log at level XENLOG_ERR
 before panic
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, konrad.wilk@oracle.com,
 George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, julien.grall@arm.com,
 jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190422123959.UzENlPapS-oMrBZbC5XvC3SidACZoHO7Jh4m4iVml20@z>

UHJpbnQgbG9nIGF0IGxldmVsIFhFTkxPR19FUlIgKGluc3RlYWQgWEVOTE9HX0lORk8pIGFzIGRv
bWFpbl9jcmFzaCgpCmluZGljYXRlcyB0aGVyZSBpcyBmYXRhbCBlcnJvci4KClNpZ25lZC1vZmYt
Ynk6IERvbmdsaSBaaGFuZyA8ZG9uZ2xpLnpoYW5nQG9yYWNsZS5jb20+Ci0tLQogeGVuL2NvbW1v
bi9ncmFudF90YWJsZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jCmluZGV4IDgwNzI4ZWEuLjcyNWM2MTggMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMK
QEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFwX2NvbW1vbigKICAgICBpZiAoIHVubGlrZWx5KChy
ZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9pZChkb20pKSA9PSBOVUxMKSApCiAgICAgewogICAgICAg
ICAvKiBUaGlzIGNhbiBoYXBwZW4gd2hlbiBhIGdyYW50IGlzIGltcGxpY2l0bHkgdW5tYXBwZWQu
ICovCi0gICAgICAgIGdkcHJpbnRrKFhFTkxPR19JTkZPLCAiQ291bGQgbm90IGZpbmQgZG9tYWlu
ICVkXG4iLCBkb20pOworICAgICAgICBnZHByaW50ayhYRU5MT0dfRVJSLCAiQ291bGQgbm90IGZp
bmQgZG9tYWluICVkXG4iLCBkb20pOwogICAgICAgICBkb21haW5fY3Jhc2gobGQpOyAvKiBuYXVn
aHR5Li4uICovCiAgICAgICAgIHJldHVybjsKICAgICB9Ci0tIAoyLjcuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
