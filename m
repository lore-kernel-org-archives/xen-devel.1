From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 03/14] x86emul: abstract out XCRn accesses
Date: Thu, 15 Mar 2018 13:35:19 +0000
Message-ID: <ccc22bbf-3ccd-5ee0-7904-0ed1d725702b@citrix.com>
References: <5AAA7BAF02000078001B2242@prv-mh.provo.novell.com>
 <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h5rp=gf=citrix.com=prvs=605c7d53e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ewT6o-00073F-U2
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 13:39:54 +0000
In-Reply-To: <5AAA7D6902000078001B225C@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Paul Durrant <paul.durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMTggMTM6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+ICBzdGF0aWMgaW5saW5lIHZv
aWQgeDg2X2VtdWxfaHdfZXhjZXB0aW9uKAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni94ODZfZW11bGF0
ZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVsYXRlLmMKPiBAQCAtNDIsMyArNDIsNTAg
QEAKPiAgfSkKPiAgCj4gICNpbmNsdWRlICJ4ODZfZW11bGF0ZS94ODZfZW11bGF0ZS5jIgo+ICsK
PiAraW50IHg4NmVtdWxfcmVhZF94Y3IodW5zaWduZWQgaW50IHJlZywgdWludDY0X3QgKnZhbCwK
PiArICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHg4Nl9lbXVsYXRlX2N0eHQgKmN0eHQpCj4g
K3sKPiArICAgIHN3aXRjaCAoIHJlZyApCj4gKyAgICB7Cj4gKyAgICBjYXNlIDA6Cj4gKyAgICAg
ICAgKnZhbCA9IGN1cnJlbnQtPmFyY2gueGNyMDsKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9P
S0FZOwo+ICsKPiArICAgIGNhc2UgMToKPiArICAgICAgICBpZiAoIGNwdV9oYXNfeGdldGJ2MSAm
JiBjdXJyZW50LT5kb21haW4tPmFyY2guY3B1aWQtPnhzdGF0ZS54Z2V0YnYxICkKCllvdSBjYW4g
ZHJvcCB0aGUgY3B1X2hhc194Z2V0YnYxIHBhcnQgb2YgdGhpcyB0ZXN0LsKgIFRoZSBDUFVJRCBw
b2xpY3kKZGVyaXZhdGlvbiBsb2dpYyB3b24ndCBhbGxvdyB4c3RhdGUueGdldGJ2MSB0byBiZSBz
ZXQgd2l0aG91dApjcHVfaGFzX3hnZXRidjEKCk90aGVyd2lzZSwgUmV2aWV3ZWQtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
