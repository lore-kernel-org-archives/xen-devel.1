Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACEB9C10F14
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 14:25:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78CEC20674
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 14:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="tcpRYFEM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78CEC20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hIwMY-0000jy-GQ; Tue, 23 Apr 2019 14:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UMkX=SZ=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hIwMW-0000jt-US
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 14:25:32 +0000
X-Inumbo-ID: a533a170-65d3-11e9-bffe-dfa0ede4ae97
Received: from userp2120.oracle.com (unknown [156.151.31.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a533a170-65d3-11e9-bffe-dfa0ede4ae97;
 Tue, 23 Apr 2019 14:25:30 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3NEKLPh123548;
 Tue, 23 Apr 2019 14:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=xr8NNnw/8pHWkOibCVsj81IvPwFpnNxw/FSXcPC7UTE=;
 b=tcpRYFEMnlImZZPfiZF20MLyJybUKBzaranVUrZCmzo5mXzSZ3DmMCzLlaxY/IJizla4
 rrwbt8OOqSl7Wf/RlJetc3Qa+BOvbO/EjTeLImOB/kTqzT/r8jd5z/fonLP9bwFbmzmz
 htc7GSgYBToA0JRIfHNHRbChVT61IWOKgt3aVF9tQC4wr2RdTG8KGjWNnQFIXzz2uE1k
 WVBxCSekmF+1YbzNwOBrVvRXXrIQdTW11oWx2EwbUo1KsjM1hDFKLx/aWAGKLlqgUCSV
 /jVdBZ6ddFdt++smC26KxxODW0Vm7qsf8FRZaHchSrv8w+L21DAhb9SJqy83PZB5ry6n rQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2ryv2q4fj9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2019 14:25:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x3NEOOIK139745;
 Tue, 23 Apr 2019 14:25:25 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3030.oracle.com with ESMTP id 2s0f0vh93p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Apr 2019 14:25:25 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x3NEPNi7014382;
 Tue, 23 Apr 2019 14:25:24 GMT
Received: from dhcp-burlington7-2nd-B-east-10-152-55-162.usdhcp.oraclecorp.com
 (/10.152.32.65) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 23 Apr 2019 07:25:23 -0700
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
References: <20190423105457.17502-1-jgross@suse.com>
 <20190423105457.17502-4-jgross@suse.com>
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Openpgp: preference=signencrypt
Autocrypt: addr=boris.ostrovsky@oracle.com; prefer-encrypt=mutual; keydata=
 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
 Jg6OxFYd01z+a+oL
Message-ID: <b4917f80-a8ce-d38f-5c59-ef266669cea3@oracle.com>
Date: Tue, 23 Apr 2019 10:31:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190423105457.17502-4-jgross@suse.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9236
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1904230097
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9236
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1904230097
Subject: Re: [Xen-devel] [PATCH 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: sstabellini@kernel.org, konrad.wilk@oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNC8yMy8xOSA2OjU0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+IEluc3RlYWQgb2YgYWx3
YXlzIGNhbGxpbmcgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24oKSBpbiBjYXNlIHRoZQo+
IG1lbW9yeSBpcyBETUEtYWJsZSBmb3IgdGhlIHVzZWQgZGV2aWNlLCBkbyBzbyBvbmx5IGluIGNh
c2UgaXQgaGFzIGJlZW4KPiBtYWRlIERNQS1hYmxlIHZpYSB4ZW5fY3JlYXRlX2NvbnRpZ3VvdXNf
cmVnaW9uKCkgYmVmb3JlLgo+Cj4gVGhpcyB3aWxsIGF2b2lkIGEgbG90IG9mIHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKCkgY2FsbHMgZm9yCj4gNjQtYml0IGNhcGFibGUgZGV2aWNlcy4K
Pgo+IEFzIHRoZSBtZW1vcnkgaW4gcXVlc3Rpb24gaXMgb3duZWQgYnkgc3dpb3RsYi14ZW4gdGhl
IFBHX293bmVyX3ByaXZfMQo+IGZsYWcgb2YgdGhlIGZpcnN0IGFsbG9jYXRlZCBwYWdlIGNhbiBi
ZSB1c2VkIGZvciByZW1lbWJlcmluZy4KCkkgdGhpbmsgYSBuZXcgZW51bSBpbiBwYWdlZmxhZ3Mg
d291bGQgYmUgdXNlZnVsLCBhbmQgYmUgY29uc2lzdGVudCB3aXRoCm90aGVyIGZsYWcgdXNlcy4K
Ci1ib3JpcwoKCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgfCA5ICsrKysrKy0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhl
bi5jCj4gaW5kZXggNDNiNmU2NWFlMjU2Li5hNzJmMTgxZDhlMjAgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy94ZW4vc3dpb3RsYi14ZW4uYwo+ICsrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMK
PiBAQCAtMzIxLDYgKzMyMSw3IEBAIHhlbl9zd2lvdGxiX2FsbG9jX2NvaGVyZW50KHN0cnVjdCBk
ZXZpY2UgKmh3ZGV2LCBzaXplX3Qgc2l6ZSwKPiAgCQkJeGVuX2ZyZWVfY29oZXJlbnRfcGFnZXMo
aHdkZXYsIHNpemUsIHJldCwgKGRtYV9hZGRyX3QpcGh5cywgYXR0cnMpOwo+ICAJCQlyZXR1cm4g
TlVMTDsKPiAgCQl9Cj4gKwkJU2V0UGFnZU93bmVyUHJpdjEodmlydF90b19wYWdlKHJldCkpOwo+
ICAJfQo+ICAJbWVtc2V0KHJldCwgMCwgc2l6ZSk7Cj4gIAlyZXR1cm4gcmV0Owo+IEBAIC0zNDQs
OSArMzQ1LDExIEBAIHhlbl9zd2lvdGxiX2ZyZWVfY29oZXJlbnQoc3RydWN0IGRldmljZSAqaHdk
ZXYsIHNpemVfdCBzaXplLCB2b2lkICp2YWRkciwKPiAgCS8qIENvbnZlcnQgdGhlIHNpemUgdG8g
YWN0dWFsbHkgYWxsb2NhdGVkLiAqLwo+ICAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5fUEFH
RV9TSElGVCk7Cj4gIAo+IC0JaWYgKChkZXZfYWRkciArIHNpemUgLSAxIDw9IGRtYV9tYXNrKSAm
Jgo+IC0JICAgICFXQVJOX09OKHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNp
emUpKSkKPiAtCQl4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlcik7Cj4g
KwlpZiAoUGFnZU93bmVyUHJpdjEodmlydF90b19wYWdlKHZhZGRyKSkpIHsKPiArCQlpZiAoIVdB
Uk5fT04ocmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6ZSkpKQo+ICsJCQl4
ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbihwaHlzLCBvcmRlcik7Cj4gKwkJQ2xlYXJQYWdl
T3duZXJQcml2MSh2aXJ0X3RvX3BhZ2UodmFkZHIpKTsKPiArCX0KPiAgCj4gIAl4ZW5fZnJlZV9j
b2hlcmVudF9wYWdlcyhod2Rldiwgc2l6ZSwgdmFkZHIsIChkbWFfYWRkcl90KXBoeXMsIGF0dHJz
KTsKPiAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
