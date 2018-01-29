From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: Drop hvm_set_mode() and associated
 vmx hooks
Date: Mon, 29 Jan 2018 09:17:35 -0700
Message-ID: <5A6F572F02000078001A3773@prv-mh.provo.novell.com>
References: <1517242232-12410-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1517242232-12410-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjAxLjE4IGF0IDE3OjEwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBtb3JlIHZlc3RpZ2lhbCByZW1lbnRhbnRzIG9mIFBWSHYxLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4g
LS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiBDQzogSnVuIE5ha2Fq
aW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgo+IENDOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFu
QGludGVsLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2h2bS9odm0uYyAgICAgICAgfCAyMyAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyAgICB8
IDE2IC0tLS0tLS0tLS0tLS0tLS0KPiAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggfCAg
MiAtLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQxIGRlbGV0aW9ucygtKQoKVmVyeSBuaWNlLgoKUmV2
aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
