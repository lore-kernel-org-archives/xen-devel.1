Return-Path: <SRS0=D6zB=XZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A65C32792
	for <xen-devel@archiver.kernel.org>; Mon, 30 Sep 2019 10:55:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C3F21855
	for <xen-devel@archiver.kernel.org>; Mon, 30 Sep 2019 10:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C3F21855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtKg-0006sF-5R; Mon, 30 Sep 2019 10:55:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEtKe-0006s7-V9
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:55:08 +0000
X-Inumbo-ID: a806c9c0-e370-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a806c9c0-e370-11e9-8628-bc764e2007e4;
 Mon, 30 Sep 2019 10:54:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 528F2AE52;
 Mon, 30 Sep 2019 10:54:20 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <98abb2ff-def0-7c4c-204f-f9e758fb826c@suse.com>
Date: Mon, 30 Sep 2019 12:54:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930052135.11257-2-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/19] xen/sched: add code to sync
 scheduling of all vcpus of a sched unit
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAwNzoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaGVuIHN3aXRjaGlu
ZyBzY2hlZCB1bml0cyBzeW5jaHJvbml6ZSBhbGwgdmNwdXMgb2YgdGhlIG5ldyB1bml0IHRvIGJl
Cj4gc2NoZWR1bGVkIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4gQSB2YXJpYWJsZSBzY2hlZF9ncmFu
dWxhcml0eSBpcyBhZGRlZCB3aGljaCBob2xkcyB0aGUgbnVtYmVyIG9mIHZjcHVzCj4gcGVyIHNj
aGVkdWxlIHVuaXQuCj4gCj4gQXMgdGFza2xldHMgcmVxdWlyZSB0byBzY2hlZHVsZSB0aGUgaWRs
ZSB1bml0IGl0IGlzIHJlcXVpcmVkIHRvIHNldCB0aGUKPiB0YXNrbGV0X3dvcmtfc2NoZWR1bGVk
IHBhcmFtZXRlciBvZiBkb19zY2hlZHVsZSgpIHRvIHRydWUgaWYgYW55IGNwdQo+IGNvdmVyZWQg
YnkgdGhlIGN1cnJlbnQgc2NoZWR1bGUoKSBjYWxsIGhhcyBhbnkgcGVuZGluZyB0YXNrbGV0IHdv
cmsuCj4gCj4gRm9yIGpvaW5pbmcgb3RoZXIgdmNwdXMgb2YgdGhlIHNjaGVkdWxlIHVuaXQgd2Ug
bmVlZCB0byBhZGQgYSBuZXcKPiBzb2Z0aXJxIFNDSEVEX1NMQVZFX1NPRlRJUlEgaW4gb3JkZXIg
dG8gaGF2ZSBhIHdheSB0byBpbml0aWF0ZSBhCj4gY29udGV4dCBzd2l0Y2ggd2l0aG91dCBjYWxs
aW5nIHRoZSBnZW5lcmljIHNjaGVkdWxlKCkgZnVuY3Rpb24KPiBzZWxlY3RpbmcgdGhlIHZjcHUg
dG8gc3dpdGNoIHRvLCBhcyB3ZSBhbHJlYWR5IGtub3cgd2hpY2ggdmNwdSB3ZQo+IHdhbnQgdG8g
cnVuLiBUaGlzIGhhcyB0aGUgb3RoZXIgYWR2YW50YWdlIG5vdCB0byBsb29zZSBhbnkgb3RoZXIK
PiBjb25jdXJyZW50IFNDSEVEVUxFX1NPRlRJUlEgZXZlbnRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdlZC1ieTogRGFyaW8gRmFn
Z2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPiAtLS0KPiBSRkMgVjI6Cj4gLSBtb3ZlIHN5bmNp
bmcgYWZ0ZXIgY29udGV4dF9zd2l0Y2goKSB0byBzY2hlZHVsZS5jCj4gVjI6Cj4gLSBkb24ndCBy
dW4gdGFza2xldHMgZGlyZWN0bHkgZnJvbSBzY2hlZF93YWl0X3JlbmRlenZvdXNfaW4oKQo+IFYz
Ogo+IC0gYWRhcHQgYXJyYXkgc2l6ZSBpbiBzY2hlZF9tb3ZlX2RvbWFpbigpIChKYW4gQmV1bGlj
aCkKPiAtIGludCAtPiB1bnNpZ25lZCBpbnQgKEphbiBCZXVsaWNoKQo+IFY0Ogo+IC0gcmVuYW1l
ZCBzZCB0byBzciBpbiBzZXZlcmFsIHBsYWNlcyAoSmFuIEJldWxpY2gpCj4gLSBzd2FwIHN0b3Bf
dGltZXIoKSBhbmQgTk9XKCkgY2FsbHMgKEphbiBCZXVsaWNoKQo+IC0gY29udGV4dF9zd2l0Y2go
KSBvbiBBUk0gcmV0dXJucyAtIGhhbmRsZSB0aGF0IChKYW4gQmV1bGljaCkKCkVzcGVjaWFsbHkg
YmVjYXVzZSBvZiB0aGlzIChwcmV2aW91c2x5IG92ZXJsb29rZWQpIGFzcGVjdCBJIHRoaW5rCkkn
ZCBwcmVmZXIgYW4gQXJtIG1haW50YWluZXIgYWNrIGhlcmUgYmVmb3JlIGNvbW1pdHRpbmcgbm8g
bWF0dGVyCnRoYXQgLi4uCgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICB8ICAg
MiArLQoKLi4uIHRoaXMgaXMgYSByYXRoZXIgbWluaW1hbCBjaGFuZ2UuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
