From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Mon, 10 Dec 2018 18:59:08 +0200
Message-ID: <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
References: <1544457709-24302-1-git-send-email-rcojocaru@bitdefender.com>
 <20181210164938.lcfmhamgdxxc2zbn@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Pczp=OT=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gWOto-0001bF-Mb
 for xen-devel@lists.xenproject.org; Mon, 10 Dec 2018 16:59:16 +0000
In-Reply-To: <20181210164938.lcfmhamgdxxc2zbn@mac>
Content-Language: en-US-large
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, suravee.suthikulpanit@amd.com, jun.nakajima@intel.com, andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggNjo0OSBQTSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIERl
YyAxMCwgMjAxOCBhdCAwNjowMTo0OVBNICswMjAwLCBSYXp2YW4gQ29qb2NhcnUgd3JvdGU6Cj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVk
ZS9hc20tYXJtL3ZtX2V2ZW50LmgKPj4gaW5kZXggNjZmMjQ3NC4uYjYzMjQ5ZSAxMDA2NDQKPj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS92bV9ldmVudC5oCj4+ICsrKyBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vdm1fZXZlbnQuaAo+PiBAQCAtNTIsNCArNTIsMTAgQEAgdm9pZCB2bV9ldmVudF9l
bXVsYXRlX2NoZWNrKHN0cnVjdCB2Y3B1ICp2LCB2bV9ldmVudF9yZXNwb25zZV90ICpyc3ApCj4+
ICAgICAgLyogTm90IHN1cHBvcnRlZCBvbiBBUk0uICovCj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBp
bmxpbmUKPj4gK3ZvaWQgdm1fZXZlbnRfYmxvY2tfaW50ZXJydXB0cyhzdHJ1Y3QgdmNwdSAqdiwg
Ym9vbCB2YWx1ZSkKPj4gK3sKPj4gKyAgICAvKiBOb3Qgc3VwcG9ydGVkIG9uIEFSTS4gKi8KPiAK
PiBBU1NFUlRfVU5SRUFDSEFCTEU/CgpXaWxsIGRvIChhbHRob3VnaCBpZiB5b3UgbG9vayBhdCB0
aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb24gaW4gdGhhdCBoZWFkZXIKaXQnbGwgYnJlYWsgd2hhdCBh
cHBlYXJzIHRvIGJlIHRoZSBwcmlvciBjb252ZW50aW9uKS4KCgpUaGFua3MsClJhenZhbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
