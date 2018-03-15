From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/7] x86/domain: Remove unused parameters
 from {hvm, pv}_domain_initialise()
Date: Thu, 15 Mar 2018 20:09:13 +0000
Message-ID: <19b24ce8-67ae-7cbd-a867-1f11799941d9@citrix.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-5-git-send-email-andrew.cooper3@citrix.com>
 <20180313120506.wnkjzgei6m4o6bjk@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180313120506.wnkjzgei6m4o6bjk@MacBook-Pro-de-Roger.local>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTMvMDMvMTggMTI6MDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gTWF5YmUgdGhpcyBj
b3VsZCBiZToKPgo+IGlmICggaXNfaWRsZV9kb21haW4oZCkgKQo+IC4uLgo+IGVsc2UKPiB7Cj4g
ICAgIHJjID0gaXNfaHZtX2RvbWFpbihkKSA/IGh2bV9kb21haW5faW5pdGlhbGlzZShkKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOiBwdl9kb21haW5faW5pdGlhbGlzZShkKTsKPiAgICAg
aWYgKCByYyApCj4gICAgICAgICBnb3RvIGZhaWw7Cj4gfQo+Cj4gQnV0IHRoYXQncyBtYXliZSBv
dXQgb2YgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2guCgpJJ2QgYWN0dWFsbHkgbGlrZSB0byByZWNv
bnNpZGVyIG91ciB1c2Ugb2YgdGhpcyBkZXNpZ24gcGF0dGVybi4KCkFzIGZhciBhcyBJIGNhbiB0
ZWxsIGZyb20gc29tZSBYVEYgZXhhbXBsZXMsIGl0IGZvcmNlcyB0aGUgdXNlIG9mIGEKZnVuY3Rp
b24gcG9pbnRlciByYXRoZXIgdGhhbiBhbiAiaWYgY2FsbCBlbHNlIGNhbGwiIHdoaWNoIGluIHR1
cm4KZm9yY2libHkgb3V0LW9mLWxpbmVzIHN0YXRpYyBpbmxpbmUgc3R1YnMsIGFuZCBwcmV2ZW50
cyBMVE8gZnJvbSBtZXJnaW5nCmEgY3Jvc3MgVFUgY2FsbCBpbnRvIGl0cyBzb2xlIGNhbGxlci4K
CldoaWxlIHRoZSBjb2RlIGRvZXMgZG9lcyBsb29rIHNsaWdodGx5IG5lYXRlciBhcyBhIHJlc3Vs
dCwgSSBnZXQgdGhlCmZlZWxpbmcgdGhhdAoKaWYgKCBpc19odm1fZG9tYWluKGQpICkKwqDCoMKg
IHJjID0gaHZtX2RvbWFpbl9pbml0aWFsaXNlKGQpOwplbHNlCsKgwqDCoCByYyA9IHB2X2RvbWFp
bl9pbml0aWFsaXNlKGQpOwoKaXMgZmFyIGVhc2llciBmb3IgdGhlIGNvbXBpbGVyIHRvIG9wdGlt
aXNlIHdoZW4gdGhlIG9wcG9ydHVuaXRpZXMgYXJpc2UuCgp+QW5kcmV3CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
