From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v2] xen-block: handle resize callback
Date: Thu, 31 Jan 2019 15:20:42 +0000
Message-ID: <20190131152042.GF2306@perard.uk.xensource.com>
References: <20190130161948.15888-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lOgI=QH=citrix.com=prvs=9271d7743=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1gpEBJ-0007XG-7K
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 15:23:09 +0000
Content-Disposition: inline
In-Reply-To: <20190130161948.15888-1-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDQ6MTk6NDhQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOgo+IFNvbWUgZnJvbnRlbmQgZHJpdmVycyB3aWxsIGhhbmRsZSBkeW5hbWljIHJlc2l6aW5n
IG9mIFBWIGRpc2tzLCBzbyBzZXQgdXAKPiB0aGUgQmxvY2tEZXZPcHMgcmVzaXplX2NiKCkgbWV0
aG9kIGR1cmluZyB4ZW5fYmxvY2tfcmVhbGl6ZSgpIHRvIGFsbG93Cj4gdGhpcyB0byBiZSBkb25l
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+Cj4gLS0tCgoKPiArICAgIC8qCj4gKyAgICAgKiBNaW1pYyB0aGUgYmVoYXZpb3VyIG9mIExp
bnV4IHhlbi1ibGtiYWNrIGFuZCByZS13cml0ZSB0aGUgc3RhdGUKPiArICAgICAqIHRvIHRyaWdn
ZXIgdGhlIGZyb250ZW5kIHdhdGNoLgo+ICsgICAgICovCj4gKyAgICB4ZW5fZGV2aWNlX2JhY2tl
bmRfc2V0X3N0YXRlKHhlbmRldiwgYmFja2VuZF9zdGF0ZSk7Cgo6KCwgdGhhdCBmdW5jdGlvbiBk
b2Vzbid0IHdyaXRlIHRoZSBzdGF0ZSBhZ2FpbiBpZiBpdCBoYXNuJ3QgY2hhbmdlZC4KU28gaW4g
bXkgdGVzdGluZywgTGludXggbmV2ZXIgZGlkIGFueXRoaW5nLgoKLS0gCkFudGhvbnkgUEVSQVJE
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
