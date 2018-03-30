From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v1] xen/arm: Add MVEBU UART driver for
 Armada 3700 SoC
Date: Fri, 30 Mar 2018 09:25:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803300925130.15200@sstabellini-ThinkPad-X260>
References: <1521221662-6782-1-git-send-email-amittomer25@gmail.com>
 <89bac393-8535-d954-e6df-054fc647fb4b@arm.com>
 <CABHD4K-3J4nWwFkTFfMnc3jKZ_MKbB95s8SrVfnZ42xfDAb5AQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fgpl=gu=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f1wqi-0002iu-At
 for xen-devel@lists.xenproject.org; Fri, 30 Mar 2018 16:25:56 +0000
In-Reply-To: <CABHD4K-3J4nWwFkTFfMnc3jKZ_MKbB95s8SrVfnZ42xfDAb5AQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Tomer <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, wei.liu2@citrix.com, George Dunlap <George.Dunlap@eu.citrix.com>, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, ian.jackson@eu.citrix.com, tim@xen.org, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCAzMCBNYXIgMjAxOCwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKPiAKPiA+IEkg
dGVzdGVkIHRoaXMgb24gbXkgYm9hcmQgYW5kIGl0IHdvcmtzIGxpa2UgZXhwZWN0ZWQuIEkgd291
bGQgdmVyeSBtdWNoCj4gPiBsaWtlIHRvIHNlZSB0aGlzIGRyaXZlciBzdGlsbCBpbiA0LjExLgo+
IAo+IFRoYW5rcyBmb3IgbG9va2luZyBpbnRvIGl0IGFuZCBNYW55IFRoYW5rcyBmb3IgdGVzdGlu
ZyBpdCBvdXQuCgpGWUkgdGhlIGRlYWRsaW5lIGlzIHRoZSBlbmQgb2YgbmV4dCB3ZWVrLiBJZiB5
b3Ugc3VibWl0IGEgcGF0Y2ggYnkgdGhlbgphZGRyZXNzaW5nIEFuZHJlJ3MgY29tbWVudCBJIHdv
dWxkIGJlIGhhcHB5IHRvIGNoZWNrIGl0IGluLgoKCj4gPiBTb21lIChtaW5vcikgY29tbWVudHMg
b24gdGhlIGNvZGUgYmVsb3cuCj4gPgo+ID4gT24gMTYvMDMvMTggMTc6MzQsIEFtaXQgU2luZ2gg
VG9tYXIgd3JvdGU6Cj4gPj4gVGhpcyBwYXRjaCBhZGRzIGRyaXZlciBmb3IgVUFSVCBjb250cm9s
bGVyIGZvdW5kIG9uIEFybWFkYSAzNzAwIFNvQy4KPiA+Cj4gPiBDYW4geW91IHBsZWFzZSBtZW50
aW9uICJNYXJ2ZWxsIiBpbiB0aGUgc3ViamVjdD8KPiAKPiBPay4KPiAKPiA+IFRoZXNlIHNob3Vs
ZCBiZSBpbmRlbnRlZCBieSBvbmUgdGFiIChwbHVzIHR3byBzcGFjZXMgZm9yIHRoZSBoZWxwIHRl
eHQpLgo+ID4gSXQncyBub3Qgb2J2aW91cyAtIEkgZ290IHRoaXMgd3JvbmcgbXlzZWxmIHRoZSBv
dGhlciBkYXkgOy0pLCBidXQgaXQncwo+ID4gaG93IHRoZSByZXN0IG9mIHRoZSBmaWxlIHdvcmtz
Lgo+IAo+IE9rLgo+IAo+ID4gTm8gbmVlZCBmb3IgdGhlIGJyYWNrZXRzLgo+IAo+IE9rLgo+IAo+
ID4gSW5kZW50YXRpb24uCj4gCj4gT2suCj4gCj4gPiBTbyB3aHkgZG8gd2UgbmVlZCB0aGlzIGlu
Y2x1ZGUgZmlsZSwgaW4gYSBzaGFyZWQgZGlyZWN0b3J5Pwo+ID4gQWxsIHRob3NlIGJpdHMgYXJl
IHByaXZhdGUgdG8gdGhlIFVBUlQgZHJpdmVyIGFuZCBkb24ndCBuZWVkIHRvIGJlCj4gPiBleHBv
c2VkIHRvIFhlbiBhdCBhbGwuCj4gPiBJZiBpdCdzIGFib3V0IHRoZSBlYXJseXByaW50ayBzdXBw
b3J0OiB0aGF0J3MganVzdCB0d28gdmFsdWVzIG5lZWRlZAo+ID4gdGhlcmUsIG5vdGhpbmcgd29y
dGggYSBuZXcgaW5jbHVkZSBmaWxlLCBJIHRoaW5rLgo+ID4gU28gSSB3b3VsZCByZWNvbW1lbmQg
dG8gZGVjbGFyZSB0aGUgcmVxdWlyZWQgY29uc3RhbnRzIGRpcmVjdGx5IGluIHRoZQo+ID4gZHJp
dmVyIGZpbGUuCj4gCj4gWWVzLCBJIHRob3VnaHQgZWFybHlwcmludGsgY291bGQgYWxzbyB1c2Ug
YSBjb3VwbGUgb2YgY29tbW9uIGRlZmluZXMgYW5kIG90aGVyCj4gZHJpdmVycyBkbyB0aGUgc2Ft
ZSB3YXkuCj4gCj4gCj4gVGhhbmtzCj4gLUFtaXQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
