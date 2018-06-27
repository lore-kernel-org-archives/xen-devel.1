From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V4] x86/altp2m: Fix crash with
 INVALID_ALTP2M EPTP index
Date: Wed, 27 Jun 2018 09:04:02 -0600
Message-ID: <5B33A76202000078001CE756@prv1-mh.provo.novell.com>
References: <1530105131-3804-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1530105131-3804-1-git-send-email-rcojocaru@bitdefender.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjA2LjE4IGF0IDE1OjEyLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4geGNfYWx0cDJtX3NldF92Y3B1X2VuYWJsZV9ub3RpZnkoKSBlbmRzIHVwIGNhbGxpbmcK
PiBhbHRwMm1fdmNwdV91cGRhdGVfdm1mdW5jX3ZlKCksIHdoaWNoIHNldHMgdGhlCj4gU0VDT05E
QVJZX0VYRUNfRU5BQkxFX1ZJUlRfRVhDRVBUSU9OUyBiaXQgb24KPiB2bXhfc2Vjb25kYXJ5X2V4
ZWNfY29udHJvbC4gQSBzdWJzZXF1ZW50IGNhbGwgdG8KPiB4Y19hbHRwMm1fc2V0X2RvbWFpbl9z
dGF0ZSguLi4sIGZhbHNlKSAoaS5lLiBkaXNhYmxpbmcgYWx0cDJtCj4gZm9yIHRoZSBkb21haW4p
IGVuZHMgdXAgY2FsbGluZyBhbHRwMm1fdmNwdV9kZXN0cm95KCksIHdoaWNoCj4gY2FsbHMgKGlu
IHRoaXMgb3JkZXIpIGFsdHAybV92Y3B1X3Jlc2V0KCkgKHdoaWNoIHNldHMgdGhlCj4gY3VycmVu
dCBFUFRQIGluZGV4IHRvIElOVkFMSURfQUxUUDJNKSwgYWx0cDJtX3ZjcHVfdXBkYXRlX3AybSgp
Cj4gKHdoaWNoIF9fdm13cml0ZSgpcyBFUFRQX0lOREVYIGFzIElOVkFMSURfQUxUUDJNIGlmCj4g
U0VDT05EQVJZX0VYRUNfRU5BQkxFX1ZJUlRfRVhDRVBUSU9OUyBpcyBzZXQpLCBhbmQKPiBhbHRw
Mm1fdmNwdV91cGRhdGVfdm1mdW5jX3ZlKCkgKHdoaWNoIGZpbmFsbHkgY2xlYXJzCj4gU0VDT05E
QVJZX0VYRUNfRU5BQkxFX1ZJUlRfRVhDRVBUSU9OUykuCgpJIGNvbnRpbnVlIHRvIGNvbnNpZGVy
IHRoaXMgcGFyYWdyYXBoIHVucmVhZGFibGUsIGJ1dCBwZXJoYXBzIGl0J3MKanVzdCBtZS4gVGhl
IHJlc3Qgb2YgdGhlIGRlc2NyaXB0aW9uIGxvb2tzIHJlYXNvbmFibGUgdG8gbWUgbm93LgoKUGxl
YXNlIGFsbG93IHNvbWUgbW9yZSB0aW1lIHRoYW4gYSBzaW5nbGUgZGF5IGJldHdlZW4gdmVyc2lv
bnMKdGhvdWdoLCBzbyBvdGhlcnMgYWxzbyBoYXZlIGEgY2hhbmNlIHRvIHJlc3BvbmQuCgpKYW4K
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
