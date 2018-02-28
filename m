From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/6] x86/hvm: Handle viridian MSRs via the
 new guest_{rd, wr}msr() infrastructure
Date: Wed, 28 Feb 2018 09:40:54 -0700
Message-ID: <5A96E9A602000078001ACF6E@prv-mh.provo.novell.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjAyLjE4IGF0IDE4OjM1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi5jCj4gKysrIGIveGVuL2FyY2gv
eDg2L2h2bS92aXJpZGlhbi5jCj4gQEAgLTU1NCwxMyArNTU0LDExIEBAIHN0YXRpYyB2b2lkIHVw
ZGF0ZV9yZWZlcmVuY2VfdHNjKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBpbml0aWFsaXplKQo+
ICAgICAgcHV0X3BhZ2VfYW5kX3R5cGUocGFnZSk7Cj4gIH0KPiAgCj4gLWludCB3cm1zcl92aXJp
ZGlhbl9yZWdzKHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKQo+ICtpbnQgZ3Vlc3Rfd3Jtc3Jf
dmlyaWRpYW4oc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IGlkeCwgdWludDY0X3QgdmFsKQoKdW5z
aWduZWQgaW50IHdvdWxkIGRvIGluc3RlYWQgb2YgdWludDMyX3QgKHNhbWUgb24gdGhlIHJlYWQg
c2lkZSkuCgo+IEBAIC0xNzMsMTEgKzE3NSwyNiBAQCBpbnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3Ry
dWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgIHVpbnQ2NF90ICp2YWwpCj4gICAgICAgICAgICAg
ICAgIF9NU1JfTUlTQ19GRUFUVVJFU19DUFVJRF9GQVVMVElORzsKPiAgICAgICAgICBicmVhazsK
PiAgCj4gKyAgICBjYXNlIDB4NDAwMDAwMDAgLi4uIDB4NDAwMDAxZmY6CgpBcyB3YXMgYWxyZWFk
eSBzdWdnZXN0ZWQsIHRoZXNlIHdhbnQgdG8gZ2FpbiAjZGVmaW5lLXMuCgpSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIGF0IGxlYXN0IHRoZSBsYXR0ZXIg
dGFrZW4gY2FyZSBvZi4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
