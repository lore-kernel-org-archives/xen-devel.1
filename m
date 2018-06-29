From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/3] x86/alternatives: fully leverage
 automatic NOP filling
Date: Fri, 29 Jun 2018 07:43:54 -0600
Message-ID: <5B36379A02000078001CF300@prv1-mh.provo.novell.com>
References: <5B362CC002000078001CF22A@prv1-mh.provo.novell.com>
 <5B362D7C02000078001CF23D@prv1-mh.provo.novell.com>
 <e90d4ae2-fe57-09d2-00fe-8204cdb3939c@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gccx=jp=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fYtgq-0004RK-M8
 for xen-devel@lists.xenproject.org; Fri, 29 Jun 2018 13:43:56 +0000
In-Reply-To: <e90d4ae2-fe57-09d2-00fe-8204cdb3939c@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjA2LjE4IGF0IDE1OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDYvMTggMTQ6MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBBcyBvZiBjb21t
aXQgNDAwOGM3MWQ3YSAoIng4Ni9hbHQ6IFN1cHBvcnQgZm9yIGF1dG9tYXRpYyBwYWRkaW5nCj4+
IGNhbGN1bGF0aW9ucyIpIHRoZXJlJ3Mgbm8gcG9pbnQgaGF2aW5nIGV4cGxpY3QgQVNNX05PUG4g
aW5zdGFuY2VzIGluCj4+IGFsdGVybmF0aXZlcyBhbnltb3JlIC0gZHJvcCB0aGVtLiBBcyBhIHJl
c3VsdCBhbHNvIGRyb3AgdGhlIGFzbS9ub3BzLmgKPj4gaW5jbHVzaW9uIGZyb20gYWx0ZXJuYXRp
dmUuaCwgYWRkaW5nIGV4cGxpY2l0IGluY2x1c2lvbnMgaW4gdGhlIHR3bwo+PiByZW1haW5pbmcg
QyBmaWxlcyBuZWVkaW5nIHRoZW0uCj4+Cj4+IFdoaWxlIHRvdWNoaW5nIGl0IGFsc28gbW92ZSB0
aGUgQ1I0X1BWMzJfUkVTVE9SRSBkZWZpbml0aW9uIG91dCBvZiB0aGUKPj4gU01BUC1zcGVjaWZp
YyBjb25kaXRpb25hbCBpbnRvIGEgbW9yZSBnZW5lcmFsIG9uZS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEknbSBmaW5lIHdpdGggdGhp
cyBpbiBwcmluY2lwbGUsIGJ1dCBJJ2QgcHJlZmVyIGlmIGl0IGNhbiB3YWl0IHVudGlsCj4gYWZ0
ZXIgSSByZWJhc2UgbXkgdG9vbGNoYWluIG5vcHMgcGF0Y2guCgpXZWxsLCBJJ20gZmluZSBpZiB0
aGlzIGlzIGdvaW5nIHRvIGhhcHBlbiBpbiB0aGUgZm9yZXNlZWFibGUgZnV0dXJlLiBCdXQKdGhp
cyBzZXJpZXMgaGFzIGJlZW4gcGVuZGluZyBmb3Igb3ZlciAzIG1vbnRocyBub3csIGFuZCBJJ2Qg
cmVhbGx5Cmxpa2UgdG8gZ2V0IG15IHF1ZXVlIHNocnVuay4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
