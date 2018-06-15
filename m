From: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC] xen: Don't use
 memory_region_init_ram_nomigrate() in pci_assign_dev_load_option_rom()
Date: Fri, 15 Jun 2018 11:06:47 +0100
Message-ID: <CAFEAcA_X2V-YkM1ZeCHMPW3cQBk2=ZQ4BAgtcg67Eb+OuADbgQ@mail.gmail.com>
References: <20180601175910.28146-1-peter.maydell@linaro.org>
 <20180605165507.GB2165@perard.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tv/q=jb=linaro.org=peter.maydell@srs-us1.protection.inumbo.net>)
 id 1fTldN-0008BZ-Uz
 for xen-devel@lists.xenproject.org; Fri, 15 Jun 2018 10:07:10 +0000
Received: by mail-oi0-x243.google.com with SMTP id i205-v6so8339436oib.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jun 2018 03:07:08 -0700 (PDT)
In-Reply-To: <20180605165507.GB2165@perard.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "open list:X86" <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>, QEMU Developers <qemu-devel@nongnu.org>, "patches@linaro.org" <patches@linaro.org>
List-Id: xen-devel@lists.xenproject.org

T24gNSBKdW5lIDIwMTggYXQgMTc6NTUsIEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPiB3cm90ZToKPiBPbiBGcmksIEp1biAwMSwgMjAxOCBhdCAwNjo1OToxMFBNICsw
MTAwLCBQZXRlciBNYXlkZWxsIHdyb3RlOgo+PiBUaGUgeGVuIHBjaV9hc3NpZ25fZGV2X2xvYWRf
b3B0aW9uX3JvbSgpIGN1cnJlbnRseSBjcmVhdGVzIGEgUkFNCj4+IG1lbW9yeSByZWdpb24gd2l0
aCBtZW1vcnlfcmVnaW9uX2luaXRfcmFtX25vbWlncmF0ZSgpLCBhbmQgdGhlbgo+PiBtYW51YWxs
eSByZWdpc3RlcnMgaXQgd2l0aCB2bXN0YXRlX3JlZ2lzdGVyX3JhbSgpLiBJbiBmYWN0IGZvcgo+
PiBpdHMgb25seSBjYWxsc2l0ZSwgdGhlICdvd25lcicgcG9pbnRlciB3ZSB1c2UgZm9yIHRoZSBp
bml0IGNhbGwKPj4gYW5kIHRoZSAnJmRldi0+cWRldicgcG9pbnRlciB3ZSB1c2UgZm9yIHRoZSB2
bXN0YXRlX3JlZ2lzdGVyX3JhbSgpCj4+IGNhbGwgcmVmZXIgdG8gdGhlIHNhbWUgb2JqZWN0LiBT
aW1wbGlmeSB0aGUgZnVuY3Rpb24gdG8gb25seQo+PiB0YWtlIGEgcG9pbnRlciB0byB0aGUgZGV2
aWNlIG9uY2UgaW5zdGVhZCBvZiB0d2ljZSwgYW5kIHVzZQo+PiBtZW1vcnlfcmVnaW9uX2luaXRf
cmFtKCkgd2hpY2ggYXV0b21hdGljYWxseSBkb2VzIHRoZSB2bXN0YXRlCj4+IHJlZ2lzdGVyIGZv
ciB1cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBs
aW5hcm8ub3JnPgo+PiAtLS0KPj4gVGhpcyBpcyBhIGZhaXJseSB0cml2aWFsIG5vLWJlaGF2aW91
ci1jaGFuZ2UgY29kZSBjbGVhbnVwLCBidXQKPj4gSSd2ZSBtYXJrZWQgaXQgYXMgUkZDIGJlY2F1
c2UgSSBkb24ndCBoYXZlIGEgc2V0dXAgZm9yIGRvaW5nCj4+IG1vcmUgdGhhbiBqdXN0IGNvbXBp
bGUtdGVzdGluZyBYZW4gcmVsYXRlZCBwYXRjaGVzLgo+PiBUaGlzIHdhcyBmb3VuZCBhcyBwYXJ0
IG9mIGEgc3dlZXAgdGhyb3VnaCBmb3IgY29kZSB1c2luZwo+PiB0aGUgX25vbWlncmF0ZSB2ZXJz
aW9ucyBvZiBmdW5jdGlvbnMuCj4KPiBUaGF0IHBhdGNoIGxvb2tzIGZpbmUsIGFuZCBzZWFtcyBm
aW5lIGFmdGVyIGhhY2tpbmcgbXkgd2F5IGludG8gdGVzdGluZwo+IHRoZSBjaGFuZ2UuCj4KPiBB
Y2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFu
a3MgZm9yIHRoZSByZXZpZXcuIFN0ZWZhbm8sIGRvIHlvdSB3YW50IHRvIHRha2UgaXQgdmlhIHRo
ZQp4ZW4gc3VidHJlZT8KCnRoYW5rcwotLSBQTU0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
