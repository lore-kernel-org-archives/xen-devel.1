From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: 4.11.0 RC1 panic
Date: Tue, 12 Jun 2018 16:54:30 +0100
Message-ID: <233e98d0-5a4b-a55c-dd2a-e0ad196ffb09@citrix.com>
References: <20180425104242.GA24012@mail.soc.lip6.fr>
 <20180425144246.GA27422@mail.soc.lip6.fr>
 <5AE71AB002000078001BF978@prv1-mh.provo.novell.com>
 <20180501202211.GA902@antioche.eu.org>
 <5AFAA8A902000078001C2CE6@prv1-mh.provo.novell.com>
 <20180522110101.GA25181@mail.soc.lip6.fr>
 <5B1CF56502000078001326FB@prv1-mh.provo.novell.com>
 <20180610105728.GA3492@antioche.eu.org>
 <5B1F7CEF02000078001CA402@prv1-mh.provo.novell.com>
 <20180612113905.GA25889@mail.soc.lip6.fr>
 <20180612153844.GB17270@mail.soc.lip6.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=vx8t=i6=citrix.com=prvs=694050c85=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fSlcv-0006I5-M9
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 15:54:33 +0000
In-Reply-To: <20180612153844.GB17270@mail.soc.lip6.fr>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manuel Bouyer <bouyer@antioche.eu.org>, Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDYvMTggMTY6MzgsIE1hbnVlbCBCb3V5ZXIgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMTIs
IDIwMTggYXQgMDE6Mzk6MDVQTSArMDIwMCwgTWFudWVsIEJvdXllciB3cm90ZToKPj4gSSBhcHBs
aWVkIHRoaXMgcGF0Y2ggdG8gNC4xMXJjNCAobGV0J3Mgbm90IGNoYW5nZSB0b28gbXVjaCB0aGlu
Z3MgYXQgdGhlCj4+IHNhbWUgdGltZSkgYW5kIHJlYm9vdGVkIG15IHRlc3QgaG9zdC4gSG9wZWZ1
bGx5IEknbGwgaGF2ZSBzb21lIGRhdGEgdG8gcmVwb3J0Cj4+IHNvb24KPiBHb3QgdGhlIGZpcnN0
IHBhbmljIChzdGlsbCBmcm9tIGEgaTM4NiBkb21VKToKPiBsb2dpbjogKFhFTikgZDR2MCBIaXQg
I0RCIGluIFhlbiBjb250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAgW292ZXJmbG93XSwgc3Rr
IDAwMDA6ZmZmZjgzMDFiZjExN2Y3OCwgZHI2IGZmZmYwZmYwCj4gKFhFTikgZDR2MCBIaXQgI0RC
IGluIFhlbiBjb250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAgW292ZXJmbG93XSwgc3RrIDAw
MDA6ZmZmZjgzMDFiZjExN2Y3OCwgZHI2IGZmZmYwZmYwCj4gKFhFTikgZDR2MCBIaXQgI0RCIGlu
IFhlbiBjb250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAgW292ZXJmbG93XSwgc3RrIDAwMDA6
ZmZmZjgzMDFiZjExN2Y3OCwgZHI2IGZmZmYwZmYwCj4gKFhFTikgZDR2MCBIaXQgI0RCIGluIFhl
biBjb250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAgW292ZXJmbG93XSwgc3RrIDAwMDA6ZmZm
ZjgzMDFiZjExN2Y3OCwgZHI2IGZmZmYwZmYwCj4gKFhFTikgZDR2MCBIaXQgI0RCIGluIFhlbiBj
b250ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAgW292ZXJmbG93XSwgc3RrIDAwMDA6ZmZmZjgz
MDFiZjExN2Y3OCwgZHI2IGZmZmYwZmYwCj4gKFhFTikgZDR2MiBIaXQgI0RCIGluIFhlbiBjb250
ZXh0OiBlMDA4OmZmZmY4MmQwODAzNmViMDAgW292ZXJmbG93XSwgc3RrIDAwMDA6ZmZmZjgzMDFi
ZjA3N2Y3OCwgZHI2IGZmZmYwZmYwCgpJIHByZXN1bWUgeW91J3JlIHJ1bm5pbmcgYSBYU0EtMjYz
IChNb3ZTUykgZXhwbG9pdCBpbiB0ZXN0aW5nPwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
