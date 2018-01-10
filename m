From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: sidecar (hvm shim) creation script
Date: Wed, 10 Jan 2018 13:10:49 +0000
Message-ID: <20180110131049.rv6emm32efbczhl2@citrix.com>
References: <23123.44604.284781.889416@mariner.uk.xensource.com>
 <20180109194351.mmbmjzwhptlkr5as@citrix.com>
 <20180110083224.cmgr7flxewhx5enf@MacBook-Pro-de-Roger.local>
 <20180110122734.rgut34iw6ltqeipy@citrix.com>
 <23126.4117.777031.227394@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=n68a=ef=citrix.com=prvs=5419c82cb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZGAp-0005TP-6e
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2018 13:12:07 +0000
Content-Disposition: inline
In-Reply-To: <23126.4117.777031.227394@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, committers@xenproject.org, security@xenproject.org, Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org, Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMTAsIDIwMTggYXQgMDE6MDc6MzNQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhlIGF0dGFjaGVkIHNjcmlwdCB3b3JrcyBmb3IgbWUuICBJIGhhdmUgYmVlbiB0ZXN0
aW5nIGl0IHdpdGggYQo+IENpdHJpeCBwdnNoaW0gc2hpbSBzZXJpZXMgYW5kIGEgc2hpbSBiaW5h
cnkgdGhhdCBXZWkgcGFzc2VkIG1lIHVuZGVyCj4gdGhlIHRhYmxlLiAgSXQgbWFrZXMgYSBib290
YWJsZSBIVk0gZ3Vlc3QgY29uZmlnIGZvciBhIFBWIGd1ZXN0Lgo+IAo+IFRoaW5ncyB0aGF0IEkg
c2VlIGFyZSB3cm9uZzoKPiAKPiAgKiBNeSBndWVzdCBpcyB0cnlpbmcgdG8gYmFsbG9vbiB1cCBi
dXQgZHVlIHRvIHRoZSBleHRyYSBtZW1vcnkgdXNlZAo+ICAgIGJ5IHRoZSBzaGltIGl0IGNhbid0
LiAgSSBob3BlIEFtYXpvbidzIHZpeGVuIHNlcmllcyBoYXMgc29tZSBraW5kCj4gICAgb2YgYm9k
Z2UgZm9yIHRoaXMgPwoKSSBkb24ndCB0aGluayB0aGV5IGRvIGFueXRoaW5nIHNwZWNpYWwgaW4g
dGhhdCByZWdhcmQuIFRoZXkgcHJvYmFibHkKZG9uJ3QgdXNlIGJhbGxvb25pbmcgb3IgZG9uJ3Qg
Y2FyZS4KCj4gCj4gICogSSBzZWUgdGhpcyBtZXNzYWdlIHdoZW4gSSBjcmVhdGUgdGhlIGRvbWFp
bjoKPiAgICAgIHhjOiBlcnJvcjogRVJST1I6IE5vdCBhIFhlbi1FTEYgaW1hZ2U6IE5vIEVMRiBu
b3RlcyBvciAnX194ZW5fZ3Vlc3QnCj4gICAgICBzZWN0aW9uIGZvdW5kOiBJbnZhbGlkIGtlcm5l
bAo+ICAgIHdoaWNoIEkgaG9wZSBpcyBzb21ldGhpbmcgdG8gZG8gd2l0aCB0aGUgc2hpbSBzZXJp
ZXMgKHdoaWNoCj4gICAgSSBhbHNvIGJ1aWx0IG15IHRvb2xzIGZyb20pIG9yIHRoZSBzaGltIGJp
bmFyeSBJIGFtIHVzaW5nLgo+IAoKVGhhdCdzIHNvbWUgZXh0cmFuZW91cyBvdXRwdXQuIE5vdCBj
cml0aWNhbC4KCj4gSSBkb24ndCBrbm93IHdoYXQgdGhlIGRlZmF1bHQgc2hpbSBwYXRoIHNob3Vs
ZCBiZS4KPiAKCkFsb25nIHNpZGUgdGhlIGh2bWxvYWRlcj8gV2UgY2FuIHRyZWF0IGl0IGFzIGEg
ZmlybXdhcmUuCgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
