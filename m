From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 1/3] Make credit2 the default scheduler
Date: Tue, 6 Feb 2018 17:02:38 +0000
Message-ID: <64cddb91-57ca-45ae-2308-f4f844248d5e@citrix.com>
References: <20180205113642.3174-1-george.dunlap@citrix.com>
 <edf342de-0dee-69c0-d239-75f928960bd4@citrix.com>
 <d9a9e4c9-1a78-ac26-0bda-cea8e842e05d@citrix.com>
 <1517849601.8082.10.camel@suse.com>
 <08e59400-8187-2c06-4145-3d7f3fd2bc65@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=q0qo=fa=citrix.com=prvs=568a97e32=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ej6eP-0003Oe-9s
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 17:03:21 +0000
In-Reply-To: <08e59400-8187-2c06-4145-3d7f3fd2bc65@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDIvMDYvMjAxOCAwNjoxOCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBPbiAwNS8wMi8x
OCAxNzo1MywgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4+IE9uIE1vbiwgMjAxOC0wMi0wNSBhdCAx
MzowMSArMDAwMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4+IEFuZCBpbiBhbnkgY2FzZSwgbWFr
aW5nIHRob3NlIGltcHJvdmVtZW50cwo+Pj4gb24gY3JlZGl0MiB3aWxsIGJlIGVhc2llciB0aGFu
IG9uIGNyZWRpdC4KPj4+Cj4+IEFuZCwgaWYgcG9zc2libGUsIEkgYWdyZWUgd2l0aCBHZW9yZ2Ug
b24gdGhpcyBldmVuIG1vcmUhCj4+Cj4+IE9uZSB0aGluZyBJIHRoaW5rIHdlIHNob3VsZCBjb25z
aWRlciwgdGhvdWdoLCBpcyB0aGF0IHdlJ3ZlIG9mdGVuIHNhaWQKPj4gd2Ugd291bGQgc3dpdGNo
IGF0IHRoZSB2ZXJ5IGJlZ2lubmluZyBvZiBhIGRldiBjeWNsZSwgdG8gZ2V0IGFzIG11Y2ggYXMK
Pj4gb3NzdGVzdCBhbmQgZGF5LWJ5LWRheSB0ZXN0aW5nIGZyb20gZGV2ZWxvcGVyIGFzIHBvc3Np
YmxlLgo+Pgo+PiBDb25zaWRlcmluZyB3ZSdyZSByZWxlYXNpbmcgaW4gSnVuZSwgYnV0IGZyZWV6
aW5nIGluIE1hcmNoLCBkbyB3ZSB0aGluawo+PiAgaXQgaXMgc3RpbGwgZWFybHkgZW5vdWdoPwo+
IAo+IFRoZSA0LjExIHJlbGVhc2UgaXMgY29tcGxldGVseSBkb21pbmF0ZWQgYnkgTWVsdGRvd24v
U3BlY3RyZSBtaXRpZ2F0aW9uCj4gd29yay4gU28gZWl0aGVyIDQuMTEgd2lsbCBiZSBhIHNlY3Vy
aXR5IGZvY3VzZWQgdmVyc2lvbiBvciB3ZSBuZWVkIHRvCj4gZXh0ZW5kIHRoZSBkZXZlbG9wbWVu
dCBwaGFzZS4KClBlcnNvbmFsbHkgSSBjb3VsZCBnbyBlaXRoZXIgd2F5IG9uIHRoaXMuICBTbyB1
bmxlc3Mgc29tZW9uZSB3YW50cyB0bwphcmd1ZSBmb3Igc3dpdGNoaW5nIG5vdyAob3Igd2Ugc2ln
bmlmaWNhbnRseSBleHRlbmQgdGhlIGRldmVsb3BtZW50CndpbmRvdyksIGxldCdzIHBsYW4gb24g
bGVhdmluZyB0aGlzIGZvciBwb3N0LTQuMTEuCgo+IEkgdGhpbmsgd2Ugc2hvdWxkIF9yZWFsbHlf
IGRpc2N1c3MgcmVsZWFzZSBzY2hlZHVsZXMgcmF0aGVyIHNvb25lciB0aGFuCj4gbGF0ZXIuCgpT
b3JyeSBJIHdhc24ndCBtdWNoIGludm9sdmVkIGluIHRoZSBlYXJsaWVyIGRpc2N1c3Npb24gLS0g
SSB3YXMgcmF0aGVyCmhlYWRzLWRvd24gdHJ5aW5nIHRvIGZpZ3VyZSBvdXQgd2hhdCB0byBkbyBh
Ym91dCBzcGVjdWxhdGl2ZSBleGVjdXRpb24uCjotKSAgTGV0IG1lIHNlZSBpZiBJIGNhbiBnbyBm
aW5kIHRoYXQgdGhyZWFkLgoKIC1HZW9yZ2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
