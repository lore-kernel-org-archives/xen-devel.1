From: Julien Grall <julien.grall@arm.com>
Subject: Re: [RFC PATCH] xen/arm: Add MVEBU UART driver for
	Armada 3700 SoC
Date: Tue, 13 Mar 2018 16:07:21 +0000
Message-ID: <f6f96fc3-876f-26e3-31ea-17c780c06bda@arm.com>
References: <1520700252-19385-1-git-send-email-amittomer25@gmail.com>
 <1520700252-19385-2-git-send-email-amittomer25@gmail.com>
 <00ed1948-9c91-0216-6113-d8482e018ed7@arm.com>
 <CABHD4K-7iOrLwJZTroV=fpB12oJZu8etmQY3nt5ETRcoa66RzQ@mail.gmail.com>
 <b15cf813-6612-3b2a-bf47-951ffb04f2b5@arm.com>
 <CABHD4K8XpGV=_+Pz85Hmumh3m96mQDv3xc3iUcypCQj-eXeEfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=l4at=gd=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1evmSZ-0004gG-4y
 for xen-devel@lists.xenproject.org; Tue, 13 Mar 2018 16:07:31 +0000
In-Reply-To: <CABHD4K8XpGV=_+Pz85Hmumh3m96mQDv3xc3iUcypCQj-eXeEfQ@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andre Przywara <andre.przywara@arm.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8wMy8xOCAxNzozMywgQW1pdCBUb21lciB3cm90ZToKPiBIaSwKCkhpLAoKPiAKPj4g
VGhpcyBpcyBxdWl0ZSB1c2VmdWwgdG8gZ2V0IG91dHB1dCB3aXRob3V0IGFueSBzZXJpYWwgZHJp
dmVyLiBJIGFtIHF1aXRlCj4+IGltcHJlc3NlZCB5b3UgbWFuYWdlZCB0byBkZWJ1ZyB5b3VyIHNl
cmlhbCBkcml2ZXIgd2l0aG91dCBpdCA6KS4KPiAKPiBBY3R1YWxseSwgIHdlIGhhdmUgZWFybHlj
b249eGVuYm9vdChzdWdnZXN0ZWQgYnkgQW5kcmUpIGVuYWJsZWQgaW4KPiBEb20wIGJvb3Rhcmdz
IGFuZCBpdCBhbGxvd2VkIHVzIHRvCj4gZGVidWcgWEVOIGJvb3QgZnVydGhlci4KPiAKPiBJIGFt
IHdvbmRlcmluZyBpZiBlYWx5Y29uIGludGVyZmFjZSBjYW4gYmUgdXNlZCBpbiBhYnNlbmNlIG9m
ID4gZWFybHlwcmludGsgZG9pbmcgc2FtZSB3b3JrPwoKZWFybHljb249eGVuYm9vdCBlbmFibGVz
IHRoZSBlYXJseSBjb25zb2xlIGZvciB0aGUgaGFyZHdhcmUgZG9tYWluIG9ubHkuIApXaGF0IEkg
bWVhbnQgaXMgaGF2aW5nIGVhcmx5cHJpbnRrIGZvciBYZW4gKHNlZSBDT05GSUdfRUFSTFlfUFJJ
TlRLKS4gClRoaXMgaXMgdXNlZCBmb3IgbG93LWxldmVsIGRlYnVnIHdoZW4gYm9vdGluZyB0aGUg
aHlwZXJ2aXNvci4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
