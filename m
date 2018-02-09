From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v2 3/4] hvm/svm: Enable MSR events
Date: Fri, 9 Feb 2018 11:03:24 +0000
Message-ID: <1518174204.4963.2.camel@bitdefender.com>
References: <1518103552-4836-1-git-send-email-aisaila@bitdefender.com>
 <1518103552-4836-4-git-send-email-aisaila@bitdefender.com>
 <CAFLBxZYrbn4E_8YW8JZT9XfgD28B=wf9xAG-O0zHPTCUHp6jog@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZYrbn4E_8YW8JZT9XfgD28B=wf9xAG-O0zHPTCUHp6jog@mail.gmail.com>
Content-Language: en-US
Content-ID: <4D483ED7C0F8984C9FF639C831A6D494@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "dunlapg@umich.edu" <dunlapg@umich.edu>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gVmksIDIwMTgtMDItMDkgYXQgMTA6MzcgKzAwMDAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+
IE9uIFRodSwgRmViIDgsIDIwMTggYXQgMzoyNSBQTSwgQWxleGFuZHJ1IElzYWlsYQ0KPiA8YWlz
YWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVGhpcyBjb21taXQgZW5hYmxl
cyBNU1IgZXZlbnRzIGZvciBzdm0uDQo+IEknZCBwcm9iYWJseSBzYXkgJ2ltcGxlbWVudCcgaGVy
ZSBhcyB3ZWxsLg0KPg0KPiBBbHNvLCB5b3UgZG9uJ3QgbmVlZCB0byByZXBlYXQgdGhlIHRpdGxl
IGluIHRoZSBjb21taXQgbWVzc2FnZS4gIElmDQo+IHRoZXJlJ3Mgbm90aGluZyBtb3JlIHRvIHB1
dCBpbnRvIHRoZSBjb21taXQgbWVzc2FnZSB0aGFuIGlzIHNhaWQgaW4NCj4gdGhlIHRpdGxlLCB5
b3UgY2FuIGp1c3QgaW5jbHVkZSB5b3VyIFNvQi4gIChDb250cmFyaXdpc2UsIGlmIHlvdSBmZWVs
DQo+IGxpa2UgeW91IG5lZWQgc29tZXRoaW5nIGluIHRoZSBjb21taXQgbWVzc2FnZSwgaXQgc2hv
dWxkIGJlIG1vcmUgdGhhbg0KPiBqdXN0IHJlcGVhdGluZyB0aGUgdGl0bGUgb2YgdGhlIHBhdGNo
LikNCj4NCj4gIC1HZW9yZ2UNCj4NCiBUaGFua3MgZm9yIHRoZSBoZWFkcyB1cC4gSSB3aWxsIHJl
bWVtYmVyIHRoaXMgZm9yIGZ1dHVyZQ0KY29udHJpYnV0aW9ucy4NCg0KQWxleA0KDQpfX19fX19f
X19fX19fX19fX19fX19fX18NClRoaXMgZW1haWwgd2FzIHNjYW5uZWQgYnkgQml0ZGVmZW5kZXIN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
