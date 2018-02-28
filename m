From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/6] x86: Handle the Xen MSRs via the new
 guest_{rd, wr}msr() infrastructure
Date: Wed, 28 Feb 2018 09:45:52 -0700
Message-ID: <5A96EAD002000078001ACF8C@prv-mh.provo.novell.com>
References: <1519666519-16311-1-git-send-email-andrew.cooper3@citrix.com>
 <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519666519-16311-4-git-send-email-andrew.cooper3@citrix.com>
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
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L21zci5jCj4gKysrIGIveGVuL2FyY2gveDg2L21zci5j
Cj4gQEAgLTE4Myw2ICsxODMsMTAgQEAgaW50IGd1ZXN0X3JkbXNyKGNvbnN0IHN0cnVjdCB2Y3B1
ICp2LCB1aW50MzJfdCBtc3IsIHVpbnQ2NF90ICp2YWwpCj4gICAgICAgICAgfQo+ICAKPiAgICAg
ICAgICAvKiBGYWxsdGhyb3VnaC4gKi8KPiArICAgIGNhc2UgMHg0MDAwMDIwMCAuLi4gMHg0MDAw
MDJmZjoKClRoZXNlIGFnYWluIHdhbnQgdG8gaGF2ZSAjZGVmaW5lLXMgYWRkZWQuCgo+IC0tLSBh
L3hlbi9hcmNoL3g4Ni90cmFwcy5jCj4gKysrIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKPiBAQCAt
Nzc2LDI5ICs3NzYsMjYgQEAgc3RhdGljIHZvaWQgZG9fdHJhcChzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyAqcmVncykKPiAgICAgICAgICAgIHRyYXBuciwgdHJhcHN0cih0cmFwbnIpLCByZWdzLT5lcnJv
cl9jb2RlKTsKPiAgfQo+ICAKPiAtLyogUmV0dXJucyAwIGlmIG5vdCBoYW5kbGVkLCBhbmQgbm9u
LTAgZm9yIHN1Y2Nlc3MuICovCj4gLWludCByZG1zcl9oeXBlcnZpc29yX3JlZ3ModWludDMyX3Qg
aWR4LCB1aW50NjRfdCAqdmFsKQo+ICtpbnQgZ3Vlc3RfcmRtc3JfeGVuKGNvbnN0IHN0cnVjdCB2
Y3B1ICp2LCB1aW50MzJfdCBpZHgsIHVpbnQ2NF90ICp2YWwpCj4gIHsKPiAtICAgIHN0cnVjdCBk
b21haW4gKmQgPSBjdXJyZW50LT5kb21haW47Cj4gKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluICpk
ID0gdi0+ZG9tYWluOwo+ICAgICAgLyogT3B0aW9uYWxseSBzaGlmdCBvdXQgb2YgdGhlIHdheSBv
ZiBWaXJpZGlhbiBhcmNoaXRlY3R1cmFsIE1TUnMuICovCj4gICAgICB1aW50MzJfdCBiYXNlID0g
aXNfdmlyaWRpYW5fZG9tYWluKGQpID8gMHg0MDAwMDIwMCA6IDB4NDAwMDAwMDA7Cj4gIAo+ICAg
ICAgc3dpdGNoICggaWR4IC0gYmFzZSApCj4gICAgICB7Cj4gICAgICBjYXNlIDA6IC8qIFdyaXRl
IGh5cGVyY2FsbCBwYWdlIE1TUi4gIFJlYWQgYXMgemVyby4gKi8KPiAtICAgIHsKPiAgICAgICAg
ICAqdmFsID0gMDsKPiAtICAgICAgICByZXR1cm4gMTsKPiAtICAgIH0KPiAtICAgIH0KPiArICAg
ICAgICByZXR1cm4gWDg2RU1VTF9PS0FZOwo+ICAKPiAtICAgIHJldHVybiAwOwo+ICsgICAgZGVm
YXVsdDoKPiArICAgICAgICByZXR1cm4gWDg2RU1VTF9FWENFUFRJT047Cj4gKyAgICB9Cj4gIH0K
CkNvdWxkIEkgdGFsayB5b3UgaW50byBhZGp1c3RpbmcgdGhlIGNvZGUgdG8gaGF2ZSBhICJyZXR1
cm4iIGF0IHRoZQplbmQgb2YgdGhlIGZ1bmN0aW9uLCBlLmcuIGJ5IGRyb3BwaW5nIHRoZSBkZWZh
dWx0IGNhc2U/IEFsc28gb24KdGhlIHdyaXRlIHBhdGggdGhlbj8KCldpdGggYXQgbGVhc3QgdGhl
ICNkZWZpbmUtcyBhZGRlZCwKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
