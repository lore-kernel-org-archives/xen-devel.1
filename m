From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH RESEND qemu-xen-traditional] xen/pt: allow
 QEMU to request MSI unmasking at bind time
Date: Tue, 30 Oct 2018 19:33:16 +0200
Message-ID: <20181030173316.GD31019@reaktio.net>
References: <20181010185254.110354-1-andraprs@amazon.com>
 <23504.36291.25070.921458@mariner.uk.xensource.com>
 <20181029145815.GB31019@reaktio.net>
 <1540846506816.50601@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=q4nz=nk=iki.fi=pasik@srs-us1.protection.inumbo.net>)
 id 1gHXtJ-0006ET-Rz
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 17:33:21 +0000
Content-Disposition: inline
In-Reply-To: <1540846506816.50601@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Paraschiv, Andra-Irina" <andraprs@amazon.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian Jackson <ian.jackson@citrix.com>, "Woodhouse, David" <dwmw@amazon.co.uk>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBPY3QgMjksIDIwMTggYXQgMDg6NTU6MDlQTSArMDAwMCwgUGFyYXNjaGl2LCBBbmRy
YS1JcmluYSB3cm90ZToKPiAKPiAKPiBPbiBNb24sIE9jdCAyOSwgMjAxOCBhdCAwNDo1ODoyMlBN
ICswMjAwLCBQYXNpIEvDpHJra8OkaW5lbiB3cm90ZToKPiA+IEhpLAo+ID4KPiA+IE9uIFdlZCwg
T2N0IDI0LCAyMDE4IGF0IDA0OjIwOjM1UE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+ID4g
PiBBbmRyYSBQYXJhc2NoaXYgd3JpdGVzICgiW1BBVENIIFJFU0VORCBxZW11LXhlbi10cmFkaXRp
b25hbF0geGVuL3B0OiBhbGxvdyBRRU1VIHRvIHJlcXVlc3QgTVNJIHVubWFza2luZyBhdCBiaW5k
IHRpbWUiKToKPiA+ID4gPiBXaGVuIGEgTVNJIGludGVycnVwdCBpcyBib3VuZCB0byBhIGd1ZXN0
IHVzaW5nCj4gPiA+ID4geGNfZG9tYWluX3VwZGF0ZV9tc2lfaXJxIChYRU5fRE9NQ1RMX2JpbmRf
cHRfaXJxKSB0aGUgaW50ZXJydXB0IGlzCj4gPiA+ID4gbGVmdCBtYXNrZWQgYnkgZGVmYXVsdC4K
PiA+ID4KPiA+ID4gQXBwbGllZCwgYW5kIHB1c2hlZCB0aGUgY29ycmVzcG9uZGluZyB1cGRhdGUg
dG8gUUVNVV9UQUcgaW4KPiA+ID4gcWVtdS14ZW4tdW5zdGFibGUuCj4gPiA+Cj4gPiA+IERvZXMg
dGhpcyBwYXRjaCBuZWVkIHRvIGJlIGJhY2twb3J0ZWQgdG8gZWFybGllciBYZW4gcmVsZWFzZXMg
PyAgSXQKPiA+ID4gd2Fzbid0IGNsZWFyIHRvIG1lIHdoZXRoZXIgdGhlcmUgaXMgbmV3IFhlbiBj
b2RlIGluIHRoaXMgYXJlYSB3aXRob3V0Cj4gPiA+IHdoaWNoIHRoZSBwcm9ibGVtICh3aGljaCB0
aGUgcGF0Y2ggc29sdmVzKSBkb2VzIG5vdCBhcmlzZTsgb3Igd2hldGhlciwKPiA+ID4gY29udmVy
c2VseSwgc2ltcGx5IHJ1bm5pbmcgYSBuZXcgZ3Vlc3QgaXMgc3VmZmljaWVudC4KPiA+ID4KPiA+
IAo+ID4gR29vZCBxdWVzdGlvbi4gSW4gdGhlIGVhcmxpZXIgdGhyZWFkIGFib3V0IHRoaXMgcGF0
Y2ggaXQgd2FzIG1lbnRpb25lZAo+ID4gdGhlIGJ1ZyBoYXBwZW5zIHdpdGggbGF0ZXN0IHN0YWJs
ZSB2ZXJzaW9uIG9mIFhlbiwgd2hpY2ggc291bmRzIGxpa2UKPiA+IHRoaXMgcGF0Y2ggc2hvdWxk
IGJlIGJhY2twb3J0ZWQgdG8gc3RhYmxlIFhlbiB2ZXJzaW9ucy4gSXMgdGhhdCBjb3JyZWN0Pwo+
IAo+IFJlcGxpZWQgbGF0ZXIgdGhhbiBleHBlY3RlZCwgYnV0IEknbSBiYWNrIG5vdy4KPiAKPiBJ
YW4sIFBhc2ksCj4gCj4gUmlnaHQuIFdlIGhhdmUgdGhpcyBtYWlsIHRocmVhZCB3aGVyZSB0aGUg
aXNzdWUgd2FzIG9yaWdpbmFsbHkgcmVwb3J0ZWQ6Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE3LTA3L21zZzAwOTE1Lmh0bWwKPiAKPiBB
bmQgdGhlIGZvbGxvdy11cCB3aXRoIHRoZSBwYXRjaGVzIGZvciBYZW4gYW5kIFFFTVUgKG5vdCB0
cmFkaXRpb25hbCk6Cj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1s
L3hlbi1kZXZlbC8yMDE4LTA1L21zZzAxMjM4Lmh0bWwKPiAKPiAiSG0sIEkgdGhpbmsgSSBtaWdo
dCBoYXZlIGZpeGVkIHRoaXMgaXNzdWUsIHNlZToKPiAKPiBodHRwczovL2dpdC5xZW11Lm9yZy8/
cD1xZW11LmdpdDthPWNvbW1pdDtoPWE4MDM2MzM2NjA5ZDJlMTg0ZmMzNTQzYTRjNDM5YzBiYTdk
N2YzYTIKPiAKPiBBbmQgdGhlIFhlbiBzaWRlOgo+IAo+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcv
Z2l0d2ViLz9wPXhlbi5naXQ7YT1jb21taXQ7aD02OWQ5OWQxYjIyM2ZjNTA4MjQwMDM3NDY5OGRk
ZDc0ODZlNWVhOTUzIgo+IAo+IFRoZSBYZW4gcGF0Y2ggYWJvdmUgaXMgcHJlc2VudCBpbiB0aGUg
dHJlZSBmcm9tIDQuMTAuMC1yYzEgdGFnIGZvcndhcmQuCj4gCgpUaGFua3MhIFNvIGl0IGxvb2tz
IGxpa2UgdGhlIHBhdGNoIHNob3VsZCBiZSBhcHBsaWVkL2JhY2twb3J0ZWQgdG8gcWVtdS10cmFk
aXRpb25hbCB0cmVlcyBmb3IgWGVuIDQuMTAgYW5kIDQuMTEuCgoKLS0gUGFzaQoKPiBUaGFua3Mg
Zm9yIGZlZWRiYWNrLiBBbnl0aGluZyBJIGNhbiBoZWxwIGZ1cnRoZXIsIHdlIGNhbiBkaXNjdXNz
IGFib3V0IGl0Lgo+IAo+IEFuZHJhCj4gCj4gPiBUaGFua3MsCj4gPiAKPiA+IC0tIFBhc2kKPiA+
Cj4gPiA+IFJlZ2FyZHMsCj4gPiA+IElhbi4KPiA+ID4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
