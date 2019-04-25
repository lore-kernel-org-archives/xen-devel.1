Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B2EC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:18:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D04218B0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 12:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D04218B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bitdefender.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJdKF-00009G-Tw; Thu, 25 Apr 2019 12:18:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aaLI=S3=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1hJdKE-000099-DM
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 12:18:02 +0000
X-Inumbo-ID: 2a2263f4-6754-11e9-ad42-db65ca92bc5f
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2a2263f4-6754-11e9-ad42-db65ca92bc5f;
 Thu, 25 Apr 2019 12:18:00 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 0EC2030644AC; Thu, 25 Apr 2019 15:17:59 +0300 (EEST)
Received: from [192.168.228.119] (unknown [86.120.154.75])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id D907C306E479;
 Thu, 25 Apr 2019 15:17:58 +0300 (EEST)
To: Jan Beulich <JBeulich@suse.com>
References: <CAFLDOk8Egs_gJmx1Yg386eEkmq4gNcbBxVGkjC7Wofhz8zCe1w@mail.gmail.com>
 <1f659428-0dd1-5537-5007-e97ff16a7506@bitdefender.com>
 <CAFLDOk9j1FgXDG2N6rzi0ObO3eip2pxM59_aaTcBjg_F_63A0g@mail.gmail.com>
 <a08d4a56-1da6-b373-f847-3a37197ffb53@bitdefender.com>
 <5CC186320200007800228F32@prv1-mh.provo.novell.com>
From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Message-ID: <5cfd3ea1-b25d-ec0b-1278-d4fdb28486be@bitdefender.com>
Date: Thu, 25 Apr 2019 15:17:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC186320200007800228F32@prv1-mh.provo.novell.com>
Content-Language: en-US-large
Subject: Re: [Xen-devel] Xen 4.11.1: guest uses altp2m to crash host
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425121724.6DaNLUYFIKUY1k2LRXlhYrijPFDfwFdJs_skUsyjOP0@z>

T24gNC8yNS8xOSAxOjA0IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNS4wNC4xOSBh
dCAxNjoxMCwgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+PiBPbiA0LzE1LzE5
IDU6MDQgUE0sIE1hdHQgTGVpbmhvcyB3cm90ZToKPj4+IFlvdSBhcmUgY29ycmVjdCAtLSBjaGVy
cnkgcGlja2luZyB0aGF0IGNvbW1pdCBpbnRvIFJFTEVBU0UtNC4xMS4xIAo+Pj4gYWRkcmVzc2Vz
IHRoZSBjcmFzaC4gVGhlIHByb2JsZW0gY2Fubm90IGJlIHJlcHJvZHVjZWQgb24gNC4xMi4KPj4+
Cj4+PiBJIGhvcGUgdGhpcyBoZWxwcy4KPj4KPj4gVGhhbmsgeW91IGZvciBjb25maXJtaW5nIHRo
ZSBmaXghCj4+Cj4+IFRvIHRoZSBkZWNpZGVyczogd291bGQgaXQgYmUgcmVhc29uYWJsZSB0byBh
c2sgcGF0Y2hlcyBsaWtlIHRoaXMgdG8gYmUgCj4+IGJhY2twb3J0ZWQgdG8gdGhlIGZ1dHVyZSA0
LjExIHJlbGVhc2U/Cj4gCj4gV2VsbCwgZmlyc3Qgb2YgYWxsIHlvdSBjYW4gYWx3YXlzIHNlbmQg
YSByZXF1ZXN0LiBBbmQgeWVzLCBpbiBnZW5lcmFsCj4gSSdkIGNvbnNpZGVyIHRoaXMgcmVhc29u
YWJsZSwgYnV0IEkgc2F5IHNvIHdpdGhvdXQgaGF2aW5nIGxvb2tlZCBhdAo+IHRoZSBhY3R1YWwg
Y29tbWl0KHMpIGluIHF1ZXN0aW9uLgoKVGhhbmsgeW91IGZvciB0aGUgYW5zd2VyLiBUaGlzIGlz
IHRoZSBjb21taXQgaW4gcXVlc3Rpb246CgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/
cD14ZW4uZ2l0O2E9Y29tbWl0ZGlmZjtoPTFkZGRmZmY0YzM5ZDNkYjE3ZGZhNzA5YjFjNTdmNDRl
M2VkMzUyZTM7aHA9Njg0NjU5NDRjODFmYTJmYmM0MGJmMjllYzYwODQwNzJhZjVlNDhlYwoKQUZB
SUNUIHRoZXJlJ3Mgbm90aGluZyBjb250cm92ZXJzaWFsIGFib3V0IGl0LCBhbmQgaXQgc2hvdWxk
IGVhc2lseQphcHBseSB0byA0LjExLCBzbyBpZiBwb3NzaWJsZSBJIHByb3Bvc2UgdGhhdCB3ZSBj
b25zaWRlciBiYWNrcG9ydGluZyBpdAp0byB0aGUgbmV4dCA0LjExIHJlbGVhc2UuCgoKVGhhbmtz
LApSYXp2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
