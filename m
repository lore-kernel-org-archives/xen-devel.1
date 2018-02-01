From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: firmware/shim: fix build process to use POSIX find
 options
Date: Thu, 01 Feb 2018 03:25:50 -0700
Message-ID: <5A72F93E02000078001A4453@prv-mh.provo.novell.com>
References: <20180129113709.afgogfzp3pszcav3@MacBook-Pro-de-Roger.local>
 <201801301857.w0UIvSXT062690@dark.beer.net>
 <20180201101358.53jhbmdhrof4f7mp@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=xbw8=e3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ehC46-0001Zs-UT
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2018 10:25:58 +0000
In-Reply-To: <20180201101358.53jhbmdhrof4f7mp@MacBook-Pro-de-Roger.local>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Michael Glasgow <glasgow@beer.net>, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjAyLjE4IGF0IDExOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDMwLCAyMDE4IGF0IDEyOjU3OjI4UE0gLTA2MDAsIE1pY2hhZWwgR2xhc2dv
dyB3cm90ZToKPj4gUm9nZXIgUGF1IFtNb25uX10gd3JvdGU6Cj4+ID4gT24gRnJpLCBKYW4gMjYs
IDIwMTggYXQgMDE6NTQ6MzBQTSAtMDYwMCwgTWljaGFlbCBHbGFzZ293IHdyb3RlOgo+PiA+ID4g
VGhpcyByZWNlbnQgcGF0Y2ggY2FuIGJlIHNpbXBsaWZpZWQgYSBiaXQuICAoVGhlIHBhdGNoIGJl
bG93IGlzCj4+ID4gPiB1bnRlc3RlZCwganVzdCBhIHN1Z2dlc3Rpb24uKQo+PiA+IAo+PiA+IFRo
YW5rcywgdGhpcyBMR1RNLCBidXQgaXQgbmVlZHMgeW91ciBTaWduZWQtb2ZmLWJ5IHRhZyBpbiBv
cmRlciB0byBiZQo+PiA+IGFwcGxpZWQuCj4+IAo+PiBTaW1wbGlmeSBwb3NpeC1mcmllbmRseSBj
aGFuZ2VzIGEgYml0Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBHbGFzZ293IDxnbGFz
Z293QGJlZXIubmV0Pgo+IAo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiAKPiBXaXRoIG9uZSBuaXQuLi4KPiAKPj4gLS0tCj4+IAo+PiBkaWZm
IC11ciBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUgYi90b29scy9maXJtd2FyZS94
ZW4tZGlyL01ha2VmaWxlCj4+IC0tLSBhL3Rvb2xzL2Zpcm13YXJlL3hlbi1kaXIvTWFrZWZpbGUg
ICAyMDE4LTAxLTI2IDExOjQwOjAwLjcxMTM4OTYwNSAtMDYwMAo+PiArKysgYi90b29scy9maXJt
d2FyZS94ZW4tZGlyL01ha2VmaWxlICAgMjAxOC0wMS0yNiAxMTo1MTo0MS4yNzk4MjUxNDIgLTA2
MDAKPj4gQEAgLTIwLDkgKzIwLDggQEAKPj4gICAgICAgICBybSAtZiBsaW5rZmFybS5zdGFtcC50
bXAKPj4gICAgICAgICAkKGZvcmVhY2ggZCwgJChMSU5LX0RJUlMpLCBcCj4+ICAgICAgICAgICAg
ICAgICAgKG1rZGlyIC1wICQoRCkvJChkKTsgXAo+PiAtICAgICAgICAgICAgICAgICBjZCAkKEQp
LyQoZCk7IFwKPj4gLSAgICAgICAgICAgICAgICAgZmluZCAkKFhFTl9ST09UKS8kKGQpLyAtdHlw
ZSBkIC1leGVjIHNoIC1jIFwKPj4gLSAgICAgICAgICAgICAgICAgICAgICJlY2hvIHt9IHwgc2Vk
ICdzLF4kKFhFTl9ST09UKS8kKGQpLywsZycgfCB4YXJncyBta2RpciAtcCIKPj4gIFw7KTspCj4+
ICsgICAgICAgICAgICAgICAgIGNkICQoRCkvJChkKSAmJiBcCj4gCj4gVGhlcmUgc2hvdWxkIGJl
IG5vIG5lZWQgZm9yIHRoZSAnJiYnLCBhbGwgdGhpcyBjaHVuayBzaG91bGQgYmUKPiBleGVjdXRl
ZCB3aXRoICdzZXQgLWUnLCBzbyBwbGVhc2UgcmVzdG9yZSB0aGUgcHJldmlvdXMgJzsnLgoKQXMg
eW91J3ZlIHNlZW4gZnJvbSB0aGUgcGF0Y2ggSSd2ZSBzZW50IC0gInNob3VsZCBiZSIgIT0gImlz
Ii4KVGhlIHdheSBpdCdzIGN1cnJlbnRseSBwbGFjZWQgdGhlICJzZXQgLWUiIGhhcyBubyBlZmZl
Y3QgYXQgYWxsLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
