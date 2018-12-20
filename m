From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v2 01/18] argo: Introduce the Kconfig option to
 govern inclusion of Argo
Date: Wed, 19 Dec 2018 22:38:58 -0800
Message-ID: <1545287955-27684-2-git-send-email-christopher.w.clark@gmail.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SZmS=O5=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gZrza-0005of-G2
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 06:39:34 +0000
Received: by mail-it1-x143.google.com with SMTP id a6so1294487itl.4
 for <xen-devel@lists.xenproject.org>; Wed, 19 Dec 2018 22:39:33 -0800 (PST)
In-Reply-To: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLmNsYXJrNkBiYWVz
eXN0ZW1zLmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CgpDaGFuZ2UgdGhlIGRlZmF1bHQgdG8g
ZGlzYWJsZWQuCk1ha2UgdGhlIHByb21wdCBkZXBlbmQgb24gRVhQRVJULgpGaXggdGFiLWJhc2Vk
IGluZGVudGF0aW9uLgoKIHhlbi9jb21tb24vS2NvbmZpZyB8IDIwICsrKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vS2NvbmZpZyBiL3hlbi9jb21tb24vS2NvbmZpZwppbmRleCA2ODEzMmEzLi5iNWExYjI5
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL0tjb25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmln
CkBAIC0yMDAsNiArMjAwLDI2IEBAIGNvbmZpZyBMQVRFX0hXRE9NCiAKIAkgIElmIHVuc3VyZSwg
c2F5IE4uCiAKK2NvbmZpZyBBUkdPCisJZGVmX2Jvb2wgbgorCXByb21wdCAiQXJnbzogaHlwZXJ2
aXNvci1tZWRpYXRlZCBpbnRlcmRvbWFpbiBjb21tdW5pY2F0aW9uIiBpZiBFWFBFUlQgPSAieSIK
KwktLS1oZWxwLS0tCisJICBFbmFibGVzIGEgaHlwZXJjYWxsIGZvciBkb21haW5zIHRvIGFzayB0
aGUgaHlwZXJ2aXNvciB0byBwZXJmb3JtCisJICBkYXRhIHRyYW5zZmVyIG9mIG1lc3NhZ2VzIGJl
dHdlZW4gZG9tYWlucy4KKworCSAgVGhpcyBhbGxvd3MgY29tbXVuaWNhdGlvbiBjaGFubmVscyB0
byBiZSBlc3RhYmxpc2hlZCB0aGF0IGRvIG5vdAorCSAgcmVxdWlyZSBhbnkgc2hhcmVkIG1lbW9y
eSBiZXR3ZWVuIGRvbWFpbnM7IHRoZSBoeXBlcnZpc29yIGlzIHRoZQorCSAgZW50aXR5IHRoYXQg
ZWFjaCBkb21haW4gaW50ZXJhY3RzIHdpdGguIFRoZSBoeXBlcnZpc29yIGlzIGFibGUgdG8KKwkg
IGVuZm9yY2UgTWFuZGF0b3J5IEFjY2VzcyBDb250cm9sIHBvbGljeSBvdmVyIHRoZSBjb21tdW5p
Y2F0aW9uLgorCisJICBJZiBYU01fRkxBU0sgaXMgZW5hYmxlZCwgWFNNIHBvbGljeSBjYW4gZ292
ZXJuIHdoaWNoIGRvbWFpbnMgbWF5CisJICBjb21tdW5pY2F0ZSB2aWEgdGhlIEFyZ28gc3lzdGVt
LgorCisJICBUaGlzIGZlYXR1cmUgZG9lcyBub3RoaW5nIGlmIHRoZSAiYXJnbyIgYm9vdCBwYXJh
bWV0ZXIgaXMgbm90IHByZXNlbnQuCisJICBBcmdvIGlzIGRpc2FibGVkIGF0IHJ1bnRpbWUgYnkg
ZGVmYXVsdC4KKworCSAgSWYgdW5zdXJlLCBzYXkgTi4KKwogbWVudSAiU2NoZWR1bGVycyIKIAl2
aXNpYmxlIGlmIEVYUEVSVCA9ICJ5IgogCi0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
