Return-Path: <SRS0=xXFq=X4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B579C10F14
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2019 16:02:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12142215EA
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2019 16:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12142215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG3Yw-0007Cg-OE; Thu, 03 Oct 2019 16:02:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iG3Yv-0007Cb-GK
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 16:02:41 +0000
X-Inumbo-ID: 37e2f7e8-e5f7-11e9-80e3-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 37e2f7e8-e5f7-11e9-80e3-bc764e2007e4;
 Thu, 03 Oct 2019 16:02:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92504337;
 Thu,  3 Oct 2019 09:02:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57C513F739;
 Thu,  3 Oct 2019 09:02:35 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190924143515.8810-1-julien.grall@arm.com>
 <20190924143515.8810-3-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011757190.2943@sstabellini-ThinkPad-T480s>
 <5e058d03-d854-efe6-56d2-ca99852a8397@arm.com> <87pnjd4ye0.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b563f72e-cf4f-dfb3-9342-fdc144124b44@arm.com>
Date: Thu, 3 Oct 2019 17:02:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87pnjd4ye0.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] docs: Replace all instance
 of ARM by Arm
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8xMC8yMDE5IDE2OjU1LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBKdWxp
ZW4gR3JhbGwgd3JpdGVzOgo+IAo+PiBIaSBTdGVmYW5vLAo+Pgo+PiBPbiAxMC8yLzE5IDI6MDUg
QU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFR1ZSwgMjQgU2VwIDIwMTksIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+PiBUaGUgZG9jdW1lbnRhdGlvbiBpcyB1c2luZyBhIG1peCBv
ZiBBUk0gKG9sZCkgYW5kIEFybSAobmV3KS4gVG8gc3RheQo+Pj4+IGNvbnNpc3RlbnQsIHVzZSBv
bmx5IHRoZSBuZXcgbmFtZS4KPj4+Cj4+PiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwgaXQgbXVz
dCBoYXZlIGJlZW4gIm5vdCBmdW4iIHRvIHdyaXRlIHRoaXMKPj4+IHBhdGNoLgo+Pj4KPj4+IEhv
d2V2ZXIsIGxldCBtZSBzdWdnZXN0IGEgcmFkaWNhbCBtYXliZSBjb250cm92ZXJzaWFsIGlkZWEu
IFdoYXQgYWJvdXQKPj4+IGtlZXBpbmcgIkFSTSIgaW5zdGVhZCBvZiBzd2l0Y2hpbmc/IFRoZXJl
IGFyZSBzZXZlcmFsIGFkdmFudGFnZXM6IGl0IGlzCj4+PiBlYXNpZXIgdG8gZ3JlcCwgbm8gbmVl
ZCB0byB3b3JyeSBhYm91dCBjYXNlLXNlbnNpdGl2aXR5LiBJdCBpcyB3aGF0Cj4+PiBwZW9wbGUg
YXJlIHVzZWQgdG8sIGFuZCB3aGF0IHN0aWxsIHVzZSAoaW4gbXkgZXhwZXJpZW5jZSBhdCBjb25m
ZXJlbmNlCj4+PiBhbmQgYXQgd29yay4pIFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaWdub3JlIEFy
bSdzIG1hcmtldGluZyBhbmQga2VlcCB0aGUKPj4+IG9sZCAiQVJNIiBub21lbmNsYXR1cmU/Cj4+
Cj4+IFByZXR0eSBtdWNoIGFsbCB0aGUgbmV3IGRvY3VtZW50YXRpb24gb24gQXJtIHdlYnNpdGUg
YXJlIG5vdyB1c2luZyBBcm0KPj4gKHRoZSBzcGVjIGlzIG5vdyBjYWxsZWQgQXJtIEFybSkuCj4g
VGhpcyBjb25mdXNlcyBtZSwgYmVjYXVzZSBJIGJlbGlldmVkIHRoYXQgc2Vjb25kICJBcm0iIHN0
YW5kcyBmb3IKPiBBcmNoaXRlY3R1cmUgUmVmZXJlbmNlIE1hbnVhbC4KU29ycnkgaXQgaXMgQXJt
IEFSTS4gQnV0IHRoZXkgdGVuZCB0byB1c2UgdGhlIGxvbmdlciBuYW1lIEFybSBBcmNoaXRlY3R1
cmUgClJlZmVyZW5jZSBNYW51YWwuCgo+IAo+Pj4KPj4+IElmIG5vdCwgSSdkIHN1Z2dlc3QgdG8g
YWxzbyByZXBsYWNlICJhcm0iIHdpdGggIkFybSIgc28gdGhhdCBhdCBsZWFzdAo+Pj4gd2l0aCBo
YXZlIGNvbnNpc3RlbnQgY2FzZXMgZXZlcnl3aGVyZS4gQnV0IHRoZW4gdGhlIHBhdGhuYW1lcyB3
b3VsZAo+Pj4gcmVtYWluIHhlbi9hcmNoL2FybSwgbGVhZGluZyB0byBzZW50ZW5jZXMgc3VjaCBh
czoKPj4+Cj4+PiAgICAobm9uLXpJbWFnZSkiIHByb3RvY29sIGRlc2NyaWJlZCBpbiBhcm0vQm9v
dGluZy4KPj4+ICAgICAgIFRoZXJlIGFyZSBubyBleGNlcHRpb24gb24gNjQtYml0IEFybS4KPj4+
Cj4+PiBXaXRoICJhcm0iIGFuZCAiQVJNIiB0aGUgZGlzdGluY3Rpb24gd2FzIGNsZWFyIGJldHdl
ZW4gcGF0aG5hbWVzIGFuZAo+Pj4gdGV4dCAoYXQgbGVhc3QgdG8gbWUuKSBXaXRoICJhcm0iIGFu
ZCAiQXJtIiwgSSBrbm93IGl0IGlzIHNpbGx5IGJ1dCBpdAo+Pj4ga2luZCBvZiBib3RoZXJzIG1l
IDotKQo+Pgo+PiBIb3cgZG8geW91IGRlYWwgd2l0aCBYaWxpbnggdGhlbj8gOykKPj4KPj4+Cj4+
PiBJIGFtIG5vdCBnb2luZyB0byBpbnNpc3Qgb24gdGhpcyBvbmUgdGhvdWdoLgo+Pgo+PiBUaGlz
IGlzIHF1aXRlIHNpbWlsYXIgdG8gYSBjb21wYW55IHJlbmFtaW5nIGl0c2VsZiAob3IgZ290IGFj
cXVpcmVkCj4+IGFuZCB0aGUgbmFtZSBjb21wbGV0ZWx5IGRpc2FwcGVhcikgYnV0IGluIGEgbGVz
cyByYWRpY2FsIHdheS4gV291bGQKPj4geW91IHN0aWxsIGtlZXAgdGhlIG9sZCBuYW1lIGNvbXBh
bnkgaW4geW91ciBkb2N1bWVudGF0aW9uIGFuZC9vcgo+PiBtaXhpbmcgdGhlIGJvdGg/Cj4gQlRX
LCB0aGlzIGlmIHdoYXQgaGFwcGVuZWQgd2l0aCBGcmVlc2NhbGUvTlhQLiBMaW51eCBhbmQgVS1C
b290IHN0aWxsCj4gdXNlICJmcmVlc2NhbGUiIGV2ZW4gZm9yIGkuTVg4IGNoaXBzLgoKTWF5YmUg
YmVjYXVzZSBub2JvZHkgYm90aGVyZWQgdG8gZG8gaXQ/IEkgd291bGQgbGlrZSBzb21lIGNvbnNp
c3RlbmN5IGluIHRoZSAKZG9jdW1lbnRhdGlvbiBhbmQgaGVuY2UgdXNpbmcgdGhlIG5ldyBuYW1l
IG1ha2VzIHNlbnNlLiBCdXQgSSBhbSBub3QgYm90aGVyZWQgCmVub3VnaCB0byBhcmd1ZSB3aGV0
aGVyIHdlIHNob3VsZCBzdGF5IGluIHRoZSBwYXN0LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
