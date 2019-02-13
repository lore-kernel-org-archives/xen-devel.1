From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v2 4/7] pvh/dom0: warn when
 dom0_mem is not set
Date: Wed, 13 Feb 2019 09:01:07 -0700
Message-ID: <5C643F430200007800216632@prv1-mh.provo.novell.com>
References: <20190211174642.38046-1-roger.pau@citrix.com>
 <20190211174642.38046-5-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EuM9=QU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtwyF-0002o6-IK
 for xen-devel@lists.xenproject.org; Wed, 13 Feb 2019 16:01:11 +0000
In-Reply-To: <20190211174642.38046-5-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjAyLjE5IGF0IDE4OjQ2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IFRoZXJlIGhhdmUgYmVlbiBzZXZlcmFsIHJlcG9ydHMgb2YgdGhlIGRvbTAgYnVpbGRlciBydW5u
aW5nIG91dCBvZgo+IG1lbW9yeSB3aGVuIGJ1aWxkaW5nIGEgUFZIIGRvbTAgd2l0aG91dCBoYXZp
bmcgc3BlY2lmaWVkIGEgZG9tMF9tZW0KPiB2YWx1ZS4gUHJpbnQgYSB3YXJuaW5nIG1lc3NhZ2Ug
aWYgZG9tMF9tZW0gaXMgbm90IHNldCB3aGVuIGJvb3RpbmcgaW4KPiBQVkggbW9kZS4KPiAKPiBU
aGlzIGlzIGEgdGVtcG9yYXJ5IHdvcmthcm91bmQgdW50aWwgYWNjb3VudGluZyBmb3IgaW50ZXJu
YWwgbWVtb3J5Cj4gcmVxdWlyZWQgYnkgWGVuIChpZTogcGFnaW5nIHN0cnVjdHVyZXMpIGlzIGlt
cHJvdmVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkkg
dGFrZSBpdCB0aGF0IC4uLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCj4gKysr
IGIveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+IEBAIC0zNzgsOCArMzc4LDE4IEBAIHVuc2ln
bmVkIGxvbmcgX19pbml0IGRvbTBfY29tcHV0ZV9ucl9wYWdlcygKPiAgICAgICAgICAgKiBtYXhp
bXVtIG9mIDEyOE1CLgo+ICAgICAgICAgICAqLwo+ICAgICAgICAgIGlmICggIW5yX3BhZ2VzICkK
PiArICAgICAgICB7Cj4gICAgICAgICAgICAgIG5yX3BhZ2VzID0gYXZhaWwgLSAocHZfc2hpbSA/
IHB2X3NoaW1fbWVtKGF2YWlsKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA6
IG1pbihhdmFpbCAvIDE2LCAxMjhVTCA8PCAoMjAgLSBQQUdFX1NISUZUKSkpOwo+ICsgICAgICAg
ICAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgKQo+ICsgICAgICAgICAgICAgICAgLyoKPiArICAg
ICAgICAgICAgICAgICAqIFRlbXBvcmFyeSB3b3JrYXJvdW5kIG1lc3NhZ2UgdW50aWwgaW50ZXJu
YWwgKHBhZ2luZykgbWVtb3J5Cj4gKyAgICAgICAgICAgICAgICAgKiBhY2NvdW50aW5nIHJlcXVp
cmVkIHRvIGJ1aWxkIGEgcHZoIGRvbTAgaXMgaW1wcm92ZWQuCj4gKyAgICAgICAgICAgICAgICAg
Ki8KPiArICAgICAgICAgICAgICAgIHByaW50aygiV0FSTklORzogUFZIIGRvbTAgd2l0aG91dCBk
b20wX21lbSBzZXQgaXMgc3RpbGwgdW5zdGFibGUuICIKPiArICAgICAgICAgICAgICAgICAgICAg
ICAiSWYgeW91IGdldCBjcmFzaGVzIGR1cmluZyBib290LCB0cnkgYWRkaW5nIGEgZG9tMF9tZW0g
cGFyYW1ldGVyXG4iKTsKPiArICAgICAgICB9CgouLi4geW91IGNvbnNpZGVyIGl0IGFjY2VwdGFi
bGUgZm9yIHRoZSBtZXNzYWdlIHRvIGJlIGxvZ2dlZCB0d2ljZQppbiBjZXJ0YWluIGNhc2VzPwoK
SmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
