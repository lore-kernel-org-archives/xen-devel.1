From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC v2 10/12] x86: allocate per-vcpu stacks
 for interrupt entries
Date: Fri, 9 Feb 2018 13:35:22 +0100
Message-ID: <df54ec79-449d-daf2-fd67-c0b82bfb7f1e@suse.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-11-jgross@suse.com>
 <5A70A01402000078001A3C30@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=0oxb=fd=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ek7ts-0004sw-Na
 for xen-devel@lists.xenproject.org; Fri, 09 Feb 2018 12:35:32 +0000
In-Reply-To: <5A70A01402000078001A3C30@prv-mh.provo.novell.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMzAvMDEvMTggMTY6NDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAxLjE4IGF0
IDEzOjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gQEAgLTM3LDEwICs1MiwyNCBAQCBz
dHJ1Y3QgdmNwdTsKPj4gIAo+PiAgc3RydWN0IGNwdV9pbmZvIHsKPj4gICAgICBzdHJ1Y3QgY3B1
X3VzZXJfcmVncyBndWVzdF9jcHVfdXNlcl9yZWdzOwo+PiAtICAgIHVuc2lnbmVkIGludCBwcm9j
ZXNzb3JfaWQ7Cj4+IC0gICAgc3RydWN0IHZjcHUgKmN1cnJlbnRfdmNwdTsKPj4gLSAgICB1bnNp
Z25lZCBsb25nIHBlcl9jcHVfb2Zmc2V0Owo+PiAtICAgIHVuc2lnbmVkIGxvbmcgY3I0Owo+PiAr
ICAgIHVuaW9uIHsKPj4gKyAgICAgICAgLyogcGVyIHBoeXNpY2FsIGNwdSBtYXBwaW5nICovCj4+
ICsgICAgICAgIHN0cnVjdCB7Cj4+ICsgICAgICAgICAgICBzdHJ1Y3QgdmNwdSAqY3VycmVudF92
Y3B1Owo+PiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwZXJfY3B1X29mZnNldDsKPj4gKyAg
ICAgICAgICAgIHVuc2lnbmVkIGxvbmcgY3I0Owo+PiArICAgICAgICB9Owo+PiArICAgICAgICAv
KiBwZXIgdmNwdSBtYXBwaW5nICh4cHRpKSAqLwo+PiArICAgICAgICBzdHJ1Y3Qgewo+PiArICAg
ICAgICAgICAgdW5zaWduZWQgbG9uZyBwYWQxOwo+PiArICAgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBwYWQyOwo+PiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBzdGFja19ib3R0b21fY3B1Owo+
PiArICAgICAgICB9Owo+IAo+IEluIG9yZGVyIHRvIGF2b2lkIGFjY2lkZW50YWwgdXNlIGluIHRo
ZSB3cm9uZyBjb250ZXh0IGFzIG11Y2ggYXMKPiBwb3NzaWJsZSwgSSB0aGluayB5b3Ugd2FudCB0
byBuYW1lIGJvdGggc3RydWN0dXJlcy4KCkknZCBsaWtlIHRvIGxlYXZlIGl0IGFzIGlzIGluIG9y
ZGVyIHRvIG1ha2UgYSBwb3NzaWJsZSBiYWNrcG9ydCBtdWNoCm1vcmUgZWFzaWVyLgoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
