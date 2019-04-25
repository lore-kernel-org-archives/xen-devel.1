Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD825C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:44:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28DC920578
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 18:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28DC920578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJjLv-0001U2-2E; Thu, 25 Apr 2019 18:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IMsy=S3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hJjLt-0001Tt-Sj
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:44:09 +0000
X-Inumbo-ID: 1ab06034-678a-11e9-a0d6-1b964d586176
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1ab06034-678a-11e9-a0d6-1b964d586176;
 Thu, 25 Apr 2019 18:44:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B1D3EAC6B;
 Thu, 25 Apr 2019 18:44:05 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
 <20190425155056.23145-7-ian.jackson@eu.citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <70c569e9-22fe-d597-060d-aced07097514@suse.com>
Date: Thu, 25 Apr 2019 20:44:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190425155056.23145-7-ian.jackson@eu.citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [OSSTEST PATCH 6/6] builds: Run i386 builds on
 amd64 kernels
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425184405.5o63xMqno1qPk2ycimFOuSJBUmPBkAdPs8jGP2z-AJ8@z>

T24gMjUvMDQvMjAxOSAxNzo1MCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gTW9zdCBoYXJkd2FyZSB0
aGF0IHN1cHBvcnRzIGkzODYgc3VwcG9ydHMgYW1kNjQgdG9vLiAgV2hlbiBkb2luZwo+IGJ1aWxk
cyB3ZSBkbyBuZWVkIHRoZSByaWdodCB1c2VybGFuZCwgYnV0IHdlIGRvbid0IGFjdHVhbGx5IGNh
cmUgd2hhdAo+IHRoZSBrZXJuZWwgaXMgZG9pbmcuICBXaXRoIExpbnV4IDMyLW9uLTY0IGlzIGdv
b2QgZm9yIHRoYXQuCj4gCj4gRXNwZWNpYWxseSwgdGhlcmUgaXMgYSBrZXJuZWwgcmVncmVzc2lv
biAoZXZpZGVudCBpbiB0aGUgRGViaWFuCj4gc3RyZXRjaCBrZXJuZWwsIGJ1dCBub3QgcHJlc2Vu
dCBpbiBqZXNzaWUncykgd2hlcmUgMzItYml0IExpbnV4Cj4gbWlzbWFuYWdlcyB0aGUgbWVtb3J5
IG9uIGhvc3RzIHdpdGggbW9kZXJhdGVseSBsYXJnZSBhbW91bnRzIG9mCj4gUkFNIChpZSwgc2ln
bmlmaWNhbnRseSBtb3JlIFJBTSB0aGFuIGNhbiBiZSBhZGRyZXNzZWQgYXQgb25jZSksCj4gcmVz
dWx0aW5nIGluIHdoYXQgYW1vdW50cyB0byBhIG5lYXItc3RhbGwgb2YgdGhlIHBhZ2luZyBzeXN0
ZW0uICBTaW5jZQo+IHRoZSBwYWdpbmcgc3lzdGVtIGlzIHVzZWQgZm9yIGZpbGVzeXN0ZW0gd3Jp
dGVzIHRvbywgdGhlIGVmZmVjdCBpcwo+IHRoYXQgY29tbWFuZHMgcnVuIGJ5IGJ1aWxkcyBjYW4g
dGFrZSB0b3RhbGx5IHVucmVhc29uYWJsZSBhbW91bnRzIG9mCj4gdGltZS4gIEllLCB0aGlzIHZl
cnNpb24gb2YgTGludXggaXMgYnJva2VuIHdoZW4gaTM4NiBQQUUgaXMgbmVlZGVkLgo+IAo+IElu
IHByYWN0aWNlIHRoaXMgaXMgY2F1c2luZyBzaWduaWZpY2FudCB0cm91YmxlIGluIHRoZSBYZW4g
UHJvamVjdCBDSS4KPiAKPiBUaGlzIGtlcm5lbCBidWcgcHJvYmFibHkgd29uJ3QgYWZmZWN0IG91
ciB0ZXN0IGpvYnMgYmVjYXVzZQo+IChpKSB3ZSB1c2Ugb3VyIG93biBrZXJuZWxzLCBzbyB3ZSB3
b3VsZCBwcm9iYWJseSBkZXRlY3QgdGhpcwo+IHJlZ3Jlc3Npb24gd2hlbiBzd2l0Y2hpbmcga2Vy
bmVsIGJyYW5jaGVzIGV0Yy4gKGlpKSB0ZXN0IGpvYnMKPiBydW4gd2l0aCBhIGRvbTBfbWVtIHNl
dHRpbmcgd2hpY2ggYXZvaWRzIHRoZSBwcmVjb25kaXRpb25zIGZvciB0aGUKPiBwYXJ0aWN1bGFy
IGJ1Zy4KPiAKPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IENDOiBCb3Jp
cyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgo+IENDOiBXZWkgTGl1IDx3
ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+IENDOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+
IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgoK
QWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
