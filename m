From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] shut down domain when last vCPU goes down
Date: Fri, 16 Feb 2018 15:59:45 +0000
Message-ID: <20180216155944.fqh44otswnkscrlw@citrix.com>
References: <5A87028802000078001A8759@prv-mh.provo.novell.com>
 <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ljqo=fk=citrix.com=prvs=578ce87c4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1emiQi-0006Af-9u
 for xen-devel@lists.xenproject.org; Fri, 16 Feb 2018 16:00:08 +0000
Content-Disposition: inline
In-Reply-To: <20180216155248.ni6vg3botbbwvb74@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMTYsIDIwMTggYXQgMDM6NTI6NDhQTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIEZlYiAxNiwgMjAxOCBhdCAwODoxMDo0OEFNIC0wNzAwLCBKYW4g
QmV1bGljaCB3cm90ZToKPiA+IEkndmUganVzdCBoYWQgdG8gZGVhbCB3aXRoIGFuIGVhcmx5IGJv
b3QgY3Jhc2ggb2YgTGludXggd2hpY2ggb2NjdXJyZWQKPiA+IHNvIGVhcmx5IHRoYXQgZXZlbiAi
ZWFybHlwcmludGs9eGVuIiBkaWQgbm90IHByb2R1Y2UgYW55IHVzZWZ1bCBvdXRwdXQuCj4gPiBI
ZW5jZSB0aGUgZG9tYWluIGFwcGVhcmVkIHRvIGhhbmcsIHdoaWxlIGluIGZhY3QgaXQgaGFkIGJy
b3VnaHQgZG93biBpdHMKPiA+IG9ubHkgdkNQVS4gQnkgdHJhbnNsYXRpbmcgdGhpcyB0byBhIHNo
dXRkb3duLCB0aGUgc2l0dWF0aW9uIHdpbGwgYmUKPiA+IGJldHRlciByZWNvZ25pemFibGUuCj4g
PiAKPiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAK
PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4g
Cj4gSSdtIHdvbmRlcmluZywgaXMgaXQgY29tbW9uIGZvciBhIGRvbWFpbiB0byBzaHV0ZG93biBi
eSBzaHV0dGluZyBkb3duCj4gYWxsIGl0J3MgdkNQVXM/Cj4gCj4gSW4gdGhlIHNjZW5hcmlvIHRo
YXQgeW91IGRlc2NyaWJlIGFib3ZlIGl0IHNlZW1zIGl0IHdvdWxkIGJlIG1vcmUKPiBoZWxwZnVs
IHRvIGlzc3VlIGEgU0hVVERPV05fY3Jhc2ggaW5zdGVhZCBtYXliZSB3aXRoIGEgZ2RwcmludGsK
PiBtZXNzYWdlIGluIG9yZGVyIHRvIGFpZCBkZWJ1Z2dpbmcuCgpUaGVyZSBkb2Vzbid0IHNlZW0g
dG8gYmUgYSByZWxpYWJsZSB3YXkgdG8gZGlzdGluZ3Vpc2ggYSBjcmFzaCB2cyBhCmd1ZXN0IGNs
ZWFuIHNodXRkb3duIGluIHlvdSBzY2hlbWUgdGhvdWdoLgoKV2VpLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
