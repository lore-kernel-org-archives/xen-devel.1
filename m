From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 07/13] libx86: Introduce a helper to
 serialise msr_{domain, vcpu}_policy objects
Date: Wed, 4 Jul 2018 17:56:18 +0100
Message-ID: <52ee82b3-38c2-af68-0af6-fa734baf2d98@citrix.com>
References: <1530651326-5320-1-git-send-email-andrew.cooper3@citrix.com>
 <1530651326-5320-8-git-send-email-andrew.cooper3@citrix.com>
 <5B3C907902000078001D0EDD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5B3C907902000078001D0EDD@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDcvMTggMTA6MTYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Cj4+IEBAIC0zMjUsNiArMzI1
LDEzIEBAIHR5cGVkZWYgc3RydWN0IHhlbl9jcHVpZF9sZWFmIHsKPj4gIH0geGVuX2NwdWlkX2xl
YWZfdDsKPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhlbl9jcHVpZF9sZWFmX3QpOwo+PiAg
Cj4+ICt0eXBlZGVmIHN0cnVjdCB4ZW5fbXNyX2VudHJ5IHsKPj4gKyAgICB1aW50MzJfdCBpZHg7
Cj4+ICsgICAgdWludDMyX3QgZmxhZ3M7IC8qIFJlc2VydmVkIE1CWi4gKi8KPiAuLi4gaXQgcmVt
YWlucyB1bmNsZWFyIGluIHRoaXMgcGF0Y2ggd2hvc2UgcmVzcG9uc2liaWxpdHkgaXQgaXMgdG8g
Y2xlYXIgdGhpcwo+IGZpZWxkLiBJIHdvbmRlciB3aGV0aGVyIGNvcHlfbXNyX3RvX2J1ZmZlcigp
IHNob3VsZCBtYWtlIHN1cmUgb2YgdGhpcy4KCmNvcHlfbXNyX3RvX2J1ZmZlcigpIGRvZXMgZXhw
bGljaXRseSB6ZXJvIHRoaXMgZmllbGQuCgo+ICsgICAgY29uc3QgeGVuX21zcl9lbnRyeV90IGVu
dCA9IHsgLmlkeCA9IGlkeCwgLnZhbCA9IHZhbCB9OwoKZ3VhcmFudGVlcyB0aGF0IHRoZSBmbGFn
cyBmaWVsZCBpcyAwLgoKRldJVywgYW4gZWFybGllciB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzIGhh
cyBhbiBBVkFJTEFCTEUgYml0IHNwZWNpZmllZAppbiB0aGUgZmxhZ3MgZmllbGQsIGJ1dCBhdHRl
bXB0aW5nIHRvIHRoZSBtYXJzaGFsbGluZyBjb2RlIHdvcmsgc2Vuc2libHkKaXMgd2h5IEkgZXZl
bnR1YWxseSBkZWNpZGVkIHRvIHdyaXRlIGMvcyAyZGYxZDJiYTEzMmZmICJ4ODYvbXNyOiBEcm9w
CntNSVNDX0VOQUJMRVMsUExBVEZPUk1fSU5GT30uYXZhaWxhYmxlIiBhcyBhbiBhbHRlcm5hdGl2
ZSBmaXggZm9yIHRoZQpwcm9ibGVtLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
