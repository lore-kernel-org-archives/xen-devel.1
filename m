From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v8 for-4.12 10/17] argo: implement the
 notify op
Date: Wed, 6 Feb 2019 18:28:01 +0000
Message-ID: <5c9d887c-7329-35a9-d98d-a9f6fe3b7486@arm.com>
References: <1549443308-24448-1-git-send-email-christopher.w.clark@gmail.com>
 <1549443308-24448-11-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H/Pf=QN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1grRvg-0004yp-1j
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 18:28:12 +0000
In-Reply-To: <1549443308-24448-11-git-send-email-christopher.w.clark@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyLzYvMTkgODo1NSBBTSwgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gKy8qCj4g
KyAqIFhFTl9BUkdPX09QX25vdGlmeQo+ICsgKgo+ICsgKiBBc2tzIFhlbiBmb3IgaW5mb3JtYXRp
b24gYWJvdXQgb3RoZXIgcmluZ3MgaW4gdGhlIHN5c3RlbS4KPiArICoKPiArICogZW50LT5yaW5n
IGlzIHRoZSB4ZW5fYXJnb19hZGRyX3Qgb2YgdGhlIHJpbmcgeW91IHdhbnQgaW5mb3JtYXRpb24g
b24uCj4gKyAqIFVzZXMgdGhlIHNhbWUgcmluZyBtYXRjaGluZyBydWxlcyBhcyBYRU5fQVJHT19P
UF9zZW5kdi4KPiArICoKPiArICogZW50LT5zcGFjZV9yZXF1aXJlZCA6IGlmIHRoaXMgZmllbGQg
aXMgbm90IG51bGwgdGhlbiBYZW4gd2lsbCBjaGVjawo+ICsgKiB0aGF0IHRoZXJlIGlzIHNwYWNl
IGluIHRoZSBkZXN0aW5hdGlvbiByaW5nIGZvciB0aGlzIG1hbnkgYnl0ZXMgb2YgcGF5bG9hZC4K
PiArICogSWYgdGhlIHJpbmcgaXMgdG9vIHNtYWxsIGZvciB0aGUgcmVxdWVzdGVkIHNwYWNlX3Jl
cXVpcmVkLCBpdCB3aWxsIHNldCB0aGUKPiArICogWEVOX0FSR09fUklOR19FTVNHU0laRSBmbGFn
IG9uIHJldHVybi4KPiArICogSWYgc3VmZmljaWVudCBzcGFjZSBpcyBhdmFpbGFibGUsIGl0IHdp
bGwgc2V0IFhFTl9BUkdPX1JJTkdfU1VGRklDSUVOVAo+ICsgKiBhbmQgQ0FOQ0VMIGFueSBwZW5k
aW5nIG5vdGlmaWNhdGlvbiBmb3IgdGhhdCBlbnQtPnJpbmc7IG90aGVyd2lzZSBpdAo+ICsgKiB3
aWxsIHNjaGVkdWxlIGEgbm90aWZpY2F0aW9uIGV2ZW50IGFuZCB0aGUgZmxhZyB3aWxsIG5vdCBi
ZSBzZXQuCj4gKyAqCj4gKyAqIFRoZXNlIGZsYWdzIGFyZSBzZXQgYnkgWGVuIHdoZW4gbm90aWZ5
IHJlcGxpZXM6Cj4gKyAqIFhFTl9BUkdPX1JJTkdfRVhJU1RTICAgICByaW5nIGV4aXN0cwo+ICsg
KiBYRU5fQVJHT19SSU5HX1NIQVJFRCAgICAgcmluZyBpcyByZWdpc3RlcmVkIGZvciB3aWxkY2Fy
ZCBwYXJ0bmVyCj4gKyAqIFhFTl9BUkdPX1JJTkdfRU1QVFkgICAgICByaW5nIGlzIGVtcHR5Cj4g
KyAqIFhFTl9BUkdPX1JJTkdfU1VGRklDSUVOVCBzdWZmaWNpZW50IHNwYWNlIGZvciBzcGFjZV9y
ZXF1aXJlZCBpcyB0aGVyZQo+ICsgKiBYRU5fQVJHT19SSU5HX0VNU0dTSVpFICAgc3BhY2VfcmVx
dWlyZWQgaXMgdG9vIGxhcmdlIGZvciB0aGUgcmluZyBzaXplCj4gKyAqIFhFTl9BUkdPX1JJTkdf
RUJVU1kgICAgICB0b28gbWFueSBkb21haW5zIHdhaXRpbmcgZm9yIGF2YWlsYWJsZSBzcGFjZSBz
aWduYWxzCj4gKyAqCj4gKyAqIGFyZzE6IFhFTl9HVUVTVF9IQU5ETEUoeGVuX2FyZ29fcmluZ19k
YXRhX3QpIHJpbmdfZGF0YSAobWF5IGJlIE5VTEwpCj4gKyAqIGFyZzI6IE5VTEwKCk5JVDogV2hp
bGUgbG9va2luZyBhdCBhbGwgdGhlIGh5cGVyY2FsbCwgSSBub3RpY2VkIHlvdSBzYXkgTlVMTCBo
ZXJlLiBJbiAKbW9zdCBvZiB0aGUgY2FzZXMsIE5VTEwgd2lsbCBiZSAwIGJ1dCB0aGVyZSBhcmUg
cGxhY2Ugd2hlcmUgaXQgbWlnaHQgbm90IApiZS4gU28gd2hhdCBpcyB0aGUgZXhhY3QgdmFsdWUg
eW91IGV4cGVjdCBoZXJlPwoKPiArICogYXJnMzogMCAoWkVSTykKPiArICogYXJnNDogMCAoWkVS
TykKCk5JVDogSSBndWVzcyB0aG9zZSB0byB3aWxsIGJlIDAgaW4gYW4gdW5zaWduZWQgbG9uZyB2
YWx1ZT8KCj4gKyAqLwo+ICsjZGVmaW5lIFhFTl9BUkdPX09QX25vdGlmeSAgICAgICAgICAgICAg
NAo+ICsKPiAgICNlbmRpZgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94bGF0LmxzdCBiL3hl
bi9pbmNsdWRlL3hsYXQubHN0Cj4gaW5kZXggMGQ2NWY2YS4uZTMzMGY3MiAxMDA2NDQKPiAtLS0g
YS94ZW4vaW5jbHVkZS94bGF0LmxzdAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hsYXQubHN0Cj4gQEAg
LTM0LDYgKzM0LDggQEAKPiAgICEJYXJnb19pb3YJCQlhcmdvLmgKPiAgID8JYXJnb19yZWdpc3Rl
cl9yaW5nCQlhcmdvLmgKPiAgID8JYXJnb19yaW5nCQkJYXJnby5oCj4gKz8JYXJnb19yaW5nX2Rh
dGEJCQlhcmdvLmgKPiArPwlhcmdvX3JpbmdfZGF0YV9lbnQJCWFyZ28uaAo+ICAgPwlhcmdvX3Jp
bmdfbWVzc2FnZV9oZWFkZXIJYXJnby5oCj4gICA/CWFyZ29fc2VuZF9hZGRyCQkJYXJnby5oCj4g
ICA/CWFyZ29fdW5yZWdpc3Rlcl9yaW5nCQlhcmdvLmgKPiAKCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
