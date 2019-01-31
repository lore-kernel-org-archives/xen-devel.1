From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v5 09/15] argo: implement the sendv op;
 evtchn: expose send_guest_global_virq
Date: Thu, 31 Jan 2019 11:18:09 +0100
Message-ID: <20190131101809.kcbexwtqqkjvgzfq@mac>
References: <1548064795-18160-1-git-send-email-christopher.w.clark@gmail.com>
 <1548064795-18160-10-git-send-email-christopher.w.clark@gmail.com>
 <20190122120822.v5eyc64fa4moourd@mac>
 <CACMJ4GYpwHyqaPzXzTWQrHecW068ipfyDOrNz-MD9Y+jGB18eQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KPPl=QH=citrix.com=prvs=927f2c6f3=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gp9QS-0004WM-DB
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 10:18:28 +0000
Content-Disposition: inline
In-Reply-To: <CACMJ4GYpwHyqaPzXzTWQrHecW068ipfyDOrNz-MD9Y+jGB18eQ@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKYW4gMzAsIDIwMTkgYXQgMDg6MTA6MjhQTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xh
cmsgd3JvdGU6Cj4gT24gVHVlLCBKYW4gMjIsIDIwMTkgYXQgNDowOCBBTSBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBKYW4gMjEs
IDIwMTkgYXQgMDE6NTk6NDlBTSAtMDgwMCwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gPiA+
ICBkb19hcmdvX29wKHVuc2lnbmVkIGludCBjbWQsIFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0odm9p
ZCkgYXJnMSwKPiA+ID4gICAgICAgICAgICAgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBh
cmcyLCB1bnNpZ25lZCBsb25nIGFyZzMsCj4gPiA+IEBAIC0xMTQ1LDYgKzE3MzQsNTMgQEAgZG9f
YXJnb19vcCh1bnNpZ25lZCBpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFy
ZzEsCj4gPiA+ICAgICAgICAgIGJyZWFrOwo+ID4gPiAgICAgIH0KPiA+ID4KPiA+ID4gKyAgICBj
YXNlIFhFTl9BUkdPX09QX3NlbmR2Ogo+ID4gPiArICAgIHsKPiA+ID4gKyAgICAgICAgeGVuX2Fy
Z29fc2VuZF9hZGRyX3Qgc2VuZF9hZGRyOwo+ID4gPiArCj4gPiA+ICsgICAgICAgIFhFTl9HVUVT
VF9IQU5ETEVfUEFSQU0oeGVuX2FyZ29fc2VuZF9hZGRyX3QpIHNlbmRfYWRkcl9obmQgPQo+ID4g
PiArICAgICAgICAgICAgZ3Vlc3RfaGFuZGxlX2Nhc3QoYXJnMSwgeGVuX2FyZ29fc2VuZF9hZGRy
X3QpOwo+ID4gPiArICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9hcmdvX2lvdl90
KSBpb3ZzX2huZCA9Cj4gPiA+ICsgICAgICAgICAgICBndWVzdF9oYW5kbGVfY2FzdChhcmcyLCB4
ZW5fYXJnb19pb3ZfdCk7Cj4gPiA+ICsgICAgICAgIC8qIGFyZzMgaXMgbmlvdiAqLwo+ID4gPiAr
ICAgICAgICAvKiBhcmc0IGlzIG1lc3NhZ2VfdHlwZS4gTXVzdCBiZSBhIDMyLWJpdCB2YWx1ZS4g
Ki8KPiA+ID4gKwo+ID4gPiArICAgICAgICByYyA9IGNvcHlfZnJvbV9ndWVzdCgmc2VuZF9hZGRy
LCBzZW5kX2FkZHJfaG5kLCAxKSA/IC1FRkFVTFQgOiAwOwo+ID4gPiArICAgICAgICBpZiAoIHJj
ICkKPiA+ID4gKyAgICAgICAgICAgIGJyZWFrOwo+ID4gPiArCj4gPiA+ICsgICAgICAgIC8qCj4g
PiA+ICsgICAgICAgICAqIENoZWNrIHBhZGRpbmcgaXMgemVyb2VkLiBSZWplY3QgbmlvdiBhYm92
ZSBsaW1pdCBvciBtZXNzYWdlX3R5cGVzCj4gPiA+ICsgICAgICAgICAqIHRoYXQgYXJlIG91dHNp
ZGUgMzIgYml0IHJhbmdlLgo+ID4gPiArICAgICAgICAgKi8KPiA+ID4gKyAgICAgICAgaWYgKCB1
bmxpa2VseShzZW5kX2FkZHIuc3JjLnBhZCB8fCBzZW5kX2FkZHIuZHN0LnBhZCB8fAo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgIChhcmczID4gWEVOX0FSR09fTUFYSU9WKSB8fCAoYXJnNCAm
IH4weGZmZmZmZmZmVUwpKSApCj4gPgo+ID4gYXJnNCAmIChHQig0KSAtIDEpCj4gPgo+ID4gSXMg
Y2xlYXJlciBJTU8sIG9yOgo+ID4KPiA+IGFyZzQgPiBVSU5UMzJfTUFYCj4gCj4gSSd2ZSBsZWZ0
IHRoZSBjb2RlIHVuY2hhbmdlZCwgYXMgdGhlIG1hc2sgY29uc3RhbnQgaXMgdXNlZCBtdWx0aXBs
ZQo+IHBsYWNlcyBlbHNld2hlcmUgaW4gWGVuLiBVSU5UMzJfTUFYIGlzIG9ubHkgdXNlZCBhcyBh
IHRocmVzaG9sZCB2YWx1ZS4KClRoZSBmYWN0IHRoYXQgb3RoZXJzIHBhcnRzIG9mIHRoZSBjb2Rl
IGNvdWxkIGJlIGltcHJvdmVkIGlzIG5vdCBhbgpleGN1c2UgdG8gZm9sbG93IHN1aXQuIEknbSBo
YXZpbmcgYSBoYXJkIHRpbWUgYmVsaWV2aW5nIHRoYXQgeW91IGZpbmQKImFyZzQgJiB+MHhmZmZm
ZmZmZlVMIiBlYXNpZXIgdG8gcmVhZCB0aGFuICJhcmc0ICYgfihHQig0KSAtIDEpIiBvcgpldmVu
ICJhcmc0ID49IEdCKDQpIi4KCklNTyBpdCdzIG11Y2ggbW9yZSBsaWtlbHkgdG8gbWlzcyBhbiAn
ZicgaW4gdGhlIGZpcnN0IGNvbnN0cnVjdCwgYW5kCnRodXMgZ2V0IHRoZSB2YWx1ZSB3cm9uZyBh
bmQgaW50cm9kdWNlIGEgYnVnLgoKQW55d2F5LCB0aGlzIGlzIHlvdXIgY29kZSwgc28gSSdtIG5v
dCBnb2luZyB0byBpbnNpc3QuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
