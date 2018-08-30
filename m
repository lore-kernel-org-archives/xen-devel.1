From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/7] x86/vtx: Rename arch_vmx_struct to
 vmx_vcpu
Date: Thu, 30 Aug 2018 08:54:01 -0600
Message-ID: <5B88050902000078001E391E@prv1-mh.provo.novell.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE5OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIHN1ZmZpeCBhbmQgcHJlZml4IGFyZSByZWR1bmRhbnQsIGFuZCB0aGUgbmFtZSBp
cyBjdXJpb3VzbHkgb2RkLiAgUmVuYW1lIGl0Cj4gdG8gdm14X3ZjcHUgdG8gYmUgY29uc2lzdGVu
dCB3aXRoIGFsbCB0aGUgb3RoZXIgc2ltaWxhciBzdHJ1Y3R1cmVzLgo+IAo+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEp1biBOYWthamltYSA8anVuLm5ha2Fq
aW1hQGludGVsLmNvbT4KPiBDQzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+Cj4g
Cj4gU29tZSBvZiB0aGUgbG9jYWwgcG9pbnRlcnMgYXJlIG5hbWVkIGFyY2hfdm14LiAgSSdtIG9w
ZW4gdG8gcmVuYW1pbmcgdGhlbSB0bwo+IGp1c3Qgdm14IChsaWtlIGFsbCB0aGUgb3RoZXIgbG9j
YWwgcG9pbnRlcnMpIGlmIHBlb3BsZSBhcmUgaGFwcHkgd2l0aCB0aGUKPiBhZGRpdGlvbmFsIHBh
dGNoIGRlbHRhLgoKSSdkIGJlIGZpbmUgd2l0aCB0aGF0LiBXaXRoIG9yIHdpdGhvdXQKQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
