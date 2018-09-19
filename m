From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4] x86/altp2m: Add a subop for obtaining
 the mem access of a page
Date: Wed, 19 Sep 2018 08:48:54 -0600
Message-ID: <5BA261D602000078001E9F8C@prv1-mh.provo.novell.com>
References: <20180903154734.25361-1-apop@bitdefender.com>
 <20180919144451.xk4etvgaj3l4ojgw@zion.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lqxj=mb=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g2dmm-0004dA-DC
 for xen-devel@lists.xenproject.org; Wed, 19 Sep 2018 14:49:00 +0000
In-Reply-To: <20180919144451.xk4etvgaj3l4ojgw@zion.uk.xensource.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Adrian Pop <apop@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, Sergej Proskurin <proskurin@sec.in.tum.de>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjA5LjE4IGF0IDE2OjQ0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBTZXAgMDMsIDIwMTggYXQgMDY6NDc6MzRQTSArMDMwMCwgQWRyaWFuIFBvcCB3cm90
ZToKPj4gLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaAo+PiArKysgYi94ZW4v
aW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4+IEBAIC0yMzQsNiArMjM0LDcgQEAgc3RydWN0
IHhlbl9odm1fYWx0cDJtX3ZpZXcgewo+PiAgdHlwZWRlZiBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1f
dmlldyB4ZW5faHZtX2FsdHAybV92aWV3X3Q7Cj4+ICBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRSh4
ZW5faHZtX2FsdHAybV92aWV3X3QpOwo+PiAgCj4+ICsjaWYgX19YRU5fSU5URVJGQUNFX1ZFUlNJ
T05fXyA8IDB4MDAwNDBhMDAKPj4gIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2Vz
cyB7Cj4+ICAgICAgLyogdmlldyAqLwo+PiAgICAgIHVpbnQxNl90IHZpZXc7Cj4+IEBAIC0yNDUs
NiArMjQ2LDE5IEBAIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9zZXRfbWVtX2FjY2VzcyB7Cj4+ICB9
Owo+PiAgdHlwZWRlZiBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3MgeGVuX2h2
bV9hbHRwMm1fc2V0X21lbV9hY2Nlc3NfdDsKPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHhl
bl9odm1fYWx0cDJtX3NldF9tZW1fYWNjZXNzX3QpOwo+PiArI2VuZGlmIC8qIF9fWEVOX0lOVEVS
RkFDRV9WRVJTSU9OX18gPCAweDAwMDQwYTAwICovCj4gCj4gI2Vsc2UgaGVyZSBwbGVhc2UsIG90
aGVyd2lzZSB5b3UncmUgYWRkaW5nIHRoaXMgbmV3IGludGVyZmFjZSB0byBhIHNldAo+IG9mIG9s
ZCBpbnRlcmZhY2VzLgoKSSBkb24ndCB0aGluayB3ZSBkbyBzbyBlbHNld2hlcmUsIHNvIEknZCBw
cmVmZXIgaWYgd2UgZGlkbid0IGRvIHNvCmhlcmUgZWl0aGVyLiBCeSB1bmNvbmRpdGlvbmFsbHkg
ZXhwb3NpbmcgdGhlIG5ldyBpbnRlcmZhY2Ugd2UKYWxsb3cgcGVvcGxlIHRvIG1vcnBoIHRoZWly
IGNvZGUgaW4gc3RlcHMsIHJhdGhlciB0aGFuIGFsbCBpbiBvbmUKZ28gYXQgdGhlIHBvaW50IHRo
ZXkgYnVtcCB0aGVpciBfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fCnNldHRpbmcuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
