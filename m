From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 12/13] x86/sysctl: Implement
 XEN_SYSCTL_get_cpu_policy
Date: Mon, 16 Jul 2018 05:04:04 -0600
Message-ID: <5B4C7BA402000078001D4514@prv1-mh.provo.novell.com>
References: <1531512194-6865-1-git-send-email-andrew.cooper3@citrix.com>
 <1531512194-6865-13-git-send-email-andrew.cooper3@citrix.com>
 <20180716101611.htzgozwkh36trikz@mac.bytemobile.com>
 <3dc5e891-ddca-5f8f-8e21-276422a5367d@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3dc5e891-ddca-5f8f-8e21-276422a5367d@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjA3LjE4IGF0IDEyOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDcvMTggMTE6MTYsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Cj4+PiAr
Cj4+PiArICAgIHN5c2N0bC5jbWQgPSBYRU5fU1lTQ1RMX2dldF9jcHVfcG9saWN5Owo+Pj4gKyAg
ICBzeXNjdGwudS5jcHVfcG9saWN5LmluZGV4ID0gaW5kZXg7Cj4+PiArICAgIHN5c2N0bC51LmNw
dV9wb2xpY3kubnJfbGVhdmVzID0gKm5yX2xlYXZlczsKPj4+ICsgICAgc2V0X3hlbl9ndWVzdF9o
YW5kbGUoc3lzY3RsLnUuY3B1X3BvbGljeS5jcHVpZF9wb2xpY3ksIGxlYXZlcyk7Cj4+PiArICAg
IHN5c2N0bC51LmNwdV9wb2xpY3kubnJfbXNycyA9ICpucl9tc3JzOwo+Pj4gKyAgICBzZXRfeGVu
X2d1ZXN0X2hhbmRsZShzeXNjdGwudS5jcHVfcG9saWN5Lm1zcl9wb2xpY3ksIG1zcnMpOwo+PiBz
eXNjdGwgY2FuIGJlIGluaXRpYWxpemVkIGF0IGRlY2xhcmF0aW9uIHRpbWUgaW5zdGVhZCBvZiB6
ZXJvaW5nIGl0Cj4+IGFuZCB0aGVuIHNldHRpbmcgdGhlIGZpZWxkczoKPj4KPj4gc3RydWN0IHhl
bl9zeXNjdGwgc3lzY3RsID0gewo+PiAgICAgLmNtZCA9IFhFTl9TWVNDVExfZ2V0X2NwdV9wb2xp
Y3k7Cj4+ICAgICAudS5jcHVfcG9saWN5LmluZGV4ID0gaW5kZXg7Cj4+ICAgICAudS5jcHVfcG9s
aWN5Lm5yX2xlYXZlcyA9ICpucl9sZWF2ZXM7Cj4+ICAgICAuLi4KPj4gfTsKPiAKPiBUaGlzIGRv
ZXNuJ3QgY29tcGlsZSBpbiBhIENlbnRPUyA2IGVyYSBHQ0MuICBJdCBjYW4ndCBjb3BlIHdpdGgK
PiBpbml0aWFsaXNlcnMgb2YgYW5vbnltb3VzIHVuaW9ucywgYW5kIGlzIHRoZSByZWFzb24gd2h5
IGEgbG90IG9mIHRoZQo+IHRvb2xzdGFjayBsb2dpYyBpcyBpbiB0aGUgZm9ybSBwcmVzZW50ZWQg
aW4gdGhpcyBwYXRjaCwgcmF0aGVyIHRoYW4gdGhlCj4gY2xlYW5lciBvcHRpb24geW91IHByZXNl
bnQuCgpCdXQgd2hlcmUncyB0aGUgYW5vbnltb3VzIHVuaW9uIGhlcmU/IFN1Y2ggc2hvdWxkbid0
IGJlIHVzZWQgaW4gdGhlCnB1YmxpYyBoZWFkZXJzIGFueXdheS4KCkphbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
