From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/9] x86: relocate pvh_info
Date: Fri, 19 Jan 2018 04:48:07 -0700
Message-ID: <5A61E90702000078001A0562@prv-mh.provo.novell.com>
References: <20180118181652.26397-1-wei.liu2@citrix.com>
 <20180118181652.26397-6-wei.liu2@citrix.com>
 <20180119105353.urn7doxvyir27l46@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=o2jt=ae=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ecV9X-0007bF-KN
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 11:48:11 +0000
In-Reply-To: <20180119105353.urn7doxvyir27l46@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDExOjUzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSmFuIDE4LCAyMDE4IGF0IDA2OjE2OjQ4UE0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6
Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYv
Ym9vdC9oZWFkLlMKPj4gaW5kZXggMGY2NTJjZWExMS4uMmY5NGMyODZkNSAxMDA2NDQKPj4gLS0t
IGEveGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hl
YWQuUwo+PiBAQCAtNDE0LDYgKzQxNCw3IEBAIF9fcHZoX3N0YXJ0Ogo+PiAgCj4+ICAgICAgICAg
IC8qIFNldCB0cmFtcG9saW5lX3BoeXMgdG8gdXNlIG1mbiAxIHRvIGF2b2lkIGhhdmluZyBhIG1h
cHBpbmcgYXQgVkEgCj4gMCAqLwo+PiAgICAgICAgICBtb3Z3ICAgICQweDEwMDAsIHN5bV9lc2ko
dHJhbXBvbGluZV9waHlzKQo+PiArICAgICAgICB4b3IgICAgICVlYXgsICVlYXggLyogTmVlZGVk
IGJ5IHJlbG9jLmMgKi8KPiAKPiBJIHdvdWxkIHJhdGhlciBkbzoKPiAKPiBtb3ZsICRYRU5fSFZN
X1NUQVJUX01BR0lDX1ZBTFVFLCVlYXgKPiAKPiBPcjoKPiAKPiBtb3YgKCVlYngpLCVlYXgKPiAK
PiBTbyB0aGF0Li4uCj4gCj4+IC1tdWx0aWJvb3RfaW5mb190IF9fc3RkY2FsbCAqcmVsb2ModTMy
IG1iX21hZ2ljLCB1MzIgbWJpX2luLCB1MzIgdHJhbXBvbGluZSkKPj4gK3ZvaWQgX19zdGRjYWxs
ICpyZWxvYyh1MzIgbWFnaWMsIHUzMiBpbiwgdTMyIHRyYW1wb2xpbmUpCj4+ICB7Cj4+ICAgICAg
YWxsb2MgPSB0cmFtcG9saW5lOwo+PiAgCj4+IC0gICAgaWYgKCBtYl9tYWdpYyA9PSBNVUxUSUJP
T1QyX0JPT1RMT0FERVJfTUFHSUMgKQo+PiAtICAgICAgICByZXR1cm4gbWJpMl9yZWxvYyhtYmlf
aW4pOwo+PiArI2lmZGVmIENPTkZJR19QVkhfR1VFU1QKPj4gKyAgICBpZiAoIG1hZ2ljID09IDAg
KQo+IAo+IC4uLiBoZXJlIHlvdSBjYW4gZG8gbWFnaWMgPT0gWEVOX0hWTV9TVEFSVF9NQUdJQ19W
QUxVRS4KPiAKPj4gKyAgICAgICAgcmV0dXJuIHB2aF9pbmZvX3JlbG9jKGluKTsKPj4gKyAgICBl
bHNlCj4+ICsjZW5kaWYKPj4gKyAgICBpZiAoIG1hZ2ljID09IE1VTFRJQk9PVDJfQk9PVExPQURF
Ul9NQUdJQyApCj4+ICsgICAgICAgIHJldHVybiBtYmkyX3JlbG9jKGluKTsKPj4gICAgICBlbHNl
Cj4+IC0gICAgICAgIHJldHVybiBtYmlfcmVsb2MobWJpX2luKTsKPj4gKyAgICAgICAgcmV0dXJu
IG1iaV9yZWxvYyhpbik7Cj4gCj4gQSAnc3dpdGNoICggbWFnaWMgKScgd291bGQgYmUgYmV0dGVy
IGhlcmUgSU1ITy4KCkFoLCBpbmRlZWQsIHRoYXQncyBiZXR0ZXIuCgpKYW4KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
