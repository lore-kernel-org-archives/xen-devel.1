From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] xen-hvm: stop faking I/O to access PCI
 config space
Date: Fri, 18 May 2018 08:15:59 -0600
Message-ID: <5AFEE01F02000078001C4100@prv1-mh.provo.novell.com>
References: <1526648406-1746-1-git-send-email-paul.durrant@citrix.com>
 <5AFED64102000078001C4069@prv1-mh.provo.novell.com>
 <f4620ef5cd6d45b58bb4ef29259c6ee9@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ji1r=if=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJgAs-0007A2-77
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 14:16:02 +0000
In-Reply-To: <f4620ef5cd6d45b58bb4ef29259c6ee9@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, ehabkost@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, marcel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, anthony.perard@citrix.com, xen-devel <xen-devel@lists.xenproject.org>, Richard Henderson <rth@twiddle.net>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA1LjE4IGF0IDE1OjUxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiBTZW50OiAxOCBNYXkgMjAxOCAxNDozNAo+PiBUbzogUGF1bCBEdXJyYW50IDxQYXVsLkR1
cnJhbnRAY2l0cml4LmNvbT4KPj4gPj4+IE9uIDE4LjA1LjE4IGF0IDE1OjAwLCA8cGF1bC5kdXJy
YW50QGNpdHJpeC5jb20+IHdyb3RlOgo+PiA+ICsgICAgUUxJU1RfRk9SRUFDSCh4ZW5kZXYsICZz
dGF0ZS0+ZGV2X2xpc3QsIGVudHJ5KSB7Cj4+ID4gKyAgICAgICAgdW5zaWduZWQgaW50IGk7Cj4+
ID4gKyAgICAgICAgdWludDMyX3QgdG1wOwo+PiA+ICsKPj4gPiArICAgICAgICBpZiAoeGVuZGV2
LT5zYmRmICE9IHNiZGYpIHsKPj4gPiArICAgICAgICAgICAgY29udGludWU7Cj4+ID4gKyAgICAg
ICAgfQo+PiA+ICsKPj4gPiArICAgICAgICBpZiAoIXJlcS0+ZGF0YV9pc19wdHIpIHsKPj4gPiAr
ICAgICAgICAgICAgaWYgKHJlcS0+ZGlyID09IElPUkVRX1JFQUQpIHsKPj4gPiArICAgICAgICAg
ICAgICAgIGZvciAoaSA9IDA7IGkgPCByZXEtPmNvdW50OyBpKyspIHsKPj4gPiArICAgICAgICAg
ICAgICAgICAgICByd19jb25maWdfcmVxX2l0ZW0oeGVuZGV2LCByZXEsIGksICZ0bXApOwo+PiA+
ICsgICAgICAgICAgICAgICAgICAgIHJlcS0+ZGF0YSA9IHRtcDsKPj4gPiArICAgICAgICAgICAg
ICAgIH0KPj4gPiArICAgICAgICAgICAgfSBlbHNlIGlmIChyZXEtPmRpciA9PSBJT1JFUV9XUklU
RSkgewo+PiA+ICsgICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IHJlcS0+Y291bnQ7IGkr
Kykgewo+PiA+ICsgICAgICAgICAgICAgICAgICAgIHRtcCA9IHJlcS0+ZGF0YTsKPj4gPiArICAg
ICAgICAgICAgICAgICAgICByd19jb25maWdfcmVxX2l0ZW0oeGVuZGV2LCByZXEsIGksICZ0bXAp
Owo+PiA+ICsgICAgICAgICAgICAgICAgfQo+PiA+ICsgICAgICAgICAgICB9Cj4+IAo+PiBXb3Vs
ZG4ndCBpdCBiZSBtb3JlIHNlbnNpYmxlIHRvIGZhaWwgcmVxLT5jb3VudCAhPSAxIHJlcXVlc3Rz
IGhlcmU/Cj4+IAo+IAo+IEknbSB3b25kZXJpbmcgd2hldGhlciB3ZSdkIHdhbnQgdG8gaGFuZGxl
IGNvdW50ID4gMSBvbmNlIHdlIGFsbG93IE1NQ09ORklHIAo+IGFjY2Vzc2VzIHRob3VnaC4gSSBn
dWVzcyBpdCB3b3VsZCBiZSBlYXNpZXIganVzdCB0byBkZWZlciB0aGF0LgoKRm9yIHRoZSBkYXRh
X2lzX3B0ciBjYXNlIC0gc3VyZS4gQnV0IGhlcmU/IE9yIHdhaXQgLSBhcmUgeW91IHRoaW5raW5n
IGFib3V0ClJFUCBTVE9TIChhbmQgdGhlIHJlbGF0aXZlbHkgdXNlbGVzcyBSRVAgTE9EUyk/CgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
