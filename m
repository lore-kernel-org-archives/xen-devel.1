From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: Upping gcc requirement for x86
Date: Thu, 29 Mar 2018 18:20:07 +0100
Message-ID: <20180329172006.ts3nh32dwda7oq5o@citrix.com>
References: <20180329154523.nvxkzn5rhetphwki@citrix.com>
 <CAFLBxZZJX1DPv-M8n_CDFf7OWfxmBwtXC9eDQb_WRXz9V5TYyA@mail.gmail.com>
 <20180329171025.p7b4v4qppt7puqtj@citrix.com>
 <CAFLBxZYhonk-Q8CQ1i8y5S38xHXRYmnS0TgW2OZjFFSxX7QBrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fxmg=gt=citrix.com=prvs=6195d7903=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1f1bDf-00075m-3d
 for xen-devel@lists.xenproject.org; Thu, 29 Mar 2018 17:20:11 +0000
Content-Disposition: inline
In-Reply-To: <CAFLBxZYhonk-Q8CQ1i8y5S38xHXRYmnS0TgW2OZjFFSxX7QBrw@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Olaf Hering <olaf@aepfle.de>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMjksIDIwMTggYXQgMDY6MTQ6MDhQTSArMDEwMCwgR2VvcmdlIER1bmxhcCB3
cm90ZToKPiBPbiBUaHUsIE1hciAyOSwgMjAxOCBhdCA2OjEwIFBNLCBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPiB3cm90ZToKPiA+IE9uIFRodSwgTWFyIDI5LCAyMDE4IGF0IDA2OjA1OjU3
UE0gKzAxMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gPj4gT24gVGh1LCBNYXIgMjksIDIwMTgg
YXQgNDo0NSBQTSwgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gPiBI
aSBhbGwKPiA+PiA+Cj4gPj4gPiBTZWFiaW9zIGhhcyBidW1wZWQgdGhlaXIgcmVxdWlyZW1lbnQg
dG8gNC42IChyZWxlYXNlZCA3IHllYXJzIGFnbykuIFdlCj4gPj4gPiBlaXRoZXIgbmVlZCB0byBi
dW1wIG91ciB0b28gb3IgaGF2ZSBhIHNlcGFyYXRlIGVudHJ5IGZvciBzZWFiaW9zLgo+ID4+Cj4g
Pj4gUkhFTCAvIENlbnRPUyA2IGFyZSBzdGlsbCBzdXBwb3J0ZWQsIGFuZCB0aGV5IGNvbWUgd2l0
aCBHQ0MgNC40Lgo+ID4KPiA+IFdoZXJlIGlzIHRoaXMgbGlzdGVkIGluIHhlbi5naXQ/IFN1cHBv
cnRlZCBpbiB3aGF0IHNlbnNlPwo+IAo+IFNvcnJ5LCBJIHJlYWxpemVkIHRoaXMgd2FzIGFtYmln
dW91cyBqdXN0IGEgbWludXRlIGFnby4gIEkgbWVhbnQsCj4gdGhleSdyZSBub3QgRU9MIHlldCAt
LSB0aGUgZGlzdHJpYnV0aW9ucyBhcmUgc3RpbGwgImFjdGl2ZSIgYXMgaXQKPiB3ZXJlLiAgKEFz
IG9wcG9zZWQgdG8sIHNheSwgUkhFTCAvIENlbnRPUyA1LCB3aGljaCBpcyBFT0wuKQo+IAo+IEkg
dGhpbmsgaXQgbWFrZXMgc2Vuc2UgZm9yIHVzIGFzIGEgcHJvamVjdCB0byB0cnkgdG8gc3VwcG9y
dAo+IGRpc3RyaWJ1dGlvbnMgd2hpY2ggYXJlIHN0aWxsIGJlaW5nIGdpdmVuIGFjdGl2ZSBzdXBw
b3J0LgoKUmlnaHQuIEkgdGhpbmsgdGhhdCBtYWtlcyBzZW5zZSwgYnV0IGRvZXMgaXQgYWN0dWFs
bHkgd29yayBsaWtlIHRoYXQgaW4KcHJhY3RpY2U/CgpFeGlzdGluZyBYZW4gcGFja2FnZXMgYXJl
bid0IHJlYWxseSBnb2luZyB0byBnZXQgYSBuZXdlciBYZW4sIHNvIHRoYXQncwpvdXQgb2YgdGhl
IHBpY3R1cmUuCgpXaGF0IHdlIHRyeSB0byBhY2hpZXZlIGhlcmUgaXMgdG8gbGV0IHRoZSB1c2Vy
cyBvZiB0aGVzZSBvbGQgZGlzdHJvIGFibGUKdG8gYnVpbGQgbmV3ZXIgWGVuIHRoZW1zZWx2ZXMu
IEJ1dCBzdXBwb3NlIHlvdSB3YW50IHRvIGJ1aWxkIGEgbmV3CnN5c3RlbSBhbnl3YXksIHdoeSBz
dGljayB3aXRoIGFuIG9sZCBkaXN0cm8/IFdoeSBub3QgdXNlIGEgbmV3ZXIgZGlzdHJvCnJlbGVh
c2UgaW5zdGVhZD8KCldlaS4KCj4gCj4gIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
