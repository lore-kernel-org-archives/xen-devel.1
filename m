Return-Path: <SRS0=9cJ5=WZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BD9C3A59F
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 12:02:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57AD7215EA
	for <xen-devel@archiver.kernel.org>; Thu, 29 Aug 2019 12:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57AD7215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3J7m-0005VU-Ez; Thu, 29 Aug 2019 12:01:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8TN=WZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i3J7l-0005VN-F2
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 12:01:57 +0000
X-Inumbo-ID: cbc36588-ca54-11e9-ae65-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbc36588-ca54-11e9-ae65-12813bfff9fa;
 Thu, 29 Aug 2019 12:01:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 038D1B676;
 Thu, 29 Aug 2019 12:01:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f2e373ae-a327-bcdc-1c5c-b3351ae1ff4f@suse.com>
 <e163fa38-6a06-c422-4c23-7d5385590025@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8191ed37-760d-748a-c7c7-762dd331fa7c@suse.com>
Date: Thu, 29 Aug 2019 14:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e163fa38-6a06-c422-4c23-7d5385590025@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] x86: clear RDRAND CPUID bit on AMD family
 15h/16h
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
Cc: Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMTkgMTM6NDIsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjkvMDgvMjAxOSAx
MDoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEluc3BpcmVkIGJ5IExpbnV4IGNvbW1pdCBjNDlh
MGE4MDEzN2M3Y2E3ZDZjZWQ0YzgxMmM5ZTA3YTk0OWY2ZjI0Ogo+Pgo+PiAgICAgIFRoZXJlIGhh
dmUgYmVlbiByZXBvcnRzIG9mIFJEUkFORCBpc3N1ZXMgYWZ0ZXIgcmVzdW1pbmcgZnJvbSBzdXNw
ZW5kIG9uCj4+ICAgICAgc29tZSBBTUQgZmFtaWx5IDE1aCBhbmQgZmFtaWx5IDE2aCBzeXN0ZW1z
LiBUaGlzIGlzc3VlIHN0ZW1zIGZyb20gYSBCSU9TCj4+ICAgICAgbm90IHBlcmZvcm1pbmcgdGhl
IHByb3BlciBzdGVwcyBkdXJpbmcgcmVzdW1lIHRvIGVuc3VyZSBSRFJBTkQgY29udGludWVzCj4+
ICAgICAgdG8gZnVuY3Rpb24gcHJvcGVybHkuCj4+Cj4+ICAgICAgVXBkYXRlIHRoZSBDUFUgaW5p
dGlhbGl6YXRpb24gdG8gY2xlYXIgdGhlIFJEUkFORCBDUFVJRCBiaXQgZm9yIGFueSBmYW1pbHkK
Pj4gICAgICAxNWggYW5kIDE2aCBwcm9jZXNzb3IgdGhhdCBzdXBwb3J0cyBSRFJBTkQuIElmIGl0
IGlzIGtub3duIHRoYXQgdGhlIGZhbWlseQo+PiAgICAgIDE1aCBvciBmYW1pbHkgMTZoIHN5c3Rl
bSBkb2VzIG5vdCBoYXZlIGFuIFJEUkFORCByZXN1bWUgaXNzdWUgb3IgdGhhdCB0aGUKPj4gICAg
ICBzeXN0ZW0gd2lsbCBub3QgYmUgcGxhY2VkIGluIHN1c3BlbmQsIHRoZSAiY3B1aWQ9cmRyYW5k
IiBrZXJuZWwgcGFyYW1ldGVyCj4+ICAgICAgY2FuIGJlIHVzZWQgdG8gc3RvcCB0aGUgY2xlYXJp
bmcgb2YgdGhlIFJEUkFORCBDUFVJRCBiaXQuCj4+Cj4+ICAgICAgTm90ZSwgdGhhdCBjbGVhcmlu
ZyB0aGUgUkRSQU5EIENQVUlEIGJpdCBkb2VzIG5vdCBwcmV2ZW50IGEgcHJvY2Vzc29yCj4+ICAg
ICAgdGhhdCBub3JtYWxseSBzdXBwb3J0cyB0aGUgUkRSQU5EIGluc3RydWN0aW9uIGZyb20gZXhl
Y3V0aW5nIGl0LiBTbyBhbnkKPj4gICAgICBjb2RlIHRoYXQgZGV0ZXJtaW5lZCB0aGUgc3VwcG9y
dCBiYXNlZCBvbiBmYW1pbHkgYW5kIG1vZGVsIHdvbid0ICNVRC4KClllYWgsIGJ1dCBpdCB3aWxs
IG5vIGxvbmdlciBzZWUgcmFuZG9tIG51bWJlcnMgYWZ0ZXIgcmVzdW1lLgoKPj4KPj4gU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gU2xpZ2h0
bHkgUkZDLCBpbiBwYXJ0aWN1bGFyIGJlY2F1c2Ugb2YgdGhlIGNoYW5nZSB0byBwYXJzZV94ZW5f
Y3B1aWQoKToKPj4gQWx0ZXJuYXRpdmUgYXBwcm9hY2ggc3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUu
Cj4gCj4gVGhpcyBpc3N1ZSB3YXMgb24gbXkgcmFkYXIsIGJ1dCBJIGhhZG4ndCBnb3QgYXJvdW5k
IHRvIHN0YXJ0aW5nIGEgcGF0Y2ggeWV0Lgo+IAo+IEkgd2FzIHdvbmRlcmluZyBpZiB3ZSBjb3Vs
ZCBwZXJoYXBzIGRlZmF1bHQgaXQgdG8gd2hldGhlciBTMyB3YXMKPiBhdmFpbGFibGUsIGJ1dCBs
b29raW5nIGF0IHRoZSBjb2RlIHdoaWNoIHByaW50cyAiQUNQSSBzbGVlcCBtb2RlczogUzMiLAo+
IGl0IGRvZXNuJ3QgYXBwZWFyIHRvIGJlIHJlbGF0ZWQgdG8gYW55IHJlYWwgQUNQSSBpbmZvcm1h
dGlvbi4KCldvdWxkbid0IGl0IG1ha2UgbW9yZSBzZW5zZSB0byBpbmhpYml0IHN1c3BlbmQvcmVz
dW1lIGluc3RlYWQ/CgpJJ20gcXVpdGUgc3VyZSBhIG1hY2hpbmUgcnVubmluZyBYZW4gaXMgdmVy
eSByYXJlbHkgcHV0IHRvIFMzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
