From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH v2 03/18] xen: introduce 'xen-block',
 'xen-disk' and 'xen-cdrom'
Date: Fri, 7 Dec 2018 14:39:40 +0000
Message-ID: <ce9a0cbaa69c42c084e40b96c4d01c26__49588.7677338489$1544193503$gmane$org@AMSPEX02CL03.citrite.net>
References: <1544108924-10841-1-git-send-email-paul.durrant@citrix.com>
 <1544108924-10841-4-git-send-email-paul.durrant@citrix.com>
 <20181207143525.GF18875@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jUOb=OQ=citrix.com=prvs=872b883f0=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gVHI8-00022k-VD
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 14:39:44 +0000
In-Reply-To: <20181207143525.GF18875@perard.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Perard <anthony.perard@citrix.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>, "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEFudGhvbnkgUEVSQVJEIFttYWls
dG86YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbV0KPiBTZW50OiAwNyBEZWNlbWJlciAyMDE4IDE0
OjM1Cj4gVG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHFl
bXUtZGV2ZWxAbm9uZ251Lm9yZzsgcWVtdS1ibG9ja0Bub25nbnUub3JnOyB4ZW4tCj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IEtldmluIFdvbGYgPGt3b2xmQHJlZGhhdC5jb20+OyBNYXgg
UmVpdHoKPiA8bXJlaXR6QHJlZGhhdC5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMy8xOF0geGVuOiBpbnRy
b2R1Y2UgJ3hlbi1ibG9jaycsICd4ZW4tZGlzaycgYW5kCj4gJ3hlbi1jZHJvbScKPiAKPiBPbiBU
aHUsIERlYyAwNiwgMjAxOCBhdCAwMzowODoyOVBNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4gPiArc3RhdGljIGNoYXIgKmRpc2tfdG9fdmJkX25hbWUodW5zaWduZWQgaW50IGRpc2spCj4g
PiArewo+ID4gKyAgICBjaGFyICpuYW1lLCAqcHJlZml4ID0gKGRpc2sgPj0gMjYpID8KPiA+ICsg
ICAgICAgIGRpc2tfdG9fdmJkX25hbWUoKGRpc2sgLyAyNikgLSAxKSA6IGdfc3RyZHVwKCIiKTsK
PiA+ICsKPiA+ICsgICAgbmFtZSA9IGdfc3RyZHVwX3ByaW50ZigiJXMlYyIsIHByZWZpeCwgJ2En
ICsgZGlzayk7Cj4gCj4gSSBkb24ndCB0aGluayB0aGF0IHdvcmtzLCBpZiBkaXNrIGlzIDI3LCB3
ZSBkbyAoJ2EnICsgMjcpIGhlcmUuIEl0J3MKPiBwcm9iYWJseSBtaXNzaW5nIGEgYGRpc2sgJSAy
NmAuCgpEYW1uLCB5ZXMgSSB3YXMgbm90IGFsbG93aW5nIHRoZSA+MiBsZXR0ZXJzLgoKPiAKPiA+
ICsgICAgZ19mcmVlKHByZWZpeCk7Cj4gPiArCj4gPiArICAgIHJldHVybiBuYW1lOwo+ID4gK30K
PiAKPiBbLi4uXQo+IAo+ID4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgdmJkX25hbWVfdG9fZGlzayhj
b25zdCBjaGFyICpuYW1lLCBjb25zdCBjaGFyCj4gKiplbmRwKQo+ID4gK3sKPiA+ICsgICAgdW5z
aWduZWQgaW50IGRpc2sgPSAwOwo+ID4gKwo+ID4gKyAgICB3aGlsZSAoKm5hbWUgIT0gJ1wwJykg
ewo+ID4gKyAgICAgICAgaWYgKCFnX2FzY2lpX2lzYWxwaGEoKm5hbWUpIHx8ICFnX2FzY2lpX2lz
bG93ZXIoKm5hbWUpKSB7Cj4gPiArICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICB9Cj4g
PiArCj4gPiArICAgICAgICBkaXNrICo9IDI2Owo+ID4gKyAgICAgICAgZGlzayArPSAqbmFtZSsr
IC0gJ2EnOwo+ID4gKyAgICB9Cj4gPiArICAgICplbmRwID0gbmFtZTsKPiA+ICsKPiA+ICsgICAg
cmV0dXJuIGRpc2s7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyB2b2lkIHhlbl9ibG9ja19zZXRf
dmRldihPYmplY3QgKm9iaiwgVmlzaXRvciAqdiwgY29uc3QgY2hhcgo+ICpuYW1lLAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvcGFxdWUsIEVycm9yICoqZXJycCkK
PiA+ICt7Cj4gCj4gU2V0dGluZyB2ZGV2IGRvZXNuJ3Qgd29yay4gSSd2ZSB0cmllZCB0byBhZGQg
YSBkaXNrIGB4dmRhYScsIGFuZCBpdAo+IHJlc3VsdCBpbiBgeHZkYScsIG9yIGBkMHAwJyAoaW4g
dGhlIHRyYWNlKS4gKFNhbWUgcmVzdWx0IHdpdGggYHh2ZGFhYScsCj4gYW5kICd4dmRiYScgZ2l2
ZXMgJ3h2ZGFhJy9kMjZwMCkKPiAKCk9rLCB0aGF0J3Mgd2VpcmQuIEknbGwgaGF2ZSB0byBmaWd1
cmUgdGhhdCBvdXQuCgogIFBhdWwKCj4gLS0KPiBBbnRob255IFBFUkFSRAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
