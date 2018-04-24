From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 15/16] os-posix: cleanup:
 Replace perror with error_report
Date: Tue, 24 Apr 2018 16:18:30 +0100
Message-ID: <20180424151830.GI20310@redhat.com>
References: <1524156319-11465-1-git-send-email-ian.jackson@eu.citrix.com>
 <1524156319-11465-16-git-send-email-ian.jackson@eu.citrix.com>
 <b8d20908-c76c-1dc2-2c14-31c185abbbfc@amsat.org>
 <23263.17660.17771.980752@mariner.uk.xensource.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/1ys=hn=redhat.com=berrange@srs-us1.protection.inumbo.net>)
 id 1fAziL-0007pn-Co
 for xen-devel@lists.xenproject.org; Tue, 24 Apr 2018 15:18:41 +0000
Content-Disposition: inline
In-Reply-To: <23263.17660.17771.980752@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, Ross Lagerwall <ross.lagerwall@citrix.com>, Paolo Bonzini <pbonzini@redhat.com>, Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Alistair Francis <alistair.francis@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMjQsIDIwMTggYXQgMDM6NTM6NDhQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgd3JpdGVzICgiUmU6IFtRZW11LWRldmVsXSBb
UEFUQ0ggMTUvMTZdIG9zLXBvc2l4OiBjbGVhbnVwOiBSZXBsYWNlIHBlcnJvciB3aXRoIGVycm9y
X3JlcG9ydCIpOgo+ID4gT24gMDQvMTkvMjAxOCAwMTo0NSBQTSwgSWFuIEphY2tzb24gd3JvdGU6
Cj4gPiA+IC0gICAgICAgIHBlcnJvcigibWxvY2thbGwiKTsKPiA+ID4gKyAgICAgICAgZXJyb3Jf
cmVwb3J0KCJtbG9ja2FsbDogJXMiLCBzdHJlcnJvcihlcnJubykpOwo+ID4gPiAgICAgIH0KPiA+
ID4gIAo+ID4gPiAgICAgIHJldHVybiByZXQ7Cj4gPiAKPiA+IFRoaW5raW5nIGxvdWRseSwgbWF5
YmUgd2UgY2FuIHJlZmFjdG9yIGFzIGVycm9yX3JlcG9ydF9lcnJubyhjb25zdCBjaGFyCj4gPiAq
ZGVzYykuLi4KPiAKPiBnaXQtZ3JlcCAnZXJyb3JfcmVwb3J0LiplcnJubycgc2hvd3MgYSBsb3Qg
b2YgY2FsbCBzaXRlcyB0aGF0IGRvCj4gc29tZXRoaW5nIG1vcmUgZXhjaXRpbmcgdGhhbiBjb25z
dCBjaGFyICpkZXNjIHdvdWxkIHN1cHBvcnQuCj4gCj4gSSB0aGluayB0aGUgcmlnaHQgYXBwcm9h
Y2ggd291bGQgYmUKPiAKPiAgLSBzdGF0aWMgdm9pZCB2cmVwb3J0KHJlcG9ydF90eXBlIHR5cGUs
IGNvbnN0IGNoYXIgKmZtdCwgdmFfbGlzdCBhcCkKPiAgKyBzdGF0aWMgdm9pZCB2cmVwb3J0KHJl
cG9ydF90eXBlIHR5cGUsIGludCBlcnJub3ZhbCwgY29uc3QgY2hhciAqZm10LCB2YV9saXN0IGFw
KQo+IC4uLgo+ICArICAgICBpZiAoZXJybm92YWwgPj0gMCkgewo+ICArICAgICAgICAgZXJyb3Jf
cHJpbnRmKCI6ICVzIiwgc3RyZXJyb3IoZXJybm92YWwpOwo+ICArICAgICB9Cj4gCj4gYW5kIHRo
ZW4gYWRkIGJvdGgKPiAgIGVycm9yX3JlcG9ydF9lcnJubwo+ICAgZXJyb3JfdnJlcG9ydF9lcnJu
bwo+IHdpdGggdGhlIG9idmlvdXMgc2VtYW50aWNzLgoKVGhhdCB3b3VsZCBiZSBuaWNlLCBiZWNh
dXNlIHRoZW4gd2UgY2FuIG1ha2UgdGhlc2UgdHdvIGZ1bmN0aW9ucyBhY3R1YWxseQp1c2Ugc3Ry
ZXJyb3JfcigpIGluc3RlYWQgb2Ygc3RyZXJyb3IoKSwgZm9yIHRocmVhZCBzYWZldHkgb24gYWxs
IHBsYXRmb3Jtcy4KClJlZ2FyZHMsCkRhbmllbAotLSAKfDogaHR0cHM6Ly9iZXJyYW5nZS5jb20g
ICAgICAtby0gICAgaHR0cHM6Ly93d3cuZmxpY2tyLmNvbS9waG90b3MvZGJlcnJhbmdlIDp8Cnw6
IGh0dHBzOi8vbGlidmlydC5vcmcgICAgICAgICAtby0gICAgICAgICAgICBodHRwczovL2ZzdG9w
MTM4LmJlcnJhbmdlLmNvbSA6fAp8OiBodHRwczovL2VudGFuZ2xlLXBob3RvLm9yZyAgICAtby0g
ICAgaHR0cHM6Ly93d3cuaW5zdGFncmFtLmNvbS9kYmVycmFuZ2UgOnwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
