Return-Path: <SRS0=BdeL=TQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BBEC04AAF
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 10:47:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E1120848
	for <xen-devel@archiver.kernel.org>; Thu, 16 May 2019 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0E1120848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDuj-00063v-Nj; Thu, 16 May 2019 10:47:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRDui-00063l-7t
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:47:04 +0000
X-Inumbo-ID: ee4effde-77c7-11e9-bf68-2f7abaf3e918
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee4effde-77c7-11e9-bf68-2f7abaf3e918;
 Thu, 16 May 2019 10:46:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 04:46:58 -0600
Message-Id: <5CDD3FA1020000780022F903@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 04:46:57 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Lars Kurth" <lars.kurth@citrix.com>
References: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
In-Reply-To: <0648312f1c78e519142ff1829a984e7e965bf3c7.1557957269.git.lars.kurth@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] Add TRACKING.IMPORTS to xen.git to more
 easily manage imported files that need to be kept in sync with an upstream
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, committers@xenproject.org,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190516104657.-U0cm-7uFKoY8caVQNBAJUNo7OxL7ssjB2i0F75hwxI@z>

Pj4+IE9uIDE2LjA1LjE5IGF0IDAwOjE4LCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPiB3cm90ZToK
PiAtLS0gL2Rldi9udWxsCj4gKysrIGIvVFJBQ0tJTkcuSU1QT1JUUwo+IEBAIC0wLDAgKzEsNDAg
QEAKPiArIyBUaGlzIGZpbGUgY29udGFpbnMgaW5mb3JtYXRpb24gYWJvdXQgc291cmNlIGZpbGVz
IHRoYXQgaGF2ZSBiZWVuCj4gKyMgY29waWVkIGZyb20gb3RoZXIgc291cmNlcyBhbmQgbmVlZCB0
byBiZSB0cmFja2VkCj4gKyMKPiArIyBUaGUgZmlsZSBtYXkgY29udGFpbiBsaW5lcyBzdGFydGlu
ZyB3aXRoIC4uLgo+ICsjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tCj4gKyMgdmVyc2lvbjogb2YgZmlsZSBmb3JtYXQKPiArIyByZXBvOiByZXBvc2l0b3J5IGRl
ZmluaXRpb24KPiArIyBhdXRvfG1hbnVhbDogYSBtYXBwaW5nIHRvIHRyYWNrIGZpbGVzCj4gKyMK
PiArIyBSZXBvc2l0b3J5IERlZmluaXRpb25zIGFyZSBvZiB0aGUgZm9sbG93aW5nIGZvcm1hdAo+
ICsjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
KyMgcmVwbyBuYW1lLW9mLXNvdXJjZS1yZXBvIGdpdHxzdm4gaHR0cHMtdXJsLW9mLXNvdXJjZS1y
ZXBvCj4gKyMKPiArIyBGb3IgZXhhbXBsZToKPiArIyAgIHJlcG8gbGludXgtdG9ydmFsZHMgZ2l0
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRz
L2xpbnV4LmdpdCAKPiArIwo+ICsjIE1hcHBpbmdzIHRvIHRyYWNrIGZpbGVzIGFyZSBvZiB0aGUg
Zm9sbG93aW5nIGZvcm1hdAo+ICsjIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICsjIG1hbnVhbHxhdXRvIHhlbi1maWxlIG5hbWUtb2Ytb3JpZ2lu
YWwtcmVwbyBvcmlnaW5hbC1maWxlIGNvbW1pdC1pZAo+ICsjCj4gKyMgYXV0bzoKPiArIyAgIFRo
ZSB4ZW4tZmlsZSBuZWVkcyB0byB0cmFjayB0aGUgdGhlIG9yaWdpbmFsLWZpbGUgZXhhY3RseQo+
ICsjICAgSW4gb3RoZXIgd29yZHMsIHdlIGNhbiBhdXRvbWF0aWNhbGx5IHVwZGF0ZSB0aGUgZmls
ZSB1c2luZyBhIHNjcmlwdAoKRG8gd2UgaGF2ZSBfYW55XyBleGFtcGxlIG9mIHRoaXM/IEkgY2Fu
J3QgZXZlbiBpbWFnaW5lIG9uZSwgZHVlCnRvIGUuZy4gb3VyIGluY2x1ZGVzIGFsbCBzdGFydGlu
ZyB3aXRoIHhlbi8gd2hlcmVhcyBMaW51eCdlcyAoanVzdCB0bwp0YWtlIGFzIGV4YW1wbGUpIGFs
bCBzdGFydCB3aXRoIGxpbnV4Ly4gUGVyaGFwcyAiYXV0byIgbmVlZHMgdG8KaW5jbHVkZSBzZWQg
ZXhwcmVzc2lvbnMgdGhhdCBuZWVkIHRvIGJlIGFwcGxpZWQgYmVmb3JlIGFjdHVhbGx5CmFwcGx5
aW5nIHRoZSBvcmlnaW5hbCBjaGFuZ2UgdG8gb3VyIHRyZWU/Cgo+ICsjIG1hbnVhbDoKPiArIyAg
IEEgZGV2ZWxvcGVyIG5lZWRzIHRvIG1ha2UgYSBkZWNpc2lvbiB3aGV0aGVyIGEKPiArIyAgIHNw
ZWNpZmljIGNoYW5nZSBpcyBhcHBsaWVkIG9yIGlnbm9yZWQgYW5kIHVwZGF0ZSB0aGUgbGFzdCBj
b21taXQgaWQKPiArIyAgIGFjY29yZGluZ2x5Cj4gKyMKPiArIyBuYW1lLW9mLW9yaWdpbmFsLXJl
cG86Cj4gKyMgICBBIHJlZmVyZW5jZSB0byBhIHNvdXJjZSByZXBvc2l0b3J5IGRlZmluZWQgYnkg
KnJlcG8qIGtleXdvcmQKPiArIwo+ICsjIGNvbW1pdCBpZDoKPiArIyAgIExhc3QgY29tbWl0IGlk
IG9mIHNvdXJjZSBmaWxlIHRoYXQgd2FzIGRlZW1lZCB0byBiZSBvawo+ICsjICAgYW5kIGVpdGhl
ciBpbXBvcnRlZCBpbnRvIHRoZSB0cmVlIG9yIHJlamVjdGVkCj4gKyMKPiArIyBGb3IgZXhhbXBs
ZToKPiArIyAgIG1hbnVhbCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hcm0vc21tdS5jIGxpbnV4
LXRvcnZhbGRzIGxpbnV4L2RyaXZlcnMvaW9tbXUvYXJtLXNtbXUuYyBiNzdjZjExZjA5NDEzNgo+
ICsKPiArdmVyc2lvbiAxCgpQZXJoYXBzIGl0IHdvdWxkbid0IGh1cnQgdG8gaW5jbHVkZSB0aGUg
Y29sb25zIGluIHRoZSBhY3R1YWwgZW50cmllcyBhcwp3ZWxsPyBJIGFsc28gZG9uJ3QgdGhpbmsg
ZXhhbXBsZXMgYXJlIG5lZWRlZCBvbmNlIHdlIGdldCB0aGUgZmlyc3QKcmVhbCBlbnRyaWVzLiBI
ZW5jZSBJJ2QgbW92ZSB0aGVtIHRvIHRoZSBjb21taXQgbWVzc2FnZSBvciBhCnBvc3QtY29tbWl0
IG1lc3NhZ2UgcmVtYXJrLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
