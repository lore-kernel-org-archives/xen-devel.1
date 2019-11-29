Return-Path: <SRS0=4rCt=ZV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B097CC432C0
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 16:01:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89901216F4
	for <xen-devel@archiver.kernel.org>; Fri, 29 Nov 2019 16:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89901216F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaihR-0005b3-0w; Fri, 29 Nov 2019 16:00:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaihP-0005au-W7
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 16:00:52 +0000
X-Inumbo-ID: 69e9a84e-12c1-11ea-a3e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69e9a84e-12c1-11ea-a3e7-12813bfff9fa;
 Fri, 29 Nov 2019 16:00:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DCBFBAF27;
 Fri, 29 Nov 2019 16:00:49 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191129134306.2738-1-pdurrant@amazon.com>
 <20191129134306.2738-2-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <599c254c-035b-33a0-9f32-866ffe644ad5@suse.com>
Date: Fri, 29 Nov 2019 17:00:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129134306.2738-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen/xenbus: reference count
 registered modules
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxNDo0MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRvIHByZXZlbnQgYSBt
b2R1bGUgYmVpbmcgcmVtb3ZlZCB3aGlsc3QgYXR0YWNoZWQgdG8gYSBmcm9udGVuZCwgYW5kCgpX
aHkgb25seSBmcm9udGVuZD8KCj4gaGVuY2UgeGVuYnVzIGNhbGxpbmcgaW50byBwb3RlbnRpYWxs
eSBpbnZhbGlkIHRleHQsIHRha2UgYSByZWZlcmVuY2Ugb24KPiB0aGUgbW9kdWxlIGJlZm9yZSBj
YWxsaW5nIHRoZSBwcm9iZSgpIG1ldGhvZCAoZHJvcHBpbmcgaXQgaWYgdW5zdWNjZXNzZnVsKQo+
IGFuZCBkcm9wIHRoZSByZWZlcmVuY2UgYWZ0ZXIgcmV0dXJuaW5nIGZyb20gdGhlIHJlbW92ZSgp
IG1ldGhvZC4KPiAKPiBOT1RFOiBUaGlzIGFsbG93cyB0aGUgYWQtaG9jIHJlZmVyZW5jZSBjb3Vu
dGluZyBpbiB4ZW4tbmV0YmFjayB0byBiZQo+ICAgICAgIHJlbW92ZWQuIFRoaXMgd2lsbCBiZSBk
b25lIGluIGEgc3Vic2VxdWVudCBwYXRjaC4KPiAKPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJy
YW50QGFtYXpvbi5jb20+Cj4gCj4gLS0tIGEvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9i
ZS5jCj4gKysrIGIvZHJpdmVycy94ZW4veGVuYnVzL3hlbmJ1c19wcm9iZS5jCj4gQEAgLTIzMiw5
ICsyMzIsMTEgQEAgaW50IHhlbmJ1c19kZXZfcHJvYmUoc3RydWN0IGRldmljZSAqX2RldikKPiAg
CQlyZXR1cm4gZXJyOwo+ICAJfQo+ICAKPiArCV9fbW9kdWxlX2dldChkcnYtPmRyaXZlci5vd25l
cik7CgpJIGd1ZXNzIHlvdSByZWFsbHkgd2FudCB0cnlfbW9kdWxlX2dldCgpIGFuZCBkZWFsIHdp
dGggaXQgcmV0dXJuaW5nCmZhbHNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
