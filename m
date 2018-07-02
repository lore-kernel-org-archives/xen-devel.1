From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH RFC] tools/libxl: Switch Arm guest type to
 PVH
Date: Mon, 2 Jul 2018 15:13:38 +0100
Message-ID: <cd3006a9-0ee4-ffc6-dccc-fe47d64c6a58@arm.com>
References: <20180625130814.29771-1-julien.grall@arm.com>
 <20180625131956.ehoocvdnaser3rfn@citrix.com>
 <8c3d0d5c-3953-3514-54b7-4cf4896b5df2@arm.com>
 <20180625162839.3l3njsov75tvwacj@mac.bytemobile.com>
 <23345.6832.106103.997622@mariner.uk.xensource.com>
 <20180626064917.wasgl6de6x6o3toi@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180626064917.wasgl6de6x6o3toi@mac.bytemobile.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Ian Jackson <ian.jackson@citrix.com>
Cc: andrew.cooper3@citrix.com, sstabellini@kernel.org, Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

CgpPbiAwNi8yNi8yMDE4IDA3OjQ5IEFNLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+IE9uIE1v
biwgSnVuIDI1LCAyMDE4IGF0IDA1OjM5OjEyUE0gKzAxMDAsIElhbiBKYWNrc29uIHdyb3RlOgo+
PiBSb2dlciBQYXUgTW9ubsOpIHdyaXRlcyAoIlJlOiBbUEFUQ0ggUkZDXSB0b29scy9saWJ4bDog
U3dpdGNoIEFybSBndWVzdCB0eXBlIHRvIFBWSCIpOgo+Pj4gSU1PIEkgd291bGQgcmVtb3ZlIHRo
ZSAndHlwZScgb3B0aW9uIGZyb20geGwuY2ZnIChzbyB0aGF0IGl0J3MKPj4+IGJhc2ljYWxseSBp
Z25vcmVkKSBpbiB0aGUgQVJNIGNhc2UgYW5kIGZvcmNlIGl0IGludGVybmFsbHkgdG8gUFZIIChp
Zgo+Pj4gdGhhdCdzIHRoZSBiZXN0IHJvdXRlIGZvciBjdXJyZW50IEFSTSBndWVzdHMpLgo+Pgo+
PiBXaGF0IGFib3V0IGxpYnZpcnQgdXNlcnMgPyAgSSBoYXZlbid0IHNlZW4gd2hhdCBhIGxpYnZp
cnQgWGVuIEFSTQo+PiBndWVzdCBjb25maWcgbG9va3MgbGlrZSBidXQgd2UgbmVlZCB0byBtZWFr
IHN1cmUgdGhhdCBleGlzdGluZyBndWVzdHMKPj4gZG9uJ3QgYnJlYWsuCj4gCj4gRm9yIGxpdmJp
cnQgKG9yIHVzZXJzIG9mIGxpYnhsIGxpYnJhcnkpIHdlIGNvdWxkIGZvcmNlIHRoZSB0eXBlIHRv
Cj4gcHZoLCByZWdhcmRsZXNzIG9mIHRoZSB2YWx1ZSBzZXQgYnkgdGhlIGNsaWVudCwgYnV0IEkg
Z3Vlc3MgdGhhdCB3b3VsZAo+IG1ha2UgYWRkaW5nIHR5cGVzIGxhdGVyIG9uIHF1aXRlIGNvbXBs
aWNhdGVkLgoKSSBhbSBmYWlybHkgY29uZmlkZW50IHdlIHdpbGwgbmV2ZXIgaGF2ZSBQViBndWVz
dCBvbiBBcm0uIFNvIG9uZSAKc29sdXRpb24gd291bGQgYmUgdG8gYWxpYXMgUFYgdG8gUFZIIGZv
ciBBcm0uIFRoaXMgc3RpbGwgZ2l2ZSB1cyB0aGUgCmxpYmVydHkgdG8gYWRkIG1vcmUgZ3Vlc3Qg
dHlwZSBpbiB0aGUgZnV0dXJlLgoKQW55IG9waW5pb25zPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
