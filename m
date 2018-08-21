From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 26/34] x86/mm/shadow: split out HVM only code
Date: Tue, 21 Aug 2018 05:36:28 -0600
Message-ID: <5B7BF93C02000078001E0706@prv1-mh.provo.novell.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <21d88360019e3f7c38ebcda4f83c3112781465f6.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ip0d=le=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fs4xd-0007gu-MA
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 11:36:33 +0000
In-Reply-To: <21d88360019e3f7c38ebcda4f83c3112781465f6.1534518694.git-series.wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDE3OjEyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIC9kZXYvbnVsbAo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvaHZtLmMKPiBAQCAt
MCwwICsxLDU5MCBAQAo+ICsKPiArLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ICsgKiBhcmNoL3g4
Ni9tbS9zaGFkb3cvaHZtLmMKPiArICoKPiArICogU2hhZG93IGNvZGUgdGhhdCBkb2VzIG5vdCBu
ZWVkIHRvIGJlIG11bHRpcGx5IGNvbXBpbGVkIGFuZCBpcyBIVk0gb25seS4KPiArICogUGFydHMg
b2YgdGhpcyBjb2RlIGFyZSBDb3B5cmlnaHQgKGMpIDIwMDYgYnkgWGVuU291cmNlIEluYy4KPiAr
ICogUGFydHMgb2YgdGhpcyBjb2RlIGFyZSBDb3B5cmlnaHQgKGMpIDIwMDYgYnkgTWljaGFlbCBB
IEZldHRlcm1hbgo+ICsgKiBQYXJ0cyBiYXNlZCBvbiBlYXJsaWVyIHdvcmsgYnkgTWljaGFlbCBB
IEZldHRlcm1hbiwgSWFuIFByYXR0IGV0IGFsLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMg
ZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQo+ICsg
KiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFz
IHB1Ymxpc2hlZCBieQo+ICsgKiB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIg
dmVyc2lvbiAyIG9mIHRoZSBMaWNlbnNlLCBvcgo+ICsgKiAoYXQgeW91ciBvcHRpb24pIGFueSBs
YXRlciB2ZXJzaW9uLgo+ICsgKgo+ICsgKiBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4g
dGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKPiArICogYnV0IFdJVEhPVVQgQU5ZIFdB
UlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YKPiArICogTUVSQ0hB
TlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFLiAgU2VlIHRoZQo+
ICsgKiBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgo+ICsgKgo+
ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZQo+ICsgKiBhbG9uZyB3aXRoIHRoaXMgcHJvZ3JhbTsgSWYgbm90LCBzZWUg
PGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+Lgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDx4
ZW4vdHlwZXMuaD4KPiArI2luY2x1ZGUgPHhlbi9tbS5oPgo+ICsjaW5jbHVkZSA8eGVuL3RyYWNl
Lmg+Cj4gKyNpbmNsdWRlIDx4ZW4vc2NoZWQuaD4KPiArI2luY2x1ZGUgPHhlbi9wZXJmYy5oPgo+
ICsjaW5jbHVkZSA8eGVuL2lycS5oPgo+ICsjaW5jbHVkZSA8eGVuL2RvbWFpbl9wYWdlLmg+Cj4g
KyNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+Cj4gKyNpbmNsdWRlIDx4ZW4va2V5aGFuZGxl
ci5oPgoKQXQgdGhlIGV4YW1wbGUgb2YgdGhpcyBzcGVjaWZpYyBpbmNsdWRlIEkgb25jZSBhZ2Fp
biB3b25kZXIgd2hldGhlcgp5b3UndmUgc2ltcGx5IGNvcGllZCB0aGUgbGlzdCBvZiBpbmNsdWRl
cyBmcm9tIHRoZSBvcmlnaW5hbCBmaWxlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
