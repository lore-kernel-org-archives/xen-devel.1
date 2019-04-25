Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA3AC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:01:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD14020678
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 13:01:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD14020678
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJe0N-0004ZI-EB; Thu, 25 Apr 2019 13:01:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e2cZ=S3=citrix.com=prvs=011b50515=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hJe0M-0004ZD-Ht
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:01:34 +0000
X-Inumbo-ID: 3f0f9b32-675a-11e9-b535-2bc58d05d309
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f0f9b32-675a-11e9-b535-2bc58d05d309;
 Thu, 25 Apr 2019 13:01:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,393,1549929600"; d="scan'208";a="84385732"
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>, Ian
 Jackson <ian.jackson@citrix.com>
References: <20190418123159.GD30543@zion.uk.xensource.com>
 <5b7cd86e-e664-d5f1-9262-f7671dc3395a@citrix.com>
 <23736.33638.713410.602994@mariner.uk.xensource.com>
 <5CC1A9FD02000078002290A8@prv1-mh.provo.novell.com>
 <8b2130fd-dd48-fcdc-4f8b-0e1f6f698808@arm.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <bf829a78-cb48-a123-85d1-2a85ece4a861@citrix.com>
Date: Thu, 25 Apr 2019 14:01:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <8b2130fd-dd48-fcdc-4f8b-0e1f6f698808@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen project CI systems and committer workflow
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, committers@xenproject.org,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425130128.ezTBranesu7j3T8-QbnoT2SUmdVBZ9gV43d0kcPsVFQ@z>

T24gNC8yNS8xOSAxOjUzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+IE9u
IDI1LzA0LzIwMTkgMTM6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxOC4wNC4xOSBh
dCAxNjowMiwgPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gQW5kcmV3IENvb3Bl
ciB3cml0ZXMgKCJSZTogWGVuIHByb2plY3QgQ0kgc3lzdGVtcyBhbmQgY29tbWl0dGVyCj4+PiB3
b3JrZmxvdyIpOgo+Pj4+IFdoaWxlIGV2ZXJ5dGhpbmcgcHJlc2VudGVkIGhlcmUgaXMgZmluZSB0
byBkbyBhcyBhIG1hdHRlciBvZiBwb2xpY3ksCj4+Pj4gdGhlCj4+Pj4gY29tbWl0dGVycyBzdGls
bCBuZWVkIHRvIHJldGFpbiB0aGUgYWJpbGl0eSB0byBhY3R1YWxseSBwdXNoCj4+Pj4gZGlyZWN0
bHkgdG8KPj4+PiB0aGUgc3RhZ2luZyBicmFuY2hlcyBvbiB4ZW4uZ2l0Cj4+Pgo+Pj4gV2h5ID8K
Pj4+Cj4+PiBJbiBwYXJ0aWN1bGFyLCB0aGlzIHNlZW1zIHRvIHByZXN1cHBvc2UgdGhhdCB0aGVz
ZSAic3RhZ2luZyIgYnJhbmNoZXMKPj4+IGNvbnRpbnVlIHRvIGV4aXN0Lgo+Pj4KPj4+IE9uZSBv
ZiBvdXIgc3RyYW5nZSBwcmFjdGljZXMgaXMgdGhhdCB3ZSBwdXNoIHRoaW5ncyB0byBhIG5vbi1y
ZXdpbmRpbmcKPj4+IGJyYW5jaCBiZWZvcmUgdGhleSBoYXZlIGJlZW4gdGVzdGVkLsKgIE5vdywg
T0ssIHdlIGhhdmUgYmVlbiBkb2luZyB0aGF0Cj4+PiBmb3Igb3ZlciBhIGRlY2FkZSAtIHNpbmNl
IGJlZm9yZSBwZW9wbGUgcmVhbGx5IGludmVudGVkIHRoZSBtb2Rlcm4KPj4+IGNvbmNlcHQgb2Yg
IkNJIiAtIGJ1dCB0aGF0IGRvZXNuJ3QgbWFrZSBpdCBzZW5zaWJsZS4KPj4KPj4gTm93IHRoZSBx
dWVzdGlvbiBvZiBjb3Vyc2UgaXMgLSB3aHkgZG8geW91IGNvbnNpZGVyIHRoaXMgcHJhY3RpY2UK
Pj4gInN0cmFuZ2UiPyBBbmQgd2hhdCBkbyB5b3UgbWVhbiBieSAiYmVmb3JlIHRoZXkgaGF2ZSBi
ZWVuCj4+IHRlc3RlZCI/IEFueSBzdWJtaXR0ZXIgc2hvdWxkIGhhdmUgdGVzdGVkIHRoZWlyIHBh
dGNoZXMuIFllcywgbm90Cj4+IGV2ZXJ5b25lIHRlc3RzIGFsbCBwb3NzaWJsZSAoYmFzaWMpIGNv
bmZpZ3VyYXRpb25zLCBidXQgd2Ugc3BvdAo+PiBzdWNoIGlzc3VlcyBpbiByZXZpZXcgbW9yZSBv
ZnRlbiB0aGFuIHRoZXkgc2xpcCB0aHJvdWdoLCBJIHRoaW5rLgo+IAo+IEl0IGlzIGZhaXJseSBj
b21tb24gdG8gc2VlIGJyZWFrYWdlIG9uIEFybSBiZWNhdXNlIGNoYW5nZXMgd2FzIG9ubHkKPiBj
b21waWxlZCBvbiB4ODYuIFRoZSBtb3N0IGNvbW1vbiBhcmd1bWVudCBpcyAiSSBkb24ndCBoYXZl
IHNldHVwIHRvCj4gYnVpbGQgQXJtIi4KPiAKPiBUaGUgQ0kgd291bGQgYWxsb3cgdXMgdG8gdGVz
dCBvbiBldmVyeSBhcmNoLCBkaWZmZXJlbnQgdmFyaWF0aW9uIG9mCj4gLmNvbmZpZyAoYW5kIHBv
c3NpYmx5IGNvbXBpbGVyKS4KPiAKPj4gQW5kIEkgZG9uJ3QgZXhwZWN0IENJIHdpbGwgY29tZSBh
bnl3aGVyZSBuZWFyIHRlc3RpbmcgYWxsCj4+IF9wb3NzaWJsZV8gY29uZmlndXJhdGlvbnMsIGku
ZS4gdGhlIHJpc2sgb2Ygc3VidGxlIGJyZWFrYWdlIHdvbid0Cj4+IGdldCBlbGltaW5hdGVkIGFs
dG9nZXRoZXIgYW55d2F5Lgo+IAo+IE5vdGhpbmcgaXMgZnVsbHkgYnVsbGV0LXByb29mLCBidXQg
dGhpcyBpcyBhbiBpbXByb3ZlbWVudCBvdmVyIG1hbnVhbAo+IHRlc3Rpbmcgb24gbW9zdCBvZiB0
aGUgYnVpbGQgY29uZmlndXJhdGlvbiB0b2RheS4gVGhlIENJIGFjdHVhbGx5IHByb3ZlZAo+IHRo
ZSB1c2VmdWxuZXNzIGJ5IGNhdGNoaW5nIGJ1aWxkIGJ1ZyBpbiByYW5kb20gLmNvbmZpZyB0aGUg
bGFzdCBmZXcgbW9udGhzLgoKRnVydGhlcm1vcmUsIHRoZSBsb25nLXRlcm0gZ29hbCBpcyB0byBl
eHRlbmQgdGhlIGJvdW5kYXJ5IG9mIHRoaW5ncyB0aGF0CndlIHRlc3QsIHN1Y2ggdGhhdCB3aGF0
IGdldHMgdGVzdGVkIGlzIGZhciB3aWRlciB0aGFuIGl0IHdvdWxkIGV2ZW4gYmUKcHJhY3RpY2Fs
IGZvciBzdWJtaXR0ZXJzIHRvIHRlc3QuICAoVGhpcyB3YXMgcGFydGlhbGx5IHRoZSBnb2FsIG9m
IHRoZQpTVVBQT1JULm1kLCB0byBoYXZlIGEgcGxhY2UgdG8gZW51bWVyYXRlIHRlc3Rpbmcgc3Rh
dHVzOyBhbmQgYWxzbwpwYXJ0aWFsbHkgdGhlIGdvYWwgb2YgdGhlIG9zc3Rlc3Qgc3RyZXRjaCB1
cGdyYWRlLCB0byBlbmFibGUgb3NzdGVzdCB0bwpwcm92aWRlIGdjb3YgcmVwb3J0cyB0byBoaWdo
bGlnaHQgdGVzdGluZyBkZWZpY2llbmNpZXMuKQoKQ29tcHV0ZXJzIGFyZSBnb29kIGF0IGJvcmlu
ZywgcmVwZXRpdGl2ZSB0YXNrcyBsaWtlIGV4dGVuc2l2ZSB0ZXN0aW5nOwpodW1hbnMgYXJlIGJh
ZCBhdCBpdC4gIFRoZXJlJ3Mgbm8gcmVhc29uIHRvIG1ha2UgaHVtYW5zIGRvIHdvcmsgdGhhdCBh
CmNvbXB1dGVyIGNhbiBkbyBiZXR0ZXIuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
