From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH 02/25] argo: Introduce the Kconfig option to
 govern inclusion of Argo
Date: Tue, 4 Dec 2018 01:12:16 -0800
Message-ID: <CACMJ4GY0HnTbs-kWifWixat71XF-LX99GkogoOCLm6=4hJHJfw@mail.gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
 <1543627984-21394-3-git-send-email-christopher.w.clark@gmail.com>
 <5C0550E5020000780020251A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3zo+=on=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gU6kp-0008SK-4J
 for xen-devel@lists.xenproject.org; Tue, 04 Dec 2018 09:12:31 +0000
Received: by mail-lj1-x243.google.com with SMTP id n18-v6so14184283lji.7
 for <xen-devel@lists.xenproject.org>; Tue, 04 Dec 2018 01:12:30 -0800 (PST)
In-Reply-To: <5C0550E5020000780020251A@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <voreekf@madingley.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBEZWMgMywgMjAxOCBhdCA3OjUxIEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiA+Pj4gT24gMDEuMTIuMTggYXQgMDI6MzIsIDxjaHJpc3RvcGhlci53
LmNsYXJrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94ZW4vY29tbW9uL0tjb25maWcKPiA+
ICsrKyBiL3hlbi9jb21tb24vS2NvbmZpZwo+ID4gQEAgLTIwMCw2ICsyMDAsMjYgQEAgY29uZmln
IExBVEVfSFdET00KPiA+Cj4gPiAgICAgICAgIElmIHVuc3VyZSwgc2F5IE4uCj4gPgo+ID4gK2Nv
bmZpZyBBUkdPCj4gPiArICAgIGJvb2wgIkFyZ286IGh5cGVydmlzb3ItbWVkaWF0ZWQgaW50ZXJk
b21haW4gY29tbXVuaWNhdGlvbiIKPiA+ICsgICAgZGVmYXVsdCB5Cj4KPiBVbnRpbCBvdXIgcG9s
aWN5IGNoYW5nZXMgYXMgdG8gd2lkZXIgY29uZmlndXJhYmlsaXR5LCBvcHRpb25zIG5vdAo+IGRl
cGVuZGluZyBvbiBFWFBFUlQgc2hvdWxkIGJlIGFjY29tcGFuaWVkIGJ5IGEgcmVhc29uLiBJCj4g
YWxzbyBkb24ndCB0aGluayB0aGF0IHdlIHdhbnQgdGhpcyB0byBkZWZhdWx0IHRvIGVuYWJsZWQg
ZnJvbQo+IHRoZSB2ZXJ5IGJlZ2lubmluZy4gRmluYWxseSBwbGVhc2UgY29ycmVjdCBpbmRlbnRh
dGlvbi4KCmFjazogd2lsbCB0b2dnbGUsIGFkZCBkZXBlbmRlbmN5LCBkZXNjcmliZSBhbmQgcmUt
aW5kZW50LgoKdGhhbmtzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
