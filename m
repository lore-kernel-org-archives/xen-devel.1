From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/pvshim: fix GNTTABOP_query_size
 hypercall forwarding with SMAP
Date: Fri, 26 Jan 2018 16:22:41 +0000
Message-ID: <20180126162241.gv5diajtsf2gjifc@MacBook-Pro-de-Roger.local>
References: <20180126152910.4320-1-roger.pau@citrix.com>
 <20180126155238.qxme4udlnpaqmd26@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=5n3w=ev=citrix.com=prvs=5573f66d7=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ef6mE-0005vV-Oo
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2018 16:22:54 +0000
Content-Disposition: inline
In-Reply-To: <20180126155238.qxme4udlnpaqmd26@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjYsIDIwMTggYXQgMDM6NTI6MzhQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBGcmksIEphbiAyNiwgMjAxOCBhdCAwMzoyOToxMFBNICswMDAwLCBSb2dlciBQYXUgTW9u
bmUgd3JvdGU6Cj4gPiBEaXNhYmxlIFNNQVAgaW4gdGhlIHNoaW0gYmVmb3JlIGJvdW5jaW5nIHRo
ZSBoeXBlcmNhbGwsIG9yIGVsc2UgTDAKPiA+IHdpbGwgZmFpbCB0byBnZXQgdGhlIGh5cGVyY2Fs
bCBidWZmZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgo+ID4gUmVwb3J0ZWQtYnk6IEZhdGloIEFjYXIgPGZhdGloLmFjYXJA
Z2FuZGkubmV0Pgo+ID4gLS0tCj4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+ID4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBD
YzogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gPiBDYzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gTmVlZHMgdG8gYmUgYmFja3BvcnRl
ZCB0byB0aGUgNC4xMC4wLXNoaW0tY29tZXQgYnJhbmNoLgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gv
eDg2L3B2L3NoaW0uYyB8IDMgKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYyBiL3hlbi9hcmNo
L3g4Ni9wdi9zaGltLmMKPiA+IGluZGV4IGQ1MzgzZGNmYzcuLmViMWVlN2QzYzQgMTAwNjQ0Cj4g
PiAtLS0gYS94ZW4vYXJjaC94ODYvcHYvc2hpbS5jCj4gPiArKysgYi94ZW4vYXJjaC94ODYvcHYv
c2hpbS5jCj4gPiBAQCAtNzQ4LDcgKzc0OCwxMCBAQCBzdGF0aWMgbG9uZyBwdl9zaGltX2dyYW50
X3RhYmxlX29wKHVuc2lnbmVkIGludCBjbWQsCj4gPiAgICAgIH0KPiA+ICAKPiA+ICAgICAgY2Fz
ZSBHTlRUQUJPUF9xdWVyeV9zaXplOgo+ID4gKyAgICAgICAgLyogRGlzYWJsZSBTTUFQIHNvIEww
IGNhbiBhY2Nlc3MgdGhlIGJ1ZmZlci4gKi8KPiAKPiBJbnRlcmVzdGluZy4KPiAKPiA+ICsgICAg
ICAgIHN0YWMoKTsKPiA+ICAgICAgICAgIHJjID0geGVuX2h5cGVyY2FsbF9ncmFudF90YWJsZV9v
cChHTlRUQUJPUF9xdWVyeV9zaXplLCB1b3AucCwgY291bnQpOwo+ID4gKyAgICAgICAgY2xhYygp
Owo+IAo+IFRoZXJlIGlzIHNvIGZhciBvbmx5IG9uZSBpbnN0YW5jZSBvZiB0aGlzLCBzbyBkb2lu
ZyB0aGlzIGFkLWhvYyBzdGFjIC8KPiBjbGFjIGlzIE9LLgo+IAo+IFByb2JhYmx5IGFub3RoZXIg
KG1vcmUgdW5pZm9ybWVkKSB3YXkgb2YgZml4aW5nIGl0IGlzIHRvIGhhdmUgb3VyIG93bgo+IGJ1
ZmZlciAoZm9yYmlkIHBhc3NpbmcgdGhyb3VnaCB1b3AgZGlyZWN0bHkpIGFuZCB0aGUgY29weSBi
YWNrIHRoZQo+IHJlc3VsdC4gT3Igd2Ugc2hvdWxkIGludmVudCBhIHNldCBvZiBtYWNyb3MgdG8g
ZGVhbCB3aXRoIHVvcC4KCkkgZ3Vlc3Mgd2Ugc2hvdWxkIGZpZ3VyZSBvdXQgd2hhdCdzIGZhc3Rl
ciwgZGlzYWJsaW5nIFNNQVAgb3IgY29weWluZwp0byBhIGJ1ZmZlcj8KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
