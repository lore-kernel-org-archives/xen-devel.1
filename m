From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Tue, 21 Aug 2018 06:40:42 -0600
Message-ID: <5B7C084A02000078001E07CD@prv1-mh.provo.novell.com>
References: <5B7BED1B02000078001E063C@suse.com>
 <eea4129d-f92d-166e-0bb5-4b8b8b966529@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs5xp-0005z1-4y
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 12:40:49 +0000
In-Reply-To: <eea4129d-f92d-166e-0bb5-4b8b8b966529@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjA4LjE4IGF0IDE0OjEzLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAy
MS8wOC8xOCAxMjo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEBAIC0yMTksMTcgKzIxNiwxMyBA
QCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9zcGVjX2N0cmwoY29uc3QKPj4gIH0KPj4gIGN1c3Rv
bV9wYXJhbSgic3BlYy1jdHJsIiwgcGFyc2Vfc3BlY19jdHJsKTsKPj4gIAo+PiAtaW50OF90IF9f
cmVhZF9tb3N0bHkgb3B0X3B2X2wxdGYgPSAtMTsKPj4gK3VpbnQ4X3QgX19yZWFkX21vc3RseSBv
cHRfcHZfbDF0ZiA9IE9QVF9QVl9MMVRGX0RPTVVfREVGQVVMVDsKPj4gIAo+PiAgc3RhdGljIF9f
aW5pdCBpbnQgcGFyc2VfcHZfbDF0Zihjb25zdCBjaGFyICpzKQo+PiAgewo+PiAgICAgIGNvbnN0
IGNoYXIgKnNzOwo+PiAgICAgIGludCB2YWwsIHJjID0gMDsKPj4gIAo+PiAtICAgIC8qIEluaGli
aXQgdGhlIGRlZmF1bHRzIGFzIGFuIGV4cGxpY2l0IGNob2ljZSBoYXMgYmVlbiBnaXZlbi4gKi8K
Pj4gLSAgICBpZiAoIG9wdF9wdl9sMXRmID09IC0xICkKPj4gLSAgICAgICAgb3B0X3B2X2wxdGYg
PSAwOwo+IAo+IFdvdWxkbid0IHNldHRpbmcgdGhlIGRlZmF1bHQgdmFsdWUgKERPTVUpIGhlcmUg
YmUgZW5vdWdoPyBTYW1lIGZvcgo+IHhwdGkgYmVsb3c/CgpObywgYmVjYXVzZSB3ZSB3YW50IHRv
IGRlZmVyIGRlZmF1bHQgcHJvY2Vzc2luZyB1bnRpbCB3ZSd2ZQphY3R1YWxseSBvYnRhaW5lZCB0
aGUgbmVjZXNzYXJ5IGRhdGEuIFdoaWxlIHBhcnNpbmcgd2UgZG9uJ3QKa25vdyB5ZXQgd2hldGhl
ciAiZGVmYXVsdCIgbWVhbnMgIm9uIiBvciAib2ZmIi4KCk9yIHBlcmhhcHMgSSBkb24ndCB1bmRl
cnN0YW5kIHdoYXQgeW91IG1lYW4/Cgo+PiBAQCAtMjUwLDEzICsyNDMsMTYgQEAgc3RhdGljIF9f
aW5pdCBpbnQgcGFyc2VfcHZfbDF0Zihjb25zdCBjaAo+PiAgICAgICAgICAgICAgYnJlYWs7Cj4+
ICAKPj4gICAgICAgICAgZGVmYXVsdDoKPj4gLSAgICAgICAgICAgIGlmICggKHZhbCA9IHBhcnNl
X2Jvb2xlYW4oImRvbTAiLCBzLCBzcykpID49IDAgKQo+PiArICAgICAgICAgICAgaWYgKCAhc3Ry
Y21wKHMsICJkZWZhdWx0IikgKQo+PiArICAgICAgICAgICAgICAgIG9wdF94cHRpID0gT1BUX1BW
X0wxVEZfRE9NVV9ERUZBVUxUOwo+IAo+IG9wdF9wdl9sMXRmCgpBcmdoLCBhZ2Fpbi4gQW5kIEkn
dmUgdHJpZWQgdG8gYmUgc3VwZXIgY2FyZWZ1bC4uLiBUaGFua3MgZm9yCm5vdGljaW5nIQoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
