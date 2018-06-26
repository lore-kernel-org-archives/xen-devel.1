From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86: correctly set nonlazy_xstate_used when
 loading full state
Date: Tue, 26 Jun 2018 12:23:06 +0100
Message-ID: <20180626112306.ywgizjis6bng6t73@citrix.com>
References: <5B31EF8002000078001CDD83@prv1-mh.provo.novell.com>
 <20180626075701.ekl3sifuwvre7mib@citrix.com>
 <5B31F53402000078001CDDC7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=auxb=jm=citrix.com=prvs=708bdb1b4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fXm3y-0000pQ-05
 for xen-devel@lists.xenproject.org; Tue, 26 Jun 2018 11:23:10 +0000
Content-Disposition: inline
In-Reply-To: <5B31F53402000078001CDDC7@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKdW4gMjYsIDIwMTggYXQgMDI6MTE6MzJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA2LjE4IGF0IDA5OjU3LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIEp1biAyNiwgMjAxOCBhdCAwMTo0NzoxMkFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiBJbiB0aGlzIGNhc2UsIGp1c3QgbGlrZSB4Y3IwX2FjY3VtLCBub25s
YXp5X3hzdGF0ZV91c2VkIHNob3VsZCBhbHdheXMgYmUKPiA+PiBzZXQgdG8gdGhlIGludGVuZGVk
IG5ldyB2YWx1ZSwgcmF0aGVyIHRoYW4gcG9zc2libHkgbGVhdmluZyB0aGUgZmxhZyBzZXQKPiA+
PiBmcm9tIGEgcHJpb3Igc3RhdGUgbG9hZC4KPiA+PiAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gPiAKPiA+IFdoeT8gTG9va2luZyBhdCB0aGUg
Y29kZSBpdCBpcyBpbiBmYWN0IHVzZWQgYXMgYSBib29sZWFuLgo+IAo+IEl0cyBib29sZWFuIG5h
dHVyZSBpcyBpcnJlbGV2YW50LiBUaGUgcXVlc3Rpb24gaXMgd2hldGhlciBmdWxseSBuZXcgc3Rh
dGUKPiBpcyBsb2FkZWQgKGluIHdoaWNoIGNhc2UgdGhlIGZsYWcgc2hvdWxkIGJlIHNldCBhY2Nv
cmRpbmcgdG8gdGhpcyBzdGF0ZSwKPiB3aXRob3V0IHJlZ2FyZCB0byB0aGUgcHJpb3IgdmFsdWUg
b2YgdGhlIGZsYWcpIHZzIC4uLgoKSSBzZWUuIEkgbWlzdW5kZXJzdG9vZCB5b3VyIGludGVudC4K
ClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
