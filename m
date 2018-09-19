From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH V3 2/2] Xen/PCIback: Implement PCI
 flr/slot/bus reset with 'reset' SysFS attribute
Date: Wed, 19 Sep 2018 11:05:26 +0200
Message-ID: <20180919090526.s3ahnemrt2ik2tx3__8358.00086283616$1537347998$gmane$org@mac.bytemobile.com>
References: <5A2A6AB10200007800195D4F@prv-mh.provo.novell.com>
 <8a3bc517-1255-4547-d244-5c400e44cc77@Oracle.COM>
 <f19dbb09-ef22-2cf4-fb38-2a7c42b5dc48@Oracle.COM>
 <5A377E020200007800197FFA@prv-mh.provo.novell.com>
 <559ffd12-b541-8a69-60bd-fbe10e3dc159@oracle.com>
 <20180916114306.GF18222@reaktio.net>
 <a726840b-8a5c-0890-73c6-3a95a7205153@oracle.com>
 <20180918071519.GG18222@reaktio.net>
 <5E7DDB68-4E68-48A5-AEEC-EE1B21A50E9E@citrix.com>
 <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=t0u/=mb=citrix.com=prvs=7935e1ad4=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g2YSe-00021k-66
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 09:07:52 +0000
Content-Disposition: inline
In-Reply-To: <352310b3-ec9b-2ceb-83f0-4550718120c3@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, George Dunlap <George.Dunlap@citrix.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jan Beulich <JBeulich@suse.com>, "bhelgaas@google.com" <bhelgaas@google.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBTZXAgMTgsIDIwMTggYXQgMDI6MDk6NTNQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5
IHdyb3RlOgo+IE9uIDkvMTgvMTggNTozMiBBTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiA+Cj4g
Pj4gT24gU2VwIDE4LCAyMDE4LCBhdCA4OjE1IEFNLCBQYXNpIEvDpHJra8OkaW5lbiA8cGFzaWtA
aWtpLmZpPiB3cm90ZToKPiA+Pgo+ID4+IEhpLAo+ID4+Cj4gPj4gT24gTW9uLCBTZXAgMTcsIDIw
MTggYXQgMDI6MDY6MDJQTSAtMDQwMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+ID4+PiBXaGF0
IGFib3V0IHRoZSB0b29sc3RhY2sgY2hhbmdlcz8gSGF2ZSB0aGV5IGJlZW4gYWNjZXB0ZWQ/IEkg
dmFndWVseQo+ID4+PiByZWNhbGwgdGhlcmUgd2FzIGEgZGlzY3Vzc2lvbiBhYm91dCB0aG9zZSBj
aGFuZ2VzIGJ1dCBkb24ndCByZW1lbWJlciBob3cKPiA+Pj4gaXQgZW5kZWQuCj4gPj4+Cj4gPj4g
SSBkb24ndCB0aGluayB0b29sc3RhY2svbGlieGwgcGF0Y2ggaGFzIGJlZW4gYXBwbGllZCB5ZXQg
ZWl0aGVyLgo+ID4+Cj4gPj4KPiA+PiAiW1BBVENIIFYxIDAvMV0gWGVuL1Rvb2xzOiBQQ0kgcmVz
ZXQgdXNpbmcgJ3Jlc2V0JyBTeXNGUyBhdHRyaWJ1dGUiOgo+ID4+IGh0dHBzOi8vbGlzdHMueGVu
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTEyL21zZzAwNjY0Lmh0bWwKPiA+Pgo+
ID4+ICJbUEFUQ0ggVjEgMS8xXSBYZW4vbGlieGw6IFBlcmZvcm0gUENJIHJlc2V0IHVzaW5nICdy
ZXNldCcgU3lzRlMgYXR0cmlidXRlIjoKPiA+PiBodHRwczovL2xpc3RzLnhlbi5vcmcvYXJjaGl2
ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxNy0xMi9tc2cwMDY2My5odG1sCj4gCj4gCj4gV2lsbCB0aGlz
IHBhdGNoIHdvcmsgZm9yICpCU0Q/IFJvZ2VyPwoKQXQgbGVhc3QgRnJlZUJTRCBkb24ndCBzdXBw
b3J0IHBjaS1wYXNzdGhyb3VnaCwgc28gbm9uZSBvZiB0aGlzIHdvcmtzCkFUTS4gVGhlcmUncyBu
byBzeXNmcyBvbiBCU0QsIHNvIG11Y2ggb2Ygd2hhdCdzIGluIGxpYnhsX3BjaS5jIHdpbGwKaGF2
ZSB0byBiZSBtb3ZlZCB0byBsaWJ4bF9saW51eC5jIHdoZW4gQlNEIHN1cHBvcnQgaXMgYWRkZWQu
CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
