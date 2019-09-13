Return-Path: <SRS0=m/e5=XI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1E6C49ED7
	for <xen-devel@archiver.kernel.org>; Fri, 13 Sep 2019 12:57:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4FFF206BB
	for <xen-devel@archiver.kernel.org>; Fri, 13 Sep 2019 12:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4FFF206BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8l87-0003ff-VN; Fri, 13 Sep 2019 12:56:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mE8E=XI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i8l86-0003fa-Kl
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 12:56:50 +0000
X-Inumbo-ID: f2f25326-d625-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2f25326-d625-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 12:56:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 643CBAEE1;
 Fri, 13 Sep 2019 12:56:48 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-29-jgross@suse.com>
 <d09034f5-d2f2-c42c-d3d8-d0a4d8380312@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f2e94666-a891-1965-2a8a-949abad2da01@suse.com>
Date: Fri, 13 Sep 2019 14:56:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d09034f5-d2f2-c42c-d3d8-d0a4d8380312@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 28/48] xen/sched: move struct task_slice
 into struct sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMTkgMTc6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEluIG9yZGVyIHRvIHByZXBhcmUgZm9yIG11bHRp
cGxlIHZjcHVzIHBlciBzY2hlZHVsZSB1bml0IG1vdmUgc3RydWN0Cj4+IHRhc2tfc2xpY2UgaW4g
c2NoZWR1bGUoKSBmcm9tIHRoZSBsb2NhbCBzdGFjayBpbnRvIHN0cnVjdCBzY2hlZF91bml0Cj4+
IG9mIHRoZSBjdXJyZW50bHkgcnVubmluZyB1bml0Lgo+IAo+IFRoZSBjaGFuZ2UgbG9va3MgbWVj
aGFuaWNhbCBlbm91Z2ggdG8gYmUgcHJvYmFibHkgZmluZSwgYnV0IHdoYXQncwo+IHRoZSBjb25u
ZWN0aW9uIGJldHdlZW4gdGhlIGl0ZW0gY3VycmVudGx5IGJlaW5nIG9uIHNjaGVkdWxlKCkncyBz
dGFjawo+IGFuZCB0aGVyZSBiZWluZyBtdWx0aXBsZSB2Q1BVLXM/IElzIHRoaXMgYmVjYXVzZSBp
dCdsbCBiZSBlc3RhYmxpc2hlZAo+IGp1c3Qgb25jZSwgYnV0IHVzZWQgbXVsdGlwbGUgdGltZXMg
KGJ5IGRpZmZlcmVudCBwYXJ0aWVzKT8gSW4gd2hpY2gKPiBjYXNlLCBzaW5jZSB0aGUgInNsYXZl
cyIgd2lsbCBoYXZlIHRvIHdhaXQgZm9yIHRoZSAibWFzdGVyIiB0byBtYWtlCj4gdGhlIHNjaGVk
dWxpbmcgZGVjaXNpb24sIHRoZXJlJ2xsIG5lZWQgdG8gYmUgY29tbXVuaWNhdGlvbiBhbnl3YXkK
PiBiZXR3ZWVuIGFsbCBpbnZvbHZlZCBwYXJ0aWVzLgoKU3luY2hyb25pemF0aW9uIGJldHdlZW4g
dGhlIGludm9sdmVkIHBhcnRpZXMgaXMgZG9uZSB2aWEgc3RydWN0CnNjaGVkX3VuaXQgKHNlZSBw
YXRjaCAyOSkuIFRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkIGFub3RoZXIgZGF0YQpzdHJ1Y3R1cmUg
Zm9yIGV4cGxpY2l0IGNvbW11bmljYXRpb24sIGFzIG9uIGFsbCBjcHVzIGludm9sdmVkIHRoZSBz
YW1lCnVuaXQgaXMgYWN0aXZlLCBzbyBpdHMgYWRkcmVzcyBpcyBhbHJlYWR5IGtub3duLgoKQW5k
IHRoaXMgaXMgbWFuZGF0b3J5LCBhcyBvbmx5IHdoZW4gYWxsIGNwdXMgaGF2ZSBqb2luZWQgdGhl
IGxhc3Qgb25lCndpbGwgZG8gdGhlIHNjaGVkdWxlKCkgY2FsbCBhbmQgdGhlbiByZWxlYXNlIHRo
ZSBvdGhlciBjcHVzIGZvciBkb2luZwp0aGUgY29udGV4dCBzd2l0Y2guIFByb3BhZ2F0aW5nIGFu
b3RoZXIgcG9pbnRlciBvbiB0aGUgbG9jYWwgc3RhY2sKd291bGQgYmUgaGFyZCBhcyBzcGxpdHRp
bmcgdXAgc2NoZWR1bGUoKSBhcyBkb25lIGluIHBhdGNoIDI5IHdvdWxkIG5vCmxvbmdlciBiZSBw
b3NzaWJsZSByZXN1bHRpbmcgaW4gYSByYXRoZXIgaGFyZCB0byB1bmRlcnN0YW5kIGdpZ2FudGlj
CmZ1bmN0aW9uLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
