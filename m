From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH] x86: slightly reduce Meltdown band-aid
	overhead
Date: Tue, 23 Jan 2018 17:39:32 +0000
Message-ID: <9fabcf9f-95df-1101-a648-59e90c17fca9@citrix.com>
References: <5A60CDD7020000780019FF92@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gxrj=es=citrix.com=prvs=554f78a13=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ee2Xs-0001Nr-OY
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 17:39:40 +0000
In-Reply-To: <5A60CDD7020000780019FF92@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTgvMjAxOCAwMzozOSBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSSdtIG5vdCBzdXJl
IHdoeSBJIGRpZG4ndCBkbyB0aGlzIHJpZ2h0IGF3YXk6IEJ5IGF2b2lkaW5nIHRvIG1ha2UgYW55
Cj4gb2YgdGhlIGNsb25lZCBkaXJlY3RtYXAgUFRFcyBnbG9iYWwsIHRoZXJlJ3Mgbm8gbmVlZCB0
byBmaWRkbGUgd2l0aAo+IENSNC5QR0Ugb24gYW55IG9mIHRoZSBlbnRyeSBwYXRocy4gT25seSB0
aGUgZXhpdCBwYXRocyBuZWVkIHRvIGZsdXNoCj4gZ2xvYmFsIG1hcHBpbmdzLgo+IAo+IFRoZSBy
ZWR1Y2VkIGZsdXNoaW5nLCBob3dldmVyLCBpbXBsaWVzIHRoYXQgd2Ugbm93IG5lZWQgdG8gaGF2
ZQo+IGludGVycnVwdHMgb2ZmIG9uIGFsbCBlbnRyeSBwYXRocyB1bnRpbCBhZnRlciB0aGUgcGFn
ZSB0YWJsZSBzd2l0Y2gsIHNvCj4gdGhhdCBmbHVzaCBJUElzIGNhbid0IGFycml2ZSB3aXRoIHRo
ZSByZXN0cmljdGVkIHBhZ2UgdGFibGVzIHN0aWxsCj4gYWN0aXZlLCBidXQgb25seSBhIG5vbi1n
bG9iYWwgZmx1c2ggaGFwcGVuaW5nIHdpdGggdGhlIENSMyBsb2Fkcy4gQWxvbmcKPiB0aG9zZSBs
aW5lcyB0aGUgInN5bmMiIElQSSBhZnRlciBMNCBlbnRyeSB1cGRhdGVzIG5vdyBuZWVkcyB0byBi
ZWNvbWUgYQo+IHJlYWwgKGFuZCBnbG9iYWwpIGZsdXNoIElQSSwgc28gdGhhdCBpbnNpZGUgWGVu
IHdlJ2xsIGFsc28gcGljayB1cCBzdWNoCj4gY2hhbmdlcy4KPiAKPiBUYWtlIHRoZSBvcHBvcnR1
bml0eSBhbmQgYWxzbyBkbyBhIEdFVF9DVVJSRU5UKCkgLT4gX19HRVRfQ1VSUkVOVCgpCj4gdHJh
bnNpdGlvbiB0aGUgb3JpZ2luYWwgcGF0Y2ggbWlzc2VkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkZXSVcsIGZvciBtZSB0aGlzIHBhdGNoIHJl
ZHVjZXMgdGhlIG92ZXJoZWFkIGZyb20gMzglIHRvIDI4JS4gIEJlbG93IGFyZQp0aW1lcyBmcm9t
IGEgInRpbWUgbWFrZSAtaiA0IHhlbiIKCiogeHB0aT1vZmY6IDYzcwoqIFt4cHRpIGRlZmF1bHRd
OiA4N3MgKCszOCUpCiogKyB0aGlzIHBhdGNoOiA4MXMgKCsyOCUpCgogLUdlb3JnZQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
