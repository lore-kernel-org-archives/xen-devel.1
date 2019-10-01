Return-Path: <SRS0=k/ot=X2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2696DC352AA
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 09:03:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90C421783
	for <xen-devel@archiver.kernel.org>; Tue,  1 Oct 2019 09:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90C421783
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFE3b-00034D-Ep; Tue, 01 Oct 2019 09:02:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFE3a-00033q-0V
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:02:54 +0000
X-Inumbo-ID: 4002562c-e42a-11e9-96f6-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 4002562c-e42a-11e9-96f6-12813bfff9fa;
 Tue, 01 Oct 2019 09:02:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 55032337;
 Tue,  1 Oct 2019 02:02:52 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B32003F739;
 Tue,  1 Oct 2019 02:02:51 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190929155627.23493-1-julien.grall@arm.com>
 <20190929155627.23493-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1909301805390.2594@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9cf76146-dc0b-be10-62e9-a6f695dbb8c4@arm.com>
Date: Tue, 1 Oct 2019 10:02:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301805390.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/arm: domain_build: Indent
 correctly parameters of alloc_bank_memory()
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K0p1ZXJnZW4KCk9uIDAxLzEwLzIwMTkgMDI6MDUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToK
PiBPbiBTdW4sIDI5IFNlcCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gQWNrZWQtYnk6IFN0
ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiAKPiAKPj4gLS0tCj4+
ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNiArKystLS0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5j
Cj4+IGluZGV4IGI3OTFlNGI1MTIuLjI2OGUwNzRhZjcgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMK
Pj4gQEAgLTM3NSw5ICszNzUsOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYWxsb2NhdGVfbWVtb3J5
XzExKHN0cnVjdCBkb21haW4gKmQsCj4+ICAgfQo+PiAgIAo+PiAgIHN0YXRpYyBib29sIF9faW5p
dCBhbGxvY2F0ZV9iYW5rX21lbW9yeShzdHJ1Y3QgZG9tYWluICpkLAo+PiAtICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbywKPj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IHNnZm4sCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWRkcl90IHRvdF9zaXplKQo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBrZXJuZWxf
aW5mbyAqa2luZm8sCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2ZuX3Qgc2dmbiwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
YWRkcl90IHRvdF9zaXplKQo+PiAgIHsKPj4gICAgICAgaW50IHJlczsKPj4gICAgICAgc3RydWN0
IHBhZ2VfaW5mbyAqcGc7Cj4+IC0tIAo+PiAyLjExLjAKPj4KCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
