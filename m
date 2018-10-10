From: "Paraschiv, Andra-Irina" <andraprs@amazon.com>
Subject: Re: [PATCH qemu-xen-traditional] xen/pt: allow QEMU to
 request MSI unmasking at bind time
Date: Wed, 10 Oct 2018 19:06:20 +0000
Message-ID: <1539198377933.29568@amazon.com>
References: <1527058885.8186.68.camel@infradead.org>
 <1529314520-79691-1-git-send-email-andraprs@amazon.com>
 <20180618114352.xelerr457ev2e5kj@mac>	<1529570276822.28578@amazon.com>
 <1533032534.16128.19.camel@amazon.co.uk>	<1537173602617.52049@amazon.com>
 <23484.45915.156520.714628@mariner.uk.xensource.com>
 <1539098633397.3404@amazon.com>,
 <23486.4923.67981.678028@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ibpf=mw=amazon.com=prvs=814218718=andraprs@srs-us1.protection.inumbo.net>)
 id 1gAJoR-0000Vv-HH
 for xen-devel@lists.xenproject.org; Wed, 10 Oct 2018 19:06:27 +0000
In-Reply-To: <23486.4923.67981.678028@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woodhouse,
 David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBxZW11LXhlbi10cmFk
aXRpb25hbF0geGVuL3B0OiBhbGxvdyBRRU1VIHRvIHJlcXVlc3QgTVNJIHVubWFza2luZyBhdCBi
aW5kIHRpbWUiKToKPgo+IFBhcmFzY2hpdiwgQW5kcmEtSXJpbmEgd3JpdGVzICgiUmU6IFtYZW4t
ZGV2ZWxdIFtQQVRDSCBxZW11LXhlbi10cmFkaXRpb25hbF0geGVuL3B0OiBhbGxvdyBRRU1VIHRv
IHJlcXVlc3QgTVNJIHVubWFza2luZyBhdCBiaW5kIHRpbWUiKToKPiA+IE9uZSBvZiB0aGUgdXNl
IGNhc2VzIHdoZXJlIHRoaXMgZml4IGlzIG5lZWRlZCBpczogZ3Vlc3QgT1MgaXMgV2luZG93cyBh
bmQgdGhlIGhvc3QgaGFzIHRoZSBsYXRlc3Qgc3RhYmxlIHZlcnNpb24gb2YgeGVuIGFuZCBxZW11
LXhlbi10cmFkaXRpb25hbC4gVXNpbmcgdGhpcyBlbnZpcm9ubWVudCwgc2V0dGluZyB1cCBhIFBD
SSBkZXZpY2UgKHVzaW5nIE1TSS9NU0ktWCBpbnRlcnJ1cHRzKSB3aWxsIG5vdCBzdWNjZXNzZnVs
bHkgZmluaXNoLgo+Cj4gT0ssIEknbSBzb2xkIG9uIGFwcGx5aW5nIHRoZSBwYXRjaCB0byBxZW11
LXRyYWQuICBHcmVhdC4KCkdvb2QgOikgIEl0J3MgdXNlZnVsIHRvIGhhdmUgaXQgYXBwbGllZC4K
Cj4KPiA+IFRoYXQncyB0aGUgbGluayB0byB0aGUgcGF0Y2ggZm9yIHFlbXUteGVuLXRyYWRpdGlv
bmFsOgo+ID4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8yMDE4LTA2L21zZzAxMjQ4Lmh0bWwKPiAKPiBSaWdodCwgdGhhbmtzLgo+IAo+ID4gKGh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0w
Ni9tc2cwMTM3My5odG1sIC0gYWRkZWQgeW91IGluIENDKQo+IAo+IFVuZm9ydHVuYXRlbHkgSSBk
b24ndCB3YW50IHRvIGZpc2ggdGhlIHBhdGNoIG91dCBvZiB0aGUgbWFpbGluZyBsaXN0Cj4gYXJj
aGl2ZXMgKGJlY2F1c2UgdGhlIGNvbnZlcnNpb24gZnJvbSBlbWFpbCB0byBodG1sIGFuZCBiYWNr
Cj4gZXRjLiBtaWdodCBtYW5nbGUgaXQpIGFuZCB0aGUgZW1haWwgd2l0aCB0aGUgQ0MgdG8gbWUg
ZGlkbid0IGFjdHVhbGx5Cj4gaGF2ZSB0aGUgcGF0Y2ggaW4gaXQuCj4gCj4gU28gY2FuIHlvdSBw
bGVhc2UgcmVzZW5kIHRoZSBiYWNrcG9ydGVkIHBhdGNoIHRvIG1lID8gIE9yIHBvaW50IG1lIGF0
Cj4gYSBnaXQgdHJlZSB0aGF0IGNvbnRhaW5zIHRoZSBiYWNrcG9ydGVkIHBhdGNoID8KClJlc2Vu
dCB0aGUgcGF0Y2gsIGhlcmUgaXQgaXMgb24gdGhlIGxpc3Q6Cmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0xMC9tc2cwMDkzNy5odG1sCgpU
aGFua3MgZm9yIGhlbHBpbmcgd2l0aCB0aGlzLgoKQW5kcmEKCj4gCj5UaGFua3MsCj5JYW4uCgoK
CkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgKFJvbWFuaWEpIFMuUi5MLiByZWdpc3RlcmVkIG9m
ZmljZTogMjdBIFNmLiBMYXphciBTdHJlZXQsIFVCQzUsIGZsb29yIDIsIElhc2ksIElhc2kgQ291
bnR5LCA3MDAwNDUsIFJvbWFuaWEuIFJlZ2lzdGVyZWQgaW4gUm9tYW5pYS4gUmVnaXN0cmF0aW9u
IG51bWJlciBKMjIvMjYyMS8yMDA1LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
