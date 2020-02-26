Return-Path: <SRS0=wQWC=4O=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BF2C4BA13
	for <xen-devel@archiver.kernel.org>; Wed, 26 Feb 2020 14:45:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE6921D7E
	for <xen-devel@archiver.kernel.org>; Wed, 26 Feb 2020 14:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE6921D7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6xvJ-0006EO-E7; Wed, 26 Feb 2020 14:44:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6xvI-0006EJ-EU
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 14:44:28 +0000
X-Inumbo-ID: 7c85ef79-58a6-11ea-9447-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c85ef79-58a6-11ea-9447-12813bfff9fa;
 Wed, 26 Feb 2020 14:44:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7948BAC52;
 Wed, 26 Feb 2020 14:44:26 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <9a5742f9-7533-d9b1-b93d-a3a85e5d8c9f@xen.org>
 <bf009f0779ef4100837bce90f6cfccac@EX13D32EUC003.ant.amazon.com>
 <24715830-df00-963e-3726-e5b1b691a2b6@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e9f5020-e7ec-a83b-f9cd-8386bab15fe9@suse.com>
Date: Wed, 26 Feb 2020 15:44:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <24715830-df00-963e-3726-e5b1b691a2b6@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxNToyMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI2LzAyLzIwMjAg
MTI6MDMsIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGll
bkB4ZW4ub3JnPgo+Pj4gU2VudDogMjYgRmVicnVhcnkgMjAyMCAxMTozMwo+Pj4KPj4+IE9uIDI1
LzAyLzIwMjAgMDk6NTMsIFBhdWwgRHVycmFudCB3cm90ZToKPj4+PiBGb3IgQXJtLCB0aGUgY2Fs
bCB0byBmcmVlX3NoYXJlZF9pbmZvKCkgaW4gYXJjaF9kb21haW5fZGVzdHJveSgpIGlzIGxlZnQK
Pj4+PiBpbiBwbGFjZSBzaW5jZSBpdCBjYWxsZWQgaW4gdGhlIGVycm9yIHBhdGggZm9yIGFyY2hf
ZG9tYWluX2NyZWF0ZSgpLgo+Pj4+Cj4+Pj4gTk9URTogQSBtb2RpZmljYXRpb24gaW4gcDJtX2Fs
bG9jX3RhYmxlKCkgaXMgcmVxdWlyZWQgdG8gYXZvaWQgYSBmYWxzZQo+Pj4+ICAgICAgICAgcG9z
aXRpdmUgd2hlbiBjaGVja2luZyBmb3IgZG9tYWluIG1lbW9yeS4KPj4+PiAgICAgICAgIEEgZml4
IGlzIGFsc28gbmVlZGVkIGluIGRvbTBfY29uc3RydWN0X3B2KCkgdG8gYXZvaWQKPj4+IGF1dG9t
YXRpY2FsbHkKPj4+PiAgICAgICAgIGFkZGluZyBQR0NfZXh0cmEgcGFnZXMgdG8gdGhlIHBoeXNt
YXAuCj4+Pgo+Pj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSBob3cgdGhpcyBpcyByZWxhdGVkIHRv
IHRoaXMgcGF0Y2guIFdhcyBpdCBhCj4+PiBsYXRlbnQgYnVnPyBJZiBzbywgSSB0aGluayBpdCB3
b3VsZCBtYWtlIHNlbnNlIHRvIHNwbGl0IGl0IGZyb20gdGhpcwo+Pj4gcGF0Y2guCj4+Pgo+Pgo+
PiBJdCdzIHJlbGF0ZWQgYmVjYXVzZSB0aGUgY2hlY2sgcmVsaWVzIG9uIHRoZSBmYWN0IHRoYXQg
bm8gUEdDX2V4dHJhIHBhZ2VzIGFyZSBjcmVhdGVkIGJlZm9yZSBpdCBpcyBjYWxsZWQuIFRoaXMg
aXMgaW5kZWVkIHRydWUgdW50aWwgdGhpcyBwYXRjaCBpcyBhcHBsaWVkLgo+IAo+IEkgd291bGQg
cHJlZmVyIGlmIHRoZXkgYXJlIGZpeGVkIGluIHNlcGFyYXRlIHBhdGNoZXMgYXMgdGhpcyBwYWNo
IAo+IGFscmVhZHkgcXVpdGUgYSBsb3QuIEJ1dCBJIHdpbGwgbGVhdmUgdGhhdCB1cCB0byBBbmRy
ZXcgYW5kIEphbi4KCkkgYWdyZWUgd2l0aCBKdWxpZW4gKGlmIHNwbGl0dGluZyBpcyBzZW5zaWJs
eSBwb3NzaWJsZSksIGZ3aXcuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
