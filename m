Return-Path: <SRS0=EnAC=V5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB9D7C433FF
	for <xen-devel@archiver.kernel.org>; Thu,  1 Aug 2019 10:07:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88C40216C8
	for <xen-devel@archiver.kernel.org>; Thu,  1 Aug 2019 10:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88C40216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ht7zs-0000Ew-Bm; Thu, 01 Aug 2019 10:07:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6jP+=V5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ht7zq-0000EX-Qx
 for xen-devel@lists.xenproject.org; Thu, 01 Aug 2019 10:07:42 +0000
X-Inumbo-ID: 3235d2bd-b444-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3235d2bd-b444-11e9-8980-bc764e045a96;
 Thu, 01 Aug 2019 10:07:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CF1E4AEC7;
 Thu,  1 Aug 2019 10:07:39 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190731162434.12837-1-volodymyr_babchuk@epam.com>
 <bb494090-f6d4-8f19-5784-8f8b20cbafdd@citrix.com>
 <CAOcoXZY5Kwtuy9nLxaxw5FLd0jSmjuvZfNc3SYyuKVP7HtG2tg@mail.gmail.com>
 <FA7398EE-7206-40B7-9AAD-D0D6155C5DE4@gmail.com> <8736imhyt0.fsf@epam.com>
 <20190801095500.GB5791@perard.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1eaa4a9e-fe37-78d8-f4e6-170df0bb38cb@suse.com>
Date: Thu, 1 Aug 2019 12:07:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801095500.GB5791@perard.uk.xensource.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH] CODING_STYLE: clarify function argument
 indentation
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMTkgMTE6NTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+IE9uIFdlZCwgSnVsIDMx
LCAyMDE5IGF0IDA1OjU3OjMyUE0gKzAwMDAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOgo+PiBM
YXJzIEt1cnRoIHdyaXRlczoKPj4+IFVsdGltYXRlbHkgd2UgaGF2ZSB0byBtYWtlIHNvbWUgdHJh
ZGUtb2ZmcyBhcyB0byB3aGF0IGlzIG1vcmUgaW1wb3J0YW50Ogo+Pj4gYSkgYXV0b21hdGljIHN0
eWxlIGNoZWNraW5nIC0gd2hpY2ggbWVhbnMgImNvbW1vbiBzZW5zZSIgY2FuJ3QgYmUgZm9ybWFs
aXNlZCBhbmQgdGhlcmUgd2lsbCBiZSBib3VuZGFyeSBjYXNlcyBsaWtlIHRoZSBhYm92ZQo+Pj4g
YikgcmVjbGFpbWluZyBjb2RlIHJldmlldyBiYW5kd2lkdGggdGhyb3VnaCBhdXRvbWF0aW9uIG9y
IGdvaW5nIGZvciBhIGxhYm91ciBpbnRlbnNpdmUgbWFudWFsIGFwcHJvYWNoCj4+IEkgbGlrZSB0
aGUgbGludXgga2VybmVsIGFwcHJvYWNoLiAgY2hlY2twYXRjaC5wbCBwcm9kdWNlcyBlcnJvcnMs
IHdoaWNoIGFyZQo+PiAibm8gZ28iLCBidXQgaXQgYWxzbyBwcm9kdWNlcyB3YXJuaW5ncyBmb3Ig
c3VjaCBib3VuZGFyeSBjYXNlcywgZm9yCj4+IG1haW50YWluZXIvcmV2aWV3ZXIgdG8gZGVjaWRl
Lgo+IAo+IFllcyEgUUVNVSBhbHNvIHVzZXMgY2hlY2twYXRjaC5wbCBzY3JpcHQgYW5kIEkgZm91
bmQgdGhhdCB2ZXJ5IHVzZWZ1bAo+IChib3RoIGFzIHJldmlld2VyIGFuZCBhdXRob3Igb2YgYSBw
YXRjaCkuIEl0IHRlbGxzIHlvdSB3aGF0IGFyZSB0aGUKPiBjb2Rpbmcgc3R5bGUgdmlvbGF0aW9u
IGluIG5ld2x5IGFkZGVkIGNvZGUgYW5kIGRvZXNuJ3QgdHJ5IHRvIHJlZm9ybWF0Cj4gdGhlIHdo
b2xlIGZpbGUuCj4gCj4gQnV0IHRoYXQgc2NyaXB0IHdvdWxkIG5lZWRzIHF1aXRlIGEgbG90IG9m
IHJld3JpdGluZywgSSB0aGluaywgdG8gYmUKPiBhYmxlIHRvIGJlIHVzZWQgb24gdGhlIG11bHRp
cGxlIGNvZGluZyBzdHlsZSBvZiB4ZW4uZ2l0Lgo+IAoKV2UgY291bGQgc3RhcnQgd2l0aCBvbmx5
IGEgZmV3IHRlc3RzIGFuZCBlbmhhbmNlIGl0IGxhdGVyLgoKQSBnb29kIGFwcHJvYWNoIG1pZ2h0
IGJlOgoKMS4gdGVzdCBjb21taXQgbWVzc2FnZSAoZS5nLiBpcyAiU2lnbmVkLW9mZi1ieToiIGlu
Y2x1ZGVkLCBsaW5lCiAgICBsZW5ndGgsIC4uLikKCjIuIGFkZCBpbmZvcm1hdGlvbiB3aGljaCBm
aWxlIGlzIHVzaW5nIHdoaWNoIGNvZGluZyBzdHlsZSwgc3BsaXQKICAgIHBhdGNoZXMgdG8gc25p
cHBsZXRzIGZvciBlYWNoIHBhdGNoZWQgZmlsZSwgY2FsbCBzdHlsZSBzcGVjaWZpYwogICAgY2hl
Y2tlciBmb3IgZWFjaCBwYXRjaGVkIGZpbGUgKGVtcHR5IGF0IHRoZSBiZWdpbm5pbmcpCgozLiBy
ZS11c2UgTGludXgga2VybmVsIGNoZWNrcGF0Y2gucGwgZm9yIGNoZWNraW5nIGtlcm5lbCBzdHls
ZSBmaWxlcwoKNC4gaW50cm9kdWNlIGJhc2ljIGNoZWNrcyBmb3IgWGVuIHN0eWxlcyAoZS5nLiBp
bmRlbnRhdGlvbiB2aWEgc3BhY2VzLAogICAgbGluZSBsZW5ndGggY2hlY2tzLCAuLi4pCgo1LiBl
bmhhbmNlIFhlbiBjaGVja3Mgc3RlcCBieSBzdGVwCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
