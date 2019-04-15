Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE23C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:26:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB414206BA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 11:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB414206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFzkM-0006pZ-OP; Mon, 15 Apr 2019 11:25:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=K9O8=SR=citrix.com=prvs=0011d4d25=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hFzkL-0006pO-IC
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 11:25:57 +0000
X-Inumbo-ID: 3c0bd6eb-5f71-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3c0bd6eb-5f71-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 11:25:55 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,353,1549929600"; d="scan'208";a="83567470"
Date: Mon, 15 Apr 2019 12:25:47 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190415112547.GB1354@perard.uk.xensource.com>
References: <20190409110844.14746-1-anthony.perard@citrix.com>
 <20190409110844.14746-7-anthony.perard@citrix.com>
 <2fbfe0f2-5c34-9faa-bda5-88223770c936@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2fbfe0f2-5c34-9faa-bda5-88223770c936@citrix.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Subject: Re: [Xen-devel] [PATCH v2 06/31] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415112547.P6O21w5yFQuIMgKhNg-111yuS64dxWQ6Bd5p9ZOWxFs@z>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMDE6NTI6MjdQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwOS8wNC8yMDE5IDEyOjA4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IGRp
ZmYgLS1naXQgYS9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20gYi9P
dm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20KPiA+IG5ldyBmaWxlIG1v
ZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwLi5jNDgwMmJmNGQxCj4gPiAtLS0gL2Rldi9u
dWxsCj4gPiArKysgYi9Pdm1mUGtnL1hlblJlc2V0VmVjdG9yL0lhMzIvWGVuUFZITWFpbi5hc20K
PiA+IEBAIC0wLDAgKzEsNDcgQEAKPiA+ICs7LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gPiArOyBA
ZmlsZQo+ID4gKzsgQW4gZW50cnkgcG9pbnQgdXNlIGJ5IFhlbiB3aGVuIGEgZ3Vlc3QgaXMgc3Rh
cnRlZCBpbiBQVkggbW9kZS4KPiA+ICs7Cj4gPiArOyBDb3B5cmlnaHQgKGMpIDIwMTksIENpdHJp
eCBTeXN0ZW1zLCBJbmMuCj4gPiArOwo+ID4gKzsgVGhpcyBwcm9ncmFtIGFuZCB0aGUgYWNjb21w
YW55aW5nIG1hdGVyaWFscyBhcmUgbGljZW5zZWQgYW5kIG1hZGUgYXZhaWxhYmxlCj4gPiArOyB1
bmRlciB0aGUgdGVybXMgYW5kIGNvbmRpdGlvbnMgb2YgdGhlIEJTRCBMaWNlbnNlIHdoaWNoIGFj
Y29tcGFuaWVzIHRoaXMKPiA+ICs7IGRpc3RyaWJ1dGlvbi4gIFRoZSBmdWxsIHRleHQgb2YgdGhl
IGxpY2Vuc2UgbWF5IGJlIGZvdW5kIGF0Cj4gPiArOyBodHRwOi8vb3BlbnNvdXJjZS5vcmcvbGlj
ZW5zZXMvYnNkLWxpY2Vuc2UucGhwCj4gPiArOwo+ID4gKzsgVEhFIFBST0dSQU0gSVMgRElTVFJJ
QlVURUQgVU5ERVIgVEhFIEJTRCBMSUNFTlNFIE9OIEFOICJBUyBJUyIgQkFTSVMsIFdJVEhPVVQK
PiA+ICs7IFdBUlJBTlRJRVMgT1IgUkVQUkVTRU5UQVRJT05TIE9GIEFOWSBLSU5ELCBFSVRIRVIg
RVhQUkVTUyBPUiBJTVBMSUVELgo+ID4gKzsKPiA+ICs7LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
PiArCj4gPiArQklUUyAgICAzMgo+ID4gKwo+ID4gK3hlblBWSE1haW46Cj4gPiArICAgIG1vdiAg
ICAgZGksICdCUCcKPiA+ICsKPiA+ICsgICAgOyBFU1AgLSAgSW5pdGlhbCB2YWx1ZSBvZiB0aGUg
RUFYIHJlZ2lzdGVyIChCSVNUOiBCdWlsdC1pbiBTZWxmIFRlc3QpCj4gPiArICAgIG1vdiAgICAg
ZXNwLCBlYXgKPiAKPiBXaGVyZSBpcyB0aGUgQUJJIGRlc2NyaWJlZD/CoCBYZW4gaGFzIG5vIEJJ
U1QsIHNvIHRoaXMgd2lsbCBhbHdheXMgaGF2ZQo+IHRoZSB2YWx1ZSAwLiBTdGFzaGluZyBpdCBp
biB0aGUgc3RhY2sgcG9pbnRlciBzZWVtcyBsaWtlIGEgd2VpcmQgY2hvaWNlLAo+IGFuZCBhIHJl
Y2lwZSBmb3Igc3VidGxlIGJ1Z3MuCgpJJ3ZlIGp1c3QgY29waWVkIG92ZXIgd2hhdCB3YXMgZG9u
ZSBpbiB0aGUgSFZNIGNhc2UuIEknbGwgY2hhbmdlIHRoYXQKYW5kIGlnbm9yZSB0aGUgdmFsdWUg
aW4gYGVheCcuCgo+ID4gKwo+ID4gKyAgICBjbGkKPiAKPiBJbnRlcnJ1cHRzIGFyZSBndWFyYW50
ZWVkIHRvIGJlIG9mZiBhdCB0aGlzIHBvaW50LgoKT0ssIEknbGwgcmVtb3ZlIHRoZSBpbnN0cnVj
dGlvbi4KCj4gPiArCj4gPiArICAgIG1vdiAgICAgZWJ4LCBBRERSX09GKGdkdHIpCj4gPiArICAg
IGxnZHQgICAgW2VieF0KPiAKPiBsZ2R0IEFERFJfT0YoZ2R0ciksIHByZXN1bWFibHk/Cj4gCj4g
VGhpcyBpcyAzMmJpdCBjb2RlIC0gdGhlcmUgaXMgbm8gbmVlZCBmb3IgYW55IGluZGlyZWN0aW9u
IHRocm91Z2gKPiByZWdpc3RlcnMgZm9yIG1lbW9yeSBvcGVyYW5kcy4KCkknbGwgY2hhbmdlIHRo
aXMsIGlmIGl0IHdvcmtzLgoKPiA+ICsKPiA+ICsgICAgbW92ICAgICBlYXgsIFNFQ19ERUZBVUxU
X0NSMAo+ID4gKyAgICBtb3YgICAgIGNyMCwgZWF4Cj4gPiArCj4gPiArICAgIGptcCAgICAgTElO
RUFSX0NPREVfU0VMOkFERFJfT0YoLmptcFRvTmV3Q29kZVNlZykKPiA+ICsuam1wVG9OZXdDb2Rl
U2VnOgo+ID4gKwo+ID4gKyAgICBtb3YgICAgIGVheCwgU0VDX0RFRkFVTFRfQ1I0Cj4gPiArICAg
IG1vdiAgICAgY3I0LCBlYXgKPiA+ICsKPiA+ICsgICAgbW92ICAgICBheCwgTElORUFSX1NFTAo+
ID4gKyAgICBtb3YgICAgIGRzLCBheAo+ID4gKyAgICBtb3YgICAgIGVzLCBheAo+ID4gKyAgICBt
b3YgICAgIGZzLCBheAo+ID4gKyAgICBtb3YgICAgIGdzLCBheAo+ID4gKyAgICBtb3YgICAgIHNz
LCBheAo+ID4gKwo+ID4gKyAgICA7IHJldHVybiB0byB0aGUgTWFpbjE2Cj4gPiArICAgIE9uZVRp
bWVDYWxsUmV0IFRyYW5zaXRpb25Gcm9tUmVhbDE2VG8zMkJpdEZsYXQKPiAKPiBJcyB0aGVyZSBh
bnkgZGVzY3JpcHRpb24gb2Ygd2hhdCBPbmVUaW1lQ2FsbFJldCBpcywgYW5kIHdoeSBhIHNpbXBs
ZSBqbXAKPiB3b250IGRvPwoKVGhhdCdzIGlzIHVzZWQgdG8gcmV0dXJuIHRvIHdoZXJlIHRoZSBg
T25lVGltZUNhbGwnIG1hY3JvIGhhcyBiZWVuCnVzZWQuIEluIHRoaXMgYXNzZW1ibHksIHRoZXkg
ZG9uJ3QgdXNlIGBjYWxsJyBhbmQgYHJldCcsIGluc3RlYWQgdGhlcmUKaXMgYSBzZXQgb2YgdHdv
IG1hY3JvczoKCiVtYWNybyAgT25lVGltZUNhbGwgMQogICAgam1wICAgICAlMQolMSAlKyBPbmVU
aW1lckNhbGxSZXR1cm46CiVlbmRtYWNybwoKJW1hY3JvICBPbmVUaW1lQ2FsbFJldCAxCiAgICBq
bXAgICAgICUxICUrIE9uZVRpbWVyQ2FsbFJldHVybgolZW5kbWFjcm8KCgo+IElycmVzcGVjdGl2
ZSBvZiB0aGF0LCB5b3UncmUgbW92aW5nIHRvIGEgZnVuY3Rpb24gd2hvc2UgbmFtZSBzdWdnZXN0
cyBpdAo+IGlzIGluIDE2Yml0IG1vZGUsIHdoaWxlIHlvdSBhcmUgY3VycmVudGx5IGluIDMyYml0
IGZsYXQgbW9kZS7CoAo+IChTRUNfREVGQVVMVF9DUjAgaGFzIFBFIHNldCwgYW5kIExJTkVBUl9T
RUwgaXMgMzJiaXQgZmxhdC7CoCBUaGlzIGNsZWFybHkKPiBpc24ndCBjb3JyZWN0LCBidXQgc3Vy
ZWx5IHdlIHdhbnQgdG8gc2tpcCBhbGwgdGhlIDE2Yml0IHNldHVwLCBhcyB3ZWxsLgoKSSB0aGlu
ayBJIG5lZWQgdG8gY2hhbmdlIHRoZSBjb21tZW50LiBNYWluMTYgaXMganVzdCBhIGxhYmVsIG5h
bWUgZm9yCnNvbWV0aGluZyB0aGF0IG1ha2VzIHNldmVyYWwgImNhbGxzIiBhbmQgdHJhbnNpdGlv
biBmcm9tIDE2Yml0cyB0byAzMiBvcgo2NCBiZWZvcmUgY2FsbGluZyB0aGUgbmV4dCBtb2R1bGUg
aW4gdGhlIGZpcm13YXJlLgoKVGhhdCByZXR1cm4gc2ltcGx5IGptcCB0byB0aGUgcGFydCBvZiB0
aGUgbWFpbiB3aGVyZSB3ZSBhcmUgc3VwcG9zZWQgdG8KYmUgaW4gMzJiaXQgZmxhdCBtb2RlLgoK
VGhhbmtzIGZvciB0aGUgcmV2aWV3LAoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
