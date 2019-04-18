Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91622C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 22:32:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B6712087F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 22:32:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qpER0YJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B6712087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHFZP-0000R0-4j; Thu, 18 Apr 2019 22:31:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvUH=SU=oracle.com=joe.jin@srs-us1.protection.inumbo.net>)
 id 1hHFZO-0000Qv-1B
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 22:31:50 +0000
X-Inumbo-ID: bce8cd48-6229-11e9-b756-e730bcb2ab9a
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bce8cd48-6229-11e9-b756-e730bcb2ab9a;
 Thu, 18 Apr 2019 22:31:41 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3IMTXgN110698;
 Thu, 18 Apr 2019 22:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=IzA2Rdv8I6TEMJeYw+J5Jhbzk+1qi1CM3VM2mr3ANQw=;
 b=qpER0YJeKQcCjWND+E72przHDS9HcCWoKabQQZzfuqKpwnRo/AZwwyZ7oR+M79LoCEEN
 gNjJU3dyw5JCmIdv1ljZcePGD/QPDfRUb1PhVYG7iAUEJtJHIIR0iDWusZJp7b2/0jRM
 CaJWuGjfb0hnXmlJHPzhxdE2PDCRtPpWXbdcW6a+Nia//zn+tYTialx9W8ykWQGkyUTe
 wVeURZN+5qk3G23JH0jubZNpNBwCdB/IRxmsnAkkZ0Mipe5nOtx+Wsm1TtphPwlO7FJ3
 PKSfcAHvEJi8F19m7dqZ8JPlyGI8rQGQEV4P+V51sRhQPV/3vJa9EclEJd/Fvm5gAfHW Pg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2rusnf9a9g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Apr 2019 22:31:40 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3IMUB6u103519;
 Thu, 18 Apr 2019 22:31:39 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2rwe7b8g5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Apr 2019 22:31:39 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3IMVc2D007006;
 Thu, 18 Apr 2019 22:31:38 GMT
Received: from [10.211.46.126] (/10.211.46.126)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 18 Apr 2019 15:31:37 -0700
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
 <26fd14a9-2e60-73ff-ce56-6f12369ac13c@oracle.com>
From: Joe Jin <joe.jin@oracle.com>
Message-ID: <afbd29eb-25a8-edfc-b561-94264932f9eb@oracle.com>
Date: Thu, 18 Apr 2019 15:31:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <26fd14a9-2e60-73ff-ce56-6f12369ac13c@oracle.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9231
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904180131
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9231
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904180131
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418223135.H_RetKSppJT1mS4d1sST6F3ueChIFadOTC58OVDF7xA@z>

T24gNC8xOC8xOSAyOjA5IFBNLCBCb3JpcyBPc3Ryb3Zza3kgd3JvdGU6Cj4gT24gNC8xOC8xOSAz
OjM2IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRp
bmcgYSBwcm9ibGVtIHJlbGF0ZWQgdG8gc3dpb3RsYi14ZW4uIFdpdGggYQo+PiBzcGVjaWZpYyBk
cml2ZXIgYSBjdXN0b21lciBpcyBjYXBhYmxlIHRvIHRyaWdnZXIgYSBzaXR1YXRpb24gd2hlcmUg
YQo+PiBNRk4gaXMgbWFwcGVkIHRvIG11bHRpcGxlIGRvbTAgUEZOcyBhdCB0aGUgc2FtZSB0aW1l
LiBUaGVyZSBpcyBubwo+PiBndWVzdCBpbnZvbHZlZCwgc28gdGhpcyBpcyBub3QgcmVsYXRlZCB0
byBncmFudHMuCj4+Cj4+IFdpdCBhIGRlYnVnIGtlcm5lbCBJIGhhdmUgbWFuYWdlZCB0byB0cmFj
ayB0aGUgaW5jb25zaXN0ZW5jeSB0byBhCj4+IGNhbGwgb2YgeGVuX2Rlc3Ryb3lfY29udGlndW91
c19yZWdpb24oKSBmcm9tIHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoKQo+PiB3aGVyZSB0aGUg
cmVnaW9uIHdhcyBvYnZpb3VzbHkgbm90IGNvbnRpZ3VvdXMuCj4+Cj4+IHhlbl9zd2lvdGxiX2Zy
ZWVfY29oZXJlbnQoKSBjb250YWluczoKPj4KPj4gICAgICAgICBpZiAoKChkZXZfYWRkciArIHNp
emUgLSAxIDw9IGRtYV9tYXNrKSkgfHwKPj4gICAgICAgICAgICAgcmFuZ2Vfc3RyYWRkbGVzX3Bh
Z2VfYm91bmRhcnkocGh5cywgc2l6ZSkpCj4+ICAgICAgICAgICAgICAgICB4ZW5fZGVzdHJveV9j
b250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlcik7Cj4+Cj4+IFNob3VsZG4ndCBpdCBiZSBlaXRo
ZXI6Cj4+Cj4+ICAgICAgICAgaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykp
ICYmCj4+ICAgICAgICAgICAgICFyYW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBz
aXplKSkKPj4gICAgICAgICAgICAgICAgIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKHBo
eXMsIG9yZGVyKTsKPiAKPiArSm9lCj4gCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9h
cmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTEwL21zZzAxOTIwLmh0bWwKPiAKPiAoVGhlIGRp
c2N1c3Npb24gaGFwcGVuZWQgaW4KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hp
dmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTAvbXNnMDE4MTQuaHRtbCkKPiAKPiBBbmQgbG9va3Mg
bGlrZSB3ZSBkcm9wcGVkIGl0LiBPciB3YXMgdGhlcmUgYSByZWFzb24gd2UgaGF2ZW4ndCBwaWNr
ZWQgaXQgdXA/CgpJIHJlbWVtYmVyZWQgdGhlIGNvbmNlcm4gd2FzIHdoZXRoZXIgbWVtb3J5IG5v
dCBmcm9tIFhlbi4KClRoYW5rcywKSm9lCgo+IAo+IAo+IC1ib3Jpcwo+IAo+IAo+Pgo+Pgo+PiBv
cjoKPj4KPj4gICAgICAgICBpZiAoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykgewo+
PiAgICAgICAgICAgICBCVUdfT04ocmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywg
c2l6ZSkpOwo+PiAgICAgICAgICAgICB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlz
LCBvcmRlcik7Cj4+ICAgICAgICAgfQo+Pgo+PiBhcyBjYWxsaW5nIHhlbl9kZXN0cm95X2NvbnRp
Z3VvdXNfcmVnaW9uKCkgd2l0aCBhIG5vbi1jb250aWd1b3VzIG1lbW9yeQo+PiByZWdpb24gaXMg
YSBwZXJmZWN0IHJlY2VpcHQgZm9yIGEgbGF0ZW50IGNyYXNoPwo+Pgo+PiBUaGUgcmVtYWluaW5n
IHF1ZXN0aW9uIGlzIHdoeSB0aGUgZHJpdmVyIGlzIGNhbGxpbmcKPj4geGVuX3N3aW90bGJfZnJl
ZV9jb2hlcmVudCgpIGZvciBhIG5vbi1jb250aWd1b3VzIHJlZ2lvbiwgb2YgY291cnNlLgo+Pgo+
Pgo+PiBKdWVyZ2VuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
