From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [RFC] xen: Don't use
 memory_region_init_ram_nomigrate() in pci_assign_dev_load_option_rom()
Date: Tue, 5 Jun 2018 17:55:07 +0100
Message-ID: <20180605165507.GB2165@perard.uk.xensource.com>
References: <20180601175910.28146-1-peter.maydell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pctf=ix=citrix.com=prvs=687e870ee=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fQFEl-0004uO-H0
 for xen-devel@lists.xenproject.org; Tue, 05 Jun 2018 16:55:11 +0000
Content-Disposition: inline
In-Reply-To: <20180601175910.28146-1-peter.maydell@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, patches@linaro.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKdW4gMDEsIDIwMTggYXQgMDY6NTk6MTBQTSArMDEwMCwgUGV0ZXIgTWF5ZGVsbCB3
cm90ZToKPiBUaGUgeGVuIHBjaV9hc3NpZ25fZGV2X2xvYWRfb3B0aW9uX3JvbSgpIGN1cnJlbnRs
eSBjcmVhdGVzIGEgUkFNCj4gbWVtb3J5IHJlZ2lvbiB3aXRoIG1lbW9yeV9yZWdpb25faW5pdF9y
YW1fbm9taWdyYXRlKCksIGFuZCB0aGVuCj4gbWFudWFsbHkgcmVnaXN0ZXJzIGl0IHdpdGggdm1z
dGF0ZV9yZWdpc3Rlcl9yYW0oKS4gSW4gZmFjdCBmb3IKPiBpdHMgb25seSBjYWxsc2l0ZSwgdGhl
ICdvd25lcicgcG9pbnRlciB3ZSB1c2UgZm9yIHRoZSBpbml0IGNhbGwKPiBhbmQgdGhlICcmZGV2
LT5xZGV2JyBwb2ludGVyIHdlIHVzZSBmb3IgdGhlIHZtc3RhdGVfcmVnaXN0ZXJfcmFtKCkKPiBj
YWxsIHJlZmVyIHRvIHRoZSBzYW1lIG9iamVjdC4gU2ltcGxpZnkgdGhlIGZ1bmN0aW9uIHRvIG9u
bHkKPiB0YWtlIGEgcG9pbnRlciB0byB0aGUgZGV2aWNlIG9uY2UgaW5zdGVhZCBvZiB0d2ljZSwg
YW5kIHVzZQo+IG1lbW9yeV9yZWdpb25faW5pdF9yYW0oKSB3aGljaCBhdXRvbWF0aWNhbGx5IGRv
ZXMgdGhlIHZtc3RhdGUKPiByZWdpc3RlciBmb3IgdXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0
ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPgo+IC0tLQo+IFRoaXMgaXMgYSBm
YWlybHkgdHJpdmlhbCBuby1iZWhhdmlvdXItY2hhbmdlIGNvZGUgY2xlYW51cCwgYnV0Cj4gSSd2
ZSBtYXJrZWQgaXQgYXMgUkZDIGJlY2F1c2UgSSBkb24ndCBoYXZlIGEgc2V0dXAgZm9yIGRvaW5n
Cj4gbW9yZSB0aGFuIGp1c3QgY29tcGlsZS10ZXN0aW5nIFhlbiByZWxhdGVkIHBhdGNoZXMuCj4g
VGhpcyB3YXMgZm91bmQgYXMgcGFydCBvZiBhIHN3ZWVwIHRocm91Z2ggZm9yIGNvZGUgdXNpbmcK
PiB0aGUgX25vbWlncmF0ZSB2ZXJzaW9ucyBvZiBmdW5jdGlvbnMuCgpUaGF0IHBhdGNoIGxvb2tz
IGZpbmUsIGFuZCBzZWFtcyBmaW5lIGFmdGVyIGhhY2tpbmcgbXkgd2F5IGludG8gdGVzdGluZwp0
aGUgY2hhbmdlLgoKQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRy
aXguY29tPgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
