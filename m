From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Tue, 11 Dec 2018 11:14:50 +0100
Message-ID: <20181211101450.gmnjax3gnobby3cq@mac>
References: <1544457709-24302-1-git-send-email-rcojocaru@bitdefender.com>
 <20181210164938.lcfmhamgdxxc2zbn@mac>
 <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
 <a8b7b007-1270-b000-b076-757efa338788@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1i+=OU=citrix.com=prvs=876dbbe9b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gWf48-00021z-Fy
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 10:15:00 +0000
Content-Disposition: inline
In-Reply-To: <a8b7b007-1270-b000-b076-757efa338788@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, suravee.suthikulpanit@amd.com, andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, jun.nakajima@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMTI6MDE6NTNQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1
IHdyb3RlOgo+IE9uIDEyLzEwLzE4IDY6NTkgUE0sIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPiA+
IE9uIDEyLzEwLzE4IDY6NDkgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPj4gT24gTW9u
LCBEZWMgMTAsIDIwMTggYXQgMDY6MDE6NDlQTSArMDIwMCwgUmF6dmFuIENvam9jYXJ1IHdyb3Rl
Ogo+ID4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS92bV9ldmVudC5oIGIveGVu
L2luY2x1ZGUvYXNtLWFybS92bV9ldmVudC5oCj4gPj4+IGluZGV4IDY2ZjI0NzQuLmI2MzI0OWUg
MTAwNjQ0Cj4gPj4+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vdm1fZXZlbnQuaAo+ID4+PiAr
KysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL3ZtX2V2ZW50LmgKPiA+Pj4gQEAgLTUyLDQgKzUyLDEw
IEBAIHZvaWQgdm1fZXZlbnRfZW11bGF0ZV9jaGVjayhzdHJ1Y3QgdmNwdSAqdiwgdm1fZXZlbnRf
cmVzcG9uc2VfdCAqcnNwKQo+ID4+PiAgICAgIC8qIE5vdCBzdXBwb3J0ZWQgb24gQVJNLiAqLwo+
ID4+PiAgfQo+ID4+PiAgCj4gPj4+ICtzdGF0aWMgaW5saW5lCj4gPj4+ICt2b2lkIHZtX2V2ZW50
X2Jsb2NrX2ludGVycnVwdHMoc3RydWN0IHZjcHUgKnYsIGJvb2wgdmFsdWUpCj4gPj4+ICt7Cj4g
Pj4+ICsgICAgLyogTm90IHN1cHBvcnRlZCBvbiBBUk0uICovCj4gPj4KPiA+PiBBU1NFUlRfVU5S
RUFDSEFCTEU/Cj4gPiAKPiA+IFdpbGwgZG8gKGFsdGhvdWdoIGlmIHlvdSBsb29rIGF0IHRoZSBy
ZXN0IG9mIHRoZSBmdW5jdGlvbiBpbiB0aGF0IGhlYWRlcgo+ID4gaXQnbGwgYnJlYWsgd2hhdCBh
cHBlYXJzIHRvIGJlIHRoZSBwcmlvciBjb252ZW50aW9uKS4KPiAKPiBTb3JyeSwgb24gc2Vjb25k
IHRob3VnaHQgd2UgY2FuJ3QgZG8gdGhhdCwgYmVjYXVzZSB0aGF0IGZ1bmN0aW9uIGlzCj4gYmVp
bmcgY2FsbGVkIGZyb20gdGhlIGNvbW1vbiBjb2RlIC0gd2hpY2ggaXMgd2h5IHRoZSBmdW5jdGlv
biBiZWNhbWUKPiBuZWNlc3NhcnkuIFNwZWNpZmljYWxseSwgdGhpcyBpdCB1bmNvbmRpdGlvbmFs
bHkgY2FsbGVkIGluCj4gbW9uaXRvcl90cmFwcygpLCB3aGljaCBpcyB1c2VkIGZvciBhbGwgZXZl
bnRzIChBUk0gYW5kIG90aGVyd2lzZSkuCj4gCj4gU28gaXQncyB2YWxpZCB0byBjYWxsIG1vbml0
b3JfdHJhcHMoKSBmb3IgQVJNIHZtX2V2ZW50cyBhbmQgZXhwZWN0IGl0IHRvCj4gcnVuIHdpdGhv
dXQgaXNzdWUsIHdoaWNoIEFTU0VSVF9VTlJFQUNIQUJMRSgpIHdvdWxkIG9mIGNvdXJzZSBicmVh
ay4KCkJ1dCB0aGVuIHRoZSBmdW5jdGlvbmFsaXR5IHRoYXQgbWFrZXMgdXNlIG9mIHZtX2V2ZW50
X2Jsb2NrX2ludGVycnVwdHMKY2Fubm90IHdvcmsgcmVsaWFibHkgb24gQVJNIGFuZCBzaG91bGQg
bm90IGJlIHVzZWQ/CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
