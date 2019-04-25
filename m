Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26E50C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:57:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B96F2077C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:57:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="KNyM+2ve"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B96F2077C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJjYF-0002T0-MD; Thu, 25 Apr 2019 18:56:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xeYe=S3=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1hJjYE-0002Sq-Ee
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:56:54 +0000
X-Inumbo-ID: e22e805e-678b-11e9-8dc5-bbb639ae316d
Received: from aserp2130.oracle.com (unknown [141.146.126.79])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e22e805e-678b-11e9-8dc5-bbb639ae316d;
 Thu, 25 Apr 2019 18:56:50 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PIrvW2042873;
 Thu, 25 Apr 2019 18:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2018-07-02;
 bh=eddxwpTbGvYlrDnZawfvlTYx6zkSVLalru6T1D4h8+A=;
 b=KNyM+2veTG+sc57FCXnJ1g5qMvps+C2JD5SppKWqEzXt2+K760LcP7UH55pnNzl2sCYj
 jTG4iSC4iVAG6Pcghixtx2a5k9kR0jSlfU5zUFvYpVecowzC3rQLMIue1V7VZgM4Bu1u
 pEyKBTHlQXyWI/FCCo4dsLxvZ19fOV2fOnrpVR0QX3hZkmpmNx0+ju/FKcP4pVOfLodx
 Oc6+f4/LhbSnq4QMo+m1b+Baz44c+o1fVjb3iLLTZIU7+9Evj6iONzbyR5uCmQRng8Do
 Tp1y4OZmVMN1ibpEKU7b9Y1MpaJsfF3t3HEC+cSQnxTIL5K0utrKYLlOvXYLHPKZHLi1 AQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2ryrxdaft8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 18:56:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3PItNZP135993;
 Thu, 25 Apr 2019 18:56:46 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 2ryrhtee1t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Apr 2019 18:56:46 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x3PIuj8h028391;
 Thu, 25 Apr 2019 18:56:45 GMT
Received: from char.us.oracle.com (/10.152.32.25)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 25 Apr 2019 11:55:46 -0700
Received: by char.us.oracle.com (Postfix, from userid 1000)
 id EA7E06A00EF; Thu, 25 Apr 2019 14:55:46 -0400 (EDT)
Date: Thu, 25 Apr 2019 14:55:46 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20190425185546.GD30965@char.us.oracle.com>
References: <20190411072000.4306-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411072000.4306-1-hch@lst.de>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=864
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904250116
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9238
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=894 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904250116
Subject: Re: [Xen-devel] a few xen swiotlb cleanups
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDk6MTk6NTZBTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gSGkgYWxsLAoKSSB3aWxsIHNsdXJwIHRoZXNlIHVwLi4gcmlnaHQgYWZ0ZXIg
SSB0ZXN0IHRoZW0gZm9yIGNvcnJlY3RuZXNzLgoKPiAKPiBiZWxvdyBhcmUgYSBjb3VwbGUgb2Yg
Y2xlYW51cHMgZm9yIHN3aW90bGIteGVuLmMuICBUaGV5IHdlcmUgZG9uZSBpbgo+IHByZXBhcmF0
aW9uIG9mIGV2ZW50dWFsbHkgdXNpbmcgdGhlIGRtYS1ub25jb2hlcmVudC5oIGNhY2hlIGZsdXNo
aW5nCj4gaG9va3MsIGJ1dCB0aGF0IGZpbmFsIGdvYWwgd2lsbCBuZWVkIHNvbWUgbWFqb3Igd29y
ayB0byB0aGUgYXJtMzIgY29kZQo+IGZpcnN0LiAgVW50aWwgdGhlbiBJIHRoaW5rIHRoZXNlIHBh
dGNoZXMgbWlnaHQgYmUgYmV0dGVyIGluIG1haW5saW5lCj4gdGhhbiBpbiBteSBsb2NhbCB0cmVl
IHNvIHRoYXQgdGhleSBkb24ndCBiaXRyb3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
