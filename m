Return-Path: <SRS0=Lk9n=XE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92803C00307
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 05:45:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 641D72196E
	for <xen-devel@archiver.kernel.org>; Mon,  9 Sep 2019 05:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 641D72196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7CT7-0003oe-H0; Mon, 09 Sep 2019 05:44:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7CT6-0003oW-C6
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 05:44:04 +0000
X-Inumbo-ID: d3b11cd6-d2c4-11e9-ac08-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3b11cd6-d2c4-11e9-ac08-12813bfff9fa;
 Mon, 09 Sep 2019 05:44:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 51C21AF6B;
 Mon,  9 Sep 2019 05:44:01 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-6-jgross@suse.com>
 <7aeb4139-7157-f2d7-faa1-a7b870be9180@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0dee7fd0-8b1c-9720-9e1a-4656505c3720@suse.com>
Date: Mon, 9 Sep 2019 07:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7aeb4139-7157-f2d7-faa1-a7b870be9180@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 05/48] xen/sched: let pick_cpu return a
 scheduler resource
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

T24gMDQuMDkuMTkgMTU6MzQsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjA4LjIwMTkgMTY6
NTcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1p
Zi5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5oCj4+IEBAIC0xODksOCArMTg5
LDggQEAgc3RydWN0IHNjaGVkdWxlciB7Cj4+ICAgICAgIHN0cnVjdCB0YXNrX3NsaWNlICgqZG9f
c2NoZWR1bGUpIChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICosIHNfdGltZV90LAo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbF90IHRhc2tsZXRfd29ya19zY2hl
ZHVsZWQpOwo+PiAgIAo+PiAtICAgIGludCAgICAgICAgICAoKnBpY2tfY3B1KSAgICAgICAoY29u
c3Qgc3RydWN0IHNjaGVkdWxlciAqLAo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKik7Cj4+ICsgICAgc3RydWN0IHNjaGVkX3Jlc291cmNl
ICogKCpwaWNrX3Jlc291cmNlKSAoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqLAo+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzY2hlZF91bml0
ICopOwo+IAo+IE5pdDogVGhlcmUgYXJlIHR3byBibGFua3MgdG9vIG11Y2ggaGVyZSwgb25lIGVh
Y2ggYmVmb3JlIHRoZSBvcGVuaW5nCj4gcGFyZW50aGVzZXMuCgpUaGFua3MgZm9yIHBvaW50aWcg
aXQgb3V0LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
