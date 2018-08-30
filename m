From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/7] x86/svm: Rename arch_svm_struct to
 svm_vcpu
Date: Thu, 30 Aug 2018 08:54:52 -0600
Message-ID: <5B88053C02000078001E3921@prv1-mh.provo.novell.com>
References: <1535477946-17892-1-git-send-email-andrew.cooper3@citrix.com>
 <1535477946-17892-7-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535477946-17892-7-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE5OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIHN1ZmZpeCBhbmQgcHJlZml4IGFyZSByZWR1bmRhbnQsIGFuZCB0aGUgbmFtZSBp
cyBjdXJpb3VzbHkgb2RkLiAgUmVuYW1lIGl0Cj4gdG8gc3ZtX3ZjcHUgdG8gYmUgY29uc2lzdGVu
dCB3aXRoIGFsbCB0aGUgb3RoZXIgc2ltaWxhciBzdHJ1Y3R1cmVzLgo+IAo+IE5vIGZ1bmN0aW9u
YWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNv
bT4KPiBDQzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPiBDQzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMu
b3N0cm92c2t5QG9yYWNsZS5jb20+Cj4gQ0M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZl
ZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4gQ0M6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0Bh
bWQuY29tPgo+IAo+IEFsbCBvZiB0aGUgbG9jYWwgcG9pbnRlcnMgYXJlIG5hbWVkIGFyY2hfc3Zt
LiAgSSdtIG9wZW4gdG8gcmVuYW1pbmcgdGhlbSB0bwo+IGp1c3Qgc3ZtIGlmIHBlb3BsZSBhcmUg
aGFwcHkgd2l0aCB0aGUgYWRkaXRpb25hbCBwYXRjaCBkZWx0YS4KClNhbWUgaGVyZSAtIHdpdGgg
b3Igd2l0aG91dApBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
