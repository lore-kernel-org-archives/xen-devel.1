Return-Path: <SRS0=3Sku=TR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7E5C04AB4
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 13:24:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5DAB20833
	for <xen-devel@archiver.kernel.org>; Fri, 17 May 2019 13:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5DAB20833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRcqT-0003jH-W8; Fri, 17 May 2019 13:24:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dmq+=TR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hRcqT-0003jC-8s
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 13:24:21 +0000
X-Inumbo-ID: 1205e96c-78a7-11e9-ab38-cb39fdba6aa0
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1205e96c-78a7-11e9-ab38-cb39fdba6aa0;
 Fri, 17 May 2019 13:24:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B856ADE3;
 Fri, 17 May 2019 13:24:16 +0000 (UTC)
To: Jan Beulich <JBeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
References: <20190508113132.19198-1-jgross@suse.com>
 <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <d46ce182-44e5-dab8-37ae-a9e920120e5f@suse.com>
Date: Fri, 17 May 2019 15:24:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDEB48702000078002301B4@prv1-mh.provo.novell.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Ping: [PATCH] xen/sched: fix csched2_deinit_pdata()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190517132414.lnHrhBK7OSDwhDBwZkBp9ZHTNpgVbo2FcewD8jnIMEs@z>

T24gMTcvMDUvMjAxOSAxNToxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDguMDUuMTkg
YXQgMTM6MzEsIDxqZ3Jvc3NAc3VzZS5jb20+IHdyb3RlOgo+PiBDb21taXQgNzUzYmE0M2Q2ZDE2
ZTY4OCAoInhlbi9zY2hlZDogZml4IGNyZWRpdDIgc210IGlkbGUgaGFuZGxpbmciKQo+PiBpbnRy
b2R1Y2VkIGEgcmVncmVzc2lvbiB3aGVuIHN3aXRjaGluZyBjcHVzIGJldHdlZW4gY3B1cG9vbHMu
Cj4+Cj4+IFdoZW4gYXNzaWduaW5nIGEgY3B1IHRvIGEgY3B1cG9vbCB3aXRoIGNyZWRpdDIgYmVp
bmcgdGhlIGRlZmF1bHQKPj4gc2NoZWR1bGVyIGNzY2hlZDJfZGVpbml0X3BkYXRhKCkgaXMgY2Fs
bGVkIGZvciB0aGUgY3JlZGl0MiBwcml2YXRlIGRhdGEKPj4gYWZ0ZXIgdGhlIG5ldyBzY2hlZHVs
ZXIncyBwcml2YXRlIGRhdGEgaGFzIGJlZW4gaG9va2VkIHRvIHRoZSBwZXItY3B1Cj4+IHNjaGVk
dWxlciBkYXRhLiBVbmZvcnR1bmF0ZWx5IGNzY2hlZDJfZGVpbml0X3BkYXRhKCkgd2lsbCBjeWNs
ZSB0aHJvdWdoCj4+IGFsbCBwZXItY3B1IHNjaGVkdWxlciBhcmVhcyBpdCBrbm93cyBvZiBmb3Ig
cmVtb3ZpbmcgdGhlIGNwdSBmcm9tIHRoZQo+PiByZXNwZWN0aXZlIHNpYmxpbmcgbWFza3MgaW5j
bHVkaW5nIHRoZSBhcmVhIG9mIHRoZSBqdXN0IG1vdmVkIGNwdS4gVGhpcwo+PiB3aWxsIChkZXBl
bmRpbmcgb24gdGhlIG5ldyBzY2hlZHVsZXIpIGVpdGhlciBjbG9iYmVyIHRoZSBkYXRhIG9mIHRo
ZQo+PiBuZXcgc2NoZWR1bGVyIG9yIGluIGNhc2Ugb2Ygc2NoZWRfcnQgbGVhZCB0byBhIGNyYXNo
Lgo+Pgo+PiBBdm9pZCB0aGF0IGJ5IHJlbW92aW5nIHRoZSBjcHUgZnJvbSB0aGUgbGlzdCBvZiBh
Y3RpdmUgY3B1cyBpbiBjcmVkaXQyCj4+IGRhdGEgZmlyc3QuCj4+Cj4+IFRoZSBvcHBvc2l0ZSBw
cm9ibGVtIGlzIG9jY3VycmluZyB3aGVuIHJlbW92aW5nIGEgY3B1IGZyb20gYSBjcHVwb29sOgo+
PiBpbml0X3BkYXRhKCkgb2YgY3JlZGl0MiB3aWxsIGFjY2VzcyB0aGUgcGVyLWNwdSBkYXRhIG9m
IHRoZSBvbGQKPj4gc2NoZWR1bGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gCj4gTWF5IEkgYXNrIHdoYXQgdGhlIGRpc3Bvc2l0aW9uIG9m
IHRoaXMgaXM/IEkndmUgbm90aWNlZCB0b28gbGF0ZQo+IHRoYXQgSSd2ZSBiYWNrcG9ydGVkIHRo
ZSBjb21taXQgYmVpbmcgZml4ZWQgaGVyZSB3aXRob3V0Cj4gd2FpdGluZyBmb3IgdGhpcyBmaXgg
dG8gZ28gaW4uIEknZCBwcmVmZXIgdGhlIHN0YWJsZSB0cmVlcywgaW4KPiBwYXJ0aWN1bGFyIDQu
MTEgZm9yIHRoZSBpbXBlbmRpbmcgNC4xMS4yIHJlbGVhc2UsIHRvIGJlIGFibGUKPiB0byBwaWNr
IHRoaXMgdXAgc29vbi4KCkRhcmlvIGFscmVhZHkgZ2F2ZSBoaXMgUmV2aWV3ZWQtYnk6CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
