From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 4/7] x86/domain: Remove unused parameters
 from {hvm, pv}_domain_initialise()
Date: Fri, 16 Mar 2018 04:58:12 -0600
Message-ID: <5AABB15402000078001B2ABB@prv-mh.provo.novell.com>
References: <1520601522-2886-1-git-send-email-andrew.cooper3@citrix.com>
 <1520601522-2886-5-git-send-email-andrew.cooper3@citrix.com>
 <20180313120506.wnkjzgei6m4o6bjk@MacBook-Pro-de-Roger.local>
 <19b24ce8-67ae-7cbd-a867-1f11799941d9@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <19b24ce8-67ae-7cbd-a867-1f11799941d9@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, WeiLiu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDIxOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMTggMTI6MDUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE1heWJl
IHRoaXMgY291bGQgYmU6Cj4+Cj4+IGlmICggaXNfaWRsZV9kb21haW4oZCkgKQo+PiAuLi4KPj4g
ZWxzZQo+PiB7Cj4+ICAgICByYyA9IGlzX2h2bV9kb21haW4oZCkgPyBodm1fZG9tYWluX2luaXRp
YWxpc2UoZCkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICA6IHB2X2RvbWFpbl9pbml0aWFs
aXNlKGQpOwo+PiAgICAgaWYgKCByYyApCj4+ICAgICAgICAgZ290byBmYWlsOwo+PiB9Cj4+Cj4+
IEJ1dCB0aGF0J3MgbWF5YmUgb3V0IG9mIHRoZSBzY29wZSBvZiB0aGlzIHBhdGNoLgo+IAo+IEkn
ZCBhY3R1YWxseSBsaWtlIHRvIHJlY29uc2lkZXIgb3VyIHVzZSBvZiB0aGlzIGRlc2lnbiBwYXR0
ZXJuLgo+IAo+IEFzIGZhciBhcyBJIGNhbiB0ZWxsIGZyb20gc29tZSBYVEYgZXhhbXBsZXMsIGl0
IGZvcmNlcyB0aGUgdXNlIG9mIGEKPiBmdW5jdGlvbiBwb2ludGVyIHJhdGhlciB0aGFuIGFuICJp
ZiBjYWxsIGVsc2UgY2FsbCIgd2hpY2ggaW4gdHVybgo+IGZvcmNpYmx5IG91dC1vZi1saW5lcyBz
dGF0aWMgaW5saW5lIHN0dWJzLCBhbmQgcHJldmVudHMgTFRPIGZyb20gbWVyZ2luZwo+IGEgY3Jv
c3MgVFUgY2FsbCBpbnRvIGl0cyBzb2xlIGNhbGxlci4KCldoZXJlJ3MgdGhlIGZ1bmN0aW9uIHBv
aW50ZXIgY29taW5nIGZyb20/IEkgY291bGQgc2VlIHRoYXQgaGFwcGVuaW5nCndpdGgKCiAgICAg
cmMgPSAoaXNfaHZtX2RvbWFpbihkKSA/IGh2bV9kb21haW5faW5pdGlhbGlzZQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgOiBwdl9kb21haW5faW5pdGlhbGlzZSkoZCk7Cgp3aGljaCBJIHRo
aW5rIFJvZ2VyIGhhcyBiZWVuIHVzaW5nIHZhcmlhbnRzIG9mIGluIGEgZmV3IG90aGVyCnBhdGNo
ZXMgb2YgaGlzIChhbmQgd2hpY2ggSSd2ZSBiZWVuIGRlYmF0aW5nIHdpdGggbXlzZWxmIHdoZXRo
ZXIKdG8gY29tbWVudCBvbiB3aGlsZSByZXZpZXdpbmcgdGhvc2UgcGF0Y2hlcykuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
