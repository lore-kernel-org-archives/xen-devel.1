From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 6/6] x86/domctl: Remove
	XEN_DOMCTL_pin_mem_cacheattr
Date: Tue, 23 Jan 2018 17:49:42 +0000
Message-ID: <20180123174942.fufjsfjypmzkkyhf@citrix.com>
References: <20180123152246.22031-1-ross.lagerwall@citrix.com>
 <20180123152246.22031-7-ross.lagerwall@citrix.com>
 <20180123154427.grsg3evcxqpgxljk@citrix.com>
 <5A676DFD0200007800124BBA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <5A676DFD0200007800124BBA@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: tim@xen.org, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, xen-devel@lists.xen.org, ross.lagerwall@citrix.com, paul.durrant@citrix.com, dgdegra@tycho.nsa.gov
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMTA6MTY6NDVBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+IDAxLzIzLzE4IDQ6NDQgUE0g
Pj4+Cj4gT24gVHVlLCBKYW4gMjMsIDIwMTggYXQgMDM6MjI6NDZQTSArMDAwMCwgUm9zcyBMYWdl
cndhbGwgd3JvdGU6Cj4gPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gPj4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oCj4gPj4gQEAgLTM4LDcgKzM4LDcgQEAK
PiA+PiAgI2luY2x1ZGUgImh2bS9zYXZlLmgiCj4gPj4gICNpbmNsdWRlICJtZW1vcnkuaCIKPiA+
PiAgCj4gPj4gLSNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDBm
Cj4gPj4gKyNkZWZpbmUgWEVOX0RPTUNUTF9JTlRFUkZBQ0VfVkVSU0lPTiAweDAwMDAwMDEwCj4g
Pj4gIAo+ID4KPiA+V2UgYnVtcGVkIHRoaXMgdG8gMGYgaW4gdGhpcyBkZXZlbG9wbWVudCB3aW5k
b3cgc28gdGhlcmUgaXMgbm8gbmVlZCB0bwo+ID5kbyBpdCBhZ2Fpbi4KPiAKPiBBcyBwb2ludGVk
IG91dCBlbHNld2hlcmUgKGF0IGxlYXN0IG9uIHR3byBvdGhlciB0aHJlYWRzIG1lYW53aGlsZSkg
d2hldGhlcgo+IHRvIGJ1bXAgX2FnYWluXyBkZXBlbmRzIG9uIHRoZSBiYWNrcG9ydGluZyBwbGFu
cyBvZiB0aGUgZG9tY3RsIGNoYW5nZXMKPiBpbiB0aGUgc2hpbSBzZXJpZXMuIElmIDQuMTAgaXMg
dG8gb2J0YWluIHRob3NlIGV2ZW50dWFsbHksIGl0IHNob3VsZCBiZSBfanVzdF8KPiB0aGF0IG9u
ZSBjaGFuZ2Ugd2hpY2ggZ29lcyB1bmRlciBpbnRlcmZhY2UgdmVyc2lvbiAweGYuCgpPSy4gVGhp
cyBtYWtlcyBzZW5zZS4gIE15IFJiIHN0aWxsIHN0YW5kcy4KCldlaS4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
