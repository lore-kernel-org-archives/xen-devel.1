From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] x86/svm: Fixes to OS Visible Workaround
 handling
Date: Tue, 21 Aug 2018 11:09:22 -0400
Message-ID: <a0f81b84-d016-8ca8-ec23-bea7aeb045b7@oracle.com>
References: <1534352869-27401-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534352869-27401-1-git-send-email-andrew.cooper3@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
Cc: Brian Woods <brian.woods@amd.com>, Jan Beulich <JBeulich@suse.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDgvMTUvMjAxOCAwMTowNyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPU1ZXIGRhdGEg
aXMgdGVjaG5pY2FsbHkgcGVyLWNwdSwgYnV0IGl0IGlzIHRoZSBmaXJtd2FyZXMgcmVwb25zaWJp
bGl0eSB0bwo+IG1ha2UgaXQgZXF1aXZlbGVudCBvbiBlYWNoIGNwdS4gIEEgZ3Vlc3RzIE9TVlcg
ZGF0YSBpcyBzb3VyY2VzIGZyb20gZ2xvYmFsCj4gZGF0YSBpbiBYZW4sIGNsZWFybHkgbWFraW5n
IGl0IHBlci1kb21haW4gZGF0YSByYXRoZXIgdGhhbiBwZXItdmNwdSBkYXRhLgo+Cj4gTW92ZSB0
aGUgZGF0YSBmcm9tIHN0cnVjdCBhcmNoX3N2bV9zdHJ1Y3QgdG8gc3RydWN0IHN2bV9kb21haW4s
IGFuZCBjYWxsCj4gc3ZtX2d1ZXN0X29zdndfaW5pdCgpIGZyb20gc3ZtX2RvbWFpbl9pbml0aWFs
aXNlKCkgaW5zdGVhZCBvZgo+IHN2bV92Y3B1X2luaXRpYWxpc2UoKS4KPgo+IEluIHN2bV9ndWVz
dF9vc3Z3X2luaXQoKSwgcmVhZGluZyBvc3Z3X2xlbmd0aCBhbmQgb3N2d19zdGF0dXMgbXVzdCBi
ZSBkb25lCj4gdW5kZXIgdGhlIG9zdndfbG9jayB0byBhdm9pZCBvYnNlcnZpbmcgbWlzbWF0Y2hl
ZCB2YWx1ZXMuICBUaGUgZ3Vlc3RzIHZpZXcgb2YKPiBvc3Z3X2xlbmd0aCBhbHNvIG5lZWRzIGNs
aXBwaW5nIGF0IDY0IGFzIHdlIG9ubHkgb2ZmZXIgb25lIHN0YXR1cyByZWdpc3RlciAoVG8KPiBk
YXRlLCA1IGlzIHRoZSBtYXhpbXVtIGluZGV4IGRlZmluZWQgQUZBSUNUKS4gIEF2b2lkIG9wZW5j
b2RpbmcgbWF4KCkuCgoKUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+CgpXZSBzaG91bGQgcHJvYmFibHkgZW1pdCBhIHdhcm5pbmcgd2hlbiBN
U1JfQU1EX09TVldfSURfTEVOR1RIIHJlcG9ydHMKbW9yZSB0aGFuIDY0IGJpdHMgaW4gc3ZtX2hv
c3Rfb3N2d19pbml0KCkuCgoKLWJvcmlzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
