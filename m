From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC v1 36/74] --- x86/shim: Kconfig and
 command line options
Date: Fri, 5 Jan 2018 17:51:47 +0000
Message-ID: <5bae7892-ce28-47fe-940b-072130558ab0@citrix.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-37-wei.liu2@citrix.com>
 <5A4FA749020000780019B72F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oku2=ea=citrix.com=prvs=536ec9109=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eXWIl-0004YU-CU
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2018 18:01:07 +0000
In-Reply-To: <5A4FA749020000780019B72F@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, wei.liu2@citrix.com
Cc: Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDEvMTggMTU6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjAxLjE4IGF0
IDE0OjA1LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9LY29uZmlnCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9LY29uZmlnCj4+IEBAIC0xMzMsNiArMTMz
LDI4IEBAIGNvbmZpZyBQVkhfR1VFU1QKPj4gIAktLS1oZWxwLS0tCj4+ICAJICBTdXBwb3J0IGJv
b3RpbmcgdXNpbmcgdGhlIFBWSCBBQkkuCj4+ICAKPj4gKwkgIElmIHVuc3VyZSwgc2F5IE4uCj4+
ICsKPj4gK2NvbmZpZyBQVl9TSElNCj4+ICsJZGVmX2Jvb2wgbgo+PiArCXByb21wdCAiUFYgU2hp
bSIKPj4gKwlkZXBlbmRzIG9uIFBWICYmIFhFTl9HVUVTVAo+PiArCS0tLWhlbHAtLS0KPj4gKwkg
IEJ1aWxkIFhlbiB3aXRoIGEgbW9kZSB3aGljaCBhY3RzIGFzIGEgc2hpbSB0byBhbGxvdyBQViBn
dWVzdCB0byBydW4KPj4gKwkgIGluIGFuIEhWTS9QVkggY29udGFpbmVyLiBUaGlzIG1vZGUgY2Fu
IG9ubHkgYmUgZW5hYmxlZCB3aXRoIGNvbW1hbmQKPj4gKwkgIGxpbmUgb3B0aW9uLgo+PiArCj4+
ICsJICBJZiB1bnN1cmUsIHNheSBOLgo+PiArCj4+ICtjb25maWcgUFZfU0hJTV9FWENMVVNJVkUK
Pj4gKwlkZWZfYm9vbCBuCj4+ICsJcHJvbXB0ICJQViBTaGltIEV4Y2x1c2l2ZSIKPj4gKwlkZXBl
bmRzIG9uIFBWX1NISU0KPiBNeSBleHBlY3RhdGlvbiBzbyBmYXIgd2FzIHRoYXQgdGhpcyB3b3Vs
ZCBiZSB0aGUgb25seSBtb2RlIHdlCj4gdGFyZ2V0LCBoZW5jZSBJIHRoaW5rIGF0IHRoZSB2ZXJ5
IGxlYXN0IHRoZSBkZWZhdWx0IHdhbnRzIHRvIGJlIHkKPiBoZXJlLgoKVW50aWwgcHJvcGVyIG91
dC1vZi10cmVlIFhlbiBidWlsZHMgd29yaywgYnVpbGRpbmcgdGhlIHNoaW0gYmluYXJ5IGF0CmFs
bCBpcyBhIFBJVEEuCgpUaGVzZSBkZWZhdWx0cyBnaXZlIGEgZGV2ZWxvcGVyIGEgc2luZ2xlIGJp
bmFyeSB3aGljaCBpcyBjYXBhYmxlIG9mCnJ1bm5pbmcgbmF0aXZlbHkgb3IgYXMgdGhlIHNoaW0s
IHdoaWNoIGhhcyBtYWRlIGRldmVsb3BtZW50IGZhciBtb3JlCnByb2R1Y3RpdmUuwqAgSXRzIGNl
cnRhaW5seSB0aGUgd2F5IEknZCBleHBlY3QgdG8gZG8gcHJpbWFyeSBmdXR1cmUKZGV2ZWxvcG1l
bnQgb2YgdGhlIHNoaW0uCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
