From: Pu Wen <puwen@hygon.cn>
Subject: Re: [PATCH 07/15] x86/acpi: Add Hygon Dhyana support
Date: Tue, 15 Jan 2019 20:52:55 +0800
Message-ID: <4ceb98ad-06a6-74fd-4db4-175c61a6ca73@hygon.cn>
References: <cover.1545284932.git.puwen@hygon.cn>
 <46cb0d5dcc52ac59d8d58330e3e4737ba8521031.1545284932.git.puwen@hygon.cn>
 <5C3CB89A020000780020D6D7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N85w=PX=hygon.cn=puwen@srs-us1.protection.inumbo.net>)
 id 1gjOK4-0001xs-Tj
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 13:00:04 +0000
In-Reply-To: <5C3CB89A020000780020D6D7@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjAxOS8xLzE1IDE6MTcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIwLjEyLjE4IGF0
IDE0OjE0LCA8cHV3ZW5AaHlnb24uY24+IHdyb3RlOgo+PiBBZGQgSHlnb24gRGh5YW5hIHN1cHBv
cnQgdG8gdGhlIGFjcGkgY3B1ZnJlcSBzdWJzeXN0ZW0gYnkgdXNpbmcgdGhlIGNvZGUKPj4gcGF0
aCBvZiBBTUQuCj4gCj4gLi4uIGNwdWZyZXEgYW5kIGNwdWlkbGUgc3Vic3lzdGVtcyAuLi4KClRo
YW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24uCgo+PiBAQCAtNjYwLDggKzY2MSw5IEBAIGludCBjcHVm
cmVxX2NwdV9pbml0KHVuc2lnbmVkIGludCBjcHVpZCkKPj4gICB7Cj4+ICAgICAgIGludCByZXQ7
Cj4+ICAgCj4+IC0gICAgLyogQ3VycmVudGx5IHdlIG9ubHkgaGFuZGxlIEludGVsIGFuZCBBTUQg
cHJvY2Vzc29yICovCj4+ICsgICAgLyogQ3VycmVudGx5IHdlIG9ubHkgaGFuZGxlIEludGVsIGFu
ZCBBTUQgYW5kIEh5Z29uIHByb2Nlc3NvciAqLwo+IAo+IFBsZWFzZSByZXBsYWNlIHRoZSBmaXJz
dCAiYW5kIiBieSBhIGNvbW1hLgoKT0suCgo+PiAgICAgICBpZiAoIChib290X2NwdV9kYXRhLng4
Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9JTlRFTCApIHx8Cj4+ICsgICAgICAgICAoYm9vdF9jcHVf
ZGF0YS54ODZfdmVuZG9yID09IFg4Nl9WRU5ET1JfSFlHT04gKSB8fAo+PiAgICAgICAgICAgIChi
b290X2NwdV9kYXRhLng4Nl92ZW5kb3IgPT0gWDg2X1ZFTkRPUl9BTUQgKSApCj4+ICAgICAgICAg
ICByZXQgPSBjcHVmcmVxX2FkZF9jcHUoY3B1aWQpOwo+PiAgICAgICBlbHNlCj4gCj4gQXQgdGhl
IHZlcnkgbGVhc3QgaGVyZSBJIHRoaW5rIHlvdSB3YW50IHRvIGNoYW5nZSB0byBzd2l0Y2goKS4K
IApJIHRoaW5rIHRoZXJlIGlzIG5vIG5lZWQgdG8gY2hhbmdlIGlmKCkgdG8gc3dpdGNoKCksIGJl
Y2F1c2UgaWYoKSBsb29rcwpjb25jaXNlIGVub3VnaCBoZXJlLiBBbHNvIHRoZSBjaGFuZ2Ugd2ls
bCBnZW5lcmF0ZSBhIGJpZ2dlciBwYXRjaC4KCi0tIApSZWdhcmRzLApQdSBXZW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
