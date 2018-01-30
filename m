From: Michael Glasgow <glasgow@beer.net>
Subject: Re: firmware/shim: fix build process to use POSIX find
	options
Date: Tue, 30 Jan 2018 12:57:28 -0600 (CST)
Message-ID: <201801301857.w0UIvSXT062690@dark.beer.net>
References: <20180129113709.afgogfzp3pszcav3@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=kyhp=ez=beer.net=glasgow@srs-us1.protection.inumbo.net>)
 id 1egb6B-0006Vp-JU
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2018 18:57:39 +0000
In-Reply-To: <20180129113709.afgogfzp3pszcav3@MacBook-Pro-de-Roger.local> from
 "Roger Pau [Monn_]" at "Jan 29, 2018 11:37:31 am"
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Roger Pau [Monn_]" <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Um9nZXIgUGF1IFtNb25uX10gd3JvdGU6Cj4gT24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDE6NTQ6
MzBQTSAtMDYwMCwgTWljaGFlbCBHbGFzZ293IHdyb3RlOgo+ID4gVGhpcyByZWNlbnQgcGF0Y2gg
Y2FuIGJlIHNpbXBsaWZpZWQgYSBiaXQuICAoVGhlIHBhdGNoIGJlbG93IGlzCj4gPiB1bnRlc3Rl
ZCwganVzdCBhIHN1Z2dlc3Rpb24uKQo+IAo+IFRoYW5rcywgdGhpcyBMR1RNLCBidXQgaXQgbmVl
ZHMgeW91ciBTaWduZWQtb2ZmLWJ5IHRhZyBpbiBvcmRlciB0byBiZQo+IGFwcGxpZWQuCgpTaW1w
bGlmeSBwb3NpeC1mcmllbmRseSBjaGFuZ2VzIGEgYml0LgoKU2lnbmVkLW9mZi1ieTogTWljaGFl
bCBHbGFzZ293IDxnbGFzZ293QGJlZXIubmV0PgotLS0KCmRpZmYgLXVyIGEvdG9vbHMvZmlybXdh
cmUveGVuLWRpci9NYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUKLS0t
IGEvdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtlZmlsZSAgIDIwMTgtMDEtMjYgMTE6NDA6MDAu
NzExMzg5NjA1IC0wNjAwCisrKyBiL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgICAy
MDE4LTAxLTI2IDExOjUxOjQxLjI3OTgyNTE0MiAtMDYwMApAQCAtMjAsOSArMjAsOCBAQAogICAg
ICAgIHJtIC1mIGxpbmtmYXJtLnN0YW1wLnRtcAogICAgICAgICQoZm9yZWFjaCBkLCAkKExJTktf
RElSUyksIFwKICAgICAgICAgICAgICAgICAobWtkaXIgLXAgJChEKS8kKGQpOyBcCi0gICAgICAg
ICAgICAgICAgIGNkICQoRCkvJChkKTsgXAotICAgICAgICAgICAgICAgICBmaW5kICQoWEVOX1JP
T1QpLyQoZCkvIC10eXBlIGQgLWV4ZWMgc2ggLWMgXAotICAgICAgICAgICAgICAgICAgICAgImVj
aG8ge30gfCBzZWQgJ3MsXiQoWEVOX1JPT1QpLyQoZCkvLCxnJyB8IHhhcmdzIG1rZGlyIC1wIgog
XDspOykKKyAgICAgICAgICAgICAgICAgY2QgJChEKS8kKGQpICYmIFwKKyAgICAgICAgICAgICAg
ICAgKGNkICQoWEVOX1JPT1QpLyQoZCkgJiYgZmluZCAuIC10eXBlIGQpIHwgeGFyZ3MgbWtkaXIg
LXAgXDspOykKICAgICAgICAkKGZvcmVhY2ggZCwgJChMSU5LX0RJUlMpLCBcCiAgICAgICAgICAg
ICAgICAoY2QgJChYRU5fUk9PVCk7IFwKICAgICAgICAgICAgICAgICBmaW5kICQoZCkgISAtdHlw
ZSBsIC10eXBlIGYgXAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
