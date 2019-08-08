Return-Path: <SRS0=JtEA=WE=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A61CC0650F
	for <xen-devel@archiver.kernel.org>; Thu,  8 Aug 2019 15:26:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7BF62075B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Aug 2019 15:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7BF62075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvkIx-0002k4-Pa; Thu, 08 Aug 2019 15:26:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvkIw-0002js-Bs
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:26:14 +0000
X-Inumbo-ID: da82d418-b9f0-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da82d418-b9f0-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 15:26:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70C33ACC4;
 Thu,  8 Aug 2019 15:26:11 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190807143119.8360-1-jgross@suse.com>
 <bc9954e7-ef0a-aeaf-668b-eedcc78645d4@citrix.com>
 <3a8e76fd-ec10-9020-7f34-40c62dab0e6c@suse.com>
 <c1d979d8-eece-0065-c4a1-5f3d47a217ea@citrix.com>
 <f600730d-744d-bbd4-57c2-801d6b9eb380@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c7d46adf-d622-1fff-ef07-66921bff57b1@suse.com>
Date: Thu, 8 Aug 2019 17:26:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f600730d-744d-bbd4-57c2-801d6b9eb380@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 0/4] enhance lock debugging
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMTE6MzYsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDguMDguMTkgMTA6
MzMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IE9uIDA4LzA4LzIwMTkgMDU6NTAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAwNy4wOC4xOSAyMDoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToK
Pj4+PiBGb3Igc2FuaXR5IHNha2UsIHdlIHNob3VsZCBlbmZvcmNlIHVuaXF1ZSBuYW1pbmcgb2Yg
YW55IGxvY2sKPj4+PiByZWdpc3RlcmVkIGZvcgo+Pj4+IHByb2ZpbGluZy4KPj4+Cj4+PiBUaGlz
IHdvdWxkIGJlIGV2ZXJ5IGxvY2sgaW5pdGVkIHZpYSBERUZJTkVfU1BJTkxPQ0soKS4gSSBjYW4g
ZG8gYQo+Pj4gZm9sbG93dXAgcGF0Y2ggZm9yIHRoYXQgcHVycG9zZS4KPj4KPj4gSSB3YXMgd29u
ZGVyaW5nIGhvdyB0byBkbyB0aGlzLsKgIE9uZSBvcHRpb24gd2hpY2ggY29tZXMgdG8gbWluZCBp
cyB0bwo+PiBwdXQgYW4gbm9uLXN0YXRpYyBvYmplY3QgaW50byAuZGlzY2FyZC5sb2NrX3Byb2Zp
bGUgb3Igc29tZXRoaW5nLCBzbyB0aGUKPj4gbGlua2VyIHdpbGwgb2JqZWN0IHRvIHJlcGVhdGVk
IHN5bWJvbCBuYW1lcyBhbmQgdGhlbiB0aHJvdyBhbGwgb2YgdGhlbSAKPj4gYXdheS4KPiAKPiBJ
IGNvdWxkIGp1c3QgZHJvcCB0aGUgInN0YXRpYyIgaW4gdGhlIF9MT0NLX1BST0ZJTEVfUFRSKCkg
bWFjcm8uCgpVbmZvcnR1bmF0ZWx5IHRoaXMgZG9lc24ndCB3b3JrIGZvciBsb2NrcyBkZWZpbmVk
IGluIGEgZnVuY3Rpb24gYm9keS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
