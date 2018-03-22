From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: possible I/O emulation state machine issue
Date: Thu, 22 Mar 2018 15:29:47 +0000
Message-ID: <9038fd3e-6726-0418-8ce6-e023efb9f012@citrix.com>
References: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=tinj=gm=citrix.com=prvs=612a1e817=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ez2ET-0002BF-6p
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 15:34:25 +0000
In-Reply-To: <5AB3D5E802000078001B530F@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDMvMTggMTU6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFBhdWwsCj4KPiBvdXIgUFYg
ZHJpdmVyIHBlcnNvbiBoYXMgZm91bmQgYSByZXByb2R1Y2libGUgY3Jhc2ggd2l0aCB3czJrOCwK
PiB0cmlnZ2VyZWQgYnkgb25lIG9mIHRoZSBXSFFMIHRlc3RzLiBUaGUgZ3Vlc3QgZ2V0IGNyYXNo
ZWQgYmVjYXVzZQo+IHRoZSByZS1pc3N1ZSBjaGVjayBvZiBhbiBpb3JlcSBjbG9zZSB0byB0aGUg
dG9wIG9mIGh2bWVtdWxfZG9faW8oKQo+IGZhaWxzLiBJJ3ZlIGhhbmRlZCBoaW0gYSBmaXJzdCBk
ZWJ1Z2dpbmcgcGF0Y2gsIG91dHB1dCBvZiB3aGljaAo+IHN1Z2dlc3RzIHRoYXQgd2UncmUgZGVh
bGluZyB3aXRoIGEgY29tcGxldGVseSBuZXcgcmVxdWVzdCwgd2hpY2gKPiBpbiB0dXJuIHdvdWxk
IG1lYW4gdGhhdCB3ZSd2ZSBydW4gaW50byBzdGFsZSBTVEFURV9JT1JFU1BfUkVBRFkKPiBzdGF0
ZToKPgo+IChYRU4pIGQydjM6IHQ9MC8xIGE9M2M0L2ZlZDAwMGYwIHM9Mi80IGM9MS8xIGQ9MC8x
IGY9MC8wIHA9MC8wIHY9MTAwL2ZmZmY4MzE4NzNmMjdhMzAKPiAoWEVOKSAtLS0tWyBYZW4tNC4x
MC4wXzE1LTAgIHg4Nl82NCAgZGVidWc9biAgIFRhaW50ZWQ6ICBDICAgXS0tLS0KCklycmVzcGVj
dGl2ZSBvZiB0aGUgaXNzdWUgYXQgaGFuZCwgY2FuIHRlc3RpbmcgYmUgdHJpZWQgd2l0aCBhIGRl
YnVnCmJ1aWxkIHRvIHNlZSBpZiBhbnkgb2YgdGhlIGFzc2VydGlvbnMgYXJlIGhpdD8KCn5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
