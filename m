From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] xen netback: add fault injection
 facility
Date: Fri, 20 Apr 2018 15:00:28 +0200
Message-ID: <5c4e4f3d-03ce-b517-d451-3229c0d542c0__20980.9049535126$1524229165$gmane$org@suse.com>
References: <20180420104603.17823.31095.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
 <20180420104731.17823.97617.stgit@dev-dsk-staskins-1a-ca5afbf2.eu-west-1.amazon.com>
 <e33c055c-5a5a-2329-7a2e-faf715bb95fc@suse.com>
 <909fd3b2-19e8-8c13-6ede-cfd6051c6f1d@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=7tp6=hj=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f9VeV-0000e3-77
 for xen-devel@lists.xenproject.org; Fri, 20 Apr 2018 13:00:35 +0000
In-Reply-To: <909fd3b2-19e8-8c13-6ede-cfd6051c6f1d@amazon.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: staskins@amazon.com
Cc: jakub.kicinski@netronome.com, mcroce@redhat.com, hpa@zytor.com, boris.ostrovsky@oracle.com, daniel@iogearbox.net, x86@kernel.org, mingo@redhat.com, xen-devel@lists.xenproject.org, linux-block@vger.kernel.org, paul.durrant@citrix.com, stefanha@redhat.com, dsa@cumulusnetworks.com, tglx@linutronix.de, ggarcia@abra.uab.cat, axboe@kernel.dk, amir.jer.levy@intel.com, wei.liu2@citrix.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, dwmw@amazon.co.uk, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjAvMDQvMTggMTQ6NTIsIHN0YXNraW5zQGFtYXpvbi5jb20gd3JvdGU6Cj4gT24gMDQvMjAv
MTggMTM6MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDIwLzA0LzE4IDEyOjQ3LCBTdGFu
aXNsYXYgS2luc2J1cnNraWkgd3JvdGU6Cj4+PiArwqDCoMKgIGZvciAoZmkgPSAwOyBmaSA8IFhF
TlZJRl9GSV9NQVg7IGZpKyspIHsKPj4+ICvCoMKgwqDCoMKgwqDCoCB2ZmktPmZhdWx0c1tmaV0g
PSB4ZW5fZmlfZGlyX2FkZCh2ZmktPmRpciwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgeGVudmlmX2ZpX25hbWVzW2ZpXSk7Cj4+IEhvdyBkb2VzIHRoaXMgd29yaz8geGVudmlm
X2ZpX25hbWVzW10gaXMgYW4gZW1wdHkgYXJyYXkgYW5kIHRoaXMgaXMgdGhlCj4+IG9ubHkgcmVm
ZXJlbmNlIHRvIGl0LiBXaG8gaXMgYWxsb2NhdGluZyB0aGUgbWVtb3J5IGZvciB0aGF0IGFycmF5
Pwo+IAo+IFdlbGwsIGl0IHdvcmtzIGluIHRoZSB3YXkgb25lIGFkZHMgYSB2YXIgdG8gZW51bSAo
d2hpY2ggaXMgdXNlZCBhcyBhIGtleQo+IGxhdGVyKSBhbmQgYSBjb3JyZXNwb25kaW5nIHN0cmlu
ZyBpbnRvIHRoZSBhcnJheSAod2hpY2ggaXMgdXNlZCBhcyBhCj4gbmFtZSBmb3IgdGhlIGZhdWx0
IGRpcmVjdG9yeSBpbiBzeXNmcykuCgpUaGVuIHlvdSBzaG91bGQgc2l6ZSB0aGUgYXJyYXkgdmlh
IFhFTlZJRl9GSV9NQVguCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
