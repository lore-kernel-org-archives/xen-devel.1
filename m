From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V2 2/2] x86/altp2m: Fixed domain crash with
 INVALID_ALTP2M EPTP index
Date: Fri, 22 Jun 2018 09:28:30 -0600
Message-ID: <5B2D159E02000078001CD06C@prv1-mh.provo.novell.com>
References: <1528879939-11570-1-git-send-email-rcojocaru@bitdefender.com>
 <1528879939-11570-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1528879939-11570-2-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, tamas@tklengyel.com, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjA2LjE4IGF0IDEwOjUyLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+IEBAIC0zNTkyLDcgKzM1OTIsNyBAQCB2b2lkIHZteF92bWV4aXRf
aGFuZGxlcihzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPiAgICAgICAgICAgICAgfQo+ICAg
ICAgICAgIH0KPiAgCj4gLSAgICAgICAgaWYgKCBpZHggIT0gdmNwdV9hbHRwMm0odikucDJtaWR4
ICkKPiArICAgICAgICBpZiAoIGlkeCAhPSBJTlZBTElEX0FMVFAyTSAmJiBpZHggIT0gdmNwdV9h
bHRwMm0odikucDJtaWR4ICkKPiAgICAgICAgICB7Cj4gICAgICAgICAgICAgIEJVR19PTihpZHgg
Pj0gTUFYX0FMVFAyTSk7CgpJbiB0aGUgY29kZSBpbW1lZGlhdGVseSBhaGVhZCBvZiB0aGlzIHRo
ZXJlIGlzIGFuIElOVkFMSURfQUxUUDJNIGNoZWNrCmFscmVhZHkgKGluIHRoZSBlbHNlIGJyYW5j
aCkuIElmIHRoZSBfX3ZtcmVhZCgpIGNhbiBsZWdpdGltYXRlbHkgcHJvZHVjZQp0aGlzIHZhbHVl
LCB3aHkgd291bGQgdGhlIGRvbWFpbiBiZSBjcmFzaGVkIHdoZW4gZ2V0dGluZyBiYWNrCklOVkFM
SURfQUxUUDJNIGluIHRoZSBvdGhlciBjYXNlPyBJIHRoaW5rIHRoZSBjb3JyZWN0bmVzcyBvZiB5
b3VyIGNoYW5nZQpjYW4gb25seSBiZSBqdWRnZWQgb25jZSBib3RoIGNvZGUgcGF0aHMgYmVoYXZl
IGNvbnNpc3RlbnRseS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
