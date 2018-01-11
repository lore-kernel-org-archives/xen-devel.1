From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH 2/2] xen-netfront: Fix race between device
	setup and open
Date: Thu, 11 Jan 2018 16:27:20 +0000
Message-ID: <0650f0ec-51ce-70ee-cd8a-6620f0c9eea8__42893.137332476$1515687979$gmane$org@citrix.com>
References: <20180111093638.28937-3-ross.lagerwall@citrix.com>
 <20180111.102622.769744562294438306.davem@davemloft.net>
 <f297b1a4-d287-ba66-ad44-bf6073950bdf@citrix.com>
 <20180111.110810.1332044409040498618.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=oq2j=eg=citrix.com=prvs=54256733d=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1eZfhS-0007Bi-7G
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2018 16:27:30 +0000
In-Reply-To: <20180111.110810.1332044409040498618.davem@davemloft.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Miller <davem@davemloft.net>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTEvMjAxOCAwNDowOCBQTSwgRGF2aWQgTWlsbGVyIHdyb3RlOgo+IEZyb206IFJvc3Mg
TGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+IERhdGU6IFRodSwgMTEgSmFu
IDIwMTggMTU6NDk6MDcgKzAwMDAKPiAKPj4gSSd2ZSBub3cgYWRkZWQgQ0MnZCBuZXRkZXYgb24g
dGhlIG90aGVyIHR3by4KPiAKPiBUaGF0IGRvZXNuJ3Qgd29yay4KPiAKPiBJZiB5b3UgZG9uJ3Qg
cG9zdCB0aGUgb3JpZ2luYWxzIGV4cGxpY2l0bHkgdG8gbmV0ZGV2IHRoZW4gaXQgd29uJ3QKPiBn
ZXQgcHJvcGVybHkgcXVldWVkIGluIHBhdGNod29yay4KPiAKClRoZSBzZXJpZXMgZml4ZXMgdHdv
IGNyYXNoZXMgd2hlbiB1c2luZyBuZXRmcm9udC4gVGhlIGZpcnN0IGlzIGFjdHVhbGx5IApmaXhl
ZCBpbiBYZW4gY29tbW9uIGNvZGUsIG5vdCBuZXRmcm9udCwgd2hpY2ggaXMgd2h5IEkgb25seSBD
QydkIG5ldGRldiAKb24gdGhlIHNlY29uZC4gSSBjYW4gcmVzZW5kIHRoZSBvcmlnaW5hbHMgdG8g
bmV0ZGV2IGlmIHlvdSB3YW50IGJ1dCBJTU8gCml0IGlzIG5vdCBuZWNlc3NhcnkuCgotLSAKUm9z
cyBMYWdlcndhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
