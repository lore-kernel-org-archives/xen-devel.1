Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C5EC04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 12:38:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5227F20881
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 12:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5227F20881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQWh6-0006iJ-BE; Tue, 14 May 2019 12:38:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQWh5-0006iE-0q
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 12:38:07 +0000
X-Inumbo-ID: 1da933be-7645-11e9-b03c-2feedc07b3fb
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1da933be-7645-11e9-b03c-2feedc07b3fb;
 Tue, 14 May 2019 12:38:04 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 06:38:02 -0600
Message-Id: <5CDAB6A6020000780022EAF9@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 06:37:58 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-2-julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 01/19] xen/const: Extend
 the existing macro BIT to take a suffix in parameter
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514123758.B1PoLdPBodmjvEyN0s16TQMmjZg2WqM9oQC-Rt4sMcQ@z>

Pj4+IE9uIDE0LjA1LjE5IGF0IDE0OjI0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEFybSBjdXJyZW50bHkgcHJvdmlkZXMgdHdvIG1hY3JvIEJJVCBhbmQgQklUX1VMTCB0aGF0IGFy
ZSBvbmx5IHVzYWJsZQo+IGluIEMgYW5kIHJldHVybiByZXNwZWN0aXZlbHkgdW5zaWduZWQgbG9u
ZyBhbmQgdW5zaWduZWQgbG9uZyBsb25nLgo+IAo+IEV4dGVuZGluZyB0aGUgbWFjcm9zIHRvIGRl
YWwgd2l0aCBhc3NlbWJseSB3b3VsZCBiZSBhIG5pY2UgYmVuZWZpdHMgYXMKPiBpdCBjb3VsZCBy
ZXBsYWNlIHRoZSBjb21tb24gcGF0dGVybiB0byBkZWZpbmUgZmllbGRzIChBQygxLCBzZngpIDw8
IFgpCj4gZWFzaWVyIHRvIHJlYWQuCj4gCj4gUmF0aGVyIHRoYW4gZXh0ZW5kaW5nIHRoZSB0d28g
bWFjcm9zLCBpdCB3YXMgZGVjaWRlZCB0byBkcm9wIEJJVF9VTEwoKQo+IGFuZCBleHRlbmQgdGhl
IG1hY3JvIEJJVCgpIHRvIHRha2UgYSBzdWZmaXggKGUuZyBVLCBVTCwgVUxMKSBpbgo+IHBhcmFt
ZXRlci4gVGhpcyB3b3VsZCBhbGxvdyB0byB1c2UgZGlmZmVyZW50IHN1ZmZpeCB3aXRob3V0IGhh
dmluZyB0bwo+IGRlZmluZSBuZXcgbWFjcm9zLgo+IAo+IFRoZSBuZXcgZXh0ZW5kIG1hY3JvIGlz
IG5vdyBtb3ZlZCBpbiBpbmNsdWRlL3hlbi9jb25zdC5oIHNvIGl0IGNhbiBiZQo+IHVzZWQgYnkg
YW55b25lIGluIFhlbiBhbmQgYWxzbyBhdm9pZCB0byBpbmNsdWRlIGJpdG9wcy5oIGluIGFzc2Vt
Ymx5Cj4gY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgoKVGhhbmtzIG11Y2ggZm9yIGdvaW5nIHRoaXMgcm91dGUhIEZvciB0aGUgc2lu
Z2xlIGxpbmUgYWRkaXRpb24gdG8KY29tbW9uIGNvZGUKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
