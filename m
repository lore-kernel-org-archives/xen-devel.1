Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAB8C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 09:57:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 304A121738
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 09:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 304A121738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCLas-0000ur-B8; Fri, 05 Apr 2019 09:57:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wBck=SH=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hCLaq-0000um-V5
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 09:57:04 +0000
X-Inumbo-ID: 27b2a8e8-5789-11e9-a41e-bbc47fc08706
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27b2a8e8-5789-11e9-a41e-bbc47fc08706;
 Fri, 05 Apr 2019 09:57:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 8557D307503D; Fri,  5 Apr 2019 12:56:59 +0300 (EEST)
Received: from [10.10.196.90] (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 7E110306E477;
 Fri,  5 Apr 2019 12:56:59 +0300 (EEST)
To: Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel@lists.xenproject.org
References: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <546ef55d-3257-3c66-4dcb-5371c97912eb@bitdefender.com>
Date: Fri, 5 Apr 2019 12:56:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <06086a6f2400b372993d03ece48e65bfbe88134e.1554456553.git.ppircalabu@bitdefender.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] [PATCH] vm_event: Fix XEN_VM_EVENT_RESUME domctl
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405095652.XDeXc47A92PhG4NspBswmY8urXq5_2a-_i6i-fAMShk@z>

T24gNC81LzE5IDEyOjMzIFBNLCBQZXRyZSBQaXJjYWxhYnUgd3JvdGU6Cj4gTWFrZSBYRU5fVk1f
RVZFTlRfUkVTVU1FIHJldHVybiAwIGluIGNhc2Ugb2Ygc3VjY2VzcywgaW5zdGVhZCBvZgo+IC1F
SU5WQUwuCj4gUmVtb3ZlIHZtX2V2ZW50X3Jlc3VtZSBmb3JtIHZtX2V2ZW50LmggaGVhZGVyIGFu
ZCBzZXQgdGhlIGZ1bmN0aW9uJ3MKPiB2aXNpYmlsaXR5IHRvIHN0YXRpYyBhcyBpcyB1c2VkIG9u
bHkgaW4gdm1fZXZlbnQuYy4KPiBNb3ZlIHRoZSB2bV9ldmVudF9jaGVja19yaW5nIHRlc3QgaW5z
aWRlIHZtX2V2ZW50X3Jlc3VtZSBpbiBvcmRlciB0bwo+IHNpbXBsaWZ5IHRoZSBjb2RlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5j
b20+CgpBY2tlZC1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29t
PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
