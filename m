Return-Path: <SRS0=eqFR=XL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD46C4CECD
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 15:44:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 640F82184D
	for <xen-devel@archiver.kernel.org>; Mon, 16 Sep 2019 15:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 640F82184D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9tAw-0001bC-4n; Mon, 16 Sep 2019 15:44:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9tAv-0001b0-Ff
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 15:44:25 +0000
X-Inumbo-ID: db1be013-d898-11e9-95ef-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id db1be013-d898-11e9-95ef-12813bfff9fa;
 Mon, 16 Sep 2019 15:44:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 283BCAD7B;
 Mon, 16 Sep 2019 15:44:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa4224cb-98ee-8f05-5281-22f37e7ae2aa@suse.com>
Date: Mon, 16 Sep 2019 17:44:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c3cd6d41-13f6-255d-68ba-64f628a348a9@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Regression with vcpu runstate info and
 XEN_RUNSTATE_UPDATE
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 SergeyDyasli <sergey.dyasli@citrix.com>,
 =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDkuMjAxOSAxNjo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBBZnRlciBhIGNvbXBs
aWNhdGVkIGludmVzdGlnYXRpb24sIGl0IHR1cm5zIG91dCB0aGF0IGMvcyAyNTI5Yzg1MGVhNDgK
PiBicm9rZSB4Y192Y3B1X2dldGluZm8oKS4KPiAKPiBUaGUgYnVnIGxvb2tzIGFzIGlmIGl0IGlz
IGluIHZjcHVfcnVuc3RhdGVfZ2V0KCksIHdoaWNoIGRvZXNuJ3QgYWNjb3VudAo+IGZvciBYRU5f
UlVOU1RBVEVfVVBEQVRFIGFuZCBjYWxjdWxhdGluZyBhIHdpbGRseSBpbmFwcHJvcHJpYXRlIGRl
bHRhLsKgCj4gVWx0aW1hdGVseSwgdGhlIHJlc3VsdCBvZiBYRU5fRE9NQ1RMX2dldHZjcHVpbmZv
IGVuZHMgdXAgdmVyeQo+IG9jY2FzaW9uYWxseSB3aXRoIG9wLT51LmdldHZjcHVpbmZvLmNwdV90
aW1lIGJlaW5nIHdyb25nIGJ5IDEgPDwgNjMuCj4gCj4gR2l2ZW4gc29tZSBvZiB0aGUgY2FsbGVy
cyBvZiB2Y3B1X3J1bnN0YXRlX2dldCgpLCBJIGRvbid0IHRoaW5rIGl0IGlzCj4gcmVhc29uYWJs
ZSB0byBwYXVzZSB0aGUgVkNQVSB3aGlsZSByZWFkaW5nIHRoZSBydW5zdGF0ZSBpbmZvLsKgIEhv
d2V2ZXIsCj4gaXQgaXMgYWxzbyB1bmNsZWFyIHdoZXRoZXIgd2FpdGluZyBmb3IgWEVOX1JVTlNU
QVRFX1VQREFURSB0byBkcm9wIGluCj4gdmNwdV9ydW5zdGF0ZV9nZXQoKSBpcyBzYWZlIGVpdGhl
ci4KCkZpcnN0IGFuZCBmb3JlbW9zdCBJJ20gd29uZGVyaW5nIHdoZXRoZXIgc2ltcGx5IG1hc2tp
bmcgb2ZmClhFTl9SVU5TVEFURV9VUERBVEUgaW4gdmNwdV9ydW5zdGF0ZV9nZXQoKSB3b3VsZG4n
dCBiZSBhbgpvcHRpb24uIFRoZSBhc3N1bXB0aW9uIG9mIHRoZSBmZWF0dXJlIGFzIGEgd2hvbGUg
aXMgZm9yIHRoZQpoaWdoIGJpdCB0byBuZXZlciBiZSBzZXQgaW4gYW4gYWN0dWFsIHRpbWUgdmFs
dWUsIGFmdGVyIGFsbC4KClRoZSBvdGhlciBvcHRpb24gSSdkIHNlZSBpcyBmb3IgdmNwdV9ydW5z
dGF0ZV9nZXQoKSB0byBnYWluCmEgYm9vbGVhbiByZXR1cm4gdHlwZSBieSB3aGljaCBpdCB3b3Vs
ZCBpbmRpY2F0ZSB0bwppbnRlcmVzdGVkIGNhbGxlcnMgd2hldGhlciB0aGUgbGF0Y2hpbmcgb2Yg
dGhlIHZhbHVlcwpoYXBwZW5lZCB3aGlsZSBhbiB1cGRhdGUgd2FzIGluIHByb2dyZXNzIGVsc2V3
aGVyZS4gQ2FsbGVycwpuZWVkaW5nIHRvIGNvbnN1bWUgdGhlIHBvdGVudGlhbGx5IGluY29ycmVj
dCByZXN1bHQgY291bGQKdGhlbiBjaG9vc2UgdG8gd2FpdCBvciBzY2hlZHVsZSBhIGh5cGVyY2Fs
bCBjb250aW51YXRpb24uCgpUaGUgM3JkIG9wdGlvbiAobGVzcyBkZXNpcmFibGUgaW1vIG5vdCB0
aGUgbGVhc3QgYmVjYXVzZSBpdAp3b3VsZCByZXF1aXJlIHRvdWNoaW5nIGFsbCBjYWxsZXJzKSB3
b3VsZCBiZSBmb3IgdGhlIGZ1bmN0aW9uCnRvIGdhaW4gYSBwYXJhbWV0ZXIgdGVsbGluZyBpdCB3
aGV0aGVyIHRvIHNwaW4gdW50aWwKWEVOX1JVTlNUQVRFX1VQREFURSBpcyBvYnNlcnZlZCBjbGVh
ci4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
