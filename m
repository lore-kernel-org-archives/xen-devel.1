From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Notes for xen summit 2018 design session] Process
 changes: is the 6 monthly release Cadence too short, Security Process, ...
Date: Fri, 6 Jul 2018 16:09:45 +0100
Message-ID: <23359.34361.279794.653470@mariner.uk.xensource.com>
References: <0920C595-DA2C-4C5E-B713-40ADB616CC93@citrix.com>
 <60433E7B-455A-45C9-8A6A-B26F5BD8F115@citrix.com>
 <20180703100733.mhfeia2vfywt6czx@mac.bytemobile.com>
 <8E144174-5EFE-474C-9C00-F10D3469FBD0@citrix.com>
 <416f5015-93da-1832-aa63-abac54815e60@suse.com>
 <23357.65017.175500.267696@mariner.uk.xensource.com>
 <20180705181311.tqt43urlygigkfhs@doug-macbook.localdomain>
 <5B3F291002000078001D1C5D@prv1-mh.provo.novell.com>
 <20180706145204.gozvorhnw2x6bjns@doug-macbook.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=4trt=jw=citrix.com=prvs=718f97a87=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fbSMo-0003DI-MZ
 for xen-devel@lists.xenproject.org; Fri, 06 Jul 2018 15:09:50 +0000
In-Reply-To: <20180706145204.gozvorhnw2x6bjns@doug-macbook.localdomain>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>, advisory-board@lists.xenproject.org, Rich Persaud <persaur@gmail.com>, committers@xenproject.org, Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RG91ZyBHb2xkc3RlaW4gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtOb3RlcyBmb3IgeGVuIHN1
bW1pdCAyMDE4IGRlc2lnbiBzZXNzaW9uXSBQcm9jZXNzIGNoYW5nZXM6IGlzIHRoZSA2IG1vbnRo
bHkgcmVsZWFzZSBDYWRlbmNlIHRvbyBzaG9ydCwgU2VjdXJpdHkgUHJvY2VzcywgLi4uIik6Cj4g
WW91IGVmZmVjdGl2ZWx5IHN1cHBvcnRlZCBteSBwb2ludCBpbiB0aGUgZW5kLiBQZW9wbGUgdmFs
dWUgdGhlaXIgdGltZS4KPiBHaXZpbmcgdGhlbSBkZXRhaWxzIGFib3V0IHRyZW5kcyBjb3VsZCBo
ZWxwIGZvbGtzIHRvIGxvb2sgYXQgdGVzdAo+IGZhaWx1cmVzIHRoYXQgaGF2ZSAiaW50ZXJlc3Rp
bmciIGZhaWx1cmVzLgoKWW91ciBmb2N1c2Ugb24gdGhlIG5vdGlvbiBvZiAidHJlbmQiIGhlcmUg
aXMgaW50ZXJlc3RpbmcuCgpPbmUgd2F5IG9mIGxvb2tpbmcgYXQgdGhhdCBpcyB0aGF0IHJlYWxs
eSB5b3UgYXJlIGFza2luZyBhYm91dCBjaGFuZ2UKb3ZlciB0aW1lLiAgT2YgY291cnNlIHRoYXQn
cyB3aGF0IHRoZSAicmVncmVzc2lvbiIgY29uY2VwdCBpcyBpbgpvc3N0ZXN0LgoKQnV0IHRoYXQg
aXMgZm9yIGVhY2ggaW5kaXZpZHVhbCB0ZXN0IHN0ZXAuICBXaGVuIHdlIGhhdmUgYSBoZWlzZW5i
dWcKd2hpY2ggYWZmZWN0cyBtdWx0aXBsZSB0ZXN0cywgb3NzdGVzdCBpcyBub3QgcmVhbGx5IHJp
Z2h0IG5vdyB2ZXJ5Cmdvb2QgYXQgYWdncmVnYXRpbmcgdGhhdCBpbmZvcm1hdGlvbi4KCk1heWJl
IHlvdXIgInRyZW5kIiBpZGVhIGlzIHVzZWZ1bCBoZXJlLiAgb3NzdGVzdCBjb3VsZCBwZXJoYXBz
IHRyYWNrCnRoZSBwcm9wb3J0aW9uIG9mICJoZWlzZW4iIGZhaWx1cmVzIHNvbWVob3cuICBJIHdp
bGwgaGF2ZSB0byB0aGluawphYm91dCBob3cgdG8gZG8gdGhhdC4gIEllLCBleGFjdGx5IGhvdyB0
byBjYWxjdWxhdGUgdGhlIG51bWVyYXRvciBhbmQKZGVub21pbmF0b3IuCgpEbyB3ZSB3YW50IHRv
IHRyYWNrIHRoYXQgb3ZlciBmbGlnaHRzIHRoYXQgZ290IHB1c2hlcywgb3Igc29tZXRoaW5nLApv
bmx5ID8gIElTVE0gdGhhdCwgZm9yIGV4YW1wbGUsIGlmIG1hc3Rlcj09c3RhZ2luZ34yLCBhbmQg
dGVzdHMgb2YKc3RhZ2luZ34xIHdlcmUgYSB3aXBlb3V0IGJlY2F1c2Ugb2YgYSByZWdyZXNzaW9u
IGZpeGVkIGluIHN0YWdpbmd+MCwKdGhlbiB3aGVuIHdlIHJlcG9ydCB0aGUgInRyZW5kIiBpbiB0
aGUgdGVzdCByZXBvcnQgb2Ygc3RhZ2luZ34wLCB0aGF0CnNob3VsZCBkaXNyZWdhcmQgdGhlIGRp
c2FzdGVyIHRoYXQgd2FzIHRoZSB0ZXN0KHMpIG9mIHN0YWdpbmd+MS4KCkFuZCBvZiBjb3Vyc2Ug
SSBzaG91bGQgYmUgYXNraW5nIGEgZGlmZmVyZW50IHF1ZXN0aW9uIGVudGlyZWx5IGlmIHdlCmRl
Y2lkZSB0byBtb3ZlIHRvIG11bHRpcGxlLCByZXdpbmRpbmcsIGlucHV0IGJyYW5jaGVzLCByYXRo
ZXIgdGhhbiBhCnNpbmdsZSBmYXN0LWZvcndhcmRpbmcgb25lLgoKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
