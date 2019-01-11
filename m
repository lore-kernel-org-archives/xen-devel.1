From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH v8 06/17] libxl_qmp: Implementation of
 libxl__ev_qmp_*
Date: Fri, 11 Jan 2019 12:21:54 +0000
Message-ID: <23608.35426.55498.894008@mariner.uk.xensource.com>
References: <20190104153056.19138-1-anthony.perard@citrix.com>
 <20190104153056.19138-7-anthony.perard@citrix.com>
 <23608.34479.976461.767202@mariner.uk.xensource.com>
 <20190111121637.GL1508@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ayr2=PT=citrix.com=prvs=9077728fb=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1ghvpK-0001Q1-2J
 for xen-devel@lists.xenproject.org; Fri, 11 Jan 2019 12:22:18 +0000
In-Reply-To: <20190111121637.GL1508@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QW50aG9ueSBQRVJBUkQgd3JpdGVzICgiUmU6IFtQQVRDSCB2OCAwNi8xN10gbGlieGxfcW1wOiBJ
bXBsZW1lbnRhdGlvbiBvZiBsaWJ4bF9fZXZfcW1wXyoiKToKPiBPbiBGcmksIEphbiAxMSwgMjAx
OSBhdCAxMjowNjowN1BNICswMDAwLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IERvZXNuJ3QgdGhp
cyB3YW50IHRvIGJlCj4gPiAgICsgICAgICAgIGFzc2VydChyID4gMCAmJiByIDw9IG1heF93cml0
ZSk7Cj4gCj4gWWVzLCBJIHRoaW5rIHRoYXQgd291bGQgYmUgZmluZS4gSSBndWVzcyB0aGF0IHdv
dWxkIGNhdGNoIGlzc3VlIHdoZXJlCj4gbWF4X3dyaXRlIGlzIDAgKHNvIHRyeWluZyB0byB3cml0
ZSAwIGJ5dGVzKS4KCkkgd2FzIHRoaW5raW5nIG9mIHNpdHVhdGlvbnMgd2hlcmUgdGhlIG9wZW4t
ZmlsZSByZWZlcnJlZCB0byBieSBmZCBoYXMKYmVlbiBwdXQgaW50byBhIGZ1bm55IHN0YXRlIHdo
aWNoIGxlYWRzIHRvIHdyaXRlKCkgcmV0dXJuaW5nIDAuCgpJYW4uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
