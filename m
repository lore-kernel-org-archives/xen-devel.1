Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E00C10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:11:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4CA20679
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE4CA20679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJe9P-0005Tm-Jv; Thu, 25 Apr 2019 13:10:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJe9O-0005Tf-M8
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:10:54 +0000
X-Inumbo-ID: 8dac1cfc-675b-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8dac1cfc-675b-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 13:10:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 07:10:52 -0600
Message-Id: <5CC1B1D60200007800229124@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 07:10:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 <george.dunlap@citrix.com>
References: <1555936799-15675-1-git-send-email-dongli.zhang@oracle.com>
 <d34d784e-9db9-b646-4099-8b787308fef2@citrix.com>
 <fd752460-921f-3e12-214c-029e595f81b3@citrix.com>
 <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
In-Reply-To: <c55d9f40-ae67-301b-bc80-8d73bbf053ba@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/1] xen/gnttab: print log at level
 XENLOG_ERR before panic
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
 Dongli Zhang <dongli.zhang@oracle.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425131046.JrtB86RRpfPQuArYsfelBJV8Z8EheQe4eOkpgiukLvY@z>

Pj4+IE9uIDIzLjA0LjE5IGF0IDE4OjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDQvMjAxOSAxMjo0NywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gNC8y
My8xOSAxMTozNyBBTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IE9uIDIyLzA0LzIwMTkgMTM6
MzksIERvbmdsaSBaaGFuZyB3cm90ZToKPj4+PiBQcmludCBsb2cgYXQgbGV2ZWwgWEVOTE9HX0VS
UiAoaW5zdGVhZCBYRU5MT0dfSU5GTykgYXMgZG9tYWluX2NyYXNoKCkKPj4+PiBpbmRpY2F0ZXMg
dGhlcmUgaXMgZmF0YWwgZXJyb3IuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEb25nbGkgWmhh
bmcgPGRvbmdsaS56aGFuZ0BvcmFjbGUuY29tPgo+Pj4+IC0tLQo+Pj4+ICB4ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMgfCAyICstCj4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFi
bGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+Pj4+IGluZGV4IDgwNzI4ZWEuLjcyNWM2
MTggMTAwNjQ0Cj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gKysrIGIv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCj4+Pj4gQEAgLTEyODIsNyArMTI4Miw3IEBAIHVubWFw
X2NvbW1vbigKPj4+PiAgICAgIGlmICggdW5saWtlbHkoKHJkID0gcmN1X2xvY2tfZG9tYWluX2J5
X2lkKGRvbSkpID09IE5VTEwpICkKPj4+PiAgICAgIHsKPj4+PiAgICAgICAgICAvKiBUaGlzIGNh
biBoYXBwZW4gd2hlbiBhIGdyYW50IGlzIGltcGxpY2l0bHkgdW5tYXBwZWQuICovCj4+Pj4gLSAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX0lORk8sICJDb3VsZCBub3QgZmluZCBkb21haW4gJWRcbiIs
IGRvbSk7Cj4+Pj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkNvdWxkIG5vdCBmaW5k
IGRvbWFpbiAlZFxuIiwgZG9tKTsKPj4+IFdoaWxlIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlIGlu
IHByaW5jaXBsZSwgd2hhdCBkb2VzIHRoaXMgYWN0dWFsbHkgZG8/IAo+Pj4gVGhlIGVudGlyZSBw
cmludGsoKSBpcyBjb21waWxlZCBvdXQgaW4gcmVsZWFzZSBidWlsZHMsIGFuZCBkZWJ1ZyBidWls
ZHMKPj4+IGxvZyBhbGwgbWVzc2FnZXMuCj4+IC4uLmJ5IGRlZmF1bHQ7IGJ1dCBwcmVzdW1hYmx5
IHlvdSBjYW4gdHVybiB0aGF0IGRvd24sIHJpZ2h0Pwo+IAo+IFllcyB5b3UgY2FuLCBidXQgYSkg
bm9vbmUgZG9lcywgYmVjYXVzZSB0aGVzZSBhcmUgZGVidWcgYnVpbGRzIGFuZCBiKQo+IHRoYXQg
aXNuJ3QgdGhlIHBvaW50LiAgSWYgd2UgY2FyZSBhYm91dCB0aGlzIG1lc3NhZ2UgYmVpbmcgcHJp
bnRlZCwgaXQKPiBtdXN0buKAmXQgYmUgYSBnZHByaW50aygpLgo+IAo+IEl0IGVpdGhlciB3YW50
cyB0byB0dXJuIGludG8gYSBncHJpbnRrKCkgYXQgWEVOTE9HX0lORk8sIG9yIHdhbnRzCj4gZGVs
ZXRpbmcgZW50aXJlbHksIGJ1dCBzaW1wbHkgc2h1ZmZsaW5nIHRoZSBleGFjdCBsZXZlbCBmb3Ig
YSBnZHByaW50aygpCj4gaXMgdGFudGFtb3VudCB0byB1c2VsZXNzLgoKRldJVyBJIGFncmVlLCBh
bmQgSSB0aGluayB0aGVyZSBhcmUgcXVpdGUgYSBmZXcgbW9yZSBjYW5kaWRhdGVzIG9mCmRlYnVn
IG1lc3NhZ2VzIHRoYXQgd291bGQgYmV0dGVyIGdvIGF3YXksIGFuZCBzaG91bGQgcHJvYmFibHkK
aGF2ZSBiZWVuIHN0cmlwcGVkIG9mZiBiZWZvcmUgdGhlIG9yaWdpbmFsIGNvbW1pdCBpbnRyb2R1
Y2luZyB0aGVtLgoKVGhlIG9uZSByZWFzb24gbm90IHRvIGRyb3AgdGhlIG1lc3NhZ2UgaGVyZSwg
YnV0IHRvIHN3aXRjaCB0bwpncHJpbnRrKCksIGlzIHRoZSBhZGphY2VudCBkb21haW5fY3Jhc2go
KS4gVGhpcywgaG93ZXZlciwgdGhlbiBpcwphIHJlYXNvbiB0byBnaXZlIGl0IGEgbG9nIGxldmVs
IGFib3ZlIElORk8uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
