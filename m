From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v2 12/12] x86: activate per-vcpu stacks
 in case of xpti
Date: Wed, 31 Jan 2018 03:40:33 -0700
Message-ID: <5A71AB3102000078001A3F71@prv-mh.provo.novell.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-13-jgross@suse.com>
 <5A70AC7F02000078001A3CA6@suse.com>
 <5aeec5ac-843b-1c25-102a-c05eaeeda69c@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xytx=e2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1egpoo-0007Qe-4p
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2018 10:40:42 +0000
In-Reply-To: <5aeec5ac-843b-1c25-102a-c05eaeeda69c@suse.com>
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

Pj4+IE9uIDMwLjAxLjE4IGF0IDE4OjMzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAz
MC8wMS8xOCAxNzozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIyLjAxLjE4IGF0IDEz
OjMyLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9kb21h
aW4uYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2RvbWFpbi5jCj4+PiBAQCAtMTU4NSw5ICsxNTg1
LDI4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBuZWVkX2Z1bGxfZ2R0KGNvbnN0IHN0cnVjdCBkb21h
aW4gCj4+PiAqZCkKPj4+ICAgICAgcmV0dXJuIGlzX3B2X2RvbWFpbihkKSAmJiAhaXNfaWRsZV9k
b21haW4oZCk7Cj4+PiAgfQo+Pj4gIAo+Pj4gK3N0YXRpYyB2b2lkIGNvcHlfdXNlcl9yZWdzX2Zy
b21fc3RhY2soc3RydWN0IHZjcHUgKnYpCj4+PiArewo+Pj4gKyAgICBzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqc3RhY2tfcmVnczsKPj4gCj4+IGNvbnN0Cj4gCj4gT2theS4KPiAKPj4gCj4+PiArICAg
IHN0YWNrX3JlZ3MgPSAoaXNfcHZfdmNwdSh2KSAmJiB2LT5kb21haW4tPmFyY2gucHZfZG9tYWlu
LnhwdGkpCj4+PiArICAgICAgICAgICAgICAgICA/IHYtPmFyY2gucHZfdmNwdS5zdGFja19yZWdz
Cj4+PiArICAgICAgICAgICAgICAgICA6ICZnZXRfY3B1X2luZm8oKS0+Z3Vlc3RfY3B1X3VzZXJf
cmVnczsKPj4gCj4+IFVnbHkgb3BlbiBjb2Rpbmcgb2Ygd2hhdCBwcmV2aW91c2x5IHdhcyBndWVz
dF9jcHVfdXNlcl9yZWdzKCkuCj4gCj4gSSBoYXZlIHRvIG1ha2Ugc3VyZSB0byBhZGRyZXNzIHRo
ZSBwZXIgcGh5c2ljYWwgY3B1IHN0YWNrLgoKSSB3b3VsZCBoYXZlIGd1ZXNzZWQgdGhhdCdzIHRo
ZSByZWFzb24sIGJ1dCBlc3BlY2lhbGx5IHdoZW4KdXNlcyBhcmUgaW5jb25zaXN0ZW50IChzZWUg
ZS5nLiB0aGUgdHdvIE1TUl9JQTMyX1NZU0VOVEVSX0VTUAp3cml0ZXMpIGEgYnJpZWYgY29tbWVu
dCBzaG91bGQgYmUgYXR0YWNoZWQgdG8gY2xhcmlmeSB3aHkgdGhlCm90aGVyIHZhcmlhbnQgaXMg
dW5zdWl0YWJsZSBpbiB0aGUgc3BlY2lmaWMgY2FzZS4KCkphbgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
