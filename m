From: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [PATCH V2] x86/vm_event: block interrupt injection
 for sync vm_events
Date: Tue, 11 Dec 2018 12:01:53 +0200
Message-ID: <a8b7b007-1270-b000-b076-757efa338788@bitdefender.com>
References: <1544457709-24302-1-git-send-email-rcojocaru@bitdefender.com>
 <20181210164938.lcfmhamgdxxc2zbn@mac>
 <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0MEs=OU=bitdefender.com=rcojocaru@srs-us1.protection.inumbo.net>)
 id 1gWerY-0000to-5j
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 10:02:00 +0000
In-Reply-To: <7408c2bf-c22e-dfb0-11e8-d7264f2df4e7@bitdefender.com>
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
Cc: kevin.tian@intel.com, tamas@tklengyel.com, wei.liu2@citrix.com, suravee.suthikulpanit@amd.com, andrew.cooper3@citrix.com, julien.grall@arm.com, sstabellini@kernel.org, jbeulich@suse.com, jun.nakajima@intel.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, brian.woods@amd.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTAvMTggNjo1OSBQTSwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDEyLzEwLzE4
IDY6NDkgUE0sIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIE1vbiwgRGVjIDEwLCAyMDE4
IGF0IDA2OjAxOjQ5UE0gKzAyMDAsIFJhenZhbiBDb2pvY2FydSB3cm90ZToKPj4+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL3ZtX2V2ZW50LmggYi94ZW4vaW5jbHVkZS9hc20tYXJt
L3ZtX2V2ZW50LmgKPj4+IGluZGV4IDY2ZjI0NzQuLmI2MzI0OWUgMTAwNjQ0Cj4+PiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20tYXJtL3ZtX2V2ZW50LmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vdm1fZXZlbnQuaAo+Pj4gQEAgLTUyLDQgKzUyLDEwIEBAIHZvaWQgdm1fZXZlbnRfZW11bGF0
ZV9jaGVjayhzdHJ1Y3QgdmNwdSAqdiwgdm1fZXZlbnRfcmVzcG9uc2VfdCAqcnNwKQo+Pj4gICAg
ICAvKiBOb3Qgc3VwcG9ydGVkIG9uIEFSTS4gKi8KPj4+ICB9Cj4+PiAgCj4+PiArc3RhdGljIGlu
bGluZQo+Pj4gK3ZvaWQgdm1fZXZlbnRfYmxvY2tfaW50ZXJydXB0cyhzdHJ1Y3QgdmNwdSAqdiwg
Ym9vbCB2YWx1ZSkKPj4+ICt7Cj4+PiArICAgIC8qIE5vdCBzdXBwb3J0ZWQgb24gQVJNLiAqLwo+
Pgo+PiBBU1NFUlRfVU5SRUFDSEFCTEU/Cj4gCj4gV2lsbCBkbyAoYWx0aG91Z2ggaWYgeW91IGxv
b2sgYXQgdGhlIHJlc3Qgb2YgdGhlIGZ1bmN0aW9uIGluIHRoYXQgaGVhZGVyCj4gaXQnbGwgYnJl
YWsgd2hhdCBhcHBlYXJzIHRvIGJlIHRoZSBwcmlvciBjb252ZW50aW9uKS4KClNvcnJ5LCBvbiBz
ZWNvbmQgdGhvdWdodCB3ZSBjYW4ndCBkbyB0aGF0LCBiZWNhdXNlIHRoYXQgZnVuY3Rpb24gaXMK
YmVpbmcgY2FsbGVkIGZyb20gdGhlIGNvbW1vbiBjb2RlIC0gd2hpY2ggaXMgd2h5IHRoZSBmdW5j
dGlvbiBiZWNhbWUKbmVjZXNzYXJ5LiBTcGVjaWZpY2FsbHksIHRoaXMgaXQgdW5jb25kaXRpb25h
bGx5IGNhbGxlZCBpbgptb25pdG9yX3RyYXBzKCksIHdoaWNoIGlzIHVzZWQgZm9yIGFsbCBldmVu
dHMgKEFSTSBhbmQgb3RoZXJ3aXNlKS4KClNvIGl0J3MgdmFsaWQgdG8gY2FsbCBtb25pdG9yX3Ry
YXBzKCkgZm9yIEFSTSB2bV9ldmVudHMgYW5kIGV4cGVjdCBpdCB0bwpydW4gd2l0aG91dCBpc3N1
ZSwgd2hpY2ggQVNTRVJUX1VOUkVBQ0hBQkxFKCkgd291bGQgb2YgY291cnNlIGJyZWFrLgoKClRo
YW5rcywKUmF6dmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
