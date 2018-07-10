From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] xen: Introduce an xmemdup() helper
Date: Tue, 10 Jul 2018 02:38:28 -0600
Message-ID: <5B44708402000078001D2827@prv1-mh.provo.novell.com>
References: <1531132188-20564-1-git-send-email-andrew.cooper3@citrix.com>
 <1531132188-20564-2-git-send-email-andrew.cooper3@citrix.com>
 <20180710083216.isy642byvnaixxzl@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180710083216.isy642byvnaixxzl@mac.bytemobile.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEwLjA3LjE4IGF0IDEwOjMyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgSnVsIDA5LCAyMDE4IGF0IDExOjI5OjQ3QU0gKzAxMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi94bWFsbG9jLmgKPj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3htYWxsb2MuaAo+PiBAQCAtMTMsNiArMTMsMTYgQEAKPj4gICNkZWZpbmUgeG1h
bGxvYyhfdHlwZSkgKChfdHlwZSAqKV94bWFsbG9jKHNpemVvZihfdHlwZSksIAo+IF9fYWxpZ25v
Zl9fKF90eXBlKSkpCj4+ICAjZGVmaW5lIHh6YWxsb2MoX3R5cGUpICgoX3R5cGUgKilfeHphbGxv
YyhzaXplb2YoX3R5cGUpLCAKPiBfX2FsaWdub2ZfXyhfdHlwZSkpKQo+PiAgCj4+ICsvKiBBbGxv
Y2F0ZSBzcGFjZSBmb3IgYSB0eXBlZCBvYmplY3QgYW5kIGNvcHkgYW4gZXhpc3RpbmcgaW5zdGFu
Y2UuICovCj4+ICsjZGVmaW5lIHhtZW1kdXAocHRyKSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+PiArKHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPj4gKyAgICB0eXBlb2YoKihwdHIpKSAqcF8gPSAo
cHRyKSwgKm5fID0geG1hbGxvYyh0eXBlb2YoKnBfKSk7ICBcCj4gCj4gQ291bGQgeW91IGRvPwo+
IAo+IGNvbnN0IHR5cGVvZigqKHB0cikpICpwXyA9IChwdHIpOwo+IHR5cGVvZigqKHB0cikpICpu
XyA9IHhtYWxsb2ModHlwZW9mKCpwXykpOwoKV291bGRuJ3QgdGhpcyBzZWNvbmQgbGluZSBhZ2Fp
biBkaXNjYXJkIGNvbnN0IHRoZW4/IElmIGFueXRoaW5nIEkKd2FzIHdvbmRlcmluZyB3aGV0aGVy
IHBfIGlzIG5lZWRlZCBpbiB0aGUgZmlyc3QgcGxhY2UuCgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
