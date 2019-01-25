From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/p2m: Drop erroneous
 #VE-enabled check in ept_set_entry()
Date: Fri, 25 Jan 2019 03:25:29 -0700
Message-ID: <5C4AE419020000780021115A@prv1-mh.provo.novell.com>
References: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548354483-5021-1-git-send-email-andrew.cooper3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE5IGF0IDE5OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ29kZSBjbGVhcmluZyB0aGUgIlN1cHByZXNzIFZFIiBiaXQgaW4gYW4gRVBUIGVudHJ5
IGlzbid0IG5lY2Vjc3NlcmlseSBydW5uaW5nCj4gaW4gY3VycmVudCBjb250ZXh0LiAgSW4gQUxU
UDJNX2V4dGVybmFsIG1vZGUsIGl0IGRlZmluaXRlbHkgaXMgbm90LCBhbmQgaW4gUFYKPiBjb250
ZXh0LCB2Y3B1X2FsdHAybShjdXJyZW50KSBhY3RzIHVwb24gdGhlIEhWTSB1bmlvbi4KPiAKPiBF
dmVuIGlmIHdlIGNvdWxkIHNlbnNpYmx5IHJlc29sdmUgdGhlIHRhcmdldCB2Q1BVLCBpdCBtYXkg
bGVnaXRpbWF0ZWx5IG5vdCBiZQo+IGZ1bGx5IHNldCB1cCBhdCB0aGlzIHBvaW50LCBzbyByZWpl
Y3RpbmcgdGhlIEVQVCBtb2RpZmljYXRpb24gd291bGQgYmUgYnVnZ3kuCj4gCj4gVGhlcmUgaXMg
YSBwYXRoIGluIGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQoKSB3aGljaCBleHBsaWNpdGx5IGVt
dWxhdGVzICNWRQo+IGluIHRoZSBjcHVfaGFzX3ZteF92aXJ0X2V4Y2VwdGlvbnMgY2FzZSwgc28g
dGhlIC1FT1BOT1RTVVBQIHBhcnQgb2YgdGhpcwoKSVRZTSAiaW4gdGhlICFjcHVfaGFzX3ZteF92
aXJ0X2V4Y2VwdGlvbnMgY2FzZSIgaGVyZT8KCj4gY29uZGl0aW9uIGlzIGFsc28gd3JvbmcuCgpX
aGF0IGFib3V0IHRoZSBzaW1pbGFyIGNvbmRpdGlvbnMgaW4gdGhlIGhhbmRsaW5nIG9mCkhWTU9Q
X2FsdHAybV92Y3B1X3tlbixkaXN9YWJsZV9ub3RpZnkgdGhlbj8KCj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS1lcHQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKPiBAQCAt
NzAyLDE2ICs3MDIsNiBAQCBlcHRfc2V0X2VudHJ5KHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIGdm
bl90IGdmbl8sIG1mbl90IG1mbiwKPiAgCj4gICAgICBBU1NFUlQoZXB0KTsKPiAgCj4gLSAgICBp
ZiAoICFzdmUgKQo+IC0gICAgewo+IC0gICAgICAgIGlmICggIWNwdV9oYXNfdm14X3ZpcnRfZXhj
ZXB0aW9ucyApCj4gLSAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiAtCj4gLSAgICAg
ICAgLyogI1ZFIHNob3VsZCBiZSBlbmFibGVkIGZvciB0aGlzIHZjcHUuICovCj4gLSAgICAgICAg
aWYgKCBnZm5fZXEodmNwdV9hbHRwMm0oY3VycmVudCkudmVpbmZvX2dmbiwgSU5WQUxJRF9HRk4p
ICkKPiAtICAgICAgICAgICAgcmV0dXJuIC1FTlhJTzsKPiAtICAgIH0KCkhvdyBhYm91dCByZXRh
aW5pbmcgdGhlIGxhdHRlciwgYnV0IHF1YWxpZnlpbmcgaXQgd2l0aApjdXJyZW50LT5kb21haW4g
PT0gZD8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
