Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8222AC10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 14:51:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A0DE206B6
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 14:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A0DE206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH8N6-0001TI-Bn; Thu, 18 Apr 2019 14:50:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GVgS=SU=citrix.com=prvs=00483abf8=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hH8N4-0001TD-Vz
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 14:50:39 +0000
X-Inumbo-ID: 5329f218-61e9-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5329f218-61e9-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 14:50:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83900958"
Date: Thu, 18 Apr 2019 15:50:03 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20190418145003.GE1354@perard.uk.xensource.com>
References: <20190418112618.16706-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190418112618.16706-1-ian.jackson@eu.citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [OSSTEST PATCH] cr-daily-branch: ovmf: "usually"
 use xen-tested-master
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418145003.97ZRdspZVMjklo_zItFGeK_kGKleaOD5Y59QC1ROWao@z>

T24gVGh1LCBBcHIgMTgsIDIwMTkgYXQgMTI6MjY6MThQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBicmFuY2ggaXMgc3VwcG9zZWQgdG8gYmUgc3VpdGFibGUgZm9yIGFsbCB2ZXJz
aW9ucyBvZiBYZW4uCj4gQ29udmVyc2VseSwgb2xkZXIgdmVyc2lvbnMgb2YgT1ZNRiBkbyBub3Qg
YnVpbGQgb24gbmV3ZXIgY29tcGlsZXJzIChhcwo+IHByb3ZpZGVkLCBlZywgaW4gc3RyZXRjaCku
Cj4gCj4gU28sIGZvciAiYnJhbmNoZXMiIG90aGVyIHRoYW4geGVuLXVuc3RhYmxlIGFuZCB4ZW4t
dW5zdGFibGUtc21va2UsIHVzZQo+IHRoZSB1c3VhbCAiZGV0ZXJtaW5lX3ZlcnNpb24iIG1hY2hp
bmVyeSwgd2hpY2ggd2lsbCBzZWxlY3QKPiB4ZW4tdGVzdGVkLW1hc3RlciBmb3IgYnJhbmNoZXMg
b3RoZXIgdGhhbiB0aGUgb3ZtZiBicmFuY2ggaXRzZWxmLgo+IAo+IE5vIGNoYW5nZSBmb3IgdGhl
IG92bWYgImJyYW5jaCIsIG5vciBmb3IgeGVuLXVuc3RhYmxlKi4gIFRoZSBlZmZlY3QgaXMKPiB0
byBzd2l0Y2ggeGVuLSotdGVzdGluZywgcWVtdS0qLCBsaW51eC0qLCBldGMuLCB0byBhbGwgdXNl
IG92bWYKPiB4ZW4tdGVzdGVkLW1hc3Rlci4KPiAKPiBWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUt
Z2VuZXJhdGUtZHVtcC1mbGlnaHQtcnVudmFycy4gIEluIGRldGFpbDoKPiBJbiB0aGVzZSBmbGln
aHRzOgo+ICAgIGV4YW1pbmUgZnJlZWJzZC1tYXN0ZXIgbGlidmlydCBsaW51eC0qCj4gICAgb3Nz
dGVzdCBxZW11LSogc2VhYmlvcyB4ZW4tNC4qIHh0Zgo+IGluIHRoZXNlIGpvYnMKPiAgICBidWls
ZC1hbWQ2NAo+ICAgIGJ1aWxkLWFybTY0Cj4gICAgYnVpbGQtYXJtaGYKPiAgICBidWlsZC1pMzg2
Cj4gY2hhbmdlCj4gICAgcmV2aXNpb25fb3ZtZiAgdG8gICB0aGUgb3V0cHV0IG9mICAgLi9hcC1m
ZXRjaC12ZXJzaW9uLWJhc2VsaW5lIG92bWYKPiAgICB0cmVlX292bWYgICAgICB0byAgIGdpdDov
L3hlbmJpdHMueGVuLm9yZy9vc3N0ZXN0L292bWYuZ2l0Cj4gKGVhY2ggYmVpbmcgcHJldmlvdXNs
eSBzZXQgdG8gdGhlIGVtcHR5IHN0cmluZykuCj4gCj4gQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRo
b255LnBlcmFyZEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBldS5jaXRyaXguY29tPgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255
LnBlcmFyZEBjaXRyaXguY29tPgoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
