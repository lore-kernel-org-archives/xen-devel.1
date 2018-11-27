From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: Xen optimization
Date: Tue, 27 Nov 2018 13:27:33 -0800 (PST)
Message-ID: <alpine.DEB.2.10.1811271320170.4577@sstabellini-ThinkPad-X260>
References: <CADJ6SV1__ZWDhGWoW7u=W54zG1STSnchkg0enyQoPyEB9YGXPg@mail.gmail.com>
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
 <alpine.DEB.2.10.1811011320050.7220@sstabellini-ThinkPad-X260>
 <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1gRktN-0004Zi-3B
 for xen-devel@lists.xenproject.org; Tue, 27 Nov 2018 21:27:37 +0000
In-Reply-To: <35b44b61-9d2d-60d0-97ee-5b8c00e8be6d@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>
Cc: nd@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com, Milan Boberic <milanboberic94@gmail.com>, Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>, Meng Xu <xumengpanda@gmail.com>, xen-devel@lists.xenproject.org, Stefano Stabellini <stefano.stabellini@xilinx.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCAyMCBOb3YgMjAxOCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBTdGVmYW5v
LAo+IAo+IE9uIDAxLjExLjE4IDIyOjIwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiBO
bywgSSBoYXZlbid0IGhhZCBhbnkgdGltZS4gQXNpZGUgZnJvbSB0aGUgWGVuIHZlcnNpb24sIGFu
b3RoZXIKPiA+IGRpZmZlcmVuY2UgaXMgdGhlIGludGVycnVwdCBzb3VyY2UuIEkgdXNlZCB0aGUg
cGh5c2ljYWwgdGltZXIgZm9yCj4gPiB0ZXN0aW5nLgo+IAo+IENvdWxkIHlvdSBzaGFyZSB5b3Vy
IGFwcHJvYWNoIGZvciBpbnRlcnJ1cHRzIGxhdGVuY3kgbWVhc3VyZW1lbnQ/IEFyZSB5b3UKPiB1
c2luZyBhbnkgSFcgc3BlY2lmaWNzIG9yIGl0IGlzIFNvQyBpbmRlcGVuZGVudD8KPiAKPiBJIHdv
dWxkIGxpa2UgdG8gZ2V0IG1vcmUgZXZpZGVuY2VzIGZvciBvcHRpbWl6YXRpb25zIG9mIGdpYy92
Z2ljL2dpYy12MiBjb2RlIEkKPiBkaWQgZm9yIG91ciBjdXN0b21lciAoaXRzIGFib3V0IG9sZCB2
Z2ljLCB3ZSBhcmUgc3RpbGwgb24geGVuIDQuMTApLgoKSGkgQW5kcmlpLAoKU2VlIHRoZSBmb2xs
b3dpbmc6CgpodHRwczovL21hcmMuaW5mby8/bD14ZW4tZGV2ZWwmbT0xNDg2Njg4MTc3MDQ2NjgK
ClRoZSBudW1iZXJzIGhhdmUgaW1wcm92ZWQgbm93IHRoYW5rcyB0byB2d2ZpPW5hdGl2ZSBhbmQg
b3RoZXIKb3B0aW1pemF0aW9ucyBidXQgdGhlIG1lY2hhbmlzbSB0byBzZXR1cCB0aGUgZXhwZXJp
bWVudCBhcmUgdGhlIHNhbWUuCgpDaGVlcnMsCgpTdGVmYW5vCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
