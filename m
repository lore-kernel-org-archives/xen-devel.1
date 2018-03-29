From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 4/7] xen/x86: use invpcid for flushing
 the TLB
Date: Thu, 29 Mar 2018 16:29:14 +0200
Message-ID: <c7cc3f4e-8089-4bc0-630c-dbe9074e0353@suse.com>
References: <20180327090704.28646-1-jgross@suse.com>
 <20180327090704.28646-5-jgross@suse.com> <5ABD09EC02000078001B737F@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=czor=gt=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f1YYJ-0008B1-55
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 14:29:19 +0000
In-Reply-To: <5ABD09EC02000078001B737F@suse.com>
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
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDMvMTggMTU6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI3LjAzLjE4IGF0
IDExOjA3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L3Nl
dHVwLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPj4gQEAgLTYzLDYgKzYzLDEwIEBA
IGJvb2xlYW5fcGFyYW0oIm5vc21wIiwgb3B0X25vc21wKTsKPj4gIHN0YXRpYyB1bnNpZ25lZCBp
bnQgX19pbml0ZGF0YSBtYXhfY3B1czsKPj4gIGludGVnZXJfcGFyYW0oIm1heGNwdXMiLCBtYXhf
Y3B1cyk7Cj4+ICAKPj4gKy8qIG9wdF9pbnZwY2lkOiBJZiBmYWxzZSwgZG9uJ3QgdXNlIElOVlBD
SUQgaW5zdHJ1Y3Rpb24gZXZlbiBpZiBhdmFpbGFibGUuICovCj4+ICtzdGF0aWMgYm9vbCBfX2lu
aXRkYXRhIG9wdF9pbnZwY2lkID0gdHJ1ZTsKPj4gK2Jvb2xlYW5fcGFyYW0oImludnBjaWQiLCBv
cHRfaW52cGNpZCk7Cj4gCj4gSG1tLCBJJ20gc29ycnkgZm9yIG5vdGljaW5nIG9ubHkgbm93ICh3
aGlsZSBzZWVpbmcgdGhlIHF1ZXN0aW9uYWJsZQo+IHVzZXMgb2YgY3B1X2hhc19pbnZwY2lkIGlu
IHBhdGNoIDcpLCBidXQgdGhpcyBiZWluZyBhbiBpbml0LW9ubHkKPiB2YXJpYWJsZSBhbmQgaGF2
aW5nIC4uLgo+IAo+PiBAQCAtMTU0OSw2ICsxNTUzLDkgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4g
X19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPj4gICAgICBpZiAoIGNwdV9oYXNfZnNn
c2Jhc2UgKQo+PiAgICAgICAgICBzZXRfaW5fY3I0KFg4Nl9DUjRfRlNHU0JBU0UpOwo+PiAgCj4+
ICsgICAgaWYgKCAhb3B0X2ludnBjaWQgKQo+PiArICAgICAgICBzZXR1cF9jbGVhcl9jcHVfY2Fw
KFg4Nl9GRUFUVVJFX0lOVlBDSUQpOwo+IAo+IC4uLiB0aGlzIGVmZmVjdCBoYXMgdHdvIGlzc3Vl
czogRm9yIG9uZSwgaW4gc3VjaCBhIGNhc2UgdGhpcyBzaG91bGQKPiBiZSBhIHN1Yi1vcHRpb24g
dG8gImNwdWlkPSIuIEFuZCB0aGVuIGFmYWljdCBpdCBhbHNvIGRpc2FibGVzIHVzZSBvZgo+IElO
VlBDSUQgaW4gSFZNIGd1ZXN0cy4gSU9XIEkgdGhpbmsgeW91IHdhbnQgdG8gcmV0YWluIHRoZSBv
cHRpb24KPiBidXQgbWFrZSB0aGUgdmFyaWFibGUgbm9uLWluaXQgYW5kIG5vbi1zdGF0aWMuIE9i
dmlvdXNseSBmb3IgZWFybHkKPiBib290IHVzZSBpdCBtYXkgdGhlbiBubyBsb25nZXIgYmUgcG9z
c2libGUgdG8gc2V0IGl0IHRvIHRydWUgYXQgYnVpbGQKPiB0aW1lICh5b3UgbWF5IGVuZCB1cCBu
ZWVkaW5nIHR3byB2YXJpYWJsZXMpLgoKT2theS4gSSdsbCBjaGFuZ2UgaXQuCgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
