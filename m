Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE6AC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 21:09:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68E312064A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 21:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="tWMQ1yPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68E312064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHEHc-0001sy-B4; Thu, 18 Apr 2019 21:09:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Afmj=SU=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hHEHa-0001st-Cb
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 21:09:22 +0000
X-Inumbo-ID: 3c29227c-621e-11e9-92d7-bc764e045a96
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c29227c-621e-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 21:09:21 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3IL03Wc036992;
 Thu, 18 Apr 2019 21:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=noZ4q+UJggKgIGoS0ulmIXvhJl5zRZYCCYN/gwGC5ck=;
 b=tWMQ1yPG5yKmWYNgdOklf0OVfaKHsFFDOVieGBBCzNzknwaK8nb88DMh02if4SLD4g4+
 vYiGjImG3Q211l/BYTW+nTKGWENUADyyO251Go5jmRq5AUFHbpAEZ2597c5TcTDwZFXo
 V3lCaHUtJzgdp+vWPBHYyOtYRO9i81an/mzOI/8YqACrQXY4+BDY18i0s0fIxrxZM3fi
 Nc5yc3XoF7kTOaH4B5MHVCDQrRWePtucLOYdLiIhb41XLN4/l5hrWJv68UsUyyE7U/7+
 x1dTI5x2TUls8EeXhbqPZ8UQZbE1mLqGu3IFvZdFRs7eL0KBxW0keJ9UWlP9X9bsieTM RQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 2ru59dk5ks-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Apr 2019 21:09:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3IL8V57110257;
 Thu, 18 Apr 2019 21:09:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2rubq7rtw4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Apr 2019 21:09:19 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3IL9HG8002803;
 Thu, 18 Apr 2019 21:09:17 GMT
Received: from dhcp-burlington7-2nd-B-east-10-152-55-162.usdhcp.oraclecorp.com
 (/10.152.32.65) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 18 Apr 2019 14:09:17 -0700
To: Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <26fd14a9-2e60-73ff-ce56-6f12369ac13c@oracle.com>
Date: Thu, 18 Apr 2019 17:09:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9231
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904180125
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9231
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904180125
Subject: Re: [Xen-devel] Question regarding swiotlb-xen in Linux kernel
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Joe Jin <joe.jin@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418210913.1FgdleTrYiE5Y0QAlVbsxfxZ4bLv5AcZ8SQHwor8BZk@z>

T24gNC8xOC8xOSAzOjM2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEknbSBjdXJyZW50bHkg
aW52ZXN0aWdhdGluZyBhIHByb2JsZW0gcmVsYXRlZCB0byBzd2lvdGxiLXhlbi4gV2l0aCBhCj4g
c3BlY2lmaWMgZHJpdmVyIGEgY3VzdG9tZXIgaXMgY2FwYWJsZSB0byB0cmlnZ2VyIGEgc2l0dWF0
aW9uIHdoZXJlIGEKPiBNRk4gaXMgbWFwcGVkIHRvIG11bHRpcGxlIGRvbTAgUEZOcyBhdCB0aGUg
c2FtZSB0aW1lLiBUaGVyZSBpcyBubwo+IGd1ZXN0IGludm9sdmVkLCBzbyB0aGlzIGlzIG5vdCBy
ZWxhdGVkIHRvIGdyYW50cy4KPgo+IFdpdCBhIGRlYnVnIGtlcm5lbCBJIGhhdmUgbWFuYWdlZCB0
byB0cmFjayB0aGUgaW5jb25zaXN0ZW5jeSB0byBhCj4gY2FsbCBvZiB4ZW5fZGVzdHJveV9jb250
aWd1b3VzX3JlZ2lvbigpIGZyb20geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVudCgpCj4gd2hlcmUg
dGhlIHJlZ2lvbiB3YXMgb2J2aW91c2x5IG5vdCBjb250aWd1b3VzLgo+Cj4geGVuX3N3aW90bGJf
ZnJlZV9jb2hlcmVudCgpIGNvbnRhaW5zOgo+Cj4gICAgICAgICBpZiAoKChkZXZfYWRkciArIHNp
emUgLSAxIDw9IGRtYV9tYXNrKSkgfHwKPiAgICAgICAgICAgICByYW5nZV9zdHJhZGRsZXNfcGFn
ZV9ib3VuZGFyeShwaHlzLCBzaXplKSkKPiAgICAgICAgICAgICAgICAgeGVuX2Rlc3Ryb3lfY29u
dGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOwo+Cj4gU2hvdWxkbid0IGl0IGJlIGVpdGhlcjoK
Pgo+ICAgICAgICAgaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykpICYmCj4g
ICAgICAgICAgICAgIXJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpKQo+
ICAgICAgICAgICAgICAgICB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRl
cik7CgorSm9lCgpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVu
LWRldmVsLzIwMTgtMTAvbXNnMDE5MjAuaHRtbAoKKFRoZSBkaXNjdXNzaW9uIGhhcHBlbmVkIGlu
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OC0xMC9tc2cwMTgxNC5odG1sKQoKQW5kIGxvb2tzIGxpa2Ugd2UgZHJvcHBlZCBpdC4gT3Igd2Fz
IHRoZXJlIGEgcmVhc29uIHdlIGhhdmVuJ3QgcGlja2VkIGl0IHVwPwoKCi1ib3JpcwoKCj4KPgo+
IG9yOgo+Cj4gICAgICAgICBpZiAoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykgewo+
ICAgICAgICAgICAgIEJVR19PTihyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBz
aXplKSk7Cj4gICAgICAgICAgICAgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5cywg
b3JkZXIpOwo+ICAgICAgICAgfQo+Cj4gYXMgY2FsbGluZyB4ZW5fZGVzdHJveV9jb250aWd1b3Vz
X3JlZ2lvbigpIHdpdGggYSBub24tY29udGlndW91cyBtZW1vcnkKPiByZWdpb24gaXMgYSBwZXJm
ZWN0IHJlY2VpcHQgZm9yIGEgbGF0ZW50IGNyYXNoPwo+Cj4gVGhlIHJlbWFpbmluZyBxdWVzdGlv
biBpcyB3aHkgdGhlIGRyaXZlciBpcyBjYWxsaW5nCj4geGVuX3N3aW90bGJfZnJlZV9jb2hlcmVu
dCgpIGZvciBhIG5vbi1jb250aWd1b3VzIHJlZ2lvbiwgb2YgY291cnNlLgo+Cj4KPiBKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
