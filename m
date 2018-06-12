From: Anchal Agarwal <anchalag@amazon.com>
Subject: [RFC PATCH 10/12] xen/events: add xen_shutdown_pirqs
 helper function
Date: Tue, 12 Jun 2018 20:56:17 +0000
Message-ID: <20180612205619.28156-11-anchalag__8936.1741127961$1528836928$gmane$org@amazon.com>
References: <20180612205619.28156-1-anchalag@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=awxf=i6=amazon.com=prvs=694633fc8=anchalag@srs-us1.protection.inumbo.net>)
 id 1fSqLN-0008IA-C1
 for xen-devel@lists.xenproject.org; Tue, 12 Jun 2018 20:56:45 +0000
In-Reply-To: <20180612205619.28156-1-anchalag@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org
Cc: jgross@suse.com, len.brown@intel.com, eduval@amazon.com, vallish@amazon.com, netdev@vger.kernel.org, fllinden@amazon.com, kamatam@amazon.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, anchalag@amazon.com, cyberax@amazon.com, pavel@ucw.cz, linux-pm@vger.kernel.org, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, guruanb@amazon.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

RnJvbTogTXVuZWhpc2EgS2FtYXRhIDxrYW1hdGFtQGFtYXpvbi5jb20+CgpBZGQgYSBzaW1wbGUg
aGVscGVyIGZ1bmN0aW9uIHRvICJzaHV0ZG93biIgYWN0aXZlIFBJUlFzLCB3aGljaCBhY3R1YWxs
eQpjbG9zZXMgZXZlbnQgY2hhbm5lbHMgYnV0IGtlZXBzIHJlbGF0ZWQgSVJRIHN0cnVjdHVyZXMg
aW50YWN0LiBQTQpzdXNwZW5kL2hpYmVybmF0aW9uIGNvZGUgd2lsbCByZWx5IG9uIHRoaXMuCgpT
aWduZWQtb2ZmLWJ5OiBNdW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbT4KU2lnbmVk
LW9mZi1ieTogQW5jaGFsIEFnYXJ3YWwgPGFuY2hhbGFnQGFtYXpvbi5jb20+ClJldmlld2VkLWJ5
OiBNdW5laGlzYSBLYW1hdGEgPGthbWF0YW1AYW1hem9uLmNvbT4KUmV2aWV3ZWQtYnk6IEVkdWFy
ZG8gVmFsZW50aW4gPGVkdXZhbEBhbWF6b24uY29tPgotLS0KIGRyaXZlcnMveGVuL2V2ZW50cy9l
dmVudHNfYmFzZS5jIHwgMTIgKysrKysrKysrKysrCiBpbmNsdWRlL3hlbi9ldmVudHMuaCAgICAg
ICAgICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMveGVuL2V2ZW50cy9ldmVudHNfYmFzZS5jIGIvZHJpdmVycy94ZW4vZXZl
bnRzL2V2ZW50c19iYXNlLmMKaW5kZXggNzYyMzc4Zi4uODgxMzdjOCAxMDA2NDQKLS0tIGEvZHJp
dmVycy94ZW4vZXZlbnRzL2V2ZW50c19iYXNlLmMKKysrIGIvZHJpdmVycy94ZW4vZXZlbnRzL2V2
ZW50c19iYXNlLmMKQEAgLTE1ODEsNiArMTU4MSwxOCBAQCB2b2lkIHhlbl9pcnFfcmVzdW1lKHZv
aWQpCiAJcmVzdG9yZV9waXJxcygpOwogfQogCit2b2lkIHhlbl9zaHV0ZG93bl9waXJxcyh2b2lk
KQoreworCXN0cnVjdCBpcnFfaW5mbyAqaW5mbzsKKworCWxpc3RfZm9yX2VhY2hfZW50cnkoaW5m
bywgJnhlbl9pcnFfbGlzdF9oZWFkLCBsaXN0KSB7CisJCWlmIChpbmZvLT50eXBlICE9IElSUVRf
UElSUSB8fCAhVkFMSURfRVZUQ0hOKGluZm8tPmV2dGNobikpCisJCQljb250aW51ZTsKKworCQlz
aHV0ZG93bl9waXJxKGlycV9nZXRfaXJxX2RhdGEoaW5mby0+aXJxKSk7CisJfQorfQorCiBzdGF0
aWMgc3RydWN0IGlycV9jaGlwIHhlbl9keW5hbWljX2NoaXAgX19yZWFkX21vc3RseSA9IHsKIAku
bmFtZQkJCT0gInhlbi1keW4iLAogCmRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi9ldmVudHMuaCBi
L2luY2x1ZGUveGVuL2V2ZW50cy5oCmluZGV4IGMzZTZiYzYuLmU0ZDVjY2IgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUveGVuL2V2ZW50cy5oCisrKyBiL2luY2x1ZGUveGVuL2V2ZW50cy5oCkBAIC03MCw2
ICs3MCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBub3RpZnlfcmVtb3RlX3ZpYV9ldnRjaG4oaW50
IHBvcnQpCiB2b2lkIG5vdGlmeV9yZW1vdGVfdmlhX2lycShpbnQgaXJxKTsKIAogdm9pZCB4ZW5f
aXJxX3Jlc3VtZSh2b2lkKTsKK3ZvaWQgeGVuX3NodXRkb3duX3BpcnFzKHZvaWQpOwogCiAvKiBD
bGVhciBhbiBpcnEncyBwZW5kaW5nIHN0YXRlLCBpbiBwcmVwYXJhdGlvbiBmb3IgcG9sbGluZyBv
biBpdCAqLwogdm9pZCB4ZW5fY2xlYXJfaXJxX3BlbmRpbmcoaW50IGlycSk7Ci0tIAoyLjcuNAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
