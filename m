From: Sinan Kaya <okaya@kernel.org>
Subject: Re: [PATCH V3 1/2] Drivers/PCI: Export pcie_has_flr()
 interface
Date: Sun, 9 Sep 2018 22:33:02 -0400
Message-ID: <9ffe43d2-a44b-974c-85c9-9923d71c5dba__27731.5663443462$1536558004$gmane$org@kernel.org>
References: <20171207222145.9769-1-Govinda.Tatti@Oracle.COM>
 <20171207222145.9769-2-Govinda.Tatti@Oracle.COM>
 <20171208202424.GC12367@bhelgaas-glaptop.roam.corp.google.com>
 <426eeeab-0dcd-8de3-9c5f-a166acf2c130@Oracle.COM>
 <20171212005919.GB30595@bhelgaas-glaptop.roam.corp.google.com>
 <49956aaf-5fd5-939d-5fc7-231ffdb98b70@Oracle.COM>
 <20171213212420.GH30595@bhelgaas-glaptop.roam.corp.google.com>
 <fea075cf-fe6f-0d0b-11e4-4279fbfc280a@Oracle.COM>
 <20171215181801.GU30595@bhelgaas-glaptop.roam.corp.google.com>
 <20171218122629.GA18423@infradead.org> <20180909185944.GC18222@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=mz+s=ly=kernel.org=okaya@srs-us1.protection.inumbo.net>)
 id 1fzC0h-0001Na-GU
 for xen-devel@lists.xenproject.org; Mon, 10 Sep 2018 02:33:07 +0000
In-Reply-To: <20180909185944.GC18222@reaktio.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?B?UGFzaSBLw6Rya2vDpGluZW4=?= <pasik@iki.fi>, Christoph Hellwig <hch@infradead.org>
Cc: jgross@suse.com, Satanand Burla <satananda.burla@caviumnetworks.com>, Govinda Tatti <Govinda.Tatti@Oracle.COM>, Herbert Xu <herbert@gondor.apana.org.au>, linux-pci@vger.kernel.org, Russell Currey <ruscur@russell.cc>, linux-kernel@vger.kernel.org, Derek Chickles <derek.chickles@caviumnetworks.com>, Sinan Kaya <okaya@codeaurora.org>, Srikanth Jampala <Jampala.Srikanth@cavium.com>, Bjorn Helgaas <helgaas@kernel.org>, JBeulich@suse.com, Felix Manlunas <felix.manlunas@caviumnetworks.com>, bhelgaas@google.com, xen-devel@lists.xenproject.org, boris.ostrovsky@Oracle.COM, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gOS85LzIwMTggMjo1OSBQTSwgUGFzaSBLw6Rya2vDpGluZW4gd3JvdGU6Cj4gSSBub3RpY2Vk
IHBjaWVfaGFzX2ZscigpIGhhcyBiZWVuIHJlY2VudGx5IGV4cG9ydGVkIGluIHVwc3RyZWFtIExp
bnV4Ogo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC9jb21taXQvP2lkPTJkMjkxN2Y3NzQ3ODA1YTFmNDE4ODY3MmYzMDhk
ODJhOGJhMDE3MDAKPiAKPiBBcmUgdGhlcmUgbW9yZSBjaGFuZ2VzIC8gY2xlYW51cHMgcGxhbm5l
ZCB0byB0aGVzZSBpbnRlcmZhY2VzLCBhcyBtZW50aW9uZWQgbGFzdCB5ZWFyPwo+IAo+IChjb250
ZXh0OiB4ZW4tcGNpYmFjayByZXNldC9kb19mbHIgZmVhdHVyZXMgdXBzdHJlYW1pbmcsIHdoaWNo
IGtpbmQgb2Ygc3RhbGxlZCBsYXN0IHllYXIgd2hlbiBwY2llX2hhc19mbHIoKSB3YXNuJ3QgZXhw
b3J0ZWQgYXQgdGhlIHRpbWUpCgpFeHBvcnRpbmcgcGNpZV9oYXNfZmxyKCkgaXMgYSB2ZXJ5IHNp
bXBsZSBjaGFuZ2Ugd2hpY2ggY291bGQgaGF2ZSBiZWVuIGRvbmUKYnkgdGhlIFhFTiBwb3J0aW5n
IGVmZm9ydC4KCk1heWJlLCB0aGUgcmlnaHQgcXVlc3Rpb24gaXMgd2hhdCBpcyBzbyBzcGVjaWFs
IGFib3V0IFhFTiByZXNldD8KCldoYXQgZmVhdHVyZSBQQ0kgY29yZSBpcyBtaXNzaW5nIHRvIHN1
cHBvcnQgWEVOIEZMUiByZXNldCB0aGF0IGNhdXNlZAp0aGUgZWZmb3J0IHRvIHN0YWxsPwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
