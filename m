From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v2] x86/mm: Add mem access rights to NPT
Date: Fri, 29 Jun 2018 00:17:37 -0600
Message-ID: <5B35CF0102000078001350EC@prv1-mh.provo.novell.com>
References: <1529335072-2141-1-git-send-email-aisaila@bitdefender.com>
 <5B2D1B0002000078001CD08E@prv1-mh.provo.novell.com>
 <1530195070.8880.9.camel@bitdefender.com>
 <5B34F36C02000078001CEEA0@prv1-mh.provo.novell.com>
 <1530197609.8880.14.camel@bitdefender.com>
 <9604342a-9478-9c37-b1a4-613795871524@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <9604342a-9478-9c37-b1a4-613795871524@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com, rcojocaru@bitdefender.com
Cc: George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, tamas@tklengyel.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gMDYvMjgvMTgg
NDo1OCBQTSA+Pj4KPk9uIDA2LzI4LzIwMTggMDU6NTMgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNB
SUxBIHdyb3RlOgo+PiBUaGUgbnVtYmVyIHdhcyB3aXRoIHRoaXMgcGF0Y2ggc28gbm8gY29ycmVj
dGlvbi4gVGhpcyB3YXMgZG9uZSB3aXRoCj4+IHhlbi1hY2Nlc3Mgd3JpdGUgYW5kIEkgZG9uJ3Qg
dGhpbmsgaXQgd2lsbCBtYWtlIGEgZGlmZmVyZW5jZSBpZiB5b3UKPj4gY2hhbmdlIHRoZSBhY2Nl
c3MgdG8gYWxsIHRoZSBtZW0gcGFnZXMuCj4KPlJpZ2h0LCBzbyB0aGUgYXZlcmFnZSBpcyB0aGUg
YXZlcmFnZSBiZXR3ZWVuIHJ1bnMgb2YgInhlbi1hY2Nlc3MgPERPTUlEPgo+d3JpdGUiLCB3aGlj
aCBzZXRzIGFsbCBvZiB0aGUgZG9tYWluJ3MgcGFnZXMgdG8gci14LiBBIHR5cGljYWwKPmludHJv
c3BlY3Rpb24gYXBwbGljYXRpb24gd2lsbCBub3Qgc2V0IGFsbCBvZiB0aGUgZG9tYWluJ3MgcGFn
ZXMgdXAgdGhpcwo+d2F5IC0gc28gdGhlIG51bWJlciBpcyBhbiBhdmVyYWdlIG9mIG1heGltdW1z
Lgo+Cj5BRkFJSyBBUk0gdXNlcyB0aGlzIG1vZGVsIC0gYXJlIHRoZXJlIGZld2VyIHBhZ2VzIGlu
IGEgdHlwaWNhbCBBUk0KPmd1ZXN0LCBvciBhcmUgd2UgbWlzc2luZyBzb21ldGhpbmcgYWJvdXQg
dGhlIHdheSB0aGV5IGFyZSB1c2luZyByYWRpeAo+dHJlZXMgZm9yIHRoaXMgcHVycG9zZT8gT3Ig
cGVyaGFwcyB0aGUgQVJNIGNvZGUgc2hvdWxkIGJlIGNoYW5nZWQgYXMgd2VsbD8KCldoZXRoZXIg
dGhlIG92ZXIgaGVhZCB3aXRoIGludHJvc3BlY3Rpb24gaW4gdXNlIGlzIHRvbGVyYWJsZSBpcyBz
b21ldGhpbmcKeW91IGd1eXMgbmVlZCB0byBrbm93LiBBcyBzYWlkIGluIHRoZSBvdGhlciByZXBs
eSAtIG15IHdvcnJpZXMgYXJlIGFib3V0CmV4dHJhIG92ZXJoZWFkIHdpdGhvdXQgaW50cm9zcGVj
dGlvbiBpbiB1c2UuIElmIHRoZSByYWRpeCB0cmVlIHdhcyBuZXZlciB1c2VkCmluIHN1Y2ggYSBj
YXNlLCBpdCB3b3VsZCBiZSBtb3JlIGNsZWFybHkgdmlzaWJsZSB0aGF0IHRoZXJlIGlzIG5vIG92
ZXJoZWFkIGlmCnRoZSBjcmVhdGlvbiBvZiB0aGUgcmFkaXggdHJlZSBhdCBkb21haW4gY3JlYXRp
b24gdGltZSB3YXMgYXZvaWRlZC4KCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
