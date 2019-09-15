Return-Path: <SRS0=W1+I=XK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0082FC4CEC7
	for <xen-devel@archiver.kernel.org>; Sun, 15 Sep 2019 17:52:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D067A21479
	for <xen-devel@archiver.kernel.org>; Sun, 15 Sep 2019 17:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D067A21479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9YgS-00011a-Vq; Sun, 15 Sep 2019 17:51:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SHgU=XK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i9YgS-00011V-2x
 for xen-devel@lists.xenproject.org; Sun, 15 Sep 2019 17:51:36 +0000
X-Inumbo-ID: 750f6184-d7e1-11e9-95cc-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 750f6184-d7e1-11e9-95cc-12813bfff9fa;
 Sun, 15 Sep 2019 17:51:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DF0C337;
 Sun, 15 Sep 2019 10:51:34 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D03D73F67D;
 Sun, 15 Sep 2019 10:51:32 -0700 (PDT)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>
References: <osstest-141333-mainreport@xen.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5f71588b-274a-bdb7-d324-5ff9177a0490@arm.com>
Date: Sun, 15 Sep 2019 18:51:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <osstest-141333-mainreport@xen.org>
Content-Language: en-US
Subject: [Xen-devel] dom/xen heap and boot allocator (WAS Re:
 [xen-unstable-smoke test] 141333: regressions - FAIL)
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzE1LzE5IDM6MDkgUE0sIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiBm
bGlnaHQgMTQxMzMzIHhlbi11bnN0YWJsZS1zbW9rZSByZWFsIFtyZWFsXQo+IGh0dHA6Ly9sb2dz
LnRlc3QtbGFiLnhlbnByb2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xNDEzMzMvCj4gCj4gUmVncmVz
c2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tp
bmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gICB0ZXN0LWFy
bWhmLWFybWhmLXhsICAgICAgICAgICA3IHhlbi1ib290ICAgICAgICAgICAgICAgICBmYWlsIFJF
R1IuIHZzLiAxNDEyNTMKCk9zc3Rlc3QgZG9lcyBub3QgcHJvdmlkZSB0aGUgc3RhY2sgdHJhY2Ug
YXMgdGhlIGNyYXNoIGhhcHBlbiBiZWZvcmUgdGhlIApjb25zb2xlIGlzIHNldHVwLCBidXQgSSBt
YW5hZ2VkIHRvIHJlcHJvZHVjZSBpdCBsb2NhbGx5OgoKKFhFTikgQXNzZXJ0aW9uICdpc194ZW5f
aGVhcF9tZm4obWFkZHJfdG9fbWZuKG1hKSknIGZhaWxlZCBhdCAKL2hvbWUvanVsaWVuZy93b3Jr
cy94ZW4veGVuL2luY2x1ZGUvYXNtL21tLmg6MjUwCihYRU4pIC0tLS1bIFhlbi00LjEzLXVuc3Rh
YmxlICBhcm0zMiAgZGVidWc9eSAgIE5vdCB0YWludGVkIF0tLS0tCgpbLi4uXQoKKFhFTikgWGVu
IGNhbGwgdHJhY2U6CihYRU4pICAgIFs8MDAyOTkyYzA+XSBwYWdlX2FsbG9jLmMjYm9vdG1lbV9y
ZWdpb25fYWRkKzB4ZjgvMHgxN2MgKFBDKQooWEVOKSAgICBbPDAwMjk5NWFjPl0gaW5pdF9ib290
X3BhZ2VzKzB4OGMvMHgxYTAgKExSKQooWEVOKSAgICBbPDAwMjk5NWFjPl0gaW5pdF9ib290X3Bh
Z2VzKzB4OGMvMHgxYTAKKFhFTikgICAgWzwwMDJhY2MyYz5dIGR0X3VucmVzZXJ2ZWRfcmVnaW9u
cysweDI2OC8weDI4NAooWEVOKSAgICBbPDAwMmFkOGUwPl0gc3RhcnRfeGVuKzB4NWM4LzB4ZTkw
CihYRU4pICAgIFs8MDAyMDAwOTg+XSBhcm0zMi9oZWFkLm8jcHJpbWFyeV9zd2l0Y2hlZCsweDQv
MHgxMAoKVGhpcyBpcyBoYXBwZW5pbmcgYmVjYXVzZSBvZiBjb21taXQgNmUzZTc3MTIwMyAieGVu
L2FybTogc2V0dXA6IFJlbG9jYXRlIAp0aGUgRGV2aWNlLVRyZWUgbGF0ZXIgb24gaW4gdGhlIGJv
b3QiLiBTaW5jZSB0aGlzIHBhdGNoLCBub25lIG9mIHhlbmhlYXAgCm1lbW9yeSBpcyBnaXZlbiB0
byB0aGUgYm9vdCBhbGxvY2F0b3IuCgpUaGUgYm9vdCBhbGxvY2F0b3IgaXMgYm9vdHN0cmFwcGlu
ZyBpdHNlbGYgYW5kIHJlLXVzZSBhIHBhZ2UgZnJvbSB0aGUgCmZpcnN0IGFkZGVkIHJlZ2lvbi4g
SWYgdGhpcyByZWdpb24gaXMgbm90IGEgeGVuaGVhcCByZWdpb24sIHRoZW4gaXQgd2lsbCAKY3Jh
c2ggd2hlbiBjYWxsaW5nIG1mbl90b192aXJ0KCkgb3IgbGF0ZXIgb24gYmVjYXVzZSB0aGUgdmly
dHVhbCBhZGRyZXNzIAppcyBub3QgbWFwcGVkIGluIG1lbW9yeS4KClRoZSBkZXNjcmlwdGlvbiBv
ZiB0aGUgYm9vdCBhbGxvY2F0b3IgaW4gcGFnZV9hbGxvYy5jIGxlYWRzIHRvIHRoaW5rIAp0aGF0
IG9ubHkgZG9taGVhcCBtZW1vcnkgbWF5IGJlIGdpdmVuIHRvIHRoZSBib290IGFsbG9jYXRvci4K
CkZ1cnRoZXJtb3JlLCBhcyB0aGUgYm9vdCBhbGxvY2F0b3IgbWF5IGhhdmUgZG9taGVhcCBwYWdl
LCBpdCBtZWFucyB0aGF0IApjYWxsaW5nIG1mbl90b192aXJ0KG1mbl94KGFsbG9jX2Jvb3RfcGFn
ZXMoLi4uKSkgbWF5IG5vdCB3b3JrIHdoZW4gCkNPTkZJR19TRVBBUkFURV9YRU5IRUFQPXkuCgpJ
dCBmZWVscyB0byBtZSB0aGF0IGltcG9zaW5nIHRvIGdpdmUgYSB4ZW5oZWFwIHBhZ2UgdG8gdGhl
IGJvb3QgCmFsbG9jYXRvciBpcyBxdWl0ZSB1Z2x5LiBBcyB0aGUgYm9vdCBhbGxvY2F0b3Igd2ls
bCBiZSB1c2VkIGluIG1vc3Qgb2YgCnRoZSBjYXNlLCBzdGF0aWNhbGx5IGFsbG9jYXRpbmcgYm9v
dG1lbV9yZWdpb25fbGlzdCBtYXliZSB0aGUgYmVzdC4gQW55IAp0aG91Z2h0cz8KClJlZ2FyZGlu
ZyBhbGxvY19ib290X3BhZ2VzKCksIEkgYW0gYSBiaXQgdW5zdXJlIGhvdyB0byBwcm9jZWVkIGhl
cmUuIApNYXliZSBzb21lIGRvY3VtZW50YXRpb24/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
