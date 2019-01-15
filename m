From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v4 01/14] argo: Introduce the Kconfig option to
 govern inclusion of Argo
Date: Tue, 15 Jan 2019 01:27:33 -0800
Message-ID: <1547544466-21135-2-git-send-email-christopher.w.clark@gmail.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjL0p-0003Pd-PK
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 09:27:59 +0000
Received: by mail-io1-xd43.google.com with SMTP id f4so1551394ion.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 01:27:58 -0800 (PST)
In-Reply-To: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RGVmaW5lcyBDT05GSUdfQVJHTyB3aGVuIGVuYWJsZWQuIERlZmF1bHQ6IGRpc2FibGVkLgoKV2hl
biB0aGUgS2NvbmZpZyBvcHRpb24gaXMgZW5hYmxlZCwgdGhlIEFyZ28gaHlwZXJjYWxsIGltcGxl
bWVudGF0aW9uCndpbGwgYmUgaW5jbHVkZWQsIGFsbG93aW5nIHVzZSBvZiB0aGUgaHlwZXJ2aXNv
ci1tZWRpYXRlZCBpbnRlcmRvbWFpbgpjb21tdW5pY2F0aW9uIG1lY2hhbmlzbS4KCkFyZ28gaXMg
aW1wbGVtZW50ZWQgZm9yIHg4NiBhbmQgQVJNIGhhcmR3YXJlIHBsYXRmb3Jtcy4KCkF2YWlsYWJp
bGl0eSBvZiB0aGUgb3B0aW9uIGRlcGVuZHMgb24gRVhQRVJUIGFuZCBBcmdvIGlzIGN1cnJlbnRs
eSBhbgpleHBlcmltZW50YWwgZmVhdHVyZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENs
YXJrIDxjaHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+CkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQooSmFuJ3MgYWNrIGFwcGxpZXMgZm9yIGNvbW1p
dHRpbmcgdG9nZXRoZXIgd2l0aCBhdCBsZWFzdCBvbmUgcGF0Y2gKIHVzaW5nIHRoZSBDT05GSUdf
QVJHTyBzeW1ib2wuKQoKdjMgYWRkZWQgSmFuJ3MgQWNrCnYyICMwMSBmZWVkYmFjaywgSmFuOiBy
ZXBsYWNlIGRlZl9ib29sL3Byb21wdCB3aXRoIGJvb2wKdjEgIzAyIGZlZWRiYWNrLCBKYW46IGRl
ZmF1bHQgS2NvbmZpZyBvZmYsIHVzZSBFWFBFUlQsIGZpeCB3aGl0ZXNwYWNlCgogeGVuL2NvbW1v
bi9LY29uZmlnIHwgMTkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL0tjb25maWcgYi94ZW4vY29tbW9u
L0tjb25maWcKaW5kZXggMzdmODUwNS4uNWUxMjUxZSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9L
Y29uZmlnCisrKyBiL3hlbi9jb21tb24vS2NvbmZpZwpAQCAtMjAwLDYgKzIwMCwyNSBAQCBjb25m
aWcgTEFURV9IV0RPTQogCiAJICBJZiB1bnN1cmUsIHNheSBOLgogCitjb25maWcgQVJHTworCWJv
b2wgIkFyZ286IGh5cGVydmlzb3ItbWVkaWF0ZWQgaW50ZXJkb21haW4gY29tbXVuaWNhdGlvbiIg
aWYgRVhQRVJUID0gInkiCisJLS0taGVscC0tLQorCSAgRW5hYmxlcyBhIGh5cGVyY2FsbCBmb3Ig
ZG9tYWlucyB0byBhc2sgdGhlIGh5cGVydmlzb3IgdG8gcGVyZm9ybQorCSAgZGF0YSB0cmFuc2Zl
ciBvZiBtZXNzYWdlcyBiZXR3ZWVuIGRvbWFpbnMuCisKKwkgIFRoaXMgYWxsb3dzIGNvbW11bmlj
YXRpb24gY2hhbm5lbHMgdG8gYmUgZXN0YWJsaXNoZWQgdGhhdCBkbyBub3QKKwkgIHJlcXVpcmUg
YW55IHNoYXJlZCBtZW1vcnkgYmV0d2VlbiBkb21haW5zOyB0aGUgaHlwZXJ2aXNvciBpcyB0aGUK
KwkgIGVudGl0eSB0aGF0IGVhY2ggZG9tYWluIGludGVyYWN0cyB3aXRoLiBUaGUgaHlwZXJ2aXNv
ciBpcyBhYmxlIHRvCisJICBlbmZvcmNlIE1hbmRhdG9yeSBBY2Nlc3MgQ29udHJvbCBwb2xpY3kg
b3ZlciB0aGUgY29tbXVuaWNhdGlvbi4KKworCSAgSWYgWFNNX0ZMQVNLIGlzIGVuYWJsZWQsIFhT
TSBwb2xpY3kgY2FuIGdvdmVybiB3aGljaCBkb21haW5zIG1heQorCSAgY29tbXVuaWNhdGUgdmlh
IHRoZSBBcmdvIHN5c3RlbS4KKworCSAgVGhpcyBmZWF0dXJlIGRvZXMgbm90aGluZyBpZiB0aGUg
ImFyZ28iIGJvb3QgcGFyYW1ldGVyIGlzIG5vdCBwcmVzZW50LgorCSAgQXJnbyBpcyBkaXNhYmxl
ZCBhdCBydW50aW1lIGJ5IGRlZmF1bHQuCisKKwkgIElmIHVuc3VyZSwgc2F5IE4uCisKIG1lbnUg
IlNjaGVkdWxlcnMiCiAJdmlzaWJsZSBpZiBFWFBFUlQgPSAieSIKIAotLSAKMi43LjQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
