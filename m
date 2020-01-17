Return-Path: <SRS0=Kj7J=3G=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C0D2C33CB1
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jan 2020 15:25:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 422942073A
	for <xen-devel@archiver.kernel.org>; Fri, 17 Jan 2020 15:25:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 422942073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isTUU-000812-5j; Fri, 17 Jan 2020 15:24:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1isTUT-00080x-54
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 15:24:53 +0000
X-Inumbo-ID: 8036a173-393d-11ea-b566-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8036a173-393d-11ea-b566-12813bfff9fa;
 Fri, 17 Jan 2020 15:24:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83D09AD93;
 Fri, 17 Jan 2020 15:24:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <8b795995-4f61-af08-2ead-5a841cb709f0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbb490ba-c0fe-e522-f6e1-dc441942cb79@suse.com>
Date: Fri, 17 Jan 2020 16:24:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <8b795995-4f61-af08-2ead-5a841cb709f0@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] EFI development issues
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxNzowMiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBGaXJzdCwgdGhlcmUg
aXMgYSBkZXBlbmRlbmN5IHRyYWNraW5nIGJ1ZyBpbiB0aGUgYnVpbGQgc3lzdGVtLsKgIEVkaXRz
IHRvCj4geGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oIGRvbid0IGNhdXNlIHhlbi5lZmkgdG8g
YmUgcmVnZW5lcmF0ZWQuwqAgRnJvbQo+IHdoYXQgSSBjYW4gdGVsbCwgdGhlIGZpbGUgZG9lc24n
dCBldmVuIGdldCByZWNvbXBpbGVkLCBiZWNhdXNlIHN5bnRheAo+IGVycm9ycyBldmVuIGdvIHVu
bm90aWNlZC4KCkkndmUganVzdCBub3cgc2VlbiB0aGlzIHRvbywgYW5kIGFsc28gc2VlIHdoeSBp
dCBpczogTXkgZW5mb3JjZS11bmlxdWUtCnN5bWJvbHMgY2hhbmdlIGNhdXNlcyAuKi5vLmQgZmls
ZXMgdG8gc3RhcnQgbGlrZSB0aGlzCgouYXBpYy5vLnRtcDogYXBpYy5jIFwKIC9idWlsZC94ZW4v
dW5zdGFibGUtZ2l0LzIwMTktMTItMjAtbGl2ZXBhdGNoL3hlbi9pbmNsdWRlL2dlbmVyYXRlZC9j
b25maWcuaCBcCiAuLi4KCndoZW4gdGhlIG9wdGlvbiBpcyBlbmFibGVkLiBJJ2xsIG5lZWQgdG8g
ZmlndXJlIGhvdyB0byB0ZWxsIHRoZSBjb21waWxlcgp0byBlbWl0IHRoZSBwcm9wZXIgYXBpYy5v
IGluc3RlYWQgb2YgdGhlIGludGVybWVkaWF0ZSBmaWxlLiBJaXJjIHRoZXJlJ3MKYSBjb21tYW5k
IGxpbmUgb3B0aW9uIC4uLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
