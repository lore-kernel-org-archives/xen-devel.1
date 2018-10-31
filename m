From: Julien Grall <julien.grall@arm.com>
Subject: Re: Xen optimization
Date: Wed, 31 Oct 2018 21:16:43 +0000
Message-ID: <a5eab71a-f301-67ae-cc22-8cf10715fdcd@arm.com>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
 <21de0bb5-81f2-ca26-e2e0-916c20ab2c02@arm.com>
 <CADJ6SV3sfqaXm8gvZDAx2wFY5_oiCf+mf0JynCGNrLBFkS-rVw@mail.gmail.com>
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
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yklc=nl=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gHxr6-0005Tj-Iv
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 21:16:48 +0000
In-Reply-To: <CADJ6SV22eAxR0s0ocpGNRRefo+FmsMz9KsEeXw+cME1sSM-ssg@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Milan Boberic <milanboberic94@gmail.com>
Cc: stefano.stabellini@xilinx.com, andrii_anisov@epam.com, Dario Faggioli <dfaggioli@suse.com>, sstabellini@kernel.org, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMC8zMS8xOCA4OjM1IFBNLCBNaWxhbiBCb2JlcmljIHdyb3RlOgo+IEhpLAo+IAo+PiBJ
bnRlcmVzdGluZy4gQ291bGQgeW91IGNvbmZpcm0gdGhlIGNvbW1pdCB5b3Ugd2VyZSB1c2luZyAo
b3IgdGhlIHBvaW50Cj4+IHJlbGVhc2UpPwo+PiBTdGVmYW5vJ3MgbnVtYmVyIHdlcmUgYmFzZWQg
b24gY29tbWl0ICJmdXp6OiB1cGRhdGUgUkVBRE1FLmFmbCBleGFtcGxlIgo+PiA1NWEwNGZlYWEx
ZjhhYjZlZjdkNzIzZmJiMWQzOWM2Yjk2YWQxODRhIHdoaWNoIGlzIGFuIHVucmVsZWFzZWQgdmVy
c2lvbgo+PiBvZiBYZW4uCj4gCj4gQWxsIFhlbnMgSSB1c2VkIGFyZSBmcm9tIFhpbGlueCBnaXQg
cmVwb3NpdG9yeSBiZWNhdXNlIEkgaGF2ZQo+IFVsdHJhWmVkLUVHIGJvYXJkIHdoaWNoIGhhcyBa
eW5xIFVsdHJhU2NhbGUgU29DLgo+IFVuZGVyIGJyYW5jaGVzIHlvdSBjYW4gZmluZCBYZW4gNC44
LCA0LjksICBldGMuCj4gSSBhbHdheXMgdXNlZCBsYXRlc3QgY29tbWl0OiBjMjI3ZmU2ODU4OWJk
ZmIzNmI4NWY3Yjc4YzAzNGE0MGM5NWI5YTMwCj4gSGVyZSBpcyBsaW5rIHRvIGl0Ogo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9YaWxpbngveGVuL3RyZWUveGlsaW54L3N0YWJsZS00LjkKClRoaXMgYnJh
bmNoIGlzIHF1aXRlIGFoZWFkIG9mIHRoZSBicmFuY2ggU3RlZmFubydzIHVzZWQuIFRoZXJlIGFy
ZSA5NCAKY29tbWl0cyBtb3JlIGp1c3QgZm9yIEFybSBzcGVjaWZpYyBjb2RlLgoKV2hhdCBJIGFt
IGludGVyZXN0ZWQgaXMgdG8gc2VlIGlmIHdlIGFyZSBhYmxlIHRvIHJlcHJvZHVjZSBTdGVmYW5v
J3MgCm51bWJlciB3aXRoIHRoZSBzYW1lIGJyYW5jaC4gU28gd2UgY2FuIGhhdmUgYSBjbHVlIHdo
ZXRoZXIgdGhlcmUgYXJlIGEgCnNsb3cgZG93biBpbnRyb2R1Y2UgaW4gbmV3IGNvZGUuCgpTdGVm
YW5vLCB5b3UgbWVudGlvbiB5b3Ugd2lsbCBsb29rIGF0IHJlcHJvZHVjaW5nIHRoZSBudW1iZXJz
LiBEbyB5b3UgCmhhdmUgYW55IHVwZGF0ZSBvbiB0aGlzPwoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
