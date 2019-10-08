Return-Path: <SRS0=Os51=YB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D59C4360C
	for <xen-devel@archiver.kernel.org>; Tue,  8 Oct 2019 14:22:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E41320673
	for <xen-devel@archiver.kernel.org>; Tue,  8 Oct 2019 14:22:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E41320673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHqND-0008Ax-L2; Tue, 08 Oct 2019 14:21:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHqNC-0008Ap-Ia
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 14:21:58 +0000
X-Inumbo-ID: fafd03d1-e9d6-11e9-97cf-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fafd03d1-e9d6-11e9-97cf-12813bfff9fa;
 Tue, 08 Oct 2019 14:21:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C545B19D;
 Tue,  8 Oct 2019 14:21:56 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191002104935.60245-1-roger.pau@citrix.com>
 <c5dc7c62-ea14-7930-8f2d-62e20984da60@suse.com>
 <20191008092344.GB66437@Air-de-Roger>
 <1a8d42d4-a456-ad55-d063-6099a7b735e8@suse.com>
 <20191008110901.GC66437@Air-de-Roger>
 <9ea4ba56-ffd6-0b4a-47d0-cfac5291d49b@suse.com>
 <20191008131425.GE66437@Air-de-Roger>
 <7db8ed62-44a7-fac5-dd54-3d1bed2e4dab@suse.com>
 <20191008141615.GF66437@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1319dfd6-052c-39c4-aa29-d79fa9600829@suse.com>
Date: Tue, 8 Oct 2019 16:21:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191008141615.GF66437@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: xen-devel@lists.xenproject.org, Stanislav Spassov <stanspas@amazon.de>,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMjAxOSAxNjoxNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBP
Y3QgMDgsIDIwMTkgYXQgMDM6MzI6MjVQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDA4LjEwLjIwMTkgMTU6MTQsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+Pj4gT24gVHVlLCBP
Y3QgMDgsIDIwMTkgYXQgMDE6Mjg6NDlQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
T24gMDguMTAuMjAxOSAxMzowOSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4+Pj4+IEdpdmVu
IHRoYXQgYXMgeW91IGNvcnJlY3RseSBwb2ludCBvdXQgbWFza2FsbCBpcyB1bnNldCBhZnRlciBk
ZXZpY2UKPj4+Pj4gcmVzZXQsIEkgZmVlbCB0aGF0IG9wdGlvbiA0IGlzIHRoZSBiZXN0IG9uZSBz
aW5jZSBpdCBtYXRjaGVzIHRoZSBzdGF0ZQo+Pj4+PiBvZiB0aGUgaGFyZHdhcmUgYWZ0ZXIgcmVz
ZXQuCj4+Pj4KPj4+PiBSaWdodCwgdGhhdCdzIHRoZSB2YXJpYW50IGNvbWluZyBjbG9zZXN0IHRv
IHdoYXQgaGFyZHdhcmUgc3RhdGUKPj4+PiBvdWdodCB0byBiZSBhdCB0aGF0IHBvaW50LiBXZSdk
IG5lZWQgdG8gZG91YmxlIGNoZWNrIHRoYXQgdGhlCj4+Pj4gcGVyLWVudHJ5IG1hc2sgYml0cyBh
cmUgYWxsIHNldCBhdCB0aGF0IHBvaW50Lgo+Pj4KPj4+IEknbSBub3Qgc2F5aW5nIHN1Y2ggY2hl
Y2sgaXMgbm90IHdvcnRoIGRvaW5nLCBidXQgd2h5IGRvIGl0IGluIHRoaXMKPj4+IGNhc2UgYnV0
IG5vdCB3aGVuIGFsc28gY2xlYXJpbmcgdGhlIG1hc2thbGwgKGluIG1zaXhfY2FwYWJpbGl0eV9p
bml0KQo+Pj4gd2hlbiBjYWxsZWQgZnJvbSBwcmVwYXJlX21zaXg/Cj4+Cj4+IEJ5ICJkb3VibGUg
Y2hlY2siIEkgbWVhbnQgaW5zcGVjdCB0aGUgc291cmNlLCBub3QgdG8gYWRkIGNoZWNraW5nIGxv
Z2ljLgo+IAo+IE9oLCBJIGltcGxpZWQgeW91IHdhbnRlZCB0byBpdGVyYXRlIG92ZXIgYWxsIGVu
dHJpZXMgYW5kIGNoZWNrIHRoYXQKPiB0aGUgbWFzayBiaXQgaXMgc2V0IGZvciBlYWNoLgo+IAo+
IEl0J3MgbXkgdW5kZXJzdGFuZGluZyB0aGF0IFhlbiByZWxpZXMgb24gZG9tMCBoYXZpbmcgZG9u
ZSBhIGRldmljZQo+IHJlc2V0IGJlZm9yZSBpdCBiZWluZyBhc3NpZ25lZCwgd2hpY2ggbWFza3Mg
YWxsIGVudHJpZXMuIEkndmUgY2hlY2tlZAo+IHRoZSBwY2liYWNrIGNvZGUgYW5kIHRoZSByZXNl
dCBpcyBwZXJmb3JtZWQgd2hlbiB0aGUgZGV2aWNlIGlzCj4gYXNzaWduZWQgdG8gZG9tMCAoaWU6
IGd1ZXN0IHNodXRkb3duIG9yIGhvdC11bnBsdWcpLCBhbmQgaGVuY2Ugd2hlbgo+IHRoZSBkZXZp
Y2UgaXMgYXNzaWduZWQgdG8gYSBkaWZmZXJlbnQgZG9tYWluIHRoZSBzdGF0ZSBvZiBpdCBzaG91
bGQgYmUKPiB0aGUgYWZ0ZXIgcmVzZXQgb25lLgo+IAo+IEkgY2FuIGFkZCBhIGNvbW1lbnQgaW4g
YXNzaWduX2RldmljZSB0aGF0IFhlbiBleHBlY3RzIHRoZSBkZXZpY2Ugc3RhdGUKPiB0byBiZSB0
aGUgYWZ0ZXIgcmVzZXQgb25lLCBhbmQgaGVuY2UgaG9zdF9tYXNrYWxsID0gZ3Vlc3RfbWFza2Fs
bCA9Cj4gZmFsc2UgYW5kIGFsbCBlbnRyaWVzIHNob3VsZCBoYXZlIHRoZSBtYXNrIGJpdCBzZXQu
CgpZZXMgcGxlYXNlLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
