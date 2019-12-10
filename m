Return-Path: <SRS0=O6u+=2A=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34DCEC43603
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 14:04:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B05020652
	for <xen-devel@archiver.kernel.org>; Tue, 10 Dec 2019 14:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B05020652
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieg7I-0002Bu-4N; Tue, 10 Dec 2019 14:03:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieg7G-0002Bp-Dj
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 14:03:54 +0000
X-Inumbo-ID: e545e8e4-1b55-11ea-8958-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e545e8e4-1b55-11ea-8958-12813bfff9fa;
 Tue, 10 Dec 2019 14:03:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6FD55AC9F;
 Tue, 10 Dec 2019 14:03:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191207211634.9958-2-andrew.cooper3@citrix.com>
 <20191210121701.8196-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea76590d-3dc9-b513-51ca-660b60eb134a@suse.com>
Date: Tue, 10 Dec 2019 15:04:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191210121701.8196-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v4 1/3] xen/flask: Drop the
 gen-policy.py script
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
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMjAxOSAxMzoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgc2NyaXB0IGlz
IFB5dGhvbiAyIHNwZWNpZmljLCBhbmQgZmFpbHMgd2l0aCBzdHJpbmcvYmluYXJ5IGlzc3VlcyB3
aXRoCj4gUHl0aG9uIDM6Cj4gCj4gICBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6
Cj4gICAgIEZpbGUgImdlbi1wb2xpY3kucHkiLCBsaW5lIDE0LCBpbiA8bW9kdWxlPgo+ICAgICAg
IGZvciBjaGFyIGluIHN5cy5zdGRpbi5yZWFkKCk6Cj4gICAgIEZpbGUgIi91c3IvbGliL3B5dGhv
bjMuNS9jb2RlY3MucHkiLCBsaW5lIDMyMSwgaW4gZGVjb2RlCj4gICAgICAgKHJlc3VsdCwgY29u
c3VtZWQpID0gc2VsZi5fYnVmZmVyX2RlY29kZShkYXRhLCBzZWxmLmVycm9ycywgZmluYWwpCj4g
ICBVbmljb2RlRGVjb2RlRXJyb3I6ICd1dGYtOCcgY29kZWMgY2FuJ3QgZGVjb2RlIGJ5dGUgMHg4
YyBpbiBwb3NpdGlvbiAwOiBpbnZhbGlkIHN0YXJ0IGJ5dGUKPiAKPiBGaXhpbmcgdGhlIHNjcmlw
dCB0byBiZSBjb21wYXRpYmxlIGlzbid0IGhhcmQsIGJ1dCB1c2luZyBweXRob24gaGVyZSBpcwo+
IHdhc3RlZnVsLiAgRHJvcCB0aGUgc2NyaXB0IGVudGlyZWx5LCBhbmQgd3JpdGUgYW4gZXF1aXZl
bGVudCBmbGFzay1wb2xpY3kuUwo+IGluc3RlYWQuICBUaGlzIHJlbW92ZXMgdGhlIG5lZWQgZm9y
IGEgJChQWVRIT04pIGFuZCAkKENDKSBwYXNzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IERhbmllbCBEZSBH
cmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
