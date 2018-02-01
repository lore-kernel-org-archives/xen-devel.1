From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: firmware/shim: fix build process to use POSIX find
 options
Date: Thu, 1 Feb 2018 10:29:44 +0000
Message-ID: <20180201102944.t6ns3juah6x4ccwd@MacBook-Pro-de-Roger.local>
References: <20180129113709.afgogfzp3pszcav3@MacBook-Pro-de-Roger.local>
 <201801301857.w0UIvSXT062690@dark.beer.net>
 <20180201101358.53jhbmdhrof4f7mp@MacBook-Pro-de-Roger.local>
 <5A72F93E02000078001A4453@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tmgq=e3=citrix.com=prvs=563c9b0be=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ehC7w-0001sS-7b
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 10:29:56 +0000
Content-Disposition: inline
In-Reply-To: <5A72F93E02000078001A4453@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Michael Glasgow <glasgow@beer.net>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBGZWIgMDEsIDIwMTggYXQgMDM6MjU6NTBBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDAxLjAyLjE4IGF0IDExOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gVHVlLCBKYW4gMzAsIDIwMTggYXQgMTI6NTc6MjhQTSAtMDYwMCwgTWljaGFl
bCBHbGFzZ293IHdyb3RlOgo+ID4+IFJvZ2VyIFBhdSBbTW9ubl9dIHdyb3RlOgo+ID4+ID4gT24g
RnJpLCBKYW4gMjYsIDIwMTggYXQgMDE6NTQ6MzBQTSAtMDYwMCwgTWljaGFlbCBHbGFzZ293IHdy
b3RlOgo+ID4+ID4gPiBUaGlzIHJlY2VudCBwYXRjaCBjYW4gYmUgc2ltcGxpZmllZCBhIGJpdC4g
IChUaGUgcGF0Y2ggYmVsb3cgaXMKPiA+PiA+ID4gdW50ZXN0ZWQsIGp1c3QgYSBzdWdnZXN0aW9u
LikKPiA+PiA+IAo+ID4+ID4gVGhhbmtzLCB0aGlzIExHVE0sIGJ1dCBpdCBuZWVkcyB5b3VyIFNp
Z25lZC1vZmYtYnkgdGFnIGluIG9yZGVyIHRvIGJlCj4gPj4gPiBhcHBsaWVkLgo+ID4+IAo+ID4+
IFNpbXBsaWZ5IHBvc2l4LWZyaWVuZGx5IGNoYW5nZXMgYSBiaXQuCj4gPj4gCj4gPj4gU2lnbmVk
LW9mZi1ieTogTWljaGFlbCBHbGFzZ293IDxnbGFzZ293QGJlZXIubmV0Pgo+ID4gCj4gPiBSZXZp
ZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiAKPiA+
IFdpdGggb25lIG5pdC4uLgo+ID4gCj4gPj4gLS0tCj4gPj4gCj4gPj4gZGlmZiAtdXIgYS90b29s
cy9maXJtd2FyZS94ZW4tZGlyL01ha2VmaWxlIGIvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtl
ZmlsZQo+ID4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgICAyMDE4LTAx
LTI2IDExOjQwOjAwLjcxMTM4OTYwNSAtMDYwMAo+ID4+ICsrKyBiL3Rvb2xzL2Zpcm13YXJlL3hl
bi1kaXIvTWFrZWZpbGUgICAyMDE4LTAxLTI2IDExOjUxOjQxLjI3OTgyNTE0MiAtMDYwMAo+ID4+
IEBAIC0yMCw5ICsyMCw4IEBACj4gPj4gICAgICAgICBybSAtZiBsaW5rZmFybS5zdGFtcC50bXAK
PiA+PiAgICAgICAgICQoZm9yZWFjaCBkLCAkKExJTktfRElSUyksIFwKPiA+PiAgICAgICAgICAg
ICAgICAgIChta2RpciAtcCAkKEQpLyQoZCk7IFwKPiA+PiAtICAgICAgICAgICAgICAgICBjZCAk
KEQpLyQoZCk7IFwKPiA+PiAtICAgICAgICAgICAgICAgICBmaW5kICQoWEVOX1JPT1QpLyQoZCkv
IC10eXBlIGQgLWV4ZWMgc2ggLWMgXAo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAiZWNobyB7
fSB8IHNlZCAncyxeJChYRU5fUk9PVCkvJChkKS8sLGcnIHwgeGFyZ3MgbWtkaXIgLXAiCj4gPj4g
IFw7KTspCj4gPj4gKyAgICAgICAgICAgICAgICAgY2QgJChEKS8kKGQpICYmIFwKPiA+IAo+ID4g
VGhlcmUgc2hvdWxkIGJlIG5vIG5lZWQgZm9yIHRoZSAnJiYnLCBhbGwgdGhpcyBjaHVuayBzaG91
bGQgYmUKPiA+IGV4ZWN1dGVkIHdpdGggJ3NldCAtZScsIHNvIHBsZWFzZSByZXN0b3JlIHRoZSBw
cmV2aW91cyAnOycuCj4gCj4gQXMgeW91J3ZlIHNlZW4gZnJvbSB0aGUgcGF0Y2ggSSd2ZSBzZW50
IC0gInNob3VsZCBiZSIgIT0gImlzIi4KPiBUaGUgd2F5IGl0J3MgY3VycmVudGx5IHBsYWNlZCB0
aGUgInNldCAtZSIgaGFzIG5vIGVmZmVjdCBhdCBhbGwuCgpIZWhlLCB5ZXMsIEkndmUgcmVhbGl6
ZWQgdGhhdCwgdGhhdCdzIHdoeSBJJ3ZlIHNhaWQgInNob3VsZCBiZSIuIEluCmFueSBjYXNlIHRo
aXMgc2hvdWxkIHN0YXkgYXMgJzsnIGFuZCB0aGUgc2V0IC1lIGZpeGVkIGxpa2UgeW91IGRvIGlu
CnlvdXIgcGF0Y2guCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
