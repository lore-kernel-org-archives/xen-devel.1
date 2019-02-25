From: Oleksandr Andrushchenko <andr2000@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Mon, 25 Feb 2019 14:32:56 +0200
Message-ID: <f49645df-de60-fcc7-eeff-9b1d849ca6de@gmail.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <f0266920-d8fc-a215-25a1-0a3da777b0a0@gmail.com>
 <ecc8d855-e3f7-9e19-b8d6-ee9a2685ade0@arm.com>
 <9398ea9e-d49f-7595-7b15-5f4524e43a72@gmail.com>
 <5C73DB8F0200007800219CF4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jrRo=RA=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1gyFRO-0000um-8W
 for xen-devel@lists.xenproject.org; Mon, 25 Feb 2019 12:33:02 +0000
Received: by mail-lf1-x142.google.com with SMTP id z196so6029625lff.4
 for <xen-devel@lists.xenproject.org>; Mon, 25 Feb 2019 04:33:00 -0800 (PST)
In-Reply-To: <5C73DB8F0200007800219CF4@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMi8yNS8xOSAyOjExIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyNS4wMi4xOSBh
dCAxMjo0OSwgPGFuZHIyMDAwQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IEkgYW0gbm90IGRlZmVuZGlu
ZyBCVUcoKSBpbiBhbnkgd2F5IHdoaWNoIGlzIG9idmlvdXNseSBhIG5vLWdvLgo+PiBJIGFtIGp1
c3QgdHJ5aW5nIHRvIHNheSB0aGF0IEJVRygpIHVzYWdlIGluIHRoZSBleGlzdGluZyBjb2RlIG5l
ZWRzIHRvIGJlCj4+IGZpeGVkIGZpcnN0LiBPbmNlIGRvbmUsIHdlIGNhbiB0aGVuIG1vdmUgdG8g
ImRlZmF1bHQiIHcvbyBCVUcoKQo+IFdoeT8gQSBmaXJzdCBzdGVwIHRvIG5vdCBtYWtlIHRoaW5n
cyB3b3JzZSBpcyB0byBub3QgaW50cm9kdWNlCj4gZnVydGhlciBiYWRuZXNzLiBDbGVhbmluZyB1
cCBleGlzdGluZyBpc3N1ZXMgaXMgYW4gaW5kZXBlbmRlbnQKPiAoYW5kIHBlcmhhcHMgcGFyYWxs
ZWwpIGVmZm9ydC4KVGhhdCB3YXMgZXhhY3RseSBteSBwb2ludCBhbmQgSSBoYXZlIGFscmVhZHkg
YWdyZWVkIG9uIHRoYXQKPiBKYW4KPgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
