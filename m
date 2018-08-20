From: Amit Tomer <amittomer25@gmail.com>
Subject: Re: [RFC PATCH 1/2] xen/arm: Add Amlogic S905 SoC early
 printk support
Date: Mon, 20 Aug 2018 14:46:52 +0530
Message-ID: <CABHD4K-K+XNYPZ4e2_kKa-PcAwKd-5OD5V72dTvb9qbr8qQeWA@mail.gmail.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-2-git-send-email-amittomer25@gmail.com>
 <683b761d-ccf8-b46e-284f-1713ef856b8f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mtjj=ld=gmail.com=amittomer25@srs-us1.protection.inumbo.net>)
 id 1frgIx-0007yv-4Q
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 09:16:55 +0000
Received: by mail-oi0-x243.google.com with SMTP id k12-v6so24573374oiw.8
 for <xen-devel@lists.xenproject.org>; Mon, 20 Aug 2018 02:16:53 -0700 (PDT)
In-Reply-To: <683b761d-ccf8-b46e-284f-1713ef856b8f@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, ian.jackson@eu.citrix.com, tim@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andre Przywara <andre.przywara@arm.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGVsbG8sCgo+IEkgd291bGQgcHJlZmVyIGlmIG5vIG5ldyBhbGlhcyBhcmUgYWRkZWQuIFRoZSBz
YW1lIGNvdWxkIGJlIGFjaGlldmVkIHdpdGgKPiBDT05GSUdfRUFSTFlfUFJJTlRLPW1lc29uLDB4
YzgxMDA0YzAuCj4KPiBUaGlzIGNvdWxkIGJlIGRvY3VtZW50ZWQgb24gdGhlIHdpa2kuCgpPay4K
Cj4gSSB3b3VsZCBwcmVmZXIgaWYgd2Ugc3RpY2sgd2l0aCB0aGUgc3BlYyBuYW1lLiBTbyBVQVJU
X1RYX1JFRyBzaG91bGQgYmUKPiByZW5hbWVkIFVBUlRfV0ZJRk9fUkVHLgoKWWVhaCByaWdodCwg
Z290IHlvdXIgcG9pbnQuCj4KPiBBbHNvLCBpdCBtaWdodCBiZSB3b3J0aCBjb25zaWRlcmluZyB0
byBwcmVmaXggdGhlbSB3aXRoIEFNTF8gc28gaXQgaXMgZWFzeQo+IHRvIGZpbmQgdGhlbSBvbiBs
b29rdXAuCgpJbml0aWFsbHkgdXNlZCBBTUxfIGFzIHByZWZpeCBidXQgdGhlbiBJIGp1c3Qgd2Fu
dGVkIHRvIGJlIGNvbnNpc3RlbnQgaXQgd2l0aApvdGhlciB1YXJ0IGRyaXZlcnMgaW4gWEVOLgoK
PiBMb29raW5nIGF0IHRoZSBlYXJseWNvbnNvbGUgaW1wbGVtZW50YXRpb24gaW4gTGludXgsIGl0
IHNlZW1zIHRoYXQgVFggbmVlZHMKPiB0byBiZSBlbmFibGVkIGZpcnN0IChzZWUgbWVzb25fdWFy
dF9lbmFibGVfdHhfZW5naW5lKS4KPgo+IElzIGl0IG5vdyBkb25lIGluIHRoZSBmaXJtd2FyZT8K
ClllcywgdGhpcyBoYXMgYmVlbiBkb25lIGluIHUtYm9vdC4Kc2hvdWxkbid0IHdlIHRydXN0IGl0
PwoKCj4+ICsgKi8KPj4gKy5tYWNybyBlYXJseV91YXJ0X3JlYWR5IHhiIGMKPj4gKzE6Cj4+ICsg
ICAgICAgIGxkcmggICB3XGMsIFtceGIsICNVQVJUX1NUQVRVU19SRUddIC8qIHN0YXR1cyByZWdp
c3RlciAqLwo+PiArICAgICAgICB0c3QgICAgd1xjLCAjKDEgPDwgMjEpICAgICAgICAgICAgICAv
KiBDaGVjayBUWEZJRk8gRlVMTCBiaXQgKi8KPgo+Cj4gUGxlYXNlIGRlZmluZSAxIDw8IDIxIHJh
dGhlciB0aGFuIGhhcmRjb2RpbmcgaXQuCgpPay4KCgpUaGFua3MKLUFtaXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
