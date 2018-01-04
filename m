From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6.5 22/26] x86/boot: Calculate the most
 appropriate BTI mitigation to use
Date: Thu, 04 Jan 2018 03:17:56 -0700
Message-ID: <5A4E0D64020000780019ADA4@prv-mh.provo.novell.com>
References: <1515024955-13390-1-git-send-email-andrew.cooper3@citrix.com>
 <1515024955-13390-23-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1515024955-13390-23-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDAxOjE1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQEAgLTMxLDExICszMiwxMiBAQCBlbnVtIGluZF90aHVuayB7Cj4gICAgICBUSFVOS19M
RkVOQ0UsCj4gICAgICBUSFVOS19KTVAsCj4gIH0gb3B0X3RodW5rIF9faW5pdGRhdGEgPSBUSFVO
S19ERUZBVUxUOwo+ICtpbnQgb3B0X2licnMgX19pbml0ZGF0YSA9IC0xOwoKc3RhdGljCgo+IEBA
IC0xNDcsNiArMjMwLDE4IEBAIHZvaWQgX19pbml0IGluaXRfc3BlY3VsYXRpb25fbWl0aWdhdGlv
bnModm9pZCkKPiAgICAgIGVsc2UgaWYgKCB0aHVuayA9PSBUSFVOS19KTVAgKQo+ICAgICAgICAg
IHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRVUkVfSU5EX1RIVU5LX0pNUCk7Cj4gIAo+ICsg
ICAgLyoKPiArICAgICAqIEV2ZW4gaWYgd2UndmUgY2hvc2VuIG5vdCB0byB1c2UgSUJSUyBmb3Ig
WGVuIGl0c2VsZiwgd2Ugc3RpbGwgbmVlZCB0aGUKPiArICAgICAqIElCUlMgZW50cnkvZXhpdCBs
b2dpYyB0byB2aXJ0dWFsaXNlIElCUlMgc3VwcG9ydCBmb3IgZ3Vlc3RzLgo+ICsgICAgICovCj4g
KyAgICBpZiAoIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9JQlJTQikgKQo+ICsgICAgewo+ICsg
ICAgICAgIGlmICggaWJycyApCj4gKyAgICAgICAgICAgIHNldHVwX2ZvcmNlX2NwdV9jYXAoWDg2
X0ZFQVRVUkVfWEVOX0lCUlNfU0VUKTsKPiArICAgICAgICBlbHNlCj4gKyAgICAgICAgICAgIHNl
dHVwX2ZvcmNlX2NwdV9jYXAoWDg2X0ZFQVRVUkVfWEVOX0lCUlNfQ0xFQVIpOwo+ICsgICAgfQoK
WW91J3ZlIGFscmVhZHkgaW5kaWNhdGVkIHlvdSB3b3VsZCB0cnkgdG8gY2hhbmdlIHRoZSBjb21t
ZW50LApmb3IgaXQgdG8gbm90IGJlIG1pc2xlYWRpbmcgdGhlIHdheSBpdCdzIGN1cnJlbnRseSBw
bGFjZWQuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
