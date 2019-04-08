Return-Path: <SRS0=fn8+=SK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9FDC10F13
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:53:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18AC120855
	for <xen-devel@archiver.kernel.org>; Mon,  8 Apr 2019 11:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18AC120855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDSpe-0005KE-Pp; Mon, 08 Apr 2019 11:52:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CdzU=SK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hDSpd-0005K6-CT
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2019 11:52:57 +0000
X-Inumbo-ID: d7dc9f5e-59f4-11e9-832e-bf35dd482032
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7dc9f5e-59f4-11e9-832e-bf35dd482032;
 Mon, 08 Apr 2019 11:52:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 63AADAECD;
 Mon,  8 Apr 2019 11:52:53 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20190408110943.8987-1-george.dunlap@citrix.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b0f91c53-a024-8eea-aba0-cb177769acfe@suse.com>
Date: Mon, 8 Apr 2019 13:52:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190408110943.8987-1-george.dunlap@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2] docs/xl: Clarify documentation for
 mem-max and mem-set
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190408115249.4LsSbc49lk4P_lJXPJered96mu0ffhuXzIH98z9_kDg@z>

T24gMDgvMDQvMjAxOSAxMzowOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBtZW0tc2V0IGlzIHRo
ZSBwcmltYXJ5IGNvbW1hbmQgdGhhdCB1c2VycyB3aWxsIG5lZWQgdG8gdXNlIGFuZAo+IHVuZGVy
c3RhbmQuICBNb3ZlIGl0IGZpcnN0LCBhbmQgY2xhcmlmeSB0aGUgd29yZGluZzsgYWxzbyBzcGVj
aWZ5IHRoYXQKPiB5b3UgY2FuJ3Qgc2V0IHRoZSB0YXJnZXQgaGlnaGVyIHRoYW4gbWF4bWVtIGZy
b20gdGhlIGRvbWFpbiBjb25maWcuCj4gCj4gbWVtLW1heCBpcyBhY3R1YWxseSBhIHByZXR0eSB1
c2VsZXNzIGNvbW1hbmQgYXQgdGhlIG1vbWVudC4gIENsYXJpZnkKPiB0aGF0IHVzZXJzIGFyZSBu
b3QgZXhwZWN0ZWQgdG8gdXNlIGl0OyBhbmQgZG9jdW1lbnQgYWxsIG9mIGl0cyBxdWlya3kKPiBi
ZWhhdmlvci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBSZXdvcmQgbWVtb3J5IHVuaXQgc2VjdGlvbiBi
YXNlZCBvbiByZXZpZXcgZmVlZGJhY2sKPiAKPiBJJ20gYWN0dWxseSBzb21ld2hhdCB0ZW1wdGVk
IHRvIHRha2Ugb3V0IHRoZSBlbnRyeSBmb3IgbWVtLW1heAo+IGVudGlyZWx5IC0tIGl0J3Mgbm90
IGF0IGFsbCBjbGVhciB0byBtZSB3aGF0IGFueW9uZSB3b3VsZCB1c2UgaXQgZm9yLAo+IGFuZCBp
dCdzIG9ubHkgbGlrZWx5IHRvIGNvbmZ1c2UgcGVvcGxlLgoKSXQgaXMgbmVlZGVkIGZvciBiZWlu
ZyBhYmxlIHRvIGhvdHBsdWcgbWVtb3J5IHRvIGEgZG9tYWluLgoKWW91J2xsIG5lZWQgdG86Cgot
IHJhaXNlIHRoZSBsaW1pdCBvZiB0aGUgZG9tYWluIHZpYSB4bCBtZW0tbWF4Ci0gbW9kaWZ5IHRo
ZSBzdGF0aWMtbWF4IHhlbnN0b3JlIGVudHJ5Ci0gdHJpZ2dlciBob3RwbHVnIGluIHRoZSBkb21h
aW4gKGUuZy4gdmlhIEFDUEkgaW4gSFZNKQoKTWFraW5nIHRoZSBpbnRlcmZhY2UgbW9yZSB1c2Fi
bGUgaXMgb24gbXkgYWdlbmRhIGZvciBxdWl0ZSBhIHdoaWxlIG5vdywKYnV0IEkgaGF2ZSBiZWVu
IHRvbyBidXN5IHdpdGggb3RoZXIgc3R1ZmYgbGF0ZWx5LgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
