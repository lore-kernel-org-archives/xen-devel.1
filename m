From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: append EXTRA_CFLAGS to CFLAGS for
 expert builds
Date: Fri, 19 Jan 2018 02:43:30 -0700
Message-ID: <5A61CBD202000078001A03F7@prv-mh.provo.novell.com>
References: <20180118170446.435-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=mpbx=eo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ecTCy-00053n-0i
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 09:43:36 +0000
In-Reply-To: <20180118170446.435-1-cardoe@cardoe.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAxLjE4IGF0IDE4OjA0LCA8Y2FyZG9lQGNhcmRvZS5jb20+IHdyb3RlOgo+IC0t
LSBhL3hlbi9SdWxlcy5tawo+ICsrKyBiL3hlbi9SdWxlcy5tawo+IEBAIC03NSw2ICs3NSw4IEBA
IEFMTF9PQkpTIDo9ICQoQUxMX09CSlMteSkKPiAgQ0ZMQUdTLXkgKz0gLU1NRCAtTUYgJChARCkv
LiQoQEYpLmQKPiAgCj4gIENGTEFHUyArPSAkKENGTEFHUy15KQo+ICsjIGFsbG93IGV4dHJhIENG
TEFHUyBleHRlcm5hbGx5IHZpYSBFWFRSQV9DRkxBR1MKPiArQ0ZMQUdTICs9ICQoRVhUUkFfQ0ZM
QUdTKQoKVGhpcyBpcyB0b28gdW5zcGVjaWZpYyBhIG5hbWUgZm9yIG15IHRhc3RlOiBVcHN0cmVh
bSBxZW11IGhhcyB1c2VzCm9mIHN1Y2ggYSBzeW1ib2wgdG9vLCBmb3IgZXhhbXBsZSAoSSBkaWRu
J3QgZ28gY2hlY2sgd2hldGhlciB0aG9zZQp1c2VzIHdvdWxkIGNvbGxpZGUgd2l0aCB5b3Vycyku
CgpZb3Ugd2lsbCBhbHNvIHdhbnQgdG8gZG9jdW1lbnQgdGhpcyBpbiAuL0lOU1RBTEwsIEkgdGhp
bmsuIEFsb25nIHdpdGgKd2hhdCdzIGFscmVhZHkgdGhlcmUsIGhvdyBhYm91dCBuYW1pbmcgdGhl
IG5ldyBvbmUKRVhUUkFfQ0ZMQUdTX1hFTiBvciBFWFRSQV9DRkxBR1NfWEVOX0NPUkU/IENvbnNp
ZGVyaW5nCnRoZSBzZXBhcmF0ZSBzaGltIGJ1aWxkLCB3ZSBtYXkgdGhlbiBhbHNvIHdhbnQKRVhU
UkFfQ0ZMQUdTX1hFTl9TSElNLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
