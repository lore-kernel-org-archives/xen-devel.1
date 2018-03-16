From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v10 09/11] vpci/msi: add MSI handlers
Date: Fri, 16 Mar 2018 17:51:21 +0000
Message-ID: <20180316175121.saue4oceqljk5rn6@MacBook-Pro-de-Roger.local>
References: <20180316133008.66443-1-roger.pau@citrix.com>
 <20180316133008.66443-10-roger.pau@citrix.com>
 <5AABDD1702000078001B2D77@prv-mh.provo.novell.com>
 <20180316143412.lkqyavr2vepsdktc@MacBook-Pro-de-Roger.local>
 <5AABEB5802000078001B2E24@prv-mh.provo.novell.com>
 <20180316153802.sgvxp37z532nuutt@MacBook-Pro-de-Roger.local>
 <5AABFDB402000078001B2E97@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=dokm=gg=citrix.com=prvs=60669260a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ewtVw-0003qX-4O
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 17:51:36 +0000
Content-Disposition: inline
In-Reply-To: <5AABFDB402000078001B2E97@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, AndrewCooper <andrew.cooper3@citrix.com>, IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMTA6MjQ6MDRBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE2LjAzLjE4IGF0IDE2OjM4LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gT24gRnJpLCBNYXIgMTYsIDIwMTggYXQgMDk6MDU6NDRBTSAtMDYwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPj4gPj4+IE9uIDE2LjAzLjE4IGF0IDE1OjM0LCA8cm9nZXIucGF1QGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4+ID4gdnBjaV9yZW1vdmVfZGV2aWNlIGlzIG5ldmVyIGNhbGxl
ZCBmcm9tIHRoZSB1c2VyLXNwYWNlIHRlc3QgaGFybmVzcywKPiA+PiA+IHNvIGl0IGp1c3QgbmVl
ZHMgdG8gYnVpbGQsIGJ1dCBub3QgbmVjZXNzYXJpbHkgYmUgY29ycmVjdCBpbiB0aGF0Cj4gPj4g
PiBjb250ZXh0Lgo+ID4+ID4gCj4gPj4gPiBUaGUgdGVzdCBoYXJuZXNzIGRvZXNuJ3QgdXNlIHZw
Y2lfYWRkX2hhbmRsZXJzIG9yIHZwY2lfcmVtb3ZlX2RldmljZSwKPiA+PiA+IGl0IGp1c3QgYWRk
cyBhbmQgcmVtb3ZlcyBoYW5kbGVycyB1c2luZyB2cGNpX2FkZF9yZWdpc3RlciBhbmQKPiA+PiA+
IHZwY2lfcmVtb3ZlX3JlZ2lzdGVyLgo+ID4+IAo+ID4+IEkgZGlzbGlrZSBzdWNoIGEgc2V0dXAg
LSB0aGVuIHlvdSdkIGJldHRlciAjaWZkZWYgb3V0IHRoZSBlbnRpcmUKPiA+PiBmdW5jdGlvbiwg
YW5kIHVuZG8gc29tZSBvZiB0aGUgb3RoZXIgcmVjZW50bHkgYWRkZWQgI2lmZGVmLWFyeS4KPiA+
IAo+ID4gT0ssIEkndmUgZG9uZSBpdCB0aGF0IHdheSBpbml0aWFsbHkgdG8gcHJldmVudCBwb2xs
dXRpbmcgdnBjaS5jIHdpdGgKPiA+IF9fWEVOX18gaWZkZWZzLiBUaGUgcGF0Y2ggYmVsb3cgaWZk
ZWZzIHRob3NlIHVudXNlZCBmdW5jdGlvbnMuCj4gCj4gTG9va3MgbGlrZSBhbiBvdmVyYWxsIGlt
cHJvdmVtZW50IHRvIG1lLgoKV291bGQgeW91IGJlIGZpbmUgd2l0aCB0aGlzIGJlaW5nIGEgc2Vw
YXJhdGUgcGF0Y2gsIG9yIHdvdWxkIHlvdSBsaWtlCm1lIHRvIHNxdWFzaCBpdCBpbnRvIHRoZSBz
ZXJpZXM/CgpJIHRoaW5rIGlmIHlvdSBkb24ndCBoYXZlIG90aGVyIGNvbW1lbnRzIHRoYXQgcmVx
dWlyZSBhIG5ldyB2ZXJzaW9uIG9mCnRoZSBzZXJpZXMgYSBzZXBhcmF0ZSBwYXRjaCBzaG91bGQg
YmUgT0suCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
