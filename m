Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D858AC3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 12:40:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC82A20828
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 12:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC82A20828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2alk-0000BI-K0; Tue, 27 Aug 2019 12:40:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7YVi=WX=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i2ali-0000BC-U6
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 12:40:14 +0000
X-Inumbo-ID: d008056b-c8c7-11e9-ae34-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d008056b-c8c7-11e9-ae34-12813bfff9fa;
 Tue, 27 Aug 2019 12:40:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DEE4DAF23;
 Tue, 27 Aug 2019 12:40:10 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190827105928.1769-1-jgross@suse.com>
 <20190827105928.1769-4-jgross@suse.com>
 <7a4fd708-b109-59b8-1633-2f80ef523dcb@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6a9bfc0d-ce17-e074-1c2d-98c36858f801@suse.com>
Date: Tue, 27 Aug 2019 14:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a4fd708-b109-59b8-1633-2f80ef523dcb@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/sched: add minimalistic idle
 scheduler for free cpus
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMDguMTkgMTQ6MzcsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjcvMDgvMjAxOSAx
MTo1OSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gK3N0YXRpYyB2b2lkICoKPj4gK3NjaGVkX2lk
bGVfYWxsb2NfdmRhdGEoY29uc3Qgc3RydWN0IHNjaGVkdWxlciAqb3BzLCBzdHJ1Y3QgdmNwdSAq
diwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGQpCj4+ICt7Cj4+ICsgICAgLyog
QW55IG5vbi1OVUxMIHBvaW50ZXIgaXMgZmluZSBoZXJlLiAqLwo+PiArICAgIHJldHVybiAodm9p
ZCAqKTFVTDsKPiAKPiBBcyBhbiBvYnNlcnZhdGlvbiwgdGhlIHZkYXRhIGludGVyZmFjZSAoYW5k
IG90aGVycywgaWYgYXBwbGljYWJsZSkgY291bGQKPiBkbyB3aXRoIGJlaW5nIHVwZGF0ZWQgdG8g
dXNlIEVSUl9QVFIoKSwganVzdCBhcyBkb25lIGluIGMvcyAzNDBlZGMzOTAKCk9uZSBvZiB0aGUg
aXRlbXMgZm9yIG15IHNjaGVkdWxlciBjbGVhbnVwIHBhdGNoZXMuCgo+IFBhc3NpbmcgMSBiYWNr
IGhlcmUgaXMgcmF0aGVyIGRhbmdlcm91cy4KCk5vdCByZWFsbHkuIHZkYXRhIGlzIHNjaGVkdWxl
ciBzcGVjaWZpYywgYW5kIHRoZSBpZGxlLXNjaGVkdWxlciBkb2Vzbid0CnVzZSBpdC4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
