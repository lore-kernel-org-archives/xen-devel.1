From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v4 3/3] x86/acpi: take rsdp address for boot
 params if available
Date: Tue, 9 Oct 2018 15:25:43 +0200
Message-ID: <fca0bc23-8755-4773-a22a-5e085392dac2__49407.1559784517$1539091476$gmane$org@suse.com>
References: <20181009105437.5471-1-jgross@suse.com>
 <20181009105437.5471-4-jgross@suse.com>
 <b747b936-e2c5-0d7c-aa9d-ce92a7057527@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=nckf=mv=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1g9s1E-0004y9-9e
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 13:25:48 +0000
In-Reply-To: <b747b936-e2c5-0d7c-aa9d-ce92a7057527@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMTAvMjAxOCAxNToyMiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDEwLzkvMTgg
Njo1NCBBTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gKwo+PiArdTY0IHg4Nl9kZWZhdWx0X2dl
dF9yb290X3BvaW50ZXIodm9pZCkKPj4gK3sKPj4gKwlyZXR1cm4gYm9vdF9wYXJhbXMuaGRyLmFj
cGlfcnNkcF9hZGRyOwo+PiArfQo+IAo+IAo+IFNob3VsZCB3ZSB0aGVuIHVwZGF0ZSBpbml0X3B2
aF9ib290cGFyYW1zKCkgd2l0aAo+IAo+IMKgwqDCoCBwdmhfYm9vdHBhcmFtcy5oZHIuYWNwaV9y
c2RwX2FkZHIgPSBwdmhfc3RhcnRfaW5mby5yc2RwX3BhZGRyOwo+IAo+IChhbmQgZHJvcCB4ODZf
aW5pdC5hY3BpLmdldF9yb290X3BvaW50ZXIgPSBwdmhfZ2V0X3Jvb3RfcG9pbnRlcjspID8KCkkg
d2FzIHBsYW5uaW5nIHRvIGRvIHRoaXMgYXMgYSBmb2xsb3cgb24gcGF0Y2guCgoKSnVlcmdlbgoK
PiAKPiAtYm9yaXMKPiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC94ODZfaW5pdC5j
IGIvYXJjaC94ODYva2VybmVsL3g4Nl9pbml0LmMKPj4gaW5kZXggMjc5MmI1NTczODE4Li41MGEy
YjQ5MmZkZDYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC94ODZfaW5pdC5jCj4+ICsr
KyBiL2FyY2gveDg2L2tlcm5lbC94ODZfaW5pdC5jCj4+IEBAIC0zMSw3ICszMSw2IEBAIHN0YXRp
YyBpbnQgX19pbml0IGlvbW11X2luaXRfbm9vcCh2b2lkKSB7IHJldHVybiAwOyB9Cj4+ICBzdGF0
aWMgdm9pZCBpb21tdV9zaHV0ZG93bl9ub29wKHZvaWQpIHsgfQo+PiAgc3RhdGljIGJvb2wgX19p
bml0IGJvb2xfeDg2X2luaXRfbm9vcCh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+PiAgc3RhdGlj
IHZvaWQgeDg2X29wX2ludF9ub29wKGludCBjcHUpIHsgfQo+PiAtc3RhdGljIHU2NCB1NjRfeDg2
X2luaXRfbm9vcCh2b2lkKSB7IHJldHVybiAwOyB9Cj4+ICAKPj4gIC8qCj4+ICAgKiBUaGUgcGxh
dGZvcm0gc2V0dXAgZnVuY3Rpb25zIGFyZSBwcmVzZXQgd2l0aCB0aGUgZGVmYXVsdCBmdW5jdGlv
bnMKPj4gQEAgLTk2LDcgKzk1LDcgQEAgc3RydWN0IHg4Nl9pbml0X29wcyB4ODZfaW5pdCBfX2lu
aXRkYXRhID0gewo+PiAgCX0sCj4+ICAKPj4gIAkuYWNwaSA9IHsKPj4gLQkJLmdldF9yb290X3Bv
aW50ZXIJPSB1NjRfeDg2X2luaXRfbm9vcCwKPj4gKwkJLmdldF9yb290X3BvaW50ZXIJPSB4ODZf
ZGVmYXVsdF9nZXRfcm9vdF9wb2ludGVyLAo+PiAgCQkucmVkdWNlZF9od19lYXJseV9pbml0CT0g
YWNwaV9nZW5lcmljX3JlZHVjZWRfaHdfaW5pdCwKPj4gIAl9LAo+PiAgfTsKPiAKPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
