From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 15/22] vixen: pass through version
 hypercalls to parent Xen
Date: Sun, 7 Jan 2018 15:55:09 +0000
Message-ID: <8a4576ac-b02c-9a55-5f3d-e0e9485d57ef@citrix.com>
References: <1515279277-16301-1-git-send-email-aliguori@amzn.com>
 <1515279277-16301-16-git-send-email-aliguori@amzn.com>
 <20180107083123.judv4wjl7rhxc3gy@MacBook-Pro-de-Roger.local>
 <CA+aC4kuBj-roLCVN0_+O7rRorM8CaYYDT2JMQwBit2_c2K74qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=kbzp=ec=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1eYDIC-0001oQ-7N
 for xen-devel@lists.xenproject.org; Sun, 07 Jan 2018 15:55:24 +0000
In-Reply-To: <CA+aC4kuBj-roLCVN0_+O7rRorM8CaYYDT2JMQwBit2_c2K74qA@mail.gmail.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Anthony Liguori <anthony@codemonkey.ws>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, "=?UTF-8?Q?Jan_H._Sch=c3=b6nherr?=" <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMDEvMjAxOCAxNTo0MCwgQW50aG9ueSBMaWd1b3JpIHdyb3RlOgo+IE9uIFN1biwgSmFu
IDcsIDIwMTggYXQgMTI6MzEgQU0sIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPiB3cm90ZToKPj4gT24gU2F0LCBKYW4gMDYsIDIwMTggYXQgMDI6NTQ6MzBQTSAtMDgwMCwg
QW50aG9ueSBMaWd1b3JpIHdyb3RlOgo+Pj4gRnJvbTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9y
aUBhbWF6b24uY29tPgo+Pj4KPj4+IFRoaXMgaXMgbmVjZXNzYXJ5IHRvIHRyaWdnZXIgZXZlbnQg
Y2hhbm5lbCB1cGNhbGxzIGJ1dCBpdCBpcyBhbHNvCj4+IEknbSBsb3N0IGhlcmUsIHdoYXQgZG9l
cyB2ZXJzaW9uIGhhdmUgdG8gZG8gd2l0aCB1cGNhbGxzPwo+IEluIExpbnV4LCB4ZW5fZm9yY2Vf
ZXZ0Y2huX2NhbGxiYWNrKCkgZG9lcyBIWVBFUlZJU09SX3hlbl92ZXJzaW9uKDAsCj4gTlVMTCku
ICBUaGlzIGlzIGRvbmUgd2hlbiBJUlFzIGFyZSByZS1lbmFibGVkIGFmdGVyIGJlaW5nIGRpc2Fi
bGVkIHRvCj4gdHJpZ2dlciBjaGVja2luZyBwZW5kaW5nLgo+Cj4gSSdtIG5vdCAxMDAlIGNvbmZp
ZGVudCB0aGF0IGl0J3MgbmVjZXNzYXJ5IHRvIHBhc3MgdGhpcyBhbGwgdGhlIHdheQo+IHRocm91
Z2ggdG8gdGhlIHBhcmVudCBYZW4gYnV0IGl0IHNlZW1lZCBsaWtlIHRoZSByaWdodCB0aGluZyB0
byBkbwo+IHNpbmNlIHdlIG5lZWQgdGhlIHBhcmVudCB0byB1cGRhdGUgcGVuZGluZyBldmVudHMg
aW4gb3JkZXIgZm9yIHRoZQo+IGV2ZW50cyBpbiBWaXhlbiB0byBnZXQgdXBkYXRlZC4KPgo+Pj4g
dXNlZnVsIHRvIHBhc3N0aHJvdWdoIHRoZSBmdWxsIHZlcnNpb24gaW5mb3JtYXRpb24gc3VjaCB0
aGF0IHRoZQo+Pj4gZ3Vlc3QgYmVsaWV2ZXMgaXQgaXMgcnVubmluZyBvbiB0aGUgcGFyZW50IFhl
bi4KPj4gSW4gYW55IGNhc2UsIEkgdGhpbmsgdGhpcyBpcyB3cm9uZy4gVGhlIGludGVyZmFjZSB0
aGUgZ3Vlc3Qgc2VlcyBpcwo+PiB0aGUgaW50ZXJmYWNlIGZyb20gdml4ZW4sIG5vdCB0aGUgaW50
ZXJmYWNlIG9mIHRoZSBMMC4gSGVuY2UgcmVwb3J0aW5nCj4+IHRoZSBMMCB2ZXJzaW9uIGlzIG5v
dCBhcHByb3ByaWF0ZS4KPiBJIHRoaW5rIGl0IGRlcGVuZHMgb24gd2hhdCB5b3Ugd2FudC4gIFdl
IHdlcmUgYWltaW5nIGZvciBtYXhpbXVtCj4gY29tcGF0aWJpbGl0eSBhbmQgbWFueSB1c2VycyB0
cmlnZ2VyIGJlaGF2aW9yIGZyb20gWGVuIHZlcnNpb24gZm9yCj4gYmV0dGVyIG9yIHdvcnNlLgo+
Cj4gSGFwcHkgdG8gbWFrZSB0aGlzIG9wdGlvbmFsIGlmIHRoaXMgaXNuJ3QgdW5pdmVyc2FsbHkg
ZGVzaXJlZC4KCkl0IHdpbGwgYmUgc3VidGxlIGVpdGhlciB3YXkuCgpNeSBndXQgZmVlbGluZyBp
cyB0aGF0IGl0IHdpbGwgYmUgd29yc2UgdG8gcHJldGVuZCB0aGF0IFhlbiA0LjEwIGlzbid0CjQu
MTAsIHRoYW4gaGF2aW5nIFBWIGd1ZXN0cyBzdWRkZW5seSBmaW5kIHRoZW1zZWx2ZXMgb24gYSBu
ZXdlcgpoeXBlcnZpc29yLsKgIFRoZSBQViBBQkkgaGFzbid0IGNoYW5nZWQgbXVjaCBhdCBhbGwu
CgpJIGRvbid0IGhhdmUgYW55IGV2aWRlbnQgdG8gYmFjayB1cCB0aGlzIGZlZWxpbmcgdGhvdWdo
LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
