From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: possible I/O emulation state machine issue
Date: Fri, 23 Mar 2018 15:09:29 +0000
Message-ID: <5AB526B902000078001B5972@gwmail.emea.novell.com>
References: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
 <9038fd3e-6726-0418-8ce6-e023efb9f012@citrix.com>
 <5AB4BB1E02000078001B5633@gwmail.emea.novell.com>
 <cee96de9e1e94475bc55b3add0f14a44@AMSPEX02CL03.citrite.net>
 <5AB4F4A102000078001B5815@gwmail.emea.novell.com>
 <45c762bb12af4d3289060a452a58e8ec@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=yzb5=gn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ezOJy-0004m2-05
 for xen-devel@lists.xenproject.org; Fri, 23 Mar 2018 15:09:34 +0000
In-Reply-To: <45c762bb12af4d3289060a452a58e8ec@AMSPEX02CL03.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAzLjE4IGF0IDE0OjQxLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFoIHRoYXQncyB0cnVlLiBXZSB3aWxsIGRvIHRoZSBjaGVjayBiYXNlZCBvbiB0aGUgcmVz
cG9uc2Ugc3RhdGUgZXZlbiBpZiB0aGUgCj4gbmV4dCBJTyBpcyBnb2luZyB0byBiZSBkZWFsdCB3
aXRoIGludGVybmFsbHkuIFNvLCB5ZXMsIHRoZSByZWFsIHF1ZXN0aW9uIGlzIAo+IHdoeSB0aGUg
cHJldmlvdXMgSS9PIHdhcyBjb21wbGV0ZWQgd2l0aG91dCBhcHBhcmVudGx5IHdhaXRpbmcgZm9y
IFFFTVUgdG8gCj4gZmluaXNoLgo+IFdlIHNob3VsZCBoYXZlIHNlbnQgdGhlIFZHQSBQSU8gb3V0
IHRvIFFFTVUsIHJlc3VsdGluZyBpbiAKPiBodm1fdmNwdV9pb19uZWVkX2NvbXBsZXRpb24oKSBy
ZXR1cm5pbmcgdHJ1ZSBpbiBoYW5kbGVfcGlvKCkgbWVhbmluZyB0aGF0IAo+IHZpby0+aW9fY29t
cGxldGlvbiBnZXRzIHNldCB0byBIVk1JT19waW9fY29tcGxldGlvbi4gV2Ugc2hvdWxkIHRoZW4g
cmV0dXJuIAo+IHRydWUgZnJvbSBoYW5kbGVfcGlvKCkgcmVzdWx0aW5nIGluIFJJUCBiZWluZyBh
ZHZhbmNlZCB3aGVuIHdlIHJldHVybiB0byAKPiBndWVzdCwgYnV0IHdlIHNob3VsZCBub3QgZ2V0
IGJhY2sgaW50byB0aGUgZ3Vlc3QgYmVjYXVzZSBodm1fZG9fcmVzdW1lKCkgCj4gc2hvdWxkIHNl
ZSB0aGUgcGVuZGluZyBJTyBmbGFnIG9uIG9uZSBvZiB0aGUgaW9yZXEgc2VydmVyIHZjcHVzIGFu
ZCBibG9jayBvbiAKPiB0aGUgcmVsZXZhbnQgZXZlbnQgY2hhbm5lbC4KPiBTbyBzb21laG93IGl0
IGFwcGVhcnMgdGhlIHZjcHUgZ290IGJhY2sgaW50byBndWVzdCBhbmQgZXhlY3V0ZWQgdGhlIG5l
eHQgCj4gaW5zdHJ1Y3Rpb24gd2hpbHN0IHRoZXJlIHdhcyBwZW5kaW5nIEkvTy4KCkkndmUgZXh0
ZW5kZWQgbXkgZGVidWdnaW5nIHBhdGNoIHRvIGNoZWNrIHZpby0+aW9fcmVxLnN0YXRlIGZvcgpi
ZWluZyBvdGhlciBTVEFURV9JT1JFUV9OT05FIGZpcnN0IHRoaW5nIGluIHRoZSBWTUVYSVQgaGFu
ZGxlcgphcyB3ZWxsIGFzIGZpcnN0IGFuZCBsYXN0IHRoaW5nIGluIHZteF92bWVudGVyX2hlbHBl
cigpLiBJZiB5b3UgaGF2ZQphbnkgb3RoZXIgaWRlYXMgd2hlcmUgdG8gcGxhY2Ugc2FuaXR5IGNo
ZWNrcywgSSdtIGFsbCBlYXJzLgoKSWYgdGhhdCBkb2Vzbid0IGhlbHAsIEkgZ3Vlc3MgSSdsbCBo
YXZlIHRvIHB1bGwgb3V0IGEgYmlnZ2VyIGhhbW1lcgphbmQgbG9nIHJlY2VudCBpb3JlcS1zIGhh
bmRsZWQgKGFuZCBwZXJoYXBzIGluZGl2aWR1YWwgc3RlcHMKdGhlcmVvZikgdG8gc2VlIGlmIHRo
ZWlyIHNlcXVlbmNlIHJpbmdzIGFueSBiZWxsLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
