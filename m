From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 01/18] argo: Introduce the Kconfig option
 to govern inclusion of Argo
Date: Thu, 20 Dec 2018 02:00:21 -0700
Message-ID: <5C1B5A250200007800207EDA@prv1-mh.provo.novell.com>
References: <1545287955-27684-1-git-send-email-christopher.w.clark@gmail.com>
 <1545287955-27684-2-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XCGL=O5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gZuBu-0004TN-Ha
 for xen-devel@lists.xenproject.org; Thu, 20 Dec 2018 09:00:26 +0000
In-Reply-To: <1545287955-27684-2-git-send-email-christopher.w.clark@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, ross.philipson@gmail.com, Jason Andryuk <jandryuk@gmail.com>, Daniel Smith <dpsmith@apertussolutions.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, James McKenzie <james@bromium.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, eric chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEyLjE4IGF0IDA3OjM4LCA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21tb24vS2NvbmZpZwo+ICsrKyBiL3hlbi9jb21tb24vS2Nv
bmZpZwo+IEBAIC0yMDAsNiArMjAwLDI2IEBAIGNvbmZpZyBMQVRFX0hXRE9NCj4gIAo+ICAJICBJ
ZiB1bnN1cmUsIHNheSBOLgo+ICAKPiArY29uZmlnIEFSR08KPiArCWRlZl9ib29sIG4KPiArCXBy
b21wdCAiQXJnbzogaHlwZXJ2aXNvci1tZWRpYXRlZCBpbnRlcmRvbWFpbiBjb21tdW5pY2F0aW9u
IiBpZiBFWFBFUlQgPSAieSIKClRoZSBjb21tb24gKGFuZCBzbGlnaHRseSBzaG9ydGVyKSB3YXkg
dG8gZXhwcmVzcyB0aGlzIGlzCgpjb25maWcgQVJHTwoJYm9vbCAiQXJnbzogaHlwZXJ2aXNvci1t
ZWRpYXRlZCBpbnRlcmRvbWFpbiBjb21tdW5pY2F0aW9uIiBpZiBFWFBFUlQgPSAieSIKCkphbgoK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
