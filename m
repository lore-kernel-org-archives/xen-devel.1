From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] x86/cpuid: Alter the policy logic for
 leaf 0xb to be multi-invocation
Date: Wed, 27 Jun 2018 08:58:33 -0600
Message-ID: <5B33A61902000078001CE750@prv1-mh.provo.novell.com>
References: <1530107750-22040-1-git-send-email-andrew.cooper3@citrix.com>
 <1530107750-22040-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530107750-22040-3-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA2LjE4IGF0IDE1OjU1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTMxNiw2ICszMTksMzMgQEAgc3RhdGljIHZvaWQgX19pbml0IGNhbGN1bGF0ZV9y
YXdfcG9saWN5KHZvaWQpCj4gICAgICAgICAgICAgIGNwdWlkX2NvdW50X2xlYWYoNywgaSwgJnAt
PmZlYXQucmF3W2ldKTsKPiAgICAgIH0KPiAgCj4gKyAgICBpZiAoIHAtPmJhc2ljLm1heF9sZWFm
ID49IDB4YiApCj4gKyAgICB7Cj4gKyAgICAgICAgdW5pb24gewo+ICsgICAgICAgICAgICBzdHJ1
Y3QgY3B1aWRfbGVhZiBsOwo+ICsgICAgICAgICAgICBzdHJ1Y3QgY3B1aWRfdG9wb19sZWFmIHQ7
Cj4gKyAgICAgICAgfSB1Owo+ICsKPiArICAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJ
WkUocC0+dG9wby5yYXcpOyArK2kgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAgICAgY3B1aWRf
Y291bnRfbGVhZigweGIsIGksICZ1LmwpOwo+ICsKPiArICAgICAgICAgICAgaWYgKCB1LnQudHlw
ZSA9PSAwICkKPiArICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiArICAgICAgICAgICAgcC0+
dG9wby5zdWJsZWFmW2ldID0gdS50Owo+ICsgICAgICAgIH0KPiArCj4gKyAgICAgICAgLyoKPiAr
ICAgICAgICAgKiBUaGUgY2hvaWNlIG9mIENQVUlEX0dVRVNUX05SX1RPUE8gaXMgcGVyIHRoZSBt
YW51YWwuICBJdCBtYXkgbmVlZAo+ICsgICAgICAgICAqIHRvIGdyb3cgZm9yIGZ1dHVyZSBoYXJ3
YXJlLgoKTWlzc2luZyBkLgoKPiBAQCAtMTA4LDcgKzEwOSwxMSBAQCBzdHJ1Y3QgY3B1aWRfcG9s
aWN5Cj4gICAgICAgICAgICAgIHVpbnQ2NF90IDo2NCwgOjY0OyAvKiBMZWFmIDB4OSAtIERDQSAq
Lwo+ICAKPiAgICAgICAgICAgICAgLyogTGVhZiAweGEgLSBJbnRlbCBQTVUuICovCj4gLSAgICAg
ICAgICAgIHVpbnQ4X3QgcG11X3ZlcnNpb247Cj4gKyAgICAgICAgICAgIHVpbnQ4X3QgcG11X3Zl
cnNpb24sIF9wbXVbMTVdOwo+ICsKPiArICAgICAgICAgICAgdWludDY0X3QgOjY0LCA6NjQ7IC8q
IExlYWYgMHhiIC0gVG9wb2xvZ3kuICovCj4gKyAgICAgICAgICAgIHVpbnQ2NF90IDo2NCwgOjY0
OyAvKiBMZWFmIDB4YyAtIHJzdmQgKi8KPiArICAgICAgICAgICAgdWludDY0X3QgOjY0LCA6NjQ7
IC8qIExlYWYgMHhkIC0gWFNUQVRFLiAqLwoKSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB5b3UgYWRk
IHRoZSBsYXR0ZXIgdHdvIGxpbmVzLCBuZWl0aGVyIGluIGdlbmVyYWwKbm9yIGluIHRoZSBwYXJ0
aWN1bGFyIGNvbnRleHQgb2YgdGhpcyBwYXRjaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
