From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: qemu assert in staging during HVM live migration
Date: Tue, 11 Dec 2018 16:03:43 +0000
Message-ID: <3c5248c39f804547a43297371a7b929c@AMSPEX02CL03.citrite.net>
References: <20181122100344.GA13748@aepfle.de>
 <20181123155449.GB6902@perard.uk.xensource.com>
 <20181211160735.4e583d6e.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yaMN=OU=citrix.com=prvs=87697dac6=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gWkXF-0000dC-LG
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 16:05:25 +0000
In-Reply-To: <20181211160735.4e583d6e.olaf@aepfle.de>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Olaf Hering' <olaf@aepfle.de>, Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFhlbi1kZXZlbCBbbWFpbHRvOnhl
bi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnXSBPbiBCZWhhbGYKPiBPZiBPbGFm
IEhlcmluZwo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTggMTU6MDgKPiBUbzogQW50aG9ueSBQZXJh
cmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBxZW11IGFzc2VydCBpbiBzdGFn
aW5nIGR1cmluZyBIVk0gbGl2ZSBtaWdyYXRpb24KPiAKPiBBbSBGcmksIDIzIE5vdiAyMDE4IDE1
OjU0OjQ5ICswMDAwCj4gc2NocmllYiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0
cml4LmNvbT46Cj4gCj4gPiBPbiBUaHUsIE5vdiAyMiwgMjAxOCBhdCAxMTowMzo0NUFNICswMTAw
LCBPbGFmIEhlcmluZyB3cm90ZToKPiA+ID4gcWVtdS1zeXN0ZW0taTM4NjogYmxvY2svYmxvY2st
YmFja2VuZC5jOjkwMzogYmxrX2dldF9hdHRhY2hlZF9kZXZfaWQ6Cj4gQXNzZXJ0aW9uIGAhYmxr
LT5sZWdhY3lfZGV2JyBmYWlsZWQuCj4gPiB4ZW4tZGlzayAocWRpc2spIGlzIGN1cnJlbnRseSB1
c2luZyBsZWdhY3kgc3R1ZmYgaW4gUUVNVSwgYW5kIHRoaXMKPiA+IGxlZ2FjeSBzdHVmZiBpcyBn
b2luZyB0byBkaXNhcHBlYXIuIFBhdWwgaGF2ZSBhIHBhdGNoIHNlcmllcyB0bwo+ID4gbW9kZXJu
aXNlIGl0Ogo+IAo+IFRoaXMgYXNzZXJ0IHRyaWdnZXJzIGFsc28gd2l0aG91dCBtaWdyYXRpb24u
Cj4gCgpJdCBjYW4gYmUgdHJpZ2dlcmVkIGJ5IHNpbXBseSBydW5uaW5nIHhlbnRvcC4KCiAgUGF1
bAoKPiBEbyB3ZSB3YW50IHRvIGdldCB0aGlzIGZpeGVkIGZvciBxZW11LTMuMS4wIGFuZCBwZXJo
YXBzIHFlbXUtMy4wLjEsIG9yCj4gc2hhbGwgd2UgZGVjbGFyZSBib3RoIGJyb2tlbiB1bnRpbCB0
aGUgbWVudGlvbmVkIHNlcmllcyBpcyBldmVudHVhbGx5Cj4gYXBwbGllZD8KPiAKPiBPbGFmCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
