Return-Path: <SRS0=/JXh=YD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0121EC10F14
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 14:43:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5DBD208C3
	for <xen-devel@archiver.kernel.org>; Thu, 10 Oct 2019 14:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5DBD208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIZey-0002vS-SB; Thu, 10 Oct 2019 14:43:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=njQE=YD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIZex-0002vN-Nq
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 14:43:19 +0000
X-Inumbo-ID: 4c7f475e-eb6c-11e9-beca-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4c7f475e-eb6c-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 14:43:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A830337;
 Thu, 10 Oct 2019 07:43:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88B463F6C4;
 Thu, 10 Oct 2019 07:43:17 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190815172944.14163-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <062d7e11-1933-37ab-5f04-555c9c36d04f@arm.com>
Date: Thu, 10 Oct 2019 15:43:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190815172944.14163-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: domain_build: Print the correct
 domain in dtb_load()
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpIbW0sIGl0IGxvb2tzIGxpa2UgSSBmb3Jnb3QgdGhpcyBwYXRjaCBiZWZvcmUgdGhlIGZy
ZWV6ZS4gSnVlcmdlbiwgYXJlIHlvdSBoYXBweSAKd2l0aCB0aGlzIHRvIGdvIGluIFhlbiA0LjEz
PwoKQ2hlZXJzLAoKT24gMTUvMDgvMjAxOSAxODoyOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGR0
Yl9sb2FkKCkgY2FuIGJlIGNhbGxlZCBieSBvdGhlciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9p
ZCBjb25mdXNpb24KPiBpbiB0aGUgbG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCj4gCj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiAt
LS0KPiAgICAgIENoYW5nZXMgaW4gdjI6Cj4gICAgICAgICAgLSBGaXggdGhlIHNlY29uZCBwcmlu
dCBpbiB0aGUgZnVuY3Rpb24gYXMgd2VsbC4KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9kb21haW5f
YnVpbGQuYyB8IDggKysrKystLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IDRlNTFlMjI5MjcuLjEy
NjM3NGY2MDMgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTE3ODcsMTUgKzE3ODcsMTcgQEAg
c3RhdGljIHZvaWQgX19pbml0IGR0Yl9sb2FkKHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8pCj4g
ICB7Cj4gICAgICAgdW5zaWduZWQgbG9uZyBsZWZ0Owo+ICAgCj4gLSAgICBwcmludGsoIkxvYWRp
bmcgZG9tMCBEVEIgdG8gMHglIlBSSXBhZGRyIi0weCUiUFJJcGFkZHIiXG4iLAo+IC0gICAgICAg
ICAgIGtpbmZvLT5kdGJfcGFkZHIsIGtpbmZvLT5kdGJfcGFkZHIgKyBmZHRfdG90YWxzaXplKGtp
bmZvLT5mZHQpKTsKPiArICAgIHByaW50aygiTG9hZGluZyAlcGQgRFRCIHRvIDB4JSJQUklwYWRk
ciItMHglIlBSSXBhZGRyIlxuIiwKPiArICAgICAgICAgICBraW5mby0+ZCwga2luZm8tPmR0Yl9w
YWRkciwKPiArICAgICAgICAgICBraW5mby0+ZHRiX3BhZGRyICsgZmR0X3RvdGFsc2l6ZShraW5m
by0+ZmR0KSk7Cj4gICAKPiAgICAgICBsZWZ0ID0gY29weV90b19ndWVzdF9waHlzX2ZsdXNoX2Rj
YWNoZShraW5mby0+ZCwga2luZm8tPmR0Yl9wYWRkciwKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBraW5mby0+ZmR0LAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZkdF90b3RhbHNpemUoa2luZm8tPmZkdCkpOwo+ICAg
Cj4gICAgICAgaWYgKCBsZWZ0ICE9IDAgKQo+IC0gICAgICAgIHBhbmljKCJVbmFibGUgdG8gY29w
eSB0aGUgRFRCIHRvIGRvbTAgbWVtb3J5IChsZWZ0ID0gJWx1IGJ5dGVzKVxuIiwgbGVmdCk7Cj4g
KyAgICAgICAgcGFuaWMoIlVuYWJsZSB0byBjb3B5IHRoZSBEVEIgdG8gJXBkIG1lbW9yeSAobGVm
dCA9ICVsdSBieXRlcylcbiIsCj4gKyAgICAgICAgICAgICAga2luZm8tPmQsIGxlZnQpOwo+ICAg
ICAgIHhmcmVlKGtpbmZvLT5mZHQpOwo+ICAgfQo+ICAgCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
