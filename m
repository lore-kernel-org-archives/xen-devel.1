Return-Path: <SRS0=MgWH=SZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35683C10F03
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 21:59:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1D4120674
	for <xen-devel@archiver.kernel.org>; Tue, 23 Apr 2019 21:59:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="klJ8y8Nd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1D4120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJ3Rg-0002Rw-6P; Tue, 23 Apr 2019 21:59:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1za8=SZ=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hJ3Re-0002Rr-14
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2019 21:59:18 +0000
X-Inumbo-ID: 06dac702-6613-11e9-a0f6-43980caf8b0b
Received: from mail4.protonmail.ch (unknown [185.70.40.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06dac702-6613-11e9-a0f6-43980caf8b0b;
 Tue, 23 Apr 2019 21:59:12 +0000 (UTC)
Date: Tue, 23 Apr 2019 21:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556056750;
 bh=0CiUwA9+cLcIgjz9J+zJXuyRlvRRb4AkBPXze6EFQpw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=klJ8y8Ndl4ONaxm0Z5dBvWjDaIGpnbSukI9xtVgjJdFTCQzpwwqvFhKHKZkTUmrfw
 sk7+yIANZOxUTqo/FJziBNj3YXUhFuWlJAat8JsbTPw9L7FTfBtgiWszw1GB7WSZz7
 PqkD7xBxVGds9A4RmnuQ9XW7ulHx31VfHX12nIa0=
To: Andrew Cooper <andrew.cooper3@citrix.com>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID:
 <JtM5mkq2NGVy1FZByrNH__YS8zpSo5mWd7ksop9Ns7mUipPKalor78NIFupEwb6a_vjRT5QxTSepTr_o3wqnPuNXL9BLZn5-EXCJ8pezVIQ=@protonmail.com>
In-Reply-To: <a04c5946-8c2a-72bd-0011-3cb53fd927be@citrix.com>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <a04c5946-8c2a-72bd-0011-3cb53fd927be@citrix.com>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190423215907.nv68kv9WAxVx0da4gEX3p0Q7CBCURMStDnTvWr-BB4Y@z>

T24gTW9uZGF5IDIyIEFwcmlsIDIwMTkgMTI6MjgsIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgoKPiBPbiAyMS8wNC8yMDE5IDIzOjI2LCBNYXRoaWV1IFRh
cnJhbCB3cm90ZToKPgo+IEFuc3dlcmluZyBvdXQgb2Ygb3JkZXIuCj4KPiA+IEkgZGlzY3Vzc2Vk
IHRoaXMgYnVnIG9uIElSQyB3aXRoIGFuZHlocHAsIHdobyBjb252aW5jZWQgbWUgdG8gbW92ZSB0
aGUgZGlzY3Vzc2lvbiBvbiB0aGUgbWFpbGluZyBsaXN0Lgo+ID4gQXBwYXJlbnRseSB0aGUgc2lu
Z2xlc3RlcHBpbmcgaW4gWGVuIHdhcyBpbiBhIHBvb3IgcXVhbGl0eSBzdGF0ZSBiZWNhdXNlIG9m
IG11bHRpcGxlIGxheWVycyBvZiByZWZhY3RvcmluZy4KPgo+IFdoYXQgSSBzYWlkIHdhcyB0aGF0
IHg4NiBpcyBhIGNvbXBsZXRlIG1lc3MuwqAgVmFyaW91cyBhc3BlY3RzIG9mIGRlYnVnCj4gYmVo
YXZpb3VyIGFyZW4ndCBldmVuIGRvY3VtZW50ZWQsIGFuZCBoYXZlIGhhZCB0byBiZSByZXZlcnNl
ZCBlbmdpbmVlcmVkCj4gYWZ0ZXIgZmluZGluZyBzZWN1cml0eSB2dWxuZXJhYmlsaXRpZXMgd2l0
aCBob3cgc29mdHdhcmUgaGFuZGxlcyB0aGVtCj4gKGNhdXNlZCBieSBhIGxhY2sgb2YgZG9jdW1l
bnRhdGlvbikuCgpNeSBiYWQsIGkgdW5kZXJzdG9vZCB0aGF0IGkgd2FzIHJlbGF0ZWQgdG8gWGVu
J3MgY29kZSwgbm90IGp1c3QgeDg2LgoKPiA+IEknbSBydW5uaW5nIG9uIFhlbiBwYWNrYWdlZCBi
eSBGZWRvcmEgMjk6IDQuMTEuMSwgaW4gYSBuZXN0ZWQgdmlydCBlbnZpcm9ubWVudCBvbiB0b3Ag
b2YgS1ZNLgo+Cj4gSSBkaWRuJ3QgcmVhbGlzZSB5b3Ugd2VyZSBuZXN0ZWQgb24gdG9wIG9mIEtW
TS7CoCBUaGF0IGRlZmluaXRlbHkgaXNuJ3QKPiBoZWxwaW5nIHRoaW5ncywgYW5kIHRoZXJlIGlz
IGFuIGVxdWFsIGNoYW5jZSB0aGF0IHlvdSd2ZSBoaXQgYSBuZXN0ZWQKPiB2aXJ0IGJ1ZyBpbiBL
Vk0uCj4KPiBQbGVhc2UgdHJ5IGFuZCByZXByb2R1Y2UgaXQgd2l0aG91dCBLVk0sIHRvIHJ1bGUg
b3V0IHNvbWUgb2YgdGhlIGNvbXBsZXhpdHkuCgpJIHdvdWxkIGxpa2UgdG8sIGJ1dCBHcnViIGNh
bm5vdCBib290IG9uIFhlbidzIGtlcm5lbCBvbiBteSBtYWNoaW5lLCBpIG5lZWQgdG8gcnVuIGl0
IGluIGEgVk0uCgpJJ20gaGl0dGluZyBhIGJ1ZyBpbiBGZWRvcmEgd2hlcmUgbW9kdWxlMi5tb2Qg
YW5kIG11bHRpYm9vdDIubW9kIGFyZSBhYnNlbnQ6Cmh0dHBzOi8vYnVnemlsbGEucmVkaGF0LmNv
bS9zaG93X2J1Zy5jZ2k/aWQ9MTQ4NjAwMgoKQWxzbywgaXQncyBub3QgdGhlIGZpcnN0IHRpbWUg
aSdtIGhhdmluZyB0aGlzIGJ1ZywKSSB3YXMgYWxyZWFkeSB3b3JraW5nIG9uIFhlbiA2IG1vbnRo
cyBiZWZvcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9saWJ2bWkvbGlidm1pL2lzc3Vlcy82MzYKCgo+
ID4gVGhlIGZ1bm55IHRoaW5nIGlzIHRoYXQgaXQncyBhbHdheXMgYXQgdGhlIHNhbWUgaW5zdHJ1
Y3Rpb24gdGhhdCBpdCBmYWlscywgdGhlIDEwNnRoIHNpbmdsZXN0ZXAsCj4gPiBhdCAweDgwNmQz
MmRjOgo+ID4gWzB4N2M5MGU1MTRdPiBzIDB4ODA2ZDMyZGMKPiA+IFsweDgwNmQzMmRjXT4gcGQg
MTAKPiA+IDB4ODA2ZDMyZGMgODkwZDgwMDBmZWZmIG1vdiBkd29yZCBbMHhmZmZlMDA4MF0sIGVj
eAo+Cj4gVGhpcyBpcyBhIHJlYWQgb2YgdGhlIEFQSUMgVFBSLCB3aGljaCBpcyB2ZXJ5IGNvbW1v
bmx5IGFuIG9wZXJhdGlvbgo+IGFjY2VsZXJhdGVkIGJ5IGhhcmR3YXJlIChiZWNhdXNlIHdpdGhv
dXQgaXQsIHZpcnR1YWxpc2luZyB3aW5kb3dzIFhQIGlzCj4gZXhjZWVkaW5nbHkgc2xvdykuCj4K
PiBXaGF0IGlzIHlvdXIgQ1BVLCBhbmQgaG93IGV4YWN0bHkgYXJlIHlvdSB0cnlpbmcgdG8gc2lu
Z2xlc3RlcC7CoCBJcyBpdAo+IHdpdGggTVRGLCBvciB1c2luZyB0aGUgdHJhcCBmbGFnIGluc2lk
ZSB0aGUgZ3Vlc3Q/CgpNeSBDUFUgaXMgYW4gSW50ZWwgaTctODc1MEguCkknbSB1c2luZyB0aGUg
bGlidm1pIEFQSSwgd2hpY2ggaXMgZW5hYmxpbmcgdGhlIE1URiBmbGFnIHRvIHNpbmdsZXN0ZXAs
IGlmIGkganVkZ2UgYnkgdGhlIGRlYnVnIGxvZ3MuCgpUaGFua3MuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
