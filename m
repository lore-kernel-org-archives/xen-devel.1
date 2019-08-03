Return-Path: <SRS0=bI07=V7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB65BC0650F
	for <xen-devel@archiver.kernel.org>; Sat,  3 Aug 2019 01:42:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF922086A
	for <xen-devel@archiver.kernel.org>; Sat,  3 Aug 2019 01:42:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="OLRFKsHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF922086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htj3G-0007Yp-TI; Sat, 03 Aug 2019 01:41:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xit2=V7=nvidia.com=jhubbard@srs-us1.protection.inumbo.net>)
 id 1htj3G-0007Yk-29
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 01:41:42 +0000
X-Inumbo-ID: d7136311-b58f-11e9-8980-bc764e045a96
Received: from hqemgate14.nvidia.com (unknown [216.228.121.143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d7136311-b58f-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 01:41:40 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d44e6540001>; Fri, 02 Aug 2019 18:41:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 18:41:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 02 Aug 2019 18:41:39 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Aug
 2019 01:41:38 +0000
To: Calum Mackay <calum.mackay@oracle.com>, <john.hubbard@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-32-jhubbard@nvidia.com>
 <1738cb1e-15d8-0bbe-5362-341664f6efc8@oracle.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <db136399-ed87-56ea-bd6e-e5d29b145eda@nvidia.com>
Date: Fri, 2 Aug 2019 18:41:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1738cb1e-15d8-0bbe-5362-341664f6efc8@oracle.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1564796500; bh=zc1wJBCk6oa4TZJ5kpnxYLs8I/mCQFC0KqXiV/MQqAc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OLRFKsHoXBw1TGfx4yjE0Mz6/NwSHjUP/99RYZUV8BmAJcU3vy970b00AWaqBbqwn
 eDliId8mLescIf+v3MwQ2SrvN7VrnEwLTirEIw8jXzAjeXgqN3dtxI2Suyrp0L+f3G
 YPfLBq5YLuEzykUeYyNQ/IXUTk0ew3pKoxF86cxfpvc0Iih+8axjrF9wmXCYOssEh/
 dFyCupj1u3LqFaTu0iXYZzaL8I/Fkdd+Hdao45WQIFetVoCK43sV9CCZfHZ6uY+1an
 0Rm4XSFjiP2H1hfdLpXkesSoEJK75cPPtD+8sANcEv6R5DjbxYeg7dbcB8wnnzerOG
 BX10+9E+Fxe0Q==
Subject: Re: [Xen-devel] [PATCH 31/34] nfs: convert put_page() to
 put_user_page*()
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8yLzE5IDY6MjcgUE0sIENhbHVtIE1hY2theSB3cm90ZToKPiBPbiAwMi8wOC8yMDE5IDM6
MjAgYW0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Ci4uLiAKPiBTaW5jZSBpdCdzIHN0
YXRpYywgYW5kIG9ubHkgY2FsbGVkIHR3aWNlLCBtaWdodCBpdCBiZSBiZXR0ZXIgdG8gY2hhbmdl
IGl0cyB0d28gY2FsbGVycyBbbmZzX2RpcmVjdF97cmVhZCx3cml0ZX1fc2NoZWR1bGVfaW92ZWMo
KV0gdG8gY2FsbCBwdXRfdXNlcl9wYWdlcygpIGRpcmVjdGx5LCBhbmQgcmVtb3ZlIG5mc19kaXJl
Y3RfcmVsZWFzZV9wYWdlcygpIGVudGlyZWx5Pwo+IAo+IHRoYW5rcywKPiBjYWx1bS4KPiAKPiAK
Pj4gwqAgwqAgdm9pZCBuZnNfaW5pdF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5mc19jb21taXRf
aW5mbyAqY2luZm8sCj4+CiAKSGkgQ2FsdW0sCgpBYnNvbHV0ZWx5ISBJcyBpdCBPSyB0byBhZGQg
eW91ciByZXZpZXdlZC1ieSwgd2l0aCB0aGUgZm9sbG93aW5nIGluY3JlbWVudGFsCnBhdGNoIG1h
ZGUgdG8gdGhpcyBvbmU/CgpkaWZmIC0tZ2l0IGEvZnMvbmZzL2RpcmVjdC5jIGIvZnMvbmZzL2Rp
cmVjdC5jCmluZGV4IGIwMGI4OWRkYTNjNS4uYzBjMWI5ZjJjMDY5IDEwMDY0NAotLS0gYS9mcy9u
ZnMvZGlyZWN0LmMKKysrIGIvZnMvbmZzL2RpcmVjdC5jCkBAIC0yNzYsMTEgKzI3Niw2IEBAIHNz
aXplX3QgbmZzX2RpcmVjdF9JTyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAq
aXRlcikKICAgICAgICByZXR1cm4gbmZzX2ZpbGVfZGlyZWN0X3dyaXRlKGlvY2IsIGl0ZXIpOwog
fQogCi1zdGF0aWMgdm9pZCBuZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMoc3RydWN0IHBhZ2UgKipw
YWdlcywgdW5zaWduZWQgaW50IG5wYWdlcykKLXsKLSAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnBhZ2VzKTsKLX0KLQogdm9pZCBuZnNfaW5pdF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5m
c19jb21taXRfaW5mbyAqY2luZm8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBuZnNfZGlyZWN0X3JlcSAqZHJlcSkKIHsKQEAgLTUxMCw3ICs1MDUsNyBAQCBzdGF0aWMgc3Np
emVfdCBuZnNfZGlyZWN0X3JlYWRfc2NoZWR1bGVfaW92ZWMoc3RydWN0IG5mc19kaXJlY3RfcmVx
ICpkcmVxLAogICAgICAgICAgICAgICAgICAgICAgICBwb3MgKz0gcmVxX2xlbjsKICAgICAgICAg
ICAgICAgICAgICAgICAgZHJlcS0+Ynl0ZXNfbGVmdCAtPSByZXFfbGVuOwogICAgICAgICAgICAg
ICAgfQotICAgICAgICAgICAgICAgbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2VzKHBhZ2V2ZWMsIG5w
YWdlcyk7CisgICAgICAgICAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdldmVjLCBucGFnZXMpOwog
ICAgICAgICAgICAgICAga3ZmcmVlKHBhZ2V2ZWMpOwogICAgICAgICAgICAgICAgaWYgKHJlc3Vs
dCA8IDApCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwpAQCAtOTMzLDcgKzkyOCw3IEBA
IHN0YXRpYyBzc2l6ZV90IG5mc19kaXJlY3Rfd3JpdGVfc2NoZWR1bGVfaW92ZWMoc3RydWN0IG5m
c19kaXJlY3RfcmVxICpkcmVxLAogICAgICAgICAgICAgICAgICAgICAgICBwb3MgKz0gcmVxX2xl
bjsKICAgICAgICAgICAgICAgICAgICAgICAgZHJlcS0+Ynl0ZXNfbGVmdCAtPSByZXFfbGVuOwog
ICAgICAgICAgICAgICAgfQotICAgICAgICAgICAgICAgbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2Vz
KHBhZ2V2ZWMsIG5wYWdlcyk7CisgICAgICAgICAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdldmVj
LCBucGFnZXMpOwogICAgICAgICAgICAgICAga3ZmcmVlKHBhZ2V2ZWMpOwogICAgICAgICAgICAg
ICAgaWYgKHJlc3VsdCA8IDApCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwoKCgp0aGFu
a3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
