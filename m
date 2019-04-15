Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4484AC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:46:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1999820880
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1999820880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG3nv-0003sk-1F; Mon, 15 Apr 2019 15:45:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hG3nt-0003sa-5R
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:45:53 +0000
X-Inumbo-ID: 8bc64280-5f95-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8bc64280-5f95-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 15:45:51 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 15 Apr 2019 09:45:50 -0600
Message-Id: <5CB4A8090200007800155576@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 15 Apr 2019 09:49:29 -0600
From: "Jan Beulich" <jbeulich@suse.com>
To: <andrew.cooper3@citrix.com>
References: <1555329809-3248-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1555329809-3248-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2] x86/msr: Fix fallout from mostly c/s
 832c180
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
Cc: xen-devel@lists.xenproject.org, kevin.tian@intel.com, wei.liu2@citrix.com,
 jun.nakajima@intel.com, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415154929.4BAgJrgTXx0C1MMeVLy73uI2287r6Wotj1b9fQ7Fyuc@z>

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzE1LzE5IDI6
MDMgUE0gPj4+CiA+KiBGaXggdGhlIHNoaW0gYnVpbGQgYnkgcHJvdmlkaW5nIGEgIUNPTkZJR19I
Vk0gZGVjbGFyYXRpb24gZm9yCj5odm1fZ2V0X2d1ZXN0X2JuZGNmZ3MoKSwgYW5kIHJlbW92aW5n
IHRoZSBpbnRyb2R1Y2VkCj5BU1NFUlQoaXNfaHZtX2RvbWFpbihkKSkncy4gIFRoZXkgYXJlIG5l
ZWRlZCBmb3IgRENFIHRvIGtlZXAgdGhlIGJ1aWxkCj53b3JraW5nLiAgRnVydGhlcm1vcmUsIGlu
IHRoaXMgd2F5LCB0aGUgcmlzayBvZiBydW50aW1lIHR5cGUgY29uZnVzaW9uIGlzCj5yZW1vdmVk
Lgo+KiBSZXZlcnQgdGhlIGRlLWNvbnN0J2luZyBvZiB0aGUgdmNwdSBwb2ludGVyIGluIHZteF9n
ZXRfZ3Vlc3RfYm5kY2ZncygpLgo+dm14X3ZtY3NfZW50ZXIoKSByZWFsbHkgZG9lcyBtdXRhdGUg
dGhlIHZjcHUsIGFuZCBtYXkgY2F1c2UgaXQgdG8gdW5kZXJnbyBhCj5mdWxsIGRlL3Jlc2NoZWR1
bGUsIHdoaWNoIGlzIGluIHZpb2xhdGlvbiBvZiB0aGUgQUJJIGRlc2NyaWJlZCBieQo+aHZtX2dl
dF9ndWVzdF9ibmRjZmdzKCkuICBndWVzdF9yZG1zcigpIHdhcyBhbHdheXMgZ29pbmcgdG8gbmVl
ZCB0byBsb3NlCj5pdHMgY29uc3QgcGFyYW1ldGVyLCBhbmQgdGhpcyB3YXMgdGhlIGNvcnJlY3Qg
dGltZSBmb3IgaXQgdG8gaGFwcGVuLgoKV2l0aCB0aGUgQUJJIHZpb2xhdGlvbiBjbGFpbSBoZXJl
IHJlbW92ZWQgKGUuZy4gcmVwbGFjZWQgYnkgc2F5aW5nIHRoYXQgaXQKbWlnaHQgYmUgY29uZnVz
aW5nIHRvIHRoZSByZWFkZXIpCgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKVGhpcyB3cm9uZyAoYXQgbGVhc3QgSSBjb250aW51ZSB0byBiZSBvZiB0aGUgb3Bpbmlv
biB0aGF0IGl0IGlzKSBjbGFpbSAtIGp1c3QgdG8KbWFrZSBpdCBleHBsaWNpdCAtIGlzIHdoYXQg
SSd2ZSBwcmV2aW91c2x5IGNhbGxlZCBiZWluZyBmYWN0dWFsIGluY29ycmVjdCBvbiB0aGUKdjEg
dGhyZWFkLiBBcyBzYWlkIGJlZm9yZSwgdGhlcmUncyBubyAiQUJJIHByb21pc2UiIHRvIGJlIGRl
cml2ZWQgZnJvbSAiY29uc3QiLgoKSW4gZmFjdCBJJ2QgcHJlZmVyIFZNQ1MgcmVhZHMgaW4gZ2Vu
ZXJhbCB0byBiZSB2aWV3ZWQgYXMgcmVhZGluZyAic3RhdGUiLCBub3QKbWVtb3J5LCBhbmQgaXQg
anVzdCBzbyBoYXBwZW5zIHRoYXQgaW4gY2VydGFpbiBjYXNlcyBzb21lIHN5bmNpbmcgYmV0d2Vl
bgptZW1vcnkgYW5kIENQVSBuZWVkcyB0byBiZSBkb25lIGZvciBjb3JyZWN0ICJzdGF0ZSIgdG8g
YmUgcmV0dXJuZWQuIFRoaXMKZG9lc24ndCBhbHRlciB3aGF0IHRoZSBjYWxsZXIgc2VlcyAoaS5l
LiB0aGVyZSdzIG5vIGNoYW5nZSB0byAic3RhdGUiLCBhbmQgYW55CmxvY2tzIGFjcXVpcmVkIGdl
dCByZWxlYXNlZCBhZ2FpbiBiZWZvcmUgcmV0dXJuaW5nKS4gSSdkIGxpa2UgdG8gcmUtZW1waGFz
aXplCnRoZSBzaW1pbGFyaXR5IHRvIEMrKydzIG11dGFibGUgaGVyZS4KCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
