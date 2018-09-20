From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v5 3/3] x86/altp2m: Add a hvmop for querying
 the suppress #VE bit
Date: Thu, 20 Sep 2018 09:38:44 +0100
Message-ID: <20180920083844.tvz6riqlh3el46dd@zion.uk.xensource.com>
References: <20180903154836.25708-1-apop@bitdefender.com>
 <20180903154836.25708-4-apop@bitdefender.com>
 <20180919144818.7ccf6unelnspdd74@zion.uk.xensource.com>
 <eb0df7dc-ce09-7611-5b63-8b8583c39b4b@bitdefender.com>
 <20180920075326.5ojsdlnxqhtacnkt@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=1x7a=mc=citrix.com=prvs=794768bfb=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g2uUJ-0001D1-5l
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 08:39:03 +0000
Content-Disposition: inline
In-Reply-To: <20180920075326.5ojsdlnxqhtacnkt@zion.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBTZXAgMjAsIDIwMTggYXQgMDg6NTM6MjZBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIFNlcCAyMCwgMjAxOCBhdCAxMDo0NjowMUFNICswMzAwLCBSYXp2YW4gQ29qb2Nh
cnUgd3JvdGU6Cj4gPiBPbiA5LzE5LzE4IDU6NDggUE0sIFdlaSBMaXUgd3JvdGU6Cj4gPiA+IE9u
IE1vbiwgU2VwIDAzLCAyMDE4IGF0IDA2OjQ4OjM2UE0gKzAzMDAsIEFkcmlhbiBQb3Agd3JvdGU6
Cj4gPiA+PiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVyLmNvbT4K
PiA+ID4gCj4gPiA+IEFja2VkLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+ID4g
PiAKPiA+ID4gRkFPRCBJJ20gZXhwZWN0aW5nIHlvdSB0byBhZGRyZXNzIFRhbWFzJyBjb21tZW50
IGluIHBhdGNoIDEgYW5kIHJlc2VuZC4KPiA+IAo+ID4gSGVsbG8gV2VpLAo+ID4gCj4gPiBUaGF0
IGhhcyBhbHJlYWR5IGJlZW4gYWRkcmVzc2VkIGluIFY2LCBhbmQgdGhlIHBhdGNoIGlzIGFscmVh
ZHkgaW46Cj4gPiAKPiA+IGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7
YT1jb21taXRkaWZmO2g9ZWVhNGVjMmI2NmRhZDg3ZWM3NDU3NzhhYjlmMDBlMTJlZjBmMjc2MAo+
IAo+IFllcC4gU2F3IHRoYXQgeWVzdGVyZGF5IGFuZCBJIGNvbW1pdHRlZCB0aGUgbGFzdCB0d28g
cGF0Y2hlcyBvZiB2Ni4KCkFjdHVhbGx5IHRob3NlIHBhdGNoZXMgd2lsbCBuZWVkIGFja3MgZnJv
bSBHZW9yZ2UsIHRvby4gSSB3aWxsIHdhaXQKdW50aWwgRU9EIHRvIHJldmVydCB0aGVtLiBTb3Jy
eSwgbXkgbWVtb3J5IGlzIGNvbXBsZXRlbHkgd3JvbmcgcmVnYXJkaW5nCnRoZSBtYWludGFpbmVy
c2hpcCBvZiBhbHRwMm0gY29kZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
