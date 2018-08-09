From: Jason Andryuk <jandryuk@gmail.com>
Subject: Re: [RFC PATCH v2 03/17] libxl: Handle Linux stubdomain
 specific QEMU options.
Date: Thu, 9 Aug 2018 12:23:14 -0400
Message-ID: <CAKf6xpuZ+4GM5+yXoLXPwczDhFR1k+14kAOZAkpsUr078r6LHg@mail.gmail.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <084e43a6ca74c8cb6ffb7301497f425b413cfc42.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3j7a=ky=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1fnnii-0000XU-Lc
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 16:23:28 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 203-v6so4920138ljj.13
 for <xen-devel@lists.xenproject.org>; Thu, 09 Aug 2018 09:23:26 -0700 (PDT)
In-Reply-To: <084e43a6ca74c8cb6ffb7301497f425b413cfc42.1533608042.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Simon Gaiser <simon@invisiblethingslab.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgNiwgMjAxOCBhdCAxMDoyMiBQTSBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kKPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRXJp
YyBTaGVsdG9uIDxlc2hlbHRvbkBwb2JveC5jb20+Cj4KPiBUaGlzIHBhdGNoIGNyZWF0ZXMgYW4g
YXBwcm9wcmlhdGUgY29tbWFuZCBsaW5lIGZvciB0aGUgUUVNVSBpbnN0YW5jZQo+IHJ1bm5pbmcg
aW4gYSBMaW51eC1iYXNlZCBzdHViZG9tYWluLgo+Cj4gTk9URTogYSBudW1iZXIgb2YgaXRlbXMg
YXJlIG5vdCBjdXJyZW50bHkgaW1wbGVtZW50ZWQgZm9yIExpbnV4LWJhc2VkCj4gc3R1YmRvbWFp
bnMsIHN1Y2ggYXM6Cj4gLSBzYXZlL3Jlc3RvcmUKPiAtIFFNUCBzb2NrZXQKPiAtIGdyYXBoaWNz
IG91dHB1dCAoZS5nLiwgVk5DKQo+Cj4gU2lnbmVkLW9mZi1ieTogRXJpYyBTaGVsdG9uIDxlc2hl
bHRvbkBwb2JveC5jb20+Cj4KPiBTaW1vbjoKPiAgKiBmaXggZGlzayBwYXRoCj4gICogZml4IGNk
cm9tIHBhdGggYW5kICJmb3JtYXQiCj4gICogcGFzcyBkb3duc2NyaXB0IGZvciBuZXR3b3JrIGlu
dGVyZmFjZXMKPgo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIEdhaXNlciA8c2ltb25AaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT4KPiBbZHJvcCBRdWJlcy1zcGVjaWZpYyBwYXJ0c10KPiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBmaXggc2VyaWFsIHNwZWNpZmll
ZCB3aXRoIHNlcmlhbD1bIC4uLiBdIHN5bnRheAo+ICAtIGVycm9yIG91dCBvbiBtdWx0aXBsZSBj
b25zb2xlcyAoaW5jb21wYXRpYmxlIHdpdGggc3R1YmRvbSkKPiAgLSBkcm9wIGVycm9uZW91cyBj
aHVuayBhYm91dCBjZHJvbQoKUmV2aWV3ZWQtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdt
YWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
