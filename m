Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B9DC282DA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 05:48:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A1C9217FA
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 05:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A1C9217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHMNN-00015t-CG; Fri, 19 Apr 2019 05:47:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bc/j=SV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hHMNM-00015o-Uy
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 05:47:52 +0000
X-Inumbo-ID: aafba85a-6266-11e9-92d7-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aafba85a-6266-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 05:47:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2AB62ADD4;
 Fri, 19 Apr 2019 05:47:50 +0000 (UTC)
To: Joe Jin <joe.jin@oracle.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <ba241f11-7681-77c9-3f9a-340d7f656d6b@suse.com>
 <26fd14a9-2e60-73ff-ce56-6f12369ac13c@oracle.com>
 <afbd29eb-25a8-edfc-b561-94264932f9eb@oracle.com>
From: Juergen Gross <jgross@suse.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jgross@suse.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <a0ec7385-bc7d-92c4-538b-cad8001fa5ef@suse.com>
Date: Fri, 19 Apr 2019 07:47:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <afbd29eb-25a8-edfc-b561-94264932f9eb@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] Question regarding swiotlb-xen in Linux kernel
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
Message-ID: <20190419054748.MIkybHsey6Wly9IytShLFDSVKpCH04JxVYQanKpbty8@z>

T24gMTkvMDQvMjAxOSAwMDozMSwgSm9lIEppbiB3cm90ZToKPiBPbiA0LzE4LzE5IDI6MDkgUE0s
IEJvcmlzIE9zdHJvdnNreSB3cm90ZToKPj4gT24gNC8xOC8xOSAzOjM2IEFNLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gSSdtIGN1cnJlbnRseSBpbnZlc3RpZ2F0aW5nIGEgcHJvYmxlbSByZWxh
dGVkIHRvIHN3aW90bGIteGVuLiBXaXRoIGEKPj4+IHNwZWNpZmljIGRyaXZlciBhIGN1c3RvbWVy
IGlzIGNhcGFibGUgdG8gdHJpZ2dlciBhIHNpdHVhdGlvbiB3aGVyZSBhCj4+PiBNRk4gaXMgbWFw
cGVkIHRvIG11bHRpcGxlIGRvbTAgUEZOcyBhdCB0aGUgc2FtZSB0aW1lLiBUaGVyZSBpcyBubwo+
Pj4gZ3Vlc3QgaW52b2x2ZWQsIHNvIHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8gZ3JhbnRzLgo+Pj4K
Pj4+IFdpdCBhIGRlYnVnIGtlcm5lbCBJIGhhdmUgbWFuYWdlZCB0byB0cmFjayB0aGUgaW5jb25z
aXN0ZW5jeSB0byBhCj4+PiBjYWxsIG9mIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNfcmVnaW9uKCkg
ZnJvbSB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KCkKPj4+IHdoZXJlIHRoZSByZWdpb24gd2Fz
IG9idmlvdXNseSBub3QgY29udGlndW91cy4KPj4+Cj4+PiB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVy
ZW50KCkgY29udGFpbnM6Cj4+Pgo+Pj4gICAgICAgICBpZiAoKChkZXZfYWRkciArIHNpemUgLSAx
IDw9IGRtYV9tYXNrKSkgfHwKPj4+ICAgICAgICAgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2Jv
dW5kYXJ5KHBoeXMsIHNpemUpKQo+Pj4gICAgICAgICAgICAgICAgIHhlbl9kZXN0cm95X2NvbnRp
Z3VvdXNfcmVnaW9uKHBoeXMsIG9yZGVyKTsKPj4+Cj4+PiBTaG91bGRuJ3QgaXQgYmUgZWl0aGVy
Ogo+Pj4KPj4+ICAgICAgICAgaWYgKCgoZGV2X2FkZHIgKyBzaXplIC0gMSA8PSBkbWFfbWFzaykp
ICYmCj4+PiAgICAgICAgICAgICAhcmFuZ2Vfc3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywg
c2l6ZSkpCj4+PiAgICAgICAgICAgICAgICAgeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24o
cGh5cywgb3JkZXIpOwo+Pgo+PiArSm9lCj4+Cj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMC9tc2cwMTkyMC5odG1sCj4+Cj4+IChU
aGUgZGlzY3Vzc2lvbiBoYXBwZW5lZCBpbgo+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTgtMTAvbXNnMDE4MTQuaHRtbCkKPj4KPj4gQW5k
IGxvb2tzIGxpa2Ugd2UgZHJvcHBlZCBpdC4gT3Igd2FzIHRoZXJlIGEgcmVhc29uIHdlIGhhdmVu
J3QgcGlja2VkIGl0IHVwPwo+IAo+IEkgcmVtZW1iZXJlZCB0aGUgY29uY2VybiB3YXMgd2hldGhl
ciBtZW1vcnkgbm90IGZyb20gWGVuLgoKVGhlIGN1cnJlbnQgY29kaW5nIGlzIHdyb25nLgoKSSBi
ZWxpZXZlIHdlIHNob3VsZCBoYXZlIGF0IGxlYXN0IGEgV0FSTl9PTkNFKCkgaW4gY2FzZQp4ZW5f
c3dpb3RsYl9mcmVlX2NvaGVyZW50KCkgaXMgYmVpbmcgY2FsbGVkIHdpdGggbm9uLWNvbnRpZ3Vv
dXMgbWVtb3J5LgpBbmQgaXQgc2hvdWxkIG5vdCBjYWxsIHhlbl9kZXN0cm95X2NvbnRpZ3VvdXNf
cmVnaW9uKCkgaW4gdGhhdCBjYXNlLgoKSm9lLCBkaWQgeW91IG9ic2VydmUgc3VjaCBjYXNlcz8g
SSdtIGFza2luZyBiZWNhdXNlIHRoZSBiYWNrdHJhY2VzIEkKaGF2ZSBnaXZlIG1lIG5vIGNsdWUg
X3doeV8gdGhlIG1lbW9yeSB3YXMgbm9uLWNvbnRpZ3VvdXMuIFRoZSBjYWxsaW5nCmZ1bmN0aW9u
IGFsbG9jYXRlZCB0aGUgbWVtb3J5IHZpYSB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudCgpIGFu
ZCB3aGVuCmZyZWVpbmcgaXQgYWdhaW4gaXQgd2FzIG5vdCBjb250aWd1b3VzLgoKQW5vdGhlciB0
b3BpYyBpcyB0aGUgcXVlc3Rpb24gd2hldGhlciB3ZSBzaG91bGQgcmVhbGx5IGNhbGwKeGVuX2Rl
c3Ryb3lfY29udGlndW91c19yZWdpb24oKSB3aGVuIGZyZWVpbmcgdGhlIG1lbW9yeSBpZiB0aGVy
ZSB3YXMgbm8KbmVlZCB0byB1c2UgeGVuX2NyZWF0ZV9jb250aWd1b3VzX3JlZ2lvbigpIHdoZW4g
YWxsb2NhdGluZyBpdC4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
