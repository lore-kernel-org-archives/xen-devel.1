From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 10/12] x86: allocate per-vcpu stacks
 for interrupt entries
Date: Tue, 13 Feb 2018 02:10:09 -0700
Message-ID: <5A82B98102000078001A7364@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-11-jgross@suse.com>
 <5A70A01402000078001A3C30@prv-mh.provo.novell.com>
 <df54ec79-449d-daf2-fd67-c0b82bfb7f1e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vshx=fh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1elWbV-0006Js-1e
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2018 09:10:21 +0000
In-Reply-To: <df54ec79-449d-daf2-fd67-c0b82bfb7f1e@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjAyLjE4IGF0IDEzOjM1LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MC8wMS8xOCAxNjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIyLjAxLjE4IGF0IDEz
OjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IEBAIC0zNywxMCArNTIsMjQgQEAgc3Ry
dWN0IHZjcHU7Cj4+PiAgCj4+PiAgc3RydWN0IGNwdV9pbmZvIHsKPj4+ICAgICAgc3RydWN0IGNw
dV91c2VyX3JlZ3MgZ3Vlc3RfY3B1X3VzZXJfcmVnczsKPj4+IC0gICAgdW5zaWduZWQgaW50IHBy
b2Nlc3Nvcl9pZDsKPj4+IC0gICAgc3RydWN0IHZjcHUgKmN1cnJlbnRfdmNwdTsKPj4+IC0gICAg
dW5zaWduZWQgbG9uZyBwZXJfY3B1X29mZnNldDsKPj4+IC0gICAgdW5zaWduZWQgbG9uZyBjcjQ7
Cj4+PiArICAgIHVuaW9uIHsKPj4+ICsgICAgICAgIC8qIHBlciBwaHlzaWNhbCBjcHUgbWFwcGlu
ZyAqLwo+Pj4gKyAgICAgICAgc3RydWN0IHsKPj4+ICsgICAgICAgICAgICBzdHJ1Y3QgdmNwdSAq
Y3VycmVudF92Y3B1Owo+Pj4gKyAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgcGVyX2NwdV9vZmZz
ZXQ7Cj4+PiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBjcjQ7Cj4+PiArICAgICAgICB9Owo+
Pj4gKyAgICAgICAgLyogcGVyIHZjcHUgbWFwcGluZyAoeHB0aSkgKi8KPj4+ICsgICAgICAgIHN0
cnVjdCB7Cj4+PiArICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBwYWQxOwo+Pj4gKyAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgcGFkMjsKPj4+ICsgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0
YWNrX2JvdHRvbV9jcHU7Cj4+PiArICAgICAgICB9Owo+PiAKPj4gSW4gb3JkZXIgdG8gYXZvaWQg
YWNjaWRlbnRhbCB1c2UgaW4gdGhlIHdyb25nIGNvbnRleHQgYXMgbXVjaCBhcwo+PiBwb3NzaWJs
ZSwgSSB0aGluayB5b3Ugd2FudCB0byBuYW1lIGJvdGggc3RydWN0dXJlcy4KPiAKPiBJJ2QgbGlr
ZSB0byBsZWF2ZSBpdCBhcyBpcyBpbiBvcmRlciB0byBtYWtlIGEgcG9zc2libGUgYmFja3BvcnQg
bXVjaAo+IG1vcmUgZWFzaWVyLgoKV2VsbCwgSSBjYW4gc2VlIHdoeSB5b3Ugd291bGQgd2FudCB0
aGUgcHJlLWV4aXN0aW5nIGZpZWxkcyBsZWZ0CndpdGhvdXQgc3RydWN0dXJlIGZpZWxkIG5hbWUs
IGJ1dCB0aGUgbmV3ICh2Y3B1KSBvbmVzPyBBbmQKZXZlbiB0aGUgcHJlLWV4aXN0aW5nIChwY3B1
KSBvbmVzIHNob3VsZCBnYWluIGEgbmFtZSwganVzdApwZXJoYXBzIGluIGEgcGF0Y2ggbGF0ZSBp
biB0aGUgc2VyaWVzLCB3aGljaCB0aGVuIHdvdWxkbid0IGJlCmJhY2twb3J0ZWQuCgpKYW4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
