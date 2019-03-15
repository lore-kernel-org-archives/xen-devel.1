From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/svm: Improve code generation from
 cpu_has_svm_feature()
Date: Fri, 15 Mar 2019 16:22:59 +0000
Message-ID: <229dcab0-f81c-beb0-f23e-e40f71bbc140@citrix.com>
References: <1552663389-665-1-git-send-email-andrew.cooper3@citrix.com>
 <835b8a7f-104d-2c9e-f0e5-719477dd04c6@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <835b8a7f-104d-2c9e-f0e5-719477dd04c6@oracle.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Brian Woods <brian.woods@amd.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxNTo1OSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDMvMTUvMTkg
MTE6MjMgQU0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+IFRha2luZyBzdm1fZmVhdHVyZV9mbGFn
cyBieSBwb2ludGVyIGFuZCB1c2luZyB0ZXN0X2JpdCgpIHJlc3VsdHMgaW4gZ2VuZXJhdGVkCj4+
IGNvZGUgd2hpY2ggbG9hZHMgc3ZtX2ZlYXR1cmVfZmxhZ3MgaW50byBhIDMyYml0IHJlZ2lzdGVy
LCB0aGVuIGRvZXMgYSBiaXR3aXNlCj4+IG9wZXJhdGlvbi4KPj4KPj4gVGhlIGxvZ2ljIGNhbiBi
ZSBleHByZXNzZWQgaW4gdGVybXMgb2YgYSBzdHJhaWdodCBiaXR3aXNlIG9wZXJhdGlvbiwgcmVz
dWx0aW5nCj4+IGluIHRoZSBmb2xsb3dpbmcgbWlub3IgaW1wcm92ZW1lbnQuCj4+Cj4+ICAgYWRk
L3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAwLzQgdXAvZG93bjogMC8tMTM2ICgtMTM2KQo+PiAg
IEZ1bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3
ICAgZGVsdGEKPj4gICBzdm1fbmVzdGVkX2ZlYXR1cmVzX29uX2VmZXJfdXBkYXRlICAgICAgICAg
ICAyODEgICAgIDI3MyAgICAgIC04Cj4+ICAgc3ZtX2NyZWF0ZV92bWNiICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAxNDA0ICAgIDEzODggICAgIC0xNgo+PiAgIHN2bV92bWV4aXRfaGFuZGxl
ciAgICAgICAgICAgICAgICAgICAgICAgICAgNjI3MSAgICA2MjM5ICAgICAtMzIKPj4gICBzdGFy
dF9zdm0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA4MTggICAgIDczOCAgICAg
LTgwCj4+ICAgVG90YWw6IEJlZm9yZT0zMzQ3NTY5LCBBZnRlcj0zMzQ3NDMzLCBjaGcgLTAuMDAl
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9y
YWNlbC5jb20+Cj4KCkkgc3VwcG9zZSB5b3UnZCBsaWtlIG1lIHRvIGZpeCB1cCBPcmFjbGUgb24g
Y29tbWl0PyA7KQoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
