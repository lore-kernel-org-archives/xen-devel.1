From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 3/3] x86/acpi: take rsdp address for boot
 params if available
Date: Tue, 9 Oct 2018 09:22:24 -0400
Message-ID: <b747b936-e2c5-0d7c-aa9d-ce92a7057527__31654.5146321461$1539091307$gmane$org@oracle.com>
References: <20181009105437.5471-1-jgross@suse.com>
 <20181009105437.5471-4-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k0fw=mv=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1g9ryY-0004le-5i
 for xen-devel@lists.xenproject.org; Tue, 09 Oct 2018 13:23:02 +0000
In-Reply-To: <20181009105437.5471-4-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org, linux-doc@vger.kernel.org
Cc: corbet@lwn.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com
List-Id: xen-devel@lists.xenproject.org

T24gMTAvOS8xOCA2OjU0IEFNLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+ICsKPiArdTY0IHg4Nl9k
ZWZhdWx0X2dldF9yb290X3BvaW50ZXIodm9pZCkKPiArewo+ICsJcmV0dXJuIGJvb3RfcGFyYW1z
Lmhkci5hY3BpX3JzZHBfYWRkcjsKPiArfQoKClNob3VsZCB3ZSB0aGVuIHVwZGF0ZSBpbml0X3B2
aF9ib290cGFyYW1zKCkgd2l0aAoKwqDCoMKgIHB2aF9ib290cGFyYW1zLmhkci5hY3BpX3JzZHBf
YWRkciA9IHB2aF9zdGFydF9pbmZvLnJzZHBfcGFkZHI7CgooYW5kIGRyb3AgeDg2X2luaXQuYWNw
aS5nZXRfcm9vdF9wb2ludGVyID0gcHZoX2dldF9yb290X3BvaW50ZXI7KSA/CgotYm9yaXMKCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2tlcm5lbC94ODZfaW5pdC5jIGIvYXJjaC94ODYva2VybmVs
L3g4Nl9pbml0LmMKPiBpbmRleCAyNzkyYjU1NzM4MTguLjUwYTJiNDkyZmRkNiAxMDA2NDQKPiAt
LS0gYS9hcmNoL3g4Ni9rZXJuZWwveDg2X2luaXQuYwo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC94
ODZfaW5pdC5jCj4gQEAgLTMxLDcgKzMxLDYgQEAgc3RhdGljIGludCBfX2luaXQgaW9tbXVfaW5p
dF9ub29wKHZvaWQpIHsgcmV0dXJuIDA7IH0KPiAgc3RhdGljIHZvaWQgaW9tbXVfc2h1dGRvd25f
bm9vcCh2b2lkKSB7IH0KPiAgc3RhdGljIGJvb2wgX19pbml0IGJvb2xfeDg2X2luaXRfbm9vcCh2
b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+ICBzdGF0aWMgdm9pZCB4ODZfb3BfaW50X25vb3AoaW50
IGNwdSkgeyB9Cj4gLXN0YXRpYyB1NjQgdTY0X3g4Nl9pbml0X25vb3Aodm9pZCkgeyByZXR1cm4g
MDsgfQo+ICAKPiAgLyoKPiAgICogVGhlIHBsYXRmb3JtIHNldHVwIGZ1bmN0aW9ucyBhcmUgcHJl
c2V0IHdpdGggdGhlIGRlZmF1bHQgZnVuY3Rpb25zCj4gQEAgLTk2LDcgKzk1LDcgQEAgc3RydWN0
IHg4Nl9pbml0X29wcyB4ODZfaW5pdCBfX2luaXRkYXRhID0gewo+ICAJfSwKPiAgCj4gIAkuYWNw
aSA9IHsKPiAtCQkuZ2V0X3Jvb3RfcG9pbnRlcgk9IHU2NF94ODZfaW5pdF9ub29wLAo+ICsJCS5n
ZXRfcm9vdF9wb2ludGVyCT0geDg2X2RlZmF1bHRfZ2V0X3Jvb3RfcG9pbnRlciwKPiAgCQkucmVk
dWNlZF9od19lYXJseV9pbml0CT0gYWNwaV9nZW5lcmljX3JlZHVjZWRfaHdfaW5pdCwKPiAgCX0s
Cj4gIH07CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
