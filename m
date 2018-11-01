From: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: Xen optimization
Date: Thu, 1 Nov 2018 13:20:42 -0700
Message-ID: <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <alpine.DEB.2.10.1810191336090.31582@sstabellini-ThinkPad-X260>
 <d3a589c5d95d70ef1c13b4fe6856b7ed387b4ee3.camel@suse.com>
 <CADJ6SV2891kOd_Ga8jjXdtKdjPAoWtADhizuS+kjSZNNOPMK+w@mail.gmail.com>
 <alpine.DEB.2.10.1810221037270.31582@sstabellini-ThinkPad-X260>
 <CADJ6SV0gUvRv_4Kp=Vz5n4WSQ3kgQrC=+gPz1QjrBzdFOoJwPA@mail.gmail.com>
 <alpine.DEB.2.10.1810231005040.31582@sstabellini-ThinkPad-X260>
 <d5769cb9-9d87-3db4-e23d-414242692a89@arm.com>
 <alpine.DEB.2.10.1810250915030.25937@sstabellini-ThinkPad-X260>
 <94c08d07-b028-8eb1-7e94-21a416cd8007@arm.com>
 <alpine.DEB.2.10.1810261340530.32521@sstabellini-ThinkPad-X260>
 <CADJ6SV174NdceJ4kWCWYJ-UaNp1AAisb28V5tgKz14N+-pBVEg@mail.gmail.com>
 <67f6ece7-0a26-e29c-b20b-acf83a01f6eb@arm.com>
 <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
 <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=0sdp=nm=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1gIJSi-0000XQ-Dt
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 20:21:04 +0000
In-Reply-To: <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAzMSBPY3QgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEwLzMxLzE4IDg6
MzUgUE0sIE1pbGFuIEJvYmVyaWMgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gPiBJbnRlcmVzdGlu
Zy4gQ291bGQgeW91IGNvbmZpcm0gdGhlIGNvbW1pdCB5b3Ugd2VyZSB1c2luZyAob3IgdGhlIHBv
aW50Cj4gPiA+IHJlbGVhc2UpPwo+ID4gPiBTdGVmYW5vJ3MgbnVtYmVyIHdlcmUgYmFzZWQgb24g
Y29tbWl0ICJmdXp6OiB1cGRhdGUgUkVBRE1FLmFmbCBleGFtcGxlIgo+ID4gPiA1NWEwNGZlYWEx
ZjhhYjZlZjdkNzIzZmJiMWQzOWM2Yjk2YWQxODRhIHdoaWNoIGlzIGFuIHVucmVsZWFzZWQgdmVy
c2lvbgo+ID4gPiBvZiBYZW4uCj4gPiAKPiA+IEFsbCBYZW5zIEkgdXNlZCBhcmUgZnJvbSBYaWxp
bnggZ2l0IHJlcG9zaXRvcnkgYmVjYXVzZSBJIGhhdmUKPiA+IFVsdHJhWmVkLUVHIGJvYXJkIHdo
aWNoIGhhcyBaeW5xIFVsdHJhU2NhbGUgU29DLgo+ID4gVW5kZXIgYnJhbmNoZXMgeW91IGNhbiBm
aW5kIFhlbiA0LjgsIDQuOSwgIGV0Yy4KPiA+IEkgYWx3YXlzIHVzZWQgbGF0ZXN0IGNvbW1pdDog
YzIyN2ZlNjg1ODliZGZiMzZiODVmN2I3OGMwMzRhNDBjOTViOWEzMAo+ID4gSGVyZSBpcyBsaW5r
IHRvIGl0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC94ZW4vdHJlZS94aWxpbngvc3Rh
YmxlLTQuOQo+IAo+IFRoaXMgYnJhbmNoIGlzIHF1aXRlIGFoZWFkIG9mIHRoZSBicmFuY2ggU3Rl
ZmFubydzIHVzZWQuIFRoZXJlIGFyZSA5NCBjb21taXRzCj4gbW9yZSBqdXN0IGZvciBBcm0gc3Bl
Y2lmaWMgY29kZS4KPiAKPiBXaGF0IEkgYW0gaW50ZXJlc3RlZCBpcyB0byBzZWUgaWYgd2UgYXJl
IGFibGUgdG8gcmVwcm9kdWNlIFN0ZWZhbm8ncyBudW1iZXIKPiB3aXRoIHRoZSBzYW1lIGJyYW5j
aC4gU28gd2UgY2FuIGhhdmUgYSBjbHVlIHdoZXRoZXIgdGhlcmUgYXJlIGEgc2xvdyBkb3duCj4g
aW50cm9kdWNlIGluIG5ldyBjb2RlLgo+IAo+IFN0ZWZhbm8sIHlvdSBtZW50aW9uIHlvdSB3aWxs
IGxvb2sgYXQgcmVwcm9kdWNpbmcgdGhlIG51bWJlcnMuIERvIHlvdSBoYXZlIGFueQo+IHVwZGF0
ZSBvbiB0aGlzPwoKTm8sIEkgaGF2ZW4ndCBoYWQgYW55IHRpbWUuIEFzaWRlIGZyb20gdGhlIFhl
biB2ZXJzaW9uLCBhbm90aGVyCmRpZmZlcmVuY2UgaXMgdGhlIGludGVycnVwdCBzb3VyY2UuIEkg
dXNlZCB0aGUgcGh5c2ljYWwgdGltZXIgZm9yCnRlc3RpbmcuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
