From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/hvm: Intercept RDPMC when vPMU is
 disabled
Date: Mon, 25 Feb 2019 08:26:31 -0700
Message-ID: <5C7409270200007800219F57@prv1-mh.provo.novell.com>
References: <1550870016-360-1-git-send-email-andrew.cooper3@citrix.com>
 <dfa98a92-f16b-d29a-defe-14aa97c2ff3a@oracle.com>
 <03a53709-1d0e-efb9-8bf0-56c8553c220e@citrix.com>
 <1e05bea0-50e8-e0b6-6c57-11e6545aa5ab@oracle.com>
 <5C73E96C0200007800219DBF@prv1-mh.provo.novell.com>
 <f3f3dfb4-6c77-28e0-2ab2-d5b488111ec5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <f3f3dfb4-6c77-28e0-2ab2-d5b488111ec5@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDE1OjExLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDIvMjAxOSAxMzoxMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZvciBJbnRl
bCwgYWZhaWNzLCB3ZSBpbmRlZWQgcHJvZHVjZSBhIGJsYW5rIENQVUlEIGxlYWYgaW4KPj4gYWxs
IGNhc2VzLCBzbyB0aGUgYmVoYXZpb3IgbG9va3MgcmVhc29uYWJseSBjb25zaXN0ZW50LiBJIHdv
dWxkCj4+IHF1ZXN0aW9uIHRob3VnaCB3aGV0aGVyIGEgYmxhbmsgQ1BVSUQgbGVhZiAvIHRoZSBh
YnNlbmNlIG9mIGFueQo+PiBjb3VudGVycyB3b3VsZG4ndCBjYWxsIGZvciAjVUQgaW5zdGVhZCBv
ZiAjR1AoMCkuCj4gCj4gUkRQTUMgaGFzbid0ICNVRCdkIGluIGEgcXVhcnRlciBvZiBhIGNlbnR1
cnksIGJ1dCBkb2VzICNHUCBpbiB1c2Vyc3BhY2UKPiBvdXRzaWRlIG9mIGRldmVsb3BlciBwcm9m
aWxpbmcgc2NlbmFyaW9zLgoKSSBndWVzcyBJIGNvdWxkIGVxdWFsbHkgd2VsbCBzYXkgdGhhdCBS
RFBNQyBoYXNuJ3QgI0dQJ2QgZm9yIGFzIGxvbmcKZm9yIGluZGV4ZXMgemVybyBhbmQgb25lLgoK
Pj4gT3RoZXJ3aXNlLAo+PiBhbG9uZyB0aGUgbGluZXMgb2YgQU1ELCBhcmVuJ3QgdGhlIGZpcnN0
IHR3byBpbmRleGVzIHVuaWZvcm1seSB2YWxpZAo+PiBmb3IgSW50ZWw/Cj4gCj4gTm8gLSBpdHMg
bW9kZWwgc3BlY2lmaWMgYmVoYXZpb3VyLiAgVGhlIG9ubHkgZGlmZmVyZW5jZSBmb3IgbW9yZSBt
b2Rlcm4KPiBzeXN0ZW1zIGlzIHRoYXQgdGhleSBoYXZlIGFncmVlZCBvbiBhIGNvbW1vbiBiZWhh
dmlvdXIuCj4gCj4gQW5kIHRoYXQgaXMgc3BlY2lmaWNhbGx5IHdoeSBpbXBsZW1lbnRpbmcgMCdz
IGlzIGEgbm9uLXN0YXJ0ZXIgLSBpdCBpcwo+IG5vdCBhIHJlbW90ZWx5IHNlbnNpYmxlIHVzZSBv
ZiB0aW1lIHRvIGJ1aWxkIGVub3VnaCBpbmZyYXN0cnVjdHVyZSB0bwo+IHByb3ZpZGUgY29ycmVj
dCBtb2RlbC1zcGVjaWZpYyBiZWhhdmlvdXIganVzdCBmb3IgYSBjb3JuZXIgY2FzZSB3aGljaAo+
IG9wZXJhdGluZyBzeXN0ZW1zIGRvbid0IGVuY291bnRlciBpbiBwcmFjdGljZS4KCk5vLW9uZSBz
YWlkIHlvdSBuZWVkIHRvIGNvbnNpZGVyIGFsbCBjYXNlcy4gQnV0IHJldHVybmluZyB6ZXJvcyBm
b3IKdGhlIGZpcnN0IGZvdXIgKEFNRCkgb3IgdHdvIChJbnRlbCkgY291bnRlcnMgY2FuIGhhcmRs
eSBiZSB0aGF0IGJpZwpvZiBhIHByb2JsZW0uCgpBbnl3YXkgLSBJJ20gbm90IGdvaW5nIHRvIGZp
Z2h0IHRoaXMgbXVjaCBtb3JlLCBhcyB2UE1VIGNsZWFybHkKaXNuJ3QgbXkgcHJpbWFyeSBhcmVh
IG9mIGludGVyZXN0LiBCdXQgSSdsbCBsaXN0ZW4gdG8gZnVydGhlciBjb21tZW50cwpmcm9tIEJv
cmlzLCB3cnQgZ2l2aW5nIGFuIGV2ZW50dWFsIGFjay4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
